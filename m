Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E50CA0FED
	for <ath11k@archiver.kernel.org>; Wed, 27 Aug 2025 20:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=252oT4Hha69glxkP3l/gBHkZ/1EONz03+KC5CcMvNa0=; b=KXcxvUR/7GMTAbt2H+zj3PmRDJ
	7dQ2qpFxkrJqjPl7jZSii+VMm2X4zE3myBCSGeaReOYoiFARYqSXlB/uTRrKT93C04VxAxkdFSjAJ
	zltQ7Y8epoxV7eC4SiWJyPJFJiujUf+c8lzjoqXhY6xF5H4Ai5dbGdUdElqxJNUD+SQGcfzuvwBrZ
	EiXnLdqxg0cwcya3fyZh2L7iGBAfGokKANnbbRJvIoYTRvlhDqSfxkD8FSVQM6Rwycn4ViceoxvUY
	vU/LvPa4a/Ucz/7BGr7g/lznKLkL+oqr4f2VRpAVqztzzNhku2KEtnPUcywR4voOhe9xf+T7jZsul
	8SiDZk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urNCJ-0000000Gp5i-2FwC;
	Wed, 27 Aug 2025 20:56:47 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMv0-0000000Gn99-3Fv0
	for ath11k@lists.infradead.org;
	Wed, 27 Aug 2025 20:38:55 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-770530175a6so201084b3a.3
        for <ath11k@lists.infradead.org>; Wed, 27 Aug 2025 13:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756327134; x=1756931934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=252oT4Hha69glxkP3l/gBHkZ/1EONz03+KC5CcMvNa0=;
        b=hXXip8PBDVQfesEjx2B4glt1E8Oup3eY8LwTgegx2ATb27cxgxfApO9ks1cWbCpng+
         YXnO7z+aJMUxCLo1iqF38AqRf/BLhMTMQXSykVxy38I/X5zdDz09FkUMZzsKHObaMCbs
         ecz1RpmluiscrcVgLVlLXU6nhFnIoba3RNmsOiyNPSWnyOXt2xSG79aiVHOzo6Gwb180
         8ygOSpID+/woV1ZcHejBDDMqZ4iMxe0FbbOeJSAMmOWeM6PDTujkIg548PvEt2lImHKR
         iYMJdJ+1jO0z/cHtVrVqF2gxn2N4QHcq7ElPEbuSaFDxhL4HqPDLPHIFfnIEx9OWUbrb
         ub9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756327134; x=1756931934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=252oT4Hha69glxkP3l/gBHkZ/1EONz03+KC5CcMvNa0=;
        b=HqPglNBIS13TFiYtTHD6zfzEL493OQdEqMaMBK7iJC/JivRON+idBqkEgtaeZ7ojgU
         zzvYsX0VMOTioEQmPmepYMSkPr7sgadwIt8ZpTsmjA5rYCa6CVButFpP8ULsLsXJHGwf
         Z9afcIZrAfO7IS8zPObVb93sq0YHlffkSnZw+vPEOte83DTP5jYCsjiczZqv3ihKT32j
         dB54/qzwun05WhfGiXwqEqHIIcgC9BVCxabS3ESyC1buq0ZQkgiqYGc1L5+zOhAr1wCO
         zw4+nPwgP3vH3mA3NHQ42QS1HF24ckZPhJNooPGTRmWNJ9JOc0uCpnUhoZxiVMUHL13d
         XROw==
X-Forwarded-Encrypted: i=1; AJvYcCX/7d9WbExt900Rg0t9HQONTRXXiuBvp0TcHKrMHo735QAvBy9FgiLhHoBjCBUM/PSMrp1DNuQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxP1DOSZ9BEQ5esRPmGwPf/XLp9iESyyQSMaBw0lqdB2U1uY129
	dN2wjX+gf+JPo4MRhVollf7vdccFGObDyOdUXLl4uHWbYQnA6RxW552K
X-Gm-Gg: ASbGnct2t8534uX+93VYkhX3s7xXSWb1VC5pBhaDapSGHg+JtKVbUlWpX/WJ9eqFxYg
	gDGAhbaIT6BdaZnY/ot73ukNEfeDi5Q7xBY4G6CNjGC0UIqWYNzRgE0VP9UhiZjX3r+rDmgcXg7
	0u5hoviQvA4zZkYK8MTPhmFXpetnNp1ATDH/zlhm2IT6U/+WZ7QgrUQajfzT20q4urHvfpj9SRd
	vIkbZEtPr4ayLl1IJIgADCEU6MrrZOS41l3eJ+KbY8a79Rfd9RVxB2QiSNPdad0ffx9joyufa8e
	Lt76ZHmKEpERzSfyK83talgV5Ntkza9dH3wvZllqsNP5HGim7h1kukD2S5bfHWVSeTyzb0MKe3N
	ptfPYewryOXARAzCpX3GagpeHEoYjDxmDf1iGGzNQY/t88SqzDO//V3ZEt48dgSXnSA==
X-Google-Smtp-Source: AGHT+IF76jF27JYYyP/4B25nnu5OjijebrPt3nphOQyIKm79HURBtHuWwXY2bqBXwU8nN9mXaGGHLQ==
X-Received: by 2002:a05:6a00:b52:b0:772:114c:bcbb with SMTP id d2e1a72fcca58-772114cc0d7mr2575723b3a.4.1756327133677;
        Wed, 27 Aug 2025 13:38:53 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:acc7::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771e6535272sm8578355b3a.24.2025.08.27.13.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 13:38:53 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	miquel.raynal@bootlin.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 ath-next] wifi: ath11k: switch to of_get_mac_address
Date: Wed, 27 Aug 2025 13:38:52 -0700
Message-ID: <20250827203852.8586-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_133854_833413_EA4EF7F1 
X-CRM114-Status: GOOD (  10.18  )
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

This is needed to support nvmem defined MAC addresses in DTS.

In addition, check if the probe should be deferred as nvmem can load
after ath11k.

For brevity, ACPI is not a factor here. ath11k is too new for that.
Except for ath10k, all other users of device_get_mac_address are old
drivers with explicit ACPI support.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove wrong EPROBE_DEFER handling.
 drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1fadf5faafb8..2a55c5ab2f2d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9,6 +9,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/inetdevice.h>
+#include <linux/of_net.h>
 #include <net/if_inet6.h>
 #include <net/ipv6.h>
 
@@ -10434,7 +10435,7 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	if (ret)
 		return ret;
 
-	device_get_mac_address(ab->dev, mac_addr);
+	of_get_mac_address(ab->dev->of_node, mac_addr);
 
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
-- 
2.51.0


