Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcuZ7-0005nx-GR
 for ath11k@lists.infradead.org; Mon, 17 Jun 2019 16:33:06 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: kvalo@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E718F60C60
 for <ath11k@lists.infradead.org>; Mon, 17 Jun 2019 16:33:02 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/5] ath11k: 'static' is not at beginning of declaration
 [-Wold-style-declaration]
Date: Mon, 17 Jun 2019 19:32:55 +0300
Message-Id: <1560789179-3857-1-git-send-email-kvalo@codeaurora.org>
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
To: ath11k@lists.infradead.org

Fix gcc W=1 warnings:

drivers/net/wireless/ath/ath11k/mac.c:5375:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
drivers/net/wireless/ath/ath11k/mac.c:5380:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
drivers/net/wireless/ath/ath11k/mac.c:5386:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
drivers/net/wireless/ath/ath11k/mac.c:5392:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 919668967ef6..ab71e121e107 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5372,24 +5372,24 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 	return 0;
 }
 
-const static u8 ath11k_if_types_ext_capa[] = {
+static const u8 ath11k_if_types_ext_capa[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 };
 
-const static u8 ath11k_if_types_ext_capa_sta[] = {
+static const u8 ath11k_if_types_ext_capa_sta[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_REQUESTER_SUPPORT,
 };
 
-const static u8 ath11k_if_types_ext_capa_ap[] = {
+static const u8 ath11k_if_types_ext_capa_ap[] = {
 	[0] = WLAN_EXT_CAPA1_EXT_CHANNEL_SWITCHING,
 	[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
 	[9] = WLAN_EXT_CAPA10_TWT_RESPONDER_SUPPORT,
 };
 
-const static struct wiphy_iftype_ext_capab ath11k_iftypes_ext_capa[] = {
+static const struct wiphy_iftype_ext_capab ath11k_iftypes_ext_capa[] = {
 	{
 		.extended_capabilities = ath11k_if_types_ext_capa,
 		.extended_capabilities_mask = ath11k_if_types_ext_capa,
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
