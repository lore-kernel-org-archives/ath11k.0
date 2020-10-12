Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRutk-0007sc-FG
 for ath11k@lists.infradead.org; Mon, 12 Oct 2020 10:17:45 +0000
From: Carl Huang <cjhuang@codeaurora.org>
Subject: [PATCH] ath11k: fix ZERO address in probe request
Date: Mon, 12 Oct 2020 18:17:33 +0800
Message-Id: <20201012101733.24137-1-cjhuang@codeaurora.org>
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
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Host needs to pass at least on bssid with all 0xff to firmware in
WMI_START_SCAN_CMDID, otherwise the bssid and receiver address
in probe requeste are all ZEROs.

This also fixed some hidden AP connection issue because some AP
doesn't respond to probe request which receiver address are all
ZEROs.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index adde14a390ec..9e56544e2cb9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1946,6 +1946,11 @@ void ath11k_wmi_start_scan_init(struct ath11k *ar,
 				  WMI_SCAN_EVENT_DEQUEUED;
 	arg->scan_flags |= WMI_SCAN_CHAN_STAT_EVENT;
 	arg->num_bssid = 1;
+	/* fill bssid_list[0] with 0xff, otherwise
+	 * bssid and RA will be ZEROs in probe request.
+	 */
+	eth_broadcast_addr(arg->bssid_list[0].addr);
+
 }
 
 static inline void
-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
