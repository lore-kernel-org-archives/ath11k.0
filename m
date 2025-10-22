Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2E9CCD1AB
	for <ath11k@archiver.kernel.org>; Wed, 22 Oct 2025 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zcXJCbX0nk3TAqJyAuAEyoiVOaBfe/OFUUMOBf3y+Fc=; b=WlmI0tQu7pJgH/AjQFO/nbsN1E
	ouInXU5OxYtz6rctyLN5GRDRtW5ZrAY13Le1U5+Z3m4v2MXHyl/nEjyNqMwtHP9BlQ3JO4QTmkkLY
	P8h1HEYc2z4e7RI2Fdo3dT5B8G9DvqhXqX/xvp2Wdww+1I0Pcf7yrFlgHqCRcF8eFSr352/HegkCa
	oFNJGrtAkstRsnINz3pBtLkIepSiCVRwOe2F0dXPSpBdoUyac4wy5oC1YdBbr06zQqjR2e++v8m35
	iHxdgkm0dL4pAfJid++OOrZ1Yz581c4bSdmN86+RYTKxoy9jyivtLF2FV1YJJtKu+oWmT3j16oKuN
	O3bRNEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBahs-00000003O5f-2Lks;
	Wed, 22 Oct 2025 15:24:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBaho-00000003O2c-1ehF
	for ath11k@lists.infradead.org;
	Wed, 22 Oct 2025 15:24:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAtSCg026480
	for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 15:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zcXJCbX0nk3TAqJyAuAEyo
	iVOaBfe/OFUUMOBf3y+Fc=; b=TdjNbw/COcFthRpo1v+Wc6gaWNKJxj8eR6adZw
	9TYwjw8UvLNXdEtcnqFa4OyYLHVrl980Armbkkta9WOZSifbarly1eTvT6RihZBS
	lckOCt1mf2OvQjnrUh42iupICegN+tqqiMzrcazi5Fji4hGpkRxDzP7tzJYbCYw+
	JxGJlh1Q6tCq1CwS/pmcRMUejJvELUqaLcXInjOUwMZofV1LV/MSbSeeXZEqQAR4
	1RHOq9OG3bRuxIj3w5T8kIfgghpsEYqkb+rH7cAmZOkcOAPIuXCd0kEl0OlPy832
	LJMlO5drMNz05QFxa9DPv00YMSDSt4oLrPmu+9FgPzMeax7A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j52ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 15:24:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso89423525ad.0
        for <ath11k@lists.infradead.org>; Wed, 22 Oct 2025 08:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146689; x=1761751489;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcXJCbX0nk3TAqJyAuAEyoiVOaBfe/OFUUMOBf3y+Fc=;
        b=j0zxDF6jb9ayIELqix6uYOMdpGKzqYCKz9YmRYh6xOy9PeI02X00Wr9NLkNo8tahBX
         8YKcBOdPb+EPYGGrVFJkmADiqYY4k20mB0GaNKhRFxalVEf1gB174DKQMl0t71l9DrjS
         gfLAk3zYqQUVa171fPnvH7ynhKMTJ3uHACoab752aeMdmzL7Y1uchhLpbyjsNo+fuASt
         s4lgZfAHDMG16YdjWqxkV63bRFfKgTy+KCQtFwYgByg0jTNDTcb943kI1TkhTsigHNEd
         9ejKIXe+X2dJzvj1feese46fLgicFKuOA4f1lmsg2oTSUb/poHXHR6/xFnbO9FGns/Q5
         RMfw==
X-Forwarded-Encrypted: i=1; AJvYcCXEIjmPoJS1BKB+0smoaDgjaTt+zgRCqrLHkHU/1FAptf8p4DbQP0XJcTV4QOP9meV9rhBeq9U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp8HBvrEOaPHkB8IHCXhRKAt3HeXziYYoBuRZ5nNQNkpIQDkHk
	qShYwsRPVcjYEeGbsLwRCuwVbdBrT6aUCQUJh/rIowNDzED5IJinNXEtdpkF8XbdcItAF4Ag57A
	A9R0y2DLacoIybe3v87ZZINqfmY9NAhltRyKGm7Q1yRI38Jb2wCS/aqSatNKMZ65D
