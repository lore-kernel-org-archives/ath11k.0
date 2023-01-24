Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D661C61D97
	for <ath11k@archiver.kernel.org>; Tue, 24 Jan 2023 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G91oWvmob3opKmlF5ucCrYLC1UtWTYr8BlMs9/5kWXU=; b=wPPHBJ6Z7ygKR3
	cgHn1C8udE4r6GOewiRdTRxtA0GMJnfFZiBl7YDHG5sLlIW1mC7hVrHNxdlWrtGKPPn+kWuYeC2S/
	1ck6MI58GWfpFP0hKTL2VQ/lIgSAEkYZ6gUcCSRJjjIJrMTAvp0f4ftDDTkw1djyPSay6q5hMzSC6
	bGVFdke8WAjLxwe4PPTJCwKEP0WTk7A4D7AwYxRhYjmVvRpg2KFNxSSIyYsG0/+Zw35rGjmFPYTTl
	0jfx5dzUrpBCI8HzW0EH5jCsDzOy2G8SFshzPP0BaHpFDEH8w+AciE6ZHkofXWyQp7u4vcfnkedoE
	DJ1lLiYOuADaY/3EGxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKOXz-00504l-Oy; Tue, 24 Jan 2023 19:01:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKOXw-00503B-Ji
	for ath11k@lists.infradead.org; Tue, 24 Jan 2023 19:01:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id p24so15638763plw.11
        for <ath11k@lists.infradead.org>; Tue, 24 Jan 2023 11:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50cO/6ZppDTgK/hTEwdsnZtIUmof/i6Am5RFe+y6fDg=;
        b=jfE7I7WvzTda77if8o0AnlZyXeVHxwVIDww/9+S2ljpISGdXCqTC5lnP6jAn25+P3s
         JiEJswbNMHjeomPV9fvhWaP1X+eg4zcs17gt/efjfnNzHMspdGlPF5yq+/Cfg1HOvLg2
         Kp5IWDoo6CYqTnsILJ5HtBvSIVzD/oqlSVKFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50cO/6ZppDTgK/hTEwdsnZtIUmof/i6Am5RFe+y6fDg=;
        b=GvKkxyBefzOZlC9DLR1oOxN6lLHNqqeAAasGJwEQDuvTXPR+KzNfJxT1AMLbE12arj
         ENSiGY0Nh4Bzj2UADbRKBza3dJ0R4XLlJTMfVR/2iygdH8FL/Run9tiqpFvna+Gh2tk8
         jySdI2Y/o4tSa1PsWJvGWDV38JycSaFP+wNMgaD28lqpxbiLoCdeRrjaV+rkyY9DIGKt
         qXrPLa5ev2K6GtKB8CtCmm2nLSYeOdlrxntp7hA8KYZqw/DYMrjdUOGYvARxcIvnPMsE
         NiOSipm4wbJmx3mAyr7BTwH5qrM0tOewsAJKkqOqzNdp4LR1PNR3/i/4LTXmIWXjc+nV
         PHWA==
X-Gm-Message-State: AO0yUKXrFZu3UbQ+M11dX20QROAFW1maGuH7c4xT3AClIlxUrWvU5s0l
	TG6JmFlI24yBs/WHT6knr4cK0Mg2k1+UGj9x
X-Google-Smtp-Source: AK7set8UGHGugxZPfIDZziY43UqyiSusorvSQsjCeo4te4wOprdvp/KbTUT4tFW/IJ4PPfPd66crVg==
X-Received: by 2002:a17:903:18f:b0:196:cea:487a with SMTP id z15-20020a170903018f00b001960cea487amr6070801plg.53.1674586886656;
        Tue, 24 Jan 2023 11:01:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:7b28:de8d:ee0:2cd6])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001948720f6bdsm2010415plt.98.2023.01.24.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 11:01:26 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Youghandhar Chintala <quic_youghand@quicinc.com>,
	junyuu@chromium.org,
	Kalle Valo <kvalo@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath5k: Use platform_get_irq() to get the interrupt
Date: Tue, 24 Jan 2023 11:01:01 -0800
Message-Id: <20230124110057.2.Ic4f8542b0588d7eb4bc6e322d4af3d2064e84ff0@changeid>
X-Mailer: git-send-email 2.39.1.405.gd4c25cc71f-goog
In-Reply-To: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
References: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_110128_665176_FB3206D1 
X-CRM114-Status: GOOD (  16.23  )
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

For the same reasons talked about in commit 9503a1fc123d ("ath9k: Use
platform_get_irq() to get the interrupt"), we should be using
platform_get_irq() in ath5k. Let's make the switch.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I'm not setup to actually test this, but I figured that I might as
well go all the way and fix all the instances of the same pattern that
I found in the ath drivers since the old call was actually breaking me
in ath11k. I did at least confirm that the code compiles for me.

If folks would rather not land an untested patch like this, though,
feel free to drop this and just land patch #1 as long as that one
looks OK.

 drivers/net/wireless/ath/ath5k/ahb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wireless/ath/ath5k/ahb.c
index 2c9cec8b53d9..28a1e5eff204 100644
--- a/drivers/net/wireless/ath/ath5k/ahb.c
+++ b/drivers/net/wireless/ath/ath5k/ahb.c
@@ -113,15 +113,13 @@ static int ath_ahb_probe(struct platform_device *pdev)
 		goto err_out;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "no IRQ resource found\n");
-		ret = -ENXIO;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "no IRQ resource found: %d\n", irq);
+		ret = irq;
 		goto err_iounmap;
 	}
 
-	irq = res->start;
-
 	hw = ieee80211_alloc_hw(sizeof(struct ath5k_hw), &ath5k_hw_ops);
 	if (hw == NULL) {
 		dev_err(&pdev->dev, "no memory for ieee80211_hw\n");
-- 
2.39.1.405.gd4c25cc71f-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
