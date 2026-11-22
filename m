Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43071606A32A
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yCB3+XJD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jQLIKcB1;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=nPMxGokk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f2OWmUALbyxBFLTyN5GgUEDKjKDLoZvafZVRZ2yb6Js=; b=yCB3+XJDhD4K/H
	Eia5gNe6fn7HD+9MnKm2k3x2d9su9X1icKVqUr+XUMEXT8ashMsfuVPVjB9OG+zi2RUc2DyvQBXN6
	xDrIlIZMdE7KaUgMcNz1LyJF8z+gYpljWZU43yqoHN+OlHH0dGnBzOj3NL0d66qeKFUn2/1Psj0Dw
	nvQkusWeq/aRYA1EriTSFEkYKf12j/8h9eRsLujKlNVUNNOuZSx/tmGmhWNTY449wzt7rUFdLTdZt
	Kiz/y1Cc1F41uxHYb7MfM6DTiX+vWZxd3hUkPiGkK4iuUnEkHGk1pwernkWBwrnWK2X5tLuKp18fC
	NXi3f6bUvaJjjYoEZOLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3K-00000001V6B-36S3;
	Sun, 22 Nov 2026 18:12:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3B-00000001UwA-058i
	for ath11k@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=f2OWmUALbyxBFLTyN5GgUEDKjKDLoZvafZVRZ2yb6Js=; b=jQLIKcB1dZ/cRtxECxg+ZcixYa
	fiC05B3uQ0/95+Dicv/1lib/PYBfRly2DTTTmvsM2m7qMCrMggx86Th1ft1vVLs+Ea+zBxngZDKqx
	MX0lkEmIrUXXpP9a9OB/0wP31jfBbgujtUnF3Yw8kkjNZLhPAU6T7avC9s3vTLa7C6uvDCVC4In4G
	tirasB1Aq22K2QnASsxxcqmi45kBCZ/BdAmY55LDJ5prqysVl1ymPfA6zz5+LjKNlRb4T4A6HoFaC
	1UAWFmcqfe0rf63U0VDBrvXdP+zkCg+DyF8Cnm2WIDDFeflJwrTm/gWoYpi9tyVT4rpUdKH4Q6tIv
	xVnmFGeg==;
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC37-00000002Pjy-36PJ
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:12:27 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c515319dd89so269073166b.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371144; x=1795975944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2OWmUALbyxBFLTyN5GgUEDKjKDLoZvafZVRZ2yb6Js=;
        b=nPMxGokkoK33fH5MN7vRDXQBFkqCQlfGtV43Jscg94Iy1Yz29h5rAwxIcBwaBNcOcK
         zt4dJ0PBRtro8dMa7ROeWa9bywMdx/XXlt7vhTMC/ZgxT5lOwaH2Gncwv2s9VmzSe4N4
         mlMdb8QTZdtRcN3ft3iuU4R9EaK9lZdODTH9wN+MFAM7PD5Ok+uPumQlYVRoVUYfgiCG
         XcsPCaMuloBF2HCrbhlSSckVms9H0j0ku2PfjqjCaUDoyN2FodRT5vDgx6i9R/laA+Cl
         uXxbw4aoVrpRIDvt1bXIzV/5UVMYqN4LiO/SNqXb5Cjg5ZjiE1PMW5m6czcbyC3H0A0J
         Js8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371144; x=1795975944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2OWmUALbyxBFLTyN5GgUEDKjKDLoZvafZVRZ2yb6Js=;
        b=0UVvTWZrxKyo1t6XfCqyWRoo3KvooYTM74RuW7h8N5gfiujiIlwDXofBAjrqvjxKNW
         rn6hRFq9UQrs0fTzey4fz+Xk0fhGNqPT8Apla56pl+J13CubZoB2FFPqhLcW1oLDpLW/
         ehNrMjd779UGcaxpn2D8JghZbmDboRrLZBHPSLxs7vLaVF1+brDQjwvyuoWycqaeCLIP
         e4jt4HdyVMpbXA+wAjKPniSD9TFysiuYDWIr7k4+4pp9Z7XXfaQ3UTcVXZpXiADgrbp1
         mkGIZvk4pUzLeO2RrPK+xaeiSeXbxPmNF8Hu2f7oQUsp+1cYWcMUP+ntmkjm56q3qHGq
         5dpg==
X-Gm-Message-State: APuU4Z95BP/TvD8cjoaN21dTvcOFEd4oygH177AFL0WnTY306kuAnm7L
	005O2diRVDyUGJENYD8Lzz1/8GKYTb5xA/DX4wwKDY9HHahpoaCo5ofeKP/ZYOaEpw==
X-Gm-Gg: AZFdTZd97G8Y+GtA5b5deWSpF3ZRb9crNWwJFg6JUzPXlkZ9k6qxceMNcZJySS8FUBL
	RBrgC9eAfeHlgTgxzl6bz3bByzA2+Y6sen8M6nnRK/w6QYee7tIvnetI3JfjXZOSJagnIY2I7nc
	LKMeno6iiGFxjP+CcOmpqydg2dauLMuQErARo2P2cA6NO3oEJHRpx1GS0sWODaQ1uwB2TxBmyJ4
	orIH3w8DZO/kTaCAkLqOIomLS6KPhV57BTqK13CPr1VOBGJMlyCtqW1LQ29GhPPFrpZhhJFo4sv
	XEOksVJUGSt4ArKg7DLeblBxDClXMl+gGgz4hs+E8UP/8VX0pxg3Y7Ilpf+tCrcHS8ARzRq5726
	EjeMJdSbjRbIKqKWD6xFYcIFzTKJHmT0/Ke+elN9hH28FLYaZXphTUGW9TtimlWdF48mlfK/9UD
	UOf5e0CzKTPqZ+WBUzAJeg1ijwOBwOkWLEuFlhNU+wYaRCf4O/1If0t55d91raQUqrJeOJHh0UJ
	V8aRPKUhs6/yms3H4HNFyJEIwzn04tTfzQb7fFJ9GY8HQE8o3WgQkZ4S4h0Yr0c50eLMVrRuLMI
	JkZhFbpzfiPTn+c6IE2m2b/ZPgiByNKztndlYwi5/QmSjJOSSL2ko9QODEctFhchVAxWEEkepyI
	jyK+JJivd7uH7FNkVtLmvj4621ud4sJKW9lIIhpZovL1PmCACb3XtirEIVOpIM/qG/WRiFlnyCG
	kbUjUKdJsa0mKOOo1fzvSNL+XkBpyJRfIWykucANB34oFkt++a04SC9f8Hv8udZ8zSlUnAQ6IWE
	yjpg+Yhq+mBTavKrgsi4rUW7G9e52eJw149Pz79CFcizTtDO5ehRSQahh0V8KVSfZp2aU8hpG0D
	tJqeArBjr8hvK8EP+QAT7Zq8h2P4qPWs0hP12Gasl1m6QQxELHARGiFlvN9yrOKEjzmLoggcNOM
	M/7QB+ihF8oE5Yv16hw==
X-Received: by 2002:a17:906:da0e:b0:c46:a72:e0c3 with SMTP id a640c23a62f3a-c513a84dd04mr619183466b.16.1795371143413;
        Sun, 22 Nov 2026 10:12:23 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:22 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 5/9] wifi: ath11k: let the TCL segment TCP batches
Date: Sun, 22 Nov 2026 19:12:09 +0100
Message-ID: <20261122181213.1016590-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_181225_847424_E99BD650 
X-CRM114-Status: GOOD (  29.75  )
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

mac80211 can hand the driver a TCP batch as one frame with the segments
described by gso_size. Sending each segment as its own frame costs an
allocation, a mapping and a free per segment on the CPU.

The TCL segments a batch itself. The layout of the MSDU extension
descriptor, with its TSO fields and six buffer pointers, is that of the
HAL_TX_MSDU_EXTENSION_* field offsets in hal/wifi3.0/hal_tx_hw_defines.h
of Qualcomm's open-source WLAN host driver on CodeLinaro. A data command
of type EXT_DESC points at an MSDU extension descriptor that lists the
headers of the batch and the payload of one segment in up to six buffers,
and carries the segment's IP length, IP ID, TCP sequence number and flags,
which the TCL writes into the headers; it fills in the checksums the data
command enables. Queue every segment of a batch that way, with one mapping
of the headers and one of each payload piece, and report the batch to
mac80211 when the completion of its last segment arrives. Each segment
holds a reference on the batch and its own buffer id, so the completion
paths release a segment and return the batch only for the last one.

Every segment completes on its own: its status counts in the station
statistics as that of a frame of its length, and goes into the status of
the batch. The batch is reported to mac80211 as acked only if all its
segments were acked, with the most tries of any segment, as mac80211 reads
the tries as those of one frame at one rate and their sum over the segments
would overstate them by the number of segments. The tries now come from the
completion for every frame, where mac80211 got a constant 1 before.

