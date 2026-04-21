Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BD6F94CA7
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WoUQ5nI8I3SGMkEO2JMah2WATrl+egwzYDp4cP2mLeU=; b=Bef1+lgNiCcOqhVy6uNDc9IBaH
	Ym09gprkTiqbl6wKZLe3r1YMgfzlaDoOfKy3LmCg22S1371Nl7SaUIcKAwYBY2huYKSjJCm5UZBCO
	aMNloT1wIdOG49nvZT/5Wx1lksmqwU8tlxWdY5lUOj7hKXqR/n6dDXloYkEK1/7gqmDZUFO33HdUH
	Z1ymULXob/z6jlwAK5BO77jNEPSkMatdDPBvn3XVKOLNoghDOhMcgZSYZbvdfZc3s1QubwG/Cfj/B
	I90+HlwO2etALnZPbH8zyZx62FKDfpWuxZdjJ5IbqPv9VtgwGMw0Z8K0DEsQfNiepyZxtKrYot5o0
	N/KH+wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHFN-000000096JF-3k1J;
	Tue, 21 Apr 2026 19:59:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFHFM-000000096J1-18eF;
	Tue, 21 Apr 2026 19:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31E7161333;
	Tue, 21 Apr 2026 19:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B756C2BCB0;
	Tue, 21 Apr 2026 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776801538;
	bh=6Y3XJTx7QfULoZhyBK7B6XVakPKj7Nc4iKBX0gVaDyQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QDyyT/G8eZH50ql5rjOLdalKdIqZE2fgMeHyyuy67vpqrYy+KhkwUuA/0xdO00XVl
	 Vfx1OeFBwa6Ssr5eIjztzSOos+9xfG8Vkp/EVQHXKCnNlqVAx1f8O5kKRcY4tRK0wx
	 Fy47U2hZXsEsHQaXu8SFJpMDLdICx/1SZ5j9ZyEvtTVvlRy/eiajhjsz5CuPG2UmVD
	 Pajh++oAgO3eUkWIFUawc6HbdS9mLh/w1vAUHaCSAx2mUVCbEO8WyarGbjkCkjSEle
	 ryJP2M2scBaHs85zbgfXy4jFugN+BqjkSaBkPOITh2/5bPniMWJxXYdWXzCqm3B6qi
	 jkzWBcBv/lEbQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yang Xiwen <forbidden405@outlook.com>,
	Alex Elder <elder@kernel.org>,
	Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: Fix phandle-array constraints, again
Date: Tue, 21 Apr 2026 14:55:25 -0500
Message-ID: <20260421195836.1547469-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The unfortunately named 'phandle-array' property type is really a matrix
with phandle and fixed arg cells entries. A matrix property should have 2
levels of items constraints.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Can someone from QCom provide some descriptions for 'qcom,smem-states'
properties.
---
 .../display/rockchip/rockchip,rk3399-cdn-dp.yaml         | 2 ++
 .../bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml      | 7 ++++---
 Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml | 6 ++++++
 Documentation/devicetree/bindings/net/qcom,ipa.yaml      | 6 ++++++
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 5 ++++-
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 5 ++++-
 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml         | 9 +++++++++
 .../devicetree/bindings/pci/toshiba,tc9563.yaml          | 5 +++--
 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml        | 3 +++
 .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml        | 3 +++
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml  | 4 ++++
 .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml        | 4 ++++
 .../bindings/remoteproc/qcom,sc7180-mss-pil.yaml         | 3 +++
 .../bindings/remoteproc/qcom,sc7280-adsp-pil.yaml        | 3 +++
 .../bindings/remoteproc/qcom,sc7280-mss-pil.yaml         | 3 +++
 .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml        | 3 +++
 .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml        | 3 +++
 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml   | 3 +++
 Documentation/devicetree/bindings/sound/samsung,tm2.yaml | 2 ++
 .../devicetree/bindings/spi/st,stm32mp25-ospi.yaml       | 5 +++--
 .../devicetree/bindings/usb/chipidea,usb2-common.yaml    | 2 ++
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml  | 7 ++++---
 22 files changed, 81 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
index 1a33128e77f5..195f665970bf 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -41,7 +41,9 @@ properties:
     minItems: 1
     items:
       - description: Extcon device providing the cable state for DP PHY device 0
+        maxItems: 1
       - description: Extcon device providing the cable state for DP PHY device 1
+        maxItems: 1
     description:
       List of phandle to the extcon device providing the cable state for the DP PHY.
 
diff --git a/Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml
index 41c9b22523e7..e447579e0f22 100644
--- a/Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml
@@ -39,10 +39,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
       DWMMC core on Hi3798MV2x SoCs has a delay-locked-loop(DLL) attached to card data input path.
-      It is integrated into CRG core on the SoC and has to be controlled during tuning.
+      It is integrated into CRG core on the SoC and has to be controlled during tuning
     items:
-      - description: A phandle pointed to the CRG syscon node
-      - description: Sample DLL register offset in CRG address space
+      - items:
+          - description: A phandle pointed to the CRG syscon node
+          - description: Sample DLL register offset in CRG address space
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index b30544410d09..e47e1e09300a 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -42,7 +42,13 @@ properties:
     description: State bits used by the AP to signal the modem.
     items:
       - description: Power control
