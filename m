Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD7606A682
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vey11E6R;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=SIJlBek/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hu5cAuDOA4LBBR161FbhCelECAD3g0ivyco9MA9BR7E=; b=vey11E6RbKrgUE
	40IPjVCoNpxKVCh1wlEm/MQMy1iJnupT7jBGvjq6lUV1R1Oy9VpTVQFdWC86cedvdQAx6tlPhqsjt
	wdBMCC548kbIeCUzIztlULaikJULu6R0KHrh14hDmu54eUh/oLtiCkfn9z2SjGW018xnb2gAponKJ
	X3jR0Ah0O9pS3GymPTMucplS3Aj75sEd3MpQ6YRtXLI/DtL4WhgoJ+eEVS4AWrCRGGTqFr+KGv3U7
	0T21w9xihtDEZK+42pqCaTzo7mkCLl/h9a0w6vlDjsSgk5h1pUorTze1qFGRmWpBKlLlkMRBw/lE8
	M98CWAVefO4EAjc7g96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM86-0000000113Y-001n;
	Sat, 28 Nov 2026 17:22:30 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM80-000000010tX-16S0
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:28 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c516a194350so435491066b.3
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886542; x=1796491342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hu5cAuDOA4LBBR161FbhCelECAD3g0ivyco9MA9BR7E=;
        b=SIJlBek/znLEWwqkU2Rya8F450Kon8j/rHYyK0qIa6fm+04PUeV/kWwwCITpw8NpC0
         Ogu6t0FQksFa+TzVcMoOm86xPJF1qH3EMkFqrYUYbLGf9IYQpCKMtJeMosPann7iOncB
         KyfAVI1azQ/3xSzJD0q1ic629msQCcndbUsTLemBEGGkqPVmx4X/WiqbHkJ8l5kxO51r
         wm/YMG0jOWEgerQRWdQBeVGsvgBHjbBZsAQyJfdYZT3dZ75lEs3D2RlpatRMl3Im6FMf
         7GxfV0G5/LTy3ueBIammlR2vBa52K5+juxnHVBBpZ1AoDvVvUfb6gV6zoe4r0XpxzkP5
         VyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886542; x=1796491342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hu5cAuDOA4LBBR161FbhCelECAD3g0ivyco9MA9BR7E=;
        b=yWQadIWaY/KRzBJukTRTB3dU/Eva8Fw8Ms2kk/cy3yb2NXFLUIkt2TTxci1ez3rgbJ
         XPeCRvQEFpi48IkAwTnngTi0nG1TprYN5GwiABbfDD5S+LkYuMHSSjDqYno2CNnzInHL
         Bq9lfaq3pIvx81x/sdJsB5hnwAWIhPOQlIG2ApRzRsTMM2OoIRzlGF3a3KOyRs6jbvIj
         3B/RghB2iQoiV2acC+5Fh5wO9x84Qwgw29mbsJt8t5C2UezsKFf32W3oGfN/wfI7RFrw
         wEY6LrW2W512iRjj8UEF2idMTCCbqDEVyRd5YwVp/0gSUEgBJTkwmYnf+80tdWpWU9Dw
         gqwA==
X-Forwarded-Encrypted: i=1; AL+hErEIFGyVsUMZsq9CW8JF8wH6H8ZKNYKB+ahKbSg34j1+dZmx7HS7ozTSLgN4u3YHuTfqqe3536s=@lists.infradead.org
X-Gm-Message-State: APuU4Z80mYLDRaX1GPqqwWLxNh2ynK1Mq202zHzJ0Am7VdYTM7S7/9+R
	8JIFg0XnVJvNNFJ7zO2wVbWQ+1ldR298AGu+4ZHuS80SjV2LN2Q4x9XQsq4O7vLRyA==
