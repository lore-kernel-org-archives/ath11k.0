Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40708C35FF1
	for <ath11k@archiver.kernel.org>; Fri, 14 Mar 2025 06:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLkxTvQzpblIezC+X3oafDSrnMCuJEVdKTkizgn4mz8=; b=piYvqowHYuPqSqWwKI0+y5MNrv
	rboPSyiuQeQyWJmszC0FfXOKq5jgfOLMbaWKwwaiUkMd/65iNDu5LwbrEezqOEvvhXdvTNsTWmzbb
	UoHsaDV9yAr0n/ES0MJxxsOPzXpwVBas22AnkqecWwaeT+k4HnE1LXQwP3XlfB45PL//vZ6M0+y+l
	Bzo17TYterf7oqWBv01ZZhGePMYyn0+KuwzeGLGqKpORp9il+WSbfBnAMoDLXuHWINad4XnOice6g
	rZct4Rah9FbgDaMMoSpOQBs4ODrYUwH5n2cTJ58fgMAzL9YmnKChE+GYHJCr1L1eF2gNjCGioUPsy
	N2yc1FPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyWR-0000000DDX8-3Dqw;
	Fri, 14 Mar 2025 06:27:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyJ8-0000000DBMp-28dr
	for ath11k@lists.infradead.org;
	Fri, 14 Mar 2025 06:14:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E2eiBF008320;
	Fri, 14 Mar 2025 06:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xLkxTvQzpblIezC+X3oafD
	SrnMCuJEVdKTkizgn4mz8=; b=PXiGZKtGt4dCAQ94nh+y+3eNRYQdva7+oan6IT
	3+2iQMcTWlehZNVFN0JhZ9GrIUnUtR9LPLWSbqV8qcyAibQaGDBduh50Wu9X0XN+
	Go8shDRz09wKehBrJECXzgVz2osnNc4sjdnzY1lPk3WEwEpZrSQT8Vh0sFmFewpD
	8knJX6dOTTFRJB3IdbNOSTuvfwzYK9MqktURuFFodpzCtFVFU2pGfSgAim2B9Ize
	zJNtjfW2r8LB9cOXLmSmYvF0UM2A0IPbpRyPq6T2VQumCry+6kMA1gyaLhVGVM1g
	+tDW1TgrLIkS8RllzBcaMtSrVtwhBO0LM/GpLchVsAO9mBdw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8bxda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:14:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52E6E6nJ012234
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:14:06 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 23:14:04 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <johan+linaro@kernel.org>,
        Miaoqing Pan
	<quic_miaoqing@quicinc.com>
Subject: [PATCH v3 ath-next 0/2] wifi: ath11k: fix HTC rx insufficient length
Date: Fri, 14 Mar 2025 14:13:51 +0800
Message-ID: <20250314061353.106194-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d3c92e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=G9Sqsl_jvRD_TnvheR8A:9
X-Proofpoint-GUID: LWx9p1uUpUACt0IeYHTsFHaowHpx9142
X-Proofpoint-ORIG-GUID: LWx9p1uUpUACt0IeYHTsFHaowHpx9142
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=561 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_231410_561267_AEF30523 
X-CRM114-Status: UNSURE (   8.70  )
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

---
v2: add Reported-by tag.
v3:
 - update commit message.
 - revert the modifications to ath11k_hal_srng_dst_get_next_entry to ensure efficiency.
 - change warning to dbg when see zero-length descriptor.
---
Miaoqing Pan (2):
  wifi: ath11k: add function to get next srng desc
  wifi: ath11k: fix HTC rx insufficient length

 drivers/net/wireless/ath/ath11k/ce.c   | 38 ++++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hal.c  | 17 +++++++++++-
 drivers/net/wireless/ath/ath11k/hal.h  |  3 +-
 4 files changed, 49 insertions(+), 10 deletions(-)


base-commit: 42aa76e608ca845c98e79f9e23af0bdb07b2eb1d
-- 
2.25.1


