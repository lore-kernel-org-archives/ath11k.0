Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEF5C46CD2
	for <ath11k@archiver.kernel.org>; Tue, 23 Jan 2024 02:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHTH0zo1pimKi3yYupZBGYmGR27jhbfDUfA1t0FpYgk=; b=QHZgLJCYQF70WohsTr+i4ykttD
	45naGXgxoCOhYRCYZYcS8L5/0En7YStB3wMelC6ne9Artp18nLXJiLZvxnkoD0bf1+SuKnX/xpWbX
	oJm2nAh1b6nRkrAJMRvsrdiZlmjNpdRtrTocW5sYVE/0ic+BG8Zne0xgDvLzKbCrzVK068t+g5zMl
	wyiwKQEhjq0WrZHlAYXmoFe1fE9mKnuqv40Tj+I2XoVoevzDB7UlKpLcwn+giTZ/yPg6PpH0CLCF2
	kgwykArUSaRsjId7p81TqkqMDHv9w9YZt+YiL5q9CBec8kDCeUY3QWiFg3745LIEWf7/UZKsgeVam
	o2f0EnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6yh-00ExKg-2H;
	Tue, 23 Jan 2024 02:57:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS6yf-00ExJ5-0b
	for ath11k@lists.infradead.org;
	Tue, 23 Jan 2024 02:57:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40N2BoOt008729;
	Tue, 23 Jan 2024 02:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=kHTH0zo1pimKi3yYupZBGYmGR27jhbfDUfA1t0FpYgk=; b=gG
	+52+zQXU4GJ8KIcxj0i0cuJJZh9t07Oj63EsZEpu8gYmeLCcYBJqOu+EhUXLw8KV
	KViqnXumz4jbMyjPuT2gf/nXB0OEcix1bhq+jlF+qDCxm9Tn6xKPPNmf69uJFwJB
	PbqS2wipa7IO/01IqtXNQH4ItRqqaqlsfzrTFImC1kAotFeTXujmPgzdU3ixprIR
	0va0UDToUpcI+zvkNnbdQnUz/cHsXY33Lal4Amq9an/ZIal3k8BskXJfuJKiEQSm
	uHoxBxSxhnMkC87a8wfosWWt4s86uLOFnjzhHJFrUMlxhZ1Llqr8/TA1xC9dDLvb
	kiOYp9GyfrEGWAm49cgA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vt4err2q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 02:57:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40N2vCCs016233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 02:57:12 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 22 Jan 2024 18:57:10 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 1/4] wifi: ath11k: remove invalid peer create logic
Date: Tue, 23 Jan 2024 10:56:57 +0800
Message-ID: <20240123025700.2929-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123025700.2929-1-quic_bqiang@quicinc.com>
References: <20240123025700.2929-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Oizq9SGKcK2kDmy7IHBE6aPHjM4P1ZTv
X-Proofpoint-ORIG-GUID: Oizq9SGKcK2kDmy7IHBE6aPHjM4P1ZTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=921 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_185729_342161_871FC867 
X-CRM114-Status: GOOD (  11.81  )
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

In ath11k_mac_op_assign_vif_chanctx(), there is a logic to
create peer using ar->mac_addr for a STA vdev. This is invalid
because a STA vdev should have a peer created using AP's
MAC address. Besides, if we run into that logic, it means a peer
has already been created earlier, we should not create it again.
So remove it.

This is found during code review.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 8dda3337ee2d..5c7a33d4ca8b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8097,7 +8097,6 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	int ret;
-	struct peer_create_params param;
 	struct cur_regulatory_info *reg_info;
 	enum ieee80211_ap_reg_power power_type;
 
@@ -8140,21 +8139,6 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		goto out;
 	}
 
-	if (ab->hw_params.vdev_start_delay &&
-	    arvif->vdev_type != WMI_VDEV_TYPE_AP &&
-	    arvif->vdev_type != WMI_VDEV_TYPE_MONITOR) {
-		param.vdev_id = arvif->vdev_id;
-		param.peer_type = WMI_PEER_TYPE_DEFAULT;
-		param.peer_addr = ar->mac_addr;
-
-		ret = ath11k_peer_create(ar, arvif, NULL, &param);
-		if (ret) {
-			ath11k_warn(ab, "failed to create peer after vdev start delay: %d",
-				    ret);
-			goto out;
-		}
-	}
-
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath11k_mac_monitor_start(ar);
 		if (ret) {
-- 
2.25.1


