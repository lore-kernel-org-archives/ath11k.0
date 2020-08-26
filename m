Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAtjA-0006ew-Kv
 for ath11k@lists.infradead.org; Wed, 26 Aug 2020 11:36:29 +0000
Date: Wed, 26 Aug 2020 14:34:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH net-next] ath11k: return -ENOMEM on allocation failure
Message-ID: <20200826113417.GE393664@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Jakub Kicinski <kuba@kernel.org>, kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Returning PTR_ERR(NULL) means success, but we should return -ENOMEM.

Fixes: 1399fb87ea3e ("ath11k: register MHI controller device for QCA6390")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index d7e60dc5b300..aded9a719d51 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -220,7 +220,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 
 	mhi_ctrl = kzalloc(sizeof(*mhi_ctrl), GFP_KERNEL);
 	if (!mhi_ctrl)
-		return PTR_ERR(mhi_ctrl);
+		return -ENOMEM;
 
 	ath11k_core_create_firmware_path(ab, ATH11K_AMSS_FILE,
 					 ab_pci->amss_path,
-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
