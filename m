Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04464CEB2E3
	for <ath11k@archiver.kernel.org>; Tue,  1 Oct 2024 03:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aERLxCnZBoiTjW9/f3SsgB85s84JsQsKyh9ZiNxQSw8=; b=QzEGZCs8j90dlYWV8LDn/3AW7E
	uZGlab2xkost91biPbQz4j1y7vOd+6VE6CR5yO3tEIawaegvO4rpFnAb1a7tE+i6G9P4RRY25qmI4
	cZMMsr6g7jPW2CxGRvlKKnmi+i0KNPOrkA7LPmrXqmGHl/8ziMnkF6OOfsahjPdnIdIQgaMaURdTY
	TCWbPASQ20YViZs6hftctGDsfyjkv4e1m7F0kC9t9PRBzvEyfxjlabemfVIwyHMWeCfoxyW8TNXlM
	pE9eg94O2AkiwvQMY1UDiNXalflTkvj6qW6gypn7XRIs3a0K9Ir2tt6NykkT50nX3B6CpxRpFmA4m
	fjt+5X3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svTot-00000001Voq-2MVJ;
	Tue, 01 Oct 2024 03:45:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svTbg-00000001U14-3hHA
	for ath11k@lists.infradead.org;
	Tue, 01 Oct 2024 03:31:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UMvelc008791;
	Tue, 1 Oct 2024 03:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aERLxCnZBoiTjW9/f3SsgB
	85s84JsQsKyh9ZiNxQSw8=; b=jV0gkQSVqiL9sOwzBFSOFcjMdl8nA/NEOyw4Y3
	IOyyySQLkyqDh1TXs8vBvyPUY90IHyLdjSav5TfbbgYVPKnprvPJp7Zwug7Mm8XD
	wT8LEyfDGBkA8b8fJnYozcjzi+d+spAMV+BeCfL7R/8hob1MUK3X7Dew1jmeNq0x
	o3uBVNqZJPx8ZfKwHhjzRVS7r+4ZGN8CobX+CJHB6X641KSpOHKG7K7CtDJyarsJ
	EQYCIaDI0rPRNSzFBRX8as5dAtjE7w04k2q60rIOfnt/noJA86h58plNGaJtWnHP
	rpgN2hB4SAQQlhSj8bN1Ru/rv6qfpbydxTOoHnahIygIjc8g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x7ge70ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 03:31:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4913VKRU028856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 03:31:20 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Sep 2024 20:31:18 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH 0/2] add firmware-name device tree property for ath11k
Date: Tue, 1 Oct 2024 11:30:50 +0800
Message-ID: <20241001033053.2084360-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zHbVF5GGiXIMC2qwiXgIZ2r_NLWt-hte
X-Proofpoint-GUID: zHbVF5GGiXIMC2qwiXgIZ2r_NLWt-hte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=839 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_203125_043501_ECC25253 
X-CRM114-Status: UNSURE (   8.51  )
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

QCA6698AQ uses different firmware/bdf/regdb with existing WCN6855
firmware, which is customized for IoE platforms. And the 'pci-device-id +
soc-hw-version + soc-hw-sub-version' may not be enough to identify the
correct firmware directory path.

The device tree allows "firmware-name" to define the firmware path,
    wifi@c000000 {
        firmware-name = "QCA6698AQ";
        status = "okay";
    };

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---

Miaoqing Pan (2):
  dt-bindings: net: wireless: ath11k: add firmware-name property
  wifi: ath11k: add firmware-name device tree property

 .../bindings/net/wireless/qcom,ath11k.yaml           |  7 +++++++
 drivers/net/wireless/ath/ath11k/core.c               | 12 ++++++++++++
 drivers/net/wireless/ath/ath11k/core.h               | 11 +++--------
 3 files changed, 22 insertions(+), 8 deletions(-)


base-commit: 8ed36fe71fd60c851540839b105fd1fddc870c61
-- 
2.25.1


