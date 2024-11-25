Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37043D3B7D8
	for <ath11k@archiver.kernel.org>; Mon, 25 Nov 2024 05:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ksHQJb34QqtN+KT+UEF2FYuZsjJBthTlyXY3J2CcoiA=; b=syYojkwxc9jZoeMALvS24FMAtC
	OvGqoWse2cPwqi1tXJ5oSJaY7RVkB+vGfKj20aH+Jhfl2XbqSi1T0Nai3rwctv96OgJxV43WnHRAf
	5VKGQeBBFLBaRS7TJ3KbROK8ifuDPbvMAA9CADh9c+Foyi5AuoCLmahFs40FeA5YgdeS/cl7JXF4c
	+10FiwxlcEfpjx7SED27NLUppP0Zdvz3E1pkGED2sheThaEcNT9nFtA3mBqT/n8n2ArXTxvPYe4WP
	+CNw1TE3Q45h1Ah6QqOLMFq1mCtAXWqJRBkIhEhZljZWJGWzfyErG7/zNHdSYHpXkSt3xhTRrb9LR
	FUDz+RBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRLZ-000000074IR-49QR;
	Mon, 25 Nov 2024 05:09:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRLX-000000074Gz-1LnJ
	for ath11k@lists.infradead.org;
	Mon, 25 Nov 2024 05:09:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-724e6c53fe2so2062693b3a.3
        for <ath11k@lists.infradead.org>; Sun, 24 Nov 2024 21:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732511354; x=1733116154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ksHQJb34QqtN+KT+UEF2FYuZsjJBthTlyXY3J2CcoiA=;
        b=HTkN3cyqNhI2/SmrD4BLv8o542DOMk+rrnU90pmU5AAtOumEz0opal9TCrDQXckx+p
         rXS75SPl/CMBIfazBNguBhI6H5sb1p2JDtHh3GZqcZVgCCh5tz5qyUJwmT424rWdMZ1q
         IqoycxpUKTeR5JmuRf5xgj7egkDQNXUhnVQZpUn0aHsA3lUw8cJS005Aglzy3TgMghjb
         os0h9eYvbwiJ7SVYSf4UgDLXtk+3Vj8Ze9G7lCR9nTOjaaFK2z8Jc4e62ha5mKOoJYwC
         cFZGy0a6LMe4NAIbqDvngv6TvHSZPkrCKfNR8c5FkvPRiwoXnUMq6fskiG69iAaCAmqs
         GE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732511354; x=1733116154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksHQJb34QqtN+KT+UEF2FYuZsjJBthTlyXY3J2CcoiA=;
        b=pENDyLW49+ybidVZ3GCZze0ZBElV570IRTg3DhwMe1GEk+UFjPFngPiYsvPIggneRQ
         FzJPIGgR87IqGeWxuVKE9lrfYsX+8TMan/k8j91l9I7ZYN9LsBYtn0YUKD3GsLe8fIwM
         UkO1YntwJC3T/i6PpdeykJ2HujomiEq+9kdPvFu3BEMw6YY7cVCFqdfTukyjB6AcqKjq
         Fheh7m8yl5QpPTJVw5xhE/xq0lKfvhq32MhwB2K9zg/Gp3yVVuLj1wIhxMQRxbPJcvjo
         zY3OiBziA0grML7v2VW5Jtk5aqcMfRuV67PrbrAjwI9t+LxWCnd53WaFy33l5bJcUEn4
         y+ug==
X-Forwarded-Encrypted: i=1; AJvYcCVStHhD/KjoBKKyygXbgfx4cEDW0OormpdX9z6dH631Uc7cWJviPxsXLXdjsWXDnMjJq+HSkew=@lists.infradead.org
X-Gm-Message-State: AOJu0Yww2UUXQGAbT5/onlKqyzVH/ykW5LoDS63I7PmBIUt7/w4pzJ9N
	H4+zc+T/ETmQ86ViKshNyKgB3TdisvgxWJccUyjGUfrd5gnwtseyA+C6HAIPYv40/Xc6
X-Gm-Gg: ASbGncs0CRTKnidFe1IpbwfjlcUK2QKy7ZuVPPEZWaVFy5W1yrr3Jt+qj4rv4jXlBQq
	FFvfLmk/VgVANin7zSnetsFbGGqm/wh+hY/VBy5ursQQ2mYfdOgo4dwQu9f8p7K/GsUUr5bNVk1
	1OAPhZD86IrxLTkAibB+X3chSvh70mV2oQUtJim7eJOral3Elr/PMHL0qh2ZEeS5hcrLrhXZ12y
	4DE/PjXGoCG3xGwA9H5Z0+E/62xFSN/Pi6+prP9ERBnLOEqZSYdFvn/WeM=
X-Google-Smtp-Source: AGHT+IG63PxHo5iTotrnTrhDmCs9a973/JWeKIYwPi+EO97WB1upfgy+iNKydb5IhZi+y2Qjw7diaA==
X-Received: by 2002:a17:902:da81:b0:20c:ee32:759f with SMTP id d9443c01a7336-2129f680ca4mr157420345ad.39.1732511353664;
        Sun, 24 Nov 2024 21:09:13 -0800 (PST)
Received: from LAPTOP-SQ5KB8RN.lan ([222.249.179.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc21a1asm55071445ad.222.2024.11.24.21.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 21:09:12 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: kvalo@kernel.org
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baichuan Qi <zghbqbc@gmail.com>
Subject: [PATCH] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Mon, 25 Nov 2024 13:08:21 +0800
Message-Id: <20241125050821.149898-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_210915_355749_2A5CB09C 
X-CRM114-Status: GOOD (  12.25  )
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

The previous code used OR for NULL pointer check, whitch can not
guarantee the pipe->dest_ring pointer is NON-NULL. When certain
errors occur, causing pipe->dest_ring to be NULL while
pipe->status_ring remains NON-NULL, the subsequent call to
ath11k_ce_rx_buf_enqueue_pipe() will access the NULL pointer,
resulting in a driver crash.
If it is assumed that these two pointers will not become NULL
for any reason, then only need to check pipe->dest_ring is or
not a NULL pointer, and no need to check NULL pointer on
pipe->status_ring.

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