The ring entries, ids and descriptors of all segments are taken before the
first is queued. A batch the TCL cannot take (no free descriptor, more
than five payload pieces in a segment, a frame that is not sent with
Ethernet encap, a protocol other than TCP, an IPv6 header followed by
extension headers, which the descriptor has no length for) is segmented in
software with skb_gso_segment(); the frames share the airtime charge of
the batch by leaving it on the last one. A frame with fragments but no GSO
is sent from one extension descriptor as a batch of one segment without
segmentation, with its linear part and up to five fragments as the
buffers, and is made linear only if that does not fit; ARP, EAPOL and DHCP
frames always stay linear. The transmit loop of a vif with the encap
offload takes a frame only while a batch of 16 segments fits in the TCL
ring, which is the most the interface offers. Once the firmware crashed,
no frame takes this path and the ring is not updated, as for the TXQ push.

The frames are built as the vendor host driver of the same TCL (Qualcomm's
open-source WLAN host driver on CodeLinaro) builds its TSO frames. The
buffer of the headers ends on an 8 byte boundary: that driver moves the
headers down into the head room by the excess, with the header offsets,
and maps the payload where it was (qdf_nbuf_adj_tso_frag() in
qdf/linux/src/qdf_nbuf.c, built with FIX_TXDMA_LIMITATION). Here that is
done for every frame sent from an extension descriptor, a frame with
fragments too, and the head is copied first only when it lacks the room or
is shared. The descriptors fill each 4096 byte block of their coherent
memory and none crosses into the next, as in that driver's pool of
descriptor pages (dp_tx_ext_desc_pool_alloc_by_id() in
dp/wifi3.0/dp_tx_desc.c). A batch enables the IP, UDP and TCP checksums in
the data command, as dp_tx_hw_enqueue_li() in dp/wifi3.0/li/dp_li_tx.c
does for a TSO frame. On IPQ8074, frames built without these rules are not
delivered at all, while built with them TCP batches and scatter-gather
frames went out routed and bridged, over IPv4 and IPv6 (observed on the
device).

The debugfs SOC statistics count the batches and segments, the batches
that were segmented in software and the frames sent as scatter-gather.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

A dequeue run now asks ath11k_dp_tx_idr_has_room() for as many MSDU ids as
it reserves TCL entries, since a batch the TCL cannot take whole is
segmented in software with an id per segment.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.c     |   1 +
 drivers/net/wireless/ath/ath11k/core.h     |  14 +
 drivers/net/wireless/ath/ath11k/debugfs.c  |   7 +
 drivers/net/wireless/ath/ath11k/dp.c       |  10 +-
 drivers/net/wireless/ath/ath11k/dp.h       |  37 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c    | 820 +++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h    |  15 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h |  46 ++
 drivers/net/wireless/ath/ath11k/hw.h       |   1 +
 drivers/net/wireless/ath/ath11k/mac.c      |  42 +-
 10 files changed, 912 insertions(+), 81 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 34cfdedea6ad..f945a7a12744 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -120,6 +120,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.sram_dump = {},
 
 		.tcl_ring_retry = true,
+		.tx_tso = true,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_dual_stations = false,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 74fbff296b60..11c79d0f5c34 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -122,6 +122,12 @@ struct ath11k_skb_cb {
 	u32 cipher;
 	struct ath11k *ar;
 	struct ieee80211_vif *vif;
+	/*
+	 * Of a frame sent from an MSDU extension descriptor: the most tries
+	 * of its segments so far, and how many were not acked
+	 */
+	u8 tso_try;
+	u8 tso_bad;
 } __packed;
 
 struct ath11k_skb_rxcb {
@@ -908,6 +914,14 @@ struct ath11k_soc_dp_stats {
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 hal_reo_error[DP_REO_DST_RING_MAX];
+	/*
+	 * TCP batches the TCL segments, their segments, and batches that
+	 * were segmented in software instead
+	 */
+	atomic_t tx_tso_batch;
+	atomic_t tx_tso_seg;
+	atomic_t tx_tso_sw;
+	atomic_t tx_sg;
 	struct ath11k_soc_dp_tx_err_stats tx_err;
 	struct ath11k_dp_ring_bp_stats bp_stats;
 };
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index ffe1f466aefb..28d3a4d8faab 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -703,6 +703,13 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 soc_stats->hal_reo_error[2],
 			 soc_stats->hal_reo_error[3]);
 
+	len += scnprintf(buf + len, size - len,
+			 "TCP batches segmented by the TCL: %d, their segments: %d, segmented in software: %d, frames with fragments sent as scatter-gather: %d\n",
+			 atomic_read(&soc_stats->tx_tso_batch),
+			 atomic_read(&soc_stats->tx_tso_seg),
+			 atomic_read(&soc_stats->tx_tso_sw),
+			 atomic_read(&soc_stats->tx_sg));
+
 	len += scnprintf(buf + len, size - len, "\nSOC TX STATS:\n");
 	len += scnprintf(buf + len, size - len, "\nTCL Ring Full Failures:\n");
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index e7eab9857f29..1d131ef39b7e 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1022,12 +1022,14 @@ static void ath11k_dp_tx_pending_cleanup(struct ath11k_base *ab,
 	u32 id;
 
 	for (id = 0; tx_ring->bufs && id < DP_TX_IDR_SIZE - 1; id++) {
-		msdu = tx_ring->bufs[id];
+		bool more;
+
+		msdu = ath11k_dp_tx_buf_put_id(ab, tx_ring, id, &more, NULL);
 		if (!msdu)
 			continue;
 
 		dma_unmap_single(ab->dev, ATH11K_SKB_CB(msdu)->paddr,
-				 msdu->len, DMA_TO_DEVICE);
+				 skb_headlen(msdu), DMA_TO_DEVICE);
 		dev_kfree_skb_any(msdu);
 	}
 }
@@ -1047,8 +1049,8 @@ void ath11k_dp_free(struct ath11k_base *ab)
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		spin_lock_bh(&dp->tx_ring[i].tx_idr_lock);
 		ath11k_dp_tx_pending_cleanup(ab, &dp->tx_ring[i]);
-		ath11k_dp_tx_bufs_free(&dp->tx_ring[i]);
 		spin_unlock_bh(&dp->tx_ring[i].tx_idr_lock);
+		ath11k_dp_tx_bufs_free(ab, &dp->tx_ring[i]);
 		kfree(dp->tx_ring[i].tx_status);
 		dp->tx_ring[i].tx_status = NULL;
 	}
@@ -1096,7 +1098,7 @@ int ath11k_dp_alloc(struct ath11k_base *ab)
 	size = sizeof(struct hal_wbm_release_ring) * DP_TX_COMP_RING_SIZE;
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
-		ret = ath11k_dp_tx_bufs_init(&dp->tx_ring[i]);
+		ret = ath11k_dp_tx_bufs_init(ab, &dp->tx_ring[i]);
 		if (ret)
 			goto fail_cmn_srng_cleanup;
 		spin_lock_init(&dp->tx_ring[i].tx_idr_lock);
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index f3dcba777a34..a923ba792e4b 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -80,6 +80,29 @@ struct dp_rxdma_ring {
 
 #define ATH11K_TX_COMPL_NEXT(x)	(((x) + 1) % DP_TX_COMP_RING_SIZE)
 
+/*
+ * The most segments of a TCP batch the TCL takes whole, and the payload
+ * pieces of one segment past the headers
+ */
+#define ATH11K_DP_TX_TSO_MAX_SEGS	16
+#define ATH11K_DP_TX_NO_EXT		0xffff
+
+struct ath11k_dp_tx_ext_map {
+	u32 dma[HAL_TX_MSDU_EXT_NUM_BUFS - 1];
+	u16 len[HAL_TX_MSDU_EXT_NUM_BUFS - 1];
+	/* the frame this descriptor makes, headers included */
+	u16 seg_len;
+	u8 num;
+};
+
+/* What a buffer id held when it was released */
+struct ath11k_dp_tx_seg {
+	/* the frame, or the batch the segment belongs to */
+	struct sk_buff *skb;
+	/* the length of the segment, or 0 for a frame sent as one buffer */
+	u16 len;
+};
+
 struct dp_tx_ring {
 	u8 tcl_data_ring_id;
 	struct dp_srng tcl_data_ring;
@@ -88,7 +111,18 @@ struct dp_tx_ring {
 	struct sk_buff **bufs;
 	u32 *free_ids;
 	u32 num_free;
-	/* Protects bufs and free_ids */
+	/*
+	 * MSDU extension descriptors for TSO segments, placed by
+	 * ath11k_dp_tx_ext_off(), the payload mappings of each, the
+	 * descriptor each buffer id uses, and the ones not in use
+	 */
+	struct hal_tx_msdu_ext *ext;
+	dma_addr_t ext_paddr;
+	struct ath11k_dp_tx_ext_map *ext_map;
+	u16 *ext_slot;
+	u16 *ext_free;
+	u32 ext_num_free;
+	/* Protects bufs, free_ids, ext_slot and ext_free */
 	spinlock_t tx_idr_lock;
 	/* Serializes wake_tx_queue operations for this ring */
 	spinlock_t wake_tx_lock;
@@ -212,6 +246,7 @@ struct ath11k_pdev_dp {
 #define DP_TCL_DATA_RING_SIZE_WCN6750	2048
 #define DP_TX_COMP_RING_SIZE		32768
 #define DP_TX_IDR_SIZE			DP_TX_COMP_RING_SIZE
+#define DP_TX_EXT_DESC_NUM		2048
 #define DP_TCL_CMD_RING_SIZE		32
 #define DP_TCL_STATUS_RING_SIZE		32
 #define DP_REO_DST_RING_MAX		4
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index feeaba575966..4fbdd15d1ce0 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -4,6 +4,9 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <net/gso.h>
+#include <net/tcp.h>
+
 #include "core.h"
 #include "dp_tx.h"
 #include "debug.h"
@@ -79,12 +82,36 @@ enum hal_encrypt_type ath11k_dp_tx_get_encrypt_type(u32 cipher)
 	}
 }
 
+/*
+ * The MSDU extension descriptors of a ring fill each 4096 byte block of their
+ * memory from its start, and none crosses into the next block. The memory
+ * from dma_alloc_coherent() is page aligned, so the blocks are too.
+ */
+#define ATH11K_DP_TX_EXT_BLOCK		4096
+#define ATH11K_DP_TX_EXT_PER_BLOCK	(ATH11K_DP_TX_EXT_BLOCK / \
+					 sizeof(struct hal_tx_msdu_ext))
+#define ATH11K_DP_TX_EXT_SIZE		(DIV_ROUND_UP(DP_TX_EXT_DESC_NUM, \
+						      ATH11K_DP_TX_EXT_PER_BLOCK) * \
+					 ATH11K_DP_TX_EXT_BLOCK)
+
+/*
+ * The buffer of the headers of an extension descriptor frame ends on this
+ * boundary
+ */
+#define ATH11K_DP_TX_EXT_ALIGN		8
+
+static size_t ath11k_dp_tx_ext_off(unsigned int slot)
+{
+	return slot / ATH11K_DP_TX_EXT_PER_BLOCK * ATH11K_DP_TX_EXT_BLOCK +
+	       slot % ATH11K_DP_TX_EXT_PER_BLOCK * sizeof(struct hal_tx_msdu_ext);
+}
+
 /*
  * The ids a ring hands out, as a table indexed by id with a stack of the free
  * ones: the completion's cookie names the buffer directly. Callers of the id
  * helpers hold tx_idr_lock.
  */
