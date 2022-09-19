Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F60ECAAD8
	for <ath11k@archiver.kernel.org>; Mon, 19 Sep 2022 02:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8eKqi1vwqCoKOiK/DxKbnPDZZlfldV5TR7h/FOmwscU=; b=bFKM8pWpG6XMh3
	TLkw1Xya4Bx5rDmxIyB/6BRhnLk8OWMo8bJbYYvvcuFK7sk22H5nFi8yUW1JxiO/wAe4ZUeoS8reb
	nxUrwF+weBKxfQT84rGD24/l7WYmA/W7POlgahRENDfXZ90IoRc1Kv5FAXZj9c+f3TbmRD5q2aQtm
	d8sXn8MQwjdPW8/NRsvHfhFOTZUbz01zHH8LECDZHOAC5J84Ctpjs43mCHuVnHyyLV9CnemGkjwjh
	dA/JAeWk/XIkSUftPCTagVVcrhqOzvjWSN2MNcaa7THUmMqfaUMLERem00lp4sxd5Vuw3csgeRkdI
	6cdCXrJRHyl3APSMevrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa67z-005pTw-PC; Mon, 19 Sep 2022 02:03:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa67v-005pQX-IK
	for ath11k@lists.infradead.org; Mon, 19 Sep 2022 02:03:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J1uId4028346;
	Mon, 19 Sep 2022 02:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=CaSV1EZOMPntyi5fjGh52Kb53RIfTU1x7tOveEP8gn0=;
 b=D1rT8S6JrgieQdfu5osi5Vy5wbhuXDSIaI7qq+VcK+VH7hLhFH/r4vDXfQ/ma2e7f/3G
 5IFPemnbAgEN4UWp/iflg8GqdC9qHhdKSZhel51hA+1chayMcwy50UZQ8Vo2T/ZP4J1A
 WCVLl47rhXN35BlhQYM2oOqeWVlQH/BQ3kRokipo3U2w8XnSfvdzt2nsoJ17Kwi+gAar
 4Gfl5IxskGxpSbfWgwUbGrx4RQAGbwRIViTH48nVKk67aT2FwgHE+iSX/Cmzyd/iV3Ro
 KVvQhBgd/Drm45r/Gf06NbWP7S45uHP63k7/5MLsyxXnTcc1ByhENK3gA4+bz+PJNeS/ Ag== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jn6qwamer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 02:03:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28J23AOs004445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 02:03:10 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 18 Sep 2022 19:03:09 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: Remove redundant ath11k_mac_drain_tx
Date: Mon, 19 Sep 2022 10:02:59 +0800
Message-ID: <20220919020259.1746-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VmEVHXN0PR--e05ez2LH7uKmoHmY5XuU
X-Proofpoint-ORIG-GUID: VmEVHXN0PR--e05ez2LH7uKmoHmY5XuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_01,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=649
 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_190315_896157_F7F35BF9 
X-CRM114-Status: GOOD (  13.63  )
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

ath11k_mac_drain_tx is already called in ath11k_mac_wait_tx_complete, no need to call it again. So remove it.

This is found in code review.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wow.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index b3e65cd13d83..4558266fee02 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -695,7 +695,6 @@ int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
 		goto cleanup;
 	}
 
-	ath11k_mac_drain_tx(ar);
 	ret = ath11k_mac_wait_tx_complete(ar);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to wait tx complete: %d\n", ret);

base-commit: c6d18be90f9b0c7fb64c6138b51c49151140fb57
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
