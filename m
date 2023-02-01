Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0938C38142
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vr43H02UP+M/14KqeiHblv4LauEzu3yTr6QFCOSxxs=; b=uTNeJeZwe7i8+o
	MS9bXZMdsiyLB6AV3L33NkhSQ8Q+mvKSEVzv38968GnwhbZ56oWE+i1aWYBTvaozJFJXiuKHUcuGw
	7cHncBDaQGrCCgIj9dNMKzAnDLbaIUKQ3Ua1IPmYllOJahSNH8I1XLPFdPvbX+tqw7789XCMfgqNA
	rGaiIRSFoUisQVH6MwJz6E9q4aB2z+TebhJt5RD+wfAaSC542VAM4tRbWrLhIHbXASKia3NMLueXM
	tl1CowqfOOyeCCogk8RPhFotRGGby4IGiOoX1fpDcJ3nujYRCe9/c+errnv09nqmGwyRNFGU42pWh
	0bS06btqy7EoeVPYfiFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGO1-00CuEz-6c; Wed, 01 Feb 2023 16:55:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGNy-00CuBb-LK
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 16:55:04 +0000
Received: by mail-pl1-x632.google.com with SMTP id m2so14054509plg.4
        for <ath11k@lists.infradead.org>; Wed, 01 Feb 2023 08:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuWcrDVG77MlzAzG1Dc9fCEJWh5XQzqPcKQwClqpGQk=;
        b=elsctNm6DvnStQNg/FiqgVT58WMOCUG7xRLbpU1S3BHrK2CrWN3bs69y3FSS53aQIT
         VGfpRUFDv+zQ/9PPxQBjX0Hn5y15GaAc1Lhq8hOuApj/9xVEah0bavBFheTs7kb6viHU
         uzT67e9IFG4XJUH4X4EBou9OUYS6NnHgTRD/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuWcrDVG77MlzAzG1Dc9fCEJWh5XQzqPcKQwClqpGQk=;
        b=kWrGQ9U9/Liorni74Zy3hHny3Tx4QAVG1vD9FgL0ZUX4/jUHvfhurhe+MjZQuLL7R4
         djz9SVJ30BSOMmKT2fWWe04QTGNrwWH0vKBzD8KtsMeU7e6Ya2naTbGmZ5k1JAeBtfra
         HeLbt9bLRORfDOftYDszLHNda6WpPcmu67rKfkcGDElikShxk5689V4SHM1aaiMIYkUb
         VbeOMcnQTdJvjo7rfBNBHHWLxQgQmdvnLtUZG+DJ3I6XglzW6O+fAPqC9dkn49xFi4dz
         wQkEDlnr+zxMoJg4P+3PkaZ/EZv/H/LiarcafZNcAMpL0ufgxVZUtJ+m58+xXTtvdO0h
         4gkw==
X-Gm-Message-State: AO0yUKUt7CRxq9PBDONqjieGtlrGRbfj9s3Ki5OH1vDMs+VAjUgVscY8
	pgDwl/MvPrFSl84T3zt2sGi5UPi7+/Kkuh44jm8=
X-Google-Smtp-Source: AK7set9yAZQ6+dqWsBd9DE4iXXS9o4iyPyJ7iSp8CiKtvLQ+kk68I2UOsZmjpeyAcBcmjYLHtzQXLQ==
X-Received: by 2002:a05:6a20:7da4:b0:bd:79a:a215 with SMTP id v36-20020a056a207da400b000bd079aa215mr4272667pzj.29.1675270496006;
        Wed, 01 Feb 2023 08:54:56 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:ba26:efe8:5132:5fcf])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7870f000000b0058119caa82csm11605090pfo.205.2023.02.01.08.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:54:55 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	junyuu@chromium.org,
	Youghandhar Chintala <quic_youghand@quicinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 2/2] wifi: ath5k: Use platform_get_irq() to get the interrupt
Date: Wed,  1 Feb 2023 08:54:43 -0800
Message-Id: <20230201084131.v2.2.Ic4f8542b0588d7eb4bc6e322d4af3d2064e84ff0@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230201084131.v2.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
References: <20230201084131.v2.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_085502_704662_A023A542 
X-CRM114-Status: GOOD (  18.05  )
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

As of commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ
resource from DT core"), we need to use platform_get_irq() instead of
platform_get_resource() to get our IRQs because
platform_get_resource() simply won't get them anymore.

This was already fixed in several other Atheros WiFi drivers,
apparently in response to Zeal Robot reports. An example of another
fix is commit 9503a1fc123d ("ath9k: Use platform_get_irq() to get the
interrupt"). ath5k seems to have been missed in this effort, though.

Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I'm not setup to actually test this, but I figured that I might as
well go all the way and fix all the instances of the same pattern that
I found in the ath drivers since the old call was actually breaking me
in ath11k. I did at least confirm that the code compiles for me.

If folks would rather not land an untested patch like this, though,
feel free to drop this and just land patch #1 as long as that one
looks OK.

Changes in v2:
- Update commit message and point to patch that broke us (Jonas)

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
2.39.1.456.gfc5497dd1b-goog


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
