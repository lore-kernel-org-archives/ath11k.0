Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B307C433EF
	for <ath11k@archiver.kernel.org>; Tue, 18 Jan 2022 02:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ym3BQzeiqvQD1WMWPI364ncbvWghN/nJb34DWRpIiVI=; b=t4a0yPT/U5lHTo
	cH12eMvFvEAUTYlLbCsKRYMcIMnqIoL4oX+0tPNpAwO2PDD3gfAvEMp2xwnWKCtj9Lz9YQRRT3MCn
	WWrIfsqpLB8I0+Mbe3zGmS0nMBBAcpJrM4x++SEFN+5lNf3S27Dedw5PtPnfOPDuXK5g3zn+5ynPK
	5tfhX4q9WIK0OZE0QVcHVczI7KRWhQkPSnly6y/8xpakZHNENxYeF2NZA3mf+e4Gqo7dYvO+84v3U
	eQhWKCw/I1/aP3jToLjx2bClxIbxc6BRBmwlo3sE6VeXyWu3oXs7MqCuvQ7FpVE0PXLDFkotECKPO
	I6eVnIVzFlWvkkpNQKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9e9j-00Gtmj-Jn; Tue, 18 Jan 2022 02:23:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9e9A-00GtQP-Da
 for ath11k@lists.infradead.org; Tue, 18 Jan 2022 02:22:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3BDC60AFA;
 Tue, 18 Jan 2022 02:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8982CC36AF3;
 Tue, 18 Jan 2022 02:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472575;
 bh=rgstYFf8hJAZN1nCGJnttGKltvu+7dKK7FEZnsJpvbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mIyYZ169DicBzkRx/GXxWMH5Br/CckeiwNZ+Sr27N195r65M1iJNPTxQ7K1FyxjTq
 vb5KEIhF/eK0igHUIsTaETF5Bwa+GD4xW4KfYkLg/6xST+hnoEtziHSlMMh7eOq5yA
 G6EqjNaEAM8NJp2GO7AO6KGLVI+TdZNHRfjpnJiUhBUJJnXfaalfIz54O+ywFGnUgj
 ZpFvfz83BjgH3XWzQbq+H3ptdunY4kaEnmKGQBsGP0435QBIQFqupfZbBkRkoPd2Gh
 ado/go28tgIT+FFVDXUzKvbWq8tgVC+tjwU+s32z/pO5ijcPM9T62sWNVXdS7Z/MYt
 27obUWmZsMojQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Anilkumar Kolli <akolli@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 059/217] ath11k: Fix mon status ring rx tlv
 processing
Date: Mon, 17 Jan 2022 21:17:02 -0500
Message-Id: <20220118021940.1942199-59-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182256_650048_34941B3A 
X-CRM114-Status: GOOD (  10.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Anilkumar Kolli <akolli@codeaurora.org>

[ Upstream commit 09f16f7390f302937409738d6cb6ce99b265f455 ]

In HE monitor capture, HAL_TLV_STATUS_PPDU_DONE is received
on processing multiple skb. Do not clear the ppdu_info
till the HAL_TLV_STATUS_PPDU_DONE is received.

This fixes below warning and packet drops in monitor mode.
 "Rate marked as an HE rate but data is invalid: MCS: 6, NSS: 0"
 WARNING: at
 PC is at ieee80211_rx_napi+0x624/0x840 [mac80211]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01693-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/1637249433-10316-1-git-send-email-akolli@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c5320847b80a7..f7968aefaabc5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3064,10 +3064,10 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	if (!num_buffs_reaped)
 		goto exit;
 
-	while ((skb = __skb_dequeue(&skb_list))) {
-		memset(&ppdu_info, 0, sizeof(ppdu_info));
-		ppdu_info.peer_id = HAL_INVALID_PEERID;
+	memset(&ppdu_info, 0, sizeof(ppdu_info));
+	ppdu_info.peer_id = HAL_INVALID_PEERID;
 
+	while ((skb = __skb_dequeue(&skb_list))) {
 		if (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar)) {
 			log_type = ATH11K_PKTLOG_TYPE_LITE_RX;
 			rx_buf_sz = DP_RX_BUFFER_SIZE_LITE;
@@ -3095,10 +3095,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 			ath11k_dbg(ab, ATH11K_DBG_DATA,
 				   "failed to find the peer with peer_id %d\n",
 				   ppdu_info.peer_id);
-			spin_unlock_bh(&ab->base_lock);
-			rcu_read_unlock();
-			dev_kfree_skb_any(skb);
-			continue;
+			goto next_skb;
 		}
 
 		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
@@ -3107,10 +3104,13 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
+next_skb:
 		spin_unlock_bh(&ab->base_lock);
 		rcu_read_unlock();
 
 		dev_kfree_skb_any(skb);
+		memset(&ppdu_info, 0, sizeof(ppdu_info));
+		ppdu_info.peer_id = HAL_INVALID_PEERID;
 	}
 exit:
 	return num_buffs_reaped;
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
