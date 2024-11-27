Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FEBD6ACC2
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxSbLAHRSVlRsq/cq4uSZcTsBky57XnC1dO2nem3UBA=; b=47f6n0G0QE8s+uFqF8smvW0loG
	mr9QhZh+diUrFcITTgjMGmhMwGSUKvro0GJtliTUwJ0qFoQtaYP84POjMTMcmLr5ZKn3JSvew3N13
	bNcmRVhrOntu0HQbtdLJmyPFsv0K+p4wpwZaqY/8LXc4Gi1dwaImOUdb0SujgRsPcIh5JY+JFu3Zb
	aAhmF1dD/4jSMgN6mRczYChWmXcx7i3JyhVK+4GaQEmnl9CSzUu2SqWwxGe9eRpVAA3TG3sYt61em
	GSeTUoOv8u1ejnoIupuNhLrLpx+dtOzx9elsL2IouqkgP18+d84DJYbqa+A7A2mPDA9URsvqCCrBW
	FyrUoISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGSW-0000000D2X9-3fAq;
	Wed, 27 Nov 2024 11:43:52 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGGSU-0000000D2Wl-2vMu
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 11:43:51 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ea49a1b4c8so5229167a91.2
        for <ath11k@lists.infradead.org>; Wed, 27 Nov 2024 03:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732707830; x=1733312630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxSbLAHRSVlRsq/cq4uSZcTsBky57XnC1dO2nem3UBA=;
        b=lZ5cZ+sWp2EmJSyjrl0JZbenjk+C+Nx2whGVwTfcJ0QJGz4Nm21M2qHwfv4TW0jedu
         6hvlJXkFC9XrOxiRrWnXUi70Vk8bwfqmZQ1kGkngftlf3mCViXQK4zdMqb/MpAqTB2NC
         kxD7bdnq2B5YJAf/a92CLxF11I0cH4ESGiV6j0Y1vmwY9bFiAr/ACxOe+ENcMuY4ldDA
         d3A7rboDbptFMieRKwtZo02MD1AoOTdf+n1742VTru/pZ53uTHmFUaIlU3iv0Fgle2jZ
         FltAIRrpDafUyIKBb1qS60ttRC6b9jdsrmSD8RkeUc4sUE2995sy+kzWDdauQG5MA/pn
         GDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732707830; x=1733312630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxSbLAHRSVlRsq/cq4uSZcTsBky57XnC1dO2nem3UBA=;
        b=wTMDplVbfszqBYeN4xCzQ1hKutOVjjtDN+9fNN9pDIbOcLkgKfrzrJebZIbddjw3tD
         XP3OUTc1J3G+BiASLRz0fnr9lmLxkSVyjCyAXbqkVqAsK2XSWF8wl9bedc3aZrgPhoYn
         +lAo2dL1i6r2lRbZ8FOcQhjOTZJbBsoRSCS01niVn6MlKDm4tVibJYuboQ7XanF/uNwg
         FP4woAD42FCYHIhNGBiSkdDXB+iXTnSoT2zwuCCK2IqfyvI8oWQGAa/Iz1Ftvm7OsOyX
         +UWzhrr6zVgty6eIi2/00ceXi9TMN2VUpIt2ARxu0DKEKcl6409ywWcZl0wd3qqiXy7G
         myUw==
X-Gm-Message-State: AOJu0YyGSoLCn90rx4YW1eTIpzFkenX6Rtvd+58jj3nlGQJdNaD5SrCp
	u1LgH9DyCQt1arIFvN5Qblhgr7ywqDkk2SAP3YGj02OAMGajnS0IORLRIbw1OJw1QA==
X-Gm-Gg: ASbGncvVMDfd2YMeeOQMioWtHB7fiCHA3UCMX3kUIloXmQAMoQOfEquuoKdE3kZougr
	G30k6kskdCjgeKIXsJSucvnTnnLesh1RXLCO566EOBWOEerOUFu1KZn6L1xqIYvWuGtSu7zDH0L
	WXr2O/1oWXBZkXhFtdrFHjPj2rlJdkTzVH0/HqYQkC3uXxY+8IFEm2fxzZeyWEAxAiGY2GZD6vP
	DBVUnBkZc4i74x6OR4x6PKmiERHxybh7eNmvLiP4Z86tjyzETJFNx8gQ4A=
X-Google-Smtp-Source: AGHT+IELFrmOn3UMip8RyR2/J8mMZUZh/mRNybF/pjN095lAFdf3BfbRFYSu/uLilRm80EzueWBlNA==
X-Received: by 2002:a17:90b:2b47:b0:2ea:5c01:c1a3 with SMTP id 98e67ed59e1d1-2ee08daf0a4mr3851522a91.0.1732707829275;
        Wed, 27 Nov 2024 03:43:49 -0800 (PST)
Received: from localhost.localdomain ([223.72.121.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee0fab815csm1277113a91.48.2024.11.27.03.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:43:48 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: markus.elfring@web.de
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zghbqbc@gmail.com
Subject: [PATCH v4] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Wed, 27 Nov 2024 19:43:10 +0800
Message-Id: <20241127114310.26085-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <64d7fa52-b96c-4bff-b90c-98f0b1d15ac5@web.de>
References: <64d7fa52-b96c-4bff-b90c-98f0b1d15ac5@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_034350_734342_AD554895 
X-CRM114-Status: GOOD (  12.34  )
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

Current implementation of `ath11k_ce_rx_post_pipe()` checks for
NON-NULL of either `dest_ring` or `status_ring` using an OR (||).
Both rings, especially `dest_ring`, should be ensured to be
NON-NULL in this function.

If only one of the rings is valid, such as `dest_ring` is NULL
and `status_ring` is NON-NULL, the OR (||) check would not stop
`ath11k_ce_rx_post_pipe()`, the subsequent call to
`ath11k_ce_rx_buf_enqueue_pipe()` will access the NULL pointer,
resulting in a driver crash.

Fix the NON-NULL check by changing the OR (||) to AND (&&),
ensuring that the function only proceeds when both `dest_ring`
and `status_ring` are NON-NULL.

Link: https://lore.kernel.org/ath11k/a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de
Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baichuan Qi <zghbqbc@gmail.com>
---
V3 -> V4: reorder describe info
V2 -> V3: add Link URL to mailing list archives
V1 -> V2: rewrite commit message and fix tag

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


