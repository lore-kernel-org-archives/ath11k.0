Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647B3C433EF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:03:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18EBA60C4A
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18EBA60C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZBU7JeE7qUjKEM8jIIvCFKZmnmAwtOi08skCKZ7V5o=; b=T5GW4le9W4hXw6
	E9XWuQUq73OR8c7twDfx/3f1SKjJeaHIBcoFrBrue5I9q5mstefAprtIgPA7XrhViICyCT5TArAe2
	VX7KxL8WzYOODrte171o0hX6j6wVvBbrh459+/CH80sKyocptN7G24KIqnCNHBmpvxeK/BZ643V6Q
	sKMGNHeYaGK9awBGxdAfnX/zB2ig9LTJd3Z+8lqkBDiUPWE78z8j2AO9oAfaHFi0C/u8XL3j7Pz3v
	Tpq1OAyxfOzZZ5ddnnhn1n6B70L6LqLIxIjhEmQxyrx2y3Zmj4mhznK+BWP/znQFxpjTtEPooJsAl
	Nk9wQd983C/krRWYfwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlRX8-009eJC-B7; Fri, 12 Nov 2021 08:03:38 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlRX2-009eCq-AV
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 08:03:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636704214; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ZNYfuiVpBKLRjlCtUhKdf7Kp+cEJqc97y/1LfVLIeW8=;
 b=TY+8TmJ+gPZ+gATYrA7+VF+F2uxkRONXSaUSe8KbOCLRpBvL02F3lsCMMBDXXp4+YfBM5UXq
 MiCOw0GqhASbTl+Qu6y3yVGS7q7p68QuXAuzXTSE3AmUgXjmpWXxQEkFyUGVKHohiaWHHAPC
 WOICQw85x8pvDtXFnyhf/NFbVtE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 618e1f59a445961e728d1a7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Nov 2021 08:01:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8ABD5C43460; Fri, 12 Nov 2021 08:01:28 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D3B1C4338F;
 Fri, 12 Nov 2021 08:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9D3B1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 10/12] ath11k: Send PPDU_STATS_CFG with proper pdev mask to
 firmware
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210721212029.142388-10-jouni@codeaurora.org>
References: <20210721212029.142388-10-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Rameshkumar Sundaram <ramess@codeaurora.org>,
 Sathishkumar Muruganandam <murugana@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163670408232.15262.3231560511117264919.kvalo@codeaurora.org>
Date: Fri, 12 Nov 2021 08:01:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_000335_037699_5C8F192E 
X-CRM114-Status: GOOD (  10.38  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> HTT_PPDU_STATS_CFG_PDEV_ID bit mask for target FW PPDU stats request message
> was set as bit 8 to 15. Bit 8 is reserved for soc stats and pdev id starts from
> bit 9. Hence change the bitmask as bit 9 to 15 and fill the proper pdev id in
> the request message.
> 
> In commit 701e48a43e15 ("ath11k: add packet log support for QCA6390"), both
> HTT_PPDU_STATS_CFG_PDEV_ID and pdev_mask were changed, but this pdev_mask
> calculation is not valid for platforms which has multiple pdevs with 1 rxdma
> per pdev, as this is writing same value(i.e. 2) for all pdevs.  Hence fixed it
> to consider pdev_idx as well, to make it compatible for both single and multi
> pd cases.
> 
> Tested on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01092-QCAHKSWPL_SILICONZ-1
> Tested on: IPQ6018 hw1.0 WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
> 
> Co-developed-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Rameshkumar Sundaram <ramess@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

16a2c3d5406f ath11k: Send PPDU_STATS_CFG with proper pdev mask to firmware

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210721212029.142388-10-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
