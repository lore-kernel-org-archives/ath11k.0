Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knmKn-0006ip-Ne
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 17:36:04 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 01/10] ath11k: mhi: hook suspend and resume
Date: Fri, 11 Dec 2020 19:35:41 +0200
Message-Id: <1607708150-21066-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
References: <1607708150-21066-1-git-send-email-kvalo@codeaurora.org>
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

From: Carl Huang <cjhuang@codeaurora.org>

MHI suspend and resume isn't hooked in ath11k yet, so hook these
functions needed for suspend support.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 11 +++++++++++
 drivers/net/wireless/ath/ath11k/mhi.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 4cf093718888..72aa39afc04c 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -418,8 +418,10 @@ static int ath11k_mhi_set_state(struct ath11k_pci *ab_pci,
 		ret = 0;
 		break;
 	case ATH11K_MHI_SUSPEND:
+		ret = mhi_pm_suspend(ab_pci->mhi_ctrl);
 		break;
 	case ATH11K_MHI_RESUME:
+		ret = mhi_pm_resume(ab_pci->mhi_ctrl);
 		break;
 	case ATH11K_MHI_TRIGGER_RDDM:
 		ret = mhi_force_rddm_mode(ab_pci->mhi_ctrl);
@@ -470,3 +472,12 @@ void ath11k_mhi_stop(struct ath11k_pci *ab_pci)
 	ath11k_mhi_set_state(ab_pci, ATH11K_MHI_DEINIT);
 }
 
+void ath11k_mhi_suspend(struct ath11k_pci *ab_pci)
+{
+	ath11k_mhi_set_state(ab_pci, ATH11K_MHI_SUSPEND);
+}
+
+void ath11k_mhi_resume(struct ath11k_pci *ab_pci)
+{
+	ath11k_mhi_set_state(ab_pci, ATH11K_MHI_RESUME);
+}
diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wireless/ath/ath11k/mhi.h
index a7fd5e201d18..488dada5d31c 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.h
+++ b/drivers/net/wireless/ath/ath11k/mhi.h
@@ -36,4 +36,7 @@ void ath11k_mhi_unregister(struct ath11k_pci *ar_pci);
 void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab);
 void ath11k_mhi_clear_vector(struct ath11k_base *ab);
 
+void ath11k_mhi_suspend(struct ath11k_pci *ar_pci);
+void ath11k_mhi_resume(struct ath11k_pci *ar_pci);
+
 #endif
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
