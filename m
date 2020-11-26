Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiA4q-0006cF-4E
 for ath11k@lists.infradead.org; Thu, 26 Nov 2020 05:44:22 +0000
From: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Subject: [PATCH] ath11k: Ignore resetting peer auth flag in peer assoc cmd
Date: Thu, 26 Nov 2020 11:13:34 +0530
Message-Id: <1606369414-25211-1-git-send-email-seevalam@codeaurora.org>
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
Cc: Seevalamuthu Mariappan <seevalam@codeaurora.org>, linux-wireless@vger.kernel.org

Incase of hardware encryption, WMI_PEER_AUTH flag will be set by firmware
during install key. Since install key wont be done for software encryption
mode, firmware will not set this flag. Due to this, seeing traffic failure
in software encryption. Hence, avoid resetting peer auth flag if hardware
encryption disabled.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01421-QCAHKSWPL_SILICONZ-1

Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index bca66c1..9bd4284 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1686,7 +1686,8 @@ int ath11k_wmi_vdev_install_key(struct ath11k *ar,
 
 static inline void
 ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
-			   struct peer_assoc_params *param)
+			   struct peer_assoc_params *param,
+			   bool hw_crypto_disabled)
 {
 	cmd->peer_flags = 0;
 
@@ -1740,7 +1741,8 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 		cmd->peer_flags |= WMI_PEER_AUTH;
 	if (param->need_ptk_4_way) {
 		cmd->peer_flags |= WMI_PEER_NEED_PTK_4_WAY;
-		cmd->peer_flags &= ~WMI_PEER_AUTH;
+		if (!hw_crypto_disabled)
+			cmd->peer_flags &= ~WMI_PEER_AUTH;
 	}
 	if (param->need_gtk_2_way)
 		cmd->peer_flags |= WMI_PEER_NEED_GTK_2_WAY;
@@ -1807,7 +1809,9 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 	cmd->peer_new_assoc = param->peer_new_assoc;
 	cmd->peer_associd = param->peer_associd;
 
-	ath11k_wmi_copy_peer_flags(cmd, param);
+	ath11k_wmi_copy_peer_flags(cmd, param,
+				   test_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED,
+					    &ar->ab->dev_flags));
 
 	ether_addr_copy(cmd->peer_macaddr.addr, param->peer_mac);
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
