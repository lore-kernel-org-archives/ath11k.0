Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK0TK-0003dE-7B
 for ath11k@lists.infradead.org; Fri, 26 Apr 2019 13:01:00 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH] ath11K: add extended capabilities registration code
Date: Fri, 26 Apr 2019 15:00:31 +0200
Message-Id: <20190426130031.14453-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, John Crispin <john@phrozen.org>, Srini Kode <skode@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath11k@lists.infradead.org

This patch registers the ext capabilities fields with the subsystem.
This allows us to announce TWT support.

Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a38c101e0140..31d6687e727a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5027,6 +5027,43 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 	return 0;
 }
 
+const static u8 ath11k_if_types_ext_capa[] = {
+	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
+};
+
+const static u8 ath11k_if_types_ext_capa_sta[] = {
+	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
+	[9] = WLAN_EXT_CAPA10_TWT_REQUESTER_SUPPORT,
+};
+
+const static u8 ath11k_if_types_ext_capa_ap[] = {
+	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
+	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
+	[9] = WLAN_EXT_CAPA10_TWT_RESPONDER_SUPPORT,
+};
+
+const static struct wiphy_iftype_ext_capab ath11k_iftypes_ext_capa[] = {
+	{
+		.extended_capabilities = ath11k_if_types_ext_capa,
+		.extended_capabilities_mask = ath11k_if_types_ext_capa,
+		.extended_capabilities_len = sizeof(ath11k_if_types_ext_capa),
+	}, {
+		.iftype = NL80211_IFTYPE_STATION,
+		.extended_capabilities = ath11k_if_types_ext_capa_sta,
+		.extended_capabilities_mask = ath11k_if_types_ext_capa_sta,
+		.extended_capabilities_len =
+				sizeof(ath11k_if_types_ext_capa_sta),
+	}, {
+		.iftype = NL80211_IFTYPE_AP,
+		.extended_capabilities = ath11k_if_types_ext_capa_ap,
+		.extended_capabilities_mask = ath11k_if_types_ext_capa_ap,
+		.extended_capabilities_len =
+				sizeof(ath11k_if_types_ext_capa_ap),
+	},
+};
+
 static int ath11k_mac_register(struct ath11k *ar)
 {
 	struct ath11k_base *ab = ar->ab;
@@ -5130,6 +5167,10 @@ static int ath11k_mac_register(struct ath11k *ar)
 	ar->hw->wiphy->cipher_suites = cipher_suites;
 	ar->hw->wiphy->n_cipher_suites = ARRAY_SIZE(cipher_suites);
 
+	ar->hw->wiphy->iftype_ext_capab = ath11k_iftypes_ext_capa;
+	ar->hw->wiphy->num_iftype_ext_capab =
+		ARRAY_SIZE(ath11k_iftypes_ext_capa);
+
 	ath11k_reg_init(ar);
 
 	ret = ieee80211_register_hw(ar->hw);
-- 
2.11.0


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
