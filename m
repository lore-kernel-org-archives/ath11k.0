Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FB2C54E93
	for <ath11k@archiver.kernel.org>; Wed, 28 Aug 2024 10:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9EeD85IakjAuYppGv5vgPSKu6GDWaXAcXSCdg/hNl18=; b=dy/e1Jrbz+YUWfoXNgqGZj7l3Y
	FlmsyYEbHQtdOrdz3mVj50BhhIIVbaBS8gMs/yHqmPbRvPsFS6H2ci8l/Cni63Uy8q8ez7JEsNPHd
	BF70FobUErDDxqDC9aqFWGMmazMVuuUHT0k0uCsmDQLBShgzUAwaytWu0ymqp7VW4I/oEcTwE2cdH
	m7E4zyEYc1wVUcgZPzv2EC9ND5nZEtcZlobMPRSaEf3zvFBPtdpSXFuvUflshO1TlCUfC7BxTOQfJ
	3T8qSAF+l8iOFCGrZoVOi4trOUaG+M3r0mQv4moIfQVyuhY8nACGih1t5MFRN/YT6XB2TqEyI8lKE
	pNKoDV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFxr-0000000ExzS-3Lkj;
	Wed, 28 Aug 2024 10:31:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFxp-0000000ExyI-0g2x
	for ath11k@lists.infradead.org;
	Wed, 28 Aug 2024 10:31:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLaJkI018472;
	Wed, 28 Aug 2024 10:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=9EeD85IakjAuYppGv5vgPSKu6GDWaXAcXSCdg/hNl18=; b=m6
	Az41GlC1QjlOT1/VsgTNEMi9hrA7FXZ7ANuumlAHfpRPuI0N+Qs1PJqjCTHoRJa4
	uXHwDRNqRwJ/V6hCb0iupQ/gvPVtHi9uqpcqqLNo8zklRnRJkBCIYZDdG+Y4wf5s
	4SzcujyoWcGW70UsO0JZwxlGm3WyYekbaEImEWif2x7Z4ZC2V4R+K0tFKstMGfFJ
	ZZafK40BPiwoWVyzUHTdrzgz7FEbdgEj90bMGuoVLcT0tdJ5NdCPb/Odh6V8zmVd
	d1V780su+bMYXgvBIviAzuFCzJS8m5OOh9ENZTOcLKZrySR3v2sqKxbNDyeRGFSY
	EyuPU9I0BVUVzPrKVX2g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv09f51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:31:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SAVfb2010730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 10:31:41 GMT
Received: from hu-bpothuno-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 03:31:39 -0700
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Balaji Pothunoori
	<quic_bpothuno@quicinc.com>
Subject: [PATCH] wifi: ath11k: enable fw_wmi_diag_event hw param for WCN6750
Date: Wed, 28 Aug 2024 16:00:43 +0530
Message-ID: <20240828103043.2413-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OMN3aDhdVyyOnRX_lvAiDf15JW1-cdJ_
X-Proofpoint-ORIG-GUID: OMN3aDhdVyyOnRX_lvAiDf15JW1-cdJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_033145_431073_4E131B94 
X-CRM114-Status: GOOD (  13.43  )
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

WCN6750 firmware sends the log messages via WMI_DIAG_EVENTID only
when the host driver enables the same via QMI_WLANFW_WLAN_INI_REQ_V01
QMI message. This is further controlled via fw_wmi_diag_event.
Hence set this flag to true for the firmware to send the logs.
These logs are further collected in the user space through
the trace infrastructure.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00233-QCAMSLSWPLZ-1

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 03187df26000..6bc10cbb493e 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -616,7 +616,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_dynamic_smps_6ghz = false,
 		.alloc_cacheable_memory = false,
 		.supports_rssi_stats = true,
-		.fw_wmi_diag_event = false,
+		.fw_wmi_diag_event = true,
 		.current_cc_support = true,
 		.dbr_debug_support = false,
 		.global_reset = false,
-- 
2.17.1


