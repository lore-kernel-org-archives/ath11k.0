Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D228CDB47E
	for <ath11k@archiver.kernel.org>; Sat, 14 Oct 2023 03:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yayag6DLnm9OimNnQRqnf0kPE+Zyi8GvmuEa4pCTyRw=; b=2maDXuWDGfvnQZ
	oBrkYYFKCTLGlHcjxQDlOKgh9ntvbuaJauCKIKjJ82S9w1G9Xnc979JoShJSPXFWdC/i1CU/GkOM4
	6n++gFtlgV1SgmSJUEJI8GHHHUI/rRnmFF1rkH5893bS0ksthflCR5utMFNApkbmbWnZC5/Z/FXyX
	ePGITfcZ1s8E57GrFtsOn2BMl7LcxhSHocE1YIAIADhR5aWsqYev7Axiyk3jdR8XgSvZCcntN0X+N
	DBgXEn0CI4TA1Xpp33NBf6ByWvWF1u2HLrDHFhy34KQnJYDslGIlPIQpqO8btHqNQ/O3A4LHFMIXq
	XnOeiAC0HdipvJIyXBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrVJ7-004i2P-25;
	Sat, 14 Oct 2023 03:27:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrVJ4-004i1T-2h
	for ath11k@lists.infradead.org;
	Sat, 14 Oct 2023 03:27:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39E3Qt3J027062;
	Sat, 14 Oct 2023 03:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=WoRIoC2pNy+mVCrK4MWkNJ/kwgApnFh/V14PjpnJc54=;
 b=PYQ6wyH56czXX6OxHKvfD3+0SIDZwad5Cj74uM7HzXskk7KX/U6wGyFD7TimV3Oed6zF
 2x38R5StXEA4QW71ACNkMCTHfhVXCT5+vEvue4yJo+UUn73DiAMAsKHNq7ICnv2Bz5KV
 rABBHcY357vkno76kFSZUQkbXAmz7RMcnYutxuGn/5czLsSi9mhhDJJsAm6tUuQs2Y+F
 oOvTzVyi+/ke3ma09JxZTwCR+Xnh8mnNaEqPkpWiHuDBZkTb1Els+yRkJG7kna4iBuEI
 d+phBHmCFixtHIwbAxxbw1L7hh3FZ2aJ881R3LYgWjGXMt7KdH3u/XTrAgwxoN0UmYtq pA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tqgbt06k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Oct 2023 03:27:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39E3RAjk030511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Oct 2023 03:27:10 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 13 Oct 2023 20:27:09 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: rename the variable naming convention
Date: Sat, 14 Oct 2023 08:56:48 +0530
Message-ID: <20231014032650.32605-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y8DTqIgvWRIk_HZEts-HF8KOnbJcdm0f
X-Proofpoint-ORIG-GUID: Y8DTqIgvWRIk_HZEts-HF8KOnbJcdm0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=648
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310140029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_202715_028219_B7602BBB 
X-CRM114-Status: GOOD (  10.81  )
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

Currently, the identifier sc is used to represent an instance of
SoC structure. But in ath11k ab is refer to the SoC data structure.
So rename the variable name.

Karthikeyan Periyasamy (2):
  wifi: ath11k: rename the wmi_sc naming convention to wmi_ab
  wifi: ath11k: rename the sc naming convention to ab

 drivers/net/wireless/ath/ath11k/hif.h     | 54 +++++++++++------------
 drivers/net/wireless/ath/ath11k/pcic.c    |  6 +--
 drivers/net/wireless/ath/ath11k/thermal.c | 22 ++++-----
 drivers/net/wireless/ath/ath11k/thermal.h |  8 ++--
 drivers/net/wireless/ath/ath11k/wmi.c     | 32 +++++++-------
 5 files changed, 61 insertions(+), 61 deletions(-)


base-commit: acbc21b2b1b18429244266f70a44b7043d391eae
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
