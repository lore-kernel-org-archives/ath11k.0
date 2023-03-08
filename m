Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704C9C678D5
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDtKAvu9WCCrZ2ulaUR/63LrPVlH4YuSxrvDMEwbdMc=; b=HPrlE3OSYKOS4I
	6AjvljEyrMRIkTntweZfSJOPCUMg7w+Ag+OVx20wx3BxFaV7pkMyXaex2G6L0XmRMN8uoIpLIu4Jl
	gY2BhqBeSiIPo9B9VsvZc4YCAliK0gxl699Ogh1BU9oN27xI9YjveIHWtNEXjuHqIUl2bhKWPBvxL
	1Hxz0OzgZd9UNRUB0CKGlt+H3HIvTqIm+bCbnkbAtJF8HVIRnbWobirRexE1zELyLt+UtT+H59sGZ
	DeYBK/BaUJSOdbrZ9PaiHKWqNBA6FMkKip4svzQcbrdQuV3i1y8rcpwJ4hUogtykdf6EAq5YHuSmt
	koeAJ7d8dE2SIbbd4Umg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZxsp-006GZF-E1; Wed, 08 Mar 2023 17:47:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZxsm-006GWv-0P
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 17:47:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328FppDB025718;
	Wed, 8 Mar 2023 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=VrPTUXeRxpjx48Cu+QwL/LBYT0vzLDXbb6DdPuMN5mc=;
 b=HLl7T561Y6nXVy29QdkfFytxPf7vdjvkCWn2uxL97BllKebj6nSPyvcICL+k5G+3Pa9i
 JgFpsdUnCTE14+uqtKDjQHwi3bLvpipQKOSBe/ubBbMX/KoC4iqZK0ycxJt+CIUc3KuQ
 mq1OlytgJ9WW2Rr8nEgamsr8Y12O9zQaEKBXHI9UMzx6dBhHYltRJ+V2q9wn4okiDojL
 zO8JBG11pMq4SQlsOP+mhqpvoAhLQ2eQF+0BoHeRP9VfyKL7EfMsO8lH3X6ibY5fpDxd
 DldXKOiim42Xuo4J9cA9JX/k3OYs7D0aTL9UphrkP62r16O2Rh2lOBnAw1CcWM0OgZ/8 +Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6wcmg9u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 17:47:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 328HlERv017743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Mar 2023 17:47:14 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 09:47:13 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH 2/2] wifi: ath11k: Fix incorrect update of BCC counters in peer stats
Date: Wed, 8 Mar 2023 09:47:03 -0800
Message-ID: <20230308174703.12270-3-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308174703.12270-1-quic_pradeepc@quicinc.com>
References: <20230308174703.12270-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8BvpquOoC63xXmv2jUPGVgqHtr4c-hXC
X-Proofpoint-ORIG-GUID: 8BvpquOoC63xXmv2jUPGVgqHtr4c-hXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_11,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_094720_075132_946FBC09 
X-CRM114-Status: GOOD (  14.56  )
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

Fix typos causing incorrect update of BCC counters in 11ax mode.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal_rx.c | 4 ++--
 drivers/net/wireless/ath/ath11k/hal_rx.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 7f39c6fb7408..d462b36c3cb2 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1023,7 +1023,7 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		info1 = __le32_to_cpu(vht_sig->info1);
 
 		ppdu_info->ldpc = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_SU_MU_CODING,
-					    info0);
+					    info1);
 		ppdu_info->mcs = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_MCS,
 					   info1);
 		gi_setting = FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_GI_SETTING,
@@ -1446,7 +1446,7 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 		 * PHYRX_OTHER_RECEIVE_INFO TLV.
 		 */
 		ppdu_info->rssi_comb =
-			FIELD_GET(HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB,
+			FIELD_GET(HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RSSI_COMB,
 				  __le32_to_cpu(rssi->info0));
 
 		if (db2dbm) {
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index f6bae07abfd3..064796935f9c 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -385,7 +385,7 @@ struct hal_rx_he_sig_b2_ofdma_info {
 	__le32 info0;
 } __packed;
 
-#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB	GENMASK(15, 8)
+#define HAL_RX_PHYRX_RSSI_LEGACY_INFO_INFO0_RSSI_COMB	GENMASK(15, 8)
 
 #define HAL_RX_PHYRX_RSSI_PREAMBLE_PRI20	GENMASK(7, 0)
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