X-Gm-Gg: ASbGncuNPjg0bnB2AcGCzN2Yni/mAlPitjbhUQJrQmkqAOSiQR2d0wdUcqGU5uPhu5B
	CC9WD51TBpOmCj6+9xZJ2OipwFQpP1nHzIMB0K7E8BFX/J+PreY5xiJ5HN6kWSjJOtyXtBa4Abf
	qazeTVFivIb1Ja4UcGOO0Q+AI/FoGL6P/PJ8F3uNTWEb9T1FlNkKrg+CNzvK+f/f/OlAz9IdXiD
	wUfIZlPn5w7VqKiLQJjmkImz3WeQsxxYKFKdK8l3SwD11Cj7CHrStajBb1UXdCcx5ykSy5gTXJI
	jBTQCVH/ep20AOXw0C1ZC7IMvhKas1K1IlwFUMChfirMYvvMWw10DLwk9DM6BBByRgPHqbcjLXu
	wX2N8ZBQ4bmj8PsV6D9Ocn9aUOA2fVdPbRfY=
X-Received: by 2002:a17:902:ce12:b0:252:a80c:3cc5 with SMTP id d9443c01a7336-290ca4f9174mr232625705ad.22.1761146688872;
        Wed, 22 Oct 2025 08:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgNwSVIEeJz2D2gYMvsvbH6+PAIULhDABgtNFR8EH3i0kHpgbwdzEEzuSJi98AxL1S0Kefzg==
X-Received: by 2002:a17:902:ce12:b0:252:a80c:3cc5 with SMTP id d9443c01a7336-290ca4f9174mr232625445ad.22.1761146688393;
        Wed, 22 Oct 2025 08:24:48 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d55d8sm140982305ad.61.2025.10.22.08.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:24:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 08:24:46 -0700
Subject: [PATCH ath-next] wifi: ath11k: Correctly use "ab" macro parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-ath11k-bad-macro-arg-v1-1-93a8eadb6191@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD73+GgC/43NTQrCMBAF4KtI1o5kJq1aV95DXEx+aoO20aSWi
 vTuhq5cqLgZeDzeN0+RXPQuid3iKaIbfPKhywGXC2Ea7k4OvM1ZkKQSJSFw3yCeQbOFlk0MwPE
 EVm8KbY1UVVmJPL1GV/txZg8iL6BzYy+OuWl86kN8zP8GnPvf9ICAQBplXZXEa6v2IaXV7c4XE
 9p2lc/sDvSPRdmSBbLcsjFyS18s9W7RF0tla1NbqrUqXOHwgzVN0wvKIQKSYQEAAA==
X-Change-ID: 20251021-ath11k-bad-macro-arg-db74bdc03959
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX80Rgf7uKM1i7
 6wrFG6zY1ylHeP87woNzQ5BIZfAyHJQN3dKlXF8LW+fvweWPIWnI+0Y8yZWPdQ7KQZK/8GF/O83
 unrnuwQPHaTIBe8KN8lcllCcp1+4+HcqVMMs6lsZP0jTXid4gI04mqZ9JslMiZ8kpcVGN+tn8B8
 dbOxsS1L4of76kUR0OFonBfri+qUKGjexijfEcv8xDyd23bRYU5mK9usgy8scrF2azBa77/t+tv
 4EUh+IUQArApoLwtmN/0KdVOvNSq8Q4sGQASJaUTk3ZruhrTEUbOEcRQZNO/+X2uS/4hKJHCBOE
 Ob79TCh45L/wYlnBgSSg3BNKgK/57+zStFTcQj1kEoCo5XkTmm+MsvyKghhCxCEtwu9ZWA7TnRd
 ZKGcSx5Lh/IXXIEPh3ow1BaxKo09jw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8f742 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ga_hMwcDZzHn_-OpqXgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wn_YRFwqbfLwxtCx6oc3muzdPw6cUjdw
