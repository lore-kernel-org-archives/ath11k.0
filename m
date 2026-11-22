Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E8606A337
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NKGRv3MB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RBB+mh/O;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=OW3dwypz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eil5Or1kTjxXApsN+46KoMKUA0/qV6GEUo9vYFMijv4=; b=NKGRv3MBpF3xpP
	4f8rOwSkbFTTz/oO0/KjUDywN5Bdg1N4Qh+68YMVFM5D5alu6ut9cRS/dOnoZcwataCiGiCFCY/V+
	1aeDjiQnBIvA4s+xCZ9NVvXIoFHf+qTWZjoN0nq0LE7CQN/zZbkQIKhjVqRp9k3Knp2ozKwDvtjEq
	IzGfC4rk76gNY2ufzYopkxfA+b6BKr9gbEKuHA1fA7lqaVwPbMUpncnH6OvWCJIwII4YL1zOknwak
	KSQVksxScAEnt5kldZgiAaNNwKkgbKBG+2Ogg1QC/KvBkmV1JXfZBYDoxiIz/9t9uhXeKshYy4m5s
	+iR25MQab3nL51yelQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC38-00000001Usc-2JnP;
	Sun, 22 Nov 2026 18:12:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC33-00000001Unb-31kw
	for ath11k@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eil5Or1kTjxXApsN+46KoMKUA0/qV6GEUo9vYFMijv4=; b=RBB+mh/OyrEwZQaVRNt/lovIs8
	qELCMqWoFfCwUyrqGUcwxFWSlLNCRtJv/ib4UI94GGDLAYxC8ZO3WRkPdnW5r+b+NHc5Jzi1lANdl
	v74Rr4wQhO9ssnid7bKOdhtCTbEYJr3k04wplrXfJuVgW8gvr7+Kzp5N8qhmjzHWZpWcGKt6pPjEQ
	wMK/1qP9YRdZBsx1t3Se1pAxPXtD+EzlHLl0vVDpnzyHiQeikcDsosmuSCQoIEvmyTZryR1GCV8tP
	xzYp4YCSyjLnFzSgfzxwKKYELIQjc71o2Hd/NJoV4FaDusVN5jhtBxR0zmmxYq64MsGIBm0ldYdGZ
	4DlDvReA==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC30-00000002Ph0-2Hfl
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:12:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so3666803a12.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371137; x=1795975937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eil5Or1kTjxXApsN+46KoMKUA0/qV6GEUo9vYFMijv4=;
        b=OW3dwypzJ0jCpekPEffj6vZmTpenEmEBP2t6b1G7l6ILfIixes5X3b+kzpO4Dpl7sa
         s7uYOfPgmJjQxAfnp/+6Mu4I6uA+8B1hblinjtVaZcn0sBpRgPYTKQjoMSgQLf04HPUz
         9JzWAGzc9R5ksxQvUzN3h/WYYeH0hcsJuAX5oBHlAm30vFKPI/HFwA3mFKRUHd1NgUNZ
         dImtBh3QFuG1K3AyAUq4gYdFHBxf4KAbDK/myTVqLHQ99bpo1aVqlprYmzvpIjCFeYZ9
         NpFznis0jD614BwthvcOEe0hf3zyMVPqfMDbUTli2xpgEDaerVhBeuH8/1ucAEkzKBjb
         GlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371137; x=1795975937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eil5Or1kTjxXApsN+46KoMKUA0/qV6GEUo9vYFMijv4=;
        b=LLKWCge+U4OcEgv2c2JIiUQDzxRqxZ8/bwVCDNNiyMbDDNkaceWONyAYHpQ4oRst3H
         mBjZcN5mgk/kMjZzXjC9XnRBgXaaUA2E52Qhxyr8Ix8ElhblAtCPKYQlQLbfGoNe0Q23
         p0oyU6z2LvFvfYtEGjzQlQ6P71BgzD2pE9xKRbSshGztecWVq1LttdMYNGxyZ3OJnT/U
         h+oDCjF0chEIrlVmhnv93ZT+6lvuAd8Fu231rSnoewRaU8oeCt/4LCpay3TjloxGOZGm
         52K8MFycB4NDDLwDrvIY5x2CNW5VF8Je5WykhxgMv9enygYyelVX8XxHRbkHHoj7oeiJ
         Sunw==
