Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A5D60A2633
	for <ath11k@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JQFXTT3J;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=P5bI9Lr9;
	dkim=pass (2048-bit key, unprotected) header.d=andrei-z.com header.i=@andrei-z.com header.a=rsa-sha256 header.s=sig1 header.b=f1arccVH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x9/7eJRYDwbESNpYB8kbCEAUdqr1A0a9ky3Wg4BvjVs=; b=JQFXTT3JTYsov6FQ8cRsk+sysL
	dLtI07nsoqPmyrdvms7SXA024FsTidT0FokUFTucyovJDX5okviMX5yQwbcV1ZBEepnpbrrFPzMjr
	vXAWy2ig/zwFPEcPX0UqKulaDP2sc7UJAgSXlnsYaMBo0ZXjWMW3cMJnk+aNo48ROKmbH06X/w3by
	6XDLmnFPDsKJjEnFxGwvrQcTDoC9BerEBzvWDvRzRyKIu4BVLG/NOUd9Re2C4joUb3UquG9hZHhro
	35aOGVGkfCS9ZUAyub22Dz4OqbwTVcCUjrvoRFeExhre2FMWkGYRKXbXALH3sM6j0fpZfwzxQwQvg
	8PVxPm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFWk-0000000GQ11-0T8a;
	Fri, 23 Oct 2026 13:41:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFWe-0000000GPwM-2Ht7
	for ath11k@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=x9/7eJRYDwbESNpYB8kbCEAUdqr1A0a9ky3Wg4BvjVs=; b=P5bI9Lr9+hq5rdw+dboBwAG79J
	0lQHE+MBrFpFWzbE8HQdqWUO//oQLe9mbc8jy2NWSxz7qi6xv9qEd/wXOTwAf/UzZGQVsRHl6CDv2
	5EBYsijQef8V5gwBNQUwHdCyDtfFmZ8PeDsoGrFjwe3Wbm8Q/UPVileRyJNQVSTAi2WPDCmUWlSba
	SSdGK52htEZ6uq+KQ42tubKLqTeuKhygoNIukI9P/wpgWMkEshYSuEJSXcdFPEY0Z4TM30QW1cuZu
	dqS+uFlPgYBVzgK8rxQ4BoBnsKL4ybbOoABEHSXYWpWZAkiJdfRYwpbjWk2ZBZLzbNiBb4BgP18K8
	FcJnNyCw==;
Received: from vtj.irix.systems ([82.76.27.144])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFWb-0000000BwXG-1a7E
	for ath11k@lists.infradead.org;
	Fri, 23 Oct 2026 13:41:39 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 08F9F9272;
	Fri, 23 Oct 2026 16:41:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=x9/7eJRYDwbESNpYB8kb
	CEAUdqr1A0a9ky3Wg4BvjVs=; b=f1arccVH4kFUWema5f/VUktFlatnJe/wcPz8
	QtwOComdyPr2Zd+b5hr50Ec5TI2UZ81phCjO0MZad/WuUR8ELNKLYHZdV0vBXpgf
	bg3GfAp7zyTrrPRqLcAD6HTQpEaSj6gpSjdigVaKzOlFm4VeIosCENaiEDv0kdaZ
	k6skN7I0SGX6ziI1Xx9t2b315hf8IJHXujGi3j4MtUIGBhBqIFv4cL/Vb31Qwf6B
	sFrpMrkiVEYMhls/cCbXCGu6PRwe8GdVksrFInE7ua/iCTrf51hvkR/qfC/ngggy
	R5gAzvvFlm2xMLUaZM1dFwtueAm0SI3LyP0CRIm0R51D1bcJBw==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id BD46E9021;
	Fri, 23 Oct 2026 16:41:26 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:41:26 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, Konrad Dybcio
	<konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v3 4/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
Date: Fri, 23 Oct 2026 16:37:00 +0300
Message-ID: <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792761470.git.me@andrei-z.com>
References: <cover.1792761470.git.me@andrei-z.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144137_536055_55F9A9A0 
X-CRM114-Status: GOOD (  15.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
 .../dts/qcom/ipq5018-ubnt-u6-enterprise.dts   | 235 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |   2 +-
 3 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00..aca7d8e415 100644
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
index 0000000000..131e89fe61
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts
@@ -0,0 +1,235 @@
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
+			label = "Reset";
+			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+};
+
+&blsp1_i2c3 {
+	pinctrl-0 = <&i2c_pins>;
+	pinctrl-names = "default";
+
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
+
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
+&sdhc_1 {
+	pinctrl-0 = <&emmc_pins>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	non-removable;
+	no-sd;
+	no-sdio;
+
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
index dde5435f69..ee8c0fc03f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -837,7 +837,7 @@ pcie1: pcie@80000000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
-- 
2.47.3



