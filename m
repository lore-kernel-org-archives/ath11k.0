Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F6CD8C9F
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=; b=FB85ZoTlPYXZQ/6EdJjgFX0sae
	FURJFbSC00GTCYikNZzehdUcjpH9P8YRKhtwOw4Rk0VPsn68pOeOpieuS6rzjbknhwG5D4ZYxBWDm
	4uSJssQs1cqPnrKP2rSJg21gxScJpJrmhCbwxyZn+956PplwvoQrzu81N6rdlhTcYhRNM0Ov39AcI
	GoOrfCpsh9Q6JQBgjnAjSw5gP1oaq4ErdBETp8D98Rm95TquQjyBlk9kIHAkAQ5iZzMqgeiUT5Mzt
	n3PPPl5r08fp7tRbff7bGOkgSzFF0yn13Ru3j05e8LKV9+u0ggAnaXZDCivn+vm7Z1gE7gKvtfkiS
	1c4z6mzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgM-00000003ZcM-3DBb;
	Mon, 08 Jun 2026 13:06:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZgJ-00000003ZX6-0apl
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 13:06:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9ej72993374
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 13:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=; b=C5EoX5RUXXJK7u6m
	RRyvcZsl6REfWKwaP9rD1ripgKNHPTpLRNORBrWJuhKlrT2DrFdYvoZrn//g6SvY
	YeAewgMrWVDXbaa6EXNfSl/zZo7ZCWZQNUuRg2muFFKayJEO0Of5w0EzUbmGQYPQ
	xKRh2/KPRhF6eR2k77i72/YhFhZP3r3ybx0vIVWDcTDdtIZYwT8kGmsWqtUOs9sU
	8T4j+e/KTTOio03E1FPzK2g58NVvoF/DUABfLOfom0uNkL0UNisitJrYkhbKcvdu
	ij3QgcgOoWx23/AF6feBtTTYRcvt8gGjSaHWedtSbShaeo8f1M/pi6OcucmsCP3F
	i6m0uA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuna8rmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 13:06:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304df51ff3eso3858726eec.0
        for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923978; x=1781528778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=;
        b=ax+bld/YEqob18qwsd/2Didt2d4+OXwTW1SgabIEkg9TQNyAUrgmFpwDQiP9Aqj0uA
         /krQd8mKpzC//2I7SU225eMNtvuvJdreXaINPb9suCScmnTyK95NiGJjFO7vnpO4no3K
         YwgAnDx4IF3WdZ2HGuGnixdxSXCuhQeJl4tDws5s+uMzM5VgLVvQsVHtTimZH4a1Po92
         pTtCqPBDcThP8OaXj7v/Ie0lPAckujIqa/P+TAWQElBwBf3izY0an8NY/IVgzjKROC3r
         RQaJCehPLWFosLxHU0WnyWHABGlRYXjLgTvrkHqSwJ3pm7PSxKGc0YqNheJ4Y4ah/yN8
         n44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923978; x=1781528778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=;
        b=iQXBE9PceDuqH33qu7z2OCuSzgYrh9cvxdQId8aXK/wYUCJS+dHQX8QNUBlUreQJad
         xyMe9yYRQUac5rbp8FRo7V2Q0Jn0gFXZpE1xBj7A90RxkHs63I+V9f0ZPGCY3NJcObWH
         +CM5yCTxlRIaX71c0FroWNvyWuEhoekbU2jnbtZk+iw1t+pdYAsTwhHMySp5MZB3JAu1
         FEjPbexZAoMAVPifCJNcy66CdKXYhemVRoZTi0IikhdUf0BjDJTRCMShg+fgSVVl9ApY
         iPkcrMRXdKe8zjS5BlADIh+Mf/ebT3FJcPiP7bZTEoaSiCmPMidulJw2GV4COsGt1IPw
         BPcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9H3ejSFqVZXgltqnQW/nbkOZGBMv2osntsfz2Yl1KF/1a9cnCS/UOSyEJtdryneP97v6cflvs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyNO+Nbf2iakS7cSizzjENfNhSJOnfm8+0YuU6FpRstTfvOK4G
	7/tk2ruH+AA40IijcbYVFsxOMYIXqQjPG3/u46gj9RKl2K2qmGm6C3wgnQnFb4fyfkc2GtPyMPy
	rcKKcFXzluNUHnUHskMu8iz/DYpD6CnjSUlCkdr4XkDQhgzxLGAM1X7+fsOxEOsVimrmTms2r
X-Gm-Gg: Acq92OHeflSogTyizuPCuJtjPpk2QVv+2o8WFY2TLml8txHojafkuji7R+16QUIsK2f
	0i6H25rDnMh4uBsaO1RV7j1ivW1yh4mW8do/1qYLMUEaOayTZ0Ea2iwY/zaM/eIa3ga9CENzVO9
	EO0mFGwxzMIDoIKGvLBkWDiIazedNkdGFBvx51jVtIz382SrmBZ/gaOkvU5FQ4w7UbaB0IZeIhK
	V08FGOMkwe5+cANTcnHhE7TZvjLnG+Ff9WQsFXTktpMt2R2Ox0pwCfD7HCK67l6FDK6HXIjUi+k
	uQUuV6/VV8/OQQs/TbQJf6ghZ6OgG0Tib8B9TpNPHdDyknVUc+6HUeSYkbLm2dc6FwgrtPkYvES
	v/YO33PHXC+XcC+X7g6Y3zfWit3CZXud3bXsh3eMiEEX/AK85GjDfkip1P0pq/4XpMnCedPdDKK
	YYIuILVmwEJ4A=
X-Received: by 2002:a05:7300:8190:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3077abcee73mr8816018eec.0.1780923977637;
        Mon, 08 Jun 2026 06:06:17 -0700 (PDT)
