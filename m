Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5E5CA5FE6
	for <ath11k@archiver.kernel.org>; Sat,  3 Oct 2026 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IJs1SGXeSNWjv6z8/4uhGdL9UF8iMKOhCe2W9MDcSk=; b=bt3yb3pOWzpOSRoNHRdqrjS/IJ
	Ot3qFvC2/C0Cw/szjFe+aq66oH1zf3XowZRj+bhOUR0KIR+PXX173I8itF7GOysiFOTSJvnA8hhaP
	YYXt2O7q9LVSaXLj+36wNqGLbvj0jqlTz2aAjbF07zat0f/Phd4nNmGiqGsFgdUI3SqaGnfHR1c1J
	r57GAMHPV24pQ+SO+WfTGec4aImMmCFNGCihCAA+IsBSWfPZ9gNfUEtc6vnwATEAwENTx8mVwbzR+
	vcIbospSncn0BkO8dzjQIU2npkgFT413jv+KxOrLGmAUcRgy84BSG+VIvG1ogsDbAaJ6S4l5/iAsm
	VICZkAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvCK-0000000DBZS-1zFe;
	Sat, 03 Oct 2026 08:34:24 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvCG-0000000DBWs-453g
	for ath11k@lists.infradead.org;
	Sat, 03 Oct 2026 08:34:23 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 78191CAE1;
	Sat, 03 Oct 2026 11:34:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=1IJs1SGXeSNWjv6z8/4u
	hGdL9UF8iMKOhCe2W9MDcSk=; b=a5SfUesXoyeKToa0l+bl+mkQ874Hn3MMuJZo
	NeYaD8gp1Qs/FCtMcUqrSXNJhm0C8wGtF5mcx39G7qg4OTYDTlsVGfljEe6cVJ/p
	aEv5NLUwcDEIhLDIGzcP94NzMwMEgZN1ZBlTIcJqMIowrKeR7Q3EzIKMVaSFskR2
	vNaOSYEvBNBX37sD7gp/GIKFQZSTrJY9EzKLR/DhGP0vA0Omc7W+7OmpGb2kaWYa
	iXBDw6NVAJrEkVjUqvo8q/wV92k+SAMZZvrWuQaLBWYqRbp3JNz4fiqhf0uSwtBh
	ntfv6OPhV0Qjx3tFb9gF8i/TOpy1rW1k8RGZEtplHDayL8k4Sg==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 64CA0C9E3;
	Sat, 03 Oct 2026 11:34:16 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 11:34:16 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, Konrad Dybcio
	<konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH 3/4] arm64: dts: qcom: ipq5018: label the PCIe1 root port
Date: Sat, 3 Oct 2026 11:34:09 +0300
Message-ID: <20261003083410.3126453-4-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003083410.3126453-1-me@andrei-z.com>
References: <20261003083410.3126453-1-me@andrei-z.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_013421_189746_24462185 
X-CRM114-Status: GOOD (  11.33  )
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

The root port of pcie0 has a label, the one of pcie1 has none, so a
board cannot attach its PERST# GPIO or a device below it the same way.
Add pcie1_port0.

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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



