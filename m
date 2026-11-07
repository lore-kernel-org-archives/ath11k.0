Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7644606A32C
	for <ath11k@archiver.kernel.org>; Sat,  7 Nov 2026 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NTuXyK+I;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=MS29P3Sf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=; b=NTuXyK+IHo4qf/ULLXh25+g7Mk
	HOykqlzGb1NrezBlPfXWzv4ov6Lm9Z8ZrHGFHAXMmQ2iodaNhw7yW1TJkHayMA8GAHVmeemiBMWpE
	c0h6bwaD4ehwCCU1FWAtODaijEFIiajWQHu8TetkKRqsjBmX3A3YhFuTOFQ95HvHOq8xIZo9MN2J5
	FmLztnfNOGd/cYhp9tHB2MXIw/NfEDg1YD/KbXtbtlmA0ArHmHjlTKWK1Wzz+M3BrpH7AJC4J2wju
	4r8pQsat72/6Kx979b9+ELPchBSkgv0h6FQRw/rsEdOdJ5MUP4V4EQg3CLTI2CyJ865lxIo6fDAdD
	/hCojQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgdl-0000000Ekh6-2cS4;
	Sat, 07 Nov 2026 13:39:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgdj-0000000EkfT-1Kb4
	for ath11k@lists.infradead.org;
	Sat, 07 Nov 2026 13:39:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c34bff61551so241235366b.2
        for <ath11k@lists.infradead.org>; Sat, 07 Nov 2026 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794058765; x=1794663565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=;
        b=MS29P3Sf/LGDiXAHryXpGNgcmmpHO+Z9V2Sfsu4R5W4Lp6g0qHRAdZCF6/dxZ5Em+M
         nqUkuz7qyoht3DJBzxme9b7KEI6UVMGte5YbQMr6bzW2x12SSYigIh4z0opyx+8QRqIT
         8W2OHZQUk7GAGzYSj3VNo9QBHt4MSmUUYwyH+YtzTEhcA8VebCzZyZQ3tmQVBvEwL1g+
         pKueolkTkfgqcSU8bjjKzZFwOc2EwIRZMtR4Wc+V0NT2eS5oSenDZ6iWQIMBi1ZYqMmW
         zzfDqoMy09Yju7nVIUpnJcDKg+831HN6Mjqf4/mpWiWPDKhlsB8fNfUbomqXoT2aqpjn
         EcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058765; x=1794663565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=;
        b=fo8bcBJoWKkNpaKLW04RtUNyfJWgWK/VNoK+F1r0iz8Qsow4EopbBkaPQ5bQWkB7u3
         x9+bbLeRkVlOnMak4eTVH5QuA7vdWR0QHryqgPjCMVj/3hXkPGlrGj3VKIvsg7pWzLgi
         1YSk7HWAfYqhf0gTcO813gT2gqx1I+ULIauj58cP9rm9uD6SXgKDSdciy4bH6MzWuW2F
         WXk4L4d3rGmjQTedWA3lyJq6QCtf4mSA1iiLUpUP4rHAmb1opHCRyyBsi26YE+O5+F5V
         maiAWzgITaf0+mxA4/Tgg2vCiSBBGoRiAahoNLKurq5ot2tL2Wfeub3Vh7a+9rHfa8LV
         NWDw==
X-Gm-Message-State: APuU4Z8OUkY+NrM6PayrJrvijoanGRIxEN/69gaMS6gX3+veHoGViLEh
	MWiKFVdkYjH75b+f/d60x49Iw5hZaZgg3r6VW4gwm7P/uAmg74V9KZT3qy9q10naQg==
