Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBBA606A684
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6IRLonC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Pp76rClB;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=l6KBzTMc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=; b=T6IRLonCu3UWp5
	bDmiooN91eWGd67er7AeAwvv1ioDUWH7wDXTXJHIn9l3HDYNrAFJArvlkP9iPa7cLLr/0ITnBgBKj
	C4NrnAPnv4n6IhaklkVisoOH3/DUg+BByauFKL2e46LgtWLQxLb72RMXgyTjbA3gmlcANnGQnWgNb
	GB38mpgFKdFxCtX7g9JKh0sd9089SNzp4bhKUmxrtD1230t2UCZ3galiiaxMSaJ2td4rNgnQBskeT
	3id/0NRh1xvYEK4NjutXxWdkFasWMndZ72zEgnZdehRX7a9cofK/UO3BHLIhPB8XJoXk8LXIH/Zvu
	FreCcQF3YHN8iXZA0Gvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC3D-00000001UzA-0Ea8;
	Sun, 22 Nov 2026 18:12:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC35-00000001UqJ-1qQ7
	for ath11k@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=; b=Pp76rClBNt6uPUbOhwkYA8yN71
	0pzDYy22GRPu5f7FHpokEsvycYbqbyg76mCyEk9lxIg6FXoAFlfrMCWLFPnNgRhsB0bXELVxqAIvz
	cZqsYMRNpGdlxPiXatUatEs5caXjrJ+JUV1yJ9sGQR+OVGDrb6WXu6j6I12nCI81w+AltCSC5M3jM
	zLI6SBoRS07k+fFqSa9uKJvu/6CigfMRe1Pi+uP1FSCLCs2Eh95kqbqzmrJE2oB/L7WXZMqK42UfI
	vXTITkQ5ITvlDmZINUJnflg0/N8f0JCSUE/01MxqsQL/PdPR8X72/X8z21L+9pcaB6sf7s2tZr26d
	9B07S5Xw==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC32-00000002Pht-2UFc
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:12:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso3565483a12.3
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371139; x=1795975939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=;
        b=l6KBzTMcp7g9fxNxmgMWe9APJFuxMytBEvoB+fEsyL2bIZM8IkSCKnagndlI8EiERZ
         tGf7ANNmrGd58AfT4eGeTkqsgkRKY0h36ygz5RWzx4xnqKmqzOqO+VT8BQGcSq0COML/
         3h4wtz6zS/49t/AXWoUlbMvuF2FadvgTPykLtxwwCAqzHD74lZRmbO3lKRv39yEq5Gj3
         SNZ16ePYQj2Wx+ztmXH8jzLNusoUmE5iVtwN5dykwzqOOxZ6DMpxyRM+TAeKjInokq7v
         GZDIoE3AW7NVm4dGDD1NujeHuunQoAdBk6eW2nnoiT6XXEdLPoq2JECsuttNCDQShtVA
         QYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371139; x=1795975939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=;
        b=aBVcvsiR5pbv0pPjzvNfoTX9E+ZWDKoMY+4nHNCtJtrrbkEgxVLAXSv9ZQvTcJqquH
         IcnFFMyogjv53eozixEJS5fExijl5PDPn4HtbFaOA5fM47jtztlsFmQUjN8yvBw9yGv7
         FhTpyA1ERuu+ErkRtkatPmlMBVQTFNSFaDeFQbZrQzOlChA3AyimnVuF/hKzH/2o1cPO
         jKtfXE7jWzRtPdj9jhF8Ctt52idPw9BspPqftNGQzhrUCaL1fC8fD4r5IgLgJO7SAn7W
         Olezw4byd1PrKS6DR7msGrgYVQURF2oxJxlRNAAmfZ2ilwpM4PZrOuTdXfehjuRlNqnU
         OitQ==
X-Gm-Message-State: APuU4Z+qm1xvnYLmryNZ4ZMXm0jNi1PjlOO3NwI/kBZCGhlvoHP3nZvV
	StMJvGWy22v/QtRb9/OgFLnmWF9iILe6EyLH8OnO7bZqxykF1VkMRegDf1aHZEPCyQ==