X-Gm-Message-State: APuU4Z93nhRmoBj7zEaPsmEdfGGs0REiFvh3GuCIyfmCuu7KVCfNVfye
	3sXGwjUIlreAWc3rOE59uSQMf+aoip2EvrLVzWQzwHnwBixQIzHS7rfuivGhkQXcJg==
X-Gm-Gg: AZFdTZfbW+drC6mvQHAIRCPvbo4j56B/tjiqAYnJ/YyuxSvXVvrXObrQP4bDsFavcLV
	otqp8l5Sg+P4JCvTeh24vSfhEEy0Jdp3ztuMst/1wTnyZVPlTjQN67Mqlq9dWMTjiXjxQelJIGB
	XYR/fCfAC4sgcozIBfMiBax2sATxh5D/1/2kLkAcJX9sJH28MwKGFgiL6gB4bK8klfzhmkRbmKO
	faGQOPDO3O3Ia4TXhkpR8lWDIdwLDH3j3LTLfc2lqrVNx8NLGvrrsjODWrLGdzZFolCTDwB/nS/
	drGr35pk7e9MmXaG8gl5CLbQWzwHBve/XfDonuyYkTJxGuAuqdu9mUa9YvXT6rnT82w6EYOzTtQ
	ovL/hreSzC0cHPGAd45Az8z7zn2jwgjApkrGXUpEufTFGdiQlqgcMoAc5RsSYbRTLKxTtnRa4kA
	XvTIHanQQEQiWMrF4Zh3466cDmcPB0f2C9lGm4bZ7QLJMWuQer80+Tll6tS8+2OG72foV+n5MB2
	6wHSYqCTawDYXttDpjeizT1UoF2JqLzhzslqbkkB0xN63JqbsTJEJTPOSbLO5dGYOLYPxyUdZu1
	NXY0YJfb7rd+oVKQFHy6/bGv07Z4nvoUg8nAtt+eeuV16oGXZC4HsQFrnV18KF6rdPKWKSqlHV9
	q9gUYQKViCVvEJbtyZCZhsD0kU0dpZf4gLEvQWyxg/hO0y7v8PS1WGewNPTGk+uWFHGR0bLJIQ3
	zd4hSmNY0VZZoSoP+L58PRtwAxVIvFAsB69UrIxEEyh/zyKelyj+JGi2CuvHuK7bXUhLj602pFp
	rlBV1huaoTQiMo9M7jMXTaKX2flWYYDhcc1qHUnuB7s+yyeYQt/kEM7tOcq0fOPGMywnYsnSgjs
	wMlI5+RIoNERSQuSUYTvEqdnVQXdvm88mwb1ooczq123dlUybytINb8VxD3kZqv6TguRhILdB2G
	yOAyTTnn6TCTdf3s19F4=
X-Received: by 2002:aa7:c148:0:b0:6b7:8444:a44e with SMTP id 4fb4d7f45d1cf-6ba37cc0b7cmr4557133a12.4.1795371136615;
        Sun, 22 Nov 2026 10:12:16 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:15 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 2/9] wifi: ath11k: fill the TCL ring once per dequeue run
Date: Sun, 22 Nov 2026 19:12:06 +0100
Message-ID: <20261122181213.1016590-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_181218_514811_C1875459 
X-CRM114-Status: GOOD (  23.19  )
X-Spam-Score: -0.2 (/)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each frame a TXQ hands over took the TCL ring lock twice, read the
hardware tail pointer three times and wrote the head pointer once. Take
the ring once for the whole dequeue run instead: read the free count at
the start, queue the frames on that ring and write the head pointer after
the last one. ath11k_dp_tx() takes the ring the caller holds and does not
fall back to another ring while it is held.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 37 ++++++++++----
 drivers/net/wireless/ath/ath11k/dp_tx.h |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c   | 68 ++++++++++++++++---------
 3 files changed, 72 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 4f509771d60a..bd5edab32a1f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -108,8 +108,13 @@ bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring)
 	return atomic_read(&tx_ring->num_txbuf) < DP_TX_IDR_SIZE - 1;
 }
 
