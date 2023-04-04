Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51242C77B6C
	for <ath11k@archiver.kernel.org>; Tue,  4 Apr 2023 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dr1m1PNGc66z9GMp6QAGr/HVxMrIT5zBprJkW82/ZEA=; b=DTwKFTdj8GC7Yd
	Qb8bgU7a8f0USwfRquTZd8BnDRR5kjmG9w/2dMPl3a7Zx4RYKMrSpgJBiXnkhh2huJqZ+AvQkEQeV
	MQKbQNEETcnYtgMjIjir1Oer0mBPgk/+8vFMCQzyFv6PQzSr7XRU9mCJYm1a27ZF2Vgie1I/3vXUy
	udBRk68Auqkw3tWRQOheCeH20RnNpDq50ou1aXsPXqbOcrcMKvV59netICl34JSg48m5ZW38ctP9t
	/R8/DJN0NIegKROEPwCxKidoOszMASaTwCYsYK3pFydyIU1rSz6YK+3iUkwOcZo9J8VRH9Prd93gl
	lQPX0r7TvESt9/hhHcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjb0e-000IY6-3A;
	Tue, 04 Apr 2023 07:23:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjb0c-000IX5-0R
	for ath11k@lists.infradead.org;
	Tue, 04 Apr 2023 07:23:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3345fKv8004992;
	Tue, 4 Apr 2023 07:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=yoO9hOORUgp4tejOSXtitoR4zpiwg+9WL5jAsVzw0/k=;
 b=JNIONuEFJiL+Yg/q8wZnn54KhxzKqOtlKUxE6HdrRH/u4akwBiNLoQnCPgTIOCzOPNCo
 8GaJbPRJpIdss0F/wy/r4fIC6aVsnvWMeYI6MPidJGVSwy8aGiQkzCZZDhYHRlUF6gco
 2+Sp03AUJ3hU55igCw+pzGAUUuVDcNHQKPie29yjNzRokzeLSWV5XgJMFSui+vKKk6MY
 OJN/D5crEKQJTImPgrN3P6lgeE6+NRf/JI/4gnrBCkQ791vnYINTJO8TgwZ07j5yl+Yb
 PfHSLppp5JYrqJ9xlC1Ar5DZSt7Ycy8ZMAqcU9PHmfNEIjmTaNCxw/QB0VLcotrrF5EJ NQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pquxtjr16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 07:23:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3347NCHr019809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Apr 2023 07:23:13 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 00:23:10 -0700
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH 1/3] wifi: ath11k: Use proper API to get peer id for WCN6750
Date: Tue, 4 Apr 2023 12:52:32 +0530
Message-ID: <20230404072234.18503-2-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230404072234.18503-1-quic_youghand@quicinc.com>
References: <20230404072234.18503-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JD2p7Oc9xWhAIZBfuJQb54shoYu7SoNC
X-Proofpoint-ORIG-GUID: JD2p7Oc9xWhAIZBfuJQb54shoYu7SoNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_01,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=942 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_002314_184611_EA7DEC83 
X-CRM114-Status: GOOD (  16.18  )
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

Currently on WCN6750, we are seeing an issue where signal average field
value in station dump is incorrect. This is because of registering an
incorrect mpdu_info_get_peerid() API for WCN6750. Due to this, we get an
invalid peer id while processing the peer stats, and the signal average
field will have invalid values in station dump.

Fix this by registering correct mpdu_info_get_peerid() API for WCN6750.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 60ac215e0678..9321613721a0 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -1122,7 +1122,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_attention = ath11k_hw_qcn9074_rx_desc_get_attention,
 	.rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
 	.reo_setup = ath11k_hw_wcn6855_reo_setup,
-	.mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
+	.mpdu_info_get_peerid = ath11k_hw_wcn6855_mpdu_info_get_peerid,
 	.rx_desc_mac_addr2_valid = ath11k_hw_ipq9074_rx_desc_mac_addr2_valid,
 	.rx_desc_mpdu_start_addr2 = ath11k_hw_ipq9074_rx_desc_mpdu_start_addr2,
 	.get_ring_selector = ath11k_hw_wcn6750_get_tcl_ring_selector,
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
