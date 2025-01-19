Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926CDC02188
	for <ath11k@archiver.kernel.org>; Sun, 19 Jan 2025 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9ZU1qKH/r297b22EOdKmmCgp0AseUG6J7mQhsdm+r0=; b=EKFGHreVv8urz032vd4WIM81Gu
	PtJlfupO2d/Pxm2uvmF/nGdnUD2gz7OHb4Zyl59lxl+KVHlXxNWPuB65w1gwsmBafnw90b3UkqA2u
	bT7FS4z4xXqCUX0P05vRCsWAuEd8hnPl0AdvOBtIj5MdsD92aQjMxKTlpe1ToVvnK3DJ8G32840g9
	SUd8kKbdP4WNSTwdQFeEUwPJCtNry4CF0oiTmexreXhlh12oQr+GsKDYA/erDW7VdTqW/xiDrzP4s
	6a1hs9r4YRL0ZIR2UTDzoucq3nERMSVqgCNHF0tnBKwHKaXlTTKynVS6nk/XyG+NzKCoO46Jk8WsA
	KNwiinuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYNh-000000048Ll-0Qu0;
	Sun, 19 Jan 2025 16:42:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYNe-000000048L6-2tMI
	for ath11k@lists.infradead.org;
	Sun, 19 Jan 2025 16:42:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JEP1rO000383;
	Sun, 19 Jan 2025 16:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u9ZU1qKH/r297b22EOdKmm
	Cgp0AseUG6J7mQhsdm+r0=; b=elGowfOjk3BwsLAon4QW1i5SwKATBUbVHN9K7z
	cB5pVjolrW3FHyc27rtRsFMNeZ0yppT/uIvg9EP84mckSRWCQyE3MaJUC65iDL+i
	Yqop/V/bXvHYVy7KilKGcJ9orxaI7fWzjCn5HVZlmoMAqXwDnpLN9oNwJbpaTub/
	Z0TYAmF5OZk0jqpFp6fl9fB2BLAtLcyjG0OwLiyK3BWzk5E7T0/SP/b1yMLJ2IuI
	H6xWavxaC1esQ4xxJ+hI8mM0L7a5nQwem3/DM12VvgDAv55NUyPe4PAQVzodE9hY
	sbcgBUUweH8ESTUAOHefo16UQKkEJ3KAJt62vqfbVXs7Gk1g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44852d26vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:42:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JGgVSQ015017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:42:31 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 08:42:29 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <tharvey@gateworks.com>
Subject: [PATCH 0/2] wifi: ath11k: Fix SWIOTLB issues with DMA buffer allocation
Date: Sun, 19 Jan 2025 22:12:17 +0530
Message-ID: <20250119164219.647059-1-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2OCS3PcD_oN2AJv3SyNIRolSe7Qa_Qgd
X-Proofpoint-GUID: 2OCS3PcD_oN2AJv3SyNIRolSe7Qa_Qgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=735
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_084234_757463_C6E269B7 
X-CRM114-Status: GOOD (  10.79  )
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

This patch series addresses issues related to DMA buffer allocation in
the driver, specifically targeting systems without IOMMU that use
SWIOTLB. The current implementation leads to "swiotlb buffer is full"
errors and driver initialization failures. The patches aim to resolve
these issues by replacing the flawed buffer allocation mechanism with
the appropriate DMA API.

Note: This issue was reported on the ath11k public mailing list
(Re: ath11k swiotlb buffer is full on IMX8M with 4GiB DRAM). Although I
couldn't get a local setup with swiotlb configuration similar to the
reporter's, I have validated the ring setup and peer TID setup where these
changes are present.

P Praneesh (2):
  wifi: ath11k: Fix DMA buffer allocation to resolve SWIOTLB issues
  wifi: ath11k: Use dma_alloc_noncoherent for rx_tid buffer allocation

 drivers/net/wireless/ath/ath11k/dp.c    |  35 +++----
 drivers/net/wireless/ath/ath11k/dp.h    |   6 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c | 117 +++++++++++-------------
 3 files changed, 69 insertions(+), 89 deletions(-)


base-commit: 6a5fe6aaedcfadf8e32dd703ec20b1460523c22d
-- 
2.34.1