X-Proofpoint-ORIG-GUID: wn_YRFwqbfLwxtCx6oc3muzdPw6cUjdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_082452_576516_9205ABC9 
X-CRM114-Status: GOOD (  14.18  )
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

The checkpatch script is reporting multiple instances of:
	Argument 'x' is not used in function-like macro

Fix these by renaming the argument to match the usage. In the process,
also add parenthesis to the usage to avoid MACRO_ARG_PRECEDENCE
issues.

Compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
There are other MACRO_ARG_PRECEDENCE issues in hal.h that can be
addressed in the future
---
 drivers/net/wireless/ath/ath11k/hal.h | 38 +++++++++++++++++------------------
 drivers/net/wireless/ath/ath11k/pci.h | 18 ++++++++---------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 839095af9267..82603a389bb9 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_HAL_H
@@ -43,14 +43,14 @@ struct ath11k_base;
 #define HAL_SEQ_WCSS_UMAC_OFFSET		0x00a00000
 #define HAL_SEQ_WCSS_UMAC_REO_REG		0x00a38000
 #define HAL_SEQ_WCSS_UMAC_TCL_REG		0x00a44000
-#define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(x) \
-		(ab->hw_params.regs->hal_seq_wcss_umac_ce0_src_reg)
-#define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(x) \
-		(ab->hw_params.regs->hal_seq_wcss_umac_ce0_dst_reg)
-#define HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(x) \
-		(ab->hw_params.regs->hal_seq_wcss_umac_ce1_src_reg)
-#define HAL_SEQ_WCSS_UMAC_CE1_DST_REG(x) \
-		(ab->hw_params.regs->hal_seq_wcss_umac_ce1_dst_reg)
+#define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(ab) \
+		((ab)->hw_params.regs->hal_seq_wcss_umac_ce0_src_reg)
+#define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(ab) \
+		((ab)->hw_params.regs->hal_seq_wcss_umac_ce0_dst_reg)
+#define HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(ab) \
+		((ab)->hw_params.regs->hal_seq_wcss_umac_ce1_src_reg)
+#define HAL_SEQ_WCSS_UMAC_CE1_DST_REG(ab) \
+		((ab)->hw_params.regs->hal_seq_wcss_umac_ce1_dst_reg)
 #define HAL_SEQ_WCSS_UMAC_WBM_REG		0x00a34000
 
 #define HAL_CE_WFSS_CE_REG_BASE			0x01b80000
@@ -209,10 +209,10 @@ struct ath11k_base;
 #define HAL_REO_STATUS_HP(ab)			ab->hw_params.regs->hal_reo_status_hp
 
 /* WBM Idle R0 address */
-#define HAL_WBM_IDLE_LINK_RING_BASE_LSB(x) \
-		(ab->hw_params.regs->hal_wbm_idle_link_ring_base_lsb)
-#define HAL_WBM_IDLE_LINK_RING_MISC_ADDR(x) \
-		(ab->hw_params.regs->hal_wbm_idle_link_ring_misc)
+#define HAL_WBM_IDLE_LINK_RING_BASE_LSB(ab) \
+		((ab)->hw_params.regs->hal_wbm_idle_link_ring_base_lsb)
+#define HAL_WBM_IDLE_LINK_RING_MISC_ADDR(ab) \
+		((ab)->hw_params.regs->hal_wbm_idle_link_ring_misc)
 #define HAL_WBM_R0_IDLE_LIST_CONTROL_ADDR	0x00000048
 #define HAL_WBM_R0_IDLE_LIST_SIZE_ADDR		0x0000004c
 #define HAL_WBM_SCATTERED_RING_BASE_LSB		0x00000058
