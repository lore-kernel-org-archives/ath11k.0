Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2058C6FA82
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bF+0RDIUHMqUpyws2dYg0dT0b41Hb1wGNhB20cIYSlk=; b=ZsddNwTOV4p/Zf
	j2zbb1UKdnnh1nAspTtysxE6iqvQivaekjSxP+e+hDpTUshuhSZaj1QwBt036qvLqn3QAHVQ3g7yK
	Oh1ehjw4DunUxAYthfiEmnsPVcN74442etTS1BBK59wtGpT7zaFmivDbEisqDmB+kVyBhWseMYtQD
	BnUnZJk8Rhp+IIznpMPUzrJWuh0b5XZ72BT5LqbAskFKAtKSE88yvbUPh/0v5FJglhBiAcxQkIQ+X
	EZloMW1atTJaUv8FPW13NcRd/jzpqYYzt3VoaWFmXvaiuEfoqq6S+6W77Hfl+ZEG3ElyILq1q7XBA
	NmQvm8jKUdY8/CT08erA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU4qQ-0041qK-7r; Fri, 02 Sep 2022 11:28:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU4qM-0041km-NG
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 11:28:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282AZ0HU011955;
	Fri, 2 Sep 2022 11:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=GFKlOK2MHqrQ4/ulA3KE7mAQxG5Fey86F/oL7hzKte8=;
 b=NEGy2A1TfEjXOrXdkqS+x3BxIIez01KhJPdu9lZ07z76973AADudc95gD4dPN1hlgtzY
 M/9tZBaC076yi1AxLyCOVqz6oxySta+4NfMBlXy4OXulAzCyjZHw1R0Urzb9M1uPn+8o
 z+7FUygvzbvIVPdMnIrqTXX508Ecfk8YlKK8sMmgnDtsEq40YrKxhVSzBSsfVsGttVL2
 ZfDHB13t6Lmd9/4VEHmQ9oRh2RGq2xDfSUh0QdtssXcsuWTln/4V17oISWa8S80UhwX2
 dsXNcaTYo/BKsJ1iZjC6+e5tORcY/LQfKwzux1212X8a1ZEjrA0rH1dcHfJqZqyh1Dg4 9A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jb7hasmj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Sep 2022 11:28:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 282BS35Z006226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Sep 2022 11:28:03 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 2 Sep 2022 04:28:01 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Manikanta
 Pubbisetty" <quic_mpubbise@quicinc.com>
Subject: [PATCH v3 1/2] dt: bindings: net: add bindings to add WoW support on WCN6750
Date: Fri, 2 Sep 2022 16:55:19 +0530
Message-ID: <20220902112520.24804-2-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220902112520.24804-1-quic_mpubbise@quicinc.com>
References: <20220902112520.24804-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cG38xICLmF4NTy4KzXm4Bsm1aJlNAn2o
X-Proofpoint-ORIG-GUID: cG38xICLmF4NTy4KzXm4Bsm1aJlNAn2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_02,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209020055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_042814_914809_336111D7 
X-CRM114-Status: GOOD (  15.45  )
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

Add required bindings to support WoW (Wake on Wireless) on
WCN6750 which is based on ath11k driver.

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 .../bindings/net/wireless/qcom,ath11k.yaml         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index a677b056f112..f7cf135aa37f 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -66,6 +66,18 @@ properties:
     required:
       - iommus
 
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: State bits used by the AP to signal the WLAN Q6.
+    items:
+      - description: Signal bits used to enable/disable low power mode
+                     on WCN6750 in the case of WoW (Wake on Wireless).
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output.
+    items:
+      - const: wlan-smp2p-out
+
 required:
   - compatible
   - reg
@@ -448,6 +460,8 @@ examples:
                      <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
         qcom,rproc = <&remoteproc_wpss>;
         memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
+        qcom,smem-states = <&wlan_smp2p_out 0>;
+        qcom,smem-state-names = "wlan-smp2p-out";
         wifi-firmware {
                 iommus = <&apps_smmu 0x1c02 0x1>;
         };
-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