-int ath11k_dp_tx_bufs_init(struct dp_tx_ring *tx_ring)
+int ath11k_dp_tx_bufs_init(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 {
 	u32 id;
 
@@ -92,25 +119,60 @@ int ath11k_dp_tx_bufs_init(struct dp_tx_ring *tx_ring)
 				 GFP_KERNEL);
 	tx_ring->free_ids = kvcalloc(DP_TX_IDR_SIZE - 1,
 				     sizeof(*tx_ring->free_ids), GFP_KERNEL);
-	if (!tx_ring->bufs || !tx_ring->free_ids) {
-		ath11k_dp_tx_bufs_free(tx_ring);
+	tx_ring->ext_slot = kvmalloc_array(DP_TX_IDR_SIZE - 1,
+					   sizeof(*tx_ring->ext_slot),
+					   GFP_KERNEL);
+	if (ab->hw_params.tx_tso) {
+		tx_ring->ext = dma_alloc_coherent(ab->dev, ATH11K_DP_TX_EXT_SIZE,
+						  &tx_ring->ext_paddr,
+						  GFP_KERNEL);
+		tx_ring->ext_map = kvcalloc(DP_TX_EXT_DESC_NUM,
+					    sizeof(*tx_ring->ext_map),
+					    GFP_KERNEL);
+		tx_ring->ext_free = kvcalloc(DP_TX_EXT_DESC_NUM,
+					     sizeof(*tx_ring->ext_free),
+					     GFP_KERNEL);
+	}
+	if (!tx_ring->bufs || !tx_ring->free_ids || !tx_ring->ext_slot ||
+	    (ab->hw_params.tx_tso &&
+	     (!tx_ring->ext || !tx_ring->ext_map || !tx_ring->ext_free))) {
+		ath11k_dp_tx_bufs_free(ab, tx_ring);
 		return -ENOMEM;
 	}
 
+	memset(tx_ring->ext_slot, 0xff,
+	       (DP_TX_IDR_SIZE - 1) * sizeof(*tx_ring->ext_slot));
+
 	tx_ring->num_free = 0;
 	for (id = DP_TX_IDR_SIZE - 1; id--;)
 		tx_ring->free_ids[tx_ring->num_free++] = id;
 
+	tx_ring->ext_num_free = 0;
+	if (tx_ring->ext_free)
+		for (id = DP_TX_EXT_DESC_NUM; id--;)
+			tx_ring->ext_free[tx_ring->ext_num_free++] = id;
+
 	return 0;
 }
 
-void ath11k_dp_tx_bufs_free(struct dp_tx_ring *tx_ring)
+void ath11k_dp_tx_bufs_free(struct ath11k_base *ab, struct dp_tx_ring *tx_ring)
 {
 	kvfree(tx_ring->bufs);
 	kvfree(tx_ring->free_ids);
+	kvfree(tx_ring->ext_slot);
+	if (tx_ring->ext)
+		dma_free_coherent(ab->dev, ATH11K_DP_TX_EXT_SIZE,
+				  tx_ring->ext, tx_ring->ext_paddr);
+	kvfree(tx_ring->ext_map);
+	kvfree(tx_ring->ext_free);
 	tx_ring->bufs = NULL;
 	tx_ring->free_ids = NULL;
+	tx_ring->ext_slot = NULL;
+	tx_ring->ext = NULL;
+	tx_ring->ext_map = NULL;
+	tx_ring->ext_free = NULL;
 	tx_ring->num_free = 0;
+	tx_ring->ext_num_free = 0;
 }
 
 static int ath11k_dp_tx_buf_get_id(struct dp_tx_ring *tx_ring,
@@ -127,10 +189,34 @@ static int ath11k_dp_tx_buf_get_id(struct dp_tx_ring *tx_ring,
 	return id;
 }
 
-static struct sk_buff *ath11k_dp_tx_buf_put_id(struct dp_tx_ring *tx_ring,
-					       u32 id)
+static void ath11k_dp_tx_tso_unmap(struct device *dev,
+				   struct ath11k_dp_tx_ext_map *map)
+{
+	while (map->num--)
+		dma_unmap_page(dev, map->dma[map->num], map->len[map->num],
+			       DMA_TO_DEVICE);
+	map->num = 0;
+}
+
+/*
+ * Releases the buffer of an id. A TSO segment shares its batch with the other
+ * segments of it: this returns the batch with the completion of its last
+ * segment only, and NULL with *@more set before that. @seg, if given, gets
+ * the segment and its batch either way, for the status of the segment.
+ */
+struct sk_buff *ath11k_dp_tx_buf_put_id(struct ath11k_base *ab,
+					struct dp_tx_ring *tx_ring, u32 id,
+					bool *more,
+					struct ath11k_dp_tx_seg *seg)
 {
 	struct sk_buff *skb;
+	u16 slot;
+
+	*more = false;
+	if (seg) {
+		seg->skb = NULL;
+		seg->len = 0;
+	}
 
 	if (unlikely(id >= DP_TX_IDR_SIZE - 1))
 		return NULL;
@@ -142,25 +228,45 @@ static struct sk_buff *ath11k_dp_tx_buf_put_id(struct dp_tx_ring *tx_ring,
 	tx_ring->bufs[id] = NULL;
 	tx_ring->free_ids[tx_ring->num_free++] = id;
 
+	if (seg)
+		seg->skb = skb;
+
+	slot = tx_ring->ext_slot[id];
+	if (unlikely(slot != ATH11K_DP_TX_NO_EXT)) {
+		if (seg)
+			seg->len = tx_ring->ext_map[slot].seg_len;
+		ath11k_dp_tx_tso_unmap(ab->dev, &tx_ring->ext_map[slot]);
+		tx_ring->ext_free[tx_ring->ext_num_free++] = slot;
+		tx_ring->ext_slot[id] = ATH11K_DP_TX_NO_EXT;
+
+		if (!skb_unref(skb)) {
+			*more = true;
+			return NULL;
+		}
+	}
+
 	return skb;
 }
 
 /**
  * ath11k_dp_tx_idr_has_room() - tell whether ath11k_dp_tx() can take a frame
  * @tx_ring: the ring the frame would go to first
+ * @n: the MSDU ids the frame may need, one per segment
  *
- * ath11k_dp_tx() takes the frame's MSDU id from the ring's free ids, of which
- * there are DP_TX_IDR_SIZE - 1, and the frame's completion returns it. A caller
- * that takes a frame from mac80211 only to have it refused for want of an id
- * loses the frame, so it checks first. The count is read without tx_idr_lock:
- * an id taken in between costs that one frame, as before the check.
+ * ath11k_dp_tx() takes the MSDU id of each segment from the ring's free ids,
+ * of which there are DP_TX_IDR_SIZE - 1, and the segment's completion returns
+ * it; a TCP batch the TCL cannot take whole is segmented in software and still
+ * takes an id per segment. A caller that takes a frame from mac80211 only to
+ * have it refused for want of an id loses the frame, so it checks first. The
+ * count is read without tx_idr_lock: an id taken in between costs that one
+ * frame, as before the check.
  *
- * Return: true if an id is free.
+ * Return: true if @n ids are free.
  */
-bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring)
+bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring, int n)
 {
 	/* Read without tx_idr_lock: a stale count costs at most one frame. */
-	return data_race(tx_ring->num_free) != 0;
+	return data_race(tx_ring->num_free) >= n;
 }
 
 /*
@@ -187,6 +293,7 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	u32 ring_selector = 0;
 	u8 ring_map = 0;
 	bool tcl_ring_retry;
+	bool more;
 
 	if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags)))
 		return -ESHUTDOWN;
@@ -372,8 +479,9 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 fail_remove_idr:
 	spin_lock_bh(&tx_ring->tx_idr_lock);
-	ath11k_dp_tx_buf_put_id(tx_ring,
-				FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id));
+	ath11k_dp_tx_buf_put_id(ab, tx_ring,
+				FIELD_GET(DP_TX_DESC_ID_MSDU_ID, ti.desc_id),
+				&more, NULL);
 	spin_unlock_bh(&tx_ring->tx_idr_lock);
 
 	if (tcl_ring_retry)
@@ -382,20 +490,524 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 	return ret;
 }
 
+/*
+ * Maps the payload of one segment, @len bytes from *@piece at *@off, where
+ * piece 0 is the linear part past the headers and piece n is fragment n - 1.
+ */
+static int ath11k_dp_tx_tso_map(struct device *dev, struct sk_buff *skb,
+				struct ath11k_dp_tx_ext_map *map,
+				struct hal_tx_msdu_ext *ext,
+				unsigned int *piece, unsigned int *off,
+				unsigned int len)
+{
+	struct skb_shared_info *shinfo = skb_shinfo(skb);
+	unsigned int avail, take;
+	dma_addr_t dma;
+
+	map->num = 0;
+	while (len) {
+		if (!*piece)
+			avail = skb_headlen(skb) - *off;
+		else
+			avail = skb_frag_size(&shinfo->frags[*piece - 1]) - *off;
+		if (!avail) {
+			if (*piece == shinfo->nr_frags)
+				return -EINVAL;
+			(*piece)++;
+			*off = 0;
+			continue;
+		}
+		if (map->num == HAL_TX_MSDU_EXT_NUM_BUFS - 1)
+			return -E2BIG;
+
+		take = min(avail, len);
+		/* mapped as pages, as ath11k_dp_tx_tso_unmap() unmaps them */
+		if (!*piece)
+			dma = dma_map_page(dev, virt_to_page(skb->data + *off),
+					   offset_in_page(skb->data + *off),
+					   take, DMA_TO_DEVICE);
+		else
+			dma = skb_frag_dma_map(dev, &shinfo->frags[*piece - 1],
+					       *off, take, DMA_TO_DEVICE);
+		if (dma_mapping_error(dev, dma))
+			return -ENOMEM;
+
+		map->dma[map->num] = dma;
+		map->len[map->num] = take;
+		map->num++;
+		ext->buf[map->num].addr_lo = lower_32_bits(dma);
+		ext->buf[map->num].info =
+			FIELD_PREP(HAL_TX_MSDU_EXT_BUF_INFO_ADDR_HI,
+				   upper_32_bits(dma)) |
+			FIELD_PREP(HAL_TX_MSDU_EXT_BUF_INFO_LEN, take);
+		*off += take;
+		len -= take;
+	}
+
+	return 0;
+}
+
+/*
+ * The frames that stay in one linear buffer: the ones the firmware and the
+ * stack single out by their header, which are short and rare anyway.
+ */
+static bool ath11k_dp_tx_ctl_frame(struct sk_buff *skb)
+{
+	struct ethhdr *eth = (struct ethhdr *)skb->data;
+	struct udphdr _udp, *udp;
+	struct ipv6hdr _ip6, *ip6;
+	struct iphdr _ip, *ip;
+	__be16 sport, dport;
+
+	switch (ntohs(eth->h_proto)) {
+	case ETH_P_ARP:
+	case ETH_P_PAE:
+		return true;
+	case ETH_P_IP:
+		ip = skb_header_pointer(skb, ETH_HLEN, sizeof(_ip), &_ip);
+		if (!ip || ip->protocol != IPPROTO_UDP || ip->ihl < 5)
+			return false;
+		udp = skb_header_pointer(skb, ETH_HLEN + ip->ihl * 4,
+					 sizeof(_udp), &_udp);
+		break;
+	case ETH_P_IPV6:
+		ip6 = skb_header_pointer(skb, ETH_HLEN, sizeof(_ip6), &_ip6);
+		if (!ip6 || ip6->nexthdr != IPPROTO_UDP)
+			return false;
+		udp = skb_header_pointer(skb, ETH_HLEN + sizeof(_ip6),
+					 sizeof(_udp), &_udp);
+		break;
+	default:
+		return false;
+	}
+
+	if (!udp)
+		return false;
+
+	/* DHCP and DHCPv6 */
+	sport = udp->source;
+	dport = udp->dest;
+	return (sport == htons(67) || sport == htons(68) ||
+		dport == htons(67) || dport == htons(68) ||
+		sport == htons(546) || sport == htons(547) ||
+		dport == htons(546) || dport == htons(547));
+}
+
+/*
+ * Moves the first @len bytes of the frame, its headers, @pad bytes down into
+ * the head room, with the offsets of the headers, so that they end @pad bytes
+ * earlier; the rest of the frame stays where it is, and the frame is @pad
+ * bytes longer. The caller makes sure of the head room and of a head that is
+ * not shared. Undone by ath11k_dp_tx_ext_unpad().
+ */
+static void ath11k_dp_tx_ext_pad(struct sk_buff *skb, unsigned int len,
+				 unsigned int pad)
+{
+	skb_push(skb, pad);
+	memmove(skb->data, skb->data + pad, len);
+	if (skb_mac_header_was_set(skb))
+		skb->mac_header -= pad;
+	skb->network_header -= pad;
+	if (skb_transport_header_was_set(skb))
+		skb->transport_header -= pad;
+}
+
+static void ath11k_dp_tx_ext_unpad(struct sk_buff *skb, unsigned int len,
+				   unsigned int pad)
+{
+	memmove(skb->data + pad, skb->data, len);
+	skb_pull(skb, pad);
+	if (skb_mac_header_was_set(skb))
+		skb->mac_header += pad;
+	skb->network_header += pad;
+	if (skb_transport_header_was_set(skb))
+		skb->transport_header += pad;
+}
+
+/*
+ * A TCP batch, or a frame with fragments, that the TCL takes from MSDU
+ * extension descriptors. Each descriptor lists the buffers of one frame: the
+ * linear part of the skb, which for a batch holds the headers shared by all
+ * its segments, and the payload in the fragments. A TCP batch has one
+ * descriptor for each of its segments, which also gives the segment's IP
+ * length, IP ID, TCP sequence number and flags for the TCL to write into the
+ * headers; every segment holds a reference on the batch, and the completion
+ * of the last one reports the batch to mac80211. A frame with fragments has
+ * one descriptor, and is a batch of one segment.
+ *
+ * Returns -EAGAIN, with the frame untouched, for one the TCL cannot take
+ * whole. The ids, extension descriptors and ring entries of all segments are
+ * taken before the first is queued.
+ */
+static int ath11k_dp_tx_ext(struct ath11k *ar, struct ath11k_vif *arvif,
+			    struct sk_buff *skb, int held_ring)
+{
+	struct skb_shared_info *shinfo = skb_shinfo(skb);
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(skb);
+	bool tso = skb_is_gso(skb);
+	unsigned int n = tso ? shinfo->gso_segs : 1, mss = shinfo->gso_size;
+	unsigned int hdr_len, l2_len = 0, ip_off = 0, left, piece = 0, off;
+	struct ath11k_base *ab = ar->ab;
+	struct hal_tx_info ti = {};
+	struct dp_tx_ring *tx_ring;
+	struct hal_srng *tcl_ring;
+	u16 ids[ATH11K_DP_TX_TSO_MAX_SEGS], slots[ATH11K_DP_TX_TSO_MAX_SEGS];
+	u32 seq = 0, flags = 0, ip_id = 0;
+	dma_addr_t hdr_dma;
+	struct tcphdr *th;
+	unsigned int pad;
+	int i, j;
+
+	/* a crashed firmware takes no frames; the caller drops this one */
+	if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags)))
+		return -EAGAIN;
+
+	if (!ab->hw_params.tx_tso ||
+	    !(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) ||
+	    ath11k_dp_tx_get_encap_type(arvif, skb) != HAL_TCL_ENCAP_TYPE_ETHERNET ||
+	    skb_has_frag_list(skb) || refcount_read(&skb->users) != 1 ||
+	    n > ATH11K_DP_TX_TSO_MAX_SEGS)
+		return -EAGAIN;
+
+	if (tso) {
+		if (!(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6)) ||
+		    shinfo->gso_type & SKB_GSO_FRAGLIST ||
+		    skb->ip_summed != CHECKSUM_PARTIAL)
+			return -EAGAIN;
+
+		hdr_len = skb_tcp_all_headers(skb);
+		l2_len = skb_network_offset(skb);
+		/*
+		 * The IP length counts the IPv4 header, but not the IPv6 one.
+		 * An IPv6 batch with extension headers goes to software: the
+		 * descriptor gives the TCL no length of the headers between
+		 * the IPv6 header and TCP.
+		 */
+		ip_off = l2_len;
+		if (shinfo->gso_type & SKB_GSO_TCPV6) {
+			ip_off = l2_len + sizeof(struct ipv6hdr);
+			if (skb_transport_offset(skb) != ip_off)
+				return -EAGAIN;
+		}
+		if (hdr_len > skb_headlen(skb) || l2_len > hdr_len)
+			return -EAGAIN;
+	} else {
+		/* the linear part is the first buffer, then the fragments */
+		hdr_len = skb_headlen(skb);
+		if (!shinfo->nr_frags ||
+		    shinfo->nr_frags > HAL_TX_MSDU_EXT_NUM_BUFS - 1 ||
+		    hdr_len < ETH_HLEN || ath11k_dp_tx_ctl_frame(skb))
+			return -EAGAIN;
+	}
+
+	/*
+	 * The buffer of the headers ends on an 8 byte boundary: if it does
+	 * not, the headers move down into the head room, which has to be
+	 * there and not be shared.
+	 */
+	pad = ((unsigned long)skb->data + hdr_len) & (ATH11K_DP_TX_EXT_ALIGN - 1);
+	if (pad) {
+		if (skb_cow_head(skb, ATH11K_DP_TX_EXT_ALIGN))
+			return -EAGAIN;
+		shinfo = skb_shinfo(skb);
+		pad = ((unsigned long)skb->data + hdr_len) &
+		      (ATH11K_DP_TX_EXT_ALIGN - 1);
+	}
+
+	if (held_ring >= 0)
+		ti.ring_id = held_ring;
+	else
+		ti.ring_id = ab->hw_params.hw_ops->get_ring_selector(skb_get_queue_mapping(skb)) %
+			     ab->hw_params.hal_params->num_tx_rings;
+	tx_ring = &ab->dp.tx_ring[ti.ring_id];
+	tcl_ring = &ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
+
+	spin_lock_bh(&tx_ring->tx_idr_lock);
+	if (tx_ring->num_free < n || tx_ring->ext_num_free < n) {
+		spin_unlock_bh(&tx_ring->tx_idr_lock);
+		return -EAGAIN;
+	}
+	for (i = 0; i < n; i++) {
+		slots[i] = tx_ring->ext_free[--tx_ring->ext_num_free];
+		ids[i] = ath11k_dp_tx_buf_get_id(tx_ring, skb);
+		tx_ring->ext_slot[ids[i]] = slots[i];
+		tx_ring->ext_map[slots[i]].num = 0;
+	}
+	spin_unlock_bh(&tx_ring->tx_idr_lock);
+
+	if (pad)
+		ath11k_dp_tx_ext_pad(skb, hdr_len, pad);
+
+	hdr_dma = dma_map_single(ab->dev, skb->data, skb_headlen(skb),
+				 DMA_TO_DEVICE);
+	if (dma_mapping_error(ab->dev, hdr_dma)) {
+		i = 0;
+		goto fail_put;
+	}
+
+	if (tso) {
+		th = tcp_hdr(skb);
+		seq = ntohl(th->seq);
+		flags = (ntohl(tcp_flag_word(th)) >> 16) & 0x1ff;
+		if (shinfo->gso_type & SKB_GSO_TCPV4)
+			ip_id = ntohs(ip_hdr(skb)->id);
+	}
+
+	/* the payload in the linear part starts after the gap the headers left */
+	off = hdr_len + pad;
+	left = skb->len - off;
+	for (i = 0; i < n; i++) {
+		struct hal_tx_msdu_ext *ext = (void *)tx_ring->ext +
+					      ath11k_dp_tx_ext_off(slots[i]);
+		struct ath11k_dp_tx_ext_map *map = &tx_ring->ext_map[slots[i]];
+		unsigned int len = tso ? min(left, mss) : left;
+		u32 seg_flags = flags;
+
+		if (i)
+			seg_flags &= ~TCPHDR_CWR;
+		if (i < n - 1)
+			seg_flags &= ~(TCPHDR_FIN | TCPHDR_PSH);
+
+		memset(ext, 0, sizeof(*ext));
+		if (ath11k_dp_tx_tso_map(ab->dev, skb, map, ext, &piece, &off,
+					 len)) {
+			ath11k_dp_tx_tso_unmap(ab->dev, map);
+			goto fail_unmap;
+		}
+
+		map->seg_len = hdr_len + len;
+
+		if (tso) {
+			ext->info0 = FIELD_PREP(HAL_TX_MSDU_EXT_INFO0_TSO_ENABLE, 1) |
+				     FIELD_PREP(HAL_TX_MSDU_EXT_INFO0_TCP_FLAG,
+						seg_flags) |
+				     FIELD_PREP(HAL_TX_MSDU_EXT_INFO0_TCP_FLAG_MASK,
+						0x1ff);
+			ext->info1 = FIELD_PREP(HAL_TX_MSDU_EXT_INFO1_L2_LEN,
+						l2_len) |
+				     FIELD_PREP(HAL_TX_MSDU_EXT_INFO1_IP_LEN,
+						hdr_len - ip_off + len);
+			ext->tcp_seq = seq;
+			ext->info3 = FIELD_PREP(HAL_TX_MSDU_EXT_INFO3_IP_ID,
+						ip_id);
+		}
+		ext->buf[0].addr_lo = lower_32_bits(hdr_dma);
+		ext->buf[0].info =
+			FIELD_PREP(HAL_TX_MSDU_EXT_BUF_INFO_ADDR_HI,
+				   upper_32_bits(hdr_dma)) |
+			FIELD_PREP(HAL_TX_MSDU_EXT_BUF_INFO_LEN, hdr_len);
+
+		seq += len;
+		left -= len;
+		if (!(shinfo->gso_type & SKB_GSO_TCP_FIXEDID))
+			ip_id = (ip_id + 1) & 0xffff;
+	}
+
+	if (held_ring < 0) {
+		spin_lock_bh(&tcl_ring->lock);
+		ath11k_hal_srng_access_begin(ab, tcl_ring);
+	}
+	if (ath11k_hal_srng_src_num_free(ab, tcl_ring, held_ring < 0) < n) {
+		if (held_ring < 0) {
+			ath11k_hal_srng_access_end(ab, tcl_ring);
+			spin_unlock_bh(&tcl_ring->lock);
+		}
+		ab->soc_stats.tx_err.desc_na[ti.ring_id]++;
+		goto fail_unmap;
+	}
+
+	skb_cb->paddr = hdr_dma;
+	skb_cb->vif = arvif->vif;
+	skb_cb->ar = ar;
+	skb_cb->tso_try = 0;
+	skb_cb->tso_bad = 0;
+	refcount_add(n - 1, &skb->users);
+
+	ti.encap_type = HAL_TCL_ENCAP_TYPE_ETHERNET;
+	ti.meta_data_flags = arvif->tcl_metadata;
+	ti.addr_search_flags = arvif->hal_addr_search_flags;
+	ti.search_type = arvif->search_type;
+	ti.type = HAL_TCL_DESC_TYPE_EXT_DESC;
+	ti.lmac_id = ar->lmac_id;
+	ti.bss_ast_hash = arvif->ast_hash;
+	ti.bss_ast_idx = arvif->ast_idx;
+	ti.rbm_id = ab->hw_params.hal_params->tcl2wbm_rbm_map[ti.ring_id].rbm_id;
+	ti.tid = ath11k_dp_tx_get_tid(skb);
+	/* the IP, UDP and TCP checksum enables together, also for a batch */
+	if (skb->ip_summed == CHECKSUM_PARTIAL)
+		ti.flags0 = FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_IP4_CKSUM_EN, 1) |
+			    FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_UDP4_CKSUM_EN, 1) |
+			    FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_UDP6_CKSUM_EN, 1) |
+			    FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_TCP4_CKSUM_EN, 1) |
+			    FIELD_PREP(HAL_TCL_DATA_CMD_INFO1_TCP6_CKSUM_EN, 1);
+	if (ieee80211_vif_is_mesh(arvif->vif))
+		ti.enable_mesh = true;
+	ti.flags1 = FIELD_PREP(HAL_TCL_DATA_CMD_INFO2_TID_OVERWRITE, 1);
+	/* the TCL reads this much of the extension descriptor */
+	ti.data_len = sizeof(*tx_ring->ext);
+
+	for (i = 0; i < n; i++) {
+		void *desc;
+
+		ti.desc_id = FIELD_PREP(DP_TX_DESC_ID_MAC_ID, ar->pdev_idx) |
+			     FIELD_PREP(DP_TX_DESC_ID_MSDU_ID, ids[i]) |
+			     FIELD_PREP(DP_TX_DESC_ID_POOL_ID,
+					skb_get_queue_mapping(skb) &
+					(ATH11K_HW_MAX_QUEUES - 1));
+		ti.paddr = tx_ring->ext_paddr + ath11k_dp_tx_ext_off(slots[i]);
+		/* the command follows the TLV header of the ring entry */
+		desc = ath11k_hal_srng_src_get_next_entry(ab, tcl_ring);
+		ath11k_hal_tx_cmd_desc_setup(ab, desc + sizeof(struct hal_tlv_hdr),
+					     &ti);
+	}
+
+	if (held_ring < 0) {
+		/* as the TXQ push: no ring update once the firmware crashed */
+		if (likely(!test_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags))) {
+			ath11k_hal_srng_access_end(ab, tcl_ring);
+			ath11k_dp_shadow_start_timer(ab, tcl_ring,
+						     &ab->dp.tx_ring_timer[ti.ring_id]);
+		}
+		spin_unlock_bh(&tcl_ring->lock);
+	}
+
+	atomic_add(n, &ar->dp.num_tx_pending);
+	if (tso) {
+		atomic_inc(&ab->soc_stats.tx_tso_batch);
+		atomic_add(n, &ab->soc_stats.tx_tso_seg);
+	} else {
+		atomic_inc(&ab->soc_stats.tx_sg);
+	}
+
+	return 0;
+
+fail_unmap:
+	for (j = 0; j < i; j++)
+		ath11k_dp_tx_tso_unmap(ab->dev, &tx_ring->ext_map[slots[j]]);
+	dma_unmap_single(ab->dev, hdr_dma, skb_headlen(skb), DMA_TO_DEVICE);
+fail_put:
+	if (pad)
+		ath11k_dp_tx_ext_unpad(skb, hdr_len, pad);
+	spin_lock_bh(&tx_ring->tx_idr_lock);
+	for (j = n; j--;) {
+		/* no reference was taken yet: release the id and slot only */
+		tx_ring->bufs[ids[j]] = NULL;
+		tx_ring->free_ids[tx_ring->num_free++] = ids[j];
+		tx_ring->ext_slot[ids[j]] = ATH11K_DP_TX_NO_EXT;
+		tx_ring->ext_free[tx_ring->ext_num_free++] = slots[j];
+	}
+	spin_unlock_bh(&tx_ring->tx_idr_lock);
+
+	return -EAGAIN;
+}
+
+/*
+ * A frame with fragments, sent as scatter-gather. Returns -EAGAIN, with the
+ * frame untouched, for one that has to be made linear instead.
+ */
+int ath11k_dp_tx_sg(struct ath11k *ar, struct ath11k_vif *arvif,
+		    struct sk_buff *skb, int held_ring)
+{
+	return ath11k_dp_tx_ext(ar, arvif, skb, held_ring);
+}
+
+/*
+ * A GSO frame from mac80211 is a batch of frames. The TCL takes a TCP batch
+ * whole; any other, and a batch the TCL cannot take, is split into frames
+ * here. The frames share the one status mac80211 expects, and the one airtime
+ * charge of the batch: the last frame reports the status with the charge,
+ * and the others carry none.
+ */
+int ath11k_dp_tx_gso(struct ath11k *ar, struct ath11k_vif *arvif,
+		     struct ath11k_sta *arsta, struct sk_buff *skb,
+		     int held_ring)
+{
+	struct sk_buff *segs, *seg, *next;
+	struct ieee80211_tx_info *info;
+	int ret = 0;
+
+	if (!ath11k_dp_tx_ext(ar, arvif, skb, held_ring))
+		return 0;
+
+	atomic_inc(&ar->ab->soc_stats.tx_tso_sw);
+
+	segs = skb_gso_segment(skb, NETIF_F_HW_CSUM);
+	if (IS_ERR_OR_NULL(segs)) {
+		ieee80211_free_txskb(ar->hw, skb);
+		return segs ? PTR_ERR(segs) : -ENOMEM;
+	}
+
+	/* the frames copy the control buffer, and so the charge */
+	consume_skb(skb);
+
+	skb_list_walk_safe(segs, seg, next) {
+		skb_mark_not_on_list(seg);
+		if (next) {
+			info = IEEE80211_SKB_CB(seg);
+			info->tx_time_est = 0;
+		}
+		if (ret) {
+			ieee80211_free_txskb(ar->hw, seg);
+			continue;
+		}
+		ret = ath11k_dp_tx(ar, arvif, arsta, seg, held_ring);
+		if (ret)
+			ieee80211_free_txskb(ar->hw, seg);
+	}
+
+	return ret;
+}
+
+/*
+ * Whether a segment went out as the frame asked: acked, or sent when it asked
+ * for no ack.
+ */
+static bool ath11k_dp_tx_seg_ok(struct sk_buff *skb, enum hal_wbm_tqm_rel_reason status)
+{
+	if (IEEE80211_SKB_CB(skb)->flags & IEEE80211_TX_CTL_NO_ACK)
+		return status == HAL_WBM_TQM_REL_REASON_CMD_REMOVE_TX;
+
+	return status == HAL_WBM_TQM_REL_REASON_FRAME_ACKED;
+}
+
+/*
+ * Notes the status of a segment that is not the last of its batch: the batch
+ * is acked only if every segment is, and its tries are the most of any segment.
+ */
+static void ath11k_dp_tx_seg_note(struct sk_buff *batch, bool ok, u8 try_cnt)
+{
+	struct ath11k_skb_cb *skb_cb = ATH11K_SKB_CB(batch);
+
+	if (!ok && skb_cb->tso_bad < U8_MAX)
+		skb_cb->tso_bad++;
+	if (try_cnt > skb_cb->tso_try)
+		skb_cb->tso_try = try_cnt;
+}
+
 static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 				    int msdu_id,
 				    struct dp_tx_ring *tx_ring,
 				    unsigned long *push)
 {
-	struct ath11k *ar;
+	struct ath11k *ar = ab->pdevs[mac_id].ar;
 	struct sk_buff *msdu;
+	struct ath11k_dp_tx_seg seg;
 	struct ath11k_skb_cb *skb_cb;
+	bool more;
 
 	spin_lock(&tx_ring->tx_idr_lock);
-	msdu = ath11k_dp_tx_buf_put_id(tx_ring, msdu_id);
+	msdu = ath11k_dp_tx_buf_put_id(ab, tx_ring, msdu_id, &more, &seg);
 	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (unlikely(!msdu)) {
+		if (more) {
+			/* the segment was not sent, and so is not acked */
+			ath11k_dp_tx_seg_note(seg.skb, false, 0);
+			if (atomic_dec_and_test(&ar->dp.num_tx_pending))
+				wake_up(&ar->dp.tx_empty_waitq);
+			return;
+		}
 		ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 			    msdu_id);
 		return;
@@ -403,9 +1015,9 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 
 	skb_cb = ATH11K_SKB_CB(msdu);
 
-	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
+	dma_unmap_single(ab->dev, skb_cb->paddr, skb_headlen(msdu),
+			 DMA_TO_DEVICE);
 
-	ar = ab->pdevs[mac_id].ar;
 	__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
 		  push);
 	ieee80211_free_txskb(ar->hw, msdu);
