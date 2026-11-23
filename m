Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358C960724F0
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GrJWtsyL;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=RjMFXGXh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yi15kur2YRezGqgqZjCpyNcgXCQsHgDB/ZB6iiC1/2A=; b=GrJWtsyL9UFFs3
	7bDUatWoioEXDwX0ncgEIOkspfY2N+NMWd6e9Ga8S5RgHLUaAmbYA8yCreInHyKejyoNSwVFpmlkD
	C2az6jxW/vbgNRhHgLSdtMnxykl4fgqSlQwpbgDIlsEOEq+4et8IU0n3hukNVJ8a1bwMDWaZnGAZu
	dRmdERhgdFdsDysjnNOOm2clz68v2dNoSVrhmRijUfRgT32gbVwHDnOKs9VyJcnl/H7gHM0epGNvd
	X3AI7hdMgwd51kvXeifRB5P148wsYG0KHvD/A4JQZ+wavhj76DrWktXsCyjn/sAga3BgKmaZMfxZ5
	MrOYuvVz6zqHAfcHYMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIj-00000003bsr-1saf;
	Mon, 23 Nov 2026 13:41:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIh-00000003bqb-1do1
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso4540947a12.0
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441301; x=1796046101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yi15kur2YRezGqgqZjCpyNcgXCQsHgDB/ZB6iiC1/2A=;
        b=RjMFXGXhfOSY0XD2y0tfjg8ua7Tgr995b7+uQwVHToC7xyPyK656Py40pTMivXpWuW
         FuaZ17U3otaHn4lAWCwoxBLq+m1i5S1ug5xHdtUdmu6BN+7bcllaJ2KzHLw/F9iHwglE
         VKUJObM6I61N20bkqQZBav3rNN4Ajig55p98GnzfmLozMOTWcngv1dIiulTMxQ8eXQzd
         DjDJRDGzH9RigADjEgMIB79aOyfxHu/6Ua08/KxBrx7Gynuo+bpCNNB/9ojGDCV3jb9o
         Ur/mX/zXfqzEMXVWIuyxUErqffs0OFzLDidHLp8MUBztNmzdLhHDAwGewrPUboRA7D1n
         /UgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441301; x=1796046101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yi15kur2YRezGqgqZjCpyNcgXCQsHgDB/ZB6iiC1/2A=;
        b=ilxY46bmNZXqBBnxCBonkQbOUWZgnkYEY5l/ug9Z77PmopL6Ol9i7SrRjt+ucBWZA1
         r5t4ygrsKIChARSSwBojLwWmJXtz9aFoZD29o+9uMMnKj/VJnt2DMh3YpPEN8WyLPRvv
         glaLa06W9os7hGjwG7myMIGHbuEj+2EC55Gin30+Vt7Z21chyBGfiFadMaakZDj9+1dO
         rdNRgnXIjtxnQ4KuRDQert4V92iZ7G+q8ybR2nN4WdivIhusnBfZi0givTAjzLxHm5tF
         l/Tn5lT7+VQhIh9pt+9bCJPfmgyLytduuSrTZFVrCLN2ZXq2wnt8TBm5gtsj2Qc/RBbL
         3LgQ==
X-Gm-Message-State: APuU4Z9uhJ3kGpPbdOucmRYUvKA6PxxtoN7PkShtxSVyxOpejj7mQ1Kd
	M4g0cUhWZN6MbZGPrjiE8q3FH/3Z0iaE49muZuZzl1D/v0vO8wBQNJJzspxz8euDTxXBBf+Evm0
	YyTvr+DoSnI0=
X-Gm-Gg: AZFdTZdwxv8zroIcEJtzLeO2ij/1lESJCD98up/+LgGRz9jotXtuyBYCT9sefzPLgkH
	gnMo/Jpg8wL82dMdLytxDj5W3Mi9CMrP/exnOQEWT3qoEic19BIYi5HkTxjQBT+sWg0oviyQJLF
	m0aR1ZLY8eXR0b/vSveTnwym8/pcNFK7OTd8mXCtPAKfZ6Aji/tR3KuJCkgALJ7zU1y98Jlf4VL
	59Z4eJZ7Fu7RTaeZV7rYxHXri5aItRDxvcila8o34LZ6Qb2V4a2bYrypmVMk290sz0LBaZ+vAUL
	7ZIYMv0p8UdYXr/znvlfY0QN6Z/C4DtVbw06iLmlfNhjZCda0Ca2GOW69NZtxFeI59zWvKvIrcw
	4tAftptbQdk9L1SrcBBx8RLDzzj5r0tQIwVnoIzFhJx7CLVesX/VAf1IuJdgUSjeLV2RfP5p+NZ
	F5mbMKXtQd0wBRXSJ2r4cx/0jbeDWmC+EqaeiL5TM6DjyHsP7LJ80+wqYMSLqHlQcMrgTYffkSa
	WiwkhwV4YK/rTnb9c0ffe8k+Ps/athHnA81fFwMctEkvOBhAY4gb0u1wjoBU9yviw4iye6Nniql
	x+Qiq0hWZAyQVt4kOMRiW71RQ93gbF0/b8ycvSdaamV5nEjGCIynvsh1+3prgHbPY4vwqkim/o7
	qfGCv40f6jj9zVM7p+Dbk2g594xcP517Nh2lGj3gqKKFWdXmSUKjmoW7zZdfdkKM2lxRvlv+aqS
	7gqBTeI2caqZG/bssx5EMQ8MKTqfBoPju2h2GHcYO1vmSb+DknJyOxRIstkj1xnjlmRTE1zJ4fG
	N/yt+oH7USDDRHdcxVLmV0uzU6wccfLpTvHM3TAXs6TP46OWaFSzGtyuOCec/tiLk29oINTNs5U
	PUmPN6CFFBL03TQyMyLGK0jExRThq1S4HjzAb3DKLN2rwZjkqgzvw68gQHMGObN64+e0GZe9sg=
	=
