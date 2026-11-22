Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D660A382D
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AFmj4BMz;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XdA6tRI0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=; b=AFmj4BMzEp3ptg
	sc5EVuNCQQUd0uvNeBMxwztxANCovmQvpltRkySszW6RoOEDsKa4UGLi/HI1wKFOuXU/1WR5O5kex
	L3OtACwaDoq4N1UIQL4r0Ft0/6HWjPJZVR1n/HepYSj7THQje9ZQxWV3hCEg4WUplY8va51UEUd/T
	NDDy9f/FBxSqiCJg0B0pJEurABPQwPlc+UUk+FGo8rm2WAJJTsGgrHKUHi+bcITlKpMyaWDkZbl7x
	N4TscEWnF8dv3VcipBXpy6tingvKvIQA90b9NF2NrKZ8qFjbsJTiwimjLU2FWJc1xNE4rTTqRd9Vs
	MiRh3Zb4cSpEUiu8D9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2c-00000001UJW-1tbS;
	Sun, 22 Nov 2026 18:11:54 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2Y-00000001UDg-1FEu
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so482291266b.2
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371109; x=1795975909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=;
        b=XdA6tRI0CnIZ8PpoharAadPd59YShc1WERkHf52WDtJ+/2ZQD8o6Q+t+t+THsEwhNY
         /oEdNlFZu1AyndIMywUEK1GxjGN6l3pMNtJW3SajONYLxYqPaO8Z2nE4FzcXO1BtF3Hd
         Go+fIfF8I4cMMwSzNZmMN6iK6ji98bwcp0x0Wi37wtdtrJI4NAL2aZwiK142+6K2ucQc
         9e1GzEuR7AofGRv93ac5KFev1pH6n4q0d4JTxI9vAWJOAiFPicpihh8U/n7qSJYxm22n
         cFaKT/setFo+Bf7qrLWQyNDeDe/pjfvXYErxYOSTI8yYRY/8d2/D3nw69li43/0xnA5E
         5ANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371109; x=1795975909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPQ6Z0+Ejkb86/QqsMqCsz6Be6K0g3JHqbeFjXLeLac=;
        b=uwsSo2L65uR1ORq/28kFaWFZqQR+yDMAi57E/CHLA4kc+O/lOxCkb4ayVlcmVZ71KT
         U+EHIHstWaVFhXje7BoWJVV8ooL4iiK15mPudmJPzgMH5HdhaMR5ajpDXXEdHE42lgwd
         pXUgnoaV0Zhng3Tv6ysYcp9NWoaJRnm6hm4xQZ7McAWqvv2igRWFL62PXvsUvnaqajz3
         e+sHSnXBq7/n7APDTZPqwVu+g6Y36GC5PojMDrId8e0wtsB0NDKvkCUTxv+lWcN054yq
         yIi7GRsrXDZ0P67AMdyDuE7i5/Buc3ERbPKNiHDf0/P9+CP+/qouiLBhSWBQvdxGoPUj
         wmsQ==
X-Forwarded-Encrypted: i=1; AL+hErHWF3rlkyyNMD953lu2rCXpoFRa6fYAyhfM5NBtTXtRDgCv3w6qIoVYTY2GQ8EbP4jDr7/DcYY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/+322bIDxGqdioLL9SnMtkE/x8lJ6xDjCX0iZe3K5BdpwPyvtS
	W25AuhbmlWeO8Bvzc5gMwQbEeak428tUeCPZO5ZQfFatQNmrd1PHIsH/gWnrdQeD3g==
X-Gm-Gg: AZFdTZeqdqFM8DbEYL5hT6/nDM1vbNRm9TnkOtTM5UKvb80OqKTSVZ8tI+F/BAr9KDy
	1XwqIXmPipnh28nNr9IHhKztS0MPY8+nL43UTCxLuO2Y81lH+mTgIr3b105sPn1gg1T4qAlV6W6
	uBPCil0MZD6rGGbJj3TU0n18tQAhCX2R7I5WzpqBMjQTBo87jIY3pYOt4p5PDnSdoOBEmfBOy3J
	WV22qInLjNh2bIavea5mWWHdg7vdAN4+KB1Fa5Ox/w3DB/eCuBn1b0vcFI3SpiiYd675xbF/I56
	fK0cMn3fCtWB1X6rySGWZKXDWqFBE0OL25vlVkeORH30Lt2sv4XzZN/Mbr8gFLR3SJzUwJeiucg
	ZOwxXXG05RpnHCfwJMMj+kLW8AbsxwdfoRw594iLWS0ydWAc27ZxFlXnYhUTVSArc7WoDR0v/+q
	CGRAFaSMj6epM6HY06miPHj4sQpzTFOoticOX78Lcsd+/Y9gxGqgXXXnSNzOBV4Uj6DyEf3nvas
	ekYsdrQFIxOyDObtXmyEtslGgjIxmIu4xhimEL+QRBtC+5JQPgE857GsnI+ye7Ftlg50Pk8DPXR
	guLKxK77k+rPijqcnmbHlws97MOfT4QVhFRJlBr08ocjM4mlHa0/Q4X61Fo7oig2Hw2AXNHTrA7
	JSNpXLCDn6t65UnmGiQW9wnvF9Kz/oZ19KyVgNqDgtrrpjBLO5CEvkUOoXn8U8hnMA6kkzJda3u
	bbiQ7KWxHdSgJIFJ1OSiBvEHg+npIV53rQZtHiNK0HIv3+JvbwE7/mX+5FpPbfy7hbvtI8KLP3A
	bQu8aN9SGJLTHVU65J0rD499qnti3Wz/zrADTKJJ821ozkebSEOHPMgL6Mnsc9K5HsmrNdTYLeb
	65LIwC5H3qsGKCxW+uDPvZj7sxNukDUoO2yfnN1kOCHul0kLRsH6098d9dKJULOJlSM81Lfw
