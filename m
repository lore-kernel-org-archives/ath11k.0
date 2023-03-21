Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839B1C6FD1D
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWP9cp0e45QgyO6ORcgISgaLuOtyhaT6Bx4ey9CAUAk=; b=VRKyRzKhdm2jEM
	xYEQKOpBY9CIQxB9cjO53URGPY1Q2115WGhXRHhtTOFSv8GQLA3iQpp7pwCo8dxPvGUZWlwWgYv31
	J1hiZOsvOmHHwGtLnJJMKYcJEzkoXDzPwxAWUw3N4XKf5fHX15nA3ESJKLa1we4+qA+Wkp/VhpuQR
	4SL+CqM8/Y3B3QXmYDVBknIM/lMsIZjo5P5mDc7QX+C5f6CUERzkhwCmxL5HYNRZCnPek5EEHg0+A
	RpcR0koRTPKdLoTCc820lEk6p2iGaQFgtAf+0i2zAy5kyOa+57Lyt8xtEjOr3TItmgRA57wXdhLpT
	duYaBPvilTtGV+xW/0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYSX-00BuLM-0Q;
	Tue, 21 Mar 2023 09:39:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYSU-00BuKH-1h
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 09:39:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D391619CB;
	Tue, 21 Mar 2023 09:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B11C4339B;
	Tue, 21 Mar 2023 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679391548;
	bh=y4DQQgqTeIOp+QSV53CC0j5id0oCyBXkdp89zbwqiMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5Z9G5RhRob13EVQTljJZCAmCEYyyM9fYBf+rNjtCNqM+iL+MxJ1+MujMcRZjZTjr
	 xhhPd4QD5t4ElLlkVFsDLYb7I341Y4aXnl3zQvTDyUxVTQn5l92Y9fk8AW2n4qMHDQ
	 Ejjc8Y8rkqkOYZsNTJ3BN2Lt69j6rVDwMCO3gMNdcsdg5wzs54qUT/56B6ywxM3nLo
	 TLHeUenQTUE6+PBT1FfrIBbc1OMamsmaFeq1zx24yEkc1KAKMs0xkOZyrmycKQIOZO
	 xPSi/PbZuEset6GkJzTHqUw90m8nOr0CIcWhxYqZFU1Y7yDsPu3hFFto6M9ADEy2dg
	 Ymd2iQIXqNicg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1peYTo-0002Y0-DN; Tue, 21 Mar 2023 10:40:32 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Steev Klimaszewski <steev@kali.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc8280xp-x13s: add wifi calibration variant
Date: Tue, 21 Mar 2023 10:40:11 +0100
Message-Id: <20230321094011.9759-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321094011.9759-1-johan+linaro@kernel.org>
References: <20230321094011.9759-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_023910_624945_0FBA91AD 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Describe the bus topology for PCIe domain 6 and add the ath11k
calibration variant so that the board file (calibration data) can be
loaded.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216246
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 150f51f1db37..0051025e0aa8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -711,6 +711,23 @@ &pcie4 {
 	pinctrl-0 = <&pcie4_default>;
 
 	status = "okay";
+
+	pcie@0 {
+		device_type = "pci";
+		reg = <0x0 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		bus-range = <0x01 0xff>;
+
+		wifi@0 {
+			compatible = "pci17cb,1103";
+			reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+			qcom,ath11k-calibration-variant = "LE_X13S";
+		};
+	};
 };
 
 &pcie4_phy {
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
