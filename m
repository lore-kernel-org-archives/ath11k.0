Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVeYa-0002An-1R
 for ath11k@lists.infradead.org; Mon, 04 May 2020 17:07:10 +0000
From: Tamizh Chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 2/2] ath11k: Add peer max mpdu parameter in peer assoc command
Date: Mon,  4 May 2020 22:35:00 +0530
Message-Id: <1588611900-21185-2-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1588611900-21185-1-git-send-email-tamizhr@codeaurora.org>
References: <1588611900-21185-1-git-send-email-tamizhr@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>

Add peer max mpdu length configuration support in peer_assoc_he
parameters. Noticed low throughput for the STA which
supports HE, HT and not VHT in MU-MIMO case without this
configuration

Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f33c6d7..88e533c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1161,6 +1161,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 				   struct peer_assoc_params *arg)
 {
 	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
+	u8  ampdu_factor;
 	u16 v;
 
 	if (!he_cap->has_he)
@@ -1178,6 +1179,30 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 	/* the top most byte is used to indicate BSS color info */
 	arg->peer_he_ops &= 0xffffff;
 
+	/* As per section 26.6.1 11ax Draft5.0, if the Max AMPDU Exponent Extension
+	 * in HE cap is zero, use the arg->peer_max_mpdu as calculated while parsing
+	 * VHT caps(if VHT caps is present) or HT caps (if VHT caps is not present).
+	 *
+	 * For non-zero value of Max AMPDU Extponent Extension in HE MAC caps,
+	 * if a HE STA sends VHT cap and HE cap IE in assoc request then, use
+	 * MAX_AMPDU_LEN_FACTOR as 20 to calculate max_ampdu length.
+	 * If a HE STA that does not send VHT cap, but HE and HT cap in assoc
+	 * request, then use MAX_AMPDU_LEN_FACTOR as 16 to calculate max_ampdu
+	 * length.
+	 */
+	ampdu_factor = (he_cap->he_cap_elem.mac_cap_info[3] &
+			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_MASK) >>
+			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_SHIFT;
+
+	if (ampdu_factor) {
+		if (sta->vht_cap.vht_supported)
+			arg->peer_max_mpdu = (1 << (IEEE80211_HE_VHT_MAX_AMPDU_FACTOR +
+						    ampdu_factor)) - 1;
+		else if (sta->ht_cap.ht_supported)
+			arg->peer_max_mpdu = (1 << (IEEE80211_HE_HT_MAX_AMPDU_FACTOR +
+						    ampdu_factor)) - 1;
+	}
+
 	if (he_cap->he_cap_elem.phy_cap_info[6] &
 	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT) {
 		int bit = 7;
-- 
1.9.1

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
