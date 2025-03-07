Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C329C282D0
	for <ath11k@archiver.kernel.org>; Fri,  7 Mar 2025 04:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3myaz05gJUsn4Trep8ooUM0g2cG7uUv7yvGPvMB7amE=; b=S4Ai1ILbW1b9CKnRO3/auKHQt7
	7x7BIr/N1VNszYrtqh9Cth6xbrgfiyexp/Oa+YztWdKgzd5K/nEsB1somrPr/XOLKXTUtIdyNEyZk
	RWg3d2XaQtOQN9zG17Jn28IZCeaTZ3XFXjMUNeh/ii9Hail/Ygxe8q0c4eIK6EdSSrDEO3Purn3GN
	vf1/384M+9gllyhPvUaVj34gJYBv7dG/ml8qwYKs/4cUz/FIaLR3BV6QweqO1TjtxXJKb7MDL2zay
	uZG0Nl0ZtQjAlVQ0/XeCqIkBB4IYM56bwW8J5TmLuozHg18Wm2HpTGfB9pxgcidXB77WKc4FRlDmG
	TnAeWBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPWv-0000000D8xU-2uAW;
	Fri, 07 Mar 2025 04:41:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqP1R-0000000D5FZ-1nSg
	for ath11k@lists.infradead.org;
	Fri, 07 Mar 2025 04:09:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526LFcm5019600;
	Fri, 7 Mar 2025 04:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3myaz05gJUsn4Trep8ooUM
	0g2cG7uUv7yvGPvMB7amE=; b=ZHAlsoVggCn7tpJS85kKQm4U8GwJhD4V17zsK6
	ArgUy/cKolbYv1DpgTKXpFCI/VJTW/X60VcjpcYnHsKz4lnTZ6BAKnWqv+qSFZR5
	edngswx1nDHRxzURyBly5ZIUg0MGgw1Uu8C5QBl7eG4qb+62LQ4AEpMibN1dVteO
	27AjCet4lqiPrFFRkcg3DxaahklTaPHiQ3RLUJ7tgIYrQzvYfBkgKwI9H40ZQ7pu
	K/8xpPwSiapYCqk1hkEqb0nVmvT+OkxdGVM3pFDwyqbKslkAntVvpO1EC3csk3/c
	9uK0K8A3+mNxDsZl4Gp01nR7+o6OG+QFhvDraLdlTJyJv3sQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 457kfbgtrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 04:09:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52749E7l008764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Mar 2025 04:09:14 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 20:09:12 -0800
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH ath-next 0/2] wifi: ath11k: fix HTC rx insufficient length
Date: Fri, 7 Mar 2025 12:08:46 +0800
Message-ID: <20250307040848.3822788-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mVe9xauhExAEdFDTJ0TbcDPp49n6uBCj
X-Authority-Analysis: v=2.4 cv=D/e9KuRj c=1 sm=1 tr=0 ts=67ca716b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=G9Sqsl_jvRD_TnvheR8A:9
X-Proofpoint-GUID: mVe9xauhExAEdFDTJ0TbcDPp49n6uBCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_01,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=649 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503070025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_200917_609879_8C87AC67 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

This series of patches is to address the issue reported in
https://bugzilla.kernel.org/show_bug.cgi?id=218623.

ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484

Miaoqing Pan (2):
  wifi: ath11k: add function to get next srng desc
  wifi: ath11k: fix HTC rx insufficient length

 drivers/net/wireless/ath/ath11k/ce.c   | 32 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hal.c  | 24 +++++++++++--------
 drivers/net/wireless/ath/ath11k/hal.h  |  3 ++-
 4 files changed, 42 insertions(+), 18 deletions(-)


base-commit: 3148fc3cf193dbbd2e14eee59468a510a38bf604
-- 
2.25.1


