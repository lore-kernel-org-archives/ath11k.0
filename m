Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26B4C5DF94
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAcQKsiHHrhl5U4tNXvyThYZ1gGnGcacUCSiyofhb0k=; b=hfvwLXziVMME9sbFzC6f9DBo5/
	0LvEnpDhnNxXpdYBL/XCJyYyxuDRly+7T4wFy0AFkyTSvZr1LZ3rxkkSewZoG/CvmecAm8JuAAa2D
	JBYaheo/rylol4eVD3oi9CSbwjt8lrYTfgwTeud55XuScBfwMJ7QZ7o+e+7jDKUC/EqwEvZyi/axO
	OjehihzLwOQNTrdwd2ADljwsZf+xhrVBRVGYEce3dtQGSsFKMyZpBkRxjftyejzPXqtfXBJD0WSyY
	VycwCVpW5A0kDFF5tqrL+SCPc2fqnUIx362+Njdl+jTEIlor7FZVhqXGDicuDD+oUzuK21fZkAF2U
	TAA2DYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKr-0000000G7WO-3hiO;
	Mon, 24 Aug 2026 07:43:15 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKf-0000000G7EW-3EDk
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:43:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so6275626a12.0
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557380; x=1788162180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAcQKsiHHrhl5U4tNXvyThYZ1gGnGcacUCSiyofhb0k=;
        b=QrRRTzjFNGnUOQKVRC0BNAopKFFa7QONT0trlea5r1m5sFaeF+nlhdbyq4yIqTyScX
         kqU9SaMlyCfCqqOjde/v0sZlxjUGrd8XY40DCW5WBGFJFvi2CmKSnPOlCgaNLVjONsUW
         tdQyXL6Es2tjX+8CQ1yONnfJE7msZe4t/6s2qAz/wrXQ0tsfAX9Zok8taQf3LEcYjBZW
         lrIB2P0tHqYZhBU66uUxG5VUK0TE/GM/Wdz/FCb7R15k0QhcY2ULLiBPRjpwBTHlF1z3
         8lPlh7glB4xvBvMCHLHE4kJuTD3Qt6++kP2YIsrZyilfXUbE3Rn2fS9XJj5nRAMyY75v
         Jpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557380; x=1788162180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAcQKsiHHrhl5U4tNXvyThYZ1gGnGcacUCSiyofhb0k=;
        b=IwlHNDGNXWsnfW2kC7u62abIJF+zgB6yGJ89v95Hdiatl0ziZ0CU0cerUsOvFtPPM7
         +t7rdDvTCFQulE3VKEf9GVRgaiMXCjHLGIQAeuqlMP0e8ri3RrUkfsDg4benW7YNGgny
         fu/3vJxhQSjO6ja2uZ4aYxan4Z9m1aX97wnt+JXa3jo9seD6tS1K/Qt7+WZq321bx0j2
         BWNP9TexFIgaf7E72sE5PxUO6v7HHRrgljnJ6dKRtTlS00vqPLBg50Y/1E8NHxVgDNu3
         v+G4wsXxHI2XPXrg81N1Bndyne5hXwZUoJ4au4LGisAjhkdezIeVTew9PhZ9dGfQbbP1
         DXGA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4yT9QHZYJy1eEvFmlRiLsomUaZUpnBisVK2NOZtSqhSaOOWbxHo1m/uUz0cE1tbQK9wfd/mQ=@lists.infradead.org
X-Gm-Message-State: AFuF++n6qig9rZNQr83zTa9iN5SHGQ8pQHPMqKVbmQtEcLkOEBMltAO/
	5kx0P5LVcEyXtYecE2IuYzj4OqpDXAhzWBFcwSqDtvQSBSVGNb0ye25h4sIT89nxZ/RF08jp9cC
	BMAQrJ+PR