X-Received: by 2002:a05:6402:5cd:b0:6ba:4be1:9698 with SMTP id 4fb4d7f45d1cf-6ba4be1a024mr6759019a12.7.1795441301254;
        Mon, 23 Nov 2026 05:41:41 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:40 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 03/10] wifi: ath11k: request only the PPDU stats TLVs it reads
Date: Mon, 23 Nov 2026 14:41:30 +0100
Message-ID: <20261123134137.718575-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054143_477740_AB5D4F6F 
X-CRM114-Status: GOOD (  17.43  )
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

The driver asks the firmware for eight PPDU stats TLVs on every PPDU, but
ath11k_htt_tlv_ppdu_stats_parse() keeps four of them: the common TLV (PPDU
airtime), the user rate TLV (rate, NSS and bandwidth of each user, which
the station rate and the airtime accounting use), the user completion
common TLV (MPDUs tried and succeeded) and the ack/BA status TLV (acked
bytes and MSDUs, TID). The user common, scheduler command status, flush
and user array TLVs are parsed by nothing, yet the firmware builds them
and the host walks them for every PPDU of every station.

Request the four the driver reads. The full pktlog, the extended TX
statistics and the monitor interface keep the default set and the lite
pktlog its own set, as before, so the mask is recomputed when any of them
is switched on or off.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 15 ++++++++--
 drivers/net/wireless/ath/ath11k/debugfs.h | 10 +++++++
 drivers/net/wireless/ath/ath11k/dp.h      |  9 ++++++
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 34 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/dp_tx.h   |  1 +
 drivers/net/wireless/ath/ath11k/mac.c     | 13 +++++++--
 6 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb..b936101d6fa5 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -460,7 +460,9 @@ static ssize_t ath11k_write_enable_extd_tx_stats(struct file *file,
 	}
 
 	ar->debug.extd_tx_stats = filter;
-	ret = count;
+	ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
+	if (!ret)
+		ret = count;
 
 out:
 	mutex_unlock(&ar->conf_mutex);
@@ -1010,6 +1012,13 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 			HTT_RX_FILTER_TLV_FLAGS_MPDU_START)
 
 	if (mode == ATH11K_PKTLOG_MODE_FULL) {
+		ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
+							  HTT_PPDU_STATS_TAG_DEFAULT);
+		if (ret) {
+			ath11k_err(ar->ab, "failed to enable pktlog full: %d\n", ret);
+			goto out;
+		}
+
 		rx_filter = HTT_RX_FILTER_TLV_LITE_MODE |
 			    HTT_RX_FILTER_TLV_FLAGS_MSDU_START |
 			    HTT_RX_FILTER_TLV_FLAGS_MSDU_END |
@@ -1032,8 +1041,8 @@ static ssize_t ath11k_write_pktlog_filter(struct file *file,
 		tlv_filter = ath11k_mac_mon_status_filter_default;
 		rx_filter = tlv_filter.rx_filter;
 
-		ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
-							  HTT_PPDU_STATS_TAG_DEFAULT);
+		ar->debug.pktlog_mode = mode;
+		ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
 		if (ret) {
 			ath11k_err(ar->ab, "failed to send htt ppdu stats req: %d\n",
 				   ret);
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index 859071938a65..4bec01a85eae 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -279,6 +279,11 @@ static inline bool ath11k_debugfs_is_pktlog_lite_mode_enabled(struct ath11k *ar)
 	return (ar->debug.pktlog_mode == ATH11K_PKTLOG_MODE_LITE);
 }
 
+static inline bool ath11k_debugfs_is_pktlog_enabled(struct ath11k *ar)
+{
+	return ar->debug.pktlog_mode;
+}
+
 static inline bool ath11k_debugfs_is_pktlog_rx_stats_enabled(struct ath11k *ar)
 {
 	return (!ar->debug.pktlog_peer_valid && ar->debug.pktlog_mode);
@@ -364,6 +369,11 @@ static inline bool ath11k_debugfs_is_pktlog_lite_mode_enabled(struct ath11k *ar)
 	return false;
 }
 