X-Gm-Gg: AYBFou3C572PHPSDf+IQk6BUKr3QIqnyVJizzYlEKN4JZPJpKtLZL3REuBd5ItDm1jm
	/X6XnyOOvw9clM5zi0O3Q4dO34y0g3qWZCgyXfXINEWHGLtzff29xY6QHpIDetjSKqWu1u3peYi
	jHYcyrK8Vc2s2s3Uz/Ze4y+nY4aMMEu3tJ6n/nJGjKO7RWH4ITA8xRPGo9fOmOqgBOcDguj0rTU
	OaMAITD+vD+06E6p0ddladZpT8Zjl8RUv7sR0Ys8vE5pNhX8PqR2BOiVmTOnmQ1W0MHWtmRcPHd
	MKsYG2L/7Al0H5F0uITDXtyqGn++d469uBZJzK+AvMT9IkBUQHHviLfdUWyMO0wJSSyEyruXzZk
	NwxS+fS6BWnTntxlIiul4/kmekuiIMuYfm0t8auWqbfUDV313cPf63wQmyYB4MPauaW9t2TL2cd
	Y+KHqD2Kzhdzo4yoXGTeRi1cApCwKRdU6v50toqpWRuEQI6sk+rXog3fqsI06nxnI6/yQiUpYq/
	Znbt9RriEstcnv8baelZYAsxCw7pQ26QwqEIuGgh9Zb3OSfxgVHicvd/FpJVkzOo7oMTmPsDD+F
	6+MZ+7fSy3BOayfymDt/StrMY76XVzH6JoDJCiQ4wjGgIQahESkjhubmVZGurpYIN2iiaA3bLds
	hRa1kBvv0D7XnfNuGHXbLCK7hxVYOKefLytlgK5UtoWoc23aZOiYIdNj8UlQFjGCn/w8L83Ow3+
	wUBpxTRHjvgX8xnf/uQDTN6vacqowmMkHpeNjEtraIZaaDXTYXY9sPie5DTFK2bFXBM/4i5z6PX
	h+YowdzrzKQ96TipEHu1mWMVqgq6UChPGC5f2/AwyTfld1dJEuK86OyIK2ImTXFd4q7H44cwqlI
	faygKDCnT+S07Ji1fA==
X-Received: by 2002:a17:906:ef04:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c4d3468f9f2mr431978766b.7.1794058764366;
        Sat, 07 Nov 2026 05:39:24 -0800 (PST)
