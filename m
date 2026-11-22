Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C1B606A33A
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YO3Aug5B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=QfO9XiGF;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=sEgaF25v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TXtQuQYdk/h+VPS19Qx8ZxnBKtguIQfQlp5+pm4QqHk=; b=YO3Aug5BjQhREJ
	i6rmEbFJTF//6zd0BylxLHRuI7ujWeNeBqm6MMWWYRXUNcNz12Wr2UHAaLyP9f/ZdyLvbFBSbMQew
	hrL0hf2TN04Mj+8/q+UTzlFvc2f7r2AtPp0gT5eK/RDkVztQJfDnLallSXskRkf4B8cxrl+94VMbY
	AoyjcjDca4Sj4pbwsJxA8gYJ3h+4RoQoXXbcdlRsSQ9pSvaJnYdlHm/gopj0oaFWT/A8GuI8//J/Z
	bOGUq8vkB/8WsEmFQMvMHNG5j4ChpfzuZdQinmzs+8FhMLQOISPAi4BJPm9TuEwXhgvbUZLOjh9n7
	BCOu4rlP90ugU+52jc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC34-00000001UpA-0fD7;
	Sun, 22 Nov 2026 18:12:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC32-00000001Ums-3Gd4
	for ath11k@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TXtQuQYdk/h+VPS19Qx8ZxnBKtguIQfQlp5+pm4QqHk=; b=QfO9XiGFb6h+0p7UwgjA45UI29
	VrD6Vm78X/vsTkiUGOEnO/M5p2/6UIc31X16ci+qoU40gzPH315Re+ufpwMgAaKF1xnzx/oakgkLi
	fjwpm5sEmL0oqR//E9Sg6TqBmKZlT1pE9No1QuHadqjVD/0AcU913yTirgQD9vDa3iGnNQUUcp84o
	0mwfosQKqqGPhBKrH+LSIuvaVAbRggGDoIVK60KCvDOtpxLnssBj8P+l0M5Hzshy+9RQcePMEYC4G
	5dZDXXfZCl/nBzdFdGNfb5l57KebaFwoxw22I+RMVf3T57W/NhwG09YKwrup3gzGxJ6DhIm874fIL
	blhUNfvQ==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2y-00000002PgK-47vo
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:12:19 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so2866025a12.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371135; x=1795975935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXtQuQYdk/h+VPS19Qx8ZxnBKtguIQfQlp5+pm4QqHk=;
        b=sEgaF25vkVyg+3Y8MOO0iBhcXjDReG6hbNbxeV7moy+geyjbCxENNz9dyrWGfvB7WY
         w4HDDubiFAB2IfE5HFecOg5rZ2Zysu5jXNUEQaGhcUbek4sWjgPvzPhIjoGU/a64MtsK
         +9uAN7hZx3cK7oAUIwx0n45K/KYQXFO6MCZuZxxwFXwuJR+D5MYWa7xqps5ucEcb/xNa
         8fcDQY/YxnkEEhIgdXXgA3pKlB/l/kALNkO7DXjKF+FzdRxTM/M5iBC7wnQAs0agWmiX
         bu14TqAoAujPzizyIgyRO0h68X8wm28+wM0Ovgcxg2T5qmmrJQ+pGPhRYMoY2Kjbsm50
         rSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371135; x=1795975935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXtQuQYdk/h+VPS19Qx8ZxnBKtguIQfQlp5+pm4QqHk=;
        b=RTLPmbcJdYqPHs9I8ePSnMf5q03anmFDTM/l+H1RVywBFIshz3zO/sStrWvZGZIZiY
         zmEbrd14XMhPUUxdge8H4k217mPR00nnaQMi8wiHC2VlLXjtxZm7yutyaplbrhjcTahX
         tzpzVXcZJhhfIM01NM3cplVwFmZCuzai8itvZksBJS/XlsUEJB3M7VSbIQIWXA7V+hct
         bKidMGmfGFDGc+W8VTwWuWzODdX8e1Xub08qFotCW6pZzF1ZPDJHW0iOJWUnfC7+K5w1
         f3Tf7O0kGPCMp/v9GzieQrCA/ZKK7g48bloLA6JF3ZooynI2auTToztIPYV5fRmCijWO
         rXWQ==
X-Gm-Message-State: APuU4Z9XFiSyUqmjsSvs7A9jABg89zsdmq+ydiQKr83Kpxu1oRaTGRHl
	aE5F6Ppi1i2V9t9TjUp/RJ7VMX9j1uFoqUEc5Alhc4/TAqebXrwqNXk1c8t794Ieuw==
