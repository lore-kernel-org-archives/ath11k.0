Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E031C25B75
	for <ath11k@archiver.kernel.org>; Mon, 20 May 2024 03:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBDNyLUC5BbQl+a+IJBLUi+IwVvWRYFQM5eZSzyoeeE=; b=sL3ZOtDf1lDiiGwFoXMRimYoaj
	t2fOl8/r/IdGTrjLbRQvkpAoPsUoD83fPnza318iyQ6iNvPDFHWNRg0g8LSik8ujHLpym1z8DGxpq
	pABZMjanx8kQh9kx+syK0yCdOOvHNtnwkS/C/CVcYV8x3hh3ww8R2N7cF9SoP5wTz3ddLhyOcnh0C
	BfHgAlChKlNv9EO8GqqhOKvcsM2DP97YscmXJMr0jzcaSncqN4xwFmixeLezTLyccQ5S0hZiSDG2S
	lMsvR0c+hotlejO35h2cozfXE5DXRM4s6eDlm6qFZ3njStmeaKOeki87OqDCoJ9OC42rlujXG2eCo
	lXe+qH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8tPJ-0000000DK6G-3CWd;
	Mon, 20 May 2024 03:09:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8tPG-0000000DK4p-2Nyb
	for ath11k@lists.infradead.org;
	Mon, 20 May 2024 03:09:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K0A2kN009478;
	Mon, 20 May 2024 03:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=HBDNyLU
	C5BbQl+a+IJBLUi+IwVvWRYFQM5eZSzyoeeE=; b=BzWFP5+1/X1ifM1i6hNt97B
	cyBmFTYGMLPMw3ywaaGLijWA+WL3GSLWOrc8brzOmi7VwvcQL5hz3JVufqqUHlEn
	dNzxnysiBCSj/3xmBkIl4LcFXuxzq+OsfBEMNJUGstGa6vDV4IoenAbDeE0u3pyU
	qf7acba8VhWBCIKNa0jMZHWmaaBDkZyeFyHvTxXCGii0vowXHrrmIQMeih1t2zFr
	LR9cJ4gnLgwlRGaIBaiciv9knnrWkb7UxT3RbX4ulTmi4WmMFZdJgw2QsMGjP9Dx
	2JXMJ8T+lSVMycw3Pvc034OQXnarE0dEqIcqlBGeMI0tjlU4Cp0SFUWpjM782EQ=
	=
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n45j9tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 03:09:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K39EfT008392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 03:09:14 GMT
Received: from cjhuang2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 May 2024 20:09:13 -0700
From: Carl Huang <quic_cjhuang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_cjhuang@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix WCN6750 firmware crash caused by 17 num_vdevs
Date: Mon, 20 May 2024 11:07:57 +0800
Message-ID: <20240520030757.2209395-1-quic_cjhuang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3C9nJNkxytrRBVMVY54HyB2tIbu9gBmY
X-Proofpoint-ORIG-GUID: 3C9nJNkxytrRBVMVY54HyB2tIbu9gBmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_01,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_200946_643744_61570E3D 
X-CRM114-Status: GOOD (  12.48  )
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

WCN6750 firmware crashes because of num_vdevs changed from 4 to 17
in ath11k_init_wmi_config_qca6390() as the ab->hw_params.num_vdevs
is 17. This is caused by commit f019f4dff2e4("wifi: ath11k: support
2 station interfaces") which assigns ab->hw_params.num_vdevs directly
to config->num_vdevs in ath11k_init_wmi_config_qca6390(), therefore
WCN6750 firmware crashes as it can't support such a big num_vdevs.

Fix it by assign 3 to num_vdevs in hw_params for WCN6750 as 3 is
sufficient too.

Fixes: f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces")
Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Closes: https://lore.kernel.org/r/D15TIIDIIESY.D1EKKJLZINMA@fairphone.com/
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1

Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 3cc817a3b4a4..b82e8fb28541 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -604,7 +604,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_ftm = true,
 		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
-		.num_vdevs = 16 + 1,
+		.num_vdevs = 3,
 		.num_peers = 512,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),

base-commit: 1025c616ee13372f3803b158abb1d87ef368ae3d
-- 
2.34.1


