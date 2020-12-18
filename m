Return-Path: <SRS0=2hxC=FW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CE6C4361B
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 09:03:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9BF123A7D
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 09:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9BF123A7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bJJ/118mkNwCiIlqAY1yrUTxVOuaZyFBhO8MW1BmfGo=; b=vYRifFoGTRdhL+X9Blox68nz+
	gQItkOeS9jJMNMrIvLHLez5nZUsb3V4ku0rE+scyOX/sGSDMeC7qRttYal7qLewA88aowDttnGMGJ
	cLqH5lBxNmkw/uq76MfUhT1r8YuMMKIjinJEEQDpGBARW0CLHi43+x86wxwHExrRBJgBRycRwX2HG
	9IVjwlZXKYtI+Wb73+PJtSJRRoZp28HzKjCokC2TvazxPdNKLfIuTbSoblBJVWPeTvND1LkJieIji
	mKlouAuJQ9xoX5KuUFU9JG+tzeikoijbcFFdWrTWasSI79Y7xAZGyuC1Oy2TBivd8plCwYhlsJCZO
	/cucrcixw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqBfe-0008Gp-2J; Fri, 18 Dec 2020 09:03:30 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqBfb-0008GV-AG
 for ath11k@lists.infradead.org; Fri, 18 Dec 2020 09:03:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608282205; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=YxtFEXkVPMuoSlDJ/BMeC0KZaQJy1ZEwESdW3F3dhZw=;
 b=FATfGQ4xAX7u7m6SbN9MHLFGuKMrdD8bOhLgjNcQHD4OLEyO4Izv2jnOV7TMM+SdDQV93V5l
 p1PVkg0LnbBYsoz2f+x6gKw4Erte7yUaMa3cRf1yYrxiMy1m7IfUc9+fFo6DOeyY/QW0RiB9
 c1EmmVp4uy48W9K2TMrbdOr8FnY=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fdc705c7549779c5bd33e6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 09:03:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BC68EC433ED; Fri, 18 Dec 2020 09:03:23 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7109AC433CA;
 Fri, 18 Dec 2020 09:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7109AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: qmi: try to allocate a big block of DMA memory
 first
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1608127593-15192-1-git-send-email-kvalo@codeaurora.org>
References: <1608127593-15192-1-git-send-email-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201218090323.BC68EC433ED@smtp.codeaurora.org>
Date: Fri, 18 Dec 2020 09:03:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_040327_406157_F35FB920 
X-CRM114-Status: GOOD (  10.41  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Not all firmware versions support allocating DMA memory in smaller blocks so
> first try to allocate big block of DMA memory for QMI. If the allocation fails,
> let firmware request multiple blocks of DMA memory with smaller size.
> 
> This also fixes an unnecessary error message seen during ath11k probe on
> QCA6390:
> 
> ath11k_pci 0000:06:00.0: Respond mem req failed, result: 1, err: 0
> ath11k_pci 0000:06:00.0: qmi failed to respond fw mem req:-22
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-current branch of ath.git, thanks.

f6f92968e1e5 ath11k: qmi: try to allocate a big block of DMA memory first

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1608127593-15192-1-git-send-email-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
