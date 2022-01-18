Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCE3C433F5
	for <ath11k@archiver.kernel.org>; Tue, 18 Jan 2022 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIH6K+QY6VSFPvX/zHzln8JAUugvaogNS4xKyTo8iHg=; b=0wgFvwhEL2hhlD
	70EA7kVAP08GXmFoRhu2pu1s2BO9cBw7G9iCpcbBpjnO4PnKZc7xs8pcWYYwLHAg4p+X2fzBzKp7G
	1DDxq3RWb9lh4JNUFzR1iwrtqW/U4B3gxgPl1AKN+EeW6Hb38idvAvOBBYZTramvyJvxBW8kp1uNl
	9udNc2Cz4Nxo7SaN2P5UN22+JXetONcdV4GCBceCpxJIyVY9EQ9scVfbWAYR+Yb1EoNxBgRxpEWO+
	7e9N7Na36aY3wtl8WZaJZmQ0XejuXOH6zhh4HBlD4wKN8ARsFQPeSKoHulST79N7o1AigC/8uos63
	Nd+Dfy9XU28xcdKTj4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9eBy-00GvE1-Jk; Tue, 18 Jan 2022 02:25:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eA0-00Gtwu-4r
 for ath11k@lists.infradead.org; Tue, 18 Jan 2022 02:23:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BB4760AD6;
 Tue, 18 Jan 2022 02:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E79EC36AF2;
 Tue, 18 Jan 2022 02:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472627;
 bh=u4HZb+lyWjAaInD5P/fgVFne79KgKZfWz2IcpXa7bmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DqRFNVTJ8a0ZcY85ZUvYGncVdAJz/6WoOZSFb3DNZIRv8GfwD0up1z7XOarjdf8hy
 3Hdt6xuYd4HnU0YAPLUQkGuYM2fb2dTmEvKbU4g9GRmL1GE0OZRUGV0l+nVSDaO2O7
 IP1B1VZsJVeuuB9Y48gKnsoEFN9VkXjz/medj7B9U9GlUFXZi37aU17IyH1vpPSpqH
 N8sKOS5BwW7072IpbgGatYK9fTI4V+F+hDwu22OmY/iaJq89HkFIoc/fz+J+ZS8W5K
 0hLV4mUK80LIqEb3E12eI/2slWiIN7F0sL09yDDqg1354MXBgAzVPhBoETJb1sIAOp
 /XpvthoVWEp5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sriram R <quic_srirrama@quicinc.com>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 079/217] ath11k: Avoid NULL ptr access during
 mgmt tx cleanup
Date: Mon, 17 Jan 2022 21:17:22 -0500
Message-Id: <20220118021940.1942199-79-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182348_366695_DEF403F1 
X-CRM114-Status: GOOD (  13.15  )
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

From: Sriram R <quic_srirrama@quicinc.com>

[ Upstream commit a93789ae541c7d5c1c2a4942013adb6bcc5e2848 ]

Currently 'ar' reference is not added in skb_cb during
WMI mgmt tx. Though this is generally not used during tx completion
callbacks, on interface removal the remaining idr cleanup callback
uses the ar ptr from skb_cb from mgmt txmgmt_idr. Hence
fill them during tx call for proper usage.

Also free the skb which is missing currently in these
callbacks.

Crash_info:

[19282.489476] Unable to handle kernel NULL pointer dereference at virtual address 00000000
[19282.489515] pgd = 91eb8000
[19282.496702] [00000000] *pgd=00000000
[19282.502524] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[19282.783728] PC is at ath11k_mac_vif_txmgmt_idr_remove+0x28/0xd8 [ath11k]
[19282.789170] LR is at idr_for_each+0xa0/0xc8

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3 v2
Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/1637832614-13831-1-git-send-email-quic_srirrama@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 35 +++++++++++++++------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 0a196fb3df9fd..dc9bbaecb28d3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -4930,23 +4931,32 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 	return 0;
 }
 
-int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
+static void ath11k_mac_tx_mgmt_free(struct ath11k *ar, int buf_id)
 {
-	struct sk_buff *msdu = skb;
+	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
-	struct ath11k *ar = ctx;
-	struct ath11k_base *ab = ar->ab;
 
 	spin_lock_bh(&ar->txmgmt_idr_lock);
-	idr_remove(&ar->txmgmt_idr, buf_id);
+	msdu = idr_remove(&ar->txmgmt_idr, buf_id);
 	spin_unlock_bh(&ar->txmgmt_idr_lock);
-	dma_unmap_single(ab->dev, ATH11K_SKB_CB(msdu)->paddr, msdu->len,
+
+	if (!msdu)
+		return;
+
+	dma_unmap_single(ar->ab->dev, ATH11K_SKB_CB(msdu)->paddr, msdu->len,
 			 DMA_TO_DEVICE);
 
 	info = IEEE80211_SKB_CB(msdu);
 	memset(&info->status, 0, sizeof(info->status));
 
 	ieee80211_free_txskb(ar->hw, msdu);
+}
+
+int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
+{
+	struct ath11k *ar = ctx;
+
+	ath11k_mac_tx_mgmt_free(ar, buf_id);
 
 	return 0;
 }
@@ -4955,17 +4965,10 @@ static int ath11k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
 {
 	struct ieee80211_vif *vif = ctx;
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB((struct sk_buff *)skb);
-	struct sk_buff *msdu = skb;
 	struct ath11k *ar = skb_cb->ar;
-	struct ath11k_base *ab = ar->ab;
 
-	if (skb_cb->vif == vif) {
-		spin_lock_bh(&ar->txmgmt_idr_lock);
-		idr_remove(&ar->txmgmt_idr, buf_id);
-		spin_unlock_bh(&ar->txmgmt_idr_lock);
-		dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len,
-				 DMA_TO_DEVICE);
-	}
+	if (skb_cb->vif == vif)
+		ath11k_mac_tx_mgmt_free(ar, buf_id);
 
 	return 0;
 }
@@ -4980,6 +4983,8 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 	int buf_id;
 	int ret;
 
+	ATH11K_SKB_CB(skb)->ar = ar;
+
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
 			   ATH11K_TX_MGMT_NUM_PENDING_MAX, GFP_ATOMIC);
-- 
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
