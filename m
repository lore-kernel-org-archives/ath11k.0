Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E207C761AF
	for <ath11k@archiver.kernel.org>; Sat,  1 Apr 2023 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZP+m19lje/km3Ua7qLnZ31jV3E2TL6Q7ATnuo8h3No=; b=eP2rjcoKBgeIxH
	m6ZWJA9jqbxOQOSfSTifwP6ENqRZP2tmL518U+oQIaW4Z630Y9PfZHoYcy1/WgCPFHvXan/Rxi84k
	0fIjQO0LRbIRCv/LTWUQWevtF1yk8PaOElPMQgPsNIz+gl5jYZxBZNuB9zYGjWKwODS+vRJeHXS2u
	JAbnyWyFppYQ/v5dKfp1Oig29kNnOi1w/icz0XKriCSJRrlyNdYgdl7K+FuG1EqouqbDKMFE473gC
	oJhiyKwdrmoo+0VEgPRHT6gzppX8VIPJYKYrMls7x5ltobPrQAU8fq/fCL4x4SEKOd9QkWxL/cg35
	6aVjG3WETNCRWgDWWMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piRJg-009bPQ-2s;
	Sat, 01 Apr 2023 02:50:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piRJd-009bNx-2s
	for ath11k@lists.infradead.org;
	Sat, 01 Apr 2023 02:50:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3312X5bj009920;
	Sat, 1 Apr 2023 02:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=d/wn6ayMl3fG01C9loiqlX5RBuLzGOZIkBW3RdLLuf4=;
 b=WgkPQi42aJiTCQEESRsJTGBgq7BNXbxbHEfucI6d3Ld7gjn/CJOFc8+ByualkI7zLYUj
 3MNmFgoqaIecW7YMsd1cRoPwHrWxs7oQhDHADoNEjaYLaZfCSfn/QTea+VHpfm65/wqL
 b42XZGzSRtN+XQg6mu58YGw62KfVtShvU1ge7b+TMZDg2i0bAmKRaOk6gYQOA+ph6atX
 SBXS2XDf/O665dqkfeX+lXdOZQmCocWCMZWA2HvrTZ8kX5zIa306dN8mESCH2JJxqx+u
 HmcJp/m1ynhmLOC0vdxCQN9CHZC+wsf1cK++z0a6yDaiurakOqLx8sJ6XcP01Y6Kkksf TA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pp45h92aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 01 Apr 2023 02:50:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3312o2In019470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 1 Apr 2023 02:50:02 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 31 Mar 2023 19:50:01 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V2 2/2] wifi: ath11k: Fix incorrect update of radiotap fields
Date: Fri, 31 Mar 2023 19:49:32 -0700
Message-ID: <20230401024932.11722-3-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230401024932.11722-1-quic_pradeepc@quicinc.com>
References: <20230401024932.11722-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u0g6N53u9oNeqCQ5--55I4RG-MME6Ywx
X-Proofpoint-ORIG-GUID: u0g6N53u9oNeqCQ5--55I4RG-MME6Ywx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 spamscore=0 adultscore=1 clxscore=1015 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304010023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_195005_938694_AAF41933 
X-CRM114-Status: GOOD (  14.37  )
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

Fix incorrect update of ppdu stats causing incorrect radiotap
fields.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

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
