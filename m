Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D316ED66BB0
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 03:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNFL0BV7Mb4x6Fh0ZaK/xjfKcHVlGKbOO70Q78B2CSM=; b=fw2xFyqCD2btD0dANjrXhcE8CM
	nb9TEJUzzceEcgvLYLKlB28M3MOP5PcHqswv15PTnhuaBKFUVedkhhxwlMjIMJ8f7h1VxDJbDd2ab
	DcGemxAeJkjPd9DPv2gQkYdteo082RtZjZPv1y6fy56p6h86fRPfL7EEmuoIaDaPvC0hIOyuCGAuD
	MVa8LMpvUOS75O0NEpWAtJVfsiPfZP2ycXVwg8uD/tTJSJRAj+BOmywkDsBAxwLYIET054mmMrKkF
	3AoPyZ2BlWI5yxzBqJNC+b7HXJaHT5ReaKJUa1eggWJv5Ew6sFc7dt6ZDTLXnOX2R3TEVwHkSOSSR
	ax25+A+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG8np-0000000C9qx-1ZCJ;
	Wed, 27 Nov 2024 03:33:21 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG8nn-0000000C9qa-0ZWa
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 03:33:20 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7fc2b84bc60so2200112a12.1
        for <ath11k@lists.infradead.org>; Tue, 26 Nov 2024 19:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732678398; x=1733283198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNFL0BV7Mb4x6Fh0ZaK/xjfKcHVlGKbOO70Q78B2CSM=;
        b=M9cioX19R5iA1Pf3408moYfsftnEJo4qmgwqcWhaJ8lDgMIxf9MMzp/+BFAHiY9fFs
         3Z+McSbmI0rIeP5FFCA7+k9YP8QQ7igxgJ9T7xeEYrI7tnE+gKDBz54E3PfDH1nQE6v0
         R0EiZYsC218cHYZ6C4TU/w1jK2+Ub1SS+5fAEakNbiLoT6vAczn8eO4MDD0jCjxfb4hv
         Dz6Jp35VK2MMcN2m9mk2UdqeF+OBfLQGurrYuPV0vuFxvLD+j8yflmA6aF4DuB8RKQCp
         2Ty0j4LBkVX4M4/C5gQP3ck4ZYe6unNYkOei+6CKIlbIAH/rrc+KOf36m4dAdgfabtPC
         jizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732678398; x=1733283198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNFL0BV7Mb4x6Fh0ZaK/xjfKcHVlGKbOO70Q78B2CSM=;
        b=vzKKvEw0kbC6gdFrX0/hNf6ehn8QkT2Uj4DAgWYUaZFDZAZJPOEkeD9oTr0/n1Z7s4
         PF1tBvA9KAcatuGLEmh1414bh4INzPuRsUJp8u8JaVNOKxRP9Z3JbvbJI99A/jyHkao1
         DYR50XeLsPaGZ2pzlVUG/kFv1PN7UysOYrx25egV+2iUwvnyywP7Nj1DRN6OOF8mpOns
         4EsXKw8DpXSSIcRLQZFwifJ1QPNMVvZiRD4uQ68CgiQlqDjY2+U0BSvvU8Wzz5GKhUgn
         GkRy/W++4k721dtHjpFgW2I1VZNyEYtKNUBTZNaMTJ9JXvcXonZzPXUBw7J/c/4M7FpD
         rt2w==
X-Gm-Message-State: AOJu0Yw5xIlUbEqSSeBszvEHqMO+AsgalDOOJn/2zxZWvX8f0ZcedBPW
	+U07pCcohEb8RRj7ugpUVMfS6eYf5dai04rTQyG5XiX+qkDGpwPTWCBSZZefydw=
X-Gm-Gg: ASbGncsUasejf26KY2QvoSeTfua2yIeKsNlDloRZt+xu1Nt9oZNizKZqXp4MUgsUZe+
	WoO8/WSj/EG2WbqQY1G63e/LeL+JlrAg9YEAh+u9wue60Y8d4Hi0Sdqp8l1GIV0a5lSS1vHjVi3
	y/rEZF2dzugo5t3Vs4/YIk126z4gN9uEYi9Wmq+jkNvr29d/nOq1jqt7+g9dl/hehtC3a8cGi7V
	OSsPvMiZFP6LvvC/esoyO3iqE5Xu/wWq5GhYwhnFSWrZygRUr7lcpsPwEA=
X-Google-Smtp-Source: AGHT+IF9h1tM8BSdg93H0W+/CAgEXZ1IPcpLB/cuUojd4Nyan4flXiS5rwt4tMHeQhfpdoI8SqUjtQ==
X-Received: by 2002:a05:6a20:3945:b0:1e0:cc01:43e4 with SMTP id adf61e73a8af0-1e0e0b12154mr2723008637.27.1732678397396;
        Tue, 26 Nov 2024 19:33:17 -0800 (PST)
Received: from LAPTOP-SQ5KB8RN.lan ([222.249.179.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47e941sm9168699b3a.78.2024.11.26.19.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 19:33:16 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: markus.elfring@web.de
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zghbqbc@gmail.com
Subject: [PATCH v2 1/1] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Wed, 27 Nov 2024 11:32:41 +0800
Message-Id: <20241127033241.60478-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de>
References: <a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_193319_170842_EC28B00B 
X-CRM114-Status: GOOD (  13.01  )
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

This patch fixes the NON-NULL check by changing the OR (||)
to AND (&&), ensuring that the function only proceeds
when both `dest_ring` and `status_ring` are NON-NULL.

The current implementation of `ath11k_ce_rx_post_pipe` checks for
NON-NULL of either `dest_ring` or `status_ring` using a
logical OR (||). However, both rings, especially `dest_ring`,
should be ensured to be NON-NULL in this function.
If only one of the rings is valid, such as `dest_ring` is NULL
and `status_ring` is NON-NULL, the subsequent call to
`ath11k_ce_rx_buf_enqueue_pipe()` will access the NULL pointer,
resulting in a driver crash.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
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


