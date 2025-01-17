Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4975C02185
	for <ath11k@archiver.kernel.org>; Fri, 17 Jan 2025 18:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M3PDbKZO2d8iac2bLYbqddv/S8yyo5fpqub3QNHLQdY=; b=U/JhB4N17jMyXHSI8GYW8RZmMU
	FvdmZ+FSebUM5l7JWBlO2Mkpk7ZtNyVo2NtlkRbeW2/kDo8hiHWIITBJo3iK6/EVAAlG3RVihnK9h
	glox/bBTPnFJ5sXjbWL5kSuRiTSz6LhQA8qRQfMaZIRZZCP2mvy3p3MKIZAEtaitTACc7vZIUyeCM
	3OR7jFRSl3YMAdZDzqavfBnTJM3cbf5blAASMRiuQLxji7FF4gTLiPeEt+yE3HyuqxL3CZVrhVO1Y
	ZeXvqjiK7/y95+UmranNa8m72LkBQ+NaFh39ANZKD9yr0U4IsMwbilQdL76MeIBg+46b1xEusPk4t
	7rjDOsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqwp-000000013KL-0vRq;
	Fri, 17 Jan 2025 18:19:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqwm-000000013JX-2TyD
	for ath11k@lists.infradead.org;
	Fri, 17 Jan 2025 18:19:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43690d4605dso16557565e9.0
        for <ath11k@lists.infradead.org>; Fri, 17 Jan 2025 10:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737137995; x=1737742795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M3PDbKZO2d8iac2bLYbqddv/S8yyo5fpqub3QNHLQdY=;
        b=ZHOYdg444TYqeYHEqmw4IQQMb4OfLkqMMsngbP+DmZ0K5eAyEZoc98F3CSR8diasK6
         lviZo+GIeKzCXFXoqI0JYBNh70wK3VTUJuP7NCBMkAdnH1X2J9DYeaK7EadyoGIbALq+
         sAHNoUzWpa8gq7lDarOiRLrk1imzaC8cPTnCCJfrwljlb8+UHyL/oaidhrYVqEbJCaQA
         FoCiym3mKlcIgDyYe0UIHQts9X58E/5iqAHzHnuDfWveZaMDsDEn8DDsY4R3s3n+XRPq
         VFeRLbMD53SPKiF0zPU49dCQM6ePI6cqvzqlH5ej6YvcnGGkfGV5Ud6uT0Umo7UG7F+c
         lxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737137995; x=1737742795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3PDbKZO2d8iac2bLYbqddv/S8yyo5fpqub3QNHLQdY=;
        b=IV56AA/C0sDLEzotNvnZo3ZT6NY1ya2jhZxJkorgoaDzyWkZ4sj9UrHD/acj3lYQit
         kX7nITYHCBDWD0YJVU0asECN6CLNubZ0pqHXixy4YA7qtdDSjbp/PRZfIVFRLhHNF1wo
         4mXNJEFQNpMfqLb3jpNIgWb0Mn7WsOPPMJro1goV/ZGB8xWR17YnJqvUcymBsCJjpdjP
         rKypAmAneQA9korroFsYDIQ2X8rKpv1m3bp5YIcr/shv3Do7WKBj1PywLe6/KwuEFYfg
         2X0YHt5AmYvUCddjz+UpLEuIhm/5XKoggnURMZClfWW1jaBNBGVwic+q6KidYpwPJ6O3
         niXQ==
X-Gm-Message-State: AOJu0Yxfg3XEvyUwkdgAIy8xhHrsxXWEwVh7yiKqDP7GivzlFm62nwJ0
	EmmIPKsLOt8z7UwxXG+3pJRCVAYfrE/4McXSk9gGn74C9YC5rwq5gqO1cw==
X-Gm-Gg: ASbGncsuO8qZBGLvqdmy8l7ClJlakP+s0nA17RpmQAPfIiSgEnBsxx4mDKtZTxgQzmg
	8YXmoXZiYAZjT9617qHmQDJw91iQ2nMHsVkvC4SmZ6H4USKeCzacI1/swkn2wzDR8RHRBmESDKf
	bczupFxSXsTslyQN3ElK42wEQ0WYkhvpL7TnIknSu/eLrdM3IzeGFF3x04lT1eKyVoPK7B3DGrr
	tM6eehLvQUFn7RU7amfDx/A9RN7iqKsl4HYK4kihN9GAlTFmxEcVAeE/utgXY7NtSioRA268B0z
	Nk1Cy7qbyKZueQ==
X-Google-Smtp-Source: AGHT+IF3jWrhX7mBjcIuTnT9DshqYP+3K1MQpYxZmnywckA0wpGyMN/VQHbvuDFnHs2Zz4oi18mhBg==
X-Received: by 2002:a05:600c:450d:b0:436:840b:261c with SMTP id 5b1f17b1804b1-438914340afmr34506845e9.19.1737137994804;
        Fri, 17 Jan 2025 10:19:54 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c753caf3sm99236025e9.38.2025.01.17.10.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:19:54 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: remove peer extra rssi update
Date: Fri, 17 Jan 2025 19:19:53 +0100
Message-ID: <20250117181953.3375273-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_101956_627327_04D41FA5 
X-CRM114-Status: UNSURE (   8.25  )
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

Commit b205ce4c266c (ath11k: support avg signal in station dump) added an
extra assignment of arsta->rssi_comb in ath11k_dp_rx_update_peer_stats
when it added the average rssi support. So lets keeps only one by removing
the legacy assignment so the two statements about rssi stay next to each
other. Compile tested only.

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 029ecf51c9efd..24774cba9823b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2831,8 +2831,6 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
 	rx_stats->dcm_count += ppdu_info->dcm;
 	rx_stats->ru_alloc_cnt[ppdu_info->ru_alloc] += num_msdu;
 
-	arsta->rssi_comb = ppdu_info->rssi_comb;
-
 	BUILD_BUG_ON(ARRAY_SIZE(arsta->chain_signal) >
 			     ARRAY_SIZE(ppdu_info->rssi_chain_pri20));
 
-- 
2.48.0


