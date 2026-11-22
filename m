Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5397C606A32C
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4ncXbIhx;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=rSygODy6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=; b=4ncXbIhxhwnHbd
	iu85EpI2Wx4ETzDWGtwM8pNzJkZNE6LV5LGZiqHADZHq9kmo1YWWuJoTJqlUzNi62LV2xqyUWXQbd
	sa+VI+WtHjngwa6W+YFe/4btiL2XnymecfdxuvwJHt6dPQUXhwSt+c4WfSGw/bnCc1jvgvCnX3gj8
	/JhrJTQYiouShkTeKFi+TVyiJnHFUCYYeq+5J1Siezr/rvpR6mePIsttCZ5s9UmNBaThbMs6OgtKn
	a2mmBqz8Tj7GgGZT4RuBziRBC684s1MOkVQ47zBkqCPu9JQmdBilfX5idm2HZmcxznhzhtbrMhhYY
	Mp2vB3QgZU2WGeopH27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2f-00000001UOH-04ui;
	Sun, 22 Nov 2026 18:11:57 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2a-00000001UEs-2i5I
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:53 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c515369b627so203022366b.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371111; x=1795975911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=;
        b=rSygODy6YseuecfMJR6mbVmWy8xflhOVDTXf5+yg09Wr8ySshEZctHtWI7OJncFzE6
         y51eb/0VIB80qth+mg7w4bimRy/JFhZN1Yex3xGfFiwXsJ0C988hYmux7AtCBddTw4Bq
         BFqKBRmJ+Fnju/wXdHP/a8qG7CB55pUzktj4SKmURgsCIMS0wCLAU+YAVWRKFbVG5TYw
         hf3yLnsFNeMszd8XmTNYLrJEDG2WiEz6Sht8ddX/H/PtYOvcrIGx09n+UFcqj6UHH/MJ
         AhCdfmkP1wmgeLiwgdy2rDF2eHQJgzhnVRWlfQrpU9/kUgryyjiVrnbfAcPd4DrmO88A
         Ze2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371111; x=1795975911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nXaqa51VcSPJXED3QUfcyRH7/CS/duyW16m/AG0rVAE=;
        b=1f0T0yL33ioE8ES5QL4P/9WZgNt0IES/qhXI3mvAP/kZCDLjrJyw5eQ3VVoLEYYQHh
         uiqh52EPNSX7jyRM7MJ5uIkUzPazEcfJRyL6ychq2vJQVgEu7QDICbv7xOsFTRfkrHXZ
         nqq1eTx3w/5cMbV72nehuzwWX3kTSDDbaZfJnwMStrTs5kASJt3pULW9cmiMmrhtuzp4
         BsF21iASDR37Hnk2C+BgaGwO0TDYgM7RdfcMANP2zVDNEXg3RwsvEPGj3e+MqaZByeq/
         ECA3hSFIIEaT2i+B0sxII1p/zXyDGCqp+7LMdRFA6pGPJe2rrL1cYwD1xGtMwzpd1kT3
         3pVQ==
X-Forwarded-Encrypted: i=1; AL+hErEbcVdY2h4CUPyEUoX2dDRw/WnP3HdgVC+x2+GRoY2jy8cNRnzxLcgYuFhqVdm5yjqTDrs+UWk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8G2CuZDiq1PsruStK9Ab7GXtzjaREO2PqqSFz45R4vBh8+aE6q
	yCT52fIQ5as8rPbGq8dnKrmpQPSdMk1UAnolADqbkWdDiDbzYmBSt2xE5DUjcZX9aw==