X-Gm-Gg: AZFdTZcvpkmVXhAaFSv/5RGvC2fgJb7rXFbQeh6PX7pEiHDr4RSruifzi+4mh+Yr8op
	8gWnx5dLcoFrLvYuSKvP0MxM7QOZHCl8CxDarPSdpfex3EChwVH3+EGVQwHRzvjCV99y7Is3Y9Z
	cIQwVGlRlIWGgRKNZ+gLmjvvyuZRd3VHXr4L2ALLIspUgBHNBufhDesrBFAYeSIUBi0K/8tJIpx
	M4a1lYaIirmCJmKKEAfDk/Y7/YvXhFj58nyVKK4ATnSS11K8gR79fysBoBzeEJnUFS3xc9xCCGB
	iZyCzy9MiQAH718Fp5/hlT6R0MunaE79f9rLZqrjnmSFFckO/cUd6DUtbXyOA+lKfJVXWLfgTtZ
	rEvaMx/LSXb7L2NEWYuft6CgtPQ8A2guePKsP+oqSe5FH47ujuoN3S6gEgp+tbK65q2FG3i9Isc
	ha8J8fMPvEcGfxVRsSULuvRg5dYDUVpj2o9FeXyb+esdexmB+pTtSr9wvoHgZjat+PBgRPgS2k/
	cZu9gEArFDr3SFHMJ6ur6QZrtD1gKl6DjVMOhtCyv35xRZR2d/ml0zbU4PIVXyuycIlUOr82Gj/
	9wehDD0x095iyNIJxFo4jiQt88C4ZGEEN1/Lf+rRl8ijfmlqGVMF1kDEXF5hwtXsWwMcrxrZLlq
	5bdgZJWvPsY0J10YmVmN90kNKjvG+B6ALoKou/9XiorQ7sdf716Ym342JueGfDu33/FsBkra5GO
	SFfh0OM+MfOT9FzYp4BrK68ztSUdYQ7cg1pzuqVIiZf1sEeG3V2SRx5utZ86E7OxwHFgiYpzUhr
	arNEwE3gtRR00SUPp22TWbhqT1iOFPnB8f/LQgxOy8/ujQbNVvCLBHH2ma5rmKUiBgk4bM04WPz
	frQC6gXwgFEY+M+B3vFuzVrrdZyYuZNi40jWKZIJUch3bSYJPnU87wzW5vUYtcBt9sBAZNIh
X-Received: by 2002:a05:6402:569a:b0:6b7:5712:b6c1 with SMTP id 4fb4d7f45d1cf-6ba37ac6db2mr4318502a12.0.1795371138807;
        Sun, 22 Nov 2026 10:12:18 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:17 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 3/9] wifi: ath11k: push TXQs from BH work
Date: Sun, 22 Nov 2026 19:12:07 +0100
Message-ID: <20261122181213.1016590-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_181220_501558_C0F09C6C 
X-CRM114-Status: GOOD (  14.23  )
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

Each frame that the network stack queues from a receive poll wakes its
TXQ on its own, and the wake ran a scheduling round at once, so a round
handed the hardware a single frame and paid for the ring access, the
locks and the scheduler per frame. Record the woken access categories
and run their rounds from BH work, which runs after the poll and takes
every frame it queued in one round.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  3 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 24 +++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 8b7bfb0cefcf..74fbff296b60 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -715,6 +715,9 @@ struct ath11k {
 	spinlock_t txq_lock[IEEE80211_NUM_ACS];
 	/* access categories whose round ended for lack of room */
 	unsigned long txq_starved;
+	/* access categories woken since txq_work last ran */
+	unsigned long txq_woken;
+	struct work_struct txq_work;
 
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 090df2f1cadf..0af4f2fe27bb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6791,6 +6791,7 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->channel_update_work);
 	cancel_work_sync(&ar->regd_update_work);
 	cancel_work_sync(&ar->ab->update_11d_work);
+	cancel_work_sync(&ar->txq_work);
 
 	if (ar->state_11d == ATH11K_11D_PREPARING) {
 		ar->state_11d = ATH11K_11D_IDLE;
@@ -10211,10 +10212,30 @@ static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
 	spin_unlock_bh(&ar->txq_lock[ac]);
 }
 
+/*
+ * A frame queued from a receive poll wakes its TXQ on its own, so pushing
+ * from the wake would hand the hardware one frame per round. The rounds run
+ * from BH work instead, after the poll, and take every frame it queued.
+ */
+static void ath11k_mac_txq_work(struct work_struct *work)
+{
+	struct ath11k *ar = container_of(work, struct ath11k, txq_work);
+	unsigned long woken = xchg(&ar->txq_woken, 0);
+	u8 ac;
+
+	rcu_read_lock();
+	for_each_set_bit(ac, &woken, IEEE80211_NUM_ACS)
+		ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 					struct ieee80211_txq *txq)
 {
-	ath11k_mac_schedule_txq(hw->priv, txq->ac);
+	struct ath11k *ar = hw->priv;
+
+	set_bit(txq->ac, &ar->txq_woken);
+	queue_work(system_bh_wq, &ar->txq_work);
 }
 
 void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
@@ -10953,6 +10974,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		for (j = 0; j < IEEE80211_NUM_ACS; j++)
 			spin_lock_init(&ar->txq_lock[j]);
+		INIT_WORK(&ar->txq_work, ath11k_mac_txq_work);
 		INIT_LIST_HEAD(&ar->arvifs);
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
-- 
2.53.0