+        items:
+          - description: Phandle to ???
+          - description: ???
       - description: Power control acknowledgment
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: Names for the state bits used by the AP to signal the modem.
diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index c7f5f2ef7452..c53f63068b77 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -123,7 +123,13 @@ properties:
     description: State bits used in by the AP to signal the modem.
     items:
       - description: Whether the "ipa-clock-enabled" state bit is valid
+        items:
+          - description: Phandle to ???
+          - description: ???
       - description: Whether the IPA clock is enabled (if valid)
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index f2440d39b7eb..5c580bc7df08 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -158,7 +158,10 @@ properties:
     description: State bits used by the AP to signal the WLAN Q6.
     items:
       - description: Signal bits used to enable/disable low power mode
-                     on WCN in the case of WoW (Wake on Wireless).
+          on WCN in the case of WoW (Wake on Wireless).
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output.
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 0cc1dbf2beef..326c1a94a1a0 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -80,7 +80,10 @@ properties:
     description: State bits used by the AP to signal the WLAN Q6.
     items:
       - description: Signal bits used to enable/disable low power mode
-                     on WCN6750 in the case of WoW (Wake on Wireless).
+          on WCN6750 in the case of WoW (Wake on Wireless).
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output.
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad9..ea8df6890478 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -167,8 +167,17 @@ properties:
     description: States used by the AP to signal the remote processor
     items:
       - description: Shutdown WCSS pd
+        items:
+          - description: Phandle to ???
+          - description: ???
       - description: Stop WCSS pd
+        items:
+          - description: Phandle to ???
+          - description: ???
       - description: Spawn WCSS pd
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description:
diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index fae466064780..b3ad05d90201 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -49,8 +49,9 @@ properties:
       A phandle to the parent I2C node and the slave address of the device
       used to configure tc9563 to change FTS, tx amplitude etc.
     items:
-      - description: Phandle to the I2C controller node
-      - description: I2C slave address
+      - items:
+          - description: Phandle to the I2C controller node
+          - description: I2C slave address
 
 patternProperties:
   "^pcie@[1-3],0$":
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index c179b560572b..3c614cb7ce88 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -104,6 +104,9 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop modem
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: Names of the states used by the AP to signal the Hexagon core
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
index 4d2055f283ac..d459296df0c2 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
@@ -101,6 +101,9 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop modem
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: Names of the states used by the AP to signal the Hexagon core
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 68c17bf18987..6260f77b7e4b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -60,6 +60,10 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop the modem
+        items:
+          - description: Phandle to ???
+          - description: ???
+
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
index bca59394aef4..3e410cbd45cf 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
@@ -92,6 +92,10 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop the modem
+        items:
+          - description: Phandle to ???
+          - description: ???
+
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
index b1402bef0ebe..f0bee69baf0d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
@@ -134,6 +134,9 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop the modem
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
index 94ca7a0cc203..3ea83207ae32 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
@@ -91,6 +91,9 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop the modem
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
index 005cb21732af..1f1d73610510 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
@@ -148,6 +148,9 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop the modem
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
index f4118b2da5f6..0111384d55d5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
@@ -104,6 +104,9 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop the modem
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
index a3c74871457f..b9325967b8a3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
@@ -92,6 +92,9 @@ properties:
     description: States used by the AP to signal the Hexagon core
     items:
       - description: Stop the modem
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 117fb4d0c4ad..e009f8ed9e8c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -84,6 +84,9 @@ properties:
       States used by the AP to signal the WCNSS core that it should shutdown
     items:
       - description: Stop the modem
+        items:
+          - description: Phandle to ???
+          - description: ???
 
   qcom,smem-state-names:
     description: The names of the state bits used for SMP2P output
diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
index 67586ba3e0a0..c752e4874e7f 100644
--- a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
@@ -46,7 +46,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       - description: Phandle to I2S0.
+        maxItems: 1
       - description: Phandle to I2S1.
+        maxItems: 1
 
   mic-bias-gpios:
     description: GPIO pin that enables the Main Mic bias regulator.
diff --git a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
index 272bc308726b..b6be47f67fcb 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
@@ -49,8 +49,9 @@ properties:
     description: configure OCTOSPI delay block.
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-      - description: phandle to syscfg
-      - description: register offset within syscfg
+      - items:
+          - description: phandle to syscfg
+          - description: register offset within syscfg
 
   access-controllers:
     description: phandle to the rifsc device to check access right
diff --git a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
index 10020af15afc..e6a5e79df348 100644
--- a/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
+++ b/Documentation/devicetree/bindings/usb/chipidea,usb2-common.yaml
@@ -97,7 +97,9 @@ properties:
     minItems: 1
     items:
       - description: vbus extcon
+        maxItems: 1
       - description: id extcon
+        maxItems: 1
 
   phy-clkgate-delay-us:
     description:
diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 691d6cf02c27..fec04702f530 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -61,9 +61,10 @@ properties:
       offset, and phy index
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-      - description: phandle to TCSR node
-      - description: register offset
-      - description: phy index
+      - items:
+          - description: phandle to TCSR node
+          - description: register offset
+          - description: phy index
 
   nvidia,phy:
     description: phandle of usb phy that connects to the port. Use "phys" instead.
-- 
2.53.0


