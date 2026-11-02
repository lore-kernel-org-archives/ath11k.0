Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628A5606A324
	for <ath11k@archiver.kernel.org>; Mon,  2 Nov 2026 05:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bZAoIc+t;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m75/0I0P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XVpNLH2FiGtscLNxG2j1l4l4r0lRErkiBU7Q0Ju5Pww=; b=bZAoIc+trjeI9qsP0vsMHgnIhf
	anoACKqO2QXZ1Pn+jY7XSzv0GsJqc2TN5QIp/D/y7N8lFI3NZFr08zNbBOsrHRBGDYBDUxIPxJVlf
	o3GX8ikOX7mqbzLd914vNzHNLRRtFgaP6fBjLCdkDaZP81OAUdySmEjLOIfo4Q5ySFjaL7TIFA99A
	gV7I0as3894nJdLVx/h1cPNd4rT+5azfrzqhLF94ydEC4/JmNaSGggqy6wdHKhRkZ8xIQdNR3WYmr
	TEf/0CQnSe7iQGyTorDVQ6b2HoS1icI65u5OMn6jTJZ12dXPG4BHGVCHceX/4LzRFz1zp/HPUlIKH
	i5cOChJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN4-0000000FXyd-0Aqp;
	Mon, 02 Nov 2026 05:14:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN2-0000000FXxG-1MVB
	for ath11k@lists.infradead.org;
	Mon, 02 Nov 2026 05:14:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CD1B60A50;
	Mon,  2 Nov 2026 05:14:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793596451;
	b=0GuZFyoX0iSk1sYLZdM4tkNXhp4HJJR5znm/WIeTRO0qv0XRikOO6pXBGEh36ZoCigjA
	 YehbQ6bgkZbalgPkGC+FAxUe9OY1Mlb6QHC7vgFnYihxpEPEWgnlEgrVWblvC/alq0fhL
	 aggx2+lScsgLKUxbIIzkLD1lh8o9QXUJO4pgoCvYtjXkJ+L43AyVK4UP4WEZP0Ii+vrd/
	 jaVAWKvwrrWCkkY3p2jh+lmZD/gCBSe5/Uc5N7Osfwc5IVfYHsATL1vu6cnj0XGg0CAo+
	 z3btkCKUgpKSjUaEmz9oflkRX5IW3TXRjmrv+BuAobQsDMB3twGhj0qZ2WxvqkJd06Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793596451;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XVpNLH2FiGtscLNxG2j1l4l4r0lRErkiBU7Q0Ju5Pww=;
	b=szlP+/cdyvY9nmNQOacHM58VjGmh3FqJzZrDtneXqY8Bv/ujvy7a/YfqT6snfanh9tot
	 E1rJUOy/Hfvsh0bjPqaGQXW0lwG02KvSf/QNjGH/sM7URtxaju244aTKk9seDSY5dp5Ms
	 kElXCWetkhOKkWOBHO5TQhBYHPb0sMLZ5RAHXdv2Ncs+bsJaw3gwEEe+auSdHfLig0utP
	 wUR/fmy3tiXe82Y3OD+5jeZHnEJgmo6DR9BabzoFrnQhTNxf8i+iVbMOmh4TIMp0dE2vy
	 wgoUwBLRpBgtSpolW03VyV3r2U/ORm2kq4oQUmyMDZXAZG6+Ipgm9bsp3TNOynuE64w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A80741F00919;
	Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793596451;
	bh=XVpNLH2FiGtscLNxG2j1l4l4r0lRErkiBU7Q0Ju5Pww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=m75/0I0PEglcwwJU6K1P0MJCo7Q9sOaU4YeKM1IQand65duGVCPAIzQQruJ7WqKjD
	 Yh+9uh9BHB89nKPvD95lUjp7xlW67jtrxSra88n+gxtUYmsrg/TDF0Fe4QdTq6rYXW
	 vHI32SuRGjiyHg7pBvg1DVMZ7yvT+JF6s69v2okMWAgaulXPZskC8y89FHHItilhOr
	 gv2fiYzwOdck8+ZNZ1Vinb1YQMTHNENZVNVQNdry2OlWUyCH7Q7UQR0QklQ026CsCi
	 QKp0bmHac1gmGCyb/tVV18o3m/69cxjOudDU3gaGFRdf2GjDB2UV+r6gvy0hcWMs2I
	 QEE3oXRl9xCNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32EE446386;
	Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 23:14:11 -0600
