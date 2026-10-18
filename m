Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E5ACCF2C4
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFNtCzvI7gSFb77nFbMde1Lkd9uPbYBLVilPT+Ceo8U=; b=fTj0asRHG/wb/LGNDXfPilBJnD
	Y67zOMkbV90ERudJmeVZ2tq+Aq3bS/0cnWyhHgT4yn7tmjLy4SLSt9WRk6zimKSicOUEOgugUvqHk
	yLLMtBie6hFZbKMWkEWjgxF6GhuaMrUj+2WuFSP7IYB4UwOoQXYIBc2uIrvBw8dGUFAiBpcFynFW4
	Vu3M1Z0cknZbfrZy0+YlJZPI1M4D+BZY7CxXlbqfj24fQn7QOEw73paJVKglC03ybq9bMcFf1MyLi
	NZf8knbPO618PKbc5ggqsySn6DXD5Aoioj60gXAHTmcjemkKygslhBPH6Ksn4fD5RtOIE+3hl0RQh
	06c00ItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0o-000000067RU-3KYm;
	Sun, 18 Oct 2026 17:49:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0h-000000067H3-3z5C
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:33 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso2257918a12.2
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345766; x=1792950566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFNtCzvI7gSFb77nFbMde1Lkd9uPbYBLVilPT+Ceo8U=;
        b=sElT8Hg0tnQCrIwRM+tOrIpurnJ8G3Q5hv/pDu4oNCnSxgdtoFLfxVviv4UN0XYl3h
         p01nYxU8MBLAnf9YDOopAKihXpKD9SN3m9ZKTev8G95Pk/A7/FzL7G71LAsViMJTTflT
         GTH5nOqRfdLDJodRoYLiw7or+mO5ozkSkAi/IMQh/+sDkXUSXBI4M0D/B/G+Zw3KSH7w
         1v32vhmVd6wxWIckEVyr2NAqQvBZnIexN3+TWDvrbUgPGb+6ieUXxzNitLFv/tUtAYGX
         XS/CNcDgG4o2Aoc5jR5YUADieJ/RUbmpB8kMp8BjrEEFJNpQQ99nhLeJba0939OsRAmk
         cjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345766; x=1792950566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mFNtCzvI7gSFb77nFbMde1Lkd9uPbYBLVilPT+Ceo8U=;
        b=wbKs4ytNOMDRXFctOBqeTFURnz8dJPjMTRHMtHwmaYCRR8gI+ItE+UZNT/pEM28pWd
         QaoS3ZO+T3WtLLR69Flw1n0oISHtB0k4fQNK1RIw/aeqnTLsoTbzkcxQwVD3XTIUHtIU
         eFslxNKEKMDog+b6ldOvJvI5Mf7c8Vv4XCaymZ2O2xbimWrWriyBSD8xuDN0nCGbFvZD
         xllaS2rrfepCIkAWNh28SjjWJEG7532gdX4CDpWZty1y0BZSVWKUNC88SM7jbxBW+QDo
         H+ZIEpm393bz1qJzPKLv8HJZ3DynNHVJM8JJtvScz2LreFBgqMas4wttsWByN6SdUEx8
         tEdQ==
X-Forwarded-Encrypted: i=1; AKwUvByTpNfFrI1JGZa1R/pr6uozWiQAeTffL9f764nBiGHI684el7QzZ85FgIAhUhNVSQoEAJTZz4A=@lists.infradead.org
X-Gm-Message-State: AFq9FYKvLN7bOc+dm/RLwBBsxSus8OvcsDvGruau1Q9D06zSRp/SFLxm
	/S29x6TjH5RTxNkBeIMg8YDS3hq8MbO+j3WKCezYpzQhQugY3HpN3GG3P86Gq4m0Dg==
X-Gm-Gg: AYBFou1dVDQ1IP170C49M3p+InczgQKgV6q2EXChMxoOGzObo90LpNrt0ZodPEJnmGY
	wzUCR03c0sgnuDbPchT4X8cd/Rxus84FDeFkQsYWONH8dB4rn6TS+n11g1bNAvdVcdZkW1xWIwB
	qLoUY6QfjXXwW4ruzFf5ujYbISKUthELD1FVDHDiLWqR8pGCiBwaLjyT/nZju36725JZAzYlJqP
	4N8H0Z547+KzfiwBjMMuUxmAvzRAAds5H2Dtcw6mi1XyzafXxhn2eskJeoHUSAKdUbaTzwGwc9N
	FOZcc194fbiod5/rC8l0WSWT6WlwXKadPZcjYqH+PisJy3jr551sqSNjIgVktCon9PhkWhqrFha
	QglUaOMSt1gK+3t0ziVVZZxiUqCv9iS1xfNcppx8pqkzg2wdpfBULWUABKq31iVZhIquGZD7AeN
	7tNqHKfW6Z6ddAu0PwL4/yKI/r0KFfyQlXl/6ZczAQRy99hp7pCkBqWAikFhFYA9oqwavcUamYa
	sOW8VRp51o4CA7WEPUwA3WKFINwhmxFhpjVGrCxCSPvk2Q6afQNtMAEDEa5hprExA6K5qscWwrU
	btXOtaA2vD5jVKpzOZbu0q5c92kc9wW1RmgR1JmbGTMlq4qzZzwUoi4Or562aunD2IxNmRh3B9w
	GIRG0+5jTOohTfllQqDnUuKdwaB+3Fyw1H5oLCuwvXN57FeOHT6uzkA292J3uMnMt8I+0La+1BO
	MBdENNR11k
X-Received: by 2002:a17:906:99c4:b0:c2d:bd87:7fa7 with SMTP id a640c23a62f3a-c419e639f31mr345776866b.24.1792345765950;
        Sun, 18 Oct 2026 10:49:25 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:25 -0700 (PDT)
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
Subject: [PATCH ath-next v5 9/9] wifi: ath11k: budget the tx completion handler
Date: Sun, 18 Oct 2026 19:49:04 +0200
Message-ID: <20261018174904.1757161-10-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104928_028545_DB8421AA 
X-CRM114-Status: GOOD (  12.85  )
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

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.c | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 3e0a6bdfa0505..5775ad4269393 100644
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
index fb6a43dc45b81..13c464dce2943 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -692,7 +692,8 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 		ts->rate_stats = 0;
 }
 
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget)
 {
 	struct ath11k *ar;
 	struct ath11k_dp *dp = &ab->dp;
@@ -702,6 +703,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	unsigned long push = 0;
+	int done = 0;
 	u32 *desc;
 	u32 msdu_id;
 	u8 mac_id, i;
@@ -730,10 +732,13 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
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
@@ -789,6 +794,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
 		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
 					   i % IEEE80211_NUM_ACS);
+
+	return done;
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9303b5ba6e012..b5296cda73e30 100644
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


