Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2EAC433FE
	for <ath11k@archiver.kernel.org>; Tue, 18 Oct 2022 21:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuFaqo7Ev+H4N5c3vT/udXCWcH+PtIhWIXOP+WDNxQw=; b=ORbSTfSCzUICts
	gJvqzarUtaFUEw2MTSSTX6BqtlKKkaDiZNZWPi3VO0R4gMg1GI7p6qBjNbF7KIYeEHIXciGPg3wSM
	eAUTympLtSo8xmgXCZu4LrSfNh2tlbG/zSzYHu0v/XZCftHNnsSxwQgidEMOBaxAw6oZc07ea23Li
	4btjOvydGAThDiLm0pawTr8SunV8QzCE9xYRcE8o6Cfl0ZGkGZaiowY2+TbJhDhRPdLmqXE0UqbpG
	0VWW+eFZdjiCJXif6KfvmMaEibz6m9W8nK9KQkiDKDxWjbA3dQDFE2ghZhhRlZXpfIevRRSG9oW/V
	peObeT05wDctQ5elc8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oku8l-00Aa9g-Ht; Tue, 18 Oct 2022 21:28:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oku8i-00Aa7U-Qq
	for ath11k@lists.infradead.org; Tue, 18 Oct 2022 21:28:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29IJVqtb021451;
	Tue, 18 Oct 2022 21:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=zH9E5mTn/MnoPvBc3jO3qr502s/aQlo3hB8caxiLngc=;
 b=OIzDtzyQQE1cHUxNYlvb1uMmDSYWPpNZXTqiL3+4WfAIg0bgDEOaB0CBR2Q2Q2M9oV2U
 uDo3m5uoQP/6upG3tJH58i8EAfDTmDDyQdszmQRLURBlr4q/s8Urd/kKgaIptLBVWAZ6
 UDs9DupOrtly/XbkTp7rqzNQ4aAuz/YX6LRb3Z1Wp8gytV6x1PRwBt8/O75Sgn7Bt057
 71qztQ3SCfX2ALwNxKSGq9+zvsbamJo8oElh4SRHpVJSEQuoNZyF4aErFAB5qQZKmGei
 0b1cslv6kmMc1WA3r4DhGPtf9s/FXR4Ans7t9B3N7fa+RooQH8S7hT9DA55wnkjt3h3X dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9n2p313x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 21:28:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29ILSgKe010051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 21:28:42 GMT
Received: from msinada-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 18 Oct 2022 14:28:41 -0700
From: Muna Sinada <quic_msinada@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH v2 1/4] wifi: ath11k: modify accessor macros to match index size
Date: Tue, 18 Oct 2022 14:28:18 -0700
Message-ID: <1666128501-12364-2-git-send-email-quic_msinada@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: I_LCyF-EQ00VZK2hiFEEs0jw-Q8fR_Nc
X-Proofpoint-GUID: I_LCyF-EQ00VZK2hiFEEs0jw-Q8fR_Nc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_07,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxlogscore=739 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210180120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_142844_944356_80D621B0 
X-CRM114-Status: GOOD (  14.34  )
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

HE PHY is only 11 bytes, therefore it should be using byte indexes
instead of dword. Change corresponding macros to reflect this.

Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 8f2c07d70a4a..368b7755e800 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2857,30 +2857,32 @@ struct rx_reorder_queue_remove_params {
 #define WMI_VDEV_PARAM_TXBF_SU_TX_BFER BIT(2)
 #define WMI_VDEV_PARAM_TXBF_MU_TX_BFER BIT(3)
 
-#define HECAP_PHYDWORD_0	0
-#define HECAP_PHYDWORD_1	1
-#define HECAP_PHYDWORD_2	2
+#define HE_PHYCAP_BYTE_0	0
+#define HE_PHYCAP_BYTE_1	1
+#define HE_PHYCAP_BYTE_2	2
+#define HE_PHYCAP_BYTE_3	3
+#define HE_PHYCAP_BYTE_4	4
 
-#define HECAP_PHY_SU_BFER		BIT(31)
+#define HECAP_PHY_SU_BFER		BIT(7)
 #define HECAP_PHY_SU_BFEE		BIT(0)
 #define HECAP_PHY_MU_BFER		BIT(1)
-#define HECAP_PHY_UL_MUMIMO		BIT(22)
-#define HECAP_PHY_UL_MUOFDMA		BIT(23)
+#define HECAP_PHY_UL_MUMIMO		BIT(6)
+#define HECAP_PHY_UL_MUOFDMA		BIT(7)
 
 #define HECAP_PHY_SUBFMR_GET(hecap_phy) \
-	FIELD_GET(HECAP_PHY_SU_BFER, hecap_phy[HECAP_PHYDWORD_0])
+	FIELD_GET(HECAP_PHY_SU_BFER, hecap_phy[HE_PHYCAP_BYTE_3])
 
 #define HECAP_PHY_SUBFME_GET(hecap_phy) \
-	FIELD_GET(HECAP_PHY_SU_BFEE, hecap_phy[HECAP_PHYDWORD_1])
+	FIELD_GET(HECAP_PHY_SU_BFEE, hecap_phy[HE_PHYCAP_BYTE_4])
 
 #define HECAP_PHY_MUBFMR_GET(hecap_phy) \
-	FIELD_GET(HECAP_PHY_MU_BFER, hecap_phy[HECAP_PHYDWORD_1])
+	FIELD_GET(HECAP_PHY_MU_BFER, hecap_phy[HE_PHYCAP_BYTE_4])
 
 #define HECAP_PHY_ULMUMIMO_GET(hecap_phy) \
-	FIELD_GET(HECAP_PHY_UL_MUMIMO, hecap_phy[HECAP_PHYDWORD_0])
+	FIELD_GET(HECAP_PHY_UL_MUMIMO, hecap_phy[HE_PHYCAP_BYTE_2])
 
 #define HECAP_PHY_ULOFDMA_GET(hecap_phy) \
-	FIELD_GET(HECAP_PHY_UL_MUOFDMA, hecap_phy[HECAP_PHYDWORD_0])
+	FIELD_GET(HECAP_PHY_UL_MUOFDMA, hecap_phy[HE_PHYCAP_BYTE_2])
 
 #define HE_MODE_SU_TX_BFEE	BIT(0)
 #define HE_MODE_SU_TX_BFER	BIT(1)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
