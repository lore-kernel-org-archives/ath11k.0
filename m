Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66835C433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AA660F21
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 08:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30AA660F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WitErkb1+gs3sKqd1kdd89Ou/hW4DhoIWIJ+0HWc0wg=; b=UD4Wn73CxfQaCb
	pwK/IpJsuYEz4Bpk/Z3WDOrQG9cShPJ4yjSIq3wYyprKFloY67s/8jGoJiXfAqzXi19cl7dP4tcF9
	jLxAkmQGaYYmK3qk2CXbup10CE79N/1V884Cc+WZQvBayvtv0b93/bE1cL5q72tSUDu1N9/JmORnE
	zUwZiG2mm1BMb5hk+EUqL+FBowSWIQlBQdhxqI8bhG0fVc5IP1xEjH9a8J7XlTbAtFdnPduZN9I+E
	bXE4piAAYkMuLy5Z5KMlMqaqIJPKeznile0z/A/4s7qU916gxQGWKaewehW4ewTZY8gYO3yflNfLJ
	u08EF/vNyRKNIJFsrh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZqlX-008MC9-2b; Mon, 11 Oct 2021 08:34:35 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZqlN-008M7x-G1
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 08:34:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633941269; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=q5KnneFacyHAu3vUhC97L1sO9+YPqFSJoNlT6Rr6hLQ=;
 b=Xu8ouEO3zvaclb1xdW3a6GKOUR3bmdLUWV3n404hpKah0C2fAJpA2FyUwqN4/Li5dHcBavHt
 5v/ODr4eLTStIEc+Nb0+rVIe+IdxQ07vBjcocby6WaM36mW5ZWrDaYIwxSwI9NncwCe4l5kl
 IANiZNzeN/lPjeOzejCeFC2qKoA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6163f70b22fe3a98e539d47e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 08:34:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1BEA0C43460; Mon, 11 Oct 2021 08:34:19 +0000 (UTC)
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F2B8C43617;
 Mon, 11 Oct 2021 08:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5F2B8C43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Wen Gong <wgong@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	wgong@codeaurora.org
Subject: [PATCH] ath11k: add wait operation for tx management packets for
 flush from mac80211
Date: Mon, 11 Oct 2021 04:34:11 -0400
Message-Id: <20211011083411.30632-1-wgong@codeaurora.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_013430_064529_A00FD88D 
X-CRM114-Status: GOOD (  17.35  )
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

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c |  1 +
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 39 ++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/wmi.c  | 12 +++++++-
 4 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 78438071696d..bc2d268bd398 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1063,6 +1063,7 @@ static void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 		idr_for_each(&ar->txmgmt_idr,
 			     ath11k_mac_tx_mgmt_pending_free, ar);
 		idr_destroy(&ar->txmgmt_idr);
+		wake_up(&ar->txmgmt_empty_waitq);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index ccf10b972b8c..20b65f61393f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -580,6 +580,7 @@ struct ath11k {
 	/* protects txmgmt_idr data */
 	spinlock_t txmgmt_idr_lock;
 	atomic_t num_pending_mgmt_tx;
+	wait_queue_head_t txmgmt_empty_waitq;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6095841199fc..f08c0ee786fa 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4229,6 +4229,14 @@ static int __ath11k_set_antenna(struct ath11k *ar, u32 tx_ant, u32 rx_ant)
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
@@ -4245,7 +4253,7 @@ int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx)
 	info = IEEE80211_SKB_CB(msdu);
 	memset(&info->status, 0, sizeof(info->status));
 
-	ieee80211_free_txskb(ar->hw, msdu);
+	ath11k_mgmt_over_wmi_tx_drop(ar, msdu);
 
 	return 0;
 }
@@ -4283,6 +4291,10 @@ static int ath11k_mac_mgmt_tx_wmi(struct ath11k *ar, struct ath11k_vif *arvif,
 	buf_id = idr_alloc(&ar->txmgmt_idr, skb, 0,
 			   ATH11K_TX_MGMT_NUM_PENDING_MAX, GFP_ATOMIC);
 	spin_unlock_bh(&ar->txmgmt_idr_lock);
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+		   "mac tx mgmt frame, buf id %d\n", buf_id);
+
 	if (buf_id < 0)
 		return -ENOSPC;
 
@@ -4329,7 +4341,7 @@ static void ath11k_mgmt_over_wmi_tx_purge(struct ath11k *ar)
 	struct sk_buff *skb;
 
 	while ((skb = skb_dequeue(&ar->wmi_mgmt_tx_queue)) != NULL)
-		ieee80211_free_txskb(ar->hw, skb);
+		ath11k_mgmt_over_wmi_tx_drop(ar, skb);
 }
 
 static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
@@ -4344,7 +4356,7 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 		skb_cb = ATH11K_SKB_CB(skb);
 		if (!skb_cb->vif) {
 			ath11k_warn(ar->ab, "no vif found for mgmt frame\n");
-			ieee80211_free_txskb(ar->hw, skb);
+			ath11k_mgmt_over_wmi_tx_drop(ar, skb);
 			continue;
 		}
 
@@ -4355,16 +4367,18 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 			if (ret) {
 				ath11k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",
 					    arvif->vdev_id, ret);
-				ieee80211_free_txskb(ar->hw, skb);
+				ath11k_mgmt_over_wmi_tx_drop(ar, skb);
 			} else {
-				atomic_inc(&ar->num_pending_mgmt_tx);
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
@@ -4396,6 +4410,7 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 
 	skb_queue_tail(q, skb);
 	ieee80211_queue_work(ar->hw, &ar->wmi_mgmt_tx_work);
+	atomic_inc(&ar->num_pending_mgmt_tx);
 
 	return 0;
 }
@@ -6391,6 +6406,17 @@ static void ath11k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
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
@@ -7371,6 +7397,7 @@ int ath11k_mac_register(struct ath11k_base *ab)
 
 		idr_init(&ar->txmgmt_idr);
 		spin_lock_init(&ar->txmgmt_idr_lock);
+		init_waitqueue_head(&ar->txmgmt_empty_waitq);
 	}
 
 	/* Initialize channel counters frequency value in hertz */
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2aa57f03e68b..059f0e51a9a6 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5474,6 +5474,7 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
 	struct ath11k_skb_cb *skb_cb;
+	int num_mgmt;
 
 	spin_lock_bh(&ar->txmgmt_idr_lock);
 	msdu = idr_find(&ar->txmgmt_idr, desc_id);
@@ -5497,10 +5498,19 @@ static int wmi_process_mgmt_tx_comp(struct ath11k *ar, u32 desc_id,
 
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
 
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
