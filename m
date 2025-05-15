Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0597CC2D0CD
	for <ath11k@archiver.kernel.org>; Thu, 15 May 2025 22:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IKoACcwZvqB4hjAADhBiXrdtznQVIY5lA2O4xWzuOU0=; b=UijAd9vqEwSJ69O+2tGcZoT/jt
	QJPRVMpWHsTfOzg7aq5hRh9rS1nruCPZiQ6Ar1rWOB9+5zeAuBLYJZG658POus+gWwpPqU+0ViDzG
	bWBJ2XUobaAiUnvsw3VdDf1Fe8u803nLDl5B0MnITLpQOTWQcfqDo3+394ooX47r+ejk8uSPFN3e7
	2a5JZHSkeEXwZC6QDzuG8N90wdKjysEFE2Vq5sVViQ5ewveSRymueGVI5MNuLMdLWRGeNlqVqsUat
	He2N/SOCvZwbH6CR3dbPceTOJCF3hOsWOn5kGb4FeDBy2SgLlVwC1sLjebh1jkEhxjrkYXur22JbR
	RT6KK40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFh1A-00000001yLT-00tB;
	Thu, 15 May 2025 22:25:32 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFh18-00000001yL9-00r3
	for ath11k@lists.infradead.org;
	Thu, 15 May 2025 22:25:31 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-52934f4fb23so872033e0c.1
        for <ath11k@lists.infradead.org>; Thu, 15 May 2025 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747347928; x=1747952728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKoACcwZvqB4hjAADhBiXrdtznQVIY5lA2O4xWzuOU0=;
        b=jGnHniuponFGxl/BafQ5kqEQXKum0H/kj/243l8rX5aMHcgSmzOiEMF/hreG1Tu0cc
         FWsa490mtJ2gwAeyEZ+ZyKK/QeM5lX+E/fq+4CYPDZz+tXHJCVn+mIJ5HSqrgQCP3bIx
         P2LjgxIm2fJrfH5vTvTzzxjCrtXnA4tLNLsdB5Cqjc3BrCOkaDf1uAT8Bfwx9ok9VzOv
         Ckj5/Ix6rsy9wApreu10wDq1s6oEn2YNNRkE1G+X96y86j18Ltv2zVO5wGLJfz91H+A+
         3QLJ4FdhEF0HqFVQbXhdwzlLsu29e6hMud1QRwQTJTTzskZ46ToTuKsSm8vyfcg6JRdl
         wiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747347928; x=1747952728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKoACcwZvqB4hjAADhBiXrdtznQVIY5lA2O4xWzuOU0=;
        b=hgktQDAArRjqdriDv1byk4iulPjn9RIqWaZt3ytpshe1fSfw1FE+gzGT5wcWUI+Q9W
         XhqgM9vrOvXi1PwpVmyCHMixPjjgyPyCeKGXH90DNATPsV4BGphqzJiZEaVipMgK3jjy
         rNuTxVSCDvd3YQ0do+qJd6oEjJYHTiJogZZ2dmYjWmgPnnOEnA2KU7cvNJc1ba4HC2fS
         xT4qKvQG0ueTCBMrBEOnG1Pqe0xkH/qTz8ONjPslYYT2GsPLXBRU/3Yc/luK7ftlEM2g
         KxLeSJknKwoJCKkT5DoeGG/9Q0sQSS6DA3+3IIr7tRQhfsvxEBu+hv2gbGUSlBbChDSW
         DQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmZCKazJ9sDXx+nF4c6k0nNaBczLwpMJVuwNoeY3YFN0eKsR8N23k2YTkAYa72knszhebOKq8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0RfH/T/p/UL3FNohLZTfF5PZBLWz+owWuJWKkvKnLVF/0xSKA
	FZFya7goaJFgLvOMBaZZN5v4Bw77NiMVXJyo0OpOPgwtvwc36kocAObx
X-Gm-Gg: ASbGncsm/kWw4/0cjO8OUfWJxW1+uz8h+4qmC6jPTLwRk/gK8PgagPCTBCN2QSuL2KR
	2aTv+FpI+nF9LQAaoWLHS9wyx/mOKRqcZDvIvXrzHhOMVJettGxqptGT+d4u7KhRuaa2nE/y8a7
	LWLjoBC50RxXHuujeS/dwrsKOxfKks120rwrzd+iyjUQmj8dP+sJ56YJpoLWPWJGgdTvDli1mpV
	gc9u9fGu22Bqy94GD1fHXVmtfGlp4dqCrya3qODXcUdLnrOrjcoSDAI09NyBM7i/Y6kCwbQ+M70
	JmvY0p47gdMCe/fJxT83DOdFQx1TMnJeXlCjyRJqgazZoO+Teh1yQFvoRK6sE5fMX7iTIHUPQxY
	=
X-Google-Smtp-Source: AGHT+IH0Tx0zRc430b72Scg4pBsmQupJJ3uqemf4Bh0+E2crHEPLAfCrR3/q35Bega+vTcWuytGTlQ==
X-Received: by 2002:a05:6122:88c:b0:52a:cdd8:fc33 with SMTP id 71dfb90a1353d-52dba614e02mr2282226e0c.0.1747347928588;
        Thu, 15 May 2025 15:25:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba9408f5sm724417e0c.15.2025.05.15.15.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 15:25:28 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jjohnson@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: clean-up during wrong ath11k_crypto_mode
Date: Thu, 15 May 2025 19:22:48 -0300
Message-ID: <20250515222520.4922-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_152530_041839_D84130AC 
X-CRM114-Status: UNSURE (   8.74  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
started/configured. It's reasonable to undo things during this condition, fixing
the following smatch warning:

drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
warn: missing unwind goto?

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Changelog:
v2: add smatch warn at commit msg
v1: https://lore.kernel.org/linux-wireless/20250515004258.87234-1-rodrigo.gobbi.7@gmail.com/
---
 drivers/net/wireless/ath/ath11k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2e9f8a5e61e4..fd3017c444a4 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2163,7 +2163,9 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		break;
 	default:
 		ath11k_info(ab, "invalid crypto_mode: %d\n", ath11k_crypto_mode);
-		return -EINVAL;
+		ret = -EINVAL;
+		ath11k_dp_free(ab);
+		goto err_firmware_stop;
 	}
 
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
-- 
2.49.0


