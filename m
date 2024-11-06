Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F9D59F53
	for <ath11k@archiver.kernel.org>; Wed,  6 Nov 2024 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XHM9QeNlhOTneChj4bKhI5LC9ZZcmDxqXuZBfNBpX+4=; b=BV+JfwogBaOCmG0FyUmA8c5vJI
	YmPg+0YyX31mjk3NGnNrCnp1ZjrcA9GBd8bnjhPTAvWorGrXUPynQ66GKLKtTLyIVvL+rbxjK50kw
	G42l2OrH/spdUdow+xQHx+r3uwW25ehNzc0loCqEoC66MeiS5j9fBymIqyhR3AVPQN+trI+Ljy/UK
	5bjSgjytHHzJwuplBCiXQAqpI8ZNmdJjN9i/O+kyLg3yaGnwzhDtupB1ZLa2k9ozhd7QMqfF86O02
	gCm9UDRfDn4Va0rpWYzSL4QZ5AG13TUoSwAthnjBG9rtJYF8HUW3/TmJMexCiqNf+tqy9fhV/JCxc
	KOBVrDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jbL-000000049w4-1G5B;
	Wed, 06 Nov 2024 17:13:51 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jV6-000000048d0-2CVY
	for ath11k@lists.infradead.org;
	Wed, 06 Nov 2024 17:07:27 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539fb49c64aso9792618e87.0
        for <ath11k@lists.infradead.org>; Wed, 06 Nov 2024 09:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730912842; x=1731517642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHM9QeNlhOTneChj4bKhI5LC9ZZcmDxqXuZBfNBpX+4=;
        b=TCeown8tjcwWCBXA9HHUYyK5VtQabd7Em/nIFvbzC4+ZuFG/QyDcqPW9/n0o3pdSug
         hksYQWWyr394/ZjVhWhtuNyAZEKnN2gSMb80FwAjeVildFnYFnzmmVeFi3Kpu351Z2Bg
         NIZR95qgEHp0FbgPgna8UUo6Lq6lMQvg17e0vM9+cOV9qvBL/e38oa2iqHV7X3gnhZic
         8eKTYYjapRF2G7xUsKTT828dNiO0CBnVQ+XSWfLWIjbH7I2/PH6uUuyysXTQCpE+ZTsR
         ruVcGRpV9ReZmm1Ag7tJQ3tmg8/fxn9f2chgIkCED5PC4X0wBSi3yz24dbBcaJO5SKyN
         KVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730912842; x=1731517642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHM9QeNlhOTneChj4bKhI5LC9ZZcmDxqXuZBfNBpX+4=;
        b=vClrri3UHvKbZxL8iLA6jkxWb82DLqyXb8vErsUCOTmzyvzv6DZLvVokI5+/PszHYy
         a9B75GOhRR0NjDcU9ThrV8zrtm8d0aB3uya2DpJlJhg45F2ex1Sk6yoxV2IYulm99cDL
         dUqg9lMetzU1YHfE0GI2f183wQ00Yw1Iyq4QbxXorY7m4I4tTVLcyZO76mQ7X9INrYZ3
         MNdRMK75CTR3/8E6xh0+t9/Luo85gEQOICJU2ZAXxyhVqBtLFrrsiGm8gGfYhY3yzCV7
         /F/NwLUTunM4RHLxSK6B3Xt/MNYbG4mH/EwtoXKvhIuDyd86gfkJazmmPDTkyWxPIw56
         pbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVawCzqtHTs1NiTETV70rQ3iu5Akp6XId7g3iotrHnGF2MdGd6s5kXFokagp4xNYxjO+7XsB+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzennGCyb8s3IQHOJFpLyLlt6dzyqQhIC3728mRW5JTpLTVaQx7
	JxLfMKQdpEzXcYRAPDft3GHzrvwjY63J2WT0MMiO9VvQm1aXRcZ7QzQioDCweWs=
X-Google-Smtp-Source: AGHT+IGhBvl6PJej/erZYenNszqbzeKKntvkwDvg4ctncTyHT7L1mvB9FrEIevg7TtOD7POmTVj7AQ==
X-Received: by 2002:a05:6512:e9b:b0:535:6951:9e1c with SMTP id 2adb3069b0e04-53d65de3305mr15940463e87.15.1730912841533;
        Wed, 06 Nov 2024 09:07:21 -0800 (PST)
