Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9F9C71136
	for <ath11k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC+xxtvYYgCeXhh6pwXkgGaTGJbI1B8K+txHJMCvu4E=; b=zYGKcP+bNrSyLnKRzuMJ9dGMhU
	LL/cX2sKG3nnCP5cN6BQ1sA+jfCRCAKE3CkdL7S1bp2ho6zM8DzuOwv/c49USKDgoNsEmDjnvxAdt
	jednMaLQQjJS2pftER/d+982Ia9hHNaRuY4PdPPhvbnC5pgvjP+XN5Lcqmqkg3d+4uA3+n6Hj0tAn
	NbUAtQIfXow+LZM0kQ0/zvg3WU+spJmyWYblj7IaI0nzC1JDOmRMkiFDtDdPs9EI5JyCXyaQytwTV
	GUMQZ2XjcNHVemZOZqSfAdrV71/XxfWmAj6TPEXOtaUI3raquApBXbw95TfJMZK7jPy2QM/FRYL9P
	jsSutbQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYS-0000000B4Ip-3sRH;
	Wed, 11 Jun 2025 19:56:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5V-0000000AZ9S-1MP9
	for ath11k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFb7011018
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vC+xxtvYYgCeXhh6pwXkgGaTGJbI1B8K+txHJMCvu4E=; b=MNWD3ah3YQDWEqvJ
	g/y1aZc0m4DzG1wwg+tA1HD1kZvPtHSnX/4EkVKTjGcEYKWsaR4km4jab9ADHva6
	R4O9M6YroUyY1gDcs+DGw8Yd2td2kxA4xORKUJ4WKN3w7KnjGUo9hvSevVi5NVzK
	mcWIDbPGElQw6bDSp6u2U+75/2gugHw+rIVnBPCrJec/u1eOB9V6TzF4TjvBPXc0
	RjF2Bw2u8Lkx6VwXimsvmrEzzKJfcwZat/UKzLEOcf+Id4QZzOt6lNxFcrYnE8DD
	spfarTr+Sw7fPdoOHLkIhOsYtIZ/A+/BL7Txcy74OuO5YyS5nCEBiqeZ+0VoJB5k
	XEj4uQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpw93b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fb347b3e6so2866095a12.1
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658444; x=1750263244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vC+xxtvYYgCeXhh6pwXkgGaTGJbI1B8K+txHJMCvu4E=;
        b=eccXOXOQBPcI0c5U7Z4P4u8uIob9HHwoB+jbYvkZmf8kNhDJdzcjaSq6obKniKuWO6
         X3xNm96OZEmLNFa2+Qiq9a+fAtsBpNoewl/CpxEM4G5P1LDGMd638WS6xMcz4wv56mTM
         62Al1yAjBjtvN40Zb0atq1Daykg6btcnbaHT+oyMcPDhw4VCpiCBwcMLvu5aaVJZrTsN
         3xqwu1Nte6afj4DD1aZdC10RVk1Qo2RibKPr01JNAwZXM+jH6RPmB/XDiVqiN0L1fudF
         5DedI27grMMq5kILsvQlSnIssW3Nto/4+wzu15glCCxphZ9U/lGwkfylK08zp40qWwGz
         GlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh3JKOxpl0ePTjD+iCRJH8/eX/p7iU5LAFQLonmGQKc7DrHwH6T9l2VsqRttL0w9nDKDwR/hc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyU8dClf6RhDJY2Xpfyf3xTZVaFkS1MCKvcIvHu0As7U5+3nAmc
	Qe2yHRuDo2hxMCbTwhbcZINPEHoMK1LvU0NtHiwnvqRyGSIcPbBaDB9wYuBSjnlj/5nt6tpUbDK
	pkEe3EyNg1fsfgWyy2vL5DrWXc0noN81gINUH6AMjhdmCobxLGTjcS3iXNX3NT5yh
X-Gm-Gg: ASbGnctVkgtZmOnda0r/QIe846eaRkNwGeaWANr4WlJo8MdjhFKVQEZAOJIk/J8Q9Uy
	HS5LU6q1TxSy2cmcpgyRDJi0vYRXfVaws6XLaSq0YvYYDRE/AND8zBs5uD64+ZK4i3FRjrZOQI1
	gnsO9u/ms/vnsEyQOtmfrt7JY+xFCG237E985cmWFN7CIQiZ1LcMzUAa+gTva9n7ye3oIdVw4HW
	OdXRXxEiw0KYoL1qWLamKUlyfenzJ7WJe6UHDsAt252Rkhi8li40w3AczAzIAwMTz+tSjqaJCUR
	Lf7hklYjEWF+oaXQz0ndPO2HOFpQh8e3AqTzuxt9qqOkX0U42Q8AWnaHeGE=
X-Received: by 2002:a05:6a21:7002:b0:21c:faa4:9abb with SMTP id adf61e73a8af0-21f86725e41mr5990063637.20.1749658443796;
        Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1AbsaLs+Qh4Et0Dv8tLq0lT4GI8TdVK+xPhvb4cHdeQO2njFhkxJ5Zk1PmTPCVdukje/UZw==
