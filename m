Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE049606A32C
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CdC3FxCY;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ScOgfNoV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=; b=CdC3FxCYi8sm1D
	0kBYKIGBXSt8vDTkZsTqItYf0LvmMnJ3iXITBeM9lYdVRMPgAHwaZE1uKWFAUmweIyzjZsAm/JnsO
	3Rf8SWOU2wn4YoB+ttTyKQceaQBWs2ELuSnEUtOVn+zRw/eQwUlFD3GyDcy6NlKxljt9AV6d4eMMG
	Q/jTbPNccUTr8yBh/iHg72Eb+sz2wL1VLPyuPC0hZbpz4fplow4U8vNjHoHFxshtWUytiOsII3Gzd
	mtDafTfyy3N46dHTXJ2sKba8c/iCTkAxg87a/d4+/85FNerRabDInoEN4rG3TMx8eAEm1kou6xHB8
	vvwJJpjNPoy+ZtX8TNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2c-00000001UJx-2bXh;
	Sun, 22 Nov 2026 18:11:54 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2Z-00000001UDx-1YEm
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:52 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c40e30c26a4so776214366b.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371109; x=1795975909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=;
        b=ScOgfNoVXxZTETwbRKTkCVnFqB1E45AL0M//xmu2WcU8sMuTLW+zvz50cbyA+Wsguu
         oT6hqdbiA9IMXOGFEtB9PgglE9epnDqfgYzeusYntcvnXHQ9nHzGB8k0kDcPNt4Cihs2
         qnIPQc0liPgLLGZbP5y13s9dnRI1YjWGmKokDGWcLLfJNG/l0WWjDLWziFtZQ7tkAenF
         nfoOkLx9W9YfgrZC4C/zyR8DSYlCZtsMBdgUguEpLrc4mzE3mZcnF41scyGhrdfPm854
         tcG9uV8qlwAweZt9S8BzgA29QhBOUN6LnE+ubVVZZFXNe9IGQwIEbkHLTOtzL6ThV/jL
         lfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371109; x=1795975909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KP7khDe++7fc98wXYbOy2kUEZEGprttgeO7wiuURcgo=;
        b=XPcuARZyh+SQcD72l8HeXx4gxUP+Qs4KeC+8RyNn3PIJXbX9E54On9ndq6P1DI+/Cn
         EhcJMmr2kb/ea8RYwCWD7ljVd2YRaAGlRiWCl+7PcZGsiSaJQyonI8WunLeTsXCvGFHX
         hWx/2GYSlzdOSdeuKwa0QgpPH25Yajf20ANB5ZXgvjMlINxhifBZjOlHVyjqC+kgyCuH
         +FvfekUz77vUJ04gRlqYyVNCjyWxHn/+s8fK41dgahnz98Pk2WVajCwK4w6sIBbRoPKG
         9OG5431DBlJcdSzfs63CNQjKwW2+OOYeA940f+KiEzC5Jqnq+D86bNDJrU7kFKDwfRR4
         m8Ig==
X-Forwarded-Encrypted: i=1; AL+hErGyhs3jIttq5u2BMSDeDoJjnosfRTA/++8Rx1iF5QTxA9UzfpZ6PzjQpOUazqTM6Cn9A56xzMk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8ky0kwslEcGFtsRg5GM4WuS9dTK0K0Qui7kgnIu11qIBwuZXeE
	4ovV85Dgq2uWDFdGZulzW9yMbr0tCxY/NjBqau0moeoXITAgUXImlfNVz1FKjFlK0g==