Received: from localhost (p200300f65f28bb0063ffae39110fa2df.dip0.t-ipconnect.de. [2003:f6:5f28:bb00:63ff:ae39:110f:a2df])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16daf14sm303710566b.80.2024.11.06.09.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 09:07:21 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Loic Poulain <loic.poulain@linaro.org>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Breno Leitao <leitao@debian.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	wcn36xx@lists.infradead.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: Switch back to struct platform_driver::remove()
Date: Wed,  6 Nov 2024 18:07:06 +0100
Message-ID: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9551; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=KMwi4wYhZdlHLCX2G2Q9HUhUPG50WPecsWOZ3KoLi9k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnK6I7k3QwBHx4LDlthAT30A0zDc9WSJ6yBQ3NF 4O0KVmRJ9aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZyuiOwAKCRCPgPtYfRL+ ThLbB/wNHseXuNO6BSs0X7tJr80GSCYLop1HgRzFN6qlnsLebiHcY7/fxrQIk4qvEabG2PB6fW1 7hZIqip47uQZYg+b+djnq7b1LAvKA+1hMzBs2MDcmIZbgfVtcmbBPt3UbZDo8krGzBj80RcVoJ7 3glArVF/Hp0VNmM+6IWIzxLKKWUr5lEPQk2lUPBd/9O8pbSrizA4gRnMP2Rif6goEFsYwWDgmZF yOTyIGlVcWgm86js57VuSJ+x+ys3kUiz2O67dCQEQiXLzRlCFyi7TKysdToW9E/jMTucq28WmUh J1zg5EM/JY/sa9jMUt7vzYlpMFHU8LP1xFH7gzizoH34q0Ts
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_090724_804415_3DE8DFAA 
X-CRM114-Status: GOOD (  21.71  )
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/net/wireless to use
.remove(), with the eventual goal to drop struct
platform_driver::remove_new(). As .remove() and .remove_new() have the
same prototypes, conversion is done by just changing the structure
member name in the driver initializer.

En passant several whitespace changes are done to make indentation
consistent in the struct initializers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/net/wireless. While I usually
prefer to do one logical change per patch, this seems to be
overengineering here as the individual changes are really trivial and
shouldn't be much in the way for stable backports. But I'll happily
split the patch if you prefer it split. Also if you object the
indentation stuff, I can rework that.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/net/wireless/ath/ath10k/ahb.c                  |  8 ++++----
 drivers/net/wireless/ath/ath10k/snoc.c                 |  6 +++---
 drivers/net/wireless/ath/ath11k/ahb.c                  |  8 ++++----
 drivers/net/wireless/ath/ath5k/ahb.c                   |  8 ++++----
 drivers/net/wireless/ath/ath9k/ahb.c                   | 10 +++++-----
 drivers/net/wireless/ath/wcn36xx/main.c                |  8 ++++----
 .../net/wireless/broadcom/brcm80211/brcmfmac/common.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/soc.c        |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/soc.c        |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c        |  2 +-
 drivers/net/wireless/ti/wl12xx/main.c                  |  2 +-
 drivers/net/wireless/ti/wl18xx/main.c                  |  4 ++--
 12 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index f0441b3d7dcb..db9f9ebcb62d 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -837,12 +837,12 @@ static void ath10k_ahb_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver ath10k_ahb_driver = {
-	.driver         = {
-		.name   = "ath10k_ahb",
+	.driver = {
+		.name = "ath10k_ahb",
 		.of_match_table = ath10k_ahb_of_match,
 	},
-	.probe  = ath10k_ahb_probe,
-	.remove_new = ath10k_ahb_remove,
+	.probe = ath10k_ahb_probe,
+	.remove = ath10k_ahb_remove,
 };
 
 int ath10k_ahb_init(void)
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 0fe47d51013c..d436a874cd5a 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1885,11 +1885,11 @@ static void ath10k_snoc_shutdown(struct platform_device *pdev)
 }
 
 static struct platform_driver ath10k_snoc_driver = {
-	.probe  = ath10k_snoc_probe,
-	.remove_new = ath10k_snoc_remove,
+	.probe = ath10k_snoc_probe,
+	.remove = ath10k_snoc_remove,
 	.shutdown = ath10k_snoc_shutdown,
 	.driver = {
-		.name   = "ath10k_snoc",
+		.name = "ath10k_snoc",
 		.of_match_table = ath10k_snoc_dt_match,
 	},
 };
diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 916402ad06b8..f2fc04596d48 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1313,12 +1313,12 @@ static void ath11k_ahb_shutdown(struct platform_device *pdev)
 }
 
 static struct platform_driver ath11k_ahb_driver = {
-	.driver         = {
-		.name   = "ath11k",
+	.driver = {
+		.name = "ath11k",
 		.of_match_table = ath11k_ahb_of_match,
 	},
-	.probe  = ath11k_ahb_probe,
-	.remove_new = ath11k_ahb_remove,
+	.probe = ath11k_ahb_probe,
+	.remove = ath11k_ahb_remove,
 	.shutdown = ath11k_ahb_shutdown,
 };
 
diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wireless/ath/ath5k/ahb.c
index f27308ccb2f1..cb3e891ee1bd 100644
--- a/drivers/net/wireless/ath/ath5k/ahb.c
+++ b/drivers/net/wireless/ath/ath5k/ahb.c
@@ -218,10 +218,10 @@ static void ath_ahb_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver ath_ahb_driver = {
-	.probe      = ath_ahb_probe,
-	.remove_new = ath_ahb_remove,
-	.driver		= {
-		.name	= "ar231x-wmac",
+	.probe = ath_ahb_probe,
+	.remove = ath_ahb_remove,
+	.driver = {
+		.name = "ar231x-wmac",
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath9k/ahb.c b/drivers/net/wireless/ath/ath9k/ahb.c
index 1a6697b6e3b4..d4805e02b927 100644
--- a/drivers/net/wireless/ath/ath9k/ahb.c
+++ b/drivers/net/wireless/ath/ath9k/ahb.c
@@ -158,12 +158,12 @@ static void ath_ahb_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver ath_ahb_driver = {
-	.probe      = ath_ahb_probe,
-	.remove_new = ath_ahb_remove,
-	.driver		= {
-		.name	= "ath9k",
+	.probe = ath_ahb_probe,
+	.remove = ath_ahb_remove,
+	.driver = {
+		.name = "ath9k",
 	},
-	.id_table    = ath9k_platform_id_table,
+	.id_table = ath9k_platform_id_table,
 };
 
 MODULE_DEVICE_TABLE(platform, ath9k_platform_id_table);
diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index 408776562a7e..8557d4826a46 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1679,10 +1679,10 @@ static const struct of_device_id wcn36xx_of_match[] = {
 MODULE_DEVICE_TABLE(of, wcn36xx_of_match);
 
 static struct platform_driver wcn36xx_driver = {
-	.probe      = wcn36xx_probe,
-	.remove_new = wcn36xx_remove,
-	.driver         = {
-		.name   = "wcn36xx",
+	.probe = wcn36xx_probe,
+	.remove = wcn36xx_remove,
+	.driver = {
+		.name = "wcn36xx",
 		.of_match_table = wcn36xx_of_match,
 	},
 };
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index 58d50918dd17..cfcf01eb0daa 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -594,7 +594,7 @@ static void brcmf_common_pd_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver brcmf_pd = {
-	.remove_new	= brcmf_common_pd_remove,
+	.remove		= brcmf_common_pd_remove,
 	.driver		= {
 		.name	= BRCMFMAC_PDATA_NAME,
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
index ec02148a7f1f..08590aa68356 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
@@ -71,7 +71,7 @@ MODULE_FIRMWARE(MT7628_FIRMWARE_E2);
 
 struct platform_driver mt76_wmac_driver = {
 	.probe		= mt76_wmac_probe,
-	.remove_new	= mt76_wmac_remove,
+	.remove		= mt76_wmac_remove,
 	.driver = {
 		.name = "mt76_wmac",
 		.of_match_table = of_wmac_match,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
index 12e3e4a91d27..06a0f2a141e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
@@ -63,7 +63,7 @@ struct platform_driver mt7622_wmac_driver = {
 		.of_match_table = mt7622_wmac_of_match,
 	},
 	.probe = mt7622_wmac_probe,
-	.remove_new = mt7622_wmac_remove,
+	.remove = mt7622_wmac_remove,
 };
 
 MODULE_FIRMWARE(MT7622_FIRMWARE_N9);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 90a6f61d1089..c823a7554a3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -1303,7 +1303,7 @@ struct platform_driver mt798x_wmac_driver = {
 		.of_match_table = mt798x_wmac_of_match,
 	},
 	.probe = mt798x_wmac_probe,
-	.remove_new = mt798x_wmac_remove,
+	.remove = mt798x_wmac_remove,
 };
 
 MODULE_FIRMWARE(MT7986_FIRMWARE_WA);
diff --git a/drivers/net/wireless/ti/wl12xx/main.c b/drivers/net/wireless/ti/wl12xx/main.c
index b26d42b4e3cc..ffbf54776330 100644
--- a/drivers/net/wireless/ti/wl12xx/main.c
+++ b/drivers/net/wireless/ti/wl12xx/main.c
@@ -1939,7 +1939,7 @@ MODULE_DEVICE_TABLE(platform, wl12xx_id_table);
 
 static struct platform_driver wl12xx_driver = {
 	.probe		= wl12xx_probe,
-	.remove_new	= wl12xx_remove,
+	.remove		= wl12xx_remove,
 	.id_table	= wl12xx_id_table,
 	.driver = {
 		.name	= "wl12xx_driver",
diff --git a/drivers/net/wireless/ti/wl18xx/main.c b/drivers/net/wireless/ti/wl18xx/main.c
index 39d8eebb9b6e..4be1110bac88 100644
--- a/drivers/net/wireless/ti/wl18xx/main.c
+++ b/drivers/net/wireless/ti/wl18xx/main.c
@@ -2097,9 +2097,9 @@ MODULE_DEVICE_TABLE(platform, wl18xx_id_table);
 
 static struct platform_driver wl18xx_driver = {
 	.probe		= wl18xx_probe,
-	.remove_new	= wlcore_remove,
+	.remove		= wlcore_remove,
 	.id_table	= wl18xx_id_table,
-	.driver = {
+	.driver		= {
 		.name	= "wl18xx_driver",
 	}
 };

base-commit: 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
-- 
2.45.2


