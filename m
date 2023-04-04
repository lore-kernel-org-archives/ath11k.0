Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D117CC6FD1D
	for <ath11k@archiver.kernel.org>; Tue,  4 Apr 2023 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x41K6I8F4p1ekCGo42WsRCHTrySX0qepctvnot7da5I=; b=i5hwk5F4xDx5Zt
	FNejQO8SfKGSSTQv2DmX83ify/fuEs0SET3T0Ed9YOZbJxTFC8lCUr+u1l0DpR55BBMBW1d42IiB+
	I4UmFbZYIqLTm8Gx/fXZOIMOGZzZDYdUUWKxwdycBiPB2Wy4ylB6l2f8TTZ3Fq+poEQ3s+etkXLro
	wiYZAXh8s+vYCYNG0iP9Ajxi37C8wFp1f65eFT6BcagmIWp8Tuz2eb/2kZTFkyK2CRXL0LkoHsGqz
	neoihIGvQ8pBS0nSqxkwD+2QgAEozlIpKyR+d55ya0QC+WnGnrC1s/JKCoIzrJCpVIixbqMMFu2Ab
	4QrNwIGrlaD7ZsvAKUig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjb0k-000IZm-1f;
	Tue, 04 Apr 2023 07:23:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjb0h-000IYh-1Z
	for ath11k@lists.infradead.org;
	Tue, 04 Apr 2023 07:23:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3343LBW9016659;
	Tue, 4 Apr 2023 07:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=UUYQzmKRF+c+OHY9b3+NQ/SAcXNPlhTghOL1eurbcJU=;
 b=ktk3B1tYWoHM8Pe2tCB/6jPGziQNB6ATAaVcAIuBkGlIGSHhkhkeyS7q61l4TmTecbN8
 CL/DsgaU3w9/TXLQrkEfi4yZR9P/aW+6jloN26+0ox5MWqCOZza8QmiiVOZfv5N4j67a
 g1WnaCJDNOSMZyrFPP2D+ddsht6DWr5LJFDGR+PgO5+f+8OLeeYbP9pNcdb7TLconYdy
 sFo3kOQ90oUoHbHGHxFxif06hEAHsng2tfoK9vrjxSi1HSUdQxQto6pIZaP7MGLEkF5d
 ifmF40SJ7y8XCiz8ddUdc+puk71EhbBJeC1KSJDIFoYrfnjU8b8S8icJPT8NVlKcZOc4 VA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pr4jm9c71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 07:23:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3347NIZO014095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Apr 2023 07:23:18 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 4 Apr 2023 00:23:16 -0700
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH 2/3] wifi: ath11k: Align RX MPDU info with the hardware for WCN6750
Date: Tue, 4 Apr 2023 12:52:33 +0530
Message-ID: <20230404072234.18503-3-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230404072234.18503-1-quic_youghand@quicinc.com>
References: <20230404072234.18503-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2NY3ZiZf1AriEX_7n6pXng-5TDgUy9Sg
X-Proofpoint-GUID: 2NY3ZiZf1AriEX_7n6pXng-5TDgUy9Sg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_01,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=788 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304040066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_002319_531650_572186F5 
X-CRM114-Status: GOOD (  16.39  )
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
value in station dump is incorrect. This is because RX MPDU info fields
in the driver are not properly aligned with the hardware. Due to this,
we get an invalid peer id while processing the peer stats, and the
signal avg value will not be updated.

Fix this by aligning the RX MPDU info in the driver with the hardware.
Change is applicable for WCN6855 as well.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal_rx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index f6bae07abfd3..1d5f92611b85 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -414,9 +414,9 @@ struct hal_rx_mpdu_info {
 } __packed;
 
 struct hal_rx_mpdu_info_wcn6855 {
-	__le32 rsvd0[8];
+	__le32 rsvd0[10];
 	__le32 info0;
-	__le32 rsvd1[14];
+	__le32 rsvd1[12];
 } __packed;
 
 #define HAL_RX_PPDU_END_DURATION	GENMASK(23, 0)
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
