Return-Path: <SRS0=Y6aC=HN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4650AC433E0
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 18:27:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8D964E62
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 18:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD8D964E62
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GFfzg82CC1NjvQV2QMyQ59KPh8s0rP9boM4FXnfp9fE=; b=PT1yMrZs4CCBwDckY7frTj3a+
	BwfdN5/sflRUZRLQ9iP2sVGi9LJe1GkAuRScLZx7T6eWTbLvCam12NP1CO/JD3ECyawAFR0erkazs
	KCJermdTMPyvq5ntnyrwZV3i7EVVQm2TImXIFZHN2Y6UzwYXKSE5hfoUkuyDMyh/scqdGRhpC+9hE
	gJxkb1N+VZBn+MGewUw0zndgARiHQBX1Efog8SeURUj9Ot0oithjzNvBhX6OfnbynPrnKdoth2zJ2
	/OdPT4e3XhKfeIf9KR6zj10phHxT8NXm65I25kpMs2M+QgmOdqrFT7dB9kYh0bFt7U16IHasFKsR3
	IbBC3iVUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAGgV-0002RP-VE; Thu, 11 Feb 2021 18:27:24 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAGgS-0002Q4-R0
 for ath11k@lists.infradead.org; Thu, 11 Feb 2021 18:27:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613068040; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=A2SIv5305ahFNxVMGcI2vGfjDue0S+kh8J4Xxt2X6o0=;
 b=AoU8PkEFVD5DnZOHH/72ATDyAHYsn4JegOSJc6KoFTqAW6O5lHj5lvypTPk04PHS2Pljxfv4
 hT9A6NQZJh9Pryn5Ho/6ER6Y4ArYiQdLKbsHMNG92FyN569HUvjeXNYzQwL+ea8eQulHveSq
 nSxV3w/kFAzR9h83jk2zOCjueyY=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60257707f112b7872c749a00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 18:27:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E37F3C43462; Thu, 11 Feb 2021 18:27:18 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 89801C433CA;
 Thu, 11 Feb 2021 18:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89801C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: pci: remove experimental warning
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1613040697-20289-1-git-send-email-kvalo@codeaurora.org>
References: <1613040697-20289-1-git-send-email-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210211182718.E37F3C43462@smtp.codeaurora.org>
Date: Thu, 11 Feb 2021 18:27:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_132720_936923_FE8D9450 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

> I have received feedback that QCA6390 PCI support is working for many, and I'm
> also using QCA6390 on my daily driver^Hlaptop. While there are issues still
> to be resolved it's not really experimental anymore, so remove the experimental
> warning from driver initialisation.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5d18b8a04ba2 ath11k: pci: remove experimental warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1613040697-20289-1-git-send-email-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
