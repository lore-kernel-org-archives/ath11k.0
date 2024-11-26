Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B792D5A6CC
	for <ath11k@archiver.kernel.org>; Tue, 26 Nov 2024 02:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEMoY4+mJ+RgR/LDgWz+p7hM5OG52CaLPVyxQ21UnLA=; b=Tdju9X5CPE+s1b+oJYEG3AsL48
	O2bnJMLpq+DFxrAehYZdwpQJ3JFw4jx41xeVFZcbZsFCYZ+6u9yc1O7JcJglS6cDvxYoo0dqtEHLc
	TrRgt3B1SUia0po7h0wMCV1ekX27PmYPTkze9Mtpw3CQ1UBXwPm/xuLRWliZxkZOkz280EUOzLklX
	sVpj4I1E/EvBHXxRFleb7g/0P2TUqF7ymDC+edMkRyGvEDue4gxbx/K+zvEPBk6ZNpouwoqEkMG0U
	8p9jtyRk3TarQtU6YYkFLnxs9oTymB7QHwwyiK3G/9weT4bb1Gq2lt5QeszgMZXvOttkOyX6F0n1r
	GK/WijFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFlPD-00000009UPG-3QF2;
	Tue, 26 Nov 2024 02:34:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFlPB-00000009UOq-1JxG
	for ath11k@lists.infradead.org;
	Tue, 26 Nov 2024 02:34:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-212776d6449so55836605ad.1
        for <ath11k@lists.infradead.org>; Mon, 25 Nov 2024 18:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732588460; x=1733193260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEMoY4+mJ+RgR/LDgWz+p7hM5OG52CaLPVyxQ21UnLA=;
        b=cO1a8Hqla9KDOzoZLLHRSjFS+wKEIkPR9huifNRts6neyJtr8nNmmJ0fDu1tZewsHw
         ZsxiDhhEDj45gvxQdl4wZ34ACu6nGPQPmirRlsfkspeMaemHc0MzBLfniOEnGID7iwo5
         aG2JW1bflTIi+m3iMQT5snS1NTkRhyKXJR5IoSVPWZ3uvXfS18EEp1Kxb2SArtvI95CC
         h+IFW3PHakfQyGnmwZBrxCBYaejyk7fbN2WZQStsOk4W3cqf0FPX58rADmcpr8oGQoLM
         VAVS+PKw3tPIkyQSyRFoQhIY05G8if3tu3D4ycV5XuJtijBrQhWd7Sj9mEBbAasgdOuO
         sp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732588460; x=1733193260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEMoY4+mJ+RgR/LDgWz+p7hM5OG52CaLPVyxQ21UnLA=;
        b=vFioHdq//v8QTvoUA8UNMgZ/UswOnTPW5Y4w+vwVYwcPFsrYJABOD7BDwpCl9HGsI8
         LOUY0U7kgPakTyfSNcxVAJVEOhJoqfoBKCGMN4GC2bQKmqebcOGFvgMkJn5zxPQy4d9p
         zeHb4R7kjfZs8D5bHcyDROLM0Avmte8vCXTqWWW3mspfK0lF4Xj5ElEl5n7IklzI3sjb
         MQyW4c6Z/K6vBIpuTBEP8NcNGg3mfLsjEPTScb93CuV6m9jx+jG7wZffQi3yET/NnmyT
         84yQFIKrqIN/17I3UJoBMa/FaqhH4hgSxCiGHQQrcGQndAGfMFY6ABv32ue7hWX1SXO5
         6s3w==
X-Gm-Message-State: AOJu0YzDmyL3bhLt0WCf7bE6bUUtJKRLeyEpR27QfMKKIS6s3S3apkb5
	nJxFQr0Eu9QdqBfsxw4QfEgamUYSWjhU4UshNh75JPGKbU0Q2SJY
X-Gm-Gg: ASbGncuQQ6BWKNEoJzADlh9lMfChhXDS19Zdma7Qq0xDbf/b37qbdK6cCfzm1RAhqbh
	Z62uHCQBlJO9IshxxLBkSTXsE1mauRK54MVa5OpxnaTAv05JaI7vN9IL1X6pLovbobHX4V7O+32
	QtraSOuvsrYxv+trB1iNH4drG73h7jWEUC4Tpzm7rqlDStlkNKN1axEImx0dt5CxsH7A+2d+2EI
	snxU7zFKBgWqxO1LDwy0sRP/IoHSJooi9usWRvuOS5dvQE80HsGzlvNjJM=
X-Google-Smtp-Source: AGHT+IHnhYzQEtLUX9PuW3hVYMmYuZu+RDAaSNzMpmlQPuVvauOY4ym3QbjsAhq+/UFo6H6GV67MhQ==
X-Received: by 2002:a17:903:1c5:b0:211:d00a:1974 with SMTP id d9443c01a7336-2129f52d42cmr185147575ad.13.1732588459683;
        Mon, 25 Nov 2024 18:34:19 -0800 (PST)
Received: from LAPTOP-SQ5KB8RN.lan ([222.249.179.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc06adcsm73030115ad.166.2024.11.25.18.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 18:34:19 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: markus.elfring@web.de
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zghbqbc@gmail.com
Subject: [PATCH] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Tue, 26 Nov 2024 10:33:49 +0800
Message-Id: <20241126023349.46421-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4b1b5c12-3f81-4004-8eb4-44a9fbcc7223@web.de>
References: <4b1b5c12-3f81-4004-8eb4-44a9fbcc7223@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_183421_370590_88C2E7B3 
X-CRM114-Status: GOOD (  14.04  )
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

Change the OR to AND.
The previous code used OR within parentheses to check for
NON-NULL pointer on one of pipe->dest_ring and pipe->status_ring.
The previous code can not guarantee the pipe->dest_ring pointer
is NON-NULL. When certain errors occur, causing pipe->dest_ring
to be NULL while pipe->status_ring remains NON-NULL ,
the subsequent call to ath11k_ce_rx_buf_enqueue_pipe() will
access the NULL pointer, resulting in a driver crash.
If it is assumed that these two pointers will not become NULL
for any reason , then only need to check pipe->dest_ring is or
not a NULL pointer, and no need to check NULL pointer
on pipe->status_ring.

Signed-off-by: Baichuan Qi <zghbqbc@gmail.com>
---
 drivers/net/wireless/ath/ath11k/ce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index e66e86bdec20..cc9ad014d800 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -324,7 +324,7 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
 	dma_addr_t paddr;
 	int ret = 0;
 
-	if (!(pipe->dest_ring || pipe->status_ring))
+	if (!(pipe->dest_ring && pipe->status_ring))
 		return 0;
 
 	spin_lock_bh(&ab->ce.ce_lock);
-- 
2.34.1


