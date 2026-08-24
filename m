Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855D1C61DB6
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrM2RZiWM8sldUeyTNqlmxOQd471ZY1V4UxOl51GWtY=; b=hMZH4TFJlAf2zFnTNAix4pGjPa
	j8exJrTXs6E0qlSLd1lf6Fsy0xc/ytvYffKB1bXOEbei+GTUE+oyjbeEDjGz5pnZ9kFgWCN3N3qvV
	X+RDpDunQvf3PmiP4RVlVCkJk9Tw37WdzVogR1h3sI8I35lglhw2yIHtYm8o0NiZtp+Hw5JcQgDor
	ARLvg4wUQGKVucFcx0hHQSVzQyHkUR70wZsMEWy6FdO4mSfoW1Hy/LZGWjaLXNtVRmxe2TVlVYooI
	y+e1H+NdwqPfx9+2KMYl9jdi8FOCJ8YdA6EWlWC/3BCXSRLh7mtQxS8Un2Bf27qCG5Jv5lokSpcBF
	IUYT7QRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbQ-0000000Gm39-0hgo;
	Mon, 24 Aug 2026 14:24:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVbI-0000000Glu2-2UyI
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 14:24:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso6267225a12.3
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787581475; x=1788186275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrM2RZiWM8sldUeyTNqlmxOQd471ZY1V4UxOl51GWtY=;
        b=e8sbbA7ceXp9sY19OpEy9gSr5h56eH3RQp0ELeaaOQ6fffeL5ZvV2h2zKpoyybaVmO
         jI7/Jjwd31ZroLb6lnsmJ2wFLkTCg6bShafzOwUPqQ/biWOkChSg951ZN7Cj+ZuKgCg+
         coUEa6v2qjVG23C4YF0KptnTWY33YaxJSSHrNTUjapEW7GJJdqAhJQkamdeBbpwXoVVL
         atcVZgKf5UO9AKlbYhfv7AdAdwA0qHfnRLr+1cM1LcsdFyyqwbRnEFJ2FKDlK5f4GdHg
         4Aq2bKhKRYGezOlQ2F7AIQatcJpBp5QQik2VLKrX7oC66th+Pb/sfgftFFKLkTdf1vb1
         pS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581475; x=1788186275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NrM2RZiWM8sldUeyTNqlmxOQd471ZY1V4UxOl51GWtY=;
        b=naPX+YTheAscFRuxjd8cWFEafd/iIMw6kOp64w/Fe62gJ73x+FtW/V37JYetFr1IMw
         Kd2yunVgAHayFpUUkPy5vFA4H8W04GKYS5wQqafFe+PWne7eAIh8MqWPHJhml/CbkUFG
         uB311KQC5hDflARXShl9BHxXcJt3dRcjJbo69phqSprjz7k7gpG/8am2Fgt39iflQ6rY
         FvrfevC78eKyQKD7LVvq0Ksg18PXmbFcXtGxDXudBFk0tSDRKyLmB2RPufBr8x30dqb4
         a5K41BrRmdYCALj23Ix8VBFik4e0H/Skvjow7/DGALnMyjuub4CljOI8b4mQRzcaz0B7
         OMsg==
X-Forwarded-Encrypted: i=1; AHgh+RrBAnm5fEaUE8LHFv1xh7S9IuN7CYDSBIihlcf2KR+iTihqO92uEfmYUY6JnTXkOGaHayEnMSU=@lists.infradead.org
X-Gm-Message-State: AFuF++mt9gFrgnshlQdHPSDrasTomY8B1uT7WX4KCke6xJAkYuff/pxG
	M6R4yF1c+Ao5FRCSSKD17BhcEofmdVshzlZEzPJIe9tP8BjcZZ5D6pGGrema1+rQemv052YH7AS
	kT01rJqFn
X-Gm-Gg: AR+sD105RFp29QfXqVg+OWAu/Kpj9Psra5pWeq9kHoIF4TnW1Cibuvn1uDzG+BWbU/J
	QnlsrGVfi1CipHcOjw1/YF/guAEKpr9pubWoLhxulu6QJOcnvrRvOJKkqgGYu7NMZ6/Hcmb7Dcg
	QCE4kvSQUeHsCDDhP9WNirVC+AOuAcE2WJzV31ZyoavlGIiU810X7jCkKzGEmnlyBqDHitBXxYH
	b+fUdushxIGZ5dap8wVlICKPh6gYlXjbwbdb6QDBlA5E5tS+YCVXuPAT073vdRR+PwfFrHm+QGO
	lK9iTBhxsSJ3S1hfGL5c2I5bLv6lQVVygwHlKEb5BqCu+YDnsuBOfuKbhMsatuVOfwUDO7/JQ2d
	lxWNtWjWd/abF+c9jIVAJJbp+LkzWV2AtsE+OxCcT1EMV7wLmrQkq6Y0boNRl2INshCmOA00UBs
	BZ//EihxxREH3YNVgWlzsVicFESlFiJO+RHvv7DTr3zYxgQujyV0zmpzoXRfHD2Q3olYyM0Ty6m
	DtZJ0nnHP6W4naAFsTNXKABEwNTaTT/wgeifrPy0AsbWwFM+An1h1uJZ9W1x4nElljGzm52tTDW
	0Z9B4H7B8J+i69I+0gRjGIUg6/hlGEw1U27gfq3eGwYJ4CoMvwMa38/mz37UzLlCjdyN5MG4lh2
	yIWrBf5RML4Gl1xMNWlbwmOfgulOMoJbdgAfzFJR6HiLlp3M6BrfMjv+umA98+kOp2o4SXd/9Oa
	61JA1hAIAz
X-Received: by 2002:a17:907:930a:b0:c24:680b:3944 with SMTP id a640c23a62f3a-c24925e416dmr1935275666b.13.1787581474570;
        Mon, 24 Aug 2026 07:24:34 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1329890866b.42.2026.08.24.07.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:24:34 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk
Subject: [PATCH ath-next v3 9/9] wifi: ath11k: budget the tx completion handler
Date: Mon, 24 Aug 2026 16:23:50 +0200
Message-ID: <20260824142350.1757379-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-1-julius@bairaktaris.de>
References: <20260824142350.1757379-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072436_667039_B54AB15D 
X-CRM114-Status: GOOD (  14.78  )
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
receive blocks do. No new constant is introduced: the bound is the
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
index e706ba1077eb..b309a97d6ad2 100644
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


