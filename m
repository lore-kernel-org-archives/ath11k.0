Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03392C43217
	for <ath11k@archiver.kernel.org>; Wed, 12 Oct 2022 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuFaqo7Ev+H4N5c3vT/udXCWcH+PtIhWIXOP+WDNxQw=; b=FkkaCqwYsWpxHz
	g2Dt78QJIfqbaA9YM1fu9fc6FoXiSAu3WygOodtv2xGJnetHBsy2y5OItZNfjzdlYQw6scXYKJixX
	2/Pf2zlD6hiWY0+Ieli9kZbDHLs0uwBAzzvwNBLX8egpGd16k5mdy53bcGiMccQnl//MYKqDHWaWY
	LviROIa8/pHfqBpJfu0IoVoXn+9b9pHkfc/GL44QhKLQxQ6qi3pflvD2jSheJNCj0Ead1WOR2VeDO
	FZEqcoCp0aN43wxJieqTRAzJFoMvpvoV1r021+pewRc2enkmFBieY3dFXUBgExhNkbnWN5KNKbEsc
	jAx+270C6ZQVi0xgp1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigbK-00908E-2X; Wed, 12 Oct 2022 18:37:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigbG-009062-UI
	for ath11k@lists.infradead.org; Wed, 12 Oct 2022 18:37:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CGeOBg006401;
	Wed, 12 Oct 2022 18:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=zH9E5mTn/MnoPvBc3jO3qr502s/aQlo3hB8caxiLngc=;
 b=N+rMuJWnl46TYBoIvaJiJEcF/Q3HBE6cwMPyvh4CvgYTH+JLu/T6SR7ZKpoceloRn/hQ
 0c46PjrUG1DPpJHhMZBM8kRue10WIpxz8mCXk+fW7S5njUJnfZc0gCoC1AjS6Vo+neSg
 tTYcSRbQtQBfYf+/9XGm/TKN03X2JzBo0TGPwL28Jj/ZtOSthFqGZt0E1P6VrjLFxq7y
 OCNXZ/2GU/Bgv0BG1rXt3qZUaadvgDRzv8fwRDg9hkphCSUvU7q18kYqqD2UaIUx06vm
 9yDB0X/R0crcZnmiQ2oZO116Rd4xC8dFtGF5E0E7ogSBmRf0OdUnm1bh3FJQJf/MHkZU RA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k5j7b2y87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 18:36:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29CIauLO011434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 18:36:56 GMT
Received: from msinada-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 12 Oct 2022 11:36:55 -0700
From: Muna Sinada <quic_msinada@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH 1/4] wifi: ath11k: modify accessor macros to match index size
Date: Wed, 12 Oct 2022 11:36:44 -0700
Message-ID: <1665599807-12908-2-git-send-email-quic_msinada@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1665599807-12908-1-git-send-email-quic_msinada@quicinc.com>
References: <1665599807-12908-1-git-send-email-quic_msinada@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wz-1vNd732tpvibCh56EeNnBE3TwMXmD
X-Proofpoint-ORIG-GUID: Wz-1vNd732tpvibCh56EeNnBE3TwMXmD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_09,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 mlxlogscore=739 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_113703_060385_739CD25E 
X-CRM114-Status: GOOD (  14.48  )
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
