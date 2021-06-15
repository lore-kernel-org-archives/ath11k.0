Return-Path: <SRS0=wUnC=LJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EC6C48BDF
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 16:17:47 +0000 (UTC)
X-Greylist: delayed 645 seconds by postgrey-1.34 at mail.kernel.org; Tue, 15 Jun 2021 16:17:47 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123836162E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123836162E
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1LGbWsWcADSu+1eH0FzXpgLLxBlJ5beVL5VMz99jL0=; b=FIPDm6KUYThVCc
	RNHYrKwoo2FFbjd3SoXp0SQprj7D8IJaXRBbtlZhSr1gaAY+KWoPbufxZIBZpINdPfOceRMYiU4Kl
	sMqLQWr3J/ciFhihQQ7in0NITLVPLF3bG8nNN5Plq8nXx71Uv0QdY6Z8SKzd4DPPJSLtspP48VeHT
	XjUrm5rO5whx6czD/MSDm+RN187YYR+HNme2Rqy45r83cT0BbiCg5qhkZH3DybRIyAvmUd9oTZ4qQ
	4b2tRpbzZRMWvLASw7f8zVGYGhqv+SX2gCLDEXzQsmqNd4Hq4ZrKOE1xYrbhEGVPCmpAohq/N6ZC1
	n9tHmPvJtcpATV85Xt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltBku-001I55-I8; Tue, 15 Jun 2021 16:17:36 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9h9-000R2G-WC
 for ath11k@lists.infradead.org; Tue, 15 Jun 2021 14:05:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623765936; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=9AgMzAz+BYPyVtXVbJ/ZdRQwrE9673LawqRFb/0yWOY=;
 b=X0+1ZSlncMktoOdymp7HvFyxJCr+28IWGUgzht1U6uyVwwyTOdkHZVsgXfsHvhDdwm43DkOi
 q99r3oY+BStdR1T4dE4YUXhPw1NsTk4xvadVAkWTdLxWQM/OhfQtlY/uftPnKTtI081F1QzY
 BTuZ3wu07EtndyYuVy0QI3s9wlI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60c8b3afed59bf69cc1dfde6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 14:05:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4E674C43144; Tue, 15 Jun 2021 14:05:35 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 61454C43460;
 Tue, 15 Jun 2021 14:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61454C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: send beacon template after vdev_start/restart
 during csa
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210525133028.2805615-1-sven@narfation.org>
References: <20210525133028.2805615-1-sven@narfation.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Sven Eckelmann <sven@narfation.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210615140535.4E674C43144@smtp.codeaurora.org>
Date: Tue, 15 Jun 2021 14:05:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_070536_399614_A809EE40 
X-CRM114-Status: UNSURE (   9.88  )
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

Sven Eckelmann <sven@narfation.org> wrote:

> Firmware has added assert if beacon template is received after
> vdev_down. Firmware expects beacon template after vdev_start
> and before vdev_up. This change is needed to support MBSSID EMA
> cases in firmware.
> 
> Hence, Change the sequence in ath11k as expected from firmware.
> This new change is not causing any issues with older
> firmware.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1.r3-00011-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1.r4-00008-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
> [sven@narfation.org: added tested-on/fixes information]
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

979ebc54cf13 ath11k: send beacon template after vdev_start/restart during csa

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210525133028.2805615-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