@@ -428,6 +1040,7 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 	struct dp_tx_ring *tx_ring;
 	struct sk_buff *msdu;
 	int i, msdu_id;
+	bool more;
 
 	__skb_queue_head_init(&pending);
 
@@ -437,7 +1050,8 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 		spin_lock_bh(&tx_ring->tx_idr_lock);
 		for (msdu_id = 0; tx_ring->bufs && msdu_id < DP_TX_IDR_SIZE - 1;
 		     msdu_id++) {
-			msdu = ath11k_dp_tx_buf_put_id(tx_ring, msdu_id);
+			msdu = ath11k_dp_tx_buf_put_id(ab, tx_ring, msdu_id,
+						       &more, NULL);
 			if (msdu)
 				__skb_queue_tail(&pending, msdu);
 		}
@@ -446,14 +1060,14 @@ void ath11k_dp_tx_free_pending(struct ath11k_base *ab)
 
 	while ((msdu = __skb_dequeue(&pending))) {
 		skb_cb = ATH11K_SKB_CB(msdu);
-		dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len,
+		dma_unmap_single(ab->dev, skb_cb->paddr, skb_headlen(msdu),
 				 DMA_TO_DEVICE);
 		ieee80211_free_txskb(skb_cb->ar->hw, msdu);
 	}
 }
 
 static void
-ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
+ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab, u8 mac_id,
 				 struct dp_tx_ring *tx_ring,
 				 struct ath11k_dp_htt_wbm_tx_status *ts,
 				 unsigned long *push)
@@ -461,15 +1075,25 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	struct ieee80211_tx_status status = {};
 	struct sk_buff *msdu;
 	struct ieee80211_tx_info *info;
+	struct ath11k_dp_tx_seg seg;
 	struct ath11k_skb_cb *skb_cb;
 	struct ath11k *ar;
 	struct ath11k_peer *peer;
+	bool more;
+	bool batch_ok;
 
 	spin_lock(&tx_ring->tx_idr_lock);
-	msdu = ath11k_dp_tx_buf_put_id(tx_ring, ts->msdu_id);
+	msdu = ath11k_dp_tx_buf_put_id(ab, tx_ring, ts->msdu_id, &more, &seg);
 	spin_unlock(&tx_ring->tx_idr_lock);
 
 	if (unlikely(!msdu)) {
+		if (more) {
+			ath11k_dp_tx_seg_note(seg.skb, ts->acked, 0);
+			ar = ab->pdevs[mac_id].ar;
+			if (atomic_dec_and_test(&ar->dp.num_tx_pending))
+				wake_up(&ar->dp.tx_empty_waitq);
+			return;
+		}
 		ath11k_warn(ab, "htt tx completion for unknown msdu_id %d\n",
 			    ts->msdu_id);
 		return;
@@ -485,16 +1109,20 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
 
-	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
+	dma_unmap_single(ab->dev, skb_cb->paddr, skb_headlen(msdu),
+			 DMA_TO_DEVICE);
 
 	if (!skb_cb->vif) {
 		ieee80211_free_txskb(ar->hw, msdu);
 		return;
 	}
 
+	/* the notes of the other segments of a batch share the status */
+	batch_ok = !seg.len || !skb_cb->tso_bad;
+
 	memset(&info->status, 0, sizeof(info->status));
 
-	if (ts->acked) {
+	if (ts->acked && batch_ok) {
 		if (!(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
 			info->flags |= IEEE80211_TX_STAT_ACK;
 			info->status.ack_signal = ts->ack_rssi;
@@ -558,7 +1186,8 @@ ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 		else
 			ts.peer_id = HTT_INVALID_PEER_ID;
 
-		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts, push);
+		ath11k_dp_tx_htt_tx_complete_buf(ab, mac_id, tx_ring, &ts,
+						 push);
 
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
@@ -576,19 +1205,18 @@ ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 	}
 }
 
-static void ath11k_dp_tx_cache_peer_stats(struct ath11k *ar,
-					  struct sk_buff *msdu,
+static void ath11k_dp_tx_cache_peer_stats(struct ath11k *ar, u32 len,
 					  struct hal_tx_status *ts)
 {
 	struct ath11k_per_peer_tx_stats *peer_stats = &ar->cached_stats;
 
 	if (ts->try_cnt > 1) {
 		peer_stats->retry_pkts += ts->try_cnt - 1;
-		peer_stats->retry_bytes += (ts->try_cnt - 1) * msdu->len;
+		peer_stats->retry_bytes += (ts->try_cnt - 1) * len;
 
 		if (ts->status != HAL_WBM_TQM_REL_REASON_FRAME_ACKED) {
 			peer_stats->failed_pkts += 1;
-			peer_stats->failed_bytes += msdu->len;
+			peer_stats->failed_bytes += len;
 		}
 	}
 }
@@ -709,10 +1337,62 @@ struct ath11k_dp_tx_compl {
 	u16 peer_id;
 };
 
+/*
+ * The statistics of the stations that the completion of every frame feeds,
+ * @len bytes long: the frame, or the segment of a batch.
+ */
+static void ath11k_dp_tx_account(struct ath11k *ar, u32 len,
+				 struct hal_tx_status *ts)
+{
+	if (likely(!ath11k_debugfs_is_extd_tx_stats_enabled(ar) &&
+		   !ar->ab->hw_params.single_pdev_only))
+		return;
+
+	if (ts->flags & HAL_TX_STATUS_FLAGS_FIRST_MSDU) {
+		if (ar->last_ppdu_id == 0) {
+			ar->last_ppdu_id = ts->ppdu_id;
+		} else if (ar->last_ppdu_id == ts->ppdu_id ||
+			   ar->cached_ppdu_id == ar->last_ppdu_id) {
+			ar->cached_ppdu_id = ar->last_ppdu_id;
+			ar->cached_stats.is_ampdu = true;
+			ath11k_dp_tx_update_txcompl(ar, ts);
+			memset(&ar->cached_stats, 0,
+			       sizeof(struct ath11k_per_peer_tx_stats));
+		} else {
+			ar->cached_stats.is_ampdu = false;
+			ath11k_dp_tx_update_txcompl(ar, ts);
+			memset(&ar->cached_stats, 0,
+			       sizeof(struct ath11k_per_peer_tx_stats));
+		}
+		ar->last_ppdu_id = ts->ppdu_id;
+	}
+
+	ath11k_dp_tx_cache_peer_stats(ar, len, ts);
+}
+
+/*
+ * The completion of a segment that is not the last of its batch. Its
+ * statistics count as those of a frame, and its status goes into the status
+ * of the batch, which the completion of the last segment reports.
+ */
+static void ath11k_dp_tx_complete_seg(struct ath11k *ar, struct sk_buff *batch,
+				      struct hal_tx_status *ts, u16 seg_len)
+{
+	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM))
+		return;
+
+	ath11k_dp_tx_seg_note(batch, ath11k_dp_tx_seg_ok(batch, ts->status),
+			      ts->try_cnt);
+
+	if (likely(rcu_access_pointer(ar->ab->pdevs_active[ar->pdev_idx])))
+		ath11k_dp_tx_account(ar, seg_len, ts);
+}
+
 static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 				       struct sk_buff *msdu,
 				       struct hal_tx_status *ts,
-				       struct ath11k_dp_tx_compl *c)
+				       struct ath11k_dp_tx_compl *c,
+				       u16 seg_len)
 {
 	struct ieee80211_tx_status status = {};
 	struct ieee80211_rate_status status_rate = {};
@@ -720,6 +1400,8 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	struct ieee80211_tx_info *info;
 	struct ath11k_skb_cb *skb_cb;
 	struct ath11k_peer *peer;
+	bool ok;
+	u8 try_cnt;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -728,7 +1410,8 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 
 	skb_cb = ATH11K_SKB_CB(msdu);
 
-	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
+	dma_unmap_single(ab->dev, skb_cb->paddr, skb_headlen(msdu),
+			 DMA_TO_DEVICE);
 
 	if (unlikely(!rcu_access_pointer(ab->pdevs_active[ar->pdev_idx]))) {
 		ieee80211_free_txskb(ar->hw, msdu);
@@ -741,13 +1424,27 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	}
 
 	info = IEEE80211_SKB_CB(msdu);
+
+	/*
+	 * A batch is acked only if all its segments are, and takes the most
+	 * tries of any: mac80211 reads the tries as those of one frame at one
+	 * rate, which a sum over the segments would overstate by their number.
+	 * The notes of the other segments are in the driver's part of the
+	 * buffer that the status overwrites.
+	 */
+	ok = ath11k_dp_tx_seg_ok(msdu, ts->status);
+	try_cnt = ts->try_cnt;
+	if (seg_len) {
+		ok = ok && !skb_cb->tso_bad;
+		try_cnt = max(try_cnt, skb_cb->tso_try);
+	}
+
 	memset(&info->status, 0, sizeof(info->status));
 
 	/* skip tx rate update from ieee80211_status*/
 	info->status.rates[0].idx = -1;
 
-	if (ts->status == HAL_WBM_TQM_REL_REASON_FRAME_ACKED &&
-	    !(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
+	if (ok && !(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
 		info->flags |= IEEE80211_TX_STAT_ACK;
 		info->status.ack_signal = ts->ack_rssi;
 
@@ -758,33 +1455,10 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 		info->status.flags |= IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
 	}
 
-	if (ts->status == HAL_WBM_TQM_REL_REASON_CMD_REMOVE_TX &&
-	    (info->flags & IEEE80211_TX_CTL_NO_ACK))
+	if (ok && (info->flags & IEEE80211_TX_CTL_NO_ACK))
 		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 
-	if (unlikely(ath11k_debugfs_is_extd_tx_stats_enabled(ar)) ||
-	    ab->hw_params.single_pdev_only) {
-		if (ts->flags & HAL_TX_STATUS_FLAGS_FIRST_MSDU) {
-			if (ar->last_ppdu_id == 0) {
-				ar->last_ppdu_id = ts->ppdu_id;
-			} else if (ar->last_ppdu_id == ts->ppdu_id ||
-				   ar->cached_ppdu_id == ar->last_ppdu_id) {
-				ar->cached_ppdu_id = ar->last_ppdu_id;
-				ar->cached_stats.is_ampdu = true;
-				ath11k_dp_tx_update_txcompl(ar, ts);
-				memset(&ar->cached_stats, 0,
-				       sizeof(struct ath11k_per_peer_tx_stats));
-			} else {
-				ar->cached_stats.is_ampdu = false;
-				ath11k_dp_tx_update_txcompl(ar, ts);
-				memset(&ar->cached_stats, 0,
-				       sizeof(struct ath11k_per_peer_tx_stats));
-			}
-			ar->last_ppdu_id = ts->ppdu_id;
-		}
-
-		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
-	}
+	ath11k_dp_tx_account(ar, seg_len ?: msdu->len, ts);
 
 	if (!c->sta || c->peer_id != ts->peer_id) {
 		spin_lock_bh(&ab->base_lock);
@@ -809,7 +1483,7 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	status.free_list = &c->free;
 
 	status_rate.rate_idx = c->rate;
-	status_rate.try_count = 1;
+	status_rate.try_count = max_t(u8, try_cnt, 1);
 
 	status.rates = &status_rate;
 	status.n_rates = 1;
@@ -859,12 +1533,14 @@ int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	struct ath11k_dp_tx_compl c = { .free = LIST_HEAD_INIT(c.free) };
+	struct ath11k_dp_tx_seg seg;
 	struct sk_buff *tmp;
 	unsigned long push = 0;
 	int done = 0;
 	u32 *desc;
 	u32 msdu_id;
 	u8 mac_id, i;
+	bool more;
 
 	spin_lock_bh(&status_ring->lock);
 
@@ -916,24 +1592,32 @@ int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 		}
 
 		spin_lock(&tx_ring->tx_idr_lock);
-		msdu = ath11k_dp_tx_buf_put_id(tx_ring, msdu_id);
+		msdu = ath11k_dp_tx_buf_put_id(ab, tx_ring, msdu_id, &more,
+					       &seg);
+		spin_unlock(&tx_ring->tx_idr_lock);
+
+		ar = ab->pdevs[mac_id].ar;
+
 		if (unlikely(!msdu)) {
+			/* not the last segment of a batch */
+			if (more) {
+				ath11k_dp_tx_complete_seg(ar, seg.skb, &ts,
+							  seg.len);
+				if (atomic_dec_and_test(&ar->dp.num_tx_pending))
+					wake_up(&ar->dp.tx_empty_waitq);
+				continue;
+			}
 			ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
 				    msdu_id);
-			spin_unlock(&tx_ring->tx_idr_lock);
 			continue;
 		}
-
-		spin_unlock(&tx_ring->tx_idr_lock);
-
-		ar = ab->pdevs[mac_id].ar;
 		__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
 			  &push);
 
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
-		ath11k_dp_tx_complete_msdu(ar, msdu, &ts, &c);
+		ath11k_dp_tx_complete_msdu(ar, msdu, &ts, &c, seg.len);
 	}
 
 	list_for_each_entry_safe(msdu, tmp, &c.free, list) {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 50b6178ceb38..967f212d33db 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -21,9 +21,18 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb, int held_ring);
-bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
-int ath11k_dp_tx_bufs_init(struct dp_tx_ring *tx_ring);
-void ath11k_dp_tx_bufs_free(struct dp_tx_ring *tx_ring);
+bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring, int n);
+int ath11k_dp_tx_gso(struct ath11k *ar, struct ath11k_vif *arvif,
+		     struct ath11k_sta *arsta, struct sk_buff *skb,
+		     int held_ring);
+int ath11k_dp_tx_sg(struct ath11k *ar, struct ath11k_vif *arvif,
+		    struct sk_buff *skb, int held_ring);
+int ath11k_dp_tx_bufs_init(struct ath11k_base *ab, struct dp_tx_ring *tx_ring);
+void ath11k_dp_tx_bufs_free(struct ath11k_base *ab, struct dp_tx_ring *tx_ring);
+struct sk_buff *ath11k_dp_tx_buf_put_id(struct ath11k_base *ab,
+					struct dp_tx_ring *tx_ring, u32 id,
+					bool *more,
+					struct ath11k_dp_tx_seg *seg);
 int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 				    int budget);
 void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index c8b01f6921c0..d10cd6735ffb 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -1023,6 +1023,52 @@ enum hal_wbm_htt_tx_comp_status {
 	HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY,
 };
 
