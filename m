Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8E8C77B7D
	for <ath11k@archiver.kernel.org>; Thu, 18 May 2023 10:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t3/XN8KEVbdTg6ZS8H56H2enwFZk7zpb6iXJWfJs2eU=; b=DhyuRttuCLuKwf
	jfjHyM26N63+1BbYR0rrzHP0Va8TiSo657dd1bw6Qtmg7r27B8yRNG6DWmODY+unfJfBwY22BVYJM
	rJGf8DSSaKig8ogCunQZg9Be7aWqWiZ7sQOUagKGJYEgFE0bL9ZGl61Ksnfny5W4Q6S6z6x67ssUm
	e5yt7+m0LfLAWglWHHTHkouX/lhIg1MSI+vnvQj4a2/lH4qXpXHwcF9dCOJ9BYrCQ1MSpJg/KGCuJ
	uNc9w6ZixNdmqego67c+s6noF9f1H2LbV8b5NFK5r305SWquZ3GiyvjH+nYGqMOZtZDqBi0E3aAhQ
	+PqRI9oBzOSJJH1tfISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzag7-00CYq0-0Q;
	Thu, 18 May 2023 10:16:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzag4-00CYow-21
	for ath11k@lists.infradead.org;
	Thu, 18 May 2023 10:16:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34I9MxTn026082;
	Thu, 18 May 2023 10:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=JEVX8pEPD94rUojJY4xzpBkzMAMLCprO2F1bVreNICg=;
 b=htIwSqlwgTuftXrKY9AHow/4f+J6ueKKe3OMAn2V2JR3EmeLjT8cZLDZ7G2u03RKWH/H
 JIWbBTzYwZ2ArXa0Xi4uyUQUSEb7d+Kuwd0LF5+YAEUryJ3xxO2ojvdhPwV/ExfEm8NL
 OR+c0ToeM09trbSVO+KAEskD8mSPnSh8wlRyEgyhUrp6McGiMSfgxvrX19mmS8gvu4a5
 JTYL7Wht4TBEgUZMBBcwaio0hBs0RbuMXtcdG8pbnOqPAF3UxO6IzgBraucZ0//DPrAE
 i3Zzhfy00Rpo9/J7ohfgJ9J20u9RBtzABkNypvr6ZMDgTSzLyTxoyahHVrlUlhQpvDgT tQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qned30eeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:16:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34IAG7vd004981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 May 2023 10:16:07 GMT
Received: from hu-mpubbise-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 18 May 2023 03:16:05 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH 0/2] wifi: ath11k: Add coredump support
Date: Thu, 18 May 2023 15:45:44 +0530
Message-ID: <20230518101546.27998-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6rHvsek6QE15RQlhHByD61eCM1SDAzWo
X-Proofpoint-GUID: 6rHvsek6QE15RQlhHByD61eCM1SDAzWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_07,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=613 priorityscore=1501 clxscore=1011 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_031608_669764_D0933981 
X-CRM114-Status: GOOD (  16.07  )
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

Add support for devcoredump in the driver. This helps in capturing
the snapshot of DDR memory that firmware uses in the event of a
firmware assert which aids in firmware debug.

First patch in the series adds the coredump infrastructure to the
driver but no hardware support is included. Second one in the series
adds the support to capture MSA memory during firmware assert on
WCN6750.

Manikanta Pubbisetty (2):
  wifi: ath11k: Add coredump support
  wifi: ath11k: Add coredump support of MSA region for WCN6750

 drivers/net/wireless/ath/ath11k/Kconfig    |   1 +
 drivers/net/wireless/ath/ath11k/Makefile   |   1 +
 drivers/net/wireless/ath/ath11k/ahb.c      | 127 +++++++++++-
 drivers/net/wireless/ath/ath11k/ahb.h      |   8 +-
 drivers/net/wireless/ath/ath11k/core.c     |  18 +-
 drivers/net/wireless/ath/ath11k/core.h     |  19 +-
 drivers/net/wireless/ath/ath11k/coredump.c | 225 +++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/coredump.h | 147 ++++++++++++++
 8 files changed, 541 insertions(+), 5 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/coredump.c
 create mode 100644 drivers/net/wireless/ath/ath11k/coredump.h


base-commit: 610b78b97bad8f3e77c27a15e9a03cbbb4109697
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
