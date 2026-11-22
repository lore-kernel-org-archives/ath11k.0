Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1A60A381B
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4TOtP93;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=iiTLnm9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=; b=P4TOtP93jFfeSA
	z1QvJFfscTM6Jeu4Nphh4PRoGof/9zOa3OPdMs26E0+UphD+/hP7M99BncXjsD4FhWSyqZT0t7vJO
	MNVQZH1CSsCJsWPcygd6CLnbv37Jp2rtBcXwNXm/MIrEYyp8nN0M64c0g0nqBMXHR7JIX1fXbXCR2
	YgATN03KRL2QyvjMT7bqfSAydO9/32nK/vYLuxh/J5rthhjkN9Y2+7wjFllaGA3ZIhZc6VtAlY72H
	43FoSh0gosiqsAb+ks6qIrVj/hCO1oq7E6IplfS8yO+uykj4lADTMu/WGBPMQcAxKOj9O/XHq+p5u
	Fy9AclDZo85J0sRxGHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2a-00000001UFC-0HDc;
	Sun, 22 Nov 2026 18:11:52 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2V-00000001UCI-1aVg
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:50 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c516a1623d0so95010866b.2
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371105; x=1795975905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=;
        b=iiTLnm9DJpsDagSq7b+xq72CcOB/H+6xKAj6RdqSIsfBHQ5pT/+KGFdwGbLQw9JvNU
         /KxMIQr0GM2KeZk602fU7kB0EfWag1acyIlJKpHjgQdBZ6HS2+0AFwlMFMSeIN3+Yb2I
         7pFdN28+Jxib7iKEWHv9rGzzGryj1TsOu26lzAbakZyC1rq/qS+LxipB4yM6uN6PdlKS
         njenTkgSnIi35xMC5C0/GMVM+2XxAV/Z451Q69YD5i/Ak/frzMZJFG+7FQr7VexNtjGW
         j3XXon8VaHyc20NRSUMQhwgFT1Z6F+FEUOyEO3vmdRoviR7Et2NzB7Zg22o3Ua3kKisf
         R59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371105; x=1795975905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VbRn6lUIefHO9idsi1h3mMXbFeQtqB3zWbpoKodoBns=;
        b=XzLVX5Mw3kVEa/DALvrRiBWFE3sQFKLX/GDgvO8etPrrL9zWXdjKt23q1fp4aPg5Zg
         yEoKa2HoWozJrf29j84TMizyZ+A5upvXdBvShxSUaGx+wRBczrOvEDIiUpuDDsIdf4DG
         rb38MaoJfm8iQ8+SaYMqgFq3jMYdRm+JejnVVhBHCa/eXnY5LL2HIT69WNCg/QTvqIKR
         s5tGbTiqq1lXhEqdgrr986QUw7+0D9Y3DqWl6pfPcjCHa1cwsu6KTgK6EY72ggX8y4YT
         +l6FmhKSxa++DOp+35HEurgmOY0dHBg4REhY4pNeuGvCiZgDS4JAa7RwXl0R48Wl3Ppj
         37+g==
X-Forwarded-Encrypted: i=1; AL+hErHWtSrQDLkgKusj/9kduTRK6Y26nHhln3mlOb6LYYXabY200kIu31HXKjfxnSAZyNSzeJQ29XA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9G4MypVmItuCvjoyoyybWIpu/dSzkFE+gwxJMkYov4hJEUNnTo
	Cqa/5Q9qFzDP/LKcDY1fr5KKOPi6JHoxKJ9xafJcdrdJ1e0B4KZWmcu+ixdOLBxOSQ==
