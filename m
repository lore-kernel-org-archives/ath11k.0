Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DA5CA0EEB
	for <ath11k@archiver.kernel.org>; Thu, 21 Aug 2025 04:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1IN1Teq4e2sAVaB5v/P7mB/rOLPipyuu7DLJ8UrOyVo=; b=ICSUAr4mJIxgbOYvYnhid/QAVP
	3jPNxB6l2qFpzsyDxuNl7o5yGcyPbXTCqxquoM73pjP7E0j6FPTL5On1J4XYako9noGZ3EsLfaAaL
	iUc6lzXZiIyJYXLlEx1okZtAJzPKHwCehdFq9Y17cCo9jDPSB0HH0iXKRISYa0Ybx767j1/NC/Top
	XXtr+b3HNOUhpZ19oM4FLd0IorrGials+mUyDT7Rmj1Tex9VeVz/BlFL2S8vfVh6NlSTCP6rPT+wM
	7AiLpF0CXcXt9dTs6SToG30m2iYmIClNyAPlveGnhdZZqpbqXmvmH63SGxthES6d0K9wMpKKEmtVM
	TDw9Xagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxEU-0000000FpGC-3K56;
	Thu, 21 Aug 2025 04:49:02 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovy2-0000000FchU-2niV
	for ath11k@lists.infradead.org;
	Thu, 21 Aug 2025 03:27:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso536736b3a.1
        for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 20:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755746877; x=1756351677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1IN1Teq4e2sAVaB5v/P7mB/rOLPipyuu7DLJ8UrOyVo=;
        b=JNm+7JykDsBO5vhmJtfFV9mCX1yxCyikpXr9mElUGs+BHZ6rwQHvx1w3jFWUqJ0qRX
         u0r/Qi6iZ79sfHW0ndKrHJp1iZ+e7x9TYQ2FIVVHp2e5MJd4n8bTl+EuAVdpnUN5R7CW
         N2bgEmK/9ERElh+JVUr8HhFhBiodfbFWKVzWGhOCj+lE5YcwsRNJvpi/jlQyi0n+SElz
         ZSuu0gz9o5nnnKUueRf8N4mqHc55dvtOXiUNZPxu+bjPZEo1kxUxBGJwgAIt6OlY+CI7
         qj6D+iShNyi5Odc0hKcw8RhQup+0imDIFWBOvYR8hzHKOGmQl7J3jGAoubYil+BPSKr4
         gKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755746877; x=1756351677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IN1Teq4e2sAVaB5v/P7mB/rOLPipyuu7DLJ8UrOyVo=;
        b=umZp9ggVJ9dSVV4z9znTe68j3Xq/V0VkweoVNTElTul/fiv9kdxDSQSmt3D2GaV4Gn
         /lA+FAJKdFQxAvU77DulA+jDnu14sAD+52WWx+U8G3R6fsUGcNdxU8fOBAqaWRz55MCt
         eI6/nnGfxfWuMlWe50orCi/RaoiWn1/hUQncft89SGvrM6YxJaUqvq7I1q4zjb2bjlcq
         8y94XXf8P//I7hzDWHC7PvJRVaEqKKLpTMpXHW9umMIWxNGFE5B8cwkIL391Dwy0r+ap
         hwWilN1kgXzOwwXsy7ED/nTnVc7SQ88Te0VKItkB5XDgYhCYcPBm+IF00o5/goEnQwm4
         6uxA==
X-Forwarded-Encrypted: i=1; AJvYcCUhsjtBeNL0vv/j0S0TAoRLWugXAaIrMcbWH9BOdFdhhwWiLHH6tW/jSqNnlgmri+54KeoaIRg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJVUi0zteHI5DUyQ/1fj5Gpo32tmASF7ctkZcNaUcqpf0OhK85
	7PGuTac2NTz8RVBpXDzvfyFa/MmXUNu0Z4NDWURZL92ArENTiQd4J5+x
X-Gm-Gg: ASbGncs9XWHI9N3GjRpFHb1SzPkLlvD3yI12zHLLsfxJGo4DZgW0pxbYs5ARiN+aGs8
	zewy3s1BlEvNMpCBZRFRvO5oiqR5kZ4FX/ZsruWPfWVMq5B186cOZuYVYt6UnK34QsltKle4GWY
	FWP404tcL5H/smGprySP+4kL5Vejeq7ZB4pGcduvraNzGErKy76rdJDdAv2OmyoUTGFHdeuYOb5
	wZIJ6CgYbSOqRBpBaSsYSHuF+ForSJl8cewhrWewXphB9I6e2XRaVWQvKOzOkaj32K7tGxoNaNl
	6BDECc6rSz1wDj7hASqucGwZrBA99tYO2aW44QTunGUW8uMEsdHo/kkEu4+CDv4HQnpZRIq1oh7
	+VCzm
X-Google-Smtp-Source: AGHT+IF41ywgDWIkaN2gPF4JkkQoYJJmpVIEoTZsLO1tVomauIeM2wVIjSiP1XNgt6v0HViVwzBw8w==
X-Received: by 2002:a05:6a20:734f:b0:243:78a:82bb with SMTP id adf61e73a8af0-24330abad42mr1211381637.53.1755746877418;
        Wed, 20 Aug 2025 20:27:57 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:acc7::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe8ae4sm3512707a12.18.2025.08.20.20.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:27:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath11k: switch to of_get_mac_address
Date: Wed, 20 Aug 2025 20:27:55 -0700
Message-ID: <20250821032755.636661-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_202758_704310_A63264EE 
X-CRM114-Status: GOOD (  12.04  )
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

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1fadf5faafb8..801db15ca78b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9,6 +9,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/inetdevice.h>
+#include <linux/of_net.h>
 #include <net/if_inet6.h>
 #include <net/ipv6.h>
 
@@ -10434,7 +10435,9 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	if (ret)
 		return ret;
 
-	device_get_mac_address(ab->dev, mac_addr);
+	ret = of_get_mac_address(ab->dev->of_node, mac_addr);
+	if (ret == -EPROBE_DEFER)
+		return ret;
 
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
-- 
2.50.1


