Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AD1CE7A81
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dq3PZtDmGmRD5p7yYvqwdiBhrAIIUlwAdRmwKb50dqw=; b=IOx40XRoldBs4n
	8TzoHZrpOLIFquhijVrJqdXNuI+9Id2flKU5VEmdd9IfoZjbdn/r8NBFHrRfFF1r01QBXARiNfOt8
	XvZhtQx7QwhbKV/CNo3OZ2A0AJKxFRINxrQTKffP8s9ShfSSL4rp8ptjPzABuFpc4jKJnU1lZBToB
	wN8LEvXyvqUNyMWDam4b4f8ImjROKvahJgAxTKHjnQNkFvWh2jUhuDv2E5zgJyD/hhw0SnKpVmJz3
	dsEn3LQdCSRefj34lxAlTH1l4JljIWLjUHHOcy8LDobpSUyM+UXQAYgn4btJNy7IcEpCfvUVqcCfk
	ABnvzbquYQaB5e6eti3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiwC-00Dz5a-0W;
	Mon, 25 Sep 2023 10:35:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiw8-00Dz59-1y
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 10:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D1696101A;
	Mon, 25 Sep 2023 10:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FB1C433C7;
	Mon, 25 Sep 2023 10:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695638131;
	bh=JZ5uv7t3glsM4ahkV+/PvSpGadJDXXdYDes3y5CsZvw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Z7XVDPn+pa81kYHkfG6+EBiBPK7Gu0vXzK8g4NL73MvnyROpKTEvV57tn9Gk9MM53
	 1w56wgFpsMSshWTkJJ7cPIvY5eDaMJxyqfoCm3l/zMUgtMn9HnBOMLTKxUEa+HObVz
	 rXdxTREakbPDDxF2x3QPRQjUTKoTv170y1mOEwwwQ1goonEFmmwqFdELfc5SOoARKW
	 mCN3UkVCGxsnF32lRKSItr5E2Z4YQHVoKoWJKy+iIhifOvI0/xFK0qMxC9q+LUfQmK
	 lkpMWiDfd6lkvSOXsjgQbtxv2JecMbFQd4NjloXzUn+nt9WD+D9Nbsc7c+sWn9LUB8
	 PW7GvoznMta6Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  Baochen Qiang
 <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v6 03/13] wifi: ath11k: fix a possible dead lock caused
 by ab->base_lock
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
	<20230920082349.29111-4-quic_wgong@quicinc.com>
	<f9f0b511-74ce-4c3b-afdf-6352faae2ddb@quicinc.com>
Date: Mon, 25 Sep 2023 13:35:27 +0300
In-Reply-To: <f9f0b511-74ce-4c3b-afdf-6352faae2ddb@quicinc.com> (Jeff
	Johnson's message of "Thu, 21 Sep 2023 12:54:02 -0700")
Message-ID: <871qema6c0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_033532_691885_9BB3A24B 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 9/20/2023 1:23 AM, Wen Gong wrote:
>> From: Baochen Qiang <quic_bqiang@quicinc.com>
>> spin_lock/spin_unlock are used in ath11k_reg_chan_list_event to
>> acquire/release ab->base_lock, for now this is safe because that
>
> Kalle, can you s/, for/. For/ when you pull into pending?

Yes, will do. BTW to save time for simple edits like this I don't always
reply to you, I just do the edit the silently. In case you wonder if why
I don't reply.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