+static inline bool ath11k_debugfs_is_pktlog_enabled(struct ath11k *ar)
+{
+	return false;
+}
+
 static inline bool ath11k_debugfs_is_pktlog_rx_stats_enabled(struct ath11k *ar)
 {
 	return false;
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index e6e05eb25692..5e973c337cb2 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -595,6 +595,15 @@ enum htt_ppdu_stats_tag_type {
 				   | BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_FLUSH) \
 				   | BIT(HTT_PPDU_STATS_TAG_USR_COMMON_ARRAY))
 
+/*
+ * The TLVs ath11k_htt_tlv_ppdu_stats_parse() keeps: the PPDU airtime, the
+ * rate of each user, the retry counts and the acked bytes.
+ */
+#define HTT_PPDU_STATS_TAG_USED (BIT(HTT_PPDU_STATS_TAG_COMMON) \
+				| BIT(HTT_PPDU_STATS_TAG_USR_RATE) \
+				| BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON) \
+				| BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS))
+
 #define HTT_PPDU_STATS_TAG_PKTLOG  (BIT(HTT_PPDU_STATS_TAG_USR_MPDU_ENQ_BITMAP_64) | \
 				    BIT(HTT_PPDU_STATS_TAG_USR_MPDU_ENQ_BITMAP_256) | \
 				    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_BA_BITMAP_64) | \
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index cac970c92806..9e21c7c3dba2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -1033,6 +1033,40 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab)
 	return 0;
 }
 
+/*
+ * The TLVs the driver does not parse (user common, scheduler command status,
+ * flush, user array) go only to pktlog and the trace point. The pktlog lite
+ * mode asks for its own set, and the full pktlog, the monitor and the
+ * extended statistics debugfs file keep the whole default set.
+ */
+static u32 ath11k_dp_tx_htt_ppdu_stats_mask(struct ath11k *ar)
+{
+	if (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar))
+		return HTT_PPDU_STATS_TAG_PKTLOG;
+
+	if (ath11k_debugfs_is_extd_tx_stats_enabled(ar) ||
+	    ath11k_debugfs_is_pktlog_enabled(ar) ||
+	    test_bit(ATH11K_FLAG_MONITOR_STARTED, &ar->monitor_flags))
+		return HTT_PPDU_STATS_TAG_DEFAULT;
+
+	return HTT_PPDU_STATS_TAG_USED;
+}
+
+/**
+ * ath11k_dp_tx_htt_ppdu_stats_update() - request the PPDU stats TLVs in use
+ * @ar: the radio, whose conf_mutex the caller holds
+ *
+ * Asks the firmware for the PPDU stats TLVs that the driver and the enabled
+ * debug features read, and only those.
+ *
+ * Return: 0 on success, or the error of the HTT request.
+ */
+int ath11k_dp_tx_htt_ppdu_stats_update(struct ath11k *ar)
+{
+	return ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
+						   ath11k_dp_tx_htt_ppdu_stats_mask(ar));
+}
+
 int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask)
 {
 	struct ath11k_base *ab = ar->ab;
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9303b5ba6e01..934c9ab6acf5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -29,6 +29,7 @@ int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 					   enum hal_reo_cmd_status));
 
 int ath11k_dp_tx_htt_h2t_ppdu_stats_req(struct ath11k *ar, u32 mask);
+int ath11k_dp_tx_htt_ppdu_stats_update(struct ath11k *ar);
 int
 ath11k_dp_tx_htt_h2t_ext_stats_req(struct ath11k *ar, u8 type,
 				   struct htt_ext_stats_cfg_params *cfg_params,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..79d5cf88f3b7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1195,6 +1195,11 @@ static int ath11k_mac_monitor_start(struct ath11k *ar)
 		return ret;
 	}
 
+	ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to req ppdu stats for monitor: %d\n",
+			    ret);
+
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "monitor started\n");
 
 	return 0;
@@ -1225,6 +1230,11 @@ static int ath11k_mac_monitor_stop(struct ath11k *ar)
 		return ret;
 	}
 
+	ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
+	if (ret)
+		ath11k_warn(ar->ab, "failed to req ppdu stats for monitor: %d\n",
+			    ret);
+
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "monitor stopped ret %d\n", ret);
 
 	return 0;
@@ -6694,8 +6704,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
-	ret = ath11k_dp_tx_htt_h2t_ppdu_stats_req(ar,
-						  HTT_PPDU_STATS_TAG_DEFAULT);
+	ret = ath11k_dp_tx_htt_ppdu_stats_update(ar);
 	if (ret) {
 		ath11k_err(ab, "failed to req ppdu stats: %d\n", ret);
 		goto err;
-- 
2.53.0


