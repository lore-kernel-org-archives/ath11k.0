Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1955FD0C5F8
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nveTTtWi/IOzGp+i8IafJAXKLu4PpCQzTMgEOopL/30=; b=bzFpCW4UkFhvgAY9AD0ucEN3zS
	1vXz24ZHkj9lllOaCItS/+MBycEZdGsMnMhtE1WXRAZjDTRS9kkoUNL5/P2pSQbEzdkgNMLo7kGXw
	yapYK+OmMUI/en7sOXbUvsOdgR/lYwWr5kJpqTSaD5G7ErkTl0f5hnugMISgaFu+YnTtpa5/oj3g0
	ND74IXYG6KUV/SYB5q4ucKhdA/k3zLxMWI8EIc0lHk/UUybaqKBWFkMFISEUh3M2YcpXcJBhhRPeM
	3aJld3aRPic5zyhnuJ92gnSjR1/9iKJQVsNxiHJBQiXid0T7o3HpqSnphzP4pPPICm339tY+JE3q7
	3RKSzmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HDY-00000003Ims-1Gg7;
	Fri, 25 Oct 2024 10:06:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HBO-00000003ILI-37EE
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 10:04:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P62C3u011403;
	Fri, 25 Oct 2024 10:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nveTTtWi/IOzGp+i8IafJAXKLu4PpCQzTMgEOopL/30=; b=UEH+5mR7T0+rTVKu
	RZaEon3O3ti4JkWjQsShlJKEQpLJhh2yhycJ6otc+2TGL39rLUqhk5RXFYQzNMaY
	aRR0Y72ZDlFgBDHVExnmz1OD91vAgo/ggXd6bkrThrbqW05DJhynFEn3CC5TZ6eV
	rhjuQM87+faZoJ2EwL+d8QBZ06SCOCuU0LE9weKKXhUMQUocTGh7nQHF4J2MvnVs
	LaO2/6j7jNsddPsvW8nz1//dZdxw/28d6ZsIN9E3DuYO1Ntnjvn5KYY927JqAixA
	BvnkzgoCZMYwobSNivSOxHRWWGhBzW1Jmo9O/Gx2iglpw9JmXpT//3+eVcSc/Srl
	wQcRrA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g5q80knh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 10:04:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PA4YSZ020646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 10:04:34 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 03:04:31 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dmitry.baryshkov@linaro.org>, <krzk@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Miaoqing Pan
	<quic_miaoqing@quicinc.com>
Subject: [PATCH v3 1/2] dt-bindings: net: wireless: ath11k-pci: add firmware-name property
Date: Fri, 25 Oct 2024 18:04:18 +0800
Message-ID: <20241025100419.2128604-2-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241025100419.2128604-1-quic_miaoqing@quicinc.com>
References: <20241025100419.2128604-1-quic_miaoqing@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8hN0NQQieWs96edd3CvwMyQqfXV_Y3fe
X-Proofpoint-GUID: 8hN0NQQieWs96edd3CvwMyQqfXV_Y3fe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_030438_795432_0DF30878 
X-CRM114-Status: GOOD (  10.64  )
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

This is the same optional property that defined in qcom,ath10k.yaml. It's
useful for the platform / board to specify firmware through device-tree.

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index a71fdf05bc1e..2aa81690f7d5 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (c) 2023 Linaro Limited
+# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
@@ -29,6 +30,12 @@ properties:
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
 
+  firmware-name:
+    maxItems: 1
+    description:
+      If present, a board or platform specific string used to lookup firmware
+      files for the device.
+
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle
 
-- 
2.25.1


