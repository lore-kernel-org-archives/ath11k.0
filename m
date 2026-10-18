Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C20CCF2C4
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l49vYvw4c7WVjhiBreGzHpWeFIjvw03pd6v6/6nv5IY=; b=WXi6Wu/uhlZ+KcKbI6hfjV7NWs
	9sPiA1pn6TTGGz0vLWsNKFkEBpnhkuGPz04oTanm1+BMOJo64YxJ1KGxmq7jGHcioma0TvXiyfnYL
	eN5Cb+BEWcQNF3n8j5MZvVstmTOgFlg7FZWFqlYTj/Ue7X+S3TBAsK1eq5k2JEYGZCmNHCImmOv7F
	JUMWbJi4PYyoL2gxA7h2PEG82vM6QSmhijQ040PzZVCak22fY4/DvGX/sqKcFqR5OFO+siEVtiFl2
	FJG+x9HPAntZUG4DunteyXOBF2DDsaKEzD4LFTXQkystSZlCm9b7w9FuerpQXUjyNXV+Wc7BKatod
	46mg3tNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0d-000000067CW-43Fw;
	Sun, 18 Oct 2026 17:49:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0Z-0000000677v-3veI
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:21 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso189934566b.2
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345758; x=1792950558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l49vYvw4c7WVjhiBreGzHpWeFIjvw03pd6v6/6nv5IY=;
        b=W4DsCNOTm4/eVhs/7MMYzsxFabrpNwdjLfNrc2Z04CznslL8RXTN802H79gf0g8aWs
         EsIT+6zgNENZhkad+WMO0RPpi+ioWFjkVweNEGVKJa1wpJINJEV/jz98qN6m/EpV0Jcf
         UOWH3lf/6iFreiqHVLGxfBTDanaZ+Sfpqu6QTgE71NTGWG2AyjXIBQ1WA+rIgclV42BA
         j5PeKsGTZNjEmSyTSKjq4NwC21lPM9IEfIU5+uI8UY80BLhVFNRJBc7lxL0Wbg4FUs2H
         AAIsF6l7xXhJIO9Zo3etZXjEJvfBoOu/8VT/Z4jFMfSrst8rSqQA4WnQQiC2bsUNt1Mt
         Qzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345758; x=1792950558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l49vYvw4c7WVjhiBreGzHpWeFIjvw03pd6v6/6nv5IY=;
        b=zwp3ge5gE9Vruxb+cAZNtNTc7gp2t3fR0QywQjT+KywBmBKPpPAgLE3phMtTyVQ8z7
         sM904YoPpKUhH9+bHu1GIyMI7l4a6PdMvc2OAMgxGwKSIHJk/WFEedxsGHOoNuwUmdhm
         LSg76cx4IqvmvfFt5HZV7N8YBRFbXrffn2yPS9Mypicv9hlQJhzQikhpUJcile3dVFVB
         crNWSHB1Wq0pWziOL6iTzShEU0dUjUMYIbhjg4xGoj4Lxbu/lxrOOz0TRrmBt2yqhfz0
         a+v1bF6M8HIWjPM7N1W6asCCY/GEnAnZyR2PJnWlXEMBM+jxE+Q8oYK3u5qvV5ZtPTWi
         T4Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzBEg9uKB76facWpMX2tsgmYTMe6XRCF/WeZCOHu9mx/Mo1axbzqGNgHX3KHbLgYL7d1a/J+KQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYIRZFto5LURh23Aq1a8em7FJYdUuQABX6McwXUiuTk86UPb4/Y+
	o1d4K5ahzInngQ//9++dxQqS6e+wd+2HzYy2xqqPKDpo2XswxPMXxhP5H3U9Mt+RiQ==
