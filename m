Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69A9-0006cf-0m
 for ath11k@lists.infradead.org; Thu, 13 Aug 2020 09:04:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH 01/10] ath11k: do not depend on ARCH_QCOM for ath11k
Date: Thu, 13 Aug 2020 12:04:17 +0300
Message-Id: <1597309466-19688-2-git-send-email-kvalo@codeaurora.org>
In-Reply-To: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
References: <1597309466-19688-1-git-send-email-kvalo@codeaurora.org>
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

With only IPQ8074 supported ath11k was only usable on Qualcomm architectures.
But now that we are adding QCA6390 PCI support to ath11k that's not the case
anymore and it can be used on any architecture supporting PCI. So remove the
dependency on ARCH_QCOM. After that there is also no need to depend on
COMPILE_TEST.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
index 88a97356f0a1..0fd44d83e0e9 100644
--- a/drivers/net/wireless/ath/ath11k/Kconfig
+++ b/drivers/net/wireless/ath/ath11k/Kconfig
@@ -4,7 +4,6 @@ config ATH11K
 	depends on MAC80211 && HAS_DMA
 	depends on REMOTEPROC
 	depends on CRYPTO_MICHAEL_MIC
-	depends on ARCH_QCOM || COMPILE_TEST
 	select ATH_COMMON
 	select QCOM_QMI_HELPERS
 	help
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
