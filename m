Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ0VW-00058S-UB
 for ath11k@lists.infradead.org; Tue, 23 Apr 2019 18:51:08 +0000
From: Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH] ath11k/dt: remoteproc entry update to device tree binding doc
Date: Wed, 24 Apr 2019 00:20:55 +0530
Message-Id: <1556045455-3922-1-git-send-email-akolli@codeaurora.org>
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

ath11k uses q6v5-wcss device tree entry as rempoteproc
dts entry to boot q6v5-wcss.

Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qcom,ath11k.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt b/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt
index 6b8a276115f1..3e00f470751b 100644
--- a/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt
+++ b/drivers/net/wireless/ath/ath11k/qcom,ath11k.txt
@@ -14,6 +14,7 @@ Optional properties:
 		   names.
 - qcom,tgt-mem-mode: Target memory mode used to select BDF Address
 - qcom,bdf-addr: List of BDF address used to configure for the device
+- qcom,rproc: DT entry of q6v5-wcss
 
 Example:
 
@@ -126,4 +127,5 @@ wifi0: wifi@c000000 {
 			  "tcl2host-status-ring";
 	qcom,tgt-mem-mode = <0>;
 	qcom,bdf-addr = <0x4BE00000 0x4BE00000>;
+	qcom,rproc = <&qcom_q6v5_wcss>;
 };
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
