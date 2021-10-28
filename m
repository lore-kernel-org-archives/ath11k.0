Return-Path: <SRS0=748x=PQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E64C433F5
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 12:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 438DA60F9C
	for <ath11k@archiver.kernel.org>; Thu, 28 Oct 2021 12:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 438DA60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6IC5PFyxpIiKEcK/8/hqQJy8qklvsWz3BPHwsOgAe0=; b=qtUH35DZCz9QkZ
	ugh0WrThfI7rLNEpV8GI351wSxy/yE4OTu4/B1q5EfJIQzQA0BzIo4iODaI5vJU08Dcs8ezGCwgqy
	/T7YSE7xB5zyPUUIbdau05CZXPbfmf0+f5mHOxJgF74yHZK8db9fbVNx3CdWREjofNr6ySAzqxSQx
	3VA16CPpb0KXjK9tEJsg7TTUpdijoEb5X/o2YPiwBYJXVJyehgVKeO6m9W/Yrdjg+P9qlkBISSG9Z
	twyozuqPaV8WV6fcSd1cDSSkPVaoEPLHSHWcseomeislFAYJpcvmFr4GOUsbQWHcXcUSLJwZ/BvXY
	yuC0QUuAXW0pfSeBoIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4LX-007m9C-AY; Thu, 28 Oct 2021 12:17:27 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4LF-007m8H-1u
 for ath11k@lists.infradead.org; Thu, 28 Oct 2021 12:17:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635423443; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=wU9RNitlNZLGFR1Voyrwgjs5+Li02k45DiGW4IhE+0s=;
 b=JhPnGZIkBvK8dc3OR3bA3rHTqJoq7hmcxbp4hlj3k3E7GPrXQDboaGRC3HJUmjKLcW+nFOpQ
 J6eqQ0TAfbfm231UPmWGrv4Ld8swu62r0Bva/4G0EkFd/945zp/Xp3kBDlSAf79eSvUvhkmb
 0u16MoErelbnaiccCnuXKkJBbsE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 617a94a2c8c1b282a575e7a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 12:16:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B4E50C43460; Thu, 28 Oct 2021 12:16:33 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 72052C4338F;
 Thu, 28 Oct 2021 12:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 72052C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: enable power save in station mode
References: <20211011190625.4463-1-cjhuang@codeaurora.org>
 <163471767994.28889.7719435262601379113.kvalo@codeaurora.org>
Date: Thu, 28 Oct 2021 15:16:28 +0300
In-Reply-To: <163471767994.28889.7719435262601379113.kvalo@codeaurora.org>
 (Kalle Valo's message of "Wed, 20 Oct 2021 08:14:45 +0000 (UTC)")
Message-ID: <871r455opv.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_051724_123811_8D7CA040 
X-CRM114-Status: GOOD (  10.41  )
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

Kalle Valo <kvalo@codeaurora.org> writes:

> Carl Huang <cjhuang@codeaurora.org> wrote:
>
>> Enable power save in station mode.
>> 
>> Run "iw dev wls1 set power_save off",  check there is no NULL Data frame
>> from sniffer. Run "iw dev wls1 set power_save on", check there is NULL
>> Data frame from sniffer.
>> 
>> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>> 
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
>
> Fails to apply, please rebase on top of ath.git master branch.
>
> error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:883
> error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
> stg import: Diff does not apply cleanly
>
> Patch set to Changes Requested.

I'll rebase the patch and submit v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
