Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F18CD8C9F
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCvliVYqqAOKUycyeMO2VE20wOw1noVMe15EZ3nYEdM=; b=XnrOhsPXGmD7oGBQ7z0gXA5jCI
	j9HdQiftOGa/mopY2DknETheBQz7dA5hwF3LyAWP+rAUH+92iFB0S37T5UG9Y0xUYofy7MOws3mfO
	JDls4Mya9Rfq9eKwvbwCwLAOesXqxRDS49ElofZ6cGjLex/ci/rJUptatR8FcMdlL22/VRZJxIP//
	5dc6j435o6PcZXCMCrjvz6Z91tPIPvSYsWgwrffY1AOO7cRnqeckCjPoVCvfYrkKy64PlcIEqLpyY
	2oAPZkL0TJxkJwq5d68ky9mMb4xvC6LDfxF89HZIima0QHcmYAColjlyXK8Fio5gWA+rZPzgxQBzD
	Z+MXZ5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvS-00000003bp4-41Zg;
	Mon, 08 Jun 2026 13:21:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvP-00000003bl9-41GO
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 13:21:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBEi83417244
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 13:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCvliVYqqAOKUycyeMO2VE20wOw1noVMe15EZ3nYEdM=; b=fizAr6WJ8/wuT7qD
	9KTwsWMbepAQiyETk0tm23tCsz1INbUiubjx/0D0jbSwhcRNNMXfThXRza+GrTIR
	THj12tOthyiumhHznOXw2BtfFfN7sfDZbepZLGbAlqZCyhZ+0aIkLU8SmXIwsRbr
	Fpli3j2/Z8O89Q1X1t4zARQoEwjqbWcK/RV1c7k/W+vIth9Cz6JbGOSQ5oZQwfeI
	bHhw1IgK82as7zbMDabiRqOsv0n09rqt1V+7lm4DRMLDomr5XVfRHAu1mE45GsVJ
	EwDiEk0jTLcATzxxV5gxdVgbA/sKiEFiaU+DjKgh92LrZEpP6jxdKX25LrFa7TYm
	Lhq5Ug==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptgtxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 13:21:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30762d67a64so6046924eec.0
        for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924914; x=1781529714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCvliVYqqAOKUycyeMO2VE20wOw1noVMe15EZ3nYEdM=;
        b=jpSIS/aQfzUJdXCtbucG/s7YwnZSGE16cNgn5dTp2P/Z1Z2chAQByX/Xg/jszLLMhU
         Il4JmRfyFzaEK8uF8sM0EaaD/74r7f+NBKOA9yHM68s3eOVEdOCERNN3b77rqq2lGWlO
         z5Gtd4zL0RUvB6phDfpMSn3MRm3Br5hrWFqZUby3ke+5YYW5Xq54I88nQCLfQv2yrOxm
         hTQfA3/fxpCq47dx5W7kTkWqWHaPJ5Ea0X2rD31+jsy3TX6kBGGFIUa1/zU4Om2YfaV7
         zkrKwXlVni1kTto3ZCb976vddAWsxL+9YfQsY0zcfifaiHKisfvkcs9wtwOZX+uAr/Lf
         60tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924914; x=1781529714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LCvliVYqqAOKUycyeMO2VE20wOw1noVMe15EZ3nYEdM=;
        b=o7tm3fsuLCBeqtkElmlgoe0yMfOfr7r7r7jxIX/fMVOGA8ppeNaB2OGQxl+NG8YK1+
         6dhWaWmQgG2qmiFIxv76nSCSd3SaiECv6wWFOfPYuUobWMl3+TrYcHUoP/uzbp0QRPM0
         Lt6C1JGIGlZJa0Wyg8pSk0GEYZ1GdJCP+4EgkthhjH/GyNuW01fPrBl+tZMERO1+AhQG
         umUs4qwqjxSlYrG3gV3pcwR5jyHS5FUdLVixwHZk4ThZtLBzOFIHw8Biviu61lJE6weM
         VOnTAq+iqJ+NEryWjRgLG1+TIjqhxeHfYnM8EO9s5C8hLASUy9j3V7fY0z3ZT0HD9Un3
         +z7A==
X-Forwarded-Encrypted: i=1; AFNElJ/CpO8Z4NOZGZRdeGGAcX2wk7bxZW3GOopgGNUlAlc1GvLwn1DO6D3APcSCtJU3rfyIkWMoQnM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/d/BvIeIk7GNVn2UbNzKGv4HEd31L8aPOBpXFrgC/SLKhPiGd
	FdB7jlPbF1R+7atxnWDmkGbh7A40ZvD9dkTje/Vbied6lPe/gflj/EdDV58ejEx5pwxWzurGfua
	LLz6f0GS/uWuYoJ6+W0yRBxyolwW/weAX+2oUbxs5hBuKJR7sISMX4Zg8Y6PiFdNrhJn8gJgH
