Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546CA606A31A
	for <ath11k@archiver.kernel.org>; Fri, 23 Oct 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iBycXRbz;
	dkim=pass (2048-bit key, unprotected) header.d=andrei-z.com header.i=@andrei-z.com header.a=rsa-sha256 header.s=sig1 header.b=iaKBBNPJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fV6lG8cL6H9TvOQBCaJbZ5e3BAf/D65lP3q+B2S2MWc=; b=iBycXRbzAG5EDj4FsAlIGvaw5N
	48hfztg+m3CZr1XdjzU9kYqDjaao+Ec6HvksfYstpmar7Z7ozZ4EcBIpsP0dVniRjhOVwWjQ6i63U
	Z9vrjsNzLzix96RL7fDqX0LV4+S6eUt7EgmCsMn4XjV27PLpCtgV570EsVzKvb2zC/YcTmptLcVPb
	UHHt23davRFPUu5p1hsHcCCiWi58MQ/Liy+If9BW5zyg1g6AdA5fGtA/wt7ms/p4N6VipCbhQyL7K
	CMSOeQCJKRnlA/oO0Fz9lT9Vu5jQUn8C15pWtQmOW317rmGkaSSn6og+rUxRpmFSSM3xdr4idhV62
	KKPzy5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFSU-0000000GORy-3G32;
	Fri, 23 Oct 2026 13:37:23 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFSQ-0000000GOQ2-22Np
	for ath11k@lists.infradead.org;
	Fri, 23 Oct 2026 13:37:21 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 15CAA216A8;
	Fri, 23 Oct 2026 16:37:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=fV6lG8cL6H9TvOQBCaJbZ5e3BAf/D65lP3q+B2S2MWc=; b=
	iaKBBNPJ9Bgs9fARz/sxih1sVoPOMfzgPP3oEeA1edtr7jeMmB6lei6rUfga+icO
	L86ZsJTjl/ileKOx4zXXUkfdeAJICTCNkiLUIlaUTIHmi1w6Oys76PBZMsy8zsnN
	QWy81CM72QN1ybXMcOnVfZHhDXog6aYEk8FgyBmBpGDt/MgCbeNdc28SOv2I1fqC
	3IvHCvwku8iowabzwOcZHFq4a70WPSEz4qEsZke6OY1CQy+O1AEuriJLbLHax91q
	6BGk1LiVL5z46imgSnCt0gaXIdMfEnWch2YFAqNFhZEqrjn13eokSdxFInFBHMuS
	NuawwIARpHc2BQy8gmsvGw==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id D0F142189C;
	Fri, 23 Oct 2026 16:37:05 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:37:05 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, Konrad Dybcio
	<konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v3 0/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
Date: Fri, 23 Oct 2026 16:36:56 +0300
Message-ID: <cover.1792761470.git.me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_063718_719675_77FBFCF5 
X-CRM114-Status: GOOD (  13.19  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Changes in v3:
- New patch 3: the PRNG is enabled in the SoC dtsi rather than by the
  board (Konrad).
- Board: the reset button's label is "Reset", and a blank line precedes
  every status property (Konrad).

Changes in v2:
- Collected Krzysztof's Acked-by on the two binding patches.
- Squashed "label the PCIe1 root port" into the board patch, its only
  user (Krzysztof).

v2: https://lore.kernel.org/all/cover.1791110510.git.me@andrei-z.com/
v1: https://lore.kernel.org/all/20261003083410.3126453-1-me@andrei-z.com/

Andrei-Alexandru Bleortu (4):
  dt-bindings: net: wireless: qcom,ath11k-pci: add QCN9074
  dt-bindings: arm: qcom: add Ubiquiti UniFi U6 Enterprise
  arm64: dts: qcom: ipq5018: enable the PRNG by default
  arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../net/wireless/qcom,ath11k-pci.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/ipq5018-ubnt-u6-enterprise.dts   | 235 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi         |   3 +-
 5 files changed, 239 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-ubnt-u6-enterprise.dts


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3