Received: from Desktop (pd95130be.dip0.t-ipconnect.de. [217.81.48.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ab149sm151758266b.3.2026.11.07.05.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:39:23 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sven Eckelmann <sven@narfation.org>
Subject: [PATCH ath-next] wifi: ath11k: replace a pairwise key in place
Date: Sat,  7 Nov 2026 14:39:25 +0100
Message-ID: <20261107133925.3522299-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_053927_425238_B19BF156 
X-CRM114-Status: GOOD (  20.93  )
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

mac80211 replaces an in-use PTK by calling set_key() with DISABLE_KEY
for the old key and SET_KEY for the new one, which ath11k sends to the
firmware as an install of cipher NONE followed by an install of the new
key. Commit 97acb0259cc9 ("wifi: ath11k: fix group data packet drops
during rekey") stopped this clear-then-install sequence for group keys,
and it fails the same way for a pairwise key: on an IPQ8074 AP, the
station stopped receiving at its first PTK rekey in 6 of 6 runs, with a
Broadcom and a Qualcomm client, the REO counted up to 165 PN check
failures per run, and hostapd deauthenticated the station at the next
rekey. Because ath11k does not set NL80211_EXT_FEATURE_CAN_REPLACE_PTK0,
mac80211 also warns "Rekeying PTK for STA ... but driver can't safely do
that" and flushes the queues, which waits ATH11K_FLUSH_TIMEOUT (5 s) for
the whole radio whenever a busy station keeps frames pending.

Keep the old pairwise key in the firmware when mac80211 disables it for
a station, so that the following SET_KEY overwrites it in place, as the
group key path already does. Outside raw mode the hardware encrypts a
frame with the key it holds for the peer and generates the PN, so a
frame queued across the replace leaves with the old key or the new one
and never in the clear, and the SET_KEY resets the REO PN state. A
pairwise key removed without a replacement is cleared when the station
leaves the authorized state, and peer deletion drops it with the peer.
With this, advertise NL80211_EXT_FEATURE_CAN_REPLACE_PTK0.

With hostapd rekeying the PTK every 20 s, a download to a FastConnect
7800 station holds 914 to 945 Mbit/s through four rekeys, with no
second below 854 Mbit/s (3 runs); before, the station lost the
connection in 3 of 3 runs.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write this patch.

 drivers/net/wireless/ath/ath11k/core.h |  8 ++++
 drivers/net/wireless/ath/ath11k/mac.c  | 55 +++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..69e612a3e71b3 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -571,6 +571,14 @@ struct ath11k_sta {
 	bool use_4addr_set;
 	u16 tcl_metadata;
 
+	/* A pairwise key mac80211 removed but the firmware still holds,
+	 * cleared by the next SET_KEY or when the port closes.
+	 * Protected by ar->conf_mutex.
+	 */
+	bool ptk_clear_pending;
+	u8 ptk_clear_idx;
+	u32 ptk_clear_cipher;
+
 	/* Protected with ar->data_lock */
 	enum ath11k_wmi_peer_ps_state peer_ps_state;
 	u64 ps_start_time;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..386e9593e4590 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4509,6 +4509,33 @@ static int ath11k_set_group_keys(struct ath11k_vif *arvif)
 	return first_errno;
 }
 
+static int ath11k_mac_clear_ptk(struct ath11k_vif *arvif,
+				struct ieee80211_sta *sta)
+{
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ieee80211_key_conf key = {
+		.cipher = arsta->ptk_clear_cipher,
+		.keyidx = arsta->ptk_clear_idx,
+		.flags = IEEE80211_KEY_FLAG_PAIRWISE,
+	};
+	int ret;
+
+	lockdep_assert_held(&arvif->ar->conf_mutex);
+
+	arsta->ptk_clear_pending = false;
+
+	ret = ath11k_install_key(arvif, &key, DISABLE_KEY, sta->addr,
+				 WMI_KEY_PAIRWISE);
+	if (!ret)
+		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, sta->addr,
+							 DISABLE_KEY, &key);
+	if (ret)
+		ath11k_warn(arvif->ar->ab, "failed to clear pairwise key of %pM: %d\n",
+			    sta->addr, ret);
+
+	return ret;
+}
+
 static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 				 struct ieee80211_key_conf *key)
@@ -4519,6 +4546,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	bool is_ap_with_no_sta;
+	bool keep_ptk;
 	const u8 *peer_addr;
 	int ret = 0;
 	u32 flags = 0;
@@ -4614,7 +4642,21 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
-	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+
+	/* The same firmware race hits a pairwise key: a clear followed by
+	 * an install of the same peer's key leaves the firmware dropping
+	 * every unicast frame to the peer. mac80211 replaces a PTK by
+	 * DISABLE_KEY on the old key and SET_KEY on the new one, so keep
+	 * the old key until the new one overwrites it in place. Frames
+	 * queued in the hardware leave with the old key or the new one,
+	 * never in the clear. A removal not followed by an install is
+	 * completed when the port closes, and peer deletion drops the
+	 * key with the peer.
+	 */
+	keep_ptk = sta && flags == WMI_KEY_PAIRWISE && cmd == DISABLE_KEY;
+
+	if (!keep_ptk &&
+	    (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta)) {
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
@@ -4656,6 +4698,12 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (sta) {
 		arsta = ath11k_sta_to_arsta(sta);
 
+		if (flags == WMI_KEY_PAIRWISE) {
+			arsta->ptk_clear_pending = keep_ptk;
+			arsta->ptk_clear_idx = key->keyidx;
+			arsta->ptk_clear_cipher = key->cipher;
+		}
+
 		switch (key->cipher) {
 		case WLAN_CIPHER_SUITE_TKIP:
 		case WLAN_CIPHER_SUITE_CCMP:
@@ -10056,6 +10104,9 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
 		   new_state == IEEE80211_STA_ASSOC) {
+		if (arsta->ptk_clear_pending)
+			ath11k_mac_clear_ptk(arvif, sta);
+
 		spin_lock_bh(&ar->ab->base_lock);
 
 		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
@@ -10606,6 +10657,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
 		wiphy_ext_feature_set(ar->hw->wiphy,

base-commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5
-- 
2.53.0