Subject: [PATCH ath-next 3/3] wifi: ath11k: report a monitor frame's MCS
 and NSS only from the PPDU's SIG
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-b8-monitor-frames-v1-3-f0a43d9630e5@gmail.com>
References: <20261101-b8-monitor-frames-v1-0-f0a43d9630e5@gmail.com>
In-Reply-To: <20261101-b8-monitor-frames-v1-0-f0a43d9630e5@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Jouni Malinen <quic_jouni@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Julia Lawall <julia.lawall@lip6.fr>, kbuild test robot <lkp@intel.com>, 
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 Anilkumar Kolli <quic_akolli@quicinc.com>, Miles Hu <milehu@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Govindaraj Saminathan <quic_gsamin@quicinc.com>, 
 Sriram R <sriram.ramachandran@oss.qualcomm.com>, 
 Shashidhar Lakkavalli <slakkavalli@datto.com>, 
 Rajkumar Manoharan <rmanohar@codeaurora.org>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793596448; l=4679;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=J4jRf5l59+FWEVGn47cCD/3aF3TptpB1fGEP1KJUXLA=;
 b=bmG75PeLmhL3oUTVAm+ZrW60a0gibEUkuhKP79wvs56n1yY43XiE9zmwYPAl4VwJ4b5VqU79V
 6hPVtoKyQnUBCed6G7Zy0QidhWv6iD3jnpQ+hKWbuBg3JvKL23gUjT6
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_update_radiotap() sets an HT, VHT or HE monitor frame's
rate_idx from ppduinfo->rate. That is the L-SIG rate code, not the MCS
that the SIG TLV gave (ppduinfo->mcs). ath12k had the same bug, fixed
by commit 10085a654a4c ("wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS
reporting in monitor mode").

The function also takes the preamble from the PPDU's user stats, which
can arrive without the SIG TLV. The status of one PPDU can span more
than one buffer, and since commit 01d2f285e3e5 ("ath11k: decode HE
status tlv") ppdu_info holds only what the last buffer had. The frame
then goes up as VHT or HE with MCS 0 and no spatial stream, and
mac80211 drops it, warning once:

  Rate marked as a VHT rate but data is invalid: MCS: 0, NSS: 0

An Arista C-360 with monitor interfaces up logs this, and the HE
equivalent, once per boot. Because the warning is WARN_ONCE(), every
later such frame is dropped without a message.

Take the MCS from ppduinfo->mcs, adding the stream offset for HT.
Use the PPDU's HT, VHT or HE rate only when its SIG TLV was seen with a
valid NSS and MCS. Otherwise keep the rate from the MPDU's rx
descriptor, and if that names VHT or HE with no stream, report one
rather than lose the frame.

ath11k_dp_rx_deliver_msdu() sets RX_FLAG_RADIOTAP_HE on the rx_status
that all skbs of an MPDU share. Clear the HE radiotap flags for each
skb, so that each skb's flags match the radiotap data pushed onto it.

Fixes: ab0a9ef605cf ("ath11k: translate HE status to radiotap format")
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 37 ++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 7809c92baa325..53d7b19d8807c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5075,26 +5075,49 @@ static void ath11k_update_radiotap(struct ath11k *ar,
 	rxs->flag |= RX_FLAG_MACTIME_START;
 	rxs->signal = ppduinfo->rssi_comb + ath11k_noise_floor(ar, rxs->freq);
 
+	/* Each skb of the MPDU carries its own HE radiotap data, if any:
+	 * drop the flags the last one left, ath11k_dp_rx_deliver_msdu()
+	 * included.
+	 */
+	rxs->flag &= ~(RX_FLAG_RADIOTAP_HE | RX_FLAG_RADIOTAP_HE_MU);
+
+	/* An HT, VHT or HE PPDU's MCS and NSS come from its SIG TLV, its
+	 * preamble type (the *_flags) from its user stats. The status can
+	 * hold the latter without the former, as when it spans more than
+	 * one buffer. Keep the rate the MPDU's rx descriptor gave
+	 * (ath11k_dp_rx_h_ppdu()) then: reporting the preamble with no
+	 * spatial stream gets the frame dropped by mac80211.
+	 */
+	if ((ppduinfo->he_mu_flags || ppduinfo->he_flags ||
+	     ppduinfo->vht_flags || ppduinfo->ht_flags) &&
+	    (!ppduinfo->nss || ppduinfo->nss > HAL_RX_MAX_NSS ||
+	     ppduinfo->mcs > ATH11K_HE_MCS_MAX))
+		goto out;
+
 	if (ppduinfo->nss)
 		rxs->nss = ppduinfo->nss;
 
+	/* ppduinfo->rate is the L-SIG rate; an HT, VHT or HE PPDU's MCS is
+	 * ppduinfo->mcs, as the SIG TLV gives it.
+	 */
 	if (ppduinfo->he_mu_flags) {
 		rxs->flag |= RX_FLAG_RADIOTAP_HE_MU;
 		rxs->encoding = RX_ENC_HE;
 		ptr = skb_push(mon_skb, sizeof(struct ieee80211_radiotap_he_mu));
 		ath11k_dp_rx_update_radiotap_he_mu(ppduinfo, ptr);
+		rxs->rate_idx = ppduinfo->mcs;
 	} else if (ppduinfo->he_flags) {
 		rxs->flag |= RX_FLAG_RADIOTAP_HE;
 		rxs->encoding = RX_ENC_HE;
 		ptr = skb_push(mon_skb, sizeof(struct ieee80211_radiotap_he));
 		ath11k_dp_rx_update_radiotap_he(ppduinfo, ptr);
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs;
 	} else if (ppduinfo->vht_flags) {
 		rxs->encoding = RX_ENC_VHT;
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs;
 	} else if (ppduinfo->ht_flags) {
 		rxs->encoding = RX_ENC_HT;
-		rxs->rate_idx = ppduinfo->rate;
+		rxs->rate_idx = ppduinfo->mcs + 8 * (ppduinfo->nss - 1);
 	} else {
 		rxs->encoding = RX_ENC_LEGACY;
 		sband = &ar->mac.sbands[rxs->band];
@@ -5102,6 +5125,14 @@ static void ath11k_update_radiotap(struct ath11k *ar,
 							  ppduinfo->cck_flag);
 	}
 
+out:
+	/* The descriptor can name VHT or HE with no spatial stream too.
+	 * Report one rather than lose the frame.
+	 */
+	if ((rxs->encoding == RX_ENC_VHT || rxs->encoding == RX_ENC_HE) &&
+	    !rxs->nss)
+		rxs->nss = 1;
+
 	rxs->mactime = ppduinfo->tsft;
 }
 

-- 
2.43.0



