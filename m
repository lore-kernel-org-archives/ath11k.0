Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B18C76195
	for <ath11k@archiver.kernel.org>; Tue, 28 Mar 2023 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GoRVsPmUaK6FoUIzIV+bMtFiBbx5FynyHvvDwfVjbog=; b=x69kDl2MDkxFNS
	u+S1nTzrHxWfyfrp/DeRJSaHQVWMI2ki1lsjLSqmnWcdjznaYX0H7v7bDc0RIovERsTcyACSLv3uo
	5E2pxHo0L6UzFS8S0BiuCHkEN7XfpeDHboSkxxzn4AJzmbD18ETXu+uTAKbPVPuV5KAsEi4Oc5GLe
	67/DKB4fvwSpuoLbKUHv2nCeQTkOQvQ2JlJFuER8TgKak0frnFXnUgUkcFThaxzGgSE5dnl+mZZuK
	QHSqCtccBXZ7Kv+OTdI0bBudSN1/ls2OXE2ItCPgfZxIwX6jRQ/aHWQjIDacbWe/3dAtQug12z915
	ReDwtv+9yLDs/yPT/iaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3V8-00DPAg-1N;
	Tue, 28 Mar 2023 07:12:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3V5-00DP9A-2v
	for ath11k@lists.infradead.org;
	Tue, 28 Mar 2023 07:12:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S6XjKa014868;
	Tue, 28 Mar 2023 07:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=4qsfF7Si0E9VXY3AGa3sbwb6eomXilHPwlzZsE98B6w=;
 b=CiRD+GKOYs8+z8ojkrLnggcqyXVzChCcEW7I2ReT+X1MVg+30stLDEoX6Hitzl1t2TgH
 tCPPww2EdLvTAI8Um4iOTLv7K0sw9Edq6BaD5jG/1v4XVa6ILZhsHUaJgxXU2GL18trD
 8TRGDOQ5XqDLaxAbCKoaAeQUn9PvRw1thCgCP7zyqMYkVp1HiCPBcvJNY3C+TUg0UUW6
 IfeftgTmU4mq5Y3sidQNWfcpFQ53Y8a5oS/mAD/NdZ83yhY1L1Jqd9enZOp4kDzt1t4/
 oD8cAKkkKJcbTDp70JGjHCZHE+rRcFQq4xHraDsB6qHJIJCeCduabYuugVQJ2vPTpTzR 8Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkcm2t7g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 07:12:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32S7C8cE016332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 07:12:08 GMT
Received: from tamizhr-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 28 Mar 2023 00:12:06 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCH] wifi: ath11k: Disable Spectral scan upon removing interface
Date: Tue, 28 Mar 2023 12:41:50 +0530
Message-ID: <20230328071150.29645-1-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pc1UPArUCbp6Q0143cVZ4FakS75Df3bh
X-Proofpoint-GUID: pc1UPArUCbp6Q0143cVZ4FakS75Df3bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=777 bulkscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1011 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_001212_086419_E5AC0DF7 
X-CRM114-Status: GOOD (  12.91  )
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

Host might receive spectral events during interface
down sequence and this might create below errors.

failed to handle dma buf release event -22
failed to handle dma buf release event -22

Fix this by disabling spectral config during remove interface.

Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1

Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index cad832e0e6b8..3ce6075af5dd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6652,6 +6652,11 @@ static void ath11k_mac_op_remove_interface(struct ieee80211_hw *hw,
 	ath11k_dbg(ab, ATH11K_DBG_MAC, "mac remove interface (vdev %d)\n",
 		   arvif->vdev_id);
 
+	ret = ath11k_spectral_vif_stop(arvif);
+	if (ret)
+		ath11k_warn(ab, "failed to stop spectral for vdev %i: %d\n",
+			    arvif->vdev_id, ret);
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
 		ath11k_mac_11d_scan_stop(ar);
 

base-commit: bea046575a2e6d7d1cf63cc7ab032647a3585de5
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
