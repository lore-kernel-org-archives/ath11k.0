Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1186CD6107
	for <ath11k@archiver.kernel.org>; Mon,  9 Oct 2023 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xTZ9nENCZ8IfAN3DoR8IvXXOXq5ncb9ZbpPGPQF/i/0=; b=wsxU7M2sPFeIvw
	c463fcrLOEAILrrXBSt4ju8vY+jv02ve3bQetDx5vSE3afj7n6Vg403IY92GDkhKqyQmkTU3UxS9/
	syFg0Xo/kYecdlkdzkO/Huh0FoeuVx1nFLSNiJgBKkjH2PupgPT+W4S0SbiOcZETxY+YADU7Gl3Ej
	M7EdSVc+38vuSP2ex32H9GKxHgjycBP2RrcbQBxZM10jbbTMB2sTibtBvvBsIoxbmpKco/uv42O6b
	sfztWjlCTps+ANHH6tV/Ay2m17tDu6hyPGbMwQppNBIU0Kf6Oe6p4JAENoU/OAcARM39QYcQC592F
	1PPcipEbq5RydQqzQyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qptG4-00BCY2-0n;
	Mon, 09 Oct 2023 16:37:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qptG0-00BCXD-2a
	for ath11k@lists.infradead.org;
	Mon, 09 Oct 2023 16:37:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399FG7Z4019110;
	Mon, 9 Oct 2023 16:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : to : cc; s=qcppdkim1;
 bh=EUT3yna1+55BbbaWoFfRXex3+SqxJsdKJA4s4YIXlCM=;
 b=S3yrRV/KEakM6lB+9qjVWxyJSCAz6EAvI8Wputws8tA4HKZUdeNldWu06oz+ckGbap0G
 VWOztCuZaDB9uB/fv7y6GBaIPcvmCXKBAKA9M8dGtKhS2B0Lee1DE2sILxp5FMEUIK/4
 ffh8NbssPv4q93wiRMjNjXjUW+9G/kR88ccrIceMXQ+1oYjZj0SO9ucaioKaNsfYb6uf
 FU0eTwM3yAMMxAOLG5UssCgLt22QgP9hcgjraHh9/SA/PxI4O29Hsh2dVbxrkgK6BMjt
 0QtEZSBfrw99XturTR12P8S128X5k1OzmqjrNYp0YLLjrw8Nco6zrLOLzri3T0CHc/Se SA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkh5930gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 16:37:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399GbDD2013167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Oct 2023 16:37:13 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 9 Oct 2023 09:37:13 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 9 Oct 2023 09:36:54 -0700
Subject: [PATCH] wifi: ath11k: Remove unused struct ath11k_htc_frame
MIME-Version: 1.0
Message-ID: <20231009-ath11k_htc_frame-v1-1-81d405b7a195@quicinc.com>
X-B4-Tracking: v=1; b=H4sIACUsJGUC/32NWwrCMBBFt1Lm28hMqtH65T6klJBOzCB9mNSil
 O7d2AX4eQ7ccxdIHIUTXIoFIs+SZOgz0K4AF2x/ZyVtZtCoS0I8KjsFokcTJtf4aDtW/lQZ5z0
 imgPk2RjZy3tL3urMQdI0xM/2MNPP/onNpEgxGm31uWyNqa7Plzjp3d4NHdTrun4BYHdg5LIAA
 AA=
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OOjjguzu5qcAxXqtdFsmhyF6n7M-Lc6q
X-Proofpoint-GUID: OOjjguzu5qcAxXqtdFsmhyF6n7M-Lc6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_14,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxlogscore=717
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_093724_847040_C7E66DA1 
X-CRM114-Status: GOOD (  12.41  )
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

struct ath11k_htc_frame is unused, and since it illogically contains
two consecutive flexible arrays, it could never be used, so remove it.

No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/htc.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
index f429b37cfdf7..d31e501c807c 100644
--- a/drivers/net/wireless/ath/ath11k/htc.h
+++ b/drivers/net/wireless/ath/ath11k/htc.h
@@ -156,18 +156,6 @@ struct ath11k_htc_record {
 	};
 } __packed __aligned(4);
 
-/* note: the trailer offset is dynamic depending
- * on payload length. this is only a struct layout draft
- */
-struct ath11k_htc_frame {
-	struct ath11k_htc_hdr hdr;
-	union {
-		struct ath11k_htc_msg msg;
-		u8 payload[0];
-	};
-	struct ath11k_htc_record trailer[0];
-} __packed __aligned(4);
-
 enum ath11k_htc_svc_gid {
 	ATH11K_HTC_SVC_GRP_RSVD = 0,
 	ATH11K_HTC_SVC_GRP_WMI = 1,

---
base-commit: 453a62a3ee65aeba6e69bfd09227fc2f19290bea
change-id: 20231005-ath11k_htc_frame-f796cff00064


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
