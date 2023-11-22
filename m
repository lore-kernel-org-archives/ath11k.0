Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FBDC61D9C
	for <ath11k@archiver.kernel.org>; Wed, 22 Nov 2023 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6nsT2DeoEQkBrKEichOuC/lpyGmEPNGxCj11GXlmXM=; b=0S4zz+uoxE1/h+
	mlSIko0N1VEr8YDyYl6tB7UJXxKnrUhD7Czo0OQuNmtkINcicYjk8kYxRsoBex/kn3GsiRJ/Xx+cH
	iSwUJUr5Houe8h/y3bwyLl8u+ICEmW4Mq2CYXD6ctMrdaHv0Pd8nj++O09LhsasIU0X5NsNyHvPFH
	rRgug4dA2EzQNVbMsQAeEZ448ZUxcvbBcnG2fL9AP+j0mQ7GYYHNQ7Add9cI4pa/3ecJxIQ7B6meC
	2i+KO5sSM5LxWyX5E7JMetsjjsYa3c4iO6dCfFh1qetggkQ9mXuknegpwCKDv6EUKTB2Ox0dujHzA
	KP5XQUHMDFkBw7KhUqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jLL-001Ae4-1e;
	Wed, 22 Nov 2023 09:16:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jLI-001AZM-0r
	for ath11k@lists.infradead.org;
	Wed, 22 Nov 2023 09:16:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM6lcCT022952;
	Wed, 22 Nov 2023 09:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=QwugHiuBPE7NoEWPGK0naEOC/cOuk/PFwM38LMnkBT8=;
 b=GWxzRkOOLUYwvA7Iv//EbQ4jue/XRhAFAETmTEhszFmtdfBrEtAivW6/8+v6/RtgTtmq
 MkEIB0NZQ8cbfsCYB/4h95L8s3DhwIFIdus6usulYV4TF4dIqNC9U0DhLNBqUK+kHFag
 f1WNXCYeev6X1st6DVmpv6xPP8Jfi5Q01fxKZafNrrl0PwUSvf1rUdDOCkRXk3KQFZKc
 ZklLHq+16jj6r3JlOitadAgIA9yt94VhCLxrvVP71o6XxKI6R1MoEq9mr/zujBnM5C6k
 oRWaO/FEqf0bDRnaBPxyXYFaP+qzyJXyWhE3N63vNZHBEWGUUNTQns96LmXiZ2+mmj1I DA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugxn8jdst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:16:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AM9GDZB016655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:16:13 GMT
Received: from bqiang-Celadon-RN.lan (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 Nov 2023 01:16:12 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v7 03/12] wifi: ath11k: fix a possible dead lock caused by ab->base_lock
Date: Wed, 22 Nov 2023 17:15:44 +0800
Message-ID: <20231122091553.10837-4-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122091553.10837-1-quic_bqiang@quicinc.com>
References: <20231122091553.10837-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x41AXFjAadYSX6EwFw0x6QUZBkunADyi
X-Proofpoint-GUID: x41AXFjAadYSX6EwFw0x6QUZBkunADyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 mlxlogscore=985 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_011620_424303_C25A4C0D 
X-CRM114-Status: GOOD (  19.38  )
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

spin_lock/spin_unlock are used in ath11k_reg_chan_list_event to
acquire/release ab->base_lock. For now this is safe because that
function is only called in soft IRQ context.

But ath11k_reg_chan_list_event() will be called from process
context in an upcoming patch, and this can result in a deadlock if
ab->base_lock is acquired in process context and then soft IRQ occurs
on the same CPU and tries to acquire that lock.

Fix it by using spin_lock_bh and spin_unlock_bh instead.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Fixes: 69a0fcf8a9f2 ("ath11k: Avoid reg rules update during firmware recovery")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
v7:
 no change.

 drivers/net/wireless/ath/ath11k/wmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 83971517bac8..9798072d7e2b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7139,13 +7139,13 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 	/* Avoid default reg rule updates sent during FW recovery if
 	 * it is already available
 	 */
-	spin_lock(&ab->base_lock);
+	spin_lock_bh(&ab->base_lock);
 	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
 	    ab->default_regd[pdev_idx]) {
-		spin_unlock(&ab->base_lock);
+		spin_unlock_bh(&ab->base_lock);
 		goto retfail;
 	}
-	spin_unlock(&ab->base_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	if (pdev_idx >= ab->num_radios) {
 		/* Process the event for phy0 only if single_pdev_only
@@ -7198,7 +7198,7 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 		ab->reg_info_store[pdev_idx] = *reg_info;
 	}
 
-	spin_lock(&ab->base_lock);
+	spin_lock_bh(&ab->base_lock);
 	if (ab->default_regd[pdev_idx]) {
 		/* The initial rules from FW after WMI Init is to build
 		 * the default regd. From then on, any rules updated for
@@ -7218,7 +7218,7 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 		ab->default_regd[pdev_idx] = regd;
 	}
 	ab->dfs_region = reg_info->dfs_region;
-	spin_unlock(&ab->base_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	return 0;
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
