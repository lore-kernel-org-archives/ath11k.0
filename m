Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E69CA0EEA
	for <ath11k@archiver.kernel.org>; Fri, 30 Aug 2024 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nnxVEnhocjHvzatUPU0zkK03weelDH6wgz+zQlZtLNY=; b=yRRdJH66iqkUNiTFXpct7wDnyO
	acwRXnn6+whisAiD6eZIKeQLr1TJU5DA34U69F5vh7zM2s8MirxBpc6GOXZCGStXqbX5iaFt2TXTJ
	4FLpc7ImCr16lH0eVsse2ofeLQijAUWjvZUFpXR1jowLEih66JJ8uxVVyrvs3EEhIT8LzB0yojONq
	ifVSf3b82yIyt79EixlZgW8PsOBx5hjXUxenAE8a1Xq3VQXJV8T5d0/FftJ5/q8AtsZdHFN/zGddG
	xR5LY6aMcvTIq2DLm0sy10DYNxGDdAPVV2UUOkma8tb6K0hY+3tCoKVW36qWzOo+etqM2pfNk/KtR
	VVVA0CVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwAd-000000059Pu-060c;
	Fri, 30 Aug 2024 07:35:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjw9Q-000000059F6-2fOT
	for ath11k@lists.infradead.org;
	Fri, 30 Aug 2024 07:34:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGZXn8026587;
	Fri, 30 Aug 2024 07:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nnxVEnhocjHvzatUPU0zkK
	03weelDH6wgz+zQlZtLNY=; b=Xsqol21O8HaTFvA2kDwlR60NsWnPUtx6EA6lDy
	r1VLkXjw3vKcbLjEQIWb21rYo/9Z9obE7felOKSblO5rYtpvVJeZwxyoyq8th+iJ
	tDOoQVe+bgHc9fRkrZGoSsRvCZ9Ya34QIO/TYwwKJzXUCOBrZukgEsZRhaaHncOZ
	7d2bFlq/mXzH0sXlnTcUo+t8RkMUKBTiHSmVOp8MPaiKT9ZVFowb2uNkuJ1AODrh
	afsk0qICIIZPVzAz1RY8NCUw5dpX8nmzxBNJ5dYlWdCm/MCKCMAQpzgyVN6p5olW
	ZHXv1OXS0C2jzubzvTPqrM6+uJe/AKdt3Vqf3FJETiK2rVnw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puufqbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 07:34:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U7YVRr016348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 07:34:31 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 Aug 2024 00:34:29 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH ath-current 0/2] wifi: ath11k: revert hibernation support
Date: Fri, 30 Aug 2024 15:34:18 +0800
Message-ID: <20240830073420.5790-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ySyWZ6_FOaTOT9wfEhbOI369QmGy4g-e
X-Proofpoint-ORIG-GUID: ySyWZ6_FOaTOT9wfEhbOI369QmGy4g-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_03,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=589 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_003432_697355_45DDD4B5 
X-CRM114-Status: UNSURE (   9.20  )
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

It is reported that commit 166a490f59ac ("wifi: ath11k: support hibernation") breaks
system suspend on some Lenovo platforms. As there is no fix available, revert it for
now. And because commit 7f0343b7b871 ("wifi: ath11k: restore country code during resume")
depends on it, need to revert it as well.

Baochen Qiang (2):
  Revert "wifi: ath11k: restore country code during resume"
  Revert "wifi: ath11k: support hibernation"

 drivers/net/wireless/ath/ath11k/ahb.c  |   4 +-
 drivers/net/wireless/ath/ath11k/core.c | 115 +++++++------------------
 drivers/net/wireless/ath/ath11k/core.h |   4 -
 drivers/net/wireless/ath/ath11k/hif.h  |  12 +--
 drivers/net/wireless/ath/ath11k/mhi.c  |  12 +--
 drivers/net/wireless/ath/ath11k/mhi.h  |   3 +-
 drivers/net/wireless/ath/ath11k/pci.c  |  44 ++--------
 drivers/net/wireless/ath/ath11k/qmi.c  |   2 +-
 8 files changed, 48 insertions(+), 148 deletions(-)


base-commit: 8fb3b2b8d6d489416a7ff8a28cd4083340ad9e55
-- 
2.25.1


