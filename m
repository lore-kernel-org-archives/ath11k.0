Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12F4C433EF
	for <ath11k@archiver.kernel.org>; Wed,  2 Feb 2022 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5jubJ6Wi4DEv6FCm3j8RkLLABqsVEB9MKkw00PnIWv4=; b=XosawTotfFjhKf
	Ofi2LKPFPa4C9m7gbVefTpz96OLWpy8nQ5DzcGuJFGC8xBMFE/OHltnFXIpD4KTyFPMfvF53jR3Fc
	5HAWTI1JUqNTMn3VQiZ056NKaI/05ZiHHM2F8q/JCMn4d1lZe61w306BfzyKz2inpbLnxrFv77NR1
	ykNVAmNwafE3CuRfGN3QCL8HEv0JKJ5voRGv1ihdkL+J8cFZwM23qZzusqig0pugu9ot1qcfxPc3l
	ETMb01xfNfbkXP6UnWBoYJgbu2xAwA+73fC4N298UTedogHuHJRxVX4Uk7Zh6/xEaGMMuquyqcMAF
	1OWBAwj6mWcdz3Qr4bUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFA92-00EQiI-5A; Wed, 02 Feb 2022 07:33:36 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFA8x-00EQho-Lz
 for ath11k@lists.infradead.org; Wed, 02 Feb 2022 07:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643787211; x=1675323211;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=FTXDRbTmx1LBXmv3ILEGwcd7kKZyo0g/Dx/kt/u/gGY=;
 b=LiQoiFpwT+ikm726UNzXHMG9D4B0BXeaLuAhSjkit7cahPBlO9bRZm4s
 HlNKDSvsxK3zXz2LU5RXhMKSIpVe0JsWC5+bzTM4sQSzU8Vm1p6e91hFm
 Md0XV+6R2QV32Fy/rNtr+fBy/+wzqXzEHkJYCb2WZ+KXNVjT6YiwXhq9P c=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Feb 2022 23:33:28 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 23:33:28 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 1 Feb 2022 23:33:28 -0800
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 1 Feb 2022 23:33:26 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>
Subject: [PATCH v3] ath11k: Add peer rhash table support
Date: Wed, 2 Feb 2022 13:03:14 +0530
Message-ID: <1643787194-31355-1-git-send-email-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_233331_824994_B19C9833 
X-CRM114-Status: GOOD (  23.67  )
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

When more clients (128) are connected, the UL data traffic
KPI measurement is low compared to single client. This issue
is due to more CPU cycles spent on the peer lookup operation
with more clients. So reduce the peer lookup operation by
modifying the linear based lookup operation into the rhash
based lookup operation. This improve the peak throughput
measurement. Since this is a software algorithm change, it is
applicable for all the platforms.