@@ -227,17 +227,17 @@ struct ath11k_base;
 #define HAL_WBM_IDLE_LINK_RING_HP		0x000030b0
 
 /* SW2WBM R0 release address */
-#define HAL_WBM_RELEASE_RING_BASE_LSB(x) \
-		(ab->hw_params.regs->hal_wbm_release_ring_base_lsb)
+#define HAL_WBM_RELEASE_RING_BASE_LSB(ab) \
+		((ab)->hw_params.regs->hal_wbm_release_ring_base_lsb)
 
 /* SW2WBM R2 release address */
 #define HAL_WBM_RELEASE_RING_HP			0x00003018
 
 /* WBM2SW R0 release address */
-#define HAL_WBM0_RELEASE_RING_BASE_LSB(x) \
-		(ab->hw_params.regs->hal_wbm0_release_ring_base_lsb)
-#define HAL_WBM1_RELEASE_RING_BASE_LSB(x) \
-		(ab->hw_params.regs->hal_wbm1_release_ring_base_lsb)
+#define HAL_WBM0_RELEASE_RING_BASE_LSB(ab) \
+		((ab)->hw_params.regs->hal_wbm0_release_ring_base_lsb)
+#define HAL_WBM1_RELEASE_RING_BASE_LSB(ab) \
+		((ab)->hw_params.regs->hal_wbm1_release_ring_base_lsb)
 
 /* WBM2SW R2 release address */
 #define HAL_WBM0_RELEASE_RING_HP		0x000030c0
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index c33c7865145c..1e3005a4b64c 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022,2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _ATH11K_PCI_H
 #define _ATH11K_PCI_H
@@ -35,18 +35,18 @@
 #define PCIE_SMLH_REQ_RST_LINK_DOWN		0x2
 #define PCIE_INT_CLEAR_ALL			0xffffffff
 
-#define PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG(x) \
-		(ab->hw_params.regs->pcie_qserdes_sysclk_en_sel)
+#define PCIE_QSERDES_COM_SYSCLK_EN_SEL_REG(ab) \
+		((ab)->hw_params.regs->pcie_qserdes_sysclk_en_sel)
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_VAL	0x10
 #define PCIE_QSERDES_COM_SYSCLK_EN_SEL_MSK	0xffffffff
-#define PCIE_PCS_OSC_DTCT_CONFIG1_REG(x) \
-		(ab->hw_params.regs->pcie_pcs_osc_dtct_config_base)
+#define PCIE_PCS_OSC_DTCT_CONFIG1_REG(ab) \
+		((ab)->hw_params.regs->pcie_pcs_osc_dtct_config_base)
 #define PCIE_PCS_OSC_DTCT_CONFIG1_VAL		0x02
-#define PCIE_PCS_OSC_DTCT_CONFIG2_REG(x) \
-		(ab->hw_params.regs->pcie_pcs_osc_dtct_config_base + 0x4)
+#define PCIE_PCS_OSC_DTCT_CONFIG2_REG(ab) \
+		((ab)->hw_params.regs->pcie_pcs_osc_dtct_config_base + 0x4)
 #define PCIE_PCS_OSC_DTCT_CONFIG2_VAL		0x52
-#define PCIE_PCS_OSC_DTCT_CONFIG4_REG(x) \
-		(ab->hw_params.regs->pcie_pcs_osc_dtct_config_base + 0xc)
+#define PCIE_PCS_OSC_DTCT_CONFIG4_REG(ab) \
+		((ab)->hw_params.regs->pcie_pcs_osc_dtct_config_base + 0xc)
 #define PCIE_PCS_OSC_DTCT_CONFIG4_VAL		0xff
 #define PCIE_PCS_OSC_DTCT_CONFIG_MSK		0x000000ff
 

---
base-commit: 2b306fc6b1d00dfe85b3b80eb257256e2b5ba610
change-id: 20251021-ath11k-bad-macro-arg-db74bdc03959