X-Gm-Gg: Acq92OHjfXoTtUwpBLbNsocQTX+ZXRXEEx5XCl3pPHldk96GHi3/idETtmGTT8tk77k
	bMuhkhmenlZoMvrkQ1NFY17+eSNkpqGOY9T3H1zY9IB2dKhVkiOqvSk+/uQGPjlBvlbMMzzN6YZ
	CFSh5VhsjhNDgdz1AEaQMf7RGhS7DGGR8kf1g/K1w4tcJKq9X02qKvS6EyJ7yBigf5tsjiCwv1h
	La3sBBDAUjyI6y5HZ5zh+oiSwcwmxG96k3SPEgK3D1eVd09LKHZRH+B9C2FlnX1g1cMqI7BJFMS
	bQvqX5r/jzkJhQHXKvXrY7YNsiDWiLmnOnmOXXe0GQfgWjuDbj0bZZSHpzeFopt3MH1QXQJFdsN
	9F8fK5zgwbqaWB8khvIHemdH0AUWSKPzRDiHv66c/fyspj9764b/1ac6pwprpDRLqpIG0TyLlLc
	91ARebwvV8JBY=
X-Received: by 2002:a05:693c:2d82:b0:2d9:f0b3:1d98 with SMTP id 5a478bee46e88-3077b25d0c5mr7678394eec.7.1780924913898;
        Mon, 08 Jun 2026 06:21:53 -0700 (PDT)
X-Received: by 2002:a05:693c:2d82:b0:2d9:f0b3:1d98 with SMTP id 5a478bee46e88-3077b25d0c5mr7678364eec.7.1780924913152;
        Mon, 08 Jun 2026 06:21:53 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm21607280eec.13.2026.06.08.06.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:21:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:21:32 -0700
Subject: [PATCH ath-next v2 1/4] wifi: ath12k: Update Qualcomm copyrights
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v2-1-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: YndvmUoAd6Mm-u7dma23l8whpCWNHI1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfX3J87I5N9sdWB
 LoqCjC0nsOJEXWre1qkm8Di2Zd85Yh8ipns6WrhI317lEF0bmaj6g0BwSqHEmgZZsilgOw8P7/s
 JNUnyWElgD571LLzz/0R7CTKoI+dcbPaLY/IsHjZ0gnMAsXd0RCfIdeUYhM6xqjZL964jyFz5dd
 6gvYDLs4FyqfXJP1DsQVuma0uT4vycziZzkff/IoHgodx2+lM/2veT2Aw9pi9ESwIV2r5ERiq5i
 nSV8zKQF6DPhzNeCFsb+XXaup+KqZShDpoheKKw9QpQuRsEdEODQYEiU3HK33Eh0ifsPfXkVrlk
 Cgszl3Nesbek98kh6e+edmKFOD4UpY2VtnGMy33RwnTVMUVlCtcEyESolAl+KIZXflVinZ4zCX8
 MjfXw1ej/F/Y+I4Q3qfJAkAQyfIobl9I0HfzJ9isPpKCBEbwt2pTu9b1vJXOQUT5z7SayFPVY+s
 T/eQI5QY859bFi+zY2g==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26c1f3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vZAPiv9bP6El6ppP23sA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: YndvmUoAd6Mm-u7dma23l8whpCWNHI1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062156_115671_AD1E8AB2 
X-CRM114-Status: GOOD (  12.12  )
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
 drivers/net/wireless/ath/ath12k/acpi.c        | 2 +-
 drivers/net/wireless/ath/ath12k/acpi.h        | 2 +-
 drivers/net/wireless/ath/ath12k/coredump.c    | 2 +-
 drivers/net/wireless/ath/ath12k/coredump.h    | 2 +-
 drivers/net/wireless/ath/ath12k/dbring.h      | 2 +-
 drivers/net/wireless/ath/ath12k/debug.h       | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs.h     | 2 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.h | 2 +-
 drivers/net/wireless/ath/ath12k/hif.h         | 2 +-
 drivers/net/wireless/ath/ath12k/p2p.c         | 1 -
 drivers/net/wireless/ath/ath12k/p2p.h         | 2 +-
 drivers/net/wireless/ath/ath12k/reg.c         | 2 +-
 drivers/net/wireless/ath/ath12k/reg.h         | 2 +-
 drivers/net/wireless/ath/ath12k/testmode.h    | 2 +-
 drivers/net/wireless/ath/ath12k/trace.c       | 2 +-
 drivers/net/wireless/ath/ath12k/trace.h       | 2 +-
 drivers/net/wireless/ath/ath12k/wow.h         | 2 +-
 17 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/acpi.c b/drivers/net/wireless/ath/ath12k/acpi.c
