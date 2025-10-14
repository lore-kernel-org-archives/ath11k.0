Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF24CCD183
	for <ath11k@archiver.kernel.org>; Tue, 14 Oct 2025 02:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJcWT4YZkXLG586SXAcGSj1QTbSwkWBb4nWk0Km2Ipc=; b=QpUvy4g5hNw9aw36d9A3fE0TMc
	zXfHtAhKy5/DgvH74wUE/t44g7pZLbYeKmg1EfGsRkcnA6CEjEMAQiJw03RltFvruqnhb3ykHFjuR
	SX8zrrQznwxL6tMSyD2Rz2MopZjDH4Tf0HEXIxRqcB8hhsfC+pyxM2+9kEshFLRtnGVy1qBuJbw5H
	6Xp1F1vVeOVLEh5iMNUzRmwcvVlZAHh25z0NBiYJ+IXYNZs85HWthJLzxt6TLgVTKevQN2mkceNbo
	sUQpMq5Ffh1/yPE3nrzGyFErck2FeUpJWV+n90ftuhiLIwRmeoydFo8adHMp3BQ/KkId/J3nZGZHv
	nGs1Ebig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UoM-0000000Eypp-0SCk;
	Tue, 14 Oct 2025 02:30:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UoJ-0000000EypT-1grB
	for ath11k@lists.infradead.org;
	Tue, 14 Oct 2025 02:30:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDBMW012276
	for <ath11k@lists.infradead.org>; Tue, 14 Oct 2025 02:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zJcWT4YZkXLG586SXAcGSj
	1QTbSwkWBb4nWk0Km2Ipc=; b=nXqgRj4aRoTh3V0UAYKL14M7btT+OtBIIm4x80
	DjfW1WoVYoXeVydi3ZgVOt4VBCOz+4OKRFDeJYAuVEAcQYH2mMJpzFXjo1u+22S3
	FmyvCyetLFxj0H3DBNmA2BRWsn9esBIW+URgsp1Uzl1+/NV5WvzLKKfUU0clr2Db
	jaOIqC+8BhW9A/8vlhxzRWmXZgSKUVRMyLV3JQqii5/9S/XpLoggVr9MYWfL/5HK
	DTJXrLQtk1ifxts2Afy5LDZ+1wpT3x+0AgLh9TCZ787hdzXvZU7n7tBimguxpAQX
	YH9iqXvE6iX/x48qpwbUKQoE3vKY/Si0POHL1bR20m7xGuXg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5evr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 14 Oct 2025 02:30:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28e8d1d9b13so90612215ad.0
        for <ath11k@lists.infradead.org>; Mon, 13 Oct 2025 19:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760409043; x=1761013843;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJcWT4YZkXLG586SXAcGSj1QTbSwkWBb4nWk0Km2Ipc=;
        b=Qb2ISFpGFWyTBcfEDkL7/geTw/US9hqgS2thVJfCU0tF6Vy6Q2RfKr1SDVC2j6uu4/
         rMnGZbO+1B558Fg15UXxaPd18L2SlD1+UAknwTk4Gy8gtnz5rKm79OQOvdoZciuSo47S
         eaJJHCBXC6YcZC8AkdIBA/rhhwW6LOi4MmBs3BM845dZhOCMcxFilqVGdqUuwnHGoqLF
         m33lyABQ6Qa3qwe3tRJ+iIJ0x8mhsO4zzeiv+rp2IoasVHtkNbGIJ1jvZFF1oNL9pnpK
         yw3xqfBaSfc1NWXBQ5WsSRMq9947qpTiNXiWdzy0EL+VqI/ZxY4I8WMd0jN6/d30Gf3c
         s1hA==
X-Forwarded-Encrypted: i=1; AJvYcCVoIw98M8xEmT2z+52o2U5kcj70WPpceNtfEE0Amk3fP5vR80OSkAGDmwM+NKCh2LiGOZgfFW8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq5sppzEICo01MiWjX8eQHcWAYcTgoG5jiPa8RE5Es4Sh0tBD0
	0plzbhfwATlYqshVUeU/3tz0x53SEK12cU/lUe50BKmJHTT9DbJ4q4ZHtxTQmv5+OL4IrPijI3Y
	/1QUmRBXykM/y5HOsgxSrNz2vc4BPCeCSqoEjh/TeGdR3Hnnx8itvCz1kyidIYGayuZbjneYl
X-Gm-Gg: ASbGncuNVT0f2kDPoK3eYHB6FnL0VWdwg7cwIuclusL3MPsD5M2U+MYBgrCbPJUbcVK
	DEzcKK0oWDe7diLsxE3fVvJYH/ma+1JCIasSjPh89eNEy+p9u7r2y++grOanpdOtoEIIKiEmiuu
	D4lpSn/IaG336Te24AfB0Ol+rFiuGqTcEdH/5u3DWjUgQf43kqTXvHgHRSha5m7ITirPgNGx2b2
	LVNM3a5lJvJ3Ch6GoUclKmwMC7dt4tWL9kAiJCOxcXBVt/ht866pE3GzLhGI80lwl68YIeVxueu
	Bcm+8nOD9ipB78Wy5k4GjmYSGXhhu06Pt67BXxtyOvrx0yh+BirIs2tyVdklZMofgF4Z+xBcnda
	luufukMM24dZti7zH7A==
