Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967E6CA0EEB
	for <ath11k@archiver.kernel.org>; Fri, 30 Aug 2024 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXr9x9Q8Bfb9PPp7A3lgrzakq6u7YQBmpPgVurJexIQ=; b=jZXWlzOYZRxxBXJOG6LuUwEiAr
	8moiTaQv7WsTAb6mPqvS5qdCVjDEo5/mJ+a8l2V9YCjP3PMCiMWTXCRruTxNzrlYczdBELWVB++oa
	2raw/f1fc+HJ5pYns3SUfLfF3O1MmvZIAEATuf7KGCkfJZUZMHuCVDKNUhZH4Cl0C/KNCf91nmOQQ
	3d5BO2N1w/vf7EjoVSwfwtskv9209svXfNnoJhEQ/EtpbmeNPwQpI8BfSgsKrABbCrjoV6wlYAO+x
	UCtm9vdUMsCxly/gkxWSyUPcoqHkQv/hAK9Ym6iNgAqT1pMiLLEpxDPuIeuAmc9FE1yrcLMddZ/SP
	gwbAclyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwAd-000000059Q3-1wSv;
	Fri, 30 Aug 2024 07:35:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjw9R-000000059FN-2Dud
	for ath11k@lists.infradead.org;
	Fri, 30 Aug 2024 07:34:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U7TtlR005860;
	Fri, 30 Aug 2024 07:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXr9x9Q8Bfb9PPp7A3lgrzakq6u7YQBmpPgVurJexIQ=; b=alP3wnrLVyMBl07o
	0kIpS8OI6rR7K6LpHAoHV812hKAlU9Smf9dN2zgsiNWEZxGwiuYd7zh1bDP7ajE5
	oi8FeE0rw4sMzPEWeeMqU2i5tml1/89Oc8Vp9KPSYQz1KttNT5YNQGiqpXB6ZnvJ
	4SQlUQ3KR8QezUmsFzMIQR0MSf5ccQLjmt6HtHcKqKfDiNLDl84CAzcFs1qpH1Yi
	+FfgOmByiMsUSizLJxkA48mJyoTCZ0E+n1DXHzrFllsd0qt5QmoIo/DoLwG6uSW3
	42KiagECivdQub0SO8tviinb9cvhc3oIEFC+WRvWxRi/tZlfvsdOsBKQwmTcWetl
	bZS31A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putyvkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 07:34:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U7YWaX011660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 07:34:32 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 Aug 2024 00:34:31 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH ath-current 1/2] Revert "wifi: ath11k: restore country code during resume"
Date: Fri, 30 Aug 2024 15:34:19 +0800
Message-ID: <20240830073420.5790-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830073420.5790-1-quic_bqiang@quicinc.com>
References: <20240830073420.5790-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yDwLeWh1Hj0FNz0aeUVYP3753MXqTbwS
X-Proofpoint-GUID: yDwLeWh1Hj0FNz0aeUVYP3753MXqTbwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_03,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=914 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_003433_594734_7F6C43D3 
X-CRM114-Status: GOOD (  11.51  )
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

This reverts commit 7f0343b7b8710436c1e6355c71782d32ada47e0c.

We are going to revert commit 166a490f59ac ("wifi: ath11k: support hibernation"), on
which this commit depends. With that commit reverted, this one is not needed any
more, so revert this commit first.

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 03187df26000..325b930aaf06 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1009,16 +1009,6 @@ int ath11k_core_resume(struct ath11k_base *ab)
 		return -ETIMEDOUT;
 	}
 
-	if (ab->hw_params.current_cc_support &&
-	    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
-		ret = ath11k_reg_set_cc(ar);
-		if (ret) {
-			ath11k_warn(ab, "failed to set country code during resume: %d\n",
-				    ret);
-			return ret;
-		}
-	}
-
 	ret = ath11k_dp_rx_pktlog_start(ab);
 	if (ret)
 		ath11k_warn(ab, "failed to start rx pktlog during resume: %d\n",
-- 
2.25.1