X-Gm-Gg: AZFdTZcJpia8BjWfH9y1Vu1EhblDtSrueS5UOgoxPmObVpTM3pLLB0Pr+uBfZAENGVZ
	n7L7bFnU7ZsmbQUdHsOxOPwPQoPeUcYqu0uKXD8wFF8QXMsqvhCrIJRmIE5gpmTdxuHIAcEprLo
	go1Mj3DIGLyLXhv5eyDSftWV0IIO1rQR1UfVTGvQl9TrjxSz9LM9NRC/LRgQLT9P9lud4bblUQU
	D20N9zYkH3oM22nv5uVcikM2vooVG7x55BK2hCJ+xj8WkQbp/x6atb1iMEFGK0MCX1Oe6YpUi68
	ef1Gj6amOBU0Ld5UxVniMFxK4o+QjYwl/KZql2qo5ql1wJaWyo2HXKlxtC8lG0Pm+dJc15uKIBe
	tMp5umiPEsrSDUKGUc3DRzpOzjX3G1D9tBv2JUxRGQ3AqoJM4hn3sp7g8jO8m28eIRMP9dV9wld
	+XGVbHCF2tGZZsrdRSA26WCVvCx0lrKtXWbSUPmL2oC/699LYnHn64n8JfDQEgu+TUgtlgEIWmw
	7Y6w3pYp2aTjrk7AdJeclrbNWFlSuLhgBlLYbqtEMM9x1H/2w+UwYEd0Iez1uNWp+iq5FM4KTrw
	bMOFRfm1Wv2kMPC0q+GAZxAoZXwbwGpCVptqB1HwF6ofDWMCeBqz7PXYj9MvJ970vguSiB9DjBZ
	CfLUx5D2qVN1xOsmTORnyt8/1RbuCFtMtk6hILHjQGwwvXumZzNzN3NEZnWktlxHqgqRoBOJv9i
	A1RkF6UATHKg316fkHt7a4zw7Ta4GbgqPzmQvwRTbXzdkrDai4WZdiRRbVbnxFX5CPfYcTgS2TR
	HKy3CCNS0sEELTbbbHQFzqzaPRErJDdkILT9uKG+a4AxTnlegZWPovVqV3OiOF1O/nDvlRKXsps
	27JalsMuwjqq5pyl8rZQoBFFieElBpsWEJ50KlGPe5ky67xdsklrsyvqFj9CM+aANN1MZ/kj
X-Received: by 2002:aa7:d592:0:b0:6b6:efc4:9eb2 with SMTP id 4fb4d7f45d1cf-6ba37acf02amr4637287a12.0.1795371135166;
        Sun, 22 Nov 2026 10:12:15 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:14 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 1/9] wifi: ath11k: batch TX completion frees and peer lookups
Date: Sun, 22 Nov 2026 19:12:05 +0100
Message-ID: <20261122181213.1016590-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_181216_916172_337A318B 
X-CRM114-Status: GOOD (  14.78  )
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

The TX completion handler takes base_lock and searches the peer list for
every frame, although consecutive completions mostly belong to one peer,
and it frees each buffer on its own. Carry the peer's station and TX rate
across one completion run and look them up again only when the peer ID
changes. Collect the completed buffers on the status free list and free
them with napi_consume_skb() at the end of the run.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 49 ++++++++++++++++++-------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 5c3ddc8aad41..4f509771d60a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -629,9 +629,21 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts)
 	spin_unlock_bh(&ab->base_lock);
 }
 
+/*
+ * State carried across one completion run: consecutive frames mostly belong
+ * to one peer, and the statuses hand their buffers back to be freed in bulk.
+ */
+struct ath11k_dp_tx_compl {
+	struct list_head free;
+	struct ieee80211_sta *sta;
+	struct rate_info rate;
+	u16 peer_id;
+};
+
 static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 				       struct sk_buff *msdu,
-				       struct hal_tx_status *ts)
+				       struct hal_tx_status *ts,
+				       struct ath11k_dp_tx_compl *c)
 {
 	struct ieee80211_tx_status status = {};
 	struct ieee80211_rate_status status_rate = {};
@@ -639,8 +651,6 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 	struct ieee80211_tx_info *info;
 	struct ath11k_skb_cb *skb_cb;
 	struct ath11k_peer *peer;
-	struct ath11k_sta *arsta;
-	struct rate_info rate;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -707,30 +717,34 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
 		ath11k_dp_tx_cache_peer_stats(ar, msdu, ts);
 	}
 
-	spin_lock_bh(&ab->base_lock);
-	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
-	if (!peer || !peer->sta) {
+	if (!c->sta || c->peer_id != ts->peer_id) {
+		spin_lock_bh(&ab->base_lock);
+		peer = ath11k_peer_find_by_id(ab, ts->peer_id);
+		c->sta = peer ? peer->sta : NULL;
+		c->peer_id = ts->peer_id;
+		if (c->sta)
+			c->rate = ath11k_sta_to_arsta(c->sta)->last_txrate;
+		spin_unlock_bh(&ab->base_lock);
+	}
+
+	if (!c->sta) {
 		ath11k_dbg(ab, ATH11K_DBG_DATA,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			    ts->peer_id);
-		spin_unlock_bh(&ab->base_lock);
 		ieee80211_free_txskb(ar->hw, msdu);
 		return;
 	}
-	arsta = ath11k_sta_to_arsta(peer->sta);
-	status.sta = peer->sta;
+	status.sta = c->sta;
 	status.skb = msdu;
 	status.info = info;
-	rate = arsta->last_txrate;
+	status.free_list = &c->free;
 
-	status_rate.rate_idx = rate;
+	status_rate.rate_idx = c->rate;
 	status_rate.try_count = 1;
 
 	status.rates = &status_rate;
 	status.n_rates = 1;
 
-	spin_unlock_bh(&ab->base_lock);
-
 	ieee80211_tx_status_ext(ar->hw, &status);
 }
 
@@ -775,6 +789,8 @@ int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 	struct sk_buff *msdu;
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
+	struct ath11k_dp_tx_compl c = { .free = LIST_HEAD_INIT(c.free) };
+	struct sk_buff *tmp;
 	unsigned long push = 0;
 	int done = 0;
 	u32 *desc;
@@ -848,7 +864,12 @@ int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
-		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
+		ath11k_dp_tx_complete_msdu(ar, msdu, &ts, &c);
+	}
+
+	list_for_each_entry_safe(msdu, tmp, &c.free, list) {
+		skb_list_del_init(msdu);
+		napi_consume_skb(msdu, budget);
 	}
 
 	/* A completion returns the airtime the frame was charged, which is
-- 
2.53.0


