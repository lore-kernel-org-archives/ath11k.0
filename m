Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89551606A31B
	for <ath11k@archiver.kernel.org>; Thu,  5 Nov 2026 05:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2wXA553F;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hXzpVksA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NVAnmuoA9gL7mXf9hPCOfc86UVshuAYigYl6E9l0mzE=; b=2wXA553FzMgf7vZN8O8YIcTwD1
	DC1tA7k+UBa401K7a/2u4RIQLs38zgJeKTKnQG1sDRSaisPRaPvULFaaaSUsT1FERQhJa/lW9u95X
	pAnV4p0wuLtGutpGPudkn+eOYVQ+tq44lgVwbMbF8FnLVL+rKVNEJ06AwKBGTIQBDmCSGzTKsuNyI
	Bz3sbJmY/xn2uj/7pjYPT/W2IJJwkdQ7no9m+J/yvXnnjoi7/zbH9dv182Y3tYQtLINbzgSGQ5B3B
	CYCSOFCmfjSt7M9PNjPfVk/WD9fy6Z9EQpe7EAhE8x9fDX1deOp8+li/5NjHqju0hkw/Ps8XWV2id
	a79gEHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpqZ-00000007qnB-42eM;
	Thu, 05 Nov 2026 05:17:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpqY-00000007qn1-23OK
	for ath11k@lists.infradead.org;
	Thu, 05 Nov 2026 05:17:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD032438B8;
	Thu,  5 Nov 2026 05:17:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793855829;
	b=ydWvnhJ+iXKCwRwKEWLjIHUNJehxIAB+GeYngUESP3V3ZJXnAbAMCUZcMnVuwKEq5LFr
	 6ljZFdWDlpmaRrLGA0YX8AV8f4UOoexUAGW9hlspbK/VNUvrocK+kew+3EVK2IaJI5mCe
	 2pm047yYZ4CGQAAG9/HxqfCpuuoZh1iV0Ik/eec3P5q+myzET+1uIvdl23shSB82r0xCs
	 G8qWURJoLmsrCdmAvYku6KS2so4jsUS6h1Vj9i81BSsG1kLwX/Fbh1PXMExce3pNKIY+s
	 G/vzmdTEP5CGDRQF/bZdGCm/nctYCag14xXXfyy65TmeN0KaFxM6tAwLLyAa/kIEyGw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793855829;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NVAnmuoA9gL7mXf9hPCOfc86UVshuAYigYl6E9l0mzE=;
	b=eXZVAnasZn1C7gix2H1EsNr/5eYACSuJkWlroYS0ohAC2xT/SkAxbD3SYljZZuRYLN4i
	 2cgslid7iLDJm51mwE0jpT0q30OZ9RVmW/jkZHi69/woW1j5izpucFBNaBAUD1+CdiF6A
	 6PYs7WC82XXirE4QiW8GCHfFCAqzsTOjV8HZCJWAF36hX4QN/sZHCZsBUhhaaJ/UndvaX
	 cCebIUMsb7YTQtT+RUK6GdlTZ3bXbLQGeX8n542+Y/JR9SgbNZ5Hpvp5cEhU5lqGE0Etz
	 SFgh8HWMISwVi5u3hbGVoCBAHErqODml8tmNA0oYfn3Ggox5F1TbkeJYIYP70kKVhzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDE201F0093A;
	Thu,  5 Nov 2026 05:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793855829;
	bh=NVAnmuoA9gL7mXf9hPCOfc86UVshuAYigYl6E9l0mzE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=hXzpVksAkJeKpAfZWbEk25HswGzQIzEI4CUN4dI3QJ0QRB5P2btplBFIv+1ealQal
	 VOU9EiAhdgoTRJbLtkF9X4oM3nSPZoMM/hLyuPs3zuSNpo8IxgnQEI0ymQ7uDq/Nld
	 1fv9TOO7W1INrmu5AnAV8JuA8dtRkUG8ykGv7P/036/RbrTI2GyrbeBgA3vLHmQOge
	 EV+6aZt06dPus+tp2wpU6Mh8NVVWDSlviY9kaTrLwLSehu4PdE0oegFJoRN0eOcebN
	 qkNBdhbk+T7yRen8MPJjvdNd9T+BU5GepAuXEQ5hBFn2sM8Ic+0lBGvq1eHLg2xeTh
	 wRtAKF/EBxfKw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 64818470B5;
	Thu,  5 Nov 2026 05:17:08 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 23:17:08 -0600
