Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98BFC433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOyKmKBffvZE3D4G7NjOLu6eQ416zvsOTnXBOwpoGPA=; b=XEUMDJMeOwAb5J
	bqpM6JLlXcAQqqYeRkbp4pOJr6TEgzf/PrEvmbjKAZBsV3yOJkNZYYEiqTZWd9svsG2lE2EIooCPo
	Bjv7b8t455XBj52SlhYFTS8PZQWjhEL1hL7pUqquzzdPKcjREDZtmCtqczi8QjF0av78TAWUE16ec
	SaFliHR0ljYzWUcEJ8m9vdQ5XYN8BNeyMhm8L1/yVIOtng7IQeT/a8VdrNq3NEwr/obun0ciEfB0X
	beR7R75UTBjwDBu+J/5TGvW6zzcTM+OhY1dJvpZzyZq1faqTCvM2NXsfIIaB0bUcG1xB+QXrJlqOw
	8d7CO4jyuU+f81zLDqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9dC-003Zqv-AF; Tue, 11 Oct 2022 07:24:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9d8-003ZpN-2S
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 07:24:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B5GFsl000553;
	Tue, 11 Oct 2022 07:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=StiZYGpC39uRTAXR4wo0W9GBWDRHwvdH+Rd8rUztDBk=;
 b=PbdhXSROkBMozUnkyW5Vai0rzZa/lj1KSxiIEhXDfat9H/0Vo3sAudDQKFcqqw8IkU8m
 xNjQ2hhA6Bnrfx0nnVfGjpyW50cHKIgBQVOIYXLYwbwpKYI09ySya4GaUl3KEs26dbxw
 l6tKr1/C/4yo+HFe72joyN7i9ly2xWFReFj4E3qiEZ3vzSAlXYm4s3UKLXQbN9yGGcuX
 OK6DoI2UAGOoePMBzTTxnMJGBboes3Fpjz0VPvUawizJy86X74E+UN4Yh5hDm39uhBdx
 TXIq31heIQ9WFujiDGnrBeP4Vjtsqs2yZDMETXHs8OfSWtncvhQ5p6mheBelotEh1mfu fA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k4rwy1eyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 07:24:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29B7OiHH002439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 07:24:44 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 11 Oct 2022 00:24:42 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3 1/2] wifi: ath11k: change to set 11d state instead of start 11d scan while disconnect
Date: Tue, 11 Oct 2022 03:24:07 -0400
Message-ID: <20221011072408.23731-2-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221011072408.23731-1-quic_wgong@quicinc.com>
References: <20221011072408.23731-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9-eOLE8nf8NVNZMxk9eqMgmi5-UtaXG1
X-Proofpoint-GUID: 9-eOLE8nf8NVNZMxk9eqMgmi5-UtaXG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_03,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210110040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_002446_138287_B2D0DE72 
X-CRM114-Status: GOOD (  17.75  )
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
