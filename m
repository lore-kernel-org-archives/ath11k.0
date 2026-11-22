Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E82060A381D
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=quTuSTsX;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=sYNqrJnS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RophBW0lS5Y4OdQtBAA0javqVSRJb0KQxbS9aAGVlSw=; b=quTuSTsXsCU/GH
	GnpbUn2nFxmfvx5B257Fo2IVb9H1HhE4t6qtRTb5kGxKlx/8wYhpdnByf1EX44vruLZjKuUs0GX1t
	cgYUGrvWAAeP0QaAHgE8dQPOsluL6OFwiS6PCh6m9WPW+DuVg8hi5s5gYApOOXrrySe87mF0pgBTS
	Q+iEFmYciNruoyF/OUTzLGjp3qBoRDaR7ZWeUy7UJu91KWEI110G/vq9bnF/sJPRzRA03JfyeygBR
	l1pZUbfvubJOvRMZ5Ivzya5TyJTEExgOK0tFHgC2+k4DBYC1AC99o+2zy901r6XWrxHtFGIregyQE
	TgfrBAxQi6sU93quI4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2Z-00000001UEz-3b0M;
	Sun, 22 Nov 2026 18:11:51 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2U-00000001UBq-2FYz
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:50 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c5154989984so254349466b.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371105; x=1795975905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RophBW0lS5Y4OdQtBAA0javqVSRJb0KQxbS9aAGVlSw=;
        b=sYNqrJnS2Lg2F+KEA7Y5PaoGkUAnAHi7ZD4JeygQZEJ0O+lJOG3WttjA3ZOMN5HcrX
         2GWS3rO2TbBw1ubHYolPjcGlQZJQR8olpuXoj7w4xuoztV4cjlgsY7Qs5VERe1cf1RKb
         sR+vFdAKiM9Vy3n8K0jhnbCD41XYVAmVoLD8UJAtPWnkrv1zxBXs8dpxC6Kha1yAsZGM
         KtFlPKcNhwtSXj5cqr8xQk0umfp+kNisgBjmQX5VTdWZwmRemO5EpfUC7vdcqyh7tD0S
         s+3wfxj1JIFeWyX9oVZQ84rKP8A4bBfIIkpOh6ShQWRmnzfrNT5EbJQSZRpEFPXdP/mU
         kmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371105; x=1795975905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RophBW0lS5Y4OdQtBAA0javqVSRJb0KQxbS9aAGVlSw=;
        b=jSUBk/MUK8EHTD99831Ld9Gq8f60P6R7mmOgSYvG5yyx6R3Qw3Vl7RRi4qGTz2T0xR
         XvwjAe9mxQcUyHRDOjxNyvsXJNxL++nJdplH9YayE4r2JDcNaR9lN5QLfHAznwUXiKXo
         f8bfa7eb5/qnk8VE6iYk4DBUOMXyaNcH5AsBRCS6f6wDXFYjT6BKTPdBfTYTt34bHstI
         MC4d5VfOeWHsoTz0FMy+MKC2fRRO5JcL+Qk0p2DTrjMRD9MwNsMzflYRaj9wg06ys+Zb
         WCmKZgag1aXB2DFGolP6/qsNbp4/PhE4di+QL2ZpAb/oUlF62z6fVllcGVhwh7PYG3OB
         tmig==
X-Forwarded-Encrypted: i=1; AL+hErE3oQ3cXh7daONfYFP0iZ77fof/PgOJzuD5+2LStK+D3WjVRQYxZTQrf6QNP9wdtSZT/EKPrE8=@lists.infradead.org
X-Gm-Message-State: APuU4Z/1mAQzKlxdJF5Li53jq7AytisgWdCjI5iu5jhRQvMJ/C/pvnpJ
	TX8nXJR+WDxnf8u25givllZr2MdYnlKLKa29UO7fs/PervnDbEK6WIMPkbXPg75Mtw==
X-Gm-Gg: AZFdTZcA018D4+YEFdYt/0ZAgXy8P9P/faXJULJ1mxnNMvGJHyCcDaPIKqbxQvQSrtp
	DsUC+lBCkvCbL9GwBozzkjVI4cIsfQCcrKfYf443qoipEIWtGGBEz0BVQKDfKBNnv/VLwb8g6+W
	njZLKbjZIPFXSV8p6Qaw81Mz3lLPdmBwpTeOrp2aiso3VdKVZJSwMGeEwpNSHUOYfrEnR86bHVN
	05bxewlI7VpNtFxrfAkaVFMOkCnsJQyx84siNNUhqSvx4aBIVK4N8ngK+WiW6tXvMc9F46d951u
	tg2yorm8++up9OaM9inIxGt9ebfsGY2VP+PYCVmwEaXD0UbTNKs5+OVBBybtXP8JzntHDhrKtcu
	LQswCXn0AUYSPIDtDKBdGX6223NfpBSSfTK/s4dufluFkEIbrLdJvg7MO9NRlACbD4W+5GXgEDH
	2XW0cytqPtjP2wd6KmlyLaxuPErmo5G9pLd6gEjA4UGVWJI8BN9lHcDgafX+YxIEj15NLXvWt1Q
	SVBmbkoIf80toY2vkcupaNipv2SXjr7zFA5jtN8XouIlIxoTEkUm5q6J9QzZL3VkGCZcaEBZGnA
	U8NszlVBGnYtGeC+cC6C49LJirtl4P/QzIWPFF1fqaxtzKliCzEQO0AnTx7ib98KLWDtmsEukGO
	ttXe1QlTZpLRz9hvc0iCoKG+F54sLysOtnt73Hr/tkwZE9r/KWkjI7Yil31w3aTBQA116QywXL+
	/fN9d+U3q+rSxRX00TrpRguSsNfxdRHlMoa/OFVuaopPLUYjZ9wt8dooPcW5rqu5ksW5ldYf7sL
	NrTZXhUJ+ZhXHCvnb4BR3hRhqBbjKsLV80C2uX58YOBu6NrQsRFNhCRBeygOpuNlwzoVtupoQCK
	uYWPFVsh6rZ44j8yNAcGrmORa+qZ/dTVsra1SYjmWOEXAvoVJw3ztSXQlOWAWi4ZIWiwo5dU
