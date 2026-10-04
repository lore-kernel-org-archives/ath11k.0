Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8370CA5FE6
	for <ath11k@archiver.kernel.org>; Sun,  4 Oct 2026 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddsfmpn0HeRxhSOer3sHR5O9BrgbtEBLrHx3YZTuNDQ=; b=EAYF702dHe7GlPtNnBP71gTFsA
	Q3wedmBKiM3M/2f2JZnMVDmtXVJFEuW91YBjpgi23p3obgsZEzkh2O3aaLqJqpQLM1hUeg/NI5Beb
	hTh5o8gSBjga6+B5LvUq8niqXBNTRYP3XzbnEDlA2js4mNU0UlWrXCMTCayU3zH8FPMEDa3AUW9C0
	HousUvnMP1x5o3q2DcsduBlIa05W1hLYaezLUFTl6BnL2QC+i5RQEeTiRvCw4Lw3pU+Zd1ufV3+HC
	qh1Rj9dIw7AwLS4/tZqoQdyy3RWpJCqlYUSZows6OV4oOXW8FgpLqHCvxn/vVBOAVaXFT+v0kR6fO
	foM3Jw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK9B-0000000EiAt-1UsY;
	Sun, 04 Oct 2026 11:12:49 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK98-0000000EiAT-2pap
	for ath11k@lists.infradead.org;
	Sun, 04 Oct 2026 11:12:48 +0000
Received: from MAILGW-BIG.big.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id C8DF2102ED;
	Sun, 04 Oct 2026 14:12:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=ddsfmpn0HeRxhSOer3sH
	R5O9BrgbtEBLrHx3YZTuNDQ=; b=bBFkTqdRbZToXrcZ67wfN5dWHZUWxcqOpa5F
	yD/8I7qhPAUdeNfWpczMBn8kARtJzxlDacAwI8QrA2wbzELgj+uad4DJbjPQIlQb
	CugFQeuu0iK7QlAgwfrLCdydRBYi1uZP11QnTlpEI2ECxVsCoqWT06ipHMSiGl+R
	6EFQJIp9eW9TFLPpYrFjlUZg77noetqWpv6JPeZ0Yda2okpk9uzT/Rc5F8uldU2W
	E2sbob4IjDi5OofFh6YbMZxxWBd2g4nG0aCqOzZdo2qJ6ZGw3fb08NKTb+8kIxBt
	2CuKUsijuE6PF2u0IL8rbXHZroqEEy3jXcIeY4sOEvMvkv4rWA==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 521E3103B1;
	Sun, 04 Oct 2026 14:12:44 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 14:12:44 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>, Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
CC: <ath11k@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: add Ubiquiti UniFi U6 Enterprise
Date: Sun, 4 Oct 2026 14:10:27 +0300
Message-ID: <3c19155a87b94faf4e16f3d15c7875a525e63ae8.1791110510.git.me@andrei-z.com>
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
X-CRM114-CacheID: sfid-20261004_041247_229418_A42B5754 
X-CRM114-Status: UNSURE (   7.48  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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



