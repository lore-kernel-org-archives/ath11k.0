Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CD7606A323
	for <ath11k@archiver.kernel.org>; Sat, 14 Nov 2026 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s2BDk3HP;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gGA4ukgd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=; b=s2BDk3HPDVKTUIGLJdgrP3gzDw
	LijFCgTZZ7hZojzxwP+B782TYcM9DZUlOXSxCbVeF9hEt5C4Ie05O4qK3oPxabj+7aJefpyJueu4J
	X+blJcLNh610tynJp4XcwvRn0d1RLzqISXBh3r7GGcPxfJBNecatt2KyfBaUZzYo4PV/Rrj+FdHgP
	hrry9yCy+clz//fPWuEZ2cwij2nE8998NnC/cKr4mPC7skT4wNzABepeyxWyjSgDq0mPrNM73nM03
	BAYgj4X7a024GsA3ZksQKEBbAq6MTX5UwD+SdGAHnh9GxAS/fCBR6KFE/ETipJKuqeU5GmNJr5nVY
	JTgwNURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMiH-0000000GruE-1nbn;
	Sat, 14 Nov 2026 22:59:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSMiE-0000000Grte-0XMa
	for ath11k@lists.infradead.org;
	Sat, 14 Nov 2026 22:59:11 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c50933bdf4bso477082366b.1
        for <ath11k@lists.infradead.org>; Sat, 14 Nov 2026 14:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697148; x=1795301948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=;
        b=gGA4ukgdIzfW5iZoHn6roLnd7fn/v8wCo6ClX1a8SSf36umUcdt1Pw3jOuO0mxmlGe
         rAVLNXm+0UkLkz+YQzInvz3l+r//igW687gByL6PYFcrSKfUTXZ0g9/iL+H2LSlLOFFM
         HMMr2pibmp3Snb9Jc3K+af1kCY6loBbyZ+3V2yDk0J/74ytyw012X+6Gtgc7v0kKMtZq
         dWJBc59gdcWT9CU02Lx5EXT18UJ3LRGfPGhJqrndfHrteEoFLLT5/FOqgh3TzxU12js6
         2VnAPc/UA4AKP7YhMWF+BWhev8/oZlCPpelee/yCzcAX1tVlDurmS+Or+uzfjaLl1bgd
         XdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697148; x=1795301948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=;
        b=p8VqS8qDZDRly6mr+1umq4/HxvsEyhduEU1Y2fMA7eMekfxGSI7y50noS6bhqtHPLH
         KgjxahM2V0Qk59j0U8OHcxXxkXP7bhU42mbwhSttChtYJhLnJ1dLFltZ+4odtq/I/fFx
         wWaBuSsnE/P3zdXvzQOoXBzoTGX41B4dEbU+2TpAVpLxNjJ/A/NsySZCeB62xysHPWZB
         rcJxNopygcKZb9hnQrKzOgIgI/KoZtGzcDljczeEozBXKAtqMzYXYS6177HRtYL78lzO
         BIDT6/U9SBxsyKATbLeRpAoMzt019PcuoOVnf+mPUcNwvPeE78huS7d3ZASH83h+gBWc
         qlOg==
X-Gm-Message-State: APuU4Z8zWOUgK3lqGx0hWSR1WT2DMQ9uOZbSRTpDxYM+x9idT45PSeEx
	LcYbfUe40fsAU8HcRaVhbFkzKBKG3a3APHRv6gED/5kcbnjfhfYg+ZisjHDadxRcQA==
