Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZxzz-0002On-LW
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 14:08:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 05/10] ath11k: avoid burst time conversion logic
Date: Wed, 27 Nov 2019 14:08:53 +0000
Message-ID: <0101016ead3181e4-d4de39ee-5280-49cd-aaaf-6a8e5f2b3249-000000@us-west-2.amazonses.com>
In-Reply-To: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
References: <1574863720-25728-1-git-send-email-kvalo@codeaurora.org>
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
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

WMI_VDEV_SET_WMM_PARAMS commmand expects the txoplimit param in the units of
32 microseconds. convert the txop unit from 32 microseconds to absolute
microseconds leads to the higher burst values which is incorrect. so no need
to convert the txop unit from 32 microseconds to absolute microseconds.

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6f82fdbbd358..412c258143ca 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3023,12 +3023,7 @@ static int ath11k_mac_op_conf_tx(struct ieee80211_hw *hw,
 	p->cwmin = params->cw_min;
 	p->cwmax = params->cw_max;
 	p->aifs = params->aifs;
-
-	/* The channel time duration programmed in the HW is in absolute
-	 * microseconds, while mac80211 gives the txop in units of
-	 * 32 microseconds.
-	 */
-	p->txop = params->txop * 32;
+	p->txop = params->txop;
 
 	ret = ath11k_wmi_send_wmm_update_cmd_tlv(ar, arvif->vdev_id,
 						 &arvif->wmm_params);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
