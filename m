Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7796CA5FE6
	for <ath11k@archiver.kernel.org>; Sat,  3 Oct 2026 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2P/zXpAn3qRYJyJlYJ78XIv6fn9MiapQOOLUEKE75o=; b=ke/fnSpSTbW7Ke07mmCVyJbN3Q
	3YeEQn9AAIg8bPBqi+kwleMaVMOWvjXXu3WHzyPMgj2t9TXyqok2DATD4V2Ovv7hs6o769TwMVvqJ
	+5TACRwMI7yQdPqsdjYbS9ErQbCBLK36sbQBErviXfzdvngY2p/8xUNtTT7nBUfxX3aRVPaPCgyE0
	gj03kALFDM5vljhHDWXBhvI0E6H/oqLyr7D5vv1Rj2PmwQi+58NdyjQXbC4wVO57ydMPA+TNL5z1s
	p5hNKhgHTuJRIgmGEQpLf4vThcBp5L60vZb6/HeAe6RsNQJhrK9IP/xjwcqLqL+8hjS1lH+T3LxTp
	TPy/YGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvCK-0000000DBZC-1bwc;
	Sat, 03 Oct 2026 08:34:24 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvCG-0000000DBWr-44VY
	for ath11k@lists.infradead.org;
	Sat, 03 Oct 2026 08:34:23 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 74AC6CAE0;
	Sat, 03 Oct 2026 11:34:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=v2P/zXpAn3qRYJyJlYJ7
	8XIv6fn9MiapQOOLUEKE75o=; b=UClasF8CSwKfvVCMDXK+ypZIoMrf1PcUWMfF
	1gPN2zmhKTZOsPiZHXBRniGjm8KSrvJEH2qJJvxHEoQBDw+7lLh2UeH65Hu5rxmq
	05FZkZIr6ictVc8EHICi5V2Nq3ingWyjo+iR1Qd82rj+2xVKU0TyEOXAkETfPv9D
	GKHEZsDerWmkw+GmyJgOZGHvTo/le82YDvyaPMl5DPJYvpFNLvOOhSX+6m84ktHU
	zOOHt3sVqPQuCypqARcAm/vQq0hJftmNkYW1oXVNytMfaKdUPdcFU1LfB+pmI7hs
	Ozic/rzz+xBzsUnapLdNsxZotrS6/jxbjCBqiIKax+9u41l48g==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 58459CB47;
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
Subject: [PATCH 2/4] dt-bindings: arm: qcom: add Ubiquiti UniFi U6 Enterprise
Date: Sat, 3 Oct 2026 11:34:08 +0300
Message-ID: <20261003083410.3126453-3-me@andrei-z.com>
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
X-CRM114-CacheID: sfid-20261003_013421_188251_57610734 
X-CRM114-Status: UNSURE (   7.83  )
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

Document the Ubiquiti UniFi U6 Enterprise, an IPQ5018 based access
point.

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..4524f76b4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -113,6 +113,7 @@ properties:
           - enum:
               - qcom,ipq5018-rdp432-c2
               - tplink,archer-ax55-v1
+              - ubnt,u6-enterprise
           - const: qcom,ipq5018
 
       - items:
-- 
2.47.3