X-Received: by 2002:a05:7300:8190:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3077abcee73mr8815986eec.0.1780923976847;
        Mon, 08 Jun 2026 06:06:16 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dba9d43sm15666701eec.10.2026.06.08.06.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:06:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:06:08 -0700
Subject: [PATCH ath-next 3/3] wifi: ath10k: Update Qualcomm copyrights
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v1-3-e1a71f92d447@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v1-0-e1a71f92d447@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNCBTYWx0ZWRfXyZ3YaNefFWpg
 O/xl4pnZV439hU1P1r1s++v2MtaXiCZcytxBcLfzVs3XVZ0xCnhJvQWFCsUwxiQoXn6+NjQ5BHA
 lDVK/VFemLq2UBwCv1Ot0KyWArBWnyHZ9x62gkT4QF7AIw5GTVSeMM5XGmtGwuP0OPciXjuKhh5
 9obeEcaOPWFpVP+dXe/1d9PQhiPprakPBaXRlgDh/q7rPE/2QaiPe/7t57tYC8z0bXVNAfcYOmI
 BGzZfh+vYh/iwEwVBN4OeEzPQK1BvyBZG4gsGwEVJtkBhb8xHb/mH7NTpclR4LIw/TIv2TcEWhh
 DVtSn0dsBU0iPZuAibGe44JCICiNQknaxGhVxX0LzEAikoWn/4y2+ynESBwO2btW/8r9o4Ob6tU
 6CvVaEo0tXq5fBgz1r5VuDXA0kLmOWi8pCatiGfz32IXF/NgaLdCAzrtVje4nQ31NGbT9FigUF3
 dtkGD4j0V+5cKbdOOWw==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a26be4a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=eysLYOW-m-FfG_z2xPkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: hGhG-fUlkPoHmkIiC8nV8bHi-7VGOKqt
X-Proofpoint-GUID: hGhG-fUlkPoHmkIiC8nV8bHi-7VGOKqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_060619_230701_E1D7857E 
X-CRM114-Status: GOOD (  11.78  )
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

Update Qualcomm copyrights per current legal guidance.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/bmi.c          | 1 -
 drivers/net/wireless/ath/ath10k/ce.c           | 1 -
 drivers/net/wireless/ath/ath10k/coredump.c     | 1 -
 drivers/net/wireless/ath/ath10k/coredump.h     | 2 +-
 drivers/net/wireless/ath/ath10k/debug.c        | 1 -
 drivers/net/wireless/ath/ath10k/debugfs_sta.c  | 1 -
 drivers/net/wireless/ath/ath10k/htc.c          | 1 -
 drivers/net/wireless/ath/ath10k/htt.c          | 2 +-
 drivers/net/wireless/ath/ath10k/htt.h          | 2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c       | 1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c       | 1 -
 drivers/net/wireless/ath/ath10k/hw.c           | 2 +-
 drivers/net/wireless/ath/ath10k/hw.h           | 2 +-
 drivers/net/wireless/ath/ath10k/pci.c          | 1 -
 drivers/net/wireless/ath/ath10k/pci.h          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 2 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h      | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c         | 2 +-
 drivers/net/wireless/ath/ath10k/thermal.c      | 2 +-
 drivers/net/wireless/ath/ath10k/usb.h          | 2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h      | 2 +-
 drivers/net/wireless/ath/ath10k/wow.c          | 2 +-
 23 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index 52118867ecde..e4c84be44ba6 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2014,2016-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index a9cbe955e084..5a796e704ae9 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index 50d0c4213ecf..7fdc06fff79f 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
index 8d274e0f374b..95ee70d23370 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _COREDUMP_H_
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index b7520220465a..fb61e53ff4c3 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index b9fb192e0b48..7f7be7c69232 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2014-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index ce9b248c12dc..821a12090ba9 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index dbaf262cd7c1..1c2e137b6002 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/slab.h>
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 603f6de62b0a..25c6b2e2f81c 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _HTT_H_
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 25ab945fecef..faac359aa9ac 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 29e99fbf36fd..e46f579d745d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 59b6cebfdd8f..6f5019bf0b7d 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2014-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/types.h>
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index da71dce9babf..cd468b24bd33 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _HW_H_
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 97b49bf4ad80..335bc7c488e4 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 4c3f536f2ea1..d114778edb41 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _PCI_H_
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
index 0e85c75d2278..279aeb2a7dbc 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/soc/qcom/qmi.h>
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 88d58f78989d..8d4b929e8437 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef WCN3990_QMI_SVC_V01_H
diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h b/drivers/net/wireless/ath/ath10k/rx_desc.h
index 564293df1e9a..e6d92a29d2a0 100644
--- a/drivers/net/wireless/ath/ath10k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _RX_DESC_H_
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 43a6b1ba8fb8..65e941b52751 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2004-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2012,2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2016-2017 Erik Stromdahl <erik.stromdahl@gmail.com>
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 8b15ec07b107..9bb486f8e920 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2014-2015 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/device.h>
diff --git a/drivers/net/wireless/ath/ath10k/usb.h b/drivers/net/wireless/ath/ath10k/usb.h
index 7e4cfbb673c9..517afbd73764 100644
--- a/drivers/net/wireless/ath/ath10k/usb.h
+++ b/drivers/net/wireless/ath/ath10k/usb.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2004-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2012 Qualcomm Atheros, Inc.
  * Copyright (c) 2016-2017 Erik Stromdahl <erik.stromdahl@gmail.com>
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _USB_H_
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 8a2f87d0a3a3..ea18ed8939db 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _WMI_TLV_H
 #define _WMI_TLV_H
diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index 78653f257925..92af8bc63362 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2015-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "mac.h"

-- 
2.43.0