TCP UL 128 Clients test case Observation (64bit system):
Previous: ~550 Mbps
Now	: ~860 Mbps

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 v3:
   - Fix "sleeping function called from invalid context" by
     replacing atomic lock by mutex lock in tbl write operation
 v2:
   - Rebase on ToT

 drivers/net/wireless/ath/ath11k/core.c |   1 +
 drivers/net/wireless/ath/ath11k/core.h |  14 ++
 drivers/net/wireless/ath/ath11k/mac.c  |  14 ++
 drivers/net/wireless/ath/ath11k/peer.c | 344 +++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/peer.h |  10 +-
 5 files changed, 361 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7c508e9..1566247 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1435,6 +1435,7 @@ struct ath11k_base *ath11k_core_alloc(struct device *dev, size_t priv_size,
 		goto err_sc_free;
 
 	mutex_init(&ab->core_lock);
+	mutex_init(&ab->tbl_lock);
 	spin_lock_init(&ab->base_lock);
 	mutex_init(&ab->vdev_id_11d_lock);
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 10846e9..079a262 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_CORE_H
@@ -10,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/bitfield.h>
+#include <linux/rhashtable.h>
 #include "qmi.h"
 #include "htc.h"
 #include "wmi.h"
@@ -746,6 +748,18 @@ struct ath11k_base {
 	struct ath11k_pdev __rcu *pdevs_active[MAX_RADIOS];
 	struct ath11k_hal_reg_capabilities_ext hal_reg_cap[MAX_RADIOS];
 	unsigned long long free_vdev_map;
+
+	/* To synchronize rhash tbl write operation */
+	struct mutex tbl_lock;
+
+	/* The rhashtable containing struct ath11k_peer keyed by mac addr */
+	struct rhashtable *rhead_peer_addr;
+	struct rhashtable_params rhash_peer_addr_param;
+
+	/* The rhashtable containing struct ath11k_peer keyed by id  */
+	struct rhashtable *rhead_peer_id;
+	struct rhashtable_params rhash_peer_id_param;
+
 	struct list_head peers;
 	wait_queue_head_t peer_mapping_wq;
 	u8 mac_addr[ETH_ALEN];
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ed89905..c392738 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -868,13 +868,16 @@ void ath11k_mac_peer_cleanup_all(struct ath11k *ar)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	mutex_lock(&ab->tbl_lock);
 	spin_lock_bh(&ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
 		ath11k_peer_rx_tid_cleanup(ar, peer);
+		ath11k_peer_rhash_delete(ab, peer);
 		list_del(&peer->list);
 		kfree(peer);
 	}
 	spin_unlock_bh(&ab->base_lock);
+	mutex_unlock(&ab->tbl_lock);
 
 	ar->num_peers = 0;
 	ar->num_stations = 0;
@@ -4531,6 +4534,7 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 
 		ath11k_mac_dec_num_stations(arvif, sta);
+		mutex_lock(&ar->ab->tbl_lock);
 		spin_lock_bh(&ar->ab->base_lock);
 		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
 		if (skip_peer_delete && peer) {
@@ -4538,12 +4542,14 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		} else if (peer && peer->sta == sta) {
 			ath11k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
 				    vif->addr, arvif->vdev_id);
+			ath11k_peer_rhash_delete(ar->ab, peer);
 			peer->sta = NULL;
 			list_del(&peer->list);
 			kfree(peer);
 			ar->num_peers--;
 		}
 		spin_unlock_bh(&ar->ab->base_lock);
+		mutex_unlock(&ar->ab->tbl_lock);
 
 		kfree(arsta->tx_stats);
 		arsta->tx_stats = NULL;
@@ -8338,6 +8344,8 @@ void ath11k_mac_unregister(struct ath11k_base *ab)
 
 		__ath11k_mac_unregister(ar);
 	}
+
+	ath11k_peer_rhash_tbl_destroy(ab);
 }
 
 static int __ath11k_mac_register(struct ath11k *ar)
@@ -8548,6 +8556,10 @@ int ath11k_mac_register(struct ath11k_base *ab)
 	ab->cc_freq_hz = IPQ8074_CC_FREQ_HERTZ;
 	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
 
+	ret = ath11k_peer_rhash_tbl_init(ab);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
@@ -8577,6 +8589,8 @@ int ath11k_mac_register(struct ath11k_base *ab)
 		__ath11k_mac_unregister(ar);
 	}
 
+	ath11k_peer_rhash_tbl_destroy(ab);
+
 	return ret;
 }
 
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 332886b..5cdacd5 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -1,23 +1,22 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
 #include "peer.h"
 #include "debug.h"
 
-struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
-				     const u8 *addr)
+static struct ath11k_peer *ath11k_peer_find_list_by_id(struct ath11k_base *ab,
+						       int peer_id)
 {
 	struct ath11k_peer *peer;
 
 	lockdep_assert_held(&ab->base_lock);
 
 	list_for_each_entry(peer, &ab->peers, list) {
-		if (peer->vdev_id != vdev_id)
-			continue;
-		if (!ether_addr_equal(peer->addr, addr))
+		if (peer->peer_id != peer_id)
 			continue;
 
 		return peer;
@@ -26,15 +25,15 @@ struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
 	return NULL;
 }
 
-static struct ath11k_peer *ath11k_peer_find_by_pdev_idx(struct ath11k_base *ab,
-							u8 pdev_idx, const u8 *addr)
+struct ath11k_peer *ath11k_peer_find(struct ath11k_base *ab, int vdev_id,
+				     const u8 *addr)
 {
 	struct ath11k_peer *peer;
 
 	lockdep_assert_held(&ab->base_lock);
 
 	list_for_each_entry(peer, &ab->peers, list) {
-		if (peer->pdev_idx != pdev_idx)
+		if (peer->vdev_id != vdev_id)
 			continue;
 		if (!ether_addr_equal(peer->addr, addr))
 			continue;
@@ -52,14 +51,13 @@ struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
 
 	lockdep_assert_held(&ab->base_lock);
 
-	list_for_each_entry(peer, &ab->peers, list) {
-		if (!ether_addr_equal(peer->addr, addr))
-			continue;
+	if (!ab->rhead_peer_addr)
+		return NULL;
 
-		return peer;
-	}
+	peer = rhashtable_lookup_fast(ab->rhead_peer_addr, addr,
+				      ab->rhash_peer_addr_param);
 
-	return NULL;
+	return peer;
 }
 
 struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab,
@@ -69,11 +67,13 @@ struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab,
 
 	lockdep_assert_held(&ab->base_lock);
 
-	list_for_each_entry(peer, &ab->peers, list)
-		if (peer_id == peer->peer_id)
-			return peer;
+	if (!ab->rhead_peer_id)
+		return NULL;
 
-	return NULL;
+	peer = rhashtable_lookup_fast(ab->rhead_peer_id, &peer_id,
+				      ab->rhash_peer_id_param);
+
+	return peer;
 }
 
 struct ath11k_peer *ath11k_peer_find_by_vdev_id(struct ath11k_base *ab,
@@ -99,7 +99,7 @@ void ath11k_peer_unmap_event(struct ath11k_base *ab, u16 peer_id)
 
 	spin_lock_bh(&ab->base_lock);
 
-	peer = ath11k_peer_find_by_id(ab, peer_id);
+	peer = ath11k_peer_find_list_by_id(ab, peer_id);
 	if (!peer) {
 		ath11k_warn(ab, "peer-unmap-event: unknown peer id %d\n",
 			    peer_id);
@@ -167,6 +167,76 @@ static int ath11k_wait_for_peer_common(struct ath11k_base *ab, int vdev_id,
 	return 0;
 }
 
+static inline int ath11k_peer_rhash_insert(struct ath11k_base *ab,
+					   struct rhashtable *rtbl,
+					   struct rhash_head *rhead,
+					   struct rhashtable_params *params,
+					   void *key)
+{
+	struct ath11k_peer *tmp;
+
+	lockdep_assert_held(&ab->tbl_lock);
+
+	tmp = rhashtable_lookup_get_insert_fast(rtbl, rhead, *params);
+
+	if (!tmp)
+		return 0;
+	else if (IS_ERR(tmp))
+		return PTR_ERR(tmp);
+	else
+		return -EEXIST;
+}
+
+static inline int ath11k_peer_rhash_remove(struct ath11k_base *ab,
+					   struct rhashtable *rtbl,
+					   struct rhash_head *rhead,
+					   struct rhashtable_params *params)
+{
+	int ret;
+
+	lockdep_assert_held(&ab->tbl_lock);
+
+	ret = rhashtable_remove_fast(rtbl, rhead, *params);
+	if (ret && ret != -ENOENT)
+		return ret;
+
+	return 0;
+}
+
+static int ath11k_peer_rhash_add(struct ath11k_base *ab, struct ath11k_peer *peer)
+{
+	int ret;
+
+	lockdep_assert_held(&ab->base_lock);
+	lockdep_assert_held(&ab->tbl_lock);
+
+	if (!ab->rhead_peer_id || !ab->rhead_peer_addr)
+		return -EPERM;
+
+	ret = ath11k_peer_rhash_insert(ab, ab->rhead_peer_id, &peer->rhash_id,
+				       &ab->rhash_peer_id_param, &peer->peer_id);
+	if (ret) {
+		ath11k_warn(ab, "failed to add peer %pM with id %d in rhash_id ret %d\n",
+			    peer->addr, peer->peer_id, ret);
+		return ret;
+	}
+
+	ret = ath11k_peer_rhash_insert(ab, ab->rhead_peer_addr, &peer->rhash_addr,
+				       &ab->rhash_peer_addr_param, &peer->addr);
+	if (ret) {
+		ath11k_warn(ab, "failed to add peer %pM with id %d in rhash_addr ret %d\n",
+			    peer->addr, peer->peer_id, ret);
+		goto err_clean;
+	}
+
+	return 0;
+
+err_clean:
+	ath11k_peer_rhash_remove(ab, ab->rhead_peer_id, &peer->rhash_id,
+				 &ab->rhash_peer_id_param);
+	return ret;
+}
+
 void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
 {
 	struct ath11k_peer *peer, *tmp;
@@ -174,6 +244,7 @@ void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	mutex_lock(&ab->tbl_lock);
 	spin_lock_bh(&ab->base_lock);
 	list_for_each_entry_safe(peer, tmp, &ab->peers, list) {
 		if (peer->vdev_id != vdev_id)
@@ -182,12 +253,14 @@ void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id)
 		ath11k_warn(ab, "removing stale peer %pM from vdev_id %d\n",
 			    peer->addr, vdev_id);
 
+		ath11k_peer_rhash_delete(ab, peer);
 		list_del(&peer->list);
 		kfree(peer);
 		ar->num_peers--;
 	}
 
 	spin_unlock_bh(&ab->base_lock);
+	mutex_unlock(&ab->tbl_lock);
 }
 
 static int ath11k_wait_for_peer_deleted(struct ath11k *ar, int vdev_id, const u8 *addr)
@@ -220,14 +293,35 @@ int ath11k_wait_for_peer_delete_done(struct ath11k *ar, u32 vdev_id,
 int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr)
 {
 	int ret;
+	struct ath11k_peer *peer;
+	struct ath11k_base *ab = ar->ab;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	mutex_lock(&ab->tbl_lock);
+	spin_lock_bh(&ab->base_lock);
+
+	peer = ath11k_peer_find_by_addr(ab, addr);
+	if (!peer) {
+		spin_unlock_bh(&ab->base_lock);
+		mutex_unlock(&ab->tbl_lock);
+
+		ath11k_warn(ab,
+			    "failed to find peer vdev_id %d addr %pM in delete\n",
+			    vdev_id, addr);
+		return -EINVAL;
+	}
+
+	ath11k_peer_rhash_delete(ab, peer);
+
+	spin_unlock_bh(&ab->base_lock);
+	mutex_unlock(&ab->tbl_lock);
+
 	reinit_completion(&ar->peer_delete_done);
 
 	ret = ath11k_wmi_send_peer_delete_cmd(ar, addr, vdev_id);
 	if (ret) {
-		ath11k_warn(ar->ab,
+		ath11k_warn(ab,
 			    "failed to delete peer vdev_id %d addr %pM ret %d\n",
 			    vdev_id, addr, ret);
 		return ret;
@@ -263,7 +357,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	}
 
 	spin_lock_bh(&ar->ab->base_lock);
-	peer = ath11k_peer_find_by_pdev_idx(ar->ab, ar->pdev_idx, param->peer_addr);
+	peer = ath11k_peer_find_by_addr(ar->ab, param->peer_addr);
 	if (peer) {
 		spin_unlock_bh(&ar->ab->base_lock);
 		return -EINVAL;
@@ -283,11 +377,13 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	if (ret)
 		return ret;
 
+	mutex_lock(&ar->ab->tbl_lock);
 	spin_lock_bh(&ar->ab->base_lock);
 
 	peer = ath11k_peer_find(ar->ab, param->vdev_id, param->peer_addr);
 	if (!peer) {
 		spin_unlock_bh(&ar->ab->base_lock);
+		mutex_unlock(&ar->ab->tbl_lock);
 		ath11k_warn(ar->ab, "failed to find peer %pM on vdev %i after creation\n",
 			    param->peer_addr, param->vdev_id);
 
@@ -295,6 +391,13 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		goto cleanup;
 	}
 
+	ret = ath11k_peer_rhash_add(ar->ab, peer);
+	if (ret) {
+		spin_unlock_bh(&ar->ab->base_lock);
+		mutex_unlock(&ar->ab->tbl_lock);
+		goto cleanup;
+	}
+
 	peer->pdev_idx = ar->pdev_idx;
 	peer->sta = sta;
 
@@ -319,6 +422,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 	ar->num_peers++;
 
 	spin_unlock_bh(&ar->ab->base_lock);
+	mutex_unlock(&ar->ab->tbl_lock);
 
 	return 0;
 
@@ -342,3 +446,201 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 exit:
 	return ret;
 }
+
+int ath11k_peer_rhash_delete(struct ath11k_base *ab, struct ath11k_peer *peer)
+{
+	int ret;
+
+	lockdep_assert_held(&ab->base_lock);
+	lockdep_assert_held(&ab->tbl_lock);
+
+	if (!ab->rhead_peer_id || !ab->rhead_peer_addr)
+		return -EPERM;
+
+	ret = ath11k_peer_rhash_remove(ab, ab->rhead_peer_addr, &peer->rhash_addr,
+				       &ab->rhash_peer_addr_param);
+	if (ret) {
+		ath11k_warn(ab, "failed to remove peer %pM id %d in rhash_addr ret %d\n",
+			    peer->addr, peer->peer_id, ret);
+		return ret;
+	}
+
+	ret = ath11k_peer_rhash_remove(ab, ab->rhead_peer_id, &peer->rhash_id,
+				       &ab->rhash_peer_id_param);
+	if (ret) {
+		ath11k_warn(ab, "failed to remove peer %pM id %d in rhash_id ret %d\n",
+			    peer->addr, peer->peer_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ath11k_peer_rhash_id_tbl_init(struct ath11k_base *ab)
+{
+	struct rhashtable_params *param;
+	struct rhashtable *rhash_id_tbl;
+	int ret;
+	size_t size;
+
+	lockdep_assert_held(&ab->tbl_lock);
+
+	if (ab->rhead_peer_id)
+		return 0;
+
+	size = sizeof(*ab->rhead_peer_id);
+	rhash_id_tbl = kzalloc(size, GFP_KERNEL);
+	if (!rhash_id_tbl) {
+		ath11k_warn(ab, "failed to init rhash id table due to no mem (size %zu)\n",
+			    size);
+		return -ENOMEM;
+	}
+
+	param = &ab->rhash_peer_id_param;
+
+	param->key_offset = offsetof(struct ath11k_peer, peer_id);
+	param->head_offset = offsetof(struct ath11k_peer, rhash_id);
+	param->key_len = sizeof_field(struct ath11k_peer, peer_id);
+	param->automatic_shrinking = true;
+	param->nelem_hint = ab->num_radios * TARGET_NUM_PEERS_PDEV(ab);
+
+	ret = rhashtable_init(rhash_id_tbl, param);
+	if (ret) {
+		ath11k_warn(ab, "failed to init peer id rhash table %d\n", ret);
+		goto err_free;
+	}
+
+	spin_lock_bh(&ab->base_lock);
+
+	if (!ab->rhead_peer_id) {
+		ab->rhead_peer_id = rhash_id_tbl;
+	} else {
+		spin_unlock_bh(&ab->base_lock);
+		goto cleanup_tbl;
+	}
+
+	spin_unlock_bh(&ab->base_lock);
+
+	return 0;
+
+cleanup_tbl:
+	rhashtable_destroy(rhash_id_tbl);
+err_free:
+	kfree(rhash_id_tbl);
+
+	return ret;
+}
+
+static int ath11k_peer_rhash_addr_tbl_init(struct ath11k_base *ab)
+{
+	struct rhashtable_params *param;
+	struct rhashtable *rhash_addr_tbl;
+	int ret;
+	size_t size;
+
+	lockdep_assert_held(&ab->tbl_lock);
+
+	if (ab->rhead_peer_addr)
+		return 0;
+
+	size = sizeof(*ab->rhead_peer_addr);
+	rhash_addr_tbl = kzalloc(size, GFP_KERNEL);
+	if (!rhash_addr_tbl) {
+		ath11k_warn(ab, "failed to init rhash addr table due to no mem (size %zu)\n",
+			    size);
+		return -ENOMEM;
+	}
+
+	param = &ab->rhash_peer_addr_param;
+
+	param->key_offset = offsetof(struct ath11k_peer, addr);
+	param->head_offset = offsetof(struct ath11k_peer, rhash_addr);
+	param->key_len = sizeof_field(struct ath11k_peer, addr);
+	param->automatic_shrinking = true;
+	param->nelem_hint = ab->num_radios * TARGET_NUM_PEERS_PDEV(ab);
+
+	ret = rhashtable_init(rhash_addr_tbl, param);
+	if (ret) {
+		ath11k_warn(ab, "failed to init peer addr rhash table %d\n", ret);
+		goto err_free;
+	}
+
+	spin_lock_bh(&ab->base_lock);
+
+	if (!ab->rhead_peer_addr) {
+		ab->rhead_peer_addr = rhash_addr_tbl;
+	} else {
+		spin_unlock_bh(&ab->base_lock);
+		goto cleanup_tbl;
+	}
+
+	spin_unlock_bh(&ab->base_lock);
+
+	return 0;
+
+cleanup_tbl:
+	rhashtable_destroy(rhash_addr_tbl);
+err_free:
+	kfree(rhash_addr_tbl);
+
+	return ret;
+}
+
+static inline void ath11k_peer_rhash_id_tbl_destroy(struct ath11k_base *ab)
+{
+	lockdep_assert_held(&ab->tbl_lock);
+
+	if (!ab->rhead_peer_id)
+		return;
+
+	rhashtable_destroy(ab->rhead_peer_id);
+	kfree(ab->rhead_peer_id);
+	ab->rhead_peer_id = NULL;
+}
+
+static inline void ath11k_peer_rhash_addr_tbl_destroy(struct ath11k_base *ab)
+{
+	lockdep_assert_held(&ab->tbl_lock);
+
+	if (!ab->rhead_peer_addr)
+		return;
+
+	rhashtable_destroy(ab->rhead_peer_addr);
+	kfree(ab->rhead_peer_addr);
+	ab->rhead_peer_addr = NULL;
+}
+
+int ath11k_peer_rhash_tbl_init(struct ath11k_base *ab)
+{
+	int ret;
+
+	mutex_lock(&ab->tbl_lock);
+
+	ret = ath11k_peer_rhash_id_tbl_init(ab);
+	if (ret)
+		goto out;
+
+	ret = ath11k_peer_rhash_addr_tbl_init(ab);
+	if (ret)
+		goto cleanup_tbl;
+
+	mutex_unlock(&ab->tbl_lock);
+
+	return 0;
+
+cleanup_tbl:
+	ath11k_peer_rhash_id_tbl_destroy(ab);
+out:
+	mutex_unlock(&ab->tbl_lock);
+	return ret;
+}
+
+void ath11k_peer_rhash_tbl_destroy(struct ath11k_base *ab)
+{
+	mutex_lock(&ab->tbl_lock);
+
+	ath11k_peer_rhash_addr_tbl_destroy(ab);
+	ath11k_peer_rhash_id_tbl_destroy(ab);
+
+	mutex_unlock(&ab->tbl_lock);
+}
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index 63fe566..b687fa9 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_PEER_H
@@ -20,6 +21,11 @@ struct ath11k_peer {
 	struct ieee80211_key_conf *keys[WMI_MAX_KEY_INDEX + 1];
 	struct dp_rx_tid rx_tid[IEEE80211_NUM_TIDS + 1];
 
+	/* peer id based rhashtable list pointer */
+	struct rhash_head rhash_id;
+	/* peer addr based rhashtable list pointer */
+	struct rhash_head rhash_addr;
+
 	/* Info used in MMIC verification of
 	 * RX fragments
 	 */
@@ -47,5 +53,7 @@ int ath11k_wait_for_peer_delete_done(struct ath11k *ar, u32 vdev_id,
 				     const u8 *addr);
 struct ath11k_peer *ath11k_peer_find_by_vdev_id(struct ath11k_base *ab,
 						int vdev_id);
-
+int ath11k_peer_rhash_tbl_init(struct ath11k_base *ab);
+void ath11k_peer_rhash_tbl_destroy(struct ath11k_base *ab);
+int ath11k_peer_rhash_delete(struct ath11k_base *ab, struct ath11k_peer *peer);
 #endif /* _PEER_H_ */
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
