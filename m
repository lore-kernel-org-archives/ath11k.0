Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLfC7-0006Ql-UN
 for ath11k@lists.infradead.org; Wed, 01 May 2019 02:42:05 +0000
From: Miles Hu <milehu@codeaurora.org>
Subject: [PATCH v3] ath11k: Fix downlink MU-MIMO
Date: Tue, 30 Apr 2019 19:41:56 -0700
Message-Id: <1556678516-12844-1-git-send-email-milehu@codeaurora.org>
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
Cc: Miles Hu <milehu@codeaurora.org>

In vdev start command, prefer tx and rx streams are mandatory to enable DL MU-MIMO.
Tested only on 11ac mode.

Signed-off-by: Miles Hu <milehu@codeaurora.org>
---
V2:
 - remove 11ac mode from the subject.

V3:
 - clarify the fix for downlink mu-mimo and mention the consequence of not set the 
   value in the comment.

 drivers/net/wireless/ath/ath11k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index ddb8beb..3f888c0 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3863,6 +3863,9 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 	arg.channel.max_reg_power = chandef->chan->max_reg_power * 2;
 	arg.channel.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
 
+	arg.pref_tx_streams = ar->num_tx_chains;
+	arg.pref_rx_streams = ar->num_rx_chains;
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		arg.ssid = arvif->u.ap.ssid;
 		arg.ssid_len = arvif->u.ap.ssid_len;
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