X-Gm-Gg: AZFdTZep5K3DQ9LCs/k1x93nusV3K27R1mEsCe8z6EFl/Ah9ku/UUtA32JnVTP7rFOn
	NMM1TjKtwoqcp/4B26SmlGYPSxf+Dn2fZcH5YzR2mzqZ6u2VlHLkNBOnKpehJTJxqw0SUTYxre4
	RtYISOro0/K1LQvxzTjtfMIiYWcXcBaT+ijZuI1K7SCW5lOsSSH5ciu6H6+DJBzb0aahKcmPPYs
	D8TKKiDQSjf9bETvG5mC4S5ro1fza2b3Sk6A85z7wfoUmw2URmQP2ygjWV+RFTT6F3QTejnZIOx
	KwvfxhPrAT2MEeLhrKIJ43TN9lEhYCRVl6B4Y+x5WallPOWu9cAlf5tAETEAb/28d18dnAhuabP
	lZcfnDAjjSA2y3RZzPa1yG0LYTZtW46n86otwiTXT2uiDuVVFdoPIn/bN35XXuMgLWfC+4oC0nH
	ckUoeiQYwBA4LTY6adPy8SkJjl6/Ey2iDKjk7djZ8TUjhUTu/qKuXSnSAxytxORU+xuAX1R3IbV
	uzbq8V/1/yNKkxkGJqsojYY/3DB5h0NKW6MhdXsvwOOYvMQpwAQh602yDm0N/Kvvlg/I7+dS1Vn
	LfYCqQbS1QdbXzWj+E2k9zBtyiSjiOB/p4XqaovtSXHj9wRxrL1RSMZziYGGt4w98/hPpJ61g9g
	XdrFzyGxjNT0IaCF9+B3QehhoPKHnp7pbHk4f3bjxBUmQdIUo4mlOKIvB2oj3drnoJ5oYYGJG0G
	g8O67mzzqSC7iMr7RR+rI0E7brodc2VJuNwA3VbykXAluC77nj3lP11nNYr0nraQens14kcIoVE
	VF7nx+cmG/SRCZj68zRB/eooyE4NetIhJ1qE9H5+MYq9SXoJwdwujK1m7ro31XBWM+Z+eYns/Zc
	Seaoz6cnbQUGUCFAvA0BT0G18/L/HAU6RnxGnaEhesX0GX2RPVMzi/vZnK1ZytViL3a6cM0/
X-Received: by 2002:a17:906:f9cb:b0:c50:576f:b3a8 with SMTP id a640c23a62f3a-c513aaff1e8mr650474766b.48.1795371105507;
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:45 -0800 (PST)
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
Subject: [PATCH ath-next v6 2/9] wifi: ath11k: enable airtime queue limits
Date: Sun, 22 Nov 2026 19:11:38 +0100
Message-ID: <20261122181145.1015729-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181145.1015729-1-julius@bairaktaris.de>
References: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101147_432310_50959AFC 
X-CRM114-Status: GOOD (  10.66  )
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

Without NL80211_EXT_FEATURE_AQL, mac80211 applies no airtime queue limit,
and a saturated download moves every queued frame into the hardware TX
rings. Set the bit. mac80211 estimates each frame's airtime from the
rate ath11k reports through ieee80211_tx_status_ext(), and charges its
4 us floor while that rate is unset. Only the PPDU stats set it, so
single pdev chips, which take the rate from the tx completion instead,
would stay at the floor; set it there as well.

With the series and the AP pinned to VHT MCS 0, a TCP download to one
1x1 VHT80 station keeps 22 Mbit/s while the sender's mean RTT falls from
526-587 ms to 42-44 ms (three interleaved runs per arm, default limits).

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 6 ++++++
 drivers/net/wireless/ath/ath11k/mac.c   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 0e3b4e836001f..081e79d3759c5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -578,6 +578,12 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts)
 			ath11k_mac_he_ru_tones_to_nl80211_he_ru_alloc(ru_tones);
 	}
 
+	/* Single pdev chips have no other source for the rate reported to
+	 * mac80211, which estimates airtime from it.
+	 */
+	if (ab->hw_params.single_pdev_only)
+		arsta->last_txrate = arsta->txrate;
+
 	if (ath11k_debugfs_is_extd_tx_stats_enabled(ar))
 		ath11k_debugfs_sta_add_tx_stats(arsta, peer_stats, rate_idx);
 
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 90a0404a101a1..6f4462b7d3f15 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10652,6 +10652,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
+	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0


