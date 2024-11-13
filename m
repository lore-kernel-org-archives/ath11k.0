Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C17D597C6
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 01:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MvYtrtYxpjQGb6VvJMn+6xzx13Vs+ggyDsTHj5CiR/U=; b=hG7Iq7QG/VnC4vkMuo+0Bt8aJ7
	Kqi0rX+EkIv6IHQqcCkpR8S+2QWGvIv57kQ3ZEPytW7qGA0THCaszTbNt/c25eozBcoW0CMJlLUcs
	ngiWiE7BsWFr/OCJFrz6ctdI5JAxu2f5njbZGRkAbrqJD5oFZIgKAorRiWlyj+T20hn8ohQhYf+0h
	JuS851TxpmD2djyE4X6s9k63+h6+nv3i9+YmzDlSF7WrgLNc7xVT3cq1FFKqMUi8T4ZNUcTg2tlOS
	EpB09ikGbG3iw2n5reNgRZfNZqWjm8z2hrwFJZl/wg5cKdW1QsN028p0iqRsZ2sCYsmT+PNGIspPg
	dcimvLmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2cj-00000005YRa-1Mr7;
	Wed, 13 Nov 2024 01:56:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2cf-00000005YQX-2NQt
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 01:56:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRTId019579;
	Wed, 13 Nov 2024 01:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MvYtrtYxpjQGb6VvJMn+6x
	zx13Vs+ggyDsTHj5CiR/U=; b=FpUGdnwCmp3rJMm6ld401gDjZF2LJTUBZVy9k1
	7IV6IjIz38KrU4LnSWangHTyfiioFCEvOpItKM/HbSLZNJg0Bm/vO4juVGOhnZVw
	jflpo8A9yWlo/caPFqdQJ7ibevrYD15zE6QFwZd2xlLSglfL9laOdML0FDEFYk23
	bHbirr3coX1ZOl4S3WsWfhoKm6iKJeRksqQjVHB6/I9h5teEPAxu1SpF22y0DKQh
	1AHgrdTTQwalFh/VdwZK9RWv5qqK1Md2ro8powMeVGZAJQI9rD5oLjpc4uRACScp
	++9lmBmGgmWWYt3I65JJ46UzShfxmd6L8xFGGrKj4olmIJXQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1h6jw5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD1uhC6028144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:56:43 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 17:56:42 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 0/6] wifi: ath11k: fixes and refactor to firmware stats related functions
Date: Wed, 13 Nov 2024 09:56:25 +0800
Message-ID: <20241113015631.3105-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q7lEXP1xCF0XYX_rFupAT3237aZUOgo3
X-Proofpoint-GUID: Q7lEXP1xCF0XYX_rFupAT3237aZUOgo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_175645_634828_A3D32F21 
X-CRM114-Status: UNSURE (   9.61  )
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

We get report [1] that CPU is running in hot loop while requesting firmware stats,
fix it in patch [1/6]. While at it, fix potential failures due to static variables
in patch [2/6]. patch [3/6] fix potential issues in cases ath11k debugfs is not
enabled. patch [4/6] fix lock symmetry issue. and the last two patches refactor
firmware stats request helpers such that we can remove some redundant code.

[1] https://lore.kernel.org/all/7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com

Baochen Qiang (6):
  wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
  wifi: ath11k: don't use static variables in
    ath11k_debugfs_fw_stats_process()
  wifi: ath11k: move some firmware stats related functions outside of
    debugfs
  wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
  wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
  wifi: ath11k: consistently use ath11k_mac_get_fw_stats()

 drivers/net/wireless/ath/ath11k/core.h    |   2 +
 drivers/net/wireless/ath/ath11k/debugfs.c | 139 ++-------------------
 drivers/net/wireless/ath/ath11k/debugfs.h |  10 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 140 +++++++++++++++-------
 drivers/net/wireless/ath/ath11k/mac.h     |   4 +-
 drivers/net/wireless/ath/ath11k/wmi.c     |  45 ++++++-
 6 files changed, 150 insertions(+), 190 deletions(-)


base-commit: fc6f018eda7f9054e427f731db1e8b200f22873c
-- 
2.25.1


