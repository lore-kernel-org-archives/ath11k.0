Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E6BC48BC4
	for <ath11k@archiver.kernel.org>; Sat, 17 Feb 2024 21:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=60nZSbuMq1De8FlLK4k1D6fMOSTbtJSL1lSZrb1xVfY=; b=QYz35OT/vHG3Rzl4RxVkz1E7LV
	pD6VpqRoE3kDqUteGzsJwWMWn2qeI+5UBKnKE7LGGn4Oxo4kM/GXuWRSrYghw8zNKNk32Z2sQPfqs
	DjPfxCRTy8Wx28Teeg0Qd9jAJGmujm3Wjctbfd9ZEJs4mu7FhPB8U5WqZZ1AcIp+u9s9v/PZ19vuc
	sufPrJpOty8Nt32LNQp0p3uvXynMUb8ToNcjRIkclZwHTki/YwSxTxS6O2tNZAP+vk6PYjZc7SIL2
	6b53Ki3R9cvsyAOpGaDOR6wX44hZM24+pTQeGYXrleqW84qYxHJMMdAv16nmirDTdTSku9sAHgspC
	+abhkEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbSGt-00000006Rsm-1H8F;
	Sat, 17 Feb 2024 21:30:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbSGq-00000006RsI-3uLW;
	Sat, 17 Feb 2024 21:30:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41HLTsDW019092;
	Sat, 17 Feb 2024 21:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=60n
	ZSbuMq1De8FlLK4k1D6fMOSTbtJSL1lSZrb1xVfY=; b=kb7PIdjwaeYF+nIcIEL
	HBsBUVwWVtHHpwS+WOPgd/B/LGaEYxfJb9rbEIz3XWUBRVmg7VmnVKR6UdFz8uTL
	aQLoUL3lM5ZqN00tabMahHpHwe5K+QutL0wt+vQvRmMIqMzxyVZFeDagxSQun62S
	nBoMPgNeYNllVq3hnONEdKcYZu+1Ut4+Xy2AXmOxyD9UebqBSIYjyMmFwyWcM/Aj
	WSqyRUa/zH5d1HOpbNTzG5J68fxqv5eDMKh7S4+MtqaPXgPY+8JnC4TrovvCJVOc
	27wgxpbGTnWj0YUjBhWTkNmmsnFkOHxUa4nrY3g75si3Y8dbNf9VHZpQ/xtrmtBO
	l5g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wam4q11y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 21:30:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41HLUiow016969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 21:30:44 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 17 Feb
 2024 13:30:44 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 17 Feb 2024 13:30:43 -0800
Subject: [PATCH] dt-bindings: net: wireless: qcom: Update maintainers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240217-ath1xk-maintainer-v1-1-9f7ff5fb6bf4@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIIl0WUC/x2MQQqAIBAAvyJ7TlCJzL4SHSTXXCILlQikvycd5
 jCHmQoZE2GGiVVIeFOmMzaRHYM12LghJ9cclFC9UFJzW4J8dn5YiqWBiQ/Gr9brUXpnoHVXQk/
 P/5yX9/0AjyxS9GMAAAA=
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ath11k@lists.infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rozfTO-K88W-M-tEmD9hjBJvAWSV-ZPx
X-Proofpoint-GUID: rozfTO-K88W-M-tEmD9hjBJvAWSV-ZPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_20,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=643 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402170178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_133053_175986_29B467F5 
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

Add Jeff Johnson as a maintainer of the qcom,ath1*k.yaml files.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml     | 1 +
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml | 1 +
 Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 7758a55dd328..9b3ef4bc3732 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -8,6 +8,7 @@ title: Qualcomm Technologies ath10k wireless devices
 
 maintainers:
   - Kalle Valo <kvalo@kernel.org>
+  - Jeff Johnson <jjohnson@kernel.org>
 
 description:
   Qualcomm Technologies, Inc. IEEE 802.11ac devices.
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index 817f02a8b481..41d023797d7d 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -9,6 +9,7 @@ title: Qualcomm Technologies ath11k wireless devices (PCIe)
 
 maintainers:
   - Kalle Valo <kvalo@kernel.org>
+  - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
   Qualcomm Technologies IEEE 802.11ax PCIe devices
diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index 7d5f982a3d09..672282cdfc2f 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -9,6 +9,7 @@ title: Qualcomm Technologies ath11k wireless devices
 
 maintainers:
   - Kalle Valo <kvalo@kernel.org>
+  - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
   These are dt entries for Qualcomm Technologies, Inc. IEEE 802.11ax

---
base-commit: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
change-id: 20240217-ath1xk-maintainer-69fcaf781fd9