X-Gm-Gg: AZFdTZebxZHhU83DcKVwVi3pIynRl7JDFD8nUyzakqFNLzFCM+drNlMIXNQ41LRq7bH
	qUoEp5amV70h0u9m6SlxYT0ikc7VV9dS0ePNPH0mMX5SGOoq1tyMRSzKG7Nv43vjlt7xRn9Nfy7
	uww8JC6ZY0jclEFVVEmw18Az55qdNJEKq8bMQQtkq7tXTGS1nGoqX4qKV93MuFErt6A/c+S9SUF
	bxdsGQDLfYgEs9kuZHxCj8nbiGe+mpfDp5F6Vk3SnCFK/7u4KGp8R7UCrmifVt+TGhBm0QjtFo0
	aDwld3pwYyzhdkp/5p4qVOhNDY8BHUUEH0ZdzI672QqxzvBcVwKo0g2CPX3RstiX6ygNlCBLvX/
	zcBuV8ImjRpgI6BGli/R2nSOYR3WglXGhAv2GdO08HP8yPdZtOr8t/2zlo/LRCYzt8NjlHp+Iek
	CfHhXek3GH/qi/OrlAxtVyesVO91PGU73W1kjvr+CETyLw6T15NKkLAegiRtsG5K++sdwbVAbi9
	8yGMv6WBTWVpIrYys4oZZqXFRf8JbVxT8ARolQvnmAIolRHoFQSS71sTnmUez7MfYrlQAmRzN5r
	hpaweyIXtcn1ikXuajONPTVKay8hEiv/z3kfo9RMfaIgpPL4tHxN7nAzd1xPEp1X2DqPI7es1+g
	iGjgy5rBteJO3V8rKBsHtizHmxlb4xXbL0POkoj4HRhiM4QjJrwVoO0KHoZeMBKE2ZmQKzZ6EPp
	9/ub9jKAnOaasrWIELqqMjANiCthR+y08nD4WR4So7q5NVikdMy0DPDghGbRGCJjJp2pia2tcIf
	B3UrZnOeowpMTgl8beLKLVyfQJOtZoJxrHkHMlKd84k5Zp7EDp1xox6FW3Xxb/whbLhXQGGClYU
	lCXV5rIK1ddMk5wMu+JVDZSKHYvFWqd6qsU8VFFPYmQaoZ+91Dd6CBEykzTylmff1HIaH46E
X-Received: by 2002:a17:906:a1d4:b0:c4d:31be:1f27 with SMTP id a640c23a62f3a-c513a80de57mr563735166b.9.1795371109556;
        Sun, 22 Nov 2026 10:11:49 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:49 -0800 (PST)
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
Subject: [PATCH ath-next v6 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Sun, 22 Nov 2026 19:11:43 +0100
Message-ID: <20261122181145.1015729-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101151_438642_6C9284E8 
X-CRM114-Status: GOOD (  12.20  )
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

mac80211 charges received airtime to the same deficit, as AIRTIME_USE_RX
is set by default, but ath11k reports none. Register each received
PPDU's duration, which ath11k already adds to rx_duration, once against
the PPDU's first TID, or BE when it names none. The TID comes from the
PPDU end user stats TLV, which is added to the default monitor status
filter. The call runs under ab->base_lock, as on the transmit side:
ath11k_mac_op_sta_state() drops the station from its peer under that
lock, and mac80211 frees it after that without an RCU grace period.

A station uploading with DSCP CS5 moved its VI deficit in 3 of 3 runs;
uploads marked BE left it unchanged in 3 of 3.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 11 +++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 777c56e416aed..1e4080caaa80d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5280,6 +5280,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	int num_buffs_reaped = 0;
+	u8 tid;
 	u32 rx_buf_sz;
 	u16 log_type;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&ar->dp.mon_data;
@@ -5347,6 +5348,16 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
 
+		/* Charged once per PPDU with the measured duration, as on
+		 * the transmit side, to the first TID of the PPDU; BE when
+		 * it names none. mac80211 frees the station without a grace
+		 * period after the peer drops it under base_lock.
+		 */
+		tid = ppdu_info->tid < IEEE80211_NUM_TIDS ? ppdu_info->tid : 0;
+		if (ppdu_info->rx_duration)
+			ieee80211_sta_register_airtime(peer->sta, tid, 0,
+						       ppdu_info->rx_duration);
+
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4527ab6977d04..d17f80cbcdb5d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -229,6 +229,7 @@ ath11k_phymodes[NUM_NL80211_BANDS][ATH11K_CHAN_WIDTH_NUM] = {
 const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default = {
 	.rx_filter = HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
 	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
 	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
-- 
2.53.0


