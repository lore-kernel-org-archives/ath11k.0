Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19F2C05027
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 06:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuBSJzgDDPvgTxV1q2+x14DVtYdlapK8EGJvEACRZTg=; b=zjukwfbi5bHUD/
	qzSxWM3CS1Sxf+qeZ76DHO+WMY4EoxXum+ZkoWgpFNAEjXCy/LAlxgxX6VFWnMfvJZVvcHa4h3950
	MQnp3AIusLsOCnqqAv3Xz29ZeFFlN8KIoPV1hqdr1Uei+GxnynHTeUsAnWwlyWKNcaniYL61juIOn
	qtOMNOE0eXV5rirULG/0LQFutXimvRYIcbzS+zFSzGPy5NZnA5W7o9zsG4V2EmZYmJVYO+s3QvFaY
	rPOlM/X1vpbBRpQc9vB5b2rjJfw+33Z+0fYy2se1qxo3asxxfO76wRdSsTYDpjtnwBtPfdnlMZrKY
	H4d9wSU3b0eyAMNiuOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN73f-00AXNG-4L; Wed, 01 Feb 2023 06:57:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN73c-00AXLZ-6f
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 06:57:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3116t4mU032320;
	Wed, 1 Feb 2023 06:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=kMp2iDdEPIDlOrLi2rUM/K6vE+/A5EEzk+yp83bhZSo=;
 b=aizOQmfwtElw4Y99OLXIyLzChVNyD+QkwkMAL13tfh5B/1nf6TZYEBCbwKQY3PJhdBqH
 icyXPu74OFOcjJZuJlYPXWks/sT5cVROvVHba8AUP9fDS/hDp3zQynWYG/u8aiimJEdR
 Z5N3r/+Mq23zT4UnvkBAmv98/d36Pvaa3z2bJTWakQ/Yrplq9vjGUPzsQIzBqd1UlPaZ
 wBf3lV1xWiW8PUF3Sw5b34q0SOVNUyjbIg8w0HfSmareSXTdHx4dgYyXpDy9Nzrp758q
 VB/y/WCR2VBpehCWJPpwf3Gj6Wk7EK+hVfxU239SkNlleFpFs3JLvYbzbqLa+Q1fox6f pA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3new3ub72u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:57:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3116vMNs021360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Feb 2023 06:57:22 GMT
Received: from ramess-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 22:57:19 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v3 2/3] wifi: mac80211: Avoid BSS color collision detection if its disabled
Date: Wed, 1 Feb 2023 12:26:37 +0530
Message-ID: <20230201065638.25990-3-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230201065638.25990-1-quic_ramess@quicinc.com>
References: <20230201065638.25990-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TwwdMYMKr0X38IregJirGq7qkbSvviBx
X-Proofpoint-ORIG-GUID: TwwdMYMKr0X38IregJirGq7qkbSvviBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=946
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225724_376960_EB135096 
X-CRM114-Status: GOOD (  14.80  )
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

Don't detect BSS color collision and send collision events
to userspace if it is disabled.

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 net/mac80211/rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index e284897ba5e9..5588067b2af2 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3195,7 +3195,8 @@ ieee80211_rx_check_bss_color_collision(struct ieee80211_rx_data *rx)
 	if (ieee80211_hw_check(&rx->local->hw, DETECTS_COLOR_COLLISION))
 		return;
 
-	if (rx->sdata->vif.bss_conf.csa_active)
+	if (rx->sdata->vif.bss_conf.csa_active ||
+	    rx->sdata->vif.bss_conf.he_bss_color.collision_detection_enabled)
 		return;
 
 	baselen = mgmt->u.beacon.variable - rx->skb->data;
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
