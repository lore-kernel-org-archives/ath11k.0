Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnOdn-0003Uw-QC
 for ath11k@lists.infradead.org; Tue, 16 Jul 2019 14:41:17 +0000
From: Sriram R <srirrama@codeaurora.org>
Subject: [PATCH] ath11k: Fix enabling dynamic bandwidth param
Date: Tue, 16 Jul 2019 20:10:59 +0530
Message-Id: <1563288059-2753-1-git-send-email-srirrama@codeaurora.org>
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

Currently the dynamic bandwidth pdev param is not enabled.
Correct the parameter passed to enable this feature. This
is required to dynamically switch bandwidth, for eg. when
noise in injected in secondary channel of a 40MHz channel
the fw will switch to 20MHz when this feature is enabled.

Signed-off-by: Sriram R <srirrama@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index dd164b5..3dc0615 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3505,7 +3505,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 		goto err;
 	}
 
-	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_DYNAMIC_BW, 0,
+	ret = ath11k_wmi_pdev_set_param(ar, WMI_PDEV_PARAM_DYNAMIC_BW, 1,
 					pdev->pdev_id);
 	if (ret) {
 		ath11k_err(ar->ab, "failed to enable dynamic bw: %d\n", ret);
-- 
2.7.4


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
