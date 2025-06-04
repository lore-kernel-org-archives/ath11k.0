Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE2CC61CE7
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP/Nzb/Y+fi5ABFCx2PtMaZEttg9EJ7IttVQZS9CaJ8=; b=sxSF9dXlSLnAWUqDhq64mmVy6z
	3hWN7m6ZpVhj+3T+gvTLKAHtnQGFxunEqKP1Rdw+1/gO+EnBiblF/MK7FwBbABk/9LN65DSUJosIs
	zlBvwTPjO6hU4xJvbYIThGDwgzvswfQfImtxh+KpzDGllelj69jtfLjAo8SsxcnYOxI5FwpuwQImh
	tYEKg71FoRFkEedwRFiSVQK92Z/svy80ErMc6gOC9TOY5GWc4DJL7zbtTxeICtmzDw4hZeKDxCb7j
	hN8etCRsb9jEeJ/VwKOhzA3DJs+fVvWVTcY7+Twxk6FMc+Zkqdh/lo2delsL9Jau02b4clTEg0EXp
	z2/thHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpFk-0000000Datr-3sEj;
	Wed, 04 Jun 2025 14:38:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMpDw-0000000Dab0-3Kgd
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 14:36:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 066CC6112A;
	Wed,  4 Jun 2025 14:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB22BC4CEE7;
	Wed,  4 Jun 2025 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749047771;
	bh=/zzi6edlAiK18uDL8yHhaQ7i1Hb+UhqE68J4prJl4Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qdBENElcS8mRW39RzMtwzygdmcDwxPfh6UUJ7n5r6Dteh2mdRalIvLpn1XjoGw0yx
	 MP4KwJ+tcd/6z1Kk64pnImRMJ5dqyo0NR9u2CrmFRx3gq4h37QPShCsc6eH2DVrqD5
	 U3JfpI6e4cs7Lw76MRQZLSGd1+BDVrZfDuOVBpt653pN3nNIpoZXSPKjl2+MkXTnsw
	 /ZfoTSqzxs9ffrX722j0GIrjUwr6tpMMhSjbuVPLIW+WJEyCfAHiQRKyC/cla/5HYh
	 AiAoR1v3vXNz+6IwNdyAfOPbBqE+DA/30TVG4ML8ToqgSUXLKp4/lXMIaWf6+B+Uak
	 SQ+Tq3wvzXbQA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uMpDt-000000006nK-2oE5;
	Wed, 04 Jun 2025 16:36:09 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Baochen Qiang <quic_bqiang@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 2/5] wifi: ath11k: use plain access for descriptor length
Date: Wed,  4 Jun 2025 16:34:54 +0200
Message-ID: <20250604143457.26032-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143457.26032-1-johan+linaro@kernel.org>
References: <20250604143457.26032-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The read memory barrier added by commit 6d037a372f81 ("wifi: ath11k: fix
ring-buffer corruption") is enough to guarantee ordering also for plain
descriptor accesses if the length helper is ever inlined so drop the
unnecessary READ_ONCE().

Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/hal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 921114686ba3..b1f5a927dddd 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -599,7 +599,7 @@ u32 ath11k_hal_ce_dst_status_get_length(void *buf)
 	struct hal_ce_srng_dst_status_desc *desc = buf;
 	u32 len;
 
-	len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, READ_ONCE(desc->flags));
+	len = FIELD_GET(HAL_CE_DST_STATUS_DESC_FLAGS_LEN, desc->flags);
 	desc->flags &= ~HAL_CE_DST_STATUS_DESC_FLAGS_LEN;
 
 	return len;
-- 
2.49.0


