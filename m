Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSznT-00023v-1v
 for ath11k@lists.infradead.org; Fri, 08 Nov 2019 08:39:12 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: add necessary peer assoc params in wmi dbg
Date: Fri,  8 Nov 2019 14:08:57 +0530
Message-Id: <1573202337-15300-1-git-send-email-srirrama@codeaurora.org>
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
Cc: Sriram R <srirrama@codeaurora.org>

Add necessary peer assoc params in WMI debug message
while sending the peer assoc command to firmware
to aid in debugging.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index ccebf7c..13531e1 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1804,8 +1804,17 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 	}
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
-		   "WMI peer assoc vdev id %d assoc id %d peer mac %pM\n",
-		   param->vdev_id, param->peer_associd, param->peer_mac);
+		   "wmi peer assoc vdev id %d assoc id %d peer mac %pM peer_flags %x rate_caps %x peer_caps %x listen_intval %d ht_caps %x max_mpdu %d nss %d phymode %d peer_mpdu_density %d vht_caps %x he cap_info %x he ops %x he cap_info_ext %x he phy %x %x %x peer_bw_rxnss_override %x\n",
+		   cmd->vdev_id, cmd->peer_associd, param->peer_mac,
+		   cmd->peer_flags, cmd->peer_rate_caps, cmd->peer_caps,
+		   cmd->peer_listen_intval, cmd->peer_ht_caps,
+		   cmd->peer_max_mpdu, cmd->peer_nss, cmd->peer_phymode,
+		   cmd->peer_mpdu_density,
+		   cmd->peer_vht_caps, cmd->peer_he_cap_info,
+		   cmd->peer_he_ops, cmd->peer_he_cap_info_ext,
+		   cmd->peer_he_cap_phy[0], cmd->peer_he_cap_phy[1],
+		   cmd->peer_he_cap_phy[2],
+		   cmd->peer_bw_rxnss_override);
 
 	return ret;
 }
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
