Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF214C7114B
	for <ath11k@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ntrnFQnFlaMDLEgX3jLGjQPUfBCLZxowGvuanAy/QY=; b=XtjCmR4mPtSE6wqyPx1H2WV7S0
	y5sdo8o6LwP1YwXV9eNSyo3uaBg1F18LXGCwzc5R6mbZgpRsa6kEJUi0YXm1x3S6B5OQpZRgW6/lF
	pG1WLU91TZYPTHRsJLIh+4pCbVS1HvPGUpXZ8D0Zzv3Gf+XuZ4aUQc8XycsYSDrXFQGXkXMA2pMZt
	DT9Wo3VYsN6RFNNO80sHYij6pD9cnlJOJQQ9eVSdfa5oF/o9m8dleksklI7qODsWPYDqyHpY90yCg
	0+cb6+I4Fbn35AlylOcODUOz0fWmwiHSahJ14lCpASq1KiuIRPZHodIFnQwCzQzp37oQHnk+PBuUP
	FrLg18Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSoB-0000000BGMQ-2oRH;
	Wed, 11 Jun 2025 21:16:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5c-0000000AZD3-1iFc
	for ath11k@bombadil.infradead.org;
	Wed, 11 Jun 2025 16:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6ntrnFQnFlaMDLEgX3jLGjQPUfBCLZxowGvuanAy/QY=; b=dp7KCzI5UuNu+HjfgwMi/Dv/TO
	kcNxc1YhUD52tkfzk0qt1gAiQhAe1DZnEEzVrUnlGdaw59YNblA2CzeQryagkHITbTQW1YCUXNO8v
	CHE+e6B+/ArUuQuy/FACivpCf3yEapkkLIES4ggAjsLORfwj+HauX9jwOIgOZTIA/m8OcALuBpZ53
	MEL/WvEgn0IXGrF2aFXVNEg4+r1Enk7baB4zBCWNlqUQ6M++GOrimtjjA8zYIhFNM/yX5gaMqIvWx
	u1ZukDuobev2xzYvovNaBTMqwr5UlkRMykh5u7Xuvj23qf90rCf4vM/m/wF+iHf8bC3872SVBPJby
	pZ7DTSFw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5Z-00000002R3m-2XQs
	for ath11k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DDMj023933
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ntrnFQnFlaMDLEgX3jLGjQPUfBCLZxowGvuanAy/QY=; b=JVyAEcObVEi4bHU6
	JnyhrkFu0tqKg7KtLj50sPg9AF2COQfppr5+yCrbKo4TTTNitLZ+2UaMR0zCH1Jb
	dv5F77y11Lmh/5hEKyUtsiM9dPU0TUOBOS0KpLWqPlfqkAUsu3pmRQBNUgQTvFD0
	OmNXfzss5//jumu6hrPdOsqYuGg5ZXxlTEjPltPaGH+YEuCsX1YqQQJkJtX4ue94
	jAVcxsCSKAw1yw4HNVN0Ks6Luz0fuhvv7tZwQZ9Kxei+4INRfQltKARwYisswgpv
	TPiPpiBXiGATYkIWiv8RjRjlqcNN6v4iJT/6b0fKNr51PoPZw+g24Gz8uAliGaWL
	IAGxCA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tg82j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2f4c436301so921530a12.0
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658445; x=1750263245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ntrnFQnFlaMDLEgX3jLGjQPUfBCLZxowGvuanAy/QY=;
        b=UEx/qvUV2Oe2bmKpUvOA5PkGndDd76F6QARqw65Fq0DrBzqPku8Veo/EUKixCFSzYa
         PpsTtpv1+k3LmdLFUs3cX7OpTrX1BO30uaRInqEBKzS0KvK6XpyCzs2k0GbgsXesR6xm
         bpom7JFCZJrtEm7JlPobV9SgOka2XAfrr+pWcfzTL9mP1iEkq9MVRRqqnq1HnisfOuDa
         hQpaDfJ6jXSlUoGTJe1P6nzV1W6pD3+ZlZeBLuK2IM2fdsSg0s3ErVxQH/uuUSVxw8KD
         SfMk3juu5zrx8pyDwrq03+BVcxVnPW073ZCAX/iRUnxGIGFSdAocJ4k59DDjtYxnpdAk
         chpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa7fgEA2ZyDstrWioJzRIDGj69kgiuvfciICvxy6rO7pqd+Lje502309bRBy8rMQJljoF54tU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMofXBAlrwzWgfILqNvKftnDysQxzYBotTByp+kmDtxgo5DmeU
	Bxh8kO9J/v1tMHqiqJdMtw57Z/Zzo4lj2+Vod0HLL0zAiPHV/O+KjwXyy8RxGgeyxgb1QDWck40
	WmxgebDoTmqjsP7yrxwGGSD5Kd2tnHnCBj/bB5oMgS9HxKukHdDvhrceaaOeItm7Cbn1IHtfn