Subject: [PATCH ath-next] wifi: ath11k: drop the full monitor state left
 from before a monitor stop
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-ath11k-full-monitor-stale-hold-v1-1-10a680c3ad2f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFMR7GoC/yWNywrCMBBFf6XM2oEkfSD+irhI06kZjYlkUimU/
 ruxLg+He+4GQplJ4NJskOnDwilW0KcGnLfxTshTZTDKDFqrDm3xWj9xXkLAV4pcUkYpNhD6FCZ
 0pu3VaE03tGeokXemmdfj4Ap1i5HWAre/kWV8kCu/Puz7F0NilUWMAAAA
X-Change-ID: 20261104-ath11k-full-monitor-stale-hold-c2350ba24638
To: Jeff Johnson <jjohnson@kernel.org>, 
 Anilkumar Kolli <quic_akolli@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793855827; l=8294;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=XLX7K0utKQw/gsxKboFItICJfxTeRdNiCzLnMMpwlvs=;
 b=9rxh9ZYJ9W6nXOONrK46TRxpAz7oEQ3qfJsONmBMCxlOjS3CRzK7NpUDhPAXJI/USohyHnXNH
 0IseRnpfh0TBfFMz4LBb1umhgeC56vfjVpdOtLLuGWpetqcFmdDG9SQ
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

In full monitor mode (QCN9074) the monitor destination ring is read
first, and the PPDU it ends on is held, together with the destination
ring, until its status buffer turns up on the monitor status ring. A
status buffer with the same PPDU ID delivers the PPDU and ends the
hold; one that reads as newer (LEAD) drops the PPDU and ends it; one
that reads as older (LAG) keeps the hold.

The hold outlives a monitor stop. While the monitor is stopped,
ath11k_dp_rx_process_mon_rings() reaps the status ring on the plain
path, so the held PPDU's status buffer is gone. When the monitor starts
again, the held PPDU ID is compared with whatever the status ring
carries after the gap, and the 16-bit compare in
ath11k_dp_rx_mon_update_status_buf_state() reads LEAD or LAG depending
on how far the PPDU counter moved meanwhile. After a long, busy stop it
reads LAG about half the time, and then the hold never ends: the
destination ring fills, the firmware reports backpressure on the
monitor destination ring, and the radio receives nothing more, scan
results included, until the driver is bound again.

Seen with a QCN9074 used as a scanning radio and lent, for about 25 s
at a time, as the station of a client test: it went deaf after 4 of 7
loans, each time with the hold set, the status ring empty (buf_state
DP_MON_STATUS_REPLINISH) and the destination ring full. The monitor
also stops and starts at each channel change of a scan, and a PPDU was
held at nearly every start (4022 of 4033).

When the monitor starts, drop the held PPDU and the destination ring
entries left behind it, and clear the hold. Also bound a hold: more
status buffers than the status ring holds cannot come before the held
PPDU's own, so drop the PPDU then rather than wait.

With this, the radio kept receiving through 13 hours of such loans,
about four an hour, and two more units through 9 and 11 hours.

Fixes: 7e2ea2e94704 ("ath11k: Process full monitor mode rx support")
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp.h    |  1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 75 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp_rx.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c   |  3 ++
 4 files changed, 80 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 84f66839f0c6d..0f2d278eb709d 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -162,6 +162,7 @@ struct ath11k_mon_data {
 	bool hold_mon_dst_ring;
 	enum dp_mon_status_buf_state buf_state;
 	dma_addr_t mon_status_paddr;
+	u32 hold_status_bufs;
 	struct dp_full_mon_mpdu *mon_mpdu;
 	struct hal_sw_mon_ring_entries sw_mon_entries;
 	struct ath11k_pdev_mon_stats rx_mon_stats;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a55..c941f35741167 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5595,6 +5595,15 @@ ath11k_dp_rx_process_full_mon_status_ring(struct ath11k_base *ab, int mac_id,
 			   pmon->buf_state == DP_MON_STATUS_LEAD) {
 			sw_mon_entries->drop_ppdu = true;
 			pmon->hold_mon_dst_ring = false;
+		} else if (quota &&
+			   ++pmon->hold_status_bufs > DP_RXDMA_MON_STATUS_RING_SIZE) {
+			/* More status buffers than the ring holds came before
+			 * this PPDU's own: it is not coming.
+			 */
+			ath11k_dbg(ab, ATH11K_DBG_DATA, "full mon: ppdu %u held past %u status buffers, dropped\n",
+				   sw_mon_entries->ppdu_id, pmon->hold_status_bufs);
+			sw_mon_entries->drop_ppdu = true;
+			pmon->hold_mon_dst_ring = false;
 		}
 
 		if (!quota)
@@ -5672,6 +5681,7 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
 		pmon->buf_state = DP_MON_STATUS_LAG;
 		pmon->mon_status_paddr = sw_mon_entries->mon_status_paddr;
 		pmon->hold_mon_dst_ring = true;
+		pmon->hold_status_bufs = 0;
 next_entry:
 		ring_entry = ath11k_hal_srng_dst_get_next_entry(ar->ab,
 								mon_dst_srng);
@@ -5697,6 +5707,71 @@ static int ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
 	return quota;
 }
 
