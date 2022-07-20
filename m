Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10298C433EF
	for <ath11k@archiver.kernel.org>; Wed, 20 Jul 2022 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4E9xHSxcCx0fDpGcuu52B4aQvLf203r+lF2msQgEbQ=; b=cLRSJewtODfvUf
	mabvapyS5b7jh5OvQJjXW/CrLUgJFYGF6kwUwsy7iHzgmROO5s8G7cE2W6IBi7M43aWG5AXpXJna5
	DLGLqu8EKg/duYDZw3eiQBW9ZoiqGElSaSL1BYi1E+CjrzI05hyvTWkkfEl7dn/i3pfgqsdH2qD+s
	MR066R7vbgfbfZ+xBQqLJCELci27CY+9Nk4VN/J2jkMpcxebM2X2yoI6eMwDsXQBrxen4lUzrSFsz
	u+Xld2yYFOnHcITbxj9OVVvP0H8/a4jAawQRXp3HCrC0huj5/pLV1MzfrQGdIEwkAeVYP9RYPseyS
	Zh7kXspKqcxxml/dAe+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA5m-006HjT-EK; Wed, 20 Jul 2022 13:50:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEA5h-006HgF-LN
	for ath11k@lists.infradead.org; Wed, 20 Jul 2022 13:50:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KDn6sI009050;
	Wed, 20 Jul 2022 13:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Ye5tefTy1X225QVhTCepDtdPZKr6UoRcln7OB1HlSNY=;
 b=ewh1/bIkHfafr655cnl/AhW+ZJuHbxFBg7yW3xTplDCXcoxCnaCHmNT3BtOQ0KD/oSFY
 csf/m9QlebRBgaIo9taW7ErCgyOZoqpq8yPGcUUdyXO/q1UcgSD2e3uevGLS3t/21sMv
 Y0K5TVm73YzaHRZ4Gt9kUrH/WdMbZknTNruszP0MpOkFjStR6R3WCL0QWxJnT5Ocs+b+
 eywTRHYkdT9WswHJ0v5xDh42CvEWr5HTSmeAKtINSYCoGWZ9fD7576O0mA7J3xeD58Sx
 WBCdMheNtZ1Tq9xDwNYsZqYfGlF9zvfehiwcbUr7us5TFZjyR2IPm/JtYChd6z5b2QPp iA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hebfv15ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:50:17 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.47.97.222])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26KDoGXR003632
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:50:16 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:50:16 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 20 Jul 2022 06:50:14 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH 1/4] ath11k: Fix double free issue during SRNG deinit
Date: Wed, 20 Jul 2022 19:19:56 +0530
Message-ID: <20220720134959.15688-2-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
References: <20220720134959.15688-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q2w1L2xL4CGZcWGTjqHdz9t7edGvLRjk
X-Proofpoint-ORIG-GUID: Q2w1L2xL4CGZcWGTjqHdz9t7edGvLRjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_08,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=780
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_065017_730374_B52B9B28 
X-CRM114-Status: GOOD (  15.92  )
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

Currently struct ath11k_hal::srng_config pointer is not assigned
to NULL after freeing the memory in ath11k_hal_srng_deinit().
This could lead to double free issue in a scerario where
ath11k_hal_srng_deinit() is invoked back to back.

In the current code, although the chances are very low, the above
said scenario could happen when hardware recovery has failed and
then there is another FW assert where ath11k_hal_srng_deinit() is
invoked once again as part of recovery. Addressing this issue is
important when low power mode support is enabled in the driver
(will be added by a future patch) where this scenario is likely.

Fix this by assigning the struct ath11k_hal::srng_config pointer
to NULL after freeing the memory.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index bda71ab5a1f2..ebdf3b1a6661 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1319,6 +1319,7 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 	ath11k_hal_free_cont_rdp(ab);
 	ath11k_hal_free_cont_wrp(ab);
 	kfree(hal->srng_config);
+	hal->srng_config = NULL;
 }
 EXPORT_SYMBOL(ath11k_hal_srng_deinit);
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