X-Gm-Gg: ASbGnctcfiM9TixZQb+ZH94xVhW+m3vGQFSsNMCXzhhNZ+tu+g67gQ3bPjuhf3WecDa
	AGSzWpParyNLPoHg0IurkgBjRiKkrg6OV46tQsnzxQ7/Jdbw0ZvkfWnyGA5gPa2X1CFEenwv52S
	zOEV7mTYoBb8VfXOXM1oK7L1N/aLphtsF7/HPDbkAG3BGGpbzKfBKL+wcR/4jEbwBO7P/Mj3TMP
	Q+FZH3cEaxl2L9Qu7D2XoMZ7UMNgLa6giNJlIgSf1jvZo3AsdWxUjGPt7rjWROClLLTpmzE0ZRW
	SN7xe1frMAY20UPMqs375rShOOvLR+AcXrAMuwPLV77/BMr9178/n4nm01g=
X-Received: by 2002:a05:6a20:12c5:b0:21f:52ed:23cc with SMTP id adf61e73a8af0-21f9907d403mr19898637.15.1749658444826;
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb8WD5APlMYAYThMqyu8snrm9sea4wCkCVmMFKUdMbnqcbZXi7yzDm09p6baWlyksh96erOg==
X-Received: by 2002:a05:6a20:12c5:b0:21f:52ed:23cc with SMTP id adf61e73a8af0-21f9907d403mr19836637.15.1749658444120;
        Wed, 11 Jun 2025 09:14:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:57 -0700
Subject: [PATCH ath-next 4/5] wifi: ath11k: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: zaYhO8ayRnxCV6aIJxy7AdUtms9tCwCL
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6849ab4e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NVuY5FSQAfTDsjSPyz0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: zaYhO8ayRnxCV6aIJxy7AdUtms9tCwCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX5v8FgTiotm1m
 ffZ+1skqBM6gQ+afs1MPNkhT9EjE3h9nB+YCnYo3QgRmGjESa7TzZ82IxGMdJEKq7RB1LZ9NOZc
 QJV8PKFQkjXbUu1Y+7pc720LhO3mceNoFuwEJMyNI1w2qiG1xfSlRCrvfrbRQCblaP0KQ82Plji
 qXcTv8pyvjSB2Rty27STvjlT56W6/6AO8eiZzCT82IvliEJGYOLhGSuIsjYQql5kR4+djP15nkZ
 GTtt84XeBLbgV662SIaSC0DU9yDYbkGU3sldVmkW7DYg9W+oXvXhkE6UdvN+yQCxxwVwMuiE6bO
 lRjUYUoAWPZvS4/VutwXL5MeW6dlH+pFFiSLWcwt+2lkbIDxaDe2rDAH4wz3K2lktUpv8ZM74eq
 n6TbNWJrxOct+pQh7kWV0QISdrukOrBiLki43gw8xY3AIKVlY6y8rx/ug+2ep7Axf1WOdKLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_171409_945014_8400953F 
X-CRM114-Status: GOOD (  12.07  )
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

