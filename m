Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020BCCA5FEC
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4fzGtATBGOFN1Ct1sYmgkbem1Kx3IntSRgBB5imcys=; b=0akkwk7SkGfssmRNhkJtaC7dKS
	4S59pLY9FWqNyeul5FJgd9XuC7Zf4na5TaHUJOBFjZE9X51qKn0hcz68MkF+kj1RvtLsExlv3wI7k
	L/HyJFyq4me+wg8gh/oM8GGxoQ3yfFhxzZwbDJOpQLH7m7QONBQ/p4wZXATRNnwSPNOq/Lr8HIk7N
	C4/ZO3k9jEKO2atQpvNhKjxpOaWjdlqaM+4nA4UQNDvi0CBs7XxfDPfYPP6a5uagT2zKR/hz95o1c
	4bBCZDd5jRckofWL1wq4Lz2CEHBSGWh/sMkKvHt3KX0fg106gEVsrTE9uUPjdxZaB5KGhZqjggmRL
	CgJKWhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKAE-0000000EiHf-2Kw9;
	Sun, 04 Oct 2026 11:13:54 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDKAC-0000000EiHI-0sby
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:13:53 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 54A0F1BB2A;
	Sun, 04 Oct 2026 14:13:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=y4fzGtATBGOFN1Ct1sYm
	gkbem1Kx3IntSRgBB5imcys=; b=QwE0q5bM/XEFvOy8HRNhoGxKjzN87iRbi5bB
	6IJd968chcheRuOK6nMYL9J6wBkp942nDypYGp8NoV+RJuf6NCptwGac1lAtnVXG
	LixnLUx0tLVieOUgoSlhJAtW6lSIFvQHlKoB0gbd0ms1mBPRNshDmhHBqG3Ri+7R
	E47i1laGE6xKuV98W5fwQPViRBztAdlEzM/vs5xSxG2j3rRWuhOQVTl8QhPHg9f7
	uZbLnDxxdpwWRkW0f1rqCyDic/CDcDGCoeY/oFThhy8SFB+39LQ1hw+eRqwJQ/2z
	lNzsLS+gZUJV0pGRaZ7kntPFds/ppoTeQoqPb2+qW7mxXmnLBg==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 95C951BB29;
	Sun, 04 Oct 2026 14:13:49 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:13:49 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>, Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
Date: Sun, 4 Oct 2026 14:10:28 +0300
Message-ID: <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791110510.git.me@andrei-z.com>
References: <cover.1791110510.git.me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_041352_455813_2C9BE0EF 
X-CRM114-Status: GOOD (  15.86  )
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

The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:

- SoC: Qualcomm IPQ5018
- RAM: 1 GiB
- Flash: SPI NOR (boot chain) and eMMC
- 5 GHz: QCN9074 on PCIe0
- 6 GHz: QCN9074 on PCIe1
- Ethernet: one 2.5GbE PoE port, a QCA8081 PHY behind GMAC1
- Accelerometer: ST LIS2DH12
- Button: reset

Describe what mainline supports today. The Ethernet port and the
IPQ5018's own 2.4 GHz radio are left out until the GMAC and the WCSS
remoteproc have bindings; the LED controller and the board MCU on the
I2C bus have none. The QCN9074s carry the calibration variants their
board data is looked up by. The SoC dtsi gains the pcie1_port0 label, as
pcie0 has, for the 6 GHz radio below that root port. The vendor QSEE
reserves 4 MiB, twice the SoC default.

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/ipq5018-ubnt-u6-enterprise.dts   | 236 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |   2 +-
 3 files changed, 238 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e0..aca7d8e41 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-ubnt-u6-enterprise.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts b/arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts
new file mode 100644
index 000000000..6462f99df
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+#include "ipq5018.dtsi"
+
+/ {
+	model = "Ubiquiti UniFi U6 Enterprise";
+	compatible = "ubnt,u6-enterprise", "qcom,ipq5018";
+
+	aliases {
+		serial0 = &blsp1_uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&button_pins>;
+		pinctrl-names = "default";
+
+		button-reset {
+			label = "reset";
+			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+};
+
+&blsp1_i2c3 {
+	pinctrl-0 = <&i2c_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	accelerometer@18 {
+		compatible = "st,lis2dh12-accel";
+		reg = <0x18>;
+	};
+};
+
+&blsp1_spi1 {
+	pinctrl-0 = <&spi_0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "0:sbl1";
+				reg = <0x000000 0x030000>;
+				read-only;
+			};
+
+			partition@30000 {
+				label = "0:mibib";
+				reg = <0x030000 0x010000>;
+				read-only;
+			};
+
+			partition@40000 {
+				label = "0:bootconfig";
+				reg = <0x040000 0x010000>;
+				read-only;
+			};
+
+			partition@50000 {
+				label = "0:qsee";
+				reg = <0x050000 0x0a0000>;
+				read-only;
+			};
+
+			partition@f0000 {
+				label = "0:devcfg";
+				reg = <0x0f0000 0x010000>;
+				read-only;
+			};
+
+			partition@100000 {
+				label = "0:cdt";
+				reg = <0x100000 0x010000>;
+				read-only;
+			};
+
+			partition@110000 {
+				label = "0:appsblenv";
+				reg = <0x110000 0x010000>;
+			};
+
+			partition@120000 {
+				label = "0:appsbl";
+				reg = <0x120000 0x0a0000>;
+				read-only;
+			};
+
+			partition@1c0000 {
+				label = "0:art";
+				reg = <0x1c0000 0x070000>;
+				read-only;
+			};
+
+			partition@230000 {
+				label = "eeprom";
+				reg = <0x230000 0x010000>;
+				read-only;
+			};
+		};
+	};
+};
+
+/* The bootloader muxes the console pins; GPIO33/34 are I2C on this board. */
+&blsp1_uart1 {
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+
+	wifi@0,0 {
+		compatible = "pci17cb,1104";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		qcom,calibration-variant = "Ubiquiti-U6-Enterprise-5G";
+	};
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 18 GPIO_ACTIVE_LOW>;
+
+	wifi@0,0 {
+		compatible = "pci17cb,1104";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		qcom,calibration-variant = "Ubiquiti-U6-Enterprise-6G";
+	};
+};
+
+&prng {
+	status = "okay";
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&emmc_pins>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	button_pins: button-state {
+		pins = "gpio24";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	emmc_pins: emmc-state {
+		clk-pins {
+			pins = "gpio9";
+			function = "sdc1_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio8";
+			function = "sdc1_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio4", "gpio5", "gpio6", "gpio7";
+			function = "sdc1_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	i2c_pins: i2c-state {
+		pins = "gpio33", "gpio34";
+		function = "blsp2_i2c0";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	spi_0_pins: spi-0-state {
+		pins = "gpio10", "gpio11", "gpio12", "gpio13";
+		function = "blsp0_spi";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};
+
+/* The vendor QSEE uses 4 MiB, twice the SoC default. */
+&tz_region {
+	reg = <0x0 0x4ac00000 0x0 0x400000>;
+};
+
+&xo_board_clk {
+	clock-div = <4>;
+	clock-mult = <1>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index fe1ed240d..2f3bcfa88 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -838,7 +838,7 @@ pcie1: pcie@80000000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
-- 
2.47.3



