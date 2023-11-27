Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE233C4167B
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwGC1rL8307pnXK17/GTfZFnEK6COGbNxMZjy1/jsDw=; b=DVYsD1nhll6VSD
	3lJcQ+grGjJR6u0LAxLq/I9x46riZ02lx6GVq12Y3+kRaa4LJwfXPrQNZEYUP7260kHVCBJn6GbvJ
	lAvkzHj7sA0U+0IMhAs4Q7cyHNGYg7gMn0IHHiIdeBUhCWK4pxTHBtRuvV91ZaubkpjKoDz+KelQx
	R4iklQVm+HwBetYzY+xJbnfLEdQkSEZRC1iMAx3DARYMmr7q9kKh/qV0oCzVAl2vZTh4v8Xo1mp+6
	Dth10woJ8A1PTQy3D/AM5spriUqpGnJsb/MwaKu5ozetgoxV9c0rz+MnD/PEHZksjcOe5Kds7zWcB
	rdCu0V1Jh1FB4iCrth5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eGK-002vtK-1Y;
	Mon, 27 Nov 2023 16:15:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eGG-002vp2-0O;
	Mon, 27 Nov 2023 16:15:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARD0jji021363;
	Mon, 27 Nov 2023 16:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=AO8cGpLBaeunKrPjmlXZd/sscUATqYVwofXtEfGFPQk=;
 b=dFzAnkUE5PYAAAcJ/hb37CkI2Uy1VDsFtmS4n33luSz3gB4z2CF16bbOjbccaUrDHQ6x
 XC/SIEaK+Vrap59t/UhpEfCDiWi+B5bQFTuqLbRRygB5gSG96r3d2gDr6zQUTxydi6Ma
 i2+aWq1m+xdKkVhgEqvnzbkUYeb4ZqgVfVIAk3biveES7Uax2Brz3Xg07AYYHqUafV7w
 0ILorvwoxfX+mWIdbweGaWqSr1S2zXPxBfpY2+MmTTBiwj5fx/I1wV/7AJSNVv+NYK6l
 3Xj5s1uqMrcvvDh48ZB9vkeckW7t/g9EDMJ7Llk+GKe/lxLFJhyvOOULGoEaTE14if4S Kg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umqxh148a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:14:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARGEn6E010139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:14:49 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 08:14:49 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 27 Nov 2023 08:14:48 -0800
Subject: [PATCH 2/4] wifi: ath10k: Use DECLARE_FLEX_ARRAY() for
 ath10k_htc_record
MIME-Version: 1.0
Message-ID: <20231127-flexarray-htc_record-v1-2-6be1f36126fd@quicinc.com>
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
In-Reply-To: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook
	<keescook@chromium.org>, <ath10k@lists.infradead.org>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N3tgrD8x6g5r96BxFZlFOe_Bwz9pEJco
X-Proofpoint-ORIG-GUID: N3tgrD8x6g5r96BxFZlFOe_Bwz9pEJco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_14,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=453 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_081504_190546_CCEE347E 
X-CRM114-Status: GOOD (  13.94  )
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

Transform the zero-length arrays in ath10k_htc_record into proper
flexible arrays via the DECLARE_FLEX_ARRAY() macro. This helps with
ongoing efforts to globally enable -Warray-bounds.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/htc.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index 9cbb901d35e5..c6c392f8630c 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -246,9 +246,9 @@ struct ath10k_htc_lookahead_bundle {
 struct ath10k_htc_record {
 	struct ath10k_ath10k_htc_record_hdr hdr;
 	union {
-		struct ath10k_htc_credit_report credit_report[0];
-		struct ath10k_htc_lookahead_report lookahead_report[0];
-		struct ath10k_htc_lookahead_bundle lookahead_bundle[0];
+		DECLARE_FLEX_ARRAY(struct ath10k_htc_credit_report, credit_report);
+		DECLARE_FLEX_ARRAY(struct ath10k_htc_lookahead_report, lookahead_report);
+		DECLARE_FLEX_ARRAY(struct ath10k_htc_lookahead_bundle, lookahead_bundle);
 	};
 } __packed __aligned(4);
 

-- 
2.42.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