X-Gm-Gg: AZFdTZcFRC/U+B5nAVWNKYJ7vrxNqagTre5zPMXoPmKyfDFpO70LfN44a0SEj4hXV8v
	jUMp/m4I2EQal8z2Eq/n3zjRvkHGzA6IOtaIHZUj4NFRuMRZDpcqsmiBtieWvzi91IlH7E1ikfZ
	cLi0IftgSvYvrGQbqFMAbTGiV0DLpGMxua+AJlZAXHe2+KrWZxMChcJOeaeeaJxIA8OzCf/Nh4H
	/WK1eHEXoVQRNOnT4fjCMHTMYlhIh8A/xYeySJNUnF40+cqUckbHD41Eo78yAjuI4wecrlmf93C
	TPak1Y0aQ+cXjI7GxMmzp98w2nVdJXYrGHwddK6P8/goeiXVc3Jq1LpykoXPrKKk6y8E1AXqUGt
	UgjJvl/LKRWb/DaiZiV3Egj95AV3LiFKQKlPFiD6XwUtg22AVK3mPpez3hdndVsYZ2uJglGmzHO
	i/UMHnLipYtx7JQwKWhfxU8Ph7KFy6dE8oJT+z1XMNMmgfygVguKDBCUG0aHlgrHeiFQ7j1WOtv
	xonb540Wuzf/4FjbnJVaK8Jah45/5PUYsF2EM84U+X7hihS9aMhJtSIYi+0cc4lamCsJRfo7OfQ
	wJWZomy5MAAIzfV7XH/aHZqR4MNDr5TKSwshGwhgYFRmwkWgBEZIczYBsmgLNfUQeJbSbbSnVYl
	O5KcWqBB9WNNs4zJDc1u+Nj7nLFRXglR1aphIlg9X04UJiHZaYNoMvtkBsE5qFbNfYdLV5uJ4Ya
	VSIKBCLtD6hOZSQouKOLLeq1WDGUEDQK4YVvP1hedkdZFN6+3VyVCxAKZOxeztSL6VSubDard7o
	DWXWTLeGGe+jb90fAWoBEIq6nhnyyRdQEw1TjKZzLc2hivi3NJLxdVcO2dbANpIuE4JYnFaU5lZ
	hZtwR6mkovdJzl5pq0O+bV2O74HYlTo2wjU=
X-Received: by 2002:a17:907:20e4:b0:c40:9b75:84af with SMTP id a640c23a62f3a-c513a5ec7cbmr1741325066b.8.1795886542475;
        Sat, 28 Nov 2026 09:22:22 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:22 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next v2 3/6] wifi: ath11k: drop decapped frames with a source other than the station
Date: Sat, 28 Nov 2026 18:22:17 +0100
Message-ID: <20261128172220.922376-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092226_185392_00D1AD97 
X-CRM114-Status: GOOD (  18.51  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With Ethernet decap (frame_mode=2), ath11k hands mac80211 the Ethernet
source address of a decapped MSDU without comparing it with the address
of the station that sent it. ieee80211_rx_8023() delivers the frame
under that source, and for EAPOL and decrypted group frames
ath11k_dp_rx_h_undecap_eth() writes it into the 802.11 header it
rebuilds. mac80211 compares the source with the station only for the
A-MSDU subframes it deaggregates itself (check_sa in
__ieee80211_rx_h_amsdu()).

On IPQ8074 hw2.0 with firmware WLAN.HK.2.12-01460, the firmware passes
the fourth address of a 4-address data frame through as the Ethernet
source, also from a station the AP has not set up for 4-address use. A
station associated to the AP can therefore turn on 4-address mode on
its own side and send frames under any source address, and a bridge on
the AP learns that address on the Wi-Fi port. An ath10k station sent
200 broadcasts with a forged source this way, and all 200 reached the
AP's bridge.

On an AP vdev, drop an Ethernet II frame from a peer that does not use
four addresses when its source is not the peer's address. Frames of a
4-address station keep their path, as do frames on a station vdev,
whose sources are the hosts behind the access point.
ath11k_dp_rx_h_mpdu() looks the peer up under base_lock already; it now
returns an error for such a frame and both callers free it. ath12k
already hands such 4-address frames to mac80211 as 802.11 frames
(ath12k_dp_rx_h_undecap()), and mac80211 drops them on an AP interface.

Found by an LLM review (Claude) of the code; the trigger above was
then reproduced on hardware.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 58 ++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index a2c359cc8e92..516856c531a9 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2291,13 +2291,47 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
 	return peer;
 }
 