X-Received: by 2002:a17:902:e945:b0:269:8f2d:5221 with SMTP id d9443c01a7336-29027290222mr261697045ad.9.1760409043193;
        Mon, 13 Oct 2025 19:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg6GyZJookUaidvGFEfNAkvOYWYnzVC9xYSFslCJHqyUACD4cXLWUWUM082/t51M/TwXw2sQ==
X-Received: by 2002:a17:902:e945:b0:269:8f2d:5221 with SMTP id d9443c01a7336-29027290222mr261696645ad.9.1760409042592;
        Mon, 13 Oct 2025 19:30:42 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060754sm13388487b3a.13.2025.10.13.19.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 19:30:42 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:30:20 +0800
Subject: [PATCH ath-next] wifi: ath11k: restore register window after
 global reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-ath11k-reset-window-cache-v1-1-b85271b111dd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALy17WgC/42NQQ6CMBBFr0Jm7RCmIKgr72FYFDrYRmm1rYAh3
 N2GE7j5yc/Lf3+FwN5wgEu2gufJBONsKnTIoNfS3hmNSh1EIY5FUxLKqIke6DlwxNlY5WbsZa8
 Zq7Oo1XAibjoFaf/yPJhld98gzdDyEqFNRJsQnf/upxPt/A//REjY1VRXshSqE/LqQsjfH/ns3
 TjmKaDdtu0HbgF40dMAAAA=
X-Change-ID: 20250731-ath11k-reset-window-cache-4926df81e7bd
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: uh7w2iPB_JdxKyiO5_6VoYLAMBNX5fLg
X-Proofpoint-ORIG-GUID: uh7w2iPB_JdxKyiO5_6VoYLAMBNX5fLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX/w6Jo9tkRfmz
 wH2/BRoyZux/Pc3HIfzmvcWEfZXhwWcKxo0b9J2aLmFQONbHG3uJCtgXJ/okjdCnigLxXDKQ+I4
 Gl46DyygQJdgju6NinVSF8+39b342d5/7sAEfNbj0laQqkT/PWGQMC/OBOCC8hWzNNmecmzdRvn
 xe9a6aqfFhwmUqDW7ylJcO3DHv29XPv22JsFSTau0wG4WVZBvIcPIxMrPch8/sFO+rzoqmUzUDk
 z1HocMvzrH8YkGNCS9YMtkwBvkeAWM43+alt8DdCRaQLVQtLJiueZJQR1+rH/w9qcmMTg5VP5qe
 JfSBGhGLSMQE49RQMSiP9Ym2gE+pD2ONn1pGuRix2B2u4mdFu66ort3aOpBZyHJIY7UjPO9nSbj
 Wo7pWGpGSW+HbYNVzW9MBMvLk8OEaQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68edb5d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=n-cauTe5lKxIj1BHfEsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_193047_583490_CD8AC9C3 
X-CRM114-Status: GOOD (  18.05  )
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

Hardware target implements an address space larger than that PCI BAR can
map. In order to be able to access the whole target address space, the BAR
space is split into 4 segments, of which the last 3, called windows, can
be dynamically mapped to the desired area. This is achieved by updating
window register with appropriate window value. Currently each time when
accessing a register that beyond ATH11K_PCI_WINDOW_START, host calculates
the window value and caches it after window update, this way next time
when accessing a register falling in the same window, host knows that the
window is already good hence no additional update needed.

However this mechanism breaks after global reset is triggered in
ath11k_pci_soc_global_reset(), because with global reset hardware resets
window register hence the window is not properly mapped any more. Current
host does nothing about this, as a result a subsequent register access may
not work as expected if it falls in a window same as before.

Although there is no obvious issue seen now, better to fix it to avoid
future problem. The fix is done by restoring the window register after
global reset.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index d8655badd96d0f4b6946f8af927d878aaa3147ad..7114eca8810dbfac895eebfefe2e48673d065347 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
@@ -177,6 +177,19 @@ static inline void ath11k_pci_select_static_window(struct ath11k_pci *ab_pci)
 		  ab_pci->ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
 }
 
+static void ath11k_pci_restore_window(struct ath11k_base *ab)
+{
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
+
+	spin_lock_bh(&ab_pci->window_lock);
+
+	iowrite32(ATH11K_PCI_WINDOW_ENABLE_BIT | ab_pci->register_window,
+		  ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
+	ioread32(ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
+
+	spin_unlock_bh(&ab_pci->window_lock);
+}
+
 static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 {
 	u32 val, delay;
@@ -201,6 +214,11 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 	val = ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
 	if (val == 0xffffffff)
 		ath11k_warn(ab, "link down error during global reset\n");
+
+	/* Restore window register as its content is cleared during
+	 * hardware global reset, such that it aligns with host cache.
+	 */
+	ath11k_pci_restore_window(ab);
 }
 
 static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)

---
base-commit: de7674ee69a0023a2dd1c6f0cb66f3cbbba89923
change-id: 20250731-ath11k-reset-window-cache-4926df81e7bd

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


