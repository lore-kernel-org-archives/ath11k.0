Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf4s7-0003n9-2G
 for ath11k@lists.infradead.org; Tue, 17 Nov 2020 17:34:29 +0000
From: Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [RESEND PATCH] ath11k: use MHI provided APIs to allocate and free MHI
 controller
Date: Tue, 17 Nov 2020 09:33:56 -0800
Message-Id: <1605634436-36506-1-git-send-email-bbhatt@codeaurora.org>
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
To: kvalo@codeaurora.org, linux-wireless@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>, linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org, ath11k@lists.infradead.org

Use MHI provided APIs to allocate and free MHI controller to
improve MHI host driver handling. This also fixes a memory leak
as the MHI controller was allocated but never freed.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index aded9a7..1c9d9dc 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -218,7 +218,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	struct mhi_controller *mhi_ctrl;
 	int ret;
 
-	mhi_ctrl = kzalloc(sizeof(*mhi_ctrl), GFP_KERNEL);
+	mhi_ctrl = mhi_alloc_controller();
 	if (!mhi_ctrl)
 		return -ENOMEM;
 
@@ -234,7 +234,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	ret = ath11k_mhi_get_msi(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to get msi for mhi\n");
-		kfree(mhi_ctrl);
+		mhi_free_controller(mhi_ctrl);
 		return ret;
 	}
 
@@ -252,7 +252,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	ret = mhi_register_controller(mhi_ctrl, &ath11k_mhi_config);
 	if (ret) {
 		ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
-		kfree(mhi_ctrl);
+		mhi_free_controller(mhi_ctrl);
 		return ret;
 	}
 
@@ -265,6 +265,7 @@ void ath11k_mhi_unregister(struct ath11k_pci *ab_pci)
 
 	mhi_unregister_controller(mhi_ctrl);
 	kfree(mhi_ctrl->irq);
+	mhi_free_controller(mhi_ctrl);
 }
 
 static char *ath11k_mhi_state_to_str(enum ath11k_mhi_state mhi_state)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
