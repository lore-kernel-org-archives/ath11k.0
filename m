Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZBYf-0006nl-4q
 for ath11k@lists.infradead.org; Fri, 07 Jun 2019 09:53:14 +0000
From: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Subject: [PATCH] ath11k: fix PMF config during peer assoc
Date: Fri,  7 Jun 2019 15:23:01 +0530
Message-Id: <1559901181-8292-1-git-send-email-mpubbise@codeaurora.org>
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
Cc: Manikanta Pubbisetty <mpubbise@codeaurora.org>

Currently, PMF config for peers is not being sent to the
firmware in peer assoc command. As a result, in cases where
PMF is enabled, there would be mismatch in configuration
between host software and the firmware, eventually leading
to packet drops in mac80211.

Fix it by setting appropriate PMF flags during peer assoc.

Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 2fb9941..0f875ed 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1683,6 +1683,10 @@ ath11k_wmi_copy_peer_flags(struct wmi_peer_assoc_complete_cmd *cmd,
 	if (param->safe_mode_enabled)
 		cmd->peer_flags &= ~(WMI_PEER_NEED_PTK_4_WAY |
 				     WMI_PEER_NEED_GTK_2_WAY);
+
+	if (param->is_pmf_enabled)
+		cmd->peer_flags |= WMI_PEER_PMF;
+
 	/* Disable AMSDU for station transmit, if user configures it */
 	/* Disable AMSDU for AP transmit to 11n Stations, if user configures
 	 * it
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
