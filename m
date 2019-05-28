Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVk1p-0003vx-20
 for ath11k@lists.infradead.org; Tue, 28 May 2019 21:53:06 +0000
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: [PATCH 3/4] ath11k: fix multicast txrx for secure 11s mesh support
Date: Tue, 28 May 2019 14:52:55 -0700
Message-Id: <1559080376-26817-4-git-send-email-pradeepc@codeaurora.org>
In-Reply-To: <1559080376-26817-1-git-send-email-pradeepc@codeaurora.org>
References: <1559080376-26817-1-git-send-email-pradeepc@codeaurora.org>
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

setting MESH_MCAST_ENABLE wmi param is necessary for txrx of multicast
action frames in 11s mesh.

Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c78c1481fe7f..9730c077149a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3373,6 +3373,14 @@ static int ath11k_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
+	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_MESH_MCAST_ENABLE,
+					1, pdev->pdev_id);
+
+	if (ret) {
+		ath11k_err(ar->ab, "failed to enable MESH MCAST ENABLE: (%d\n", ret);
+		goto err;
+	}
+
 	__ath11k_set_antenna(ar, ar->cfg_tx_chainmask, ar->cfg_rx_chainmask);
 
 	/* TODO: Do we need to enable ANI? */
-- 
2.1.2


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