drivers/net/wireless/ath/ath11k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/dp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/hal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/pcic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/qmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath11k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ce.c       | 2 ++
 drivers/net/wireless/ath/ath11k/core.c     | 2 ++
 drivers/net/wireless/ath/ath11k/coredump.c | 2 ++
 drivers/net/wireless/ath/ath11k/debug.c    | 2 ++
 drivers/net/wireless/ath/ath11k/debugfs.c  | 2 ++
 drivers/net/wireless/ath/ath11k/dp.c       | 2 ++
 drivers/net/wireless/ath/ath11k/fw.c       | 2 ++
 drivers/net/wireless/ath/ath11k/hal.c      | 2 ++
 drivers/net/wireless/ath/ath11k/pcic.c     | 2 ++
 drivers/net/wireless/ath/ath11k/qmi.c      | 2 ++
 drivers/net/wireless/ath/ath11k/trace.c    | 2 ++
 11 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index 746038006eb46586c0e47fdeb89faf1ccc4f0c28..be9395f2ed8b35f0c46ae7adbec9f2f9b0a4d7ba 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "dp_rx.h"
 #include "debug.h"
 #include "hif.h"
diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 22a10113613503bb2cf97185d2f6ccd7921e243d..48d81b82f8954acb74701ff86aa58c9ff6f20810 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/remoteproc.h>
diff --git a/drivers/net/wireless/ath/ath11k/coredump.c b/drivers/net/wireless/ath/ath11k/coredump.c
index b8bad358cebec99af186d1b9d5f86a8ce5651177..1949d57b007a172465fd05fdf473b4a136cf814f 100644
--- a/drivers/net/wireless/ath/ath11k/coredump.c
+++ b/drivers/net/wireless/ath/ath11k/coredump.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/devcoredump.h>
+#include <linux/export.h>
 #include "hif.h"
 #include "coredump.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 2b8544355fc1a6bf43d2c917d8354c3d8749bd1a..37d23a559ba3e55458fee4181116b935925b3c4c 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/vmalloc.h>
 #include "core.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 5d46f8e4c231fb75577d997e24730f8c87033ec7..906df3b13f4f0a84a76c71d336bb5c16f9477aba 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2020 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/vmalloc.h>
 
 #include "debugfs.h"
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index bf3928ada995fe015ddbe455083f4125fa136749..4661e0d64dd979ea0ec23fedd10d7c1ec91b141f 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -2,9 +2,11 @@
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <crypto/hash.h>
+#include <linux/export.h>
 #include "core.h"
 #include "dp_tx.h"
 #include "hal_tx.h"
diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index cbbd8e57119f28d580aff74da9fcb7c3dbb33615..07d775a7b5281ad39f8b9b2dfe74e42e540a95af 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "core.h"
 
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 8cb1505a5a0c3f64af0225ae59d9fd3f5f33055b..f1d76839a87bb2f2a3e425760883dd9fa4e52e57 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include "hal_tx.h"
 #include "debug.h"
 #include "hal_desc.h"
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index 3fe77310c71fcb094b84baee0f87e106566a5097..fc6e7da05c6028e30facf10d38a55f614067e44b 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -2,8 +2,10 @@
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include "core.h"
 #include "pcic.h"
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 2782f4723e4138d37a6a567ae5f0ddc5bbd79767..378ac96b861b70799a1a8dfe1ec187f69a83794e 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2,9 +2,11 @@
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/elf.h>
+#include <linux/export.h>
 
 #include "qmi.h"
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath11k/trace.c b/drivers/net/wireless/ath/ath11k/trace.c
index 6620650d784502c51b7507b8cb2b9b95e04849f7..44ff8e9eff5d4d7f248716ebeab6257238fdcbdc 100644
--- a/drivers/net/wireless/ath/ath11k/trace.c
+++ b/drivers/net/wireless/ath/ath11k/trace.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 
 #define CREATE_TRACE_POINTS

-- 
2.42.0


