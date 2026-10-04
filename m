Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997EECA5FEC
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2WGB2A7tu0a8i34W5JOeUaiuMMyPiQRvFycqCxQOJs=; b=u4VHu8JxLODEAnQ8AsKs/srswV
	Y+02/87betSO/ke28nDVZUUFj3doQsl3JDn668j3rsW7t5HzLRT7celq9mdybzHsg+4YzxlpvgpiO
	FGhN5TOCcd/MHpre++U2fPnOIkbHHi/TtP9WXGdPKzNTyriElOA5/Tbod9f7Z0dmoXSeDzRHYgfps
	FxRTqbFK7fczcRvsAmdY6te46q+3+vukqwxiZxyzsAeDlwce1SMpTetKWmCVLnixnBAVIO/4tbA8c
	PKzClxAEsoQCM5nk3CMTZvgki1qlfvWvJ4AaCkkyxROz+IDew5PgVSB5YCj+qBcVYuX9auLZTSjy0
	p33G5grQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK8B-0000000Ei2P-0Asw;
	Sun, 04 Oct 2026 11:11:47 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK86-0000000Ei1n-0okh
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:11:46 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 37B9F13B99;
	Sun, 04 Oct 2026 14:11:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=E2WGB2A7tu0a8i34W5JO
	eUaiuMMyPiQRvFycqCxQOJs=; b=EMdag/MZ0S9dIfXUp117x6ThKM66vQUmFI2p
	N3t7y++2msbGU6Z36RJuAmzgzvkLNmGrmfCStT0BNdiVKgyuIM1tIxWTkfPmOyEK
	LzFiL3EGE5HZo+rd0oZJbnhfNHQg6TM0/rk2R4G9qYPrkbBCNtoj9b39Gb561hcE
	Bo618lkm4xCPYYyyH+6FsBYkq/VvlRdh35fClrFJ/tS7VIw/3ldj5GUibWg5LNY/
	XZpaRlz5AoirbxnjZ8japHW8PSEZTmY9gsmnjmcAWyQT+PO6SIfPzIAUVVbTONsi
	ftaR6VIkBABnHEU/lf5NCSkq/+BIMmJsZUeUMG8OXafx4kXNlA==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 372D613C9B;
	Sun, 04 Oct 2026 14:11:39 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:11:38 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>, Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: net: wireless: qcom,ath11k-pci: add QCN9074
Date: Sun, 4 Oct 2026 14:10:26 +0300
Message-ID: <99957f59a1728b21386128f1f2133e068da3c5dd.1791110510.git.me@andrei-z.com>
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
X-CRM114-CacheID: sfid-20261004_041144_378944_F62E7937 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

QCN9074 is a PCIe 802.11ax radio that boards such as the IPQ5018-based
Ubiquiti UniFi U6 Enterprise solder down, two of them on different
bands. Like the other ath11k PCIe devices, each needs
qcom,calibration-variant to select its board data. Document its PCI ID.

No supplies are added: on these boards the radio's rails are fixed and
not under software control.

Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index 0162e3657..605ac5e01 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - pci17cb,1101  # QCA6390
       - pci17cb,1103  # WCN6855
+      - pci17cb,1104  # QCN9074
 
   reg:
     maxItems: 1
-- 
2.47.3



