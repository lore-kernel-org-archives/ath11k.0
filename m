Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifgSI-0002A6-A1
 for ath11k@lists.infradead.org; Fri, 13 Dec 2019 08:37:47 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH V3 2/9] ath11k: disable PS for STA interfaces by default upon
 bringup
Date: Fri, 13 Dec 2019 09:37:27 +0100
Message-Id: <20191213083734.22471-3-john@phrozen.org>
In-Reply-To: <20191213083734.22471-1-john@phrozen.org>
References: <20191213083734.22471-1-john@phrozen.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

After applying this setting the TX performance issue of STA interfaces is
gone and we can see TX performance go up to ~900mbit on HE80.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 978d8768d68a..d9b4c95019e5 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4097,6 +4097,13 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 				    arvif->vdev_id, ret);
 			goto err_peer_del;
 		}
+
+		ret = ath11k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, false);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to disable vdev %d ps mode: %d\n",
+				    arvif->vdev_id, ret);
+			goto err_peer_del;
+		}
 		break;
 	default:
 		break;
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
