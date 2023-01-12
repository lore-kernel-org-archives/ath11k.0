Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCF5C54EBC
	for <ath11k@archiver.kernel.org>; Thu, 12 Jan 2023 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xl3lM5gXmd4Lhix9gWfXxdIK6szx2/k8qCKpUrdSySA=; b=wiwR/KhMYaWr55
	CmPxx8yVvfP9cO8dXNHTb+mE8jRJmi+De5buDfVMLUeIvYNBxfqsXahWxBl9+s/m6TStNUfp+gmMr
	5JNX7GstlDv4SLwSCyapYMV01trwEy2Xev5qETwZCwpqjkwoODpvN0aeoS6y9923DvcrINL3H5h9M
	hu2LK/u6toXDcG2CmDQplPRcvST08x4Ynx2HDx7i6bgphyt/8H3maEGLCPHGQHM45ZrekqWfMN4dy
	u1wFMlhg28ImxNCXkebwyKJ9AWVNcHyrK7K+grLkmHIkn7Qy5HndRxZH2SDrMQwyzMn+pXaDzqbrD
	wU4NkCQ1tSEabt6hhgsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFteD-00EJWd-0l; Thu, 12 Jan 2023 09:13:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFte7-00EJTU-Rx
	for ath11k@lists.infradead.org; Thu, 12 Jan 2023 09:13:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 487B6B81DD7;
	Thu, 12 Jan 2023 09:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F4CC433F2;
	Thu, 12 Jan 2023 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673514793;
	bh=kEGTvDm5segAcaadzq0wJ5MfNW2R7JZZKdchDCKJD0E=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=e6PtrDaTa+SrVnqR0EL9ZA1/+axqXM3X5ItynF6qLmzEgYLuMdC8iQZq9B6bun8AU
	 aUGczTnlCC/jSO8DenY7D2DZKCoBFjA9IpO5d2jMeUarSi9mNDPOgaTcfxODkdP9dH
	 4T0FkjXaO8jJrFUVp6I/SttzFIxR2qdhRqJ4FsZEzuOr0K6ghtBAs1WnrR5YRPKm02
	 JE5A/6cVFCv7+2UqZ79O/EbVgpGq7XoZCU7gYoj3VdojGYXAkslFxryJ6PAoQjdfTz
	 8FJ5NMfi4yFPcsnkJ1OmGYcxpwU4/FeR93AcEJ8Nq3Wty9URzwBicsXNyrZiGMcqa5
	 j6KPiO3f+5zdg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  manivannan.sadhasivam@linaro.org,  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: [PATCH] bus: mhi: host: Change the log levels for SYS_ERR event
References: <20230104021445.47484-1-quic_bqiang@quicinc.com>
	<CAOCk7NpGBD-2nHFBE3a4WxNb4XPhEV3uoCDz1J9ArbaOE7Vscg@mail.gmail.com>
Date: Thu, 12 Jan 2023 11:13:09 +0200
In-Reply-To: <CAOCk7NpGBD-2nHFBE3a4WxNb4XPhEV3uoCDz1J9ArbaOE7Vscg@mail.gmail.com>
	(Jeffrey Hugo's message of "Tue, 3 Jan 2023 19:41:44 -0700")
Message-ID: <87fscgdska.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_011317_576966_A8B7750F 
X-CRM114-Status: GOOD (  18.82  )
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

Jeffrey Hugo <jeffrey.l.hugo@gmail.com> writes:

> Why was this not sent to the MHI mailing list?
>
> On Tue, Jan 3, 2023 at 7:19 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>>
>> Currently no log printed when SYS_ERR happens, this makes
>> debug quite hard, so change log level to make it noisy.
>
> You are going to need to explain this more.
> There are two drivers in the upstream kernel that are MHI clients -
> pci_generic and ath11k.
> I'm assuming that you care about ath11k because you included that mail list.
> In ath11k_mhi_op_status_cb() I see a warning message printed when the
> syserr callback is triggered.
> I see something similar in pci_generic.
>
> Looks like a log is printed when SYS_ERR happens in all possible
> scenarios, so I don't understand the point of this change.
> Particularly given that dev_dbg messages can be trivially enabled.

Also the error messages are not very informative, especially if there
are three identical messages it's hard to track down which code path is
triggering them. If these are changed to error messages, I would prefer
to improve them as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