X-Gm-Gg: AYBFou0r1YEmcUY/x6JMvKXxb3nZE6/qEIHZ6DpBuD9oxrJGh8bzaGHgogQXhOhsQlN
	nEcw05l6JaXswuW2gNN3v2qmimr3PhxtUWXkn5zVLC6WlEyHpIq/MhmFDPSVpc4b7ovkxp/8T0y
	U9U9ZcZWKhIOHm+i1CsaoEVPEpz/1t7FRgQd9wVNuZPdXnoMiL5WZbyMgwMOr7SaxCQuRKXYOfk
	cyP33fAlNqS30nqpBR/fchg48SrzPg+eqwbfEbOwIlbT9wXBxH+y67iiGy99+UXJbQ/R1Mss305
	nAvmGtSoyZFeOu1JUi2nECBNg/lnGKBnnx5HHp4UK+1VxQlhaUKfzVb37bvCjl1Y/cNKWIy01B9
	8u3HAr2DEuVmQZHePJBqxYfnxndU5EIDuzOLqItUZWEzWg8LRVYLgbdSCSbfOBPAiDY5fBe0LEP
	DuEWPtozD9OL1eiAEiUyc1s9o6J/o0iMugwi59MpKGx8aApvOyWYM9WDqvGSr5jSvY7oEuoazIT
	o3F2TkUTSuwThsf9Sz6xSo48fdDzAPqVM+MGTbySitwZqSn89bmVO4tiKveb8eTGul2HGmds5uY
	uijGG00oboqkqh6MCwCUCe4oSUMN1XuVrtfyYuPQuxHzjQBrw2nhwXYU73YcKA2qI8ry9s3X4sE
	xYC1S/uKagU/jrg6NRDYsNutWVypGCnUnu+wGWvBMGuUuT4SaVEg1Or0iPLyseGMhrWN2k1+gkg
	raYZHPK4aG7jshz4VeFBRigmwebe6AD3C2nS/kV9oAUtbuGmLljbK6Y9K17woUnsadKzl0SQKJb
	AXQgbyY3H58HN0HbnP8J1C07sCMuXH5cLshz/XRiCqI9d7n9CvQFc/U8J8lhw3FOWwc8D2FGqKA
	7kyvBKrK3SmxotqD68FPxZFD7HTCZhfN3PAThmeN7Y8PGGZcwd0U2w==
X-Received: by 2002:a17:906:c150:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c507c41ed34mr840249666b.23.1794697148201;
        Sat, 14 Nov 2026 14:59:08 -0800 (PST)
