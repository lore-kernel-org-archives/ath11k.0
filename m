Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNv0H-00069i-Ig
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 09:36:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 3/8] ath11k: set WMI pipe credit to 1 for QCA6390
Date: Thu,  1 Oct 2020 12:34:45 +0300
Message-Id: <1601544890-13450-4-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
References: <1601544890-13450-1-git-send-email-kvalo@codeaurora.org>
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

For QCA6390, set wmi credit to 1 to avoid back-to-back write to
shadow register when shadow register is enabled.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/htc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 4de2350dfbf3..6b57dc273e0b 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -515,6 +515,12 @@ int ath11k_htc_wait_target(struct ath11k_htc *htc)
 		return -ECOMM;
 	}
 
+	/* For QCA6390, wmi endpoint uses 1 credit to avoid
+	 * back-to-back write.
+	 */
+	if (ab->hw_params.supports_shadow_regs)
+		htc->total_transmit_credits = 1;
+
 	ath11k_htc_setup_target_buffer_assignments(htc);
 
 	return 0;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