X-Gm-Gg: AR+sD12xXFsr24ueOvPmQH/diIMzRAz+zKD0N1YW280Py/hjrEsJXUuFfXaHrns+Y29
	vu+0JvcARYoIo8wbdvSlh9Aih9C/HThJXPUCtlo1fC2x7Yc4CwLK35yamaqU201CbhtcblOJa+i
	0USFq9wSbrzhdFHK4qFPEcHSXQXNkaq0blbbCxpy+N2XluaowUeQS6gx3RSwk8KxeJatbdZhzKi
	P/TgWi5gXho2fK8vEZh7s8A0DJjlC5qXZNFjF9EtEfDtqvJfGnY6y0OdbLiE5cihwH93PniVuU0
	iHO6lTBisL61jVF9iwkmQYSxWitIUKmjW5k4zfRJnavX7jKFnde8ZQZ7GLLYOD3iua0V58QI36M
	IyE2i+GXWJLFbMStWE+R+pMx7suV1PItpVtHfaj1mCA12W9L7ObXZ3COK9HA3g6Njnv5YeRX/7E
	JNj12Z+9qGf8elnYI8yVswb7jkgxgp64xGwW2TvNovwIZ5C0kbgZJaputxjOOs6+ruU2u8ux8Z9
	aHHTbXlPXdY6s/k5qo7x6PCnG11hfhiDXXc6KfWOFuvhRigQsKKRjw0su/9H82GqYcsY5Ehtsqp
	gOsVqsoqhSXGVismrbayEUyvNd/6J0zAgkOwBGwIg9sThBGSBMqGTr5tvXgpkjTUgbQD8klVdeV
	jrXTRKeS/UvgcmYX5EKbMxinBufKVjfC83x1v9K1Pre9sWdIzjJETpsOvZR2e7iuswMfd56iSCy
	ciasgsozYX2AVSAFtacM73afRm
X-Received: by 2002:a17:907:98d:b0:c12:b2db:873d with SMTP id a640c23a62f3a-c246a2ec634mr3075330866b.5.1787557379883;
        Mon, 24 Aug 2026 00:42:59 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:59 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 9/9] wifi: ath11k: budget the tx completion handler
Date: Mon, 24 Aug 2026 09:42:28 +0200
Message-ID: <20260824074228.2114579-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004301_876235_84AD7DA0 
X-CRM114-Status: GOOD (  14.86  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

ath11k_dp_service_srng() calls ath11k_dp_tx_completion_handler() without a
budget and discards its result, while every receive block below it takes
the NAPI budget as a bound and reports what it consumed. The handler
drains the whole software status FIFO, which holds one entry short of the
32768-entry release ring, and each entry costs a DMA unmap, an idr
removal, a peer lookup under the base lock and a call into
ieee80211_tx_status_ext(). One poll can therefore run for as long as the
hardware has completions to report, with the receive rings behind it
waiting, and the scheduling round the handler now ends with adds to that.

Bound the drain by the budget it is given and account for it the way the
receive blocks do. No new constant is introduced: the currency is the
NAPI weight the poll already carries, so a poll that spends it on
completions returns and is rescheduled rather than running on.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.c | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index f389b97acbdd..676440ee742a 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -781,8 +781,14 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 
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
index 2270b2079297..0a4381870496 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -685,7 +685,8 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 		ts->rate_stats = 0;
 }
 
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget)
 {
 	struct ath11k *ar;
 	struct ath11k_dp *dp = &ab->dp;
@@ -695,6 +696,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	unsigned long push = 0;
+	int done = 0;
 	u32 *desc;
 	u32 msdu_id;
 	u8 mac_id, i;
@@ -723,10 +725,13 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
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
@@ -772,6 +777,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	 */
 	for_each_set_bit(i, &push, ab->num_radios)
 		ath11k_mac_tx_push_pending(ab->pdevs[i].ar);
+
+	return done;
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9303b5ba6e01..b5296cda73e3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -21,7 +21,8 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 			      enum hal_reo_cmd_type type,
 			      struct ath11k_hal_reo_cmd *cmd,
-- 
2.53.0


