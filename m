Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C66EECAAD1
	for <ath11k@archiver.kernel.org>; Thu,  1 Sep 2022 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eJd7RG7xgEkCB4bDJYLYi6WYH8DAs4NBlDCpvfk0j+Q=; b=dOJ/ZvUcEeFn6H
	s8s1zxoUgLEbctVmFj1H93CFmZq2cc4OSwSAP4SxOFUv6u1JnoOqjqCatuE7u2Sqp1zIA6s/ksO2P
	SHQ1U4SdCmM2clypqROniqLjAdgJ1FQspQ/iPlUbIA6QybMwsMYYcqVdPtqs0JamYEaiN7oYv2ui9
	aIvNVupfixS8o98sPdURnLBmz7PV9aWFgW9fzTJBgpwLqnzVs07mT9XJB5Sfx3KY+ycBmZVLhBCTk
	2CfY6cko6aYOksBHzQl8g5edmxgaJU3PO3GbHeEaLlTTKVCvZi+/I9q7Hcz2Cm+n/o6tGMUoRunu0
	Sh/BEgPlkgLAPWnxg0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTfEM-00AVF7-GZ; Thu, 01 Sep 2022 08:07:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTfEJ-00AVD0-Cl
	for ath11k@lists.infradead.org; Thu, 01 Sep 2022 08:07:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2815PbRi026324;
	Thu, 1 Sep 2022 08:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=jG2+riLa/lU07/TMtjkBUz+AMAQ2VIvpFKr8EDVVNpw=;
 b=dUhxnlw8SsA4UW/MemSoFUXWGhPYlRROuiDYQDau1unH49s66qSZpedxLFLD63/n1TQI
 nrHJQd4Qc3oDTIOt8KDnVDsDOnGFuo6TxxcSpXxSEsWnsekRVPtYPlXZ0cdwHZ51sjyR
 ULPm8Z7jEbC5Ug9s03/+eLFbqPMJ5c5gjzONLRIaKJselNzHU2ckCgic52fHEWOP0Ea9
 TAfEJU9ObnZsJ/H3hC2A+o67AHnCW/FkbEW0AmZ1tFkY4HCAzujf30VkWoatX9uApeaH
 sGKBNU7y8gr1I4VqDewBNrdxrHipptURmfHl/2eUYwuCr534sg4ozdWaaSDQxbZFTuOe HQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jaaasawq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 08:07:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28187CtI000521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Sep 2022 08:07:12 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 1 Sep 2022 01:07:10 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH v2] ath11k: Enable remain-on-channel support on WCN6750
Date: Thu, 1 Sep 2022 13:36:56 +0530
Message-ID: <20220901080656.3450-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WRq_e707X3n3Ob_MLx_38UopTHWsI8x8
X-Proofpoint-ORIG-GUID: WRq_e707X3n3Ob_MLx_38UopTHWsI8x8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_05,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=972 spamscore=0 adultscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_010715_453000_15BBB83D 
X-CRM114-Status: GOOD (  16.78  )
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

Enable remain on channel support on WCN6750 as it is needed for
GAS, Passpoint.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
V2:
- Rebased on ToT

 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index c3e9e4f7bc24..6fd96b38eb49 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -524,7 +524,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.static_window_map = true,
 		.hybrid_bus_type = true,
 		.fixed_fw_mem = true,
-		.support_off_channel_tx = false,
+		.support_off_channel_tx = true,
 	},
 };
 

base-commit: 16424e934b2e83faa81bb7709e13be4b809d35fe
-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
