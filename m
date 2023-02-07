Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA1AC636CC
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUoEYt61teVJyOcJnO4Rv+YCeUBUHFZUqWjGD+R81I0=; b=U/s4yo0HtLGrzh
	wTQLg8q14VphhyvLbf4nyXs0zHSmGQ2/ijHBkpQT0N9s5hSw/K8TLPZLT7IefOhia8eTtYm+Uombs
	AntfqetR4eKTwquBcFnIa/fTIX9D6N4DcgqLgFve4vThgMHyXYkfxROTYcFjjFXJdpwVpkeCJPy8B
	h49AuzEWSrvXtuzHphGxtt1pDe2HmOol63GSJqUa2KInsmVEbS1id+ObgEj+GUEpu+I6jUEs7tBSf
	9u2jZHKrlSUYgmPaWnpZf1p8x+m9as5asXQnSQGCj1e8PJDcpr/Uv5qnQhchdchBIs3qelr4KC0+6
	Kyvnqr3Kv06JMTgyT5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLHp-00BjCe-O9; Tue, 07 Feb 2023 10:33:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLHn-00BjBG-DB
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 10:33:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317ACmY9005432;
	Tue, 7 Feb 2023 10:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=U4UaDN2+Hiptbl3iTTBUP0LvxGlwg397EEWroovGeRU=;
 b=pELTgfgi/pSaykTHL3Hy1ySQ2USYi7Qulqyx9sa2RbCRxqPCYKieGpEepmOzNtjE9DgY
 HaOU4Q0sVrw1aPPuDPPqoylAps6ExgjMlxBc7FgGnXLZbmGOMiruDBxjECXwqxfvTrqH
 cREbU+7GQdhjg7mVsUTXdGA0unLzKkDdahCLFGIW99Jd2F/MNXS6myD8p7jNgtzk0INo
 61d1DzVcCwl9c9+PXMFfdQMLL4eSbWzF3bLlGuH8q0PVSQwuvpZmUwkwy85g4AsXQUcc
 V11qDYQsz1DONIV0iJToegUcIeBoloVQf0GzaKelRVF657O77t9W5ezGHqObuXzphv2e kA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkfes8t6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 10:33:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 317AX6UX002635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Feb 2023 10:33:06 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 02:33:03 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Youghandhar Chintala
	<quic_youghand@quicinc.com>
Subject: [PATCH v3 1/2] dt: bindings: net: ath11k: add dt entry for XO calibration support
Date: Tue, 7 Feb 2023 16:02:06 +0530
Message-ID: <20230207103207.759-3-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230207103207.759-1-quic_youghand@quicinc.com>
References: <20230207103207.759-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vQNJQbGdhSLpeHCw9jg2Nxmnsaw3QGZ9
X-Proofpoint-ORIG-GUID: vQNJQbGdhSLpeHCw9jg2Nxmnsaw3QGZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_023315_612357_35CA1813 
X-CRM114-Status: GOOD (  15.04  )
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

Retrieve the XO trim offset via system firmware (e.g., device tree),
especially in the case where the device doesn't have a useful EEPROM
on which to store the calibrated XO offset.
Calibrated XO offset is sent to firmware, which compensate the RF clock
drift by programing the XO trim register.

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index f7cf135aa37f..4745251e70d4 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -41,6 +41,10 @@ properties:
         * reg
         * reg-names
 
+  xo-cal-data:
+    description:
+      XO frequency offset to program the XO trim register
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
