Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT36S-0003DX-0M
 for ath11k@lists.infradead.org; Thu, 15 Oct 2020 13:15:33 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH 1/2] dt: bindings: add new dt entry for ath11k calibration
 variant
Date: Thu, 15 Oct 2020 15:15:00 +0200
Message-Id: <20201015131501.1939685-1-sven@narfation.org>
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
To: linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, Sven Eckelmann <sven@narfation.org>, Rob Herring <robh+dt@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

The bus + qmi-chip-id + qmi-board-id is not enough to identify the correct
board data file on IPQ6018 based devices. Multiple different boards share
the same values. Only the original reference designs can currently be
identified and loaded from the board-2.bin. But these will not result in
the correct calibration data when combined with the pre-calibration data
from the device.

An additional "variant" information has to be provided to select the
correct board data for a design which was modified by an ODM. This follows
the same approach as ath10k.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 4b365c9d9378..6af999191559 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -144,6 +144,12 @@ properties:
         * reg
         * reg-names
 
+  qcom,ath11k-calibration-variant:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      string to uniquely identify variant of the calibration data in the
+      board-2.bin for designs with colliding bus and device specific ids
+
 required:
   - compatible
   - reg
-- 
2.28.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
