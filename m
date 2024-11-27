Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2C5D609C1
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoFcqYTJpQSjF6BsiEup/tHDY+g9XJsfXL/ccQA2FU8=; b=igi+VKZyI7QnNysiY0jDfbryJS
	TuLBijzvGsP7WZIrxQsYZr+8CIaWorDXMEYaHwwH/ZXmDN9guuRogcaUjq8TfcKWcVhTkF2hbfirp
	0gxjYXl2Bg/LG/PlUkc03AB/Th1pmGfKiNBaqBWz0WfOoZLTctve5UOxIRqXqqM/mx5F3Ei034/KH
	9LLSDMMaT+D0o2GOWm7uL/P3jU4+5chp+POZS3oLdhlxHk4q710ZpAe3VjYO0pSHpt/o+MFloUcNO
	dFhkWfT2xCSTk9l+LkmL4KJahn8IFzq3jw5BMgwsiRatVz6mO3Okcp0ZtyIBX/DrAoQ3ShRR9viSr
	JLJC7zNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEaq-0000000Cj9T-0Cq4;
	Wed, 27 Nov 2024 09:44:20 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEaX-0000000Cj6e-2aVi
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 09:44:02 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee173d0480so146118a91.0
        for <ath11k@lists.infradead.org>; Wed, 27 Nov 2024 01:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732700640; x=1733305440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoFcqYTJpQSjF6BsiEup/tHDY+g9XJsfXL/ccQA2FU8=;
        b=Y8nPOpoUntQhKy4/Fmi+SpwZCB1qp5OQp6N9MV64/EtU+elUl/iD2DxXeFd6clpdvV
         SzCZRxt9HSJB/red3ZW0ZjEOKB7hG/k2fKbDIKFa3ygE3ZPWIh/thIY6BEx+h2C1HqbZ
         yIOtK1k9J4knXZb4FupsQZa8QVJVqLKOCh13h0c/RwegQv+jSzPLAaaVw//e/pd7wpLz
         KVlom1MCVS7vdOfdRc/6jQ/edFC+LTXRH/eQLU2lgzTO9nUFOLBsrDD6lMcydHoaCU6R
         UJf888CWsDaGINh+XfUuu1nJIvC9iqseq+D0FS+8Q1GGklX1VPS4MLXeHN3RBHd4CHeQ
         np5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732700640; x=1733305440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoFcqYTJpQSjF6BsiEup/tHDY+g9XJsfXL/ccQA2FU8=;
        b=iveX4sffFxOTXYrPd4mc0cUkzOJ3GBxDgBkvAnf2AstIEC/nmIfybyJIZObomO4Z7y
         lFld0RoPbCKdAlERk8delbEnklm7jxQqJ7JmoJhLdzhYB9K19qEFuLrfN0e+547FAAvs
         83nclu0MLUZTIcQH3maMnQCLHwT0undT7UTESDqgvI48xX47lPWw+LQ5yBz7hIKmnKha
         PDwGN/H3ber9cjeCYVz8SoLPJxJNCgtZdLeXbf7Y8D9TWtXYfnKv7t7WBnusT3DCE5EN
         FBDAfRPJzSjvRz2LMlbpDwlE0821+5azVZCzSagaylI2ceChAemK4IKq7vWYr+7kfZ5l
         kk+g==
X-Gm-Message-State: AOJu0Ywy4O16TnQxM9hzTuo4F1u7d2CNDIOyA8mG0GkV2x4IBFET8Cz7
	u0yJdxvC+umrK+ZRB/GhaQg4NYW7bnN/pMMO1f/sroW1BJSayR6o
X-Gm-Gg: ASbGncu7P+43mR7+zAWBaigW62xcQv9126m1oM7Y26yDwpEwK4eE0UlrYZ2/qXpXdTt
	DYg7cm8W0/GAytvrfgvGAlM9T1wGc0p9EIIlK8x6vK/2wjT5LrS3OzfoyMwvXL8I23geT/mPzZ5
	Jj7Au9DMbHSZBRrgHUWogmL0UFSFvPE3mWf4EZXK3bSnnyXLvE+ZKXvMOH1m1MnNW2qVHhRSN8t
	spYYowZuGqIgd+8bvGxtQOCJdR/dWIKyLlenklupzR/LnDGpXnEAguk/Tw=
X-Google-Smtp-Source: AGHT+IF4YBQ5R2ogJZut7ke432SKKHDz7Ixuem5LWStg75TNRXhrr46Ou1TuK+emhmQ7woHGw9l4Eg==
X-Received: by 2002:a17:90b:1b51:b0:2ea:5054:6c44 with SMTP id 98e67ed59e1d1-2ee097e51b4mr3265400a91.31.1732700640197;
        Wed, 27 Nov 2024 01:44:00 -0800 (PST)
Received: from LAPTOP-SQ5KB8RN.lan ([222.249.179.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fa41f7fsm1155250a91.11.2024.11.27.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 01:43:59 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: markus.elfring@web.de
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zghbqbc@gmail.com
Subject: [PATCH v3] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Wed, 27 Nov 2024 17:43:17 +0800
Message-Id: <20241127094317.303815-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a77fe99d-079b-4ef3-a1ce-6aea10256860@web.de>
References: <a77fe99d-079b-4ef3-a1ce-6aea10256860@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_014401_654955_76DF674A 
X-CRM114-Status: GOOD (  12.40  )
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

Fix the NON-NULL check by changing the OR (||) to AND (&&),
ensuring that the function only proceeds when both `dest_ring`
and `status_ring` are NON-NULL.

The current implementation of `ath11k_ce_rx_post_pipe` checks for
NON-NULL of either `dest_ring` or `status_ring` using a
logical OR (||). However, both rings, especially `dest_ring`,
should be ensured to be NON-NULL in this function.
If only one of the rings is valid, such as `dest_ring` is NULL
and `status_ring` is NON-NULL, the subsequent call to
`ath11k_ce_rx_buf_enqueue_pipe()` will access the NULL pointer,
resulting in a driver crash.

Link: https://lore.kernel.org/ath11k/a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de
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


