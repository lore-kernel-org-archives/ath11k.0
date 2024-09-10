Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD10DEDE9AC
	for <ath11k@archiver.kernel.org>; Tue, 10 Sep 2024 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfJ8wb4O4Tq9av+TrYlaEUakefTcKBqU6Pk6HQH4mDE=; b=LuuK+QehQmXX6V43nZXKOQUsLx
	H/NszPXSi+hmtqaYvGhzwim/4uYSfFuDf8+Yb68tu7Szju85X/f1KDJPLBdJt4njj6cKaWx34mJmQ
	Bj3uGyoWid7vlUZ9jJb0AYeTCSw05Mc5umsj1UcsRlm8oaS4Kj4aLXD0z8IYr59rY7bIORclUFAFM
	uJaHwTKs99zQTNCvD3JZtiO3MVtSDAW1gQvdfbuPygNhzYGv0jspcz+Bbyd1c4qM4Uah0IgyaO4Ei
	wDOhaoScO0fujMTYoPphzHka12mH87GsleODOxnpjSpvR4s8sqI3cutwYaxXGN3DDTCYlY4hxpk0c
	z16haekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so4ah-00000006XKm-20VR;
	Tue, 10 Sep 2024 17:23:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so4Zl-00000006WzV-2GJD
	for ath11k@lists.infradead.org;
	Tue, 10 Sep 2024 17:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 246FAA44AEA;
	Tue, 10 Sep 2024 17:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E111C4CEC4;
	Tue, 10 Sep 2024 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725988968;
	bh=Cj+QOyImgiVgaityzLKNeNzJTMHwLD4SZFxnYezKIyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V13Oi17BJDwrBwGAGHBLOV0EE4s8XKIH6XnlfWHcvhnnKPt+JlIbADrokXeWoF8hZ
	 cSxmhtXj+2NuaqBI3bEE3X/0lYtmm730F2syBM9DT67zL/BY4eWzI2S3EuUPIjDlkt
	 16zw071nG02MT7nhAJG/YT4bZs/3mMmMY1hS4v/Rh5voMKfhHjVP2vx1FJc94jBLau
	 Gr1PWcYpSUYqrlOFXFwh3j5Qd3vwM36lqPeWUNPVaKOW5xHLBuFFRyRYjjAHtOCFGw
	 ACGfV4Jr4/NpAbUPNo3+vjwoLasRDWN4vpPq70q4AUFLcVxN6IwAtkR+obfQyCihOY
	 Lj3tCvO6Wkagg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 15/18] Revert "wifi: ath11k: restore country code during resume"
Date: Tue, 10 Sep 2024 13:22:00 -0400
Message-ID: <20240910172214.2415568-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910172214.2415568-1-sashal@kernel.org>
References: <20240910172214.2415568-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_102249_724375_C0A0B891 
X-CRM114-Status: UNSURE (   8.59  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit d3e154d7776ba57ab679fb816fb87b627fba21c9 ]

This reverts commit 7f0343b7b8710436c1e6355c71782d32ada47e0c.

We are going to revert commit 166a490f59ac ("wifi: ath11k: support hibernation"), on
which this commit depends. With that commit reverted, this one is not needed any
more, so revert this commit first.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://patch.msgid.link/20240830073420.5790-2-quic_bqiang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 47554c361963..a14d0c65000a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1009,16 +1009,6 @@ int ath11k_core_resume(struct ath11k_base *ab)
 		return -ETIMEDOUT;
 	}
 
-	if (ab->hw_params.current_cc_support &&
-	    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
-		ret = ath11k_reg_set_cc(ar);
-		if (ret) {
-			ath11k_warn(ab, "failed to set country code during resume: %d\n",
-				    ret);
-			return ret;
-		}
-	}
-
 	ret = ath11k_dp_rx_pktlog_start(ab);
 	if (ret)
 		ath11k_warn(ab, "failed to start rx pktlog during resume: %d\n",
-- 
2.43.0


