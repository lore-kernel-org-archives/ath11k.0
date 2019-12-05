Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ickbJ-0000az-2Z
 for ath11k@lists.infradead.org; Thu, 05 Dec 2019 06:26:58 +0000
From: John Crispin <john@phrozen.org>
Subject: [PATCH 2/2] ath11k: explicitly cast wmi commands to their correct
 struct type
Date: Thu,  5 Dec 2019 07:26:45 +0100
Message-Id: <20191205062645.6033-2-john@phrozen.org>
In-Reply-To: <20191205062645.6033-1-john@phrozen.org>
References: <20191205062645.6033-1-john@phrozen.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

Three of the WMI command handlers were not casting to the right data type.
Lets make the code consistent with the other handlers.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index a2f03360e19f..0c1064a0aa39 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2517,7 +2517,7 @@ ath11k_wmi_send_twt_enable_cmd(struct ath11k *ar, u32 pdev_id)
 	if (!skb)
 		return -ENOMEM;
 
-	cmd = (void *)skb->data;
+	cmd = (struct wmi_twt_enable_params_cmd *)skb->data;
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_ENABLE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
 	cmd->pdev_id = pdev_id;
@@ -2568,7 +2568,7 @@ ath11k_wmi_send_twt_disable_cmd(struct ath11k *ar, u32 pdev_id)
 	if (!skb)
 		return -ENOMEM;
 
-	cmd = (void *)skb->data;
+	cmd = (struct wmi_twt_disable_params_cmd *)skb->data;
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_TWT_DISABLE_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
 	cmd->pdev_id = pdev_id;
@@ -2768,7 +2768,7 @@ ath11k_wmi_send_obss_spr_cmd(struct ath11k *ar, u32 vdev_id,
 	if (!skb)
 		return -ENOMEM;
 
-	cmd = (void *)skb->data;
+	cmd = (struct wmi_obss_spatial_reuse_params_cmd *)skb->data;
 	cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG,
 				     WMI_TAG_OBSS_SPATIAL_REUSE_SET_CMD) |
 			  FIELD_PREP(WMI_TLV_LEN, len - TLV_HDR_SIZE);
-- 
2.20.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
