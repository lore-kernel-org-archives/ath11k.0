Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E9CA5FEC
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WGQ81jU+l2MkFM+CIYGORGxoh8ZVvXmfJ0xa0fOYQCo=; b=QBN+D7pY3oTRLOyG26ivX5+Ya4
	nGBjNzzVKtTL2L7C/w9pGUXiRKz97d1WtzDhTb7zbWBU7YewqbH/sV+M55y+9Wvz4focLAT+Z89K9
	8MXklkxSEH3W2o5VUChuq5oqJq2eSv6xHztynHCT3sDrGS0Y5kaTQZbVnk+Bx2R9DmXl5hSejBaQs
	J8+lTt7Asp/Ppj2j8TFpepIJXWvqMApSBBJ5B0v9SFLbl+BuOCm3IloEE4k0JjPUQIchKRCbUJr/y
	B/ZgFzxTHMY2zzWqZ9Sdml98ZPI6Z1o3Rg/ICwaPJgmtgdN0r94bfdU4kyoqehkbAVxpvQ8h5Corr
	XO2D7lHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK76-0000000Ehuz-3M7p;
	Sun, 04 Oct 2026 11:10:40 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK73-0000000Ehuc-0Qyk
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:10:38 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 05F731BA2D;
	Sun, 04 Oct 2026 14:10:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=WGQ81jU+l2MkFM+CIYGORGxoh8ZVvXmfJ0xa0fOYQCo=; b=
	U81sRnJtx6voqjqKtnEnugJlf/Ni7CstbzpKIy5TU347RIngiT/SBsR9ndFLRbZG
	LHHHEcwIVRSw3oPsRxLFDU+tKw2oOOUL6KL4IN13k2ya5huTFi5y3YH6HFfZE24a
	h9zDamG0nWwP2UjzMJRqJVRxgH9kcm6JuTBVJ5qhBYPtpBe324f0cIOfbYKxh0mI
	DOe2FgqId+mF75AnVF6ovp3HTmEguaVsWutGjanS/QJLJrEm8JlibSQ/nirgzY3x
	Dl5TnnjbO4Elm0SsxWPU/Ap9N19XiW20ryUwAFADVmFbo4xd3eCEAopUj55k9t94
	C+QlTCoD2Gy5ryuX2GzMuQ==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id DA8D61BB28;
	Sun, 04 Oct 2026 14:10:33 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:10:33 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>, Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
Date: Sun, 4 Oct 2026 14:10:25 +0300
Message-ID: <cover.1791110510.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_041037_355132_9022A87E 
X-CRM114-Status: GOOD (  12.47  )
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

Add the Ubiquiti UniFi U6 Enterprise, an IPQ5018 access point with two
QCN9074 radios on PCIe (5 GHz and 6 GHz). The first patch documents the
QCN9074's PCI ID in the ath11k PCI binding, so the radios' nodes can
carry the calibration variants their board data is looked up by.

The Ethernet port (GMAC1 with a QCA8081 PHY) and the IPQ5018's own
2.4 GHz radio are left out until the GMAC and the WCSS remoteproc have
bindings.

The vendor U-Boot only boots Ubiquiti-signed images, so the boards were
booted by chainloading from it. Tested on two units with Linux 7.2 and
the out-of-tree board description these nodes come from: both QCN9074
radios come up with ath11k and their board data selected by these
variants, and the eMMC and the SPI NOR (including U-Boot environment
writes) are in use. The reset button and the accelerometer are described
as in the vendor device tree and were not exercised.

Patch 1 is for the ath11k binding; the rest go through the qcom tree.

The patches were written with an AI coding assistant (Claude Code),
which also drafted the changelogs; the testing above was done on the
devices.

Changes in v2:
- Collected Krzysztof's Acked-by on the two binding patches.
- Squashed "label the PCIe1 root port" into the board patch, its only
  user (Krzysztof).
- No code changes otherwise.

v1: https://lore.kernel.org/all/20261003083410.3126453-1-me@andrei-z.com/

Andrei-Alexandru Bleortu (3):
  dt-bindings: net: wireless: qcom,ath11k-pci: add QCN9074
  dt-bindings: arm: qcom: add Ubiquiti UniFi U6 Enterprise
  arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../net/wireless/qcom,ath11k-pci.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/ipq5018-ubnt-u6-enterprise.dts   | 236 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |   2 +-
 5 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts

-- 
2.47.3



