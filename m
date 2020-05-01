Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jULBt-0003jM-6s
 for ath11k@lists.infradead.org; Fri, 01 May 2020 02:14:14 +0000
Date: Fri, 1 May 2020 10:14:03 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] ath11k: ath11k_mac_get_tx_mcs_map() can be static
Message-ID: <20200501021403.GA34224@2ec9c934b904>
References: <20200429145708.25992-3-john@phrozen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429145708.25992-3-john@phrozen.org>
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
To: John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, kbuild-all@lists.01.org, ath11k@lists.infradead.org


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ad05409783c05..c8acdc1e33353 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5285,7 +5285,7 @@ ath11k_mac_has_single_legacy_rate(struct ath11k *ar,
 	return num_rates == 1;
 }
 
-u16 ath11k_mac_get_tx_mcs_map(const struct ieee80211_sta_he_cap *he_cap)
+static u16 ath11k_mac_get_tx_mcs_map(const struct ieee80211_sta_he_cap *he_cap)
 {
 	if (he_cap->he_cap_elem.phy_cap_info[0] &
 	    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
