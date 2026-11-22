Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5E2606A31D
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GPptqy1X;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=GwXCTBe3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=; b=GPptqy1XtzffGP
	jHKc8oKjNyend7xbnR8rhKZD3HBwI7Wkdfz9h6IY/+IYVcNv1L/MCsmhQ3pZAP+tLJhHDZpbPhHuB
	ZbQ6qChO61IKj0H3iRPjKB8AmgaHlKb/4SIRt2SVPG6pyG35/wrbzCBCp+gIl5OWC57WG6C5wzm7j
	GO90qXVPFTCqd0xuP/EA6Z2GiZsdCneeptB+awreB9b9n7kJ+TuAq1CD0nehT14TeA3bMgCJ1rRoq
	+dub+uMVRoMQB2HnwTfGtgP4XR/+dBVlWBhE7Aw2i0m/19Y3gU5k2tDKkUgGdiCCCYAn71y9uDmwF
	p+WKqXtANxUvY6sjYXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkf-00000001kp4-2SFM;
	Sun, 22 Nov 2026 21:05:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkc-00000001kiB-1eVm
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c5118deebcfso379330266b.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381528; x=1795986328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=;
        b=GwXCTBe3xPSgCQ+gJasMl6SqgZpc3NQ2JVBBiCG67v8eO2kG7Uk4r/DiauW5Igcy7x
         pUfVURVb2S9tWpCvx4ndQS6OXWtIQMJuCHFe92Zw3L9OQi3BxaILRdCDn+L2kxuljW4O
         gl/0r7cdlC4kliTEGNKPh/6/EhFSyvOA8ENw2GS8QrXJDZmKJifGPh4OeoU1m6FXYog+
         pblgbIAd2HuNax1ifO+xEossCyNyTjyfT8b18csIkEddUVhnsmdZCsOpLCl8ICv6IyHM
         U5wW1hM8zBVB4MuX8SXgVGHvVG9TY7q+awgoHZ2qXrg0mW3AsaArLseOzG4dSE1xN7Pm
         BrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381528; x=1795986328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iY7hP57Ks22ZQX6VPKHgfCkwRw7bMvU+dJUsFxLR+Wk=;
        b=R54e7tCr6PjTCBIQEqDL3wtaVnmCCT642A4LT6SpC7shICZ+6s/fPQM6rvJQTGeHVe
         g/RFjJh4csWQc6tcK4wOh/pnY+rzRW0TK5uMeKq3Q3hwg4gRXoDURjiYTtLI6fkrgJg2
         wTr/WvLmZMXxAACCQ3qFrJjKtWsDSUZ/8xhGWags3u0Ql+iukVoU0fcVtX9VtI4FXmxJ
         mtcdInzKuOE5m37GOvDbznGGM7KKWYdJ6fFDsmuCv/fEf4zbaQdX4iER/OmSwFX5UKdG
         cvokBecGWVNPsm8AgxTGjIEM/uepnpDwdDdKb3cS4FvQpwswg9JNgWT2ZUn52K+SaLSi
         4V+w==
X-Forwarded-Encrypted: i=1; AL+hErGfT+gG3gXAGz9ziFQwLKyG0XZjmI3n04Q9+UTXPmehIDOTsIStLPCnyneSmapEo4IdA8k3agQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+6I6V/g8y55KCi8KzQi1ppBzkTiLJABOopYGkXC9T2ccBAwQrH
	PhdBYqZvvUOaDMJ472U8n1kDejaAVlDP20bpoi7tnV3/igKSc0Hn59F7cerFzvUiuQ==