+/* Drop what full monitor mode kept from before the monitor was stopped: a
+ * PPDU held for its status buffer and the destination ring entries behind
+ * it. While the monitor is stopped the status ring is reaped on the plain
+ * path, so their status buffers are gone, and a hold that compares its
+ * PPDU ID with what the status ring carries after the gap can wait for
+ * good. The destination ring then fills and stalls the RXDMA.
+ */
+void ath11k_dp_rx_full_mon_reset(struct ath11k *ar)
+{
+	struct ath11k_base *ab = ar->ab;
+	struct ath11k_pdev_dp *dp = &ar->dp;
+	struct ath11k_mon_data *pmon = &dp->mon_data;
+	struct hal_sw_mon_ring_entries *sw_mon_entries = &pmon->sw_mon_entries;
+	struct sk_buff *head_msdu, *tail_msdu, *msdu, *next;
+	struct hal_srng *mon_dst_srng;
+	u32 rx_bufs_used = 0, entries = 0;
+	bool held;
+	u16 ppdu_id;
+	void *ring_entry;
+
+	spin_lock_bh(&pmon->mon_lock);
+
+	held = pmon->hold_mon_dst_ring;
+	ppdu_id = sw_mon_entries->ppdu_id;
+	ath11k_dp_rx_full_mon_drop_ppdu(&ab->dp, pmon->mon_mpdu);
+
+	mon_dst_srng = &ab->hal.srng_list[dp->rxdma_mon_dst_ring.ring_id];
+	spin_lock_bh(&mon_dst_srng->lock);
+	ath11k_hal_srng_access_begin(ab, mon_dst_srng);
+	while ((ring_entry = ath11k_hal_srng_dst_peek(ab, mon_dst_srng))) {
+		head_msdu = NULL;
+		tail_msdu = NULL;
+		rx_bufs_used += ath11k_dp_rx_full_mon_mpdu_pop(ar, ring_entry,
+							       &head_msdu,
+							       &tail_msdu,
+							       sw_mon_entries);
+		for (msdu = head_msdu; msdu; msdu = next) {
+			next = msdu->next;
+			dev_kfree_skb_any(msdu);
+		}
+		entries++;
+		ath11k_hal_srng_dst_get_next_entry(ab, mon_dst_srng);
+	}
+	ath11k_hal_srng_access_end(ab, mon_dst_srng);
+	spin_unlock_bh(&mon_dst_srng->lock);
+
+	pmon->hold_mon_dst_ring = false;
+	pmon->hold_status_bufs = 0;
+	pmon->mon_status_paddr = 0;
+	pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+	memset(sw_mon_entries, 0, sizeof(*sw_mon_entries));
+
+	spin_unlock_bh(&pmon->mon_lock);
+
+	if (rx_bufs_used)
+		ath11k_dp_rxbufs_replenish(ab, dp->mac_id,
+					   &dp->rxdma_mon_buf_ring,
+					   rx_bufs_used,
+					   HAL_RX_BUF_RBM_SW3_BM);
+
+	if (held || entries)
+		ath11k_dbg(ab, ATH11K_DBG_DATA, "full mon: monitor start: dropped %s ppdu %u, %u dest ring entries\n",
+			   held ? "held" : "no held", ppdu_id, entries);
+}
+
 int ath11k_dp_rx_process_mon_rings(struct ath11k_base *ab, int mac_id,
 				   struct napi_struct *napi, int budget)
 {
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index f69d9301e0a16..ea005537e6275 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -81,6 +81,7 @@ int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 			   int (*iter)(struct ath11k_base *ar, u16 tag, u16 len,
 				       const void *ptr, void *data),
 			   void *data);
+void ath11k_dp_rx_full_mon_reset(struct ath11k *ar);
 int ath11k_dp_rx_process_mon_rings(struct ath11k_base *ab, int mac_id,
 				   struct napi_struct *napi, int budget);
 int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..a4556d8e75cdf 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1185,6 +1185,9 @@ static int ath11k_mac_monitor_start(struct ath11k *ar)
 		return ret;
 	}
 
+	if (ar->ab->hw_params.full_monitor_mode)
+		ath11k_dp_rx_full_mon_reset(ar);
+
 	set_bit(ATH11K_FLAG_MONITOR_STARTED, &ar->monitor_flags);
 
 	ar->num_started_vdevs++;

---
base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
change-id: 20261104-ath11k-full-monitor-stale-hold-c2350ba24638

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



