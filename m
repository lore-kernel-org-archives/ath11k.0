Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMZh-0001U7-5f
 for ath11k@lists.infradead.org; Thu, 10 Dec 2020 14:05:44 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 1/6] ath11k: mhi: print a warning if firmware crashed
Date: Thu, 10 Dec 2020 16:05:19 +0200
Message-Id: <1607609124-17250-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
References: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org

There was no way to detect if the firmware crashed so add a warning. At the
moment the firmware is not restarted or anything like that, so when this
happens ath11k modules need to be reloaded.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 47a1ce1bee4f..4cf093718888 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -190,6 +190,15 @@ static void ath11k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
 static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 				    enum mhi_callback cb)
 {
+	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+
+	switch (cb) {
+	case MHI_CB_SYS_ERROR:
+		ath11k_warn(ab, "firmware crashed: MHI_CB_SYS_ERROR\n");
+		break;
+	default:
+		break;
+	}
 }
 
 static int ath11k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
