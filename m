Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgkH1-0003wl-Kx
 for ath11k@lists.infradead.org; Thu, 04 Jun 2020 07:26:48 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 11/12] ath11k: set beacon tx mode
Date: Thu,  4 Jun 2020 09:09:51 +0200
Message-Id: <20200604070952.15481-12-john@phrozen.org>
In-Reply-To: <20200604070952.15481-1-john@phrozen.org>
References: <20200604070952.15481-1-john@phrozen.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

The beacon can be sent out in staggered or burst mode. Set this mode
according to what mac80211 tells us to use whenever the beacon changes.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 63099607065b..8ec11c654b3e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1907,6 +1907,8 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_BEACON) {
 		param_id = WMI_PDEV_PARAM_BEACON_TX_MODE;
 		param_value = WMI_BEACON_STAGGERED_MODE;
+		if (info->beacon_tx_mode == NL80211_BEACON_TX_MODE_BURST)
+			param_value = WMI_BEACON_BURST_MODE;
 		ret = ath11k_wmi_pdev_set_param(ar, param_id,
 						param_value, ar->pdev->pdev_id);
 		if (ret)
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