X-Gm-Gg: AYBFou1adPUp9CXpY1QKrb+PWHpK5RdBH4MDqE7JlTW2NWdkQr+gIJjA79l5NRl3geM
	ytp6cyuinTl3fq9AQOXCDF1eDOUS54ILKbZnKskzUPj8G2J72hgvOmV8th2AuQYIb2OOwz1wBDi
	qAYAH9QCkrdhdCGowIBM0FnTn9SuVnrFvZLRuYoD9eBa4DLlxrjAlTIG43OAv+DdFYASn1O682l
	ewgRuXkd3RHjOgyq1dBqoRE/zPU2kjGit37bG4/NaFqg01wySoWCtVVw9nT6/+An/J8U2amiaN3
	PRznVvU+dTbwkyA1MIE5BUaAfSA1AhnOaLOax250mWgnxNoRntgeZx9paNMncSjJppBiTFRWHD/
	+kFiibeSfCnD0rU25+uEObe8AXYKpUd8sxWrP3XQsm0mA5ExEsbYPY54o+VDPGTsZfj6JQNCWQj
	f97bZ8X33c8GgHUJK9bajFXejtpLy2bQKjxxUtGNzOSq5gYo+e1rM3CquoTbq+h3qGCA8rQ3A4u
	njYycLTdm9+VCRdMnOeuQbf7UoJ3QLJEUn7bXPoFWtiHx17UBcNxNPKGMDDHrOtbHtg31NAlonp
	8N5YzSK+d/uf35utgcSszZHBq73UMohNjWYcn9oXV7KXVc+Jz8o4+O1Z/paFBrqSXBRq62kyAax
	Q1avi8sC6/Xh/2xWXXbnJy7bNKyFFIFmYF3rhvF0cZ8bRXMGDC9NrWona3gusZRLa4HwK3zpDf8
	fX+Jb59UHfNENxKCZQGB4=
X-Received: by 2002:a17:907:c310:b0:c40:231:6eab with SMTP id a640c23a62f3a-c419d540a7bmr350811566b.16.1792345758054;
        Sun, 18 Oct 2026 10:49:18 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:16 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
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
	toke@toke.dk
Subject: [PATCH ath-next v5 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Sun, 18 Oct 2026 19:49:00 +0200
Message-ID: <20261018174904.1757161-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104920_003155_8032B16B 
X-CRM114-Status: GOOD (  17.62  )
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

The wake_tx_queue handler serves only the txq mac80211 passes it, so
there is no deficit round robin between stations. Run the round in the
driver: walk the access category's active txqs with
ieee80211_next_txq() and drain each through the TCL ring check until the
airtime queue limit binds or the queue empties. A full ring ends the
round, since all txqs of a round share it. Each round holds a
per-category lock, as in ath10k, because mac80211 forbids concurrent
rounds on one category and the next patch also starts rounds from tx
completion. The design was proposed for ath11k in [1].

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 44 +++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..40895d276de5f 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -709,6 +709,11 @@ struct ath11k {
 	 */
 	spinlock_t data_lock;
 
+	/* serialises one scheduling round per access category against the
+	 * other contexts that drive it
+	 */
+	spinlock_t txq_lock[IEEE80211_NUM_ACS];
+
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
 	struct ieee80211_channel *rx_channel;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index eca16a151d068..226e1417ffe74 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10078,13 +10078,12 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
-					struct ieee80211_txq *txq)
+static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = {
 		.sta = txq->sta,
 	};
-	struct ath11k *ar = hw->priv;
+	struct ieee80211_hw *hw = ar->hw;
 	struct dp_tx_ring *tx_ring;
 	struct hal_srng *tcl_ring;
 	struct sk_buff *skb;
@@ -10097,6 +10096,10 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	tx_ring = &ar->ab->dp.tx_ring[ring_id];
 	tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
 
+	/* ieee80211_tx_dequeue() applies the airtime queue limit, so a
+	 * selection ends where that limit binds or the queue empties. A full
+	 * TCL ring ends the whole round.
+	 */
 	while (1) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
 				      &ar->ab->dev_flags)))
@@ -10110,7 +10113,7 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		if (num_free == 0) {
 			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			break;
+			return -ENOSPC;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
@@ -10123,6 +10126,34 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		spin_unlock_bh(&tx_ring->wake_tx_lock);
 	}
+
+	return 0;
+}
+
+static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
+{
+	struct ieee80211_hw *hw = ar->hw;
+	struct ieee80211_txq *txq;
+
+	spin_lock_bh(&ar->txq_lock[ac]);
+
+	ieee80211_txq_schedule_start(hw, ac);
+	while ((txq = ieee80211_next_txq(hw, ac))) {
+		int ret = ath11k_mac_tx_push_txq(ar, txq);
+
+		ieee80211_return_txq(hw, txq, false);
+		if (unlikely(ret))
+			break;
+	}
+	ieee80211_txq_schedule_end(hw, ac);
+
+	spin_unlock_bh(&ar->txq_lock[ac]);
+}
+
+static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq)
+{
+	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
 static const struct ieee80211_ops ath11k_ops = {
@@ -10817,7 +10848,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int ret;
-	int i;
+	int i, j;
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -10851,6 +10882,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		pdev->ar = ar;
 		spin_lock_init(&ar->data_lock);
+
+		for (j = 0; j < IEEE80211_NUM_ACS; j++)
+			spin_lock_init(&ar->txq_lock[j]);
 		INIT_LIST_HEAD(&ar->arvifs);
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
-- 
2.53.0


