Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C61EC41535
	for <ath11k@archiver.kernel.org>; Tue, 19 Dec 2023 06:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqTrAMdpjtEMCOE/K8f19LFIuKIANbLdY7oUbKYyYnM=; b=2bUyplp6XnZsoWl4qI73jZRbzr
	Xg/mJQsgtGsVWljTLeCXfIwMPIOMwaDaix1uGtdhTNhC1qRpyExmQmhVdrUPUZlS9EKz8sk4sF8A8
	uTcqSSNHe++KrF8Ey6MwQsNG71uT7vnilzNcarxSvv/UV0P/i9KP9ODvK+y3AffUoqNKL+rTGxp8i
	YaZW5SXAmVPGyr1++V7GG9Xf+8p1hcBhfOcvN8Ey60SAwRPcI25f1YEDfgvZUv/PUdd3LsN1YFhwN
	CrsjyrGsQmt6nLq9RFagjs3dznd9zOyIeHgBG32kFCkk1DLX3z45tDO2wIzINYR2y4pUySoYOk9cK
	d7NeArZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFTcM-00CzV7-2I;
	Tue, 19 Dec 2023 06:30:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFTcJ-00CzUS-16
	for ath11k@lists.infradead.org;
	Tue, 19 Dec 2023 06:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99CB4CE16FC;
	Tue, 19 Dec 2023 06:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7D7C433C8;
	Tue, 19 Dec 2023 06:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702967407;
	bh=VoPIYApzISlddcqMdu3mYtij5qC3ORIpAABFXi5uBP4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=L9/jZ52aSWAh0nzGAnPjFXxmgQzBne+UOlJt8dqAkSGHp8uMyGcsugLkarA+HaGcl
	 8M07hJdC+Wm00d2ZtZfjfgv5B7Xqn9Oxm6zH5TFYSMumRahw3AJmdwlVCv+RBVcIZT
	 1z0HI8zL9u3zm1m52yJ+UqD08T2xqoRBuvHq+uETW16CE5Wt67ZCCXwOOWac/OS35/
	 axv7+tqb/xwfrO1WN5DYgZB63G5Oi7h4PlOewLYgbmpgWqvybmX11/2XshESdrY5iJ
	 /okXmgIOZ+b63SafG/D9Na7IKxF9tGVIkZ3vYdR3hzTgpKD49M/JuMB1q/0PJqQ/if
	 F6EZmP5emSczw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v10 09/12] wifi: ath11k: fill parameters for vdev set
 tpc power WMI command
References: <20231218085844.2658-1-quic_bqiang@quicinc.com>
	<20231218085844.2658-10-quic_bqiang@quicinc.com>
	<8b754d39-e079-4ea0-bcc1-94e0cf14d5ae@quicinc.com>
Date: Tue, 19 Dec 2023 08:30:04 +0200
In-Reply-To: <8b754d39-e079-4ea0-bcc1-94e0cf14d5ae@quicinc.com> (Jeff
	Johnson's message of "Mon, 18 Dec 2023 13:13:17 -0800")
Message-ID: <87bkamso0j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_223011_638985_7A2FB6CD 
X-CRM114-Status: UNSURE (   7.04  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 12/18/2023 12:58 AM, Baochen Qiang wrote:
>> From: Wen Gong <quic_wgong@quicinc.com>
>> 
>> Prepare the parameters which are needed for WMI command WMI_VDEV_SET_TPC_POWER_CMDID.
>> 
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>> 
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
> ...
>>  drivers/net/wireless/ath/ath11k/mac.c | 284 ++++++++++++++++++++++++++
>>  drivers/net/wireless/ath/ath11k/mac.h |   3 +
>
> drivers/net/wireless/ath/ath11k/mac.h: QuIC copyright missing 2023

I can fix that in the pending branch, no need resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