index d81367ce6929..c1b9be3e03ac 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.c
+++ b/drivers/net/wireless/ath/ath12k/acpi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath12k/acpi.h b/drivers/net/wireless/ath/ath12k/acpi.h
index 3a26fea6af1a..dd80eebff96a 100644
--- a/drivers/net/wireless/ath/ath12k/acpi.h
+++ b/drivers/net/wireless/ath/ath12k/acpi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef ATH12K_ACPI_H
 #define ATH12K_ACPI_H
diff --git a/drivers/net/wireless/ath/ath12k/coredump.c b/drivers/net/wireless/ath/ath12k/coredump.c
index ce1beeb54836..070512338f13 100644
--- a/drivers/net/wireless/ath/ath12k/coredump.c
+++ b/drivers/net/wireless/ath/ath12k/coredump.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/devcoredump.h>
 #include "hif.h"
diff --git a/drivers/net/wireless/ath/ath12k/coredump.h b/drivers/net/wireless/ath/ath12k/coredump.h
index 13f46a605113..584ce0a085a7 100644
--- a/drivers/net/wireless/ath/ath12k/coredump.h
+++ b/drivers/net/wireless/ath/ath12k/coredump.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _ATH12K_COREDUMP_H_
 #define _ATH12K_COREDUMP_H_
diff --git a/drivers/net/wireless/ath/ath12k/dbring.h b/drivers/net/wireless/ath/ath12k/dbring.h
index e1c0eba774ec..780c27c570e5 100644
--- a/drivers/net/wireless/ath/ath12k/dbring.h
+++ b/drivers/net/wireless/ath/ath12k/dbring.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_DBRING_H
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index bf254e43a68d..658b8083c9c3 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH12K_DEBUG_H_
diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
index 21641a8a0346..f5dbca1b8d75 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH12K_DEBUGFS_H_
diff --git a/drivers/net/wireless/ath/ath12k/debugfs_sta.h b/drivers/net/wireless/ath/ath12k/debugfs_sta.h
index 8de924f4d7d5..44c78f3ab904 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_sta.h
+++ b/drivers/net/wireless/ath/ath12k/debugfs_sta.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH12K_DEBUGFS_STA_H_
diff --git a/drivers/net/wireless/ath/ath12k/hif.h b/drivers/net/wireless/ath/ath12k/hif.h
index e8840fab6061..4de8667690e9 100644
--- a/drivers/net/wireless/ath/ath12k/hif.h
+++ b/drivers/net/wireless/ath/ath12k/hif.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_HIF_H
diff --git a/drivers/net/wireless/ath/ath12k/p2p.c b/drivers/net/wireless/ath/ath12k/p2p.c
index 19ebcd1d8eb2..ae9a8be17be4 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.c
+++ b/drivers/net/wireless/ath/ath12k/p2p.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath12k/p2p.h b/drivers/net/wireless/ath/ath12k/p2p.h
index 03ee877e6d6b..3041f88508db 100644
--- a/drivers/net/wireless/ath/ath12k/p2p.h
+++ b/drivers/net/wireless/ath/ath12k/p2p.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved..
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_P2P_H
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index d784d9ec5061..89abf2e87ad1 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/rtnetlink.h>
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath12k/reg.h b/drivers/net/wireless/ath/ath12k/reg.h
index da5128b8c97f..7c37c0d2a6f9 100644
--- a/drivers/net/wireless/ath/ath12k/reg.h
+++ b/drivers/net/wireless/ath/ath12k/reg.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_REG_H
diff --git a/drivers/net/wireless/ath/ath12k/testmode.h b/drivers/net/wireless/ath/ath12k/testmode.h
index ef6ab21d19b8..342ed0a7fa98 100644
--- a/drivers/net/wireless/ath/ath12k/testmode.h
+++ b/drivers/net/wireless/ath/ath12k/testmode.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath12k/trace.c b/drivers/net/wireless/ath/ath12k/trace.c
index 0d0edf4204b7..772a5a7db98b 100644
--- a/drivers/net/wireless/ath/ath12k/trace.c
+++ b/drivers/net/wireless/ath/ath12k/trace.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/wireless/ath/ath12k/trace.h b/drivers/net/wireless/ath/ath12k/trace.h
index 253c67accb0e..053d681302f0 100644
--- a/drivers/net/wireless/ath/ath12k/trace.h
+++ b/drivers/net/wireless/ath/ath12k/trace.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #if !defined(_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
diff --git a/drivers/net/wireless/ath/ath12k/wow.h b/drivers/net/wireless/ath/ath12k/wow.h
index af9be5fadcc3..273705956815 100644
--- a/drivers/net/wireless/ath/ath12k/wow.h
+++ b/drivers/net/wireless/ath/ath12k/wow.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH12K_WOW_H

-- 
2.43.0