Received: from Desktop (p200300f24709e8000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4709:e800::a27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dafbasm2718936a12.22.2026.11.14.14.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:59:07 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sven Eckelmann <sven@narfation.org>,
	Kalle Valo <kvalo@kernel.org>,
	Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: [PATCH ath-next v2] wifi: ath11k: replace a pairwise key in place
Date: Sat, 14 Nov 2026 23:59:05 +0100
Message-ID: <20261114225905.978606-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_145910_223613_EBD68E17 
X-CRM114-Status: GOOD (  26.45  )
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
and the same sequence fails for a pairwise key. ath11k does not set
NL80211_EXT_FEATURE_CAN_REPLACE_PTK0, so mac80211 warns "Rekeying PTK
for STA ... but driver can't safely do that" and flushes the queues,
which waits ATH11K_FLUSH_TIMEOUT (5 s) for the whole radio whenever a
busy station keeps frames pending. On an IPQ8074 AP with a station
downloading at full rate and a rekey every 20 s, the first run of each of
two attempts logged 7 and 2 of these warnings and 2 and 1 flush timeouts,
and the station lost the link in both.

Keep the old pairwise key in the firmware when mac80211 disables it for
an authorized station, so that the following SET_KEY overwrites it in
place, as the group key path already does. Outside raw mode the hardware
encrypts a frame with the key it holds for the peer and generates the
PN, so a frame queued across the replace leaves with the old key or the
new one, and the SET_KEY resets the REO PN state. A pairwise key removed
without a replacement is cleared when the station leaves the authorized
state; a removal outside that state, as hostapd does for a leaving
station after closing its port, clears the key at once as before. A TKIP
fragment chain completed while the host holds no key for the peer is
dropped, as its MIC cannot be checked. With this, advertise
NL80211_EXT_FEATURE_CAN_REPLACE_PTK0 outside raw mode, where mac80211
assigns the PN itself.

Tested on an IPQ8074 AP with the same load: three runs with this patch
completed 3 to 4 handshakes each at 847, 828 and 851 Mbit/s, with no
warning and no flush timeout, and five station leave and re-association
cycles each cleared the key and completed the 4-way handshake on the
first attempt.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.

Changes in v2 (Sashiko review of v1):
- save the key length with the index and cipher, so the delayed removal does
  not send key_len 0, which the firmware ignores (len 16 in 3 of 3 runs now)
- delay the removal only while the station is authorized; a removal in any
  other state clears the key at once
- do not advertise NL80211_EXT_FEATURE_CAN_REPLACE_PTK0 in raw mode, where
  mac80211 assigns the PN
- drop a TKIP fragment chain completed while the host holds no key for the
  peer instead of dereferencing the missing key

v1: https://lore.kernel.org/all/20261107133925.3522299-1-julius@bairaktaris.de/

In the three rekey runs one softirq core carried 72-75 % of the load
(cpu3, cpu3, cpu1; /proc/stat tick accounting).

 drivers/net/wireless/ath/ath11k/core.h  |  9 ++++
 drivers/net/wireless/ath/ath11k/dp_rx.c |  4 ++
 drivers/net/wireless/ath/ath11k/mac.c   | 61 ++++++++++++++++++++++++-
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..f56fa9edcbfd 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -571,6 +571,15 @@ struct ath11k_sta {
 	bool use_4addr_set;
 	u16 tcl_metadata;
 
+	/* A pairwise key mac80211 removed but the firmware still holds,
+	 * cleared by the next SET_KEY or when the port closes.
+	 * Protected by ar->conf_mutex.
+	 */
+	bool ptk_clear_pending;
+	u8 ptk_clear_idx;
+	u8 ptk_clear_keylen;
+	u32 ptk_clear_cipher;
+
 	/* Protected with ar->data_lock */
 	enum ath11k_wmi_peer_ps_state peer_ps_state;
 	u64 ps_start_time;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..acdff945cd1d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3276,6 +3276,10 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
 		key_idx = peer->mcast_keyidx;
 
 	key_conf = peer->keys[key_idx];
+	if (!key_conf) {
+		dev_kfree_skb_any(msdu);
+		return -ENOKEY;
+	}
 
 	data = msdu->data + head_len;
 	data_len = msdu->len - head_len - tail_len;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..42019e0641f9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4509,6 +4509,34 @@ static int ath11k_set_group_keys(struct ath11k_vif *arvif)
 	return first_errno;
 }
 
+static int ath11k_mac_clear_ptk(struct ath11k_vif *arvif,
+				struct ieee80211_sta *sta)
+{
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ieee80211_key_conf key = {
+		.cipher = arsta->ptk_clear_cipher,
+		.keyidx = arsta->ptk_clear_idx,
+		.keylen = arsta->ptk_clear_keylen,
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
@@ -4519,6 +4547,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	bool is_ap_with_no_sta;
+	bool keep_ptk;
 	const u8 *peer_addr;
 	int ret = 0;
 	u32 flags = 0;
@@ -4614,7 +4643,21 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
-	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+
+	/* The same firmware race hits a pairwise key: a clear followed by
+	 * an install of the same peer's key leaves the firmware dropping
+	 * every unicast frame to the peer. mac80211 replaces a PTK by
+	 * DISABLE_KEY on the old key and SET_KEY on the new one, so keep
+	 * the old key until the new one overwrites it in place. Frames
+	 * queued in the hardware leave with the old key or the new one.
+	 * Only an authorized station gets a rekey, and a removal not
+	 * followed by an install is completed when its port closes.
+	 */
+	keep_ptk = sta && flags == WMI_KEY_PAIRWISE && cmd == DISABLE_KEY &&
+		   peer->is_authorized;
+
+	if (!keep_ptk &&
+	    (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta)) {
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
@@ -4656,6 +4699,13 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (sta) {
 		arsta = ath11k_sta_to_arsta(sta);
 
+		if (flags == WMI_KEY_PAIRWISE) {
+			arsta->ptk_clear_pending = keep_ptk;
+			arsta->ptk_clear_idx = key->keyidx;
+			arsta->ptk_clear_keylen = key->keylen;
+			arsta->ptk_clear_cipher = key->cipher;
+		}
+
 		switch (key->cipher) {
 		case WLAN_CIPHER_SUITE_TKIP:
 		case WLAN_CIPHER_SUITE_CCMP:
@@ -10056,6 +10106,9 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
 		   new_state == IEEE80211_STA_ASSOC) {
+		if (arsta->ptk_clear_pending)
+			ath11k_mac_clear_ptk(arvif, sta);
+
 		spin_lock_bh(&ar->ab->base_lock);
 
 		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
@@ -10606,6 +10659,12 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+	/* In raw mode mac80211 assigns the PN, which the hardware must not
+	 * encrypt with a newer key
+	 */
+	if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
+		wiphy_ext_feature_set(ar->hw->wiphy,
+				      NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
 		wiphy_ext_feature_set(ar->hw->wiphy,

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0