X-Received: by 2002:a05:6a21:7002:b0:21c:faa4:9abb with SMTP id adf61e73a8af0-21f86725e41mr5990014637.20.1749658443185;
        Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:56 -0700
Subject: [PATCH ath-next 3/5] wifi: ath10k: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-3-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6849ab4c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=E42zS0385_rVDwRnvgkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX4ylmG9dxbRaf
 xw+6lvb7j7U7xsL5TBOFqHXN1jEOgMRcwRcg7Wl8iYqlwtL/j4VWCSVSEPLT2OffE8xv2hGvZr3
 QXnA3tBm8FyVSySMDdiL3gJX76E85FE+zX2ggb1BD5r5/vcBigmHD5kkeafZDBCJ7KiadBvn6Ue
 mpfgTPkpn3o2nzv/PBFNVDZrGVn1CKl+V/Czh7HRYNRlzWHUd0w2pbrfq0/foleV97973KRaDnM
 DsnBtgb+NL36sxw62OKMUEBX1MwPj7eAH8YbGNG4jCpHV2DDtfZaGsMbFjejsVDplYPANpq9Ub4
 tioTQdiC/R+4AFlu7xnfRyegocxlR5Gp85PYFbaxopqbOxHGis3gbZmASiIp2wkMODv+pZ/Zxyc
 FZzoWOKJpXzyIXH1DfHKOCQdxwLW4D8kf3rgkzLxa8G3/cpoNT1Ro+8cmQ8w4YpyIKs2PDor
X-Proofpoint-GUID: tCw491DoKFp19a1-PAjCqCbqT4f2pJdf
X-Proofpoint-ORIG-GUID: tCw491DoKFp19a1-PAjCqCbqT4f2pJdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091405_374503_1E7818B1 
X-CRM114-Status: GOOD (  13.82  )
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

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warnings:

drivers/net/wireless/ath/ath10k/bmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htt_rx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/htt_tx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/mac.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath10k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/bmi.c      | 2 ++
 drivers/net/wireless/ath/ath10k/ce.c       | 2 ++
 drivers/net/wireless/ath/ath10k/core.c     | 2 ++
 drivers/net/wireless/ath/ath10k/coredump.c | 2 ++
 drivers/net/wireless/ath/ath10k/debug.c    | 2 ++
 drivers/net/wireless/ath/ath10k/htc.c      | 3 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c   | 3 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c   | 2 ++
 drivers/net/wireless/ath/ath10k/mac.c      | 1 +
 drivers/net/wireless/ath/ath10k/trace.c    | 2 ++
 10 files changed, 21 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index 48efdc71d54dc699e1d43d01507a7a30c9c495b4..52118867ecde5c71b36361e3393d7579116d8be9 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -3,8 +3,10 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2014,2016-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "bmi.h"
 #include "hif.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index a89a7491a76c8b25c38a56cea4196bfbbae277d5..7bbda46cfd93c362b0d8c53dc5e8ad7e8621cacd 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "hif.h"
 #include "ce.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index fe3a8f4a1cc1b774ce27112ef7dfe6adb0b4dc2f..760d0a9ab9c2ce54717860e1c810d2b063f75e47 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index bb3a276b7ed584f4d4e7418b2e4cf7d913114869..50d0c4213ecfdce975638c66bcdebe35b6ce9d3f 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -3,11 +3,13 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "coredump.h"
 
 #include <linux/devcoredump.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/utsname.h>
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index a0c1afeda4ddf3649ceea8adbca23d771d17dc93..6410d3961e76ca2b4191052277c2072638db4b8d 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -4,10 +4,12 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
 #include <linux/debugfs.h>
+#include <linux/export.h>
 #include <linux/vmalloc.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 2da08dfebd3e7b56b149a09b5372aa0bfb8538d1..ce9b248c12dc6c0c90a9a7e081e428d439465ede 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -3,8 +3,11 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
+
 #include "core.h"
 #include "hif.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fb0d5d4cae3a1c1bcb82c3bf83d57d79c3661f07..f12243d6bee171eeccf4a57e8001cbddfd26733c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -4,8 +4,11 @@
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
+
 #include "core.h"
 #include "htc.h"
 #include "htt.h"
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 9725feecefd6fb0f073761fbacf26d6bdbaeff15..c1ddd761af3e9ff987fcfd3a55b8747e48783b9e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -3,8 +3,10 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/etherdevice.h>
 #include "htt.h"
 #include "mac.h"
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 07fe05384cdfb13924a956f7d672042b782e166f..730a6eadf093378d93844a444841fd5826f720bf 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9,6 +9,7 @@
 
 #include "mac.h"
 
+#include <linux/export.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 #include <linux/etherdevice.h>
diff --git a/drivers/net/wireless/ath/ath10k/trace.c b/drivers/net/wireless/ath/ath10k/trace.c
index c7d4c97e6079f006383b864b1bdb2fc0ee1569c5..421ec47c59bdf9967ad18e2de0182a488b9c5a03 100644
--- a/drivers/net/wireless/ath/ath10k/trace.c
+++ b/drivers/net/wireless/ath/ath10k/trace.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2012 Qualcomm Atheros, Inc.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 
 #define CREATE_TRACE_POINTS

-- 
2.42.0


