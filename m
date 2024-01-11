Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7481C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 07:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jl+MKBYmW+kyZ418WJCRg06t9JiWFR9GIRHnSbNIk/0=; b=wA7eRDid3sxC328QPMd3NwS1vD
	v4qHkY8t8Wryu2gFja4QwQQpbttCxK33fS2md1VBXOmoWXGZiQHgCX6ccRnlrrViU+SxDw/FfNKes
	RwFcuRmazkAg88U6nlJdpTzl5kdtSaGPqjEY0auG+xFcf6Rcd084DT/4UaBbzNRLBG0zn31k2EU76
	//GLYJS8wDQW/n8S1zbBkDG3xBbTJ5vTTjI/zcMZJcPvHe6hOM8OQqkJlrgtmYSThokNH8Qbndmjt
	0mzArhB9cwUi/5I45jpy2/BfFbQ5NAd1VXLG6q1LIarJ/qvN0Zyv9FzCJ69x+T1z2EB2pbapETf9a
	LFWr8QPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNpGj-00GF07-1D;
	Thu, 11 Jan 2024 07:14:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNpGg-00GEzJ-1O
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 07:14:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40B2ox3t010259;
	Thu, 11 Jan 2024 07:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=jl+MKBY
	mW+kyZ418WJCRg06t9JiWFR9GIRHnSbNIk/0=; b=ScFY+dnXkx3SS8yrDhsuiL2
	6deM+WPVDtBR4fbBQHiqz4uN2/wlAngLRHzToZBITgCIU6CD2KHk/4NFSKsWQgPs
	Tp1Ep39monc72Rd6jP4LLR9qDzopBPzqLUaOQmZFZcvQAYeaHAcCf8ZekPt/1ozr
	FK892olMUwXRazFnZXK+DE2mZ8396YL+Ic8GaKwiTMuV7asKkiChoMtbpzuKbN94
	esMnv/Jh3d6wwXFMxeWonXFIDLKFKxZO5qGhBFJQXgt9m2wEiXdAbvoZc6bDKmc/
	LcgUVK+IXojdzxkLrlfZ9BAKK5HCOFcgwP+1N5HCDFIqjeZbOi3iA924cukuySw=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vj7w58hq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 07:14:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40B7EHG3011874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 07:14:17 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 23:14:16 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath11k: do not process consecutive RDDM event
Date: Thu, 11 Jan 2024 15:14:06 +0800
Message-ID: <20240111071406.14053-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uloIw6YI5HipxFai4kaTwWe-LQhf8YJs
X-Proofpoint-GUID: uloIw6YI5HipxFai4kaTwWe-LQhf8YJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_231422_596915_E43B9D40 
X-CRM114-Status: GOOD (  18.15  )
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

Currently we do reset for each RDDM event from MHI, however there are
cases, see below log, that we get two or more consecutive events, and
it is pointless to do reset for the subsequent ones. What's more, it
makes reset process more likely to fail.

[ 1502.115876] ath11k_pci 0000:04:00.0: boot notify status reason MHI_CB_EE_RDDM
[ 1502.115884] ath11k_pci 0000:04:00.0: firmware crashed: MHI_CB_EE_RDDM
[ 1502.224041] ath11k_pci 0000:04:00.0: boot notify status reason MHI_CB_EE_RDDM
[ 1502.224050] ath11k_pci 0000:04:00.0: firmware crashed: MHI_CB_EE_RDDM

Add a check to avoid reset again and again. This is done by tracking previous
MHI status: if we receive a new RDDM event while the previous one is
also the same, we treat it as duplicate and ignore it, because normally
we should receive a MHI_CB_EE_MISSION_MODE event between them.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 14 +++++++++++++-
 drivers/net/wireless/ath/ath11k/pci.h |  3 ++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index 6835c14b82cc..855ab4d5983f 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/msi.h>
@@ -19,6 +19,7 @@
 
 #define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
+#define MHI_CB_INVALID	0xff
 
 static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
@@ -325,6 +326,7 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 				    enum mhi_callback cb)
 {
 	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
 	ath11k_dbg(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
 		   ath11k_mhi_op_callback_to_str(cb));
@@ -335,12 +337,21 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
 		break;
 	case MHI_CB_EE_RDDM:
 		ath11k_warn(ab, "firmware crashed: MHI_CB_EE_RDDM\n");
+		if (ab_pci->mhi_pre_cb == MHI_CB_EE_RDDM) {
+			ath11k_dbg(ab, ATH11K_DBG_BOOT,
+				   "do not queue again for consecutive RDDM event\n");
+			break;
+		}
+
 		if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
 			queue_work(ab->workqueue_aux, &ab->reset_work);
+
 		break;
 	default:
 		break;
 	}
+
+	ab_pci->mhi_pre_cb = cb;
 }
 
 static int ath11k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
@@ -452,6 +463,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 		goto free_controller;
 	}
 
+	ab_pci->mhi_pre_cb = MHI_CB_INVALID;
 	ret = mhi_register_controller(mhi_ctrl, ath11k_mhi_config);
 	if (ret) {
 		ath11k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index e9a01f344ec6..fc328142b60c 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #ifndef _ATH11K_PCI_H
 #define _ATH11K_PCI_H
@@ -64,6 +64,7 @@ struct ath11k_pci {
 	char amss_path[100];
 	struct mhi_controller *mhi_ctrl;
 	const struct ath11k_msi_config *msi_config;
+	enum mhi_callback mhi_pre_cb;
 	u32 register_window;
 
 	/* protects register_window above */

base-commit: 2cd4e3f91f264926a6b11df948417b74d52ca9b9
-- 
2.25.1


