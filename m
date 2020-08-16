Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7BGh-00075E-Gy
 for ath11k@lists.infradead.org; Sun, 16 Aug 2020 05:31:45 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 4/9] ath11k: refine the phy_id check in
 ath11k_reg_chan_list_event
Date: Sun, 16 Aug 2020 08:31:26 +0300
Message-Id: <1597555891-26112-5-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
References: <1597555891-26112-1-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

For QCA6390, it processes the reg chan list event only for phy0,
and it goes to fallback if the phy_id is not valid. For a valid
phy_id but not 0, just discard the event.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 4e100407fea6..a66576f78af2 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5463,7 +5463,12 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 	pdev_idx = reg_info->phy_id;
 
 	if (pdev_idx >= ab->num_radios) {
-		if (ab->hw_params.single_pdev_only)
+		/* Process the event for phy0 only if single_pdev_only
+		 * is true. If pdev_idx is valid but not 0, discard the
+		 * event. Otherwise, it goes to fallback.
+		 */
+		if (ab->hw_params.single_pdev_only &&
+		    pdev_idx < ab->hw_params.num_rxmda_per_pdev)
 			goto mem_free;
 		else
 			goto fallback;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