+/*
+ * A caller that passes @held_ring holds that TCL ring's lock with an access
+ * open, and ends the access itself once it has queued its last frame; the frame
+ * goes on that ring or not at all.
+ */
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
-		 struct ath11k_sta *arsta, struct sk_buff *skb)
+		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_dp *dp = &ab->dp;
@@ -137,7 +142,10 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 	pool_id = skb_get_queue_mapping(skb) & (ATH11K_HW_MAX_QUEUES - 1);
 
-	ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb_get_queue_mapping(skb));
+	if (held_ring >= 0)
+		ring_selector = held_ring;
+	else
+		ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb_get_queue_mapping(skb));
 
 tcl_ring_sel:
 	tcl_ring_retry = false;
@@ -157,7 +165,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (unlikely(ret < 0)) {
-		if (ring_map == (BIT(num_tx_rings) - 1) ||
+		if (held_ring >= 0 || ring_map == (BIT(num_tx_rings) - 1) ||
 		    !ab->hw_params.tcl_ring_retry) {
 			atomic_inc(&ab->soc_stats.tx_err.misc_fail);
 			return -ENOSPC;
@@ -256,11 +264,17 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	hal_ring_id = tx_ring->tcl_data_ring.ring_id;
 	tcl_ring = &ab->hal.srng_list[hal_ring_id];
 
-	spin_lock_bh(&tcl_ring->lock);
-
-	ath11k_hal_srng_access_begin(ab, tcl_ring);
+	if (held_ring < 0) {
+		spin_lock_bh(&tcl_ring->lock);
+		ath11k_hal_srng_access_begin(ab, tcl_ring);
+	}
 
 	hal_tcl_desc = (void *)ath11k_hal_srng_src_get_next_entry(ab, tcl_ring);
+	if (unlikely(!hal_tcl_desc && held_ring >= 0)) {
+		ab->soc_stats.tx_err.desc_na[ti.ring_id]++;
+		ret = -ENOSPC;
+		goto fail_unmap_dma;
+	}
 	if (unlikely(!hal_tcl_desc)) {
 		/* NOTE: It is highly unlikely we'll be running out of tcl_ring
 		 * desc because the desc is directly enqueued onto hw queue.
@@ -287,11 +301,12 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	ath11k_hal_tx_cmd_desc_setup(ab, hal_tcl_desc +
 					 sizeof(struct hal_tlv_hdr), &ti);
 
-	ath11k_hal_srng_access_end(ab, tcl_ring);
-
-	ath11k_dp_shadow_start_timer(ab, tcl_ring, &dp->tx_ring_timer[ti.ring_id]);
-
-	spin_unlock_bh(&tcl_ring->lock);
+	if (held_ring < 0) {
+		ath11k_hal_srng_access_end(ab, tcl_ring);
+		ath11k_dp_shadow_start_timer(ab, tcl_ring,
+					     &dp->tx_ring_timer[ti.ring_id]);
+		spin_unlock_bh(&tcl_ring->lock);
+	}
 
 	ath11k_dbg_dump(ab, ATH11K_DBG_DP_TX, NULL, "dp tx msdu: ",
 			skb->data, skb->len);
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 760251c68b93..380e35e354f5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -20,7 +20,7 @@ struct ath11k_dp_htt_wbm_tx_status {
 void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
-		 struct ath11k_sta *arsta, struct sk_buff *skb);
+		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
 int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 				    int budget);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a0f1451a8faf..090df2f1cadf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6521,7 +6521,7 @@ static int ath11k_mac_mgmt_tx(struct ath11k *ar, struct sk_buff *skb,
 
 static int ath11k_mac_tx(struct ieee80211_hw *hw,
 			 struct ieee80211_tx_control *control,
-			 struct sk_buff *skb)
+			 struct sk_buff *skb, int held_ring)
 {
 	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
 	struct ath11k *ar = hw->priv;
@@ -6559,7 +6559,7 @@ static int ath11k_mac_tx(struct ieee80211_hw *hw,
 	if (control->sta)
 		arsta = ath11k_sta_to_arsta(control->sta);
 
-	ret = ath11k_dp_tx(ar, arvif, arsta, skb);
+	ret = ath11k_dp_tx(ar, arvif, arsta, skb, held_ring);
 	if (unlikely(ret)) {
 		ath11k_warn(ar->ab, "failed to transmit frame %d\n", ret);
 		ieee80211_free_txskb(ar->hw, skb);
@@ -6572,7 +6572,7 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 			     struct ieee80211_tx_control *control,
 			     struct sk_buff *skb)
 {
-	ath11k_mac_tx(hw, control, skb);
+	ath11k_mac_tx(hw, control, skb, -1);
 }
 
 void ath11k_mac_drain_tx(struct ath11k *ar)
@@ -10118,7 +10118,7 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	struct hal_srng *tcl_ring;
 	struct sk_buff *skb;
 	u32 ring_selector;
-	int num_free;
+	int num_free, avail;
 	int ret;
 	u8 ring_id;
 
@@ -10132,38 +10132,60 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	 * TCL ring or MSDU idr ends the whole round before a frame is taken
 	 * from the queue, and so does a frame the hardware refuses anyway,
 	 * as long as a frame in flight will restart it.
+	 *
+	 * The run holds the TCL ring for its whole length: the free count is
+	 * read once and the head pointer written once, after the last frame,
+	 * rather than per frame. The head pointer is a device register, which
+	 * is not written while the firmware restarts or when no frame was
+	 * added.
 	 */
-	while (1) {
+again:
+	if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags)))
+		return -ESHUTDOWN;
+
+	spin_lock_bh(&tx_ring->wake_tx_lock);
+	spin_lock_bh(&tcl_ring->lock);
+	ath11k_hal_srng_access_begin(ar->ab, tcl_ring);
+	num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, false);
+	avail = num_free;
+
+	ret = 0;
+	while (num_free) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
 				      &ar->ab->dev_flags)))
 			break;
 