X-Gm-Gg: AZFdTZea9aJmaeHnh+AEpoMg9CXICLzMrhYx0o1fuO5LHGIwTCr7sp9GKxrjeI2rXXO
	k/etJwdvUKdgS/4eLebysEN4uaENgiuoOBwQVScmqQngnLGFuCYlJ55/amX5ZzeC7mPxMPcvmyZ
	nfIn/n3XlZDJ3yhyze/rNsHjbvJGNgk2fRiQRPYJosK2e7YvKP2/Bz8huUj4odhpDBaxbMvzWcl
	X5x0ERdV6fbWD9+jS3fv1leWSC8omtaVxxeqQxIq6vZC+x2QhXV/8zBwaY5rumFkPM2f8QJc24L
	xcLRCSC0TPBZZ3K8+Uqg4joOy8QnHySxV29KgKzHiQzyX8TEQ6U1bgH6/vw31QPYjikh38NI7VT
	ikUEjjTRJ29cKkj/P2+KMrjwz+ALn2PdBMI+4Cm2t9ftS5ltvAESb2AtF1qqoqL8vXqkBo6cjf5
	6eej9hYlJwdrmX1XtA6c7la1zgDjlADPIM6S34zlH2eg3HoKPqH72CX4QOfKi9AL7MrIWBPy/WC
	v35Xs+jxQWYoD7dOWSNLHR8Txf3PBc7eJzNUR9cnvtj4pQHV3sXt9j4Cjv08HIb+LcWuBJhN2qI
	614ruIXGHU3AE/7+8J0JqqKug/PVw7Jlf0frmw1270cTCV9FD/Vn0WNIjnuiVsX89q/cfAYQXLN
	OQ1Qg0u2Jpge6fwXvbdG7V/kf3q0HW+fPF8JBsKy6BJVqbOQU1DZk8PWqD8too8sFTHy4rWa0oo
	q1tcgcRRN3YVTP+kT2tEAvSlzOH2GpMM6bA7qlj7wNr66AalTyLCjDsBQ7VgoW0vSCOwzNCeofZ
	orpyJaG5BoNWO+C99jckSxMan/CtGyJfH0TDhVOL+Ck/hgQbCfvQE1P4Grr+50mVc/nwB0bVmfm
	+3CgWd6OBZD297B7gf8+kKK6lUB2bPNbX/PpnRwShYZ3/cy21kAzDsD/VK+kEx23x2z6ZQlJ
X-Received: by 2002:a17:906:9fd0:b0:c50:5a93:3bd7 with SMTP id a640c23a62f3a-c513a52b574mr686313966b.3.1795371111072;
        Sun, 22 Nov 2026 10:11:51 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:50 -0800 (PST)
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
Subject: [PATCH ath-next v6 9/9] wifi: ath11k: budget the tx completion handler
Date: Sun, 22 Nov 2026 19:11:45 +0100
Message-ID: <20261122181145.1015729-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101152_711753_54F5FD12 
X-CRM114-Status: GOOD (  12.59  )
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

ath11k_dp_tx_completion_handler() reaps the whole release ring, and
ath11k_dp_service_srng() charges none of it against the NAPI budget,
unlike the receive handlers. Since the handler now ends in a scheduling
round, a full ring gets one round for all of it. Reap at most the budget
per poll and return the count, so a round runs once per budget of
completions; NAPI polls again at once for the rest.

BE aql_txq_limit 500/1000 us, three interleaved runs per arm: both arms
reach 94.4 to 94.8 Mbit/s, and the sender retransmits 4, 6 and 8
segments with this patch against 8, 644 and 296 without.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.c | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 615384a4bb75e..833feb981cfc0 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -783,8 +783,14 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
-		    ab->hw_params.ring_mask->tx[grp_id])
-			ath11k_dp_tx_completion_handler(ab, i);
+		    ab->hw_params.ring_mask->tx[grp_id]) {
+			work_done =
+				ath11k_dp_tx_completion_handler(ab, i, budget);
+			budget -= work_done;
+			tot_work_done += work_done;
+			if (budget <= 0)
+				goto done;
+		}
 	}
 
 	if (ab->hw_params.ring_mask->rx_err[grp_id]) {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 1c4cb98f89292..5c3ddc8aad41b 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -765,7 +765,8 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 		ts->rate_stats = 0;
 }
 
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget)
 {
 	struct ath11k *ar;
 	struct ath11k_dp *dp = &ab->dp;
@@ -775,6 +776,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	unsigned long push = 0;
+	int done = 0;
 	u32 *desc;
 	u32 msdu_id;
 	u8 mac_id, i;
@@ -803,10 +805,13 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	spin_unlock_bh(&status_ring->lock);
 
-	while (ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) != tx_ring->tx_status_head) {
+	while (done < budget &&
+	       ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) !=
+	       tx_ring->tx_status_head) {
 		struct hal_wbm_release_ring *tx_status;
 		u32 desc_id;
 
+		done++;
 		tx_ring->tx_status_tail =
 			ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail);
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
@@ -864,6 +869,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
 		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
 					   i % IEEE80211_NUM_ACS);
+
+	return done;
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index f82df5d2f6033..760251c68b933 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -22,7 +22,8 @@ int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
 bool ath11k_dp_tx_idr_has_room(struct dp_tx_ring *tx_ring);
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget);
 void ath11k_dp_tx_free_pending(struct ath11k_base *ab);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 			      enum hal_reo_cmd_type type,
-- 
2.53.0


