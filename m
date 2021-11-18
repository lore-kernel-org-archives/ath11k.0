Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AE8C433EF
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:53:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8517061B3A
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8517061B3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CF5zTF9pjH/UcpUnm8e5upDOUDj4Hy686LIJv4sXKRQ=; b=fqwyPteu84DCf6
	MahSr1KteFvkA4Ewp4vPPowJTHxA0gMRco2dvn4CMZ3Y742DbV9aZDxBVoPWZvf0ATyCt/5DFkHjf
	mTRQ/3fo7aFvmsLAz5oGE+94u49ReEn0dx2lpLzsXjq3asGW6d/2epjS82wAsm5OPtOcQJQaoSpU7
	SSWMLyhZzPjxei5l6FEoAKUkjImq3wEtuuQjOYu0j1blAZtJiPpFQ2D0LK7s6kQOJvmXIgE/v59ng
	WUpLDWyCitc7f6aga9oWSiJ86Bj5dnnn/OqXjLrvtEhKcOVKu4s43HwBA++yLwtYsIydsnFI3ZQIj
	wBl7W4+MKBfzTV46h3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mne6V-007NQv-G4; Thu, 18 Nov 2021 09:53:15 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mne6S-007NQI-C1
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 09:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637229192; x=1668765192;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aIrfynLLaOEKnwbxdjszEQAR5XKTa3ipQ1Jl64A6oLY=;
 b=bWFWKO6otM9eoig6gX6QzJUNOw5mQWdsR+ln5iuMzv7MlAH2/mhpf4GR
 AgCe3KekOYeKaKsmUia3fGMDPr0LJ768TdiT38G22h6/JnOQpO7FY32fY
 SxIgdlMywElAvaP0uzztUlDwR81JUQminYalNnJvyHUJvpUaKIOpLQqDP 8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 18 Nov 2021 01:53:09 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 01:53:09 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:53:09 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:53:07 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath11k: add wait operation for tx management packets for
 flush from mac80211
Date: Thu, 18 Nov 2021 04:52:54 -0500
Message-ID: <20211118095254.7916-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_015312_504914_002C2F7E 
X-CRM114-Status: GOOD (  16.98  )
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

In ath11k, tx of management packet is doing in a work queue. Sometimes
the workqueue does not finish tx immediately, then it lead after the next
step of vdev delete finished, it start to send the management packet to
firmware and lead firmware crash.

ieee80211_set_disassoc have logic of ieee80211_flush_queues after it
send_deauth_disassoc to ath11k, its purpose is make sure the deauth
was actually sent, so it need to change ath11k to match the purpose
of mac80211.

To address these issue wait for tx mgmt and tx data packets.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01230-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2: rebased to latest ath.git master ath-202111170737

 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 40 ++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/wmi.c  | 12 +++++++-
 4 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index a40bbca3e9af..a7817c3bcaae 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1078,6 +1078,7 @@ static void ath11k_core_restart(struct work_struct *work)
 		idr_for_each(&ar->txmgmt_idr,
 			     ath11k_mac_tx_mgmt_pending_free, ar);
 		idr_destroy(&ar->txmgmt_idr);
+		wake_up(&ar->txmgmt_empty_waitq);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index bbfc10fd5c6d..6c6337bbe378 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -547,6 +547,7 @@ struct ath11k {
 	/* protects txmgmt_idr data */
 	spinlock_t txmgmt_idr_lock;
 	atomic_t num_pending_mgmt_tx;
+	wait_queue_head_t txmgmt_empty_waitq;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 292b2b7eab11..01308c70366f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5128,6 +5128,14 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
 	return 0;
 }
 
+static void ath11k_mgmt_over_wmi_tx_drop(struct ath11k *ar, struct sk_buff *skb)
+{
+	ieee80211_free_txskb(ar->hw, skb);
+
+	if (atomic_dec_and_test(&ar->num_pending_mgmt_tx))
+		wake_up(&ar->txmgmt_empty_waitq);
+}
+
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 {
 	struct sk_buff *msdu = skb;
@@ -5144,7 +5152,7 @@ int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 	info = IEEE80211_SKB_CB(msdu);
 	memset(&info->status, 0, sizeof(info->status));
 
-	ieee80211_free_txskb(ar->hw, msdu);
+	ath11k_mgmt_over_wmi_tx_drop(ar, msdu);
 
 	return 0;
 }