X-Received: by 2002:a17:906:3388:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c513a5ec801mr604533666b.14.1795371104720;
        Sun, 22 Nov 2026 10:11:44 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:44 -0800 (PST)
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
Subject: [PATCH ath-next v6 1/9] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Sun, 22 Nov 2026 19:11:37 +0100
Message-ID: <20261122181145.1015729-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101146_629512_6630B7F3 
X-CRM114-Status: GOOD (  13.47  )
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

ath11k_dp_tx_free_txbuf(), reached for the HTT REINJ and INSPECT
statuses, frees the frame with dev_kfree_skb_any(), unlike every other
tx completion path in dp_tx.c, and so does ath11k_dp_free() for the
frames in flight when firmware recovery tears the rings down. This leaks
the tx status clone and idr entry mac80211 keeps for a frame whose
socket asked for status, as commit 29d15589f084 ("wifi: ath11k: Cleanup
mac80211 references on failure during tx_complete") fixed on three
sibling paths. With NL80211_EXT_FEATURE_AQL, set by the next patch, it
also keeps the frame's airtime charge, which ieee80211_restart_hw() does
not reset, and an access category at its limit is never scheduled again.

Free the REINJ and INSPECT frame with ieee80211_free_txskb(), and return
the frames in flight to mac80211 in ath11k_core_reconfigure_on_crash()
before ath11k_dp_free(), which also runs at teardown after the radios
are freed. Neither HTT status occurred on the hardware below, and the
recovery path was not exercised; both changes are by inspection.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c  |  1 +
 drivers/net/wireless/ath/ath11k/dp_tx.c | 39 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/dp_tx.h |  1 +
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f43..34cfdedea6adb 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2341,6 +2341,7 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 	ath11k_dp_pdev_reo_cleanup(ab);
 	mutex_unlock(&ab->core_lock);
 
+	ath11k_dp_tx_free_pending(ab);
 	ath11k_dp_free(ab);
 	ath11k_hal_srng_clear(ab);
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 083aca8ff355b..0e3b4e836001f 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -305,13 +305,50 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	skb_cb = ATH11K_SKB_CB(msdu);
 
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
-	dev_kfree_skb_any(msdu);
 
 	ar = ab->pdevs[mac_id].ar;
+	ieee80211_free_txskb(ar->hw, msdu);
+
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
 }
 
+/**
+ * ath11k_dp_tx_free_pending() - return the frames a crashed firmware holds
+ * @ab: device being recovered
+ *
+ * The radios outlive the firmware restart, and mac80211 keeps the tx status
+ * and the airtime charge of each frame until the driver returns it.
+ */
+void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
+{
+	struct ath11k_skb_cb *skb_cb;
+	struct sk_buff_head pending;
+	struct dp_tx_ring *tx_ring;
+	struct sk_buff *msdu;
+	int i, msdu_id;
+
+	__skb_queue_head_init(&pending);
+
+	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
+		tx_ring = &ab->dp.tx_ring[i];
+
+		spin_lock_bh(&tx_ring->tx_idr_lock);
+		idr_for_each_entry(&tx_ring->txbuf_idr, msdu, msdu_id) {
+			idr_remove(&tx_ring->txbuf_idr, msdu_id);
+			__skb_queue_tail(&pending, msdu);
+		}
+		spin_unlock_bh(&tx_ring->tx_idr_lock);
+	}
+
+	while ((msdu = __skb_dequeue(&pending))) {
+		skb_cb = ATH11K_SKB_CB(msdu);
+		dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len,
+				 DMA_TO_DEVICE);
+		ieee80211_free_txskb(skb_cb->ar->hw, msdu);
+	}
+}
+
 static void
 ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 				 struct dp_tx_ring *tx_ring,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9303b5ba6e012..9a26de411e83a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,6 +22,7 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
 void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 			      enum hal_reo_cmd_type type,
 			      struct ath11k_hal_reo_cmd *cmd,
-- 
2.53.0