-		spin_lock_bh(&tx_ring->wake_tx_lock);
-
-		spin_lock_bh(&tcl_ring->lock);
-		num_free = ath11k_hal_srng_src_num_free(ar->ab, tcl_ring, true);
-		spin_unlock_bh(&tcl_ring->lock);
-
-		if (num_free == 0 || !ath11k_dp_tx_idr_has_room(tx_ring)) {
-			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			if (ath11k_mac_mark_txq_starved(ar, txq->ac))
-				return -ENOSPC;
-			continue;
+		if (!ath11k_dp_tx_idr_has_room(tx_ring)) {
+			ret = -ENOSPC;
+			break;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
-		if (!skb) {
-			spin_unlock_bh(&tx_ring->wake_tx_lock);
+		if (!skb)
 			break;
-		}
 
-		ret = ath11k_mac_tx(hw, &control, skb);
+		ret = ath11k_mac_tx(hw, &control, skb, ring_id);
+		if (unlikely(ret == -ENOSPC || ret == -ENOMEM))
+			break;
+		ret = 0;
+		num_free--;
+	}
 
-		spin_unlock_bh(&tx_ring->wake_tx_lock);
+	if (num_free != avail &&
+	    likely(!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))) {
+		ath11k_hal_srng_access_end(ar->ab, tcl_ring);
+		ath11k_dp_shadow_start_timer(ar->ab, tcl_ring,
+					     &ar->ab->dp.tx_ring_timer[ring_id]);
+	}
+	spin_unlock_bh(&tcl_ring->lock);
+	spin_unlock_bh(&tx_ring->wake_tx_lock);
 
-		if (unlikely(ret == -ENOSPC || ret == -ENOMEM) &&
-		    ath11k_mac_mark_txq_starved(ar, txq->ac))
+	if (!num_free)
+		ret = -ENOSPC;
+	if (unlikely(ret == -ENOSPC || ret == -ENOMEM)) {
+		if (ath11k_mac_mark_txq_starved(ar, txq->ac))
 			return ret;
+		goto again;
 	}
 
 	return 0;
-- 
2.53.0


