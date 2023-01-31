Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C495C636CC
	for <ath11k@archiver.kernel.org>; Tue, 31 Jan 2023 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G47kfMsp+Qf0Z6Lr9A8vmS7gJmbPxELaQWvBboArPkw=; b=HYGtSdN1/Fz+wo
	Y5pJsBSwhXgsj7XwjNElQrlX50/GalHoVuKLi+FEJiJQoCVQHUALDBmVgh/BcKzjUEXSG9HUNvNqf
	CJ0kMj7FyFjKOR1QwIwUK3Yz79E20pp/3NZ3RCWmU5e9beNHCK0l8A0bAm3ix/owd56ARm8xWu531
	64rOlPQsMubukYuNnOb7LreqFX79+1m7UU7LtIXkiL8mzsjFbazRDvW6bZf8A0KJ+WsEEDacvos7v
	4qhHDBEIImjO23LiquGnQZMuWAvXtofrVDD1eIWhDj13/uAm3CK92ON6/saredmcEKq8T8EtsAtOA
	QdLJx+rfy4VpfZgBF4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrFe-008EJc-Ty; Tue, 31 Jan 2023 14:04:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMrFb-008EHI-E8
	for ath11k@lists.infradead.org; Tue, 31 Jan 2023 14:04:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V3TB3D023273;
	Tue, 31 Jan 2023 14:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Egmllpt2UyN9IAHOZOSTcs5pT7E8UwSPc2rT9k6nNbI=;
 b=n03l1VymAdkpKScHfbfU3hsjXE+2jWZ2IdOz7YxCfgEULTO6CtyyPSLBX6CeLYjAHutz
 BEjQJg2ZAPcCBMVJxg9tgDY+ZPXLhnO7v2L5nBMFtlqrlPlFkEnpgV4YbBDqAHcDLe1H
 +joj3gNn2VfB4W733HYlOEVV70xOyRU5FwP2ATGT/jaPceHHTO/By0vylmio8z0dEkpf
 sQGx2RFhyLMs3+e6wnKbREU0Awrit5/R5rqM4vuDNtTSOJ4jl2gGvq5GaUQhQHQ2R36d
 T8AYgFquzx0O1g5GWSILXTrIEnymII+JCZJYLtNZjDWV4Bqpn4QSu9yq1ZyUlsN+pfnz Nw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nefmftvs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 14:04:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30VE4ZVO028576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 14:04:35 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 06:04:31 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Youghandhar Chintala
	<quic_youghand@quicinc.com>
Subject: [PATCH v2 1/2] dt: bindings: add dt entry for XO calibration support
Date: Tue, 31 Jan 2023 19:33:44 +0530
Message-ID: <20230131140345.6193-2-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230131140345.6193-1-quic_youghand@quicinc.com>
References: <20230131140345.6193-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O5TDsiFlv2MK4Mi4x9dankAqYx7aUTt3
X-Proofpoint-GUID: O5TDsiFlv2MK4Mi4x9dankAqYx7aUTt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_060443_628401_95AA934D 
X-CRM114-Status: GOOD (  13.77  )
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

Add dt binding to get XO calibration data support for Wi-Fi RF clock.

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index f7cf135aa37f..205ee949daba 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -41,6 +41,10 @@ properties:
         * reg
         * reg-names
 
+  xo-cal-data:
+    description:
+      XO cal offset to be configured in XO trim register
+
   qcom,ath11k-calibration-variant:
     $ref: /schemas/types.yaml#/definitions/string
     description:
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
