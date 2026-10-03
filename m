Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69C1CA5FE3
	for <ath11k@archiver.kernel.org>; Sat,  3 Oct 2026 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1VMqPdIWrTZ/JbvZq0mAAPASZHbxKQUjj6t4Lf+UEg=; b=YE2lMFKEVSOcA3mXZGbP4N2pP5
	cvOGE8lAd5Gbe0hyAf2rBJxmfdSF3vcUVSA9o06NZFwM2z2+G1x953MmzYx9k3VY58ojJGvyaEbiq
	AGu9XuaMqSlSDAl18rqyI3Wu7NBgzZso1P+TMGT4fo5ysfWp9jqScz1/+5cavkNvwCq0SwG7dILXX
	eixejAYp/q6nASZFJbVT1s8IV15RJV4K/a9hTIt1gQDSouo0qHAHqrl3myS1PK0HMeEI3OPgqN56S
	1siDErE5ivDVnSHichdn3zXiQDhxAv0mB5hqCtL6lM6Vz5/SvmJbaCvEQOUZroxEEOmdK45npGI7l
	X8Z/4REw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvCJ-0000000DBYS-14Pm;
	Sat, 03 Oct 2026 08:34:23 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvCG-0000000DBWm-2fcj
	for ath11k@lists.infradead.org;
	Sat, 03 Oct 2026 08:34:21 +0000
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id C9C9F14016;
	Sat, 03 Oct 2026 11:34:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=t1VMqPdIWrTZ/JbvZq0m
	AAPASZHbxKQUjj6t4Lf+UEg=; b=hRh0XBKGlEF8nqQ13zIfeRzhMuRtbsQ9dYlT
	2YV5KXMomE6WwAZoDCN59jfqIFjybeBWbW+EU3WME042LNfFJF8VQyL23/gyYXJs
	GqR2Y8mc9G0yYswDq/a6J61r2yYxZcKu6NesWIM2uh6cOrOV+G9DjWblsVZVphkx
	CZdQeMHqstmq9XBfEHakg0nILqP9zBnxneUJKTBwmbYmgy1MMzNn6cKk8co++E+e
	dtFIoRkJo5pTDHMhRZT54FZRPmD0oXnwlZMBxY3IrQC3YeDay4fVs1mmasHejam/
	jMC2HdgNBanJx9CTedv96uVz1pN6ZaV8IuU72HFUa9xhnLrXwg==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 28BA814014;
	Sat, 03 Oct 2026 11:34:16 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 11:34:15 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>, Konrad Dybcio
	<konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH 1/4] dt-bindings: net: wireless: qcom,ath11k-pci: add QCN9074
Date: Sat, 3 Oct 2026 11:34:07 +0300
Message-ID: <20261003083410.3126453-2-me@andrei-z.com>
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
X-CRM114-CacheID: sfid-20261003_013420_854022_ADE59808 
X-CRM114-Status: UNSURE (   9.05  )
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