@@ -5182,6 +5190,10 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
 			   ATH11K_TX_MGMT_NUM_PENDING_MAX, GFP_ATOMIC);
 	spin_unlock_bh(&ar->txmgmt_idr_lock);
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+		   "mac tx mgmt frame, buf id %d\n", buf_id);
+
 	if (buf_id < 0)
 		return -ENOSPC;
 
@@ -5228,7 +5240,7 @@ static void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar)
 	struct sk_buff *skb;
 
 	while ((skb = skb_dequeue(&ar->wmi_mgmt_tx_queue)) != NULL)
-		ieee80211_free_txskb(ar->hw, skb);
+		ath11k_mgmt_over_wmi_tx_drop(ar, skb);
 }
 
 static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
@@ -5243,7 +5255,7 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 		skb_cb = ATH11K_SKB_CB(skb);
 		if (!skb_cb->vif) {
 			ath11k_warn(ar->ab, "no vif found for mgmt frame\n");
-			ieee80211_free_txskb(ar->hw, skb);
+			ath11k_mgmt_over_wmi_tx_drop(ar, skb);
 			continue;
 		}
 
@@ -5258,14 +5270,18 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 
 				ath11k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",
 					    arvif->vdev_id, ret);
-				ieee80211_free_txskb(ar->hw, skb);
+				ath11k_mgmt_over_wmi_tx_drop(ar, skb);
+			} else {
+				ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+					   "mac tx mgmt frame, vdev_id %d\n",
+					   arvif->vdev_id);
 			}
 		} else {
 			ath11k_warn(ar->ab,
 				    "dropping mgmt frame for vdev %d, is_started %d\n",
 				    arvif->vdev_id,
 				    arvif->is_started);
-			ieee80211_free_txskb(ar->hw, skb);
+			ath11k_mgmt_over_wmi_tx_drop(ar, skb);
 		}
 	}
 }
@@ -5297,6 +5313,7 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 
 	skb_queue_tail(q, skb);
 	ieee80211_queue_work(ar->hw, &ar->wmi_mgmt_tx_work);
+	atomic_inc(&ar->num_pending_mgmt_tx);
 
 	return 0;
 }
@@ -6784,6 +6801,17 @@ static void ath11k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
 				       ATH11K_FLUSH_TIMEOUT);
 	if (time_left == 0)
 		ath11k_warn(ar->ab, "failed to flush transmit queue %ld\n", time_left);
+
+	time_left = wait_event_timeout(ar->txmgmt_empty_waitq,
+				       (atomic_read(&ar->num_pending_mgmt_tx) == 0),
+				       ATH11K_FLUSH_TIMEOUT);
+	if (time_left == 0)
+		ath11k_warn(ar->ab, "failed to flush mgmt transmit queue %ld\n",
+			    time_left);
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+		   "mac mgmt tx flush mgmt pending %d\n",
+		   atomic_read(&ar->num_pending_mgmt_tx));
 }
 
 static int
@@ -8022,6 +8050,8 @@ int ath11k_mac_register(struct ath11k_base *ab)
 		ret = __ath11k_mac_register(ar);
 		if (ret)
 			goto err_cleanup;
+
+		init_waitqueue_head(&ar->txmgmt_empty_waitq);
 	}
 
 	return 0;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 614b2f6bcc8e..2c1f3d783083 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4867,6 +4867,7 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 	struct ath11k_skb_cb *skb_cb;
+	int num_mgmt;
 
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	msdu = idr_find(&ar->txmgmt_idr, desc_id);
@@ -4890,10 +4891,19 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
 
 	ieee80211_tx_status_irqsafe(ar->hw, msdu);
 
+	num_mgmt = atomic_dec_if_positive(&ar->num_pending_mgmt_tx);
+
 	/* WARN when we received this event without doing any mgmt tx */
-	if (atomic_dec_if_positive(&ar->num_pending_mgmt_tx) < 0)
+	if (num_mgmt < 0)
 		WARN_ON_ONCE(1);
 
+	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+		   "wmi mgmt tx comp pending %d desc id %d\n",
+		   num_mgmt, desc_id);
+
+	if (!num_mgmt)
+		wake_up(&ar->txmgmt_empty_waitq);
+
 	return 0;
 }
 

base-commit: 63ec871bc50a306aac550e2d85f697ca2d5f5deb
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