+#define HAL_TX_MSDU_EXT_INFO0_TSO_ENABLE	BIT(0)
+#define HAL_TX_MSDU_EXT_INFO0_TCP_FLAG		GENMASK(15, 7)
+#define HAL_TX_MSDU_EXT_INFO0_TCP_FLAG_MASK	GENMASK(24, 16)
+#define HAL_TX_MSDU_EXT_INFO1_L2_LEN		GENMASK(15, 0)
+#define HAL_TX_MSDU_EXT_INFO1_IP_LEN		GENMASK(31, 16)
+#define HAL_TX_MSDU_EXT_INFO3_IP_ID		GENMASK(15, 0)
+#define HAL_TX_MSDU_EXT_BUF_INFO_ADDR_HI	GENMASK(7, 0)
+#define HAL_TX_MSDU_EXT_BUF_INFO_LEN		GENMASK(31, 16)
+#define HAL_TX_MSDU_EXT_NUM_BUFS		6
+
+struct hal_tx_msdu_ext_buf {
+	u32 addr_lo;
+	u32 info;
+} __packed;
+
+struct hal_tx_msdu_ext {
+	u32 info0;
+	u32 info1;
+	u32 tcp_seq;
+	u32 info3;
+	u32 info4;
+	u32 info5;
+	struct hal_tx_msdu_ext_buf buf[HAL_TX_MSDU_EXT_NUM_BUFS];
+} __packed;
+
+/*
+ * hal_tx_msdu_ext
+ *
+ *		A TCL data command of type HAL_TCL_DESC_TYPE_EXT_DESC points at
+ *		this descriptor instead of at the frame.
+ *
+ * tso_enable
+ *		The TCL writes tcp_flag under tcp_flag_mask, the IP length,
+ *		the IP ID and the TCP sequence number into the headers in
+ *		the first buffer, and fills in the checksums the TCL data
+ *		command enables.
+ *
+ * l2_length, ip_length
+ *		The length of the L2 header, and the IP length of the packet
+ *		this descriptor makes: the IPv4 total length, or the IPv6
+ *		payload length.
+ *
+ * buf
+ *		Up to six buffers that make up the frame, in order.
+ */
+
 struct hal_tcl_data_cmd {
 	struct ath11k_buffer_addr buf_addr_info;
 	u32 info0;
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index b6bc8b72d812..2cf34af05f8f 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -223,6 +223,7 @@ struct ath11k_hw_params {
 	} sram_dump;
 
 	bool tcl_ring_retry;
+	bool tx_tso;
 	u32 tx_ring_size;
 	bool smp2p_wow_exit;
 	bool support_fw_mac_sequence;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 513559585371..5f2086bf6c5d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6559,6 +6559,25 @@ static int ath11k_mac_tx(struct ieee80211_hw *hw,
 	if (control->sta)
 		arsta = ath11k_sta_to_arsta(control->sta);
 
+	/*
+	 * A GSO frame is taken whole by the TCL, or split here. A frame with
+	 * fragments goes to the TCL as scatter-gather, and is made linear
+	 * only if the TCL cannot take it that way. They free the frame
+	 * themselves when they fail.
+	 */
+	if (skb_is_gso(skb))
+		return ath11k_dp_tx_gso(ar, arvif, arsta, skb, held_ring);
+
+	if (unlikely(skb_is_nonlinear(skb))) {
+		if (!ath11k_dp_tx_sg(ar, arvif, skb, held_ring))
+			return 0;
+
+		if (skb_linearize(skb)) {
+			ieee80211_free_txskb(ar->hw, skb);
+			return -ENOMEM;
+		}
+	}
+
 	ret = ath11k_dp_tx(ar, arvif, arsta, skb, held_ring);
 	if (unlikely(ret)) {
 		ath11k_warn(ar->ab, "failed to transmit frame %d\n", ret);
@@ -10123,10 +10142,20 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	struct hal_srng *tcl_ring;
 	struct sk_buff *skb;
 	u32 ring_selector;
-	int num_free, avail;
+	int num_free, avail, reserve;
 	int ret;
 	u8 ring_id;
 
+	/*
+	 * A GSO frame uses a ring entry for each of its segments, at most
+	 * ATH11K_DP_TX_TSO_MAX_SEGS, and its frame is not known before it
+	 * is dequeued: a frame is taken only while a batch of that size
+	 * fits. Only a vif with the encap offload gets GSO frames.
+	 */
+	reserve = ar->ab->hw_params.tx_tso &&
+		  (txq->vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED) ?
+		  ATH11K_DP_TX_TSO_MAX_SEGS : 1;
+
 	ring_selector = ar->ab->hw_params.hw_ops->get_ring_selector(txq->ac);
 	ring_id = ring_selector % ar->ab->hw_params.hal_params->num_tx_rings;
 	tx_ring = &ar->ab->dp.tx_ring[ring_id];
@@ -10155,12 +10184,14 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	avail = num_free;
 
 	ret = 0;
-	while (num_free) {
+	while (num_free >= reserve) {
+		int used;
+
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
 				      &ar->ab->dev_flags)))
 			break;
 
-		if (!ath11k_dp_tx_idr_has_room(tx_ring)) {
+		if (!ath11k_dp_tx_idr_has_room(tx_ring, reserve)) {
 			ret = -ENOSPC;
 			break;
 		}
@@ -10169,11 +10200,12 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 		if (!skb)
 			break;
 
+		used = skb_is_gso(skb) ? skb_shinfo(skb)->gso_segs : 1;
 		ret = ath11k_mac_tx(hw, &control, skb, ring_id);
 		if (unlikely(ret == -ENOSPC || ret == -ENOMEM))
 			break;
 		ret = 0;
-		num_free--;
+		num_free -= min(used, num_free);
 	}
 
 	if (num_free != avail &&
@@ -10185,7 +10217,7 @@ static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 	spin_unlock_bh(&tcl_ring->lock);
 	spin_unlock_bh(&tx_ring->wake_tx_lock);
 
-	if (!num_free)
+	if (num_free < reserve)
 		ret = -ENOSPC;
 	if (unlikely(ret == -ENOSPC || ret == -ENOMEM)) {
 		if (ath11k_mac_mark_txq_starved(ar, txq->ac))
-- 
2.53.0


