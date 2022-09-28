Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978F1C04A95
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOyKmKBffvZE3D4G7NjOLu6eQ416zvsOTnXBOwpoGPA=; b=QzCBv2t7Box2KM
	igyfDbcOD3vsPru1QIDYo/B3/Z1Nt4KzSIfI0LYTmkcVbRr4UogD77J3N1lgqXpTpscuRf6wHGNq6
	QhejCLtXnCE7ilJpJzyow/Z7ZjRuU6WYdN8bhDaLQBKXP1yDhf1z5RpSXF31ul15tLQKOMMH1VEvm
	wZt5TyOVjrX3okoOx2ooZNyML9ZXQYw3QXiGMZlNA9Mpx66X56wjw6IgU0omulvmw1bvsNhoixyM+
	EMTE87DtBb898ItiTjWjDQYaKcj5Bm64ioHfD1ow7KQy0QaNGeVRIsiRbhuBvo7FJsK4YT2mWsd5u
	ESMrYHgtia4yfXd8Gd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDl-00Epku-PO; Wed, 28 Sep 2022 08:15:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDD-00Ep6j-BX
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 08:14:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S5rR3A005343;
	Wed, 28 Sep 2022 08:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=StiZYGpC39uRTAXR4wo0W9GBWDRHwvdH+Rd8rUztDBk=;
 b=mm6IOD/uiH9WGFqMlSqIP5engSZq7N/CpZXnvyYqsl3c9j8MKvIyTDpuXv+g3xoAP5GL
 5JeCX0cgtUANG5e65Erfyx8+6xYsSIjuNYRMt7kZV4b72by4qyjIRJrgexVjyfpubugk
 1ys0CzzHh6ylxRww0P77OC/DCHqZ5RJLmLxuuWHcPjhn+WE1mfaxtlnpZNiSNZY1HCJ1
 7yCyJmrorHLf2IVGx1VrfBbO6a+YLA+xpdnCu0wjiPtYjVypQNwHe4aADdnV9dC+u5qY
 Mnzmw9YRPI6mHTHKA80SYfqBiLyVuIQl1OMvFilrYhSAN+MjjDn+kPsRWyaIBmD3G/5P vA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3juvnnk8ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 08:14:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S8EX4f005086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 08:14:33 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 28 Sep 2022 01:14:31 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 1/2] wifi: ath11k: change to set 11d state instead of start 11d scan while disconnect
Date: Wed, 28 Sep 2022 04:14:12 -0400
Message-ID: <20220928081413.27339-2-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220928081413.27339-1-quic_wgong@quicinc.com>
References: <20220928081413.27339-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s1zjpZVPWAYZkRLEwSN9CL4fRj_YraWh
X-Proofpoint-GUID: s1zjpZVPWAYZkRLEwSN9CL4fRj_YraWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209280049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_011435_529828_87656401 
X-CRM114-Status: GOOD (  18.90  )
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

When switch to connect to a new AP for station which is already connected
to an AP, the time cost is too long, it arrives 10 seconds.

The reason is when switch connection, disconnect operation happened on
the 1st AP, then 11d scan start command sent to firmware, and then a
new hw scan arrived for the 2nd AP. The 11d scan is running at this
moment, so the hw scan can not start immediately, it needs to wait
the 11d scan finished, it increased the time cost of switch AP and
even happened scan fail as log below after apply the incoming patch.

[ 1194.815104] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
[ 1196.864157] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
[ 1198.911926] ath11k_pci 0000:06:00.0: failed to start hw scan: -110

Change to set 11d state while disconnect, and the 11d scan will be
started after the new hw scan in ath11k_mac_op_hw_scan(). Then the
time cost of switching AP is small and not happened scan fail.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Fixes: 9dcf6808b253 ("ath11k: add 11d scan offload support")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4218211afa30..b0c3cf258d12 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7190,8 +7190,12 @@ ath11k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 				    ret);
 	}
 
-	if (arvif->vdev_type == WMI_VDEV_TYPE_STA)
-		ath11k_mac_11d_scan_start(ar, arvif->vdev_id);
+	if (arvif->vdev_type == WMI_VDEV_TYPE_STA &&
+	    ar->state_11d != ATH11K_11D_PREPARING &&
+	    test_bit(WMI_TLV_SERVICE_11D_OFFLOAD, ab->wmi_ab.svc_map)) {
+		reinit_completion(&ar->completed_11d_scan);
+		ar->state_11d = ATH11K_11D_PREPARING;
+	}
 
 	mutex_unlock(&ar->conf_mutex);
 }
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
