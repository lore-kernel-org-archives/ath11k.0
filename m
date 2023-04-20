Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AFBC77B73
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOhExqAPR6rqqGSkHEi3ZVJPXDUrOwiIHFgHSMdZ7tc=; b=YS+3KLNHJ7RvaR
	1ejYaSND+H8uBSmY0daVO8rVBMM6gig+CKOBwjihhcovptZOzRGn1f3K3VUV6D0cuvMKYq/xHOuGG
	kVEeS+t/ufLqgyz1nGoCYVkR38XhcbCOGOPPqr7lG+9Cbx+HOKtnQMMUOO6tnszm/Aax2kLzLm8hK
	YVu4x7SI6ottJNvU6sJxOYcgYVDDJNqJxnTVyGPjP4e739x8pnqBhwye8OnsyR5my6EV6IZiXrtfp
	rPVbsRXIZcHVtH+144F2ajTd0w8eg69nTAvUPSFlJpNqgh0BvGI5zqrWLCO+TL5xnyhRjutGLv1SZ
	GbHZIY46W1EHAliAeujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppT6H-0080pu-1V;
	Thu, 20 Apr 2023 12:09:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppT6E-0080oW-2M
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 12:09:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33KArbSp019021;
	Thu, 20 Apr 2023 12:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=p+TbnmmYvqSa77jOGPBaTOH0lEIU5dKKi6f2LvhZta8=;
 b=VOioj4OrVbNFVz0vofbOEdzBAAXWDTusI61ZgpSBeNxalaR4zDv5iKr38efou1/LpdY0
 wAga4kS/SkQz2ClZsIGsTl0JzSRv7ME+yZArO9gsZlBJ1QcjEphAJF6iTaT3sGBTzZbK
 PDFqjPmBVDT/FT6a8kPODs1oZqQ6xiqx8nq/42lNIEIHEvunv60Sqxp8/gc14vj9vtgp
 MFiItgUKVtPCAEvUGXfGcXpumxVuY+W6DvvxpRN9cOIFDVJTYFvkxYXizkK3YOyaFDyo
 Yclqw8aflOBb+nNib5CUonBIree1HJyU3cWwIWHEeJulw+WeX2/e/EJ4ZnY68NHSKXvO Rg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2ryq1kam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 12:09:17 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KC9GQA001496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 12:09:16 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:09:14 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Govindaraj Saminathan
	<quic_gsaminat@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 2/4] wifi: ath11k: optimize ath11k_tm_cmd_get_version
Date: Thu, 20 Apr 2023 17:38:38 +0530
Message-ID: <20230420120840.18712-3-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230420120840.18712-1-quic_rajkbhag@quicinc.com>
References: <20230420120840.18712-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bWLspQSyZXwGGUp3TaYJ_Ae9IN8_CjJz
X-Proofpoint-GUID: bWLspQSyZXwGGUp3TaYJ_Ae9IN8_CjJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=870 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_050918_886383_0CA477B3 
X-CRM114-Status: GOOD (  15.79  )
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

From: Govindaraj Saminathan <quic_gsaminat@quicinc.com>

Currently ath11k_tm_cmd_get_version() uses local variable ret.
optimize ath11k_tm_cmd_get_version() to avoid local variable use.

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/testmode.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index ebeca5eb6a67..f562f860ebf3 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -24,7 +24,6 @@ static const struct nla_policy ath11k_tm_policy[ATH11K_TM_ATTR_MAX + 1] = {
 static int ath11k_tm_cmd_get_version(struct ath11k *ar, struct nlattr *tb[])
 {
 	struct sk_buff *skb;
-	int ret;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_TESTMODE,
 		   "testmode cmd get version_major %d version_minor %d\n",
@@ -36,18 +35,12 @@ static int ath11k_tm_cmd_get_version(struct ath11k *ar, struct nlattr *tb[])
 	if (!skb)
 		return -ENOMEM;
 
-	ret = nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MAJOR,
-			  ATH11K_TESTMODE_VERSION_MAJOR);
-	if (ret) {
-		kfree_skb(skb);
-		return ret;
-	}
-
-	ret = nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MINOR,
-			  ATH11K_TESTMODE_VERSION_MINOR);
-	if (ret) {
+	if (nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MAJOR,
+			ATH11K_TESTMODE_VERSION_MAJOR) ||
+	    nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MINOR,
+			ATH11K_TESTMODE_VERSION_MINOR)) {
 		kfree_skb(skb);
-		return ret;
+		return -ENOBUFS;
 	}
 
 	return cfg80211_testmode_reply(skb);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
