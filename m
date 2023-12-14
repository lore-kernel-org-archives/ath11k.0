Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C40C4332F
	for <ath11k@archiver.kernel.org>; Thu, 14 Dec 2023 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hz1+YMRAstdv5EgbChlbxOov2x2Um/C96q0K55+WKRg=; b=xIMF5o714k3OFQNQhKExEBo1ze
	V8G1pLkY9JxnENWunKLgX7L7FMLWjEAXcdkhWEUi9BCso01UxbaireCxqHWaY2VDCxqieR31Pajur
	kMouYnkhpFYf69DLcttX+xovdrh1V2sfj+mWrtnmDH8nraTcEhmNUmu8ay1DM4mF7TuH7aJDxDQSL
	4RR9eD+9jFi5UK9H3SGOy8+x0q6xpL4MIztI6tOYN0gZFO9s3C5Kl4CUNTygnKAODmFrRH92VJIrq
	PxVwJiGrkSTljRGiNjQsuZ2FspLQ4kdBzqgDTyjPc7jm1MCf3TA/f7O46UVUhUbz7jiOsB3DNU68B
	+yYqNYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDoPG-000mOs-1r;
	Thu, 14 Dec 2023 16:17:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDoPD-000mOS-0x
	for ath11k@lists.infradead.org;
	Thu, 14 Dec 2023 16:17:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 50D68CE1F08
	for <ath11k@lists.infradead.org>; Thu, 14 Dec 2023 16:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A57C433C8;
	Thu, 14 Dec 2023 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702570664;
	bh=HK2BDsbsHED2loV2Pn+V2u8GAyC11wNlFeiJkuRxH6U=;
	h=From:To:Cc:Subject:Date:From;
	b=LV6roAwc0lWjnq+YxsLp4q3/4VyNnCZ13UP7MKvqXOm//3zZvGKp4MnRCLuNdCwfS
	 UiLWF61E7BN2KwkduWgwY040wbmcULQawvK0bLsQmHX9392QFOtzbS7gvR8cews22G
	 almDKa1VZW7Agkt0KXhlkETgfVvyRsa5k7L29vSLSjJWXvUHn3khz4Rrpt3vwnIYrk
	 bNx79nVbr0V73gku6wv06RoQ5nCQPxQ3IfgExtui/zlaumIYdeVTScY8JtRzJ4CPV6
	 Q8ksQlgLPY0cGBgH4LEhrvixwOJpeptUocu+8Gd1yaEjpUt2/wBLYvUlpAlzjIGueq
	 uOKv9htCb36Fg==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: workaround too long expansion sparse warnings
Date: Thu, 14 Dec 2023 18:17:40 +0200
Message-Id: <20231214161740.1582340-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_081747_557854_A9BDDBEC 
X-CRM114-Status: UNSURE (   9.23  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

In v6.7-rc1 sparse warns:

drivers/net/wireless/ath/ath11k/mac.c:4702:15: error: too long token expansion
drivers/net/wireless/ath/ath11k/mac.c:4702:15: error: too long token expansion
drivers/net/wireless/ath/ath11k/mac.c:8393:23: error: too long token expansion
drivers/net/wireless/ath/ath11k/mac.c:8393:23: error: too long token expansion

Workaround the warnings by refactoring the code to a new function, which also
reduces code duplication. And in the new function use max3() to make the code
more readable.

No functional changes, compile tested only.

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 7f7b39817773..db241589424d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4654,6 +4654,14 @@ static int ath11k_station_disassoc(struct ath11k *ar,
 	return 0;
 }
 
+static u32 ath11k_mac_max_nss(const u8 *ht_mcs_mask, const u16 *vht_mcs_mask,
+			      const u16 *he_mcs_mask)
+{
+	return max3(ath11k_mac_max_ht_nss(ht_mcs_mask),
+		    ath11k_mac_max_vht_nss(vht_mcs_mask),
+		    ath11k_mac_max_he_nss(he_mcs_mask));
+}
+
 static void ath11k_sta_rc_update_wk(struct work_struct *wk)
 {
 	struct ath11k *ar;
@@ -4699,9 +4707,7 @@ static void ath11k_sta_rc_update_wk(struct work_struct *wk)
 	mutex_lock(&ar->conf_mutex);
 
 	nss = max_t(u32, 1, nss);
-	nss = min(nss, max(max(ath11k_mac_max_ht_nss(ht_mcs_mask),
-			       ath11k_mac_max_vht_nss(vht_mcs_mask)),
-			   ath11k_mac_max_he_nss(he_mcs_mask)));
+	nss = min(nss, ath11k_mac_max_nss(ht_mcs_mask, vht_mcs_mask, he_mcs_mask));
 
 	if (changed & IEEE80211_RC_BW_CHANGED) {
 		/* Get the peer phymode */
@@ -8391,9 +8397,7 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 			ath11k_warn(ar->ab,
 				    "could not update fixed rate settings to all peers due to mcs/nss incompatibility\n");
 		nss = min_t(u32, ar->num_tx_chains,
-			    max(max(ath11k_mac_max_ht_nss(ht_mcs_mask),
-				    ath11k_mac_max_vht_nss(vht_mcs_mask)),
-				ath11k_mac_max_he_nss(he_mcs_mask)));
+			    ath11k_mac_max_nss(ht_mcs_mask, vht_mcs_mask, he_mcs_mask));
 
 		/* If multiple rates across different preambles are given
 		 * we can reconfigure this info with all peers using PEER_ASSOC

base-commit: e0d94824fa388d81bb1f27e9486cb2d0f6fee3fb
-- 
2.39.2


