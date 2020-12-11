Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knbPj-0005Ya-2t
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 05:56:24 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH] ath11k: fix crash caused by NULL rx_channel
Date: Fri, 11 Dec 2020 00:56:13 -0500
Message-Id: <20201211055613.9310-1-cjhuang@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

During connect and disconnect stress test, crashed happened
because ar->rx_channel is NULL. Fix it by checking whether
ar->rx_channel is NULL.

Crash stack is as below:
RIP: 0010:ath11k_dp_rx_h_ppdu+0x110/0x230 [ath11k]
[ 5028.808963]  ath11k_dp_rx_wbm_err+0x14a/0x360 [ath11k]
[ 5028.808970]  ath11k_dp_rx_process_wbm_err+0x41c/0x520 [ath11k]
[ 5028.808978]  ath11k_dp_service_srng+0x25e/0x2d0 [ath11k]
[ 5028.808982]  ath11k_pci_ext_grp_napi_poll+0x23/0x80 [ath11k_pci]
[ 5028.808986]  net_rx_action+0x27e/0x400
[ 5028.808990]  __do_softirq+0xfd/0x2bb
[ 5028.808993]  irq_exit+0xa6/0xb0
[ 5028.808995]  do_IRQ+0x56/0xe0
[ 5028.808997]  common_interrupt+0xf/0xf

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 2bcaf23f..17c37e2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2295,6 +2295,7 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 {
 	u8 channel_num;
 	u32 center_freq;
+	struct ieee80211_channel *channel;
 
 	rx_status->freq = 0;
 	rx_status->rate_idx = 0;
@@ -2315,9 +2316,12 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 		rx_status->band = NL80211_BAND_5GHZ;
 	} else {
 		spin_lock_bh(&ar->data_lock);
-		rx_status->band = ar->rx_channel->band;
-		channel_num =
-			ieee80211_frequency_to_channel(ar->rx_channel->center_freq);
+		channel = ar->rx_channel;
+		if (channel) {
+			rx_status->band = channel->band;
+			channel_num =
+				ieee80211_frequency_to_channel(channel->center_freq);
+		}
 		spin_unlock_bh(&ar->data_lock);
 		ath11k_dbg_dump(ar->ab, ATH11K_DBG_DATA, NULL, "rx_desc: ",
 				rx_desc, sizeof(struct hal_rx_desc));
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