X-Received: by 2002:a17:906:3814:b0:c41:cf68:bbcf with SMTP id a640c23a62f3a-c513ab497afmr548454966b.32.1795371108676;
        Sun, 22 Nov 2026 10:11:48 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:48 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 6/9] wifi: ath11k: run the TXQ scheduler on tx completion
Date: Sun, 22 Nov 2026 19:11:42 +0100
Message-ID: <20261122181145.1015729-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101150_371990_41892109 
X-CRM114-Status: GOOD (  15.56  )
X-Spam-Score: -2.1 (--)
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

A station at its airtime queue limit gets airtime back only when the
hardware completes its frames, but ath11k starts a round only from
wake_tx_queue, so the backlog waits for the next frame from the stack.
Start a round for each access category, taken from the frame's queue
mapping, that a reaped completion belonged to, whether the hardware or
the firmware released the frame.

TCP download from a wired host to one 1x1 VHT80 station, BE
aql_txq_limit 500/1000 us, 20 s, three interleaved runs per arm, sender
RTT:

                    Mbit/s              RTT mean ms   RTT max ms
  with this patch   94.5, 94.4, 94.6    68, 62, 67    126, 135, 121
  without           74.0, 78.5, 72.4    28, 27, 27     55,  40,  40

Without it the link idles between arrivals, which also lowers its RTT.
At the default limits both arms reach 88 to 95 Mbit/s.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 33 +++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mac.c   |  7 ++++++
 drivers/net/wireless/ath/ath11k/mac.h   |  1 +
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 081e79d3759c5..0cdc0493f10d2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -286,7 +286,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 				    int msdu_id,
-				    struct dp_tx_ring *tx_ring)
+				    struct dp_tx_ring *tx_ring,
+				    unsigned long *push)
 {
 	struct ath11k *ar;
 	struct sk_buff *msdu;
@@ -307,6 +308,8 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	ar = ab->pdevs[mac_id].ar;
+	__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+		  push);
 	ieee80211_free_txskb(ar->hw, msdu);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
@@ -352,7 +355,8 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 static void
 ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 				 struct dp_tx_ring *tx_ring,
-				 struct ath11k_dp_htt_wbm_tx_status *ts)
+				 struct ath11k_dp_htt_wbm_tx_status *ts,
+				 unsigned long *push)
 {
 	struct ieee80211_tx_status status = {};
 	struct sk_buff *msdu;
@@ -375,6 +379,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	info = IEEE80211_SKB_CB(msdu);
 
 	ar = skb_cb->ar;
+	__set_bit(ar->pdev_idx * IEEE80211_NUM_ACS +
+		  skb_get_queue_mapping(msdu), push);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
@@ -426,7 +432,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 static void
 ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 				     void *desc, u8 mac_id,
-				     u32 msdu_id, struct dp_tx_ring *tx_ring)
+				     u32 msdu_id, struct dp_tx_ring *tx_ring,
+				     unsigned long *push)
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath11k_dp_htt_wbm_tx_status ts = {};
@@ -451,12 +458,12 @@ ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 		else
 			ts.peer_id = HTT_INVALID_PEER_ID;
 
-		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts);
+		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts, push);
 
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
-		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring);
+		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring, push);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY:
 		/* This event is to be handled only when the driver decides to
@@ -736,9 +743,10 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct sk_buff *msdu;
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
+	unsigned long push = 0;
 	u32 *desc;
 	u32 msdu_id;
-	u8 mac_id;
+	u8 mac_id, i;
 
 	spin_lock_bh(&status_ring->lock);
 
@@ -782,7 +790,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			ath11k_dp_tx_process_htt_tx_complete(ab,
 							     (void *)tx_status,
 							     mac_id, msdu_id,
-							     tx_ring);
+							     tx_ring, &push);
 			continue;
 		}
 
@@ -798,12 +806,23 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		spin_unlock(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
+		__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+			  &push);
 
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
 		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
 	}
+
+	/* A completion returns the airtime the frame was charged, which is
+	 * what an airtime-limited station in that access category is waiting
+	 * on. The arrivals that would otherwise start a round are themselves
+	 * queued behind that limit.
+	 */
+	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
+		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
+					   i % IEEE80211_NUM_ACS);
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 226e1417ffe74..4527ab6977d04 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10156,6 +10156,13 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
+{
+	rcu_read_lock();
+	ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
 	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 127cb476b44b7..b78a357b5472e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -161,6 +161,7 @@ struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 
 void ath11k_mac_drain_tx(struct ath11k *ar);
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-- 
2.53.0


