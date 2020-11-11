Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcnXF-0006LP-35
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 10:39:31 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH v2] ath11k: Fix the rx_filter flag setting for peer rssi stats
Date: Wed, 11 Nov 2020 16:08:37 +0530
Message-Id: <1605091117-11005-1-git-send-email-mkenna@codeaurora.org>
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
To: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>

Set the rx_filter in ath11k_mac_config_mon_status_default(),
only when the rx_filter value exists in ath11k_debug_rx_filter().

Without this change, rx_filter gets set to 0 and peer rssi stats
aren't updating properly from firmware.

Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01230-QCAHKSWPL_SILICONZ-4

Fixes: ec48d28ba291 ("ath11k: Fix rx_filter flags setting for per peer rx_stats")

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---

    V2: Added the "Fixes" tag in the commit message.

 drivers/net/wireless/ath/ath11k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 591dceb..cad4402 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4144,7 +4144,8 @@ static int ath11k_mac_config_mon_status_default(struct ath11k *ar, bool enable)
 
 	if (enable) {
 		tlv_filter = ath11k_mac_mon_status_filter_default;
-		tlv_filter.rx_filter = ath11k_debugfs_rx_filter(ar);
+		if (ath11k_debugfs_rx_filter(ar))
+			tlv_filter.rx_filter = ath11k_debugfs_rx_filter(ar);
 	}
 
 	for (i = 0; i < ab->hw_params.num_rxmda_per_pdev; i++) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
