Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C637C433EF
	for <ath11k@archiver.kernel.org>; Tue, 18 Jan 2022 02:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXdjjmsFK5+qHveadiefJzDIqlC2ZBFXYOw0wZo1D3U=; b=RKJKYDbxq5Di2N
	jlm2/LZSrfX2FbZXLldHLjVAMLoXpceBAjf9KspKFJFoGUTw920cQkcjQoZLC13qzTohRrwE2lzWg
	lT+nF1vsILU5hYuTVpIRREpo93H9qMgFs6dhZJt7JnEipRYbA6ttVFbbtQIAHsCPQtxEyem+keity
	0242i2cyZj1hTOJZhwiNcdbXzW6EXsnFL0EzKtgszwMej45u3MntTXPX8GqoaRGTZUUQKONf3YUqq
	Q/t3HFgXhYHKfgTNBQ+XWoWoLv8LK6TxJPPOk9qbR+Lj5PionBQl5XZoocT/Mei4GD1uLirIeXNdo
	Hgghpsb2BETGE82J5Hrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9ecU-00H9f1-TG; Tue, 18 Jan 2022 02:53:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eL6-00H0CV-Vp
 for ath11k@lists.infradead.org; Tue, 18 Jan 2022 02:35:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DE266120D;
 Tue, 18 Jan 2022 02:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10D3C36AF6;
 Tue, 18 Jan 2022 02:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473315;
 bh=BeaWnZ5j1Bke+EBbtqE3BLQl4drzIXo45ihMaFWjRuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aXIvdVG/1WapSh0NdgJ+iVd+sf2+L3S8CUQFazTtLjBqbtF6OPRjmscrSKBFPRF4p
 xiV08kDOCPXGNsiew/Dlin222xzlqAo7XfTLqFu/OMLNwvhkLN1OQNFibegD5NIW/X
 9dOKeQqzaH80LniMbxPjFyUiz8JIrbbgcEmX+8eEToCIYjvn/8aAUorMp04l7tpHbu
 fUsmrcQfcSn8QFIotqdmYYA04gvbDCAzB3WoRUOp0nhifkg3x02akAbZAZOVULtH3K
 BCBLGYsqmGhUIeKYXZsLWU9KMTy+Li5y6nrI+s2i4s0sa0IpZFyS/F5XwPwv6EeueS
 dbrb4IQbTLypg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sriram R <quic_srirrama@quicinc.com>, Kalle Valo <kvalo@codeaurora.org>,
 Sasha Levin <sashal@kernel.org>, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 067/188] ath11k: Avoid NULL ptr access during
 mgmt tx cleanup
Date: Mon, 17 Jan 2022 21:29:51 -0500
Message-Id: <20220118023152.1948105-67-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_183517_220439_E0886B71 
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
index 89a64ebd620f3..8ea851013bb7a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -4131,23 +4132,32 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
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
@@ -4156,17 +4166,10 @@ static int ath11k_mac_vif_txmgmt_idr_remove(int buf_id, void *skb, void *ctx)
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
@@ -4181,6 +4184,8 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
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