X-Gm-Gg: AZFdTZfHERj2nKL0uCLefd+8GImMFYEiJ/y8AksrEw+lnvf3bwY+GcNNWVIdJA6JYef
	SuCxgrpBa4f7G3efGzBhdhrL1IJU2rYCTDi3mXgJ0b2bFNgD5OLgu6b+mb7tntUjy2Mj+NdBVn6
	AcN22GtVqJt/kUodUUJGfupPReDzgGRcwHP/qjM0x+PMcIEseiiJRQ2HJCG13KBB9TzEmSfDdf2
	ug0abL8w8SUhFKls2A4jaQfTTrAmZbYE+QjVCBtf4OoQPEGqnnKPndl41TnbVkz5n4F/EUhLAul
	y38ZC5n2iVSjT2ygLx+J7KQGL9h0BrK2LIkQbZefbWG22XA8A8XdKa7ncvmXcy915MRTjC4ZAdG
	t2jff/gfhW/2ztDSuRq1GqBiJxD3X8V0sRPsxFpA6bGk2+N6ceFQnnhUTSTIJDJXWDp2H3aBkn4
	op08w3J0CIz6jOEm8yeocAKFjeY8UG60W3zyqC2wVMyDADsoxK/OVnq37MMXiS/RckZy0e3zuIJ
	lv3ZR2HHKee0GY9P9UZd7s1zmqvFm7TvlqQVEDVvXYhDNeuPcqt5jBUJwJfiBEPdEgQUV1OzhGY
	nV6bNOmFhR6DldNB93bblUWQGYgkypt7eyN6mgPPKCtFD8mD/B0tMyPBwd4t1AEjGaQNXbEEYBY
	X6iz8z4729mLjdXtgwm/QhBfuSifOoQPtIq929psy/ejttg/PDLNSAKM0NPwbobvNpqxlbls4l6
	dlO/Ni5Vy/7MP1dR4H2trSC4kCnhooIskEmkQoSl507cnM96qYPkKVS/RKUrO8rgwVRTKZjGub5
	iNvXFPwCd0DuxJ4N13j/AsaLWZ4pqwgLdA/BbBCBT7gfj7a+I6qWL8lRN37gwCkl4metGl9QDcD
	gFLR1HlS6Co+h8Sa4q3w+b6MgNmPw1VZpHpfXoWRt9gqtoNoZiZdHvdu5QtKJiJ6h/GnwT6ivA=
	=
X-Received: by 2002:a17:907:e00b:20b0:c4d:22e2:1a2b with SMTP id a640c23a62f3a-c513a47e2ffmr509115366b.1.1795381528414;
        Sun, 22 Nov 2026 13:05:28 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:27 -0800 (PST)
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
Subject: [PATCH ath-next 3/6] wifi: ath11k: drop decapped frames with a source other than the station
Date: Sun, 22 Nov 2026 22:05:22 +0100
Message-ID: <20261122210525.2076058-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130530_473898_4C1DA4C4 
X-CRM114-Status: GOOD (  18.76  )
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

Found by reading the code with an AI review tool; the trigger above was
then reproduced on hardware.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 58 ++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 93425ee02774..f8c08b8b6b08 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2253,13 +2253,47 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
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
@@ -2284,11 +2318,16 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
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
@@ -2322,13 +2361,15 @@ static void ath11k_dp_rx_h_mpdu(struct ath11k *ar,
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
@@ -2626,7 +2667,9 @@ static int ath11k_dp_rx_process_msdu(struct ath11k *ar,
 	}
 
 	ath11k_dp_rx_h_ppdu(ar, rx_desc, rx_status);
-	ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	ret = ath11k_dp_rx_h_mpdu(ar, msdu, rx_desc, rx_status);
+	if (ret)
+		goto free_out;
 
 	rx_status->flag |= RX_FLAG_SKIP_MONITOR | RX_FLAG_DUP_VALIDATED;
 
@@ -4018,7 +4061,8 @@ static int ath11k_dp_rx_h_null_q_desc(struct ath11k *ar, struct sk_buff *msdu,
 
 	ath11k_dp_rx_h_ppdu(ar, desc, status);
 
-	ath11k_dp_rx_h_mpdu(ar, msdu, desc, status);
+	if (ath11k_dp_rx_h_mpdu(ar, msdu, desc, status))
+		return -EINVAL;
 
 	rxcb->tid = ath11k_dp_rx_h_mpdu_start_tid(ar->ab, desc);
 
-- 
2.53.0