-static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
-				struct sk_buff *msdu,
-				struct hal_rx_desc *rx_desc,
-				struct ieee80211_rx_status *rx_status)
+/*
+ * With Ethernet decap the hardware takes the source address from the frame,
+ * for a four-address frame from address 4, which a station can send although
+ * the access point did not set it up for four addresses, and mac80211's 802.3
+ * path and ath11k_dp_rx_h_undecap_eth() take it as the address of the station.
+ * An access point takes no other source from a station that does not use four
+ * addresses.
+ */
+static bool ath11k_dp_rx_h_eth_sa_valid(struct ath11k_base *ab,
+					struct ath11k_peer *peer,
+					struct hal_rx_desc *rx_desc,
+					struct sk_buff *msdu)
+{
+	struct ath11k_sta *arsta;
+	struct ethhdr *eth;
+
+	lockdep_assert_held(&ab->base_lock);
+
+	if (ath11k_dp_rx_h_msdu_start_decap_type(ab, rx_desc) !=
+	    DP_RX_DECAP_TYPE_ETHERNET2_DIX || !peer->sta)
+		return true;
+
+	arsta = ath11k_sta_to_arsta(peer->sta);
+	if (arsta->arvif->vdev_type != WMI_VDEV_TYPE_AP || arsta->use_4addr_set)
+		return true;
+
+	if (msdu->len < ETH_HLEN)
+		return false;
+
+	eth = (struct ethhdr *)msdu->data;
+	return ether_addr_equal(eth->h_source, peer->addr);
+}
+
+static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
+			       struct sk_buff *msdu,
+			       struct hal_rx_desc *rx_desc,
+			       struct ieee80211_rx_status *rx_status)
 {
 	bool  fill_crypto_hdr;
 	enum hal_encrypt_type enctype;
+	bool sa_valid = true;
 	bool is_decrypted = false;
 	struct ath11k_skb_rxcb *rxcb;
 	struct ieee80211_hdr *hdr;
@@ -2322,11 +2356,16 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			enctype = peer->sec_type_grp;
 		else
 			enctype = peer->sec_type;
+		sa_valid = ath11k_dp_rx_h_eth_sa_valid(ar->ab, peer, rx_desc,
+						       msdu);
 	} else {
 		enctype = ath11k_dp_rx_h_mpdu_start_enctype(ar->ab, rx_desc);
 	}
 	spin_unlock_bh(&ar->ab->base_lock);
 
+	if (!sa_valid)
+		return -EINVAL;
+
 	rx_attention = ath11k_dp_rx_get_attention(ar->ab, rx_desc);
 	err_bitmap = ath11k_dp_rx_h_attn_mpdu_err(rx_attention);
 	if (enctype != HAL_ENCRYPT_TYPE_OPEN && !err_bitmap)
@@ -2360,13 +2399,15 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			       enctype, rx_status, is_decrypted);
 
 	if (!is_decrypted || fill_crypto_hdr)
-		return;
+		return 0;
 
 	if (ath11k_dp_rx_h_msdu_start_decap_type(ar->ab, rx_desc) !=
 	    DP_RX_DECAP_TYPE_ETHERNET2_DIX) {
 		hdr = (void *)msdu->data;
 		hdr->frame_control &= ~__cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 	}
+
+	return 0;
 }
 
 static void ath11k_dp_rx_h_rate(struct ath11k *ar, struct hal_rx_desc *rx_desc,
@@ -2664,7 +2705,9 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	}
 
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
-	ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	ret = ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	if (ret)
+		goto free_out;
 
 	rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
 
@@ -4056,7 +4099,8 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
-	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
+	if (ath11k_dp_rx_h_mpdu(ar, msdu, desc, status))
+		return -EINVAL;
 
 	rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
 
-- 
2.53.0


