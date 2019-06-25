Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfkE8-0002OF-Po
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 12:07:10 +0000
From: Govindaraj Saminathan <gsamin@codeaurora.org>
Subject: [PATCH] ath11k: adding return variable in ath11k_qmi_firmware_stop
Date: Tue, 25 Jun 2019 17:36:56 +0530
Message-Id: <1561464416-20553-1-git-send-email-gsamin@codeaurora.org>
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
Cc: Govindaraj Saminathan <gsamin@codeaurora.org>

adding return variable in ath11k_qmi_firmware_stop to check
the status of mode_off command.

Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index eb86fae..f735b7f 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2110,7 +2110,10 @@ static int ath11k_qmi_wlanfw_wlan_cfg_send(struct ath11k_base *ab)
 
 void ath11k_qmi_firmware_stop(struct ath11k_base *ab)
 {
-	if (ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_OFF) < 0) {
+	int ret;
+
+	ret = ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_OFF);
+	if (ret < 0) {
 		ath11k_warn(ab, "qmi failed to send wlan mode off\n");
 		return;
 	}
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
