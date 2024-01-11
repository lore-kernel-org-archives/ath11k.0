Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1B1C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 19:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNlWpZ0L6MS40umooaV+XdQdfO8wM83O25YiAyQqwRU=; b=V9kYaXvP6nzpq8PhqtxNNjcdvf
	PnFkorL2vYS/zMg/M7Xew/IXd8/dR0wazP6Ywt8kGX5Kq7tmzQ3EOpeYAlIqNxvDkDA//dbE1ffFG
	VuSBmMPEYFqHlE8U5bLBLWQAMskiVHV8Gef0VSXPg6QI9x26yFdctCsxq8r++ywWvqt7ACLFLF96+
	KNwTLMgnjbP2X2ZtlYkXGqFg+LpZsER83ryfsCpRHVP1ZzIRjsC2q/IY0TwMjv/5JglvQ+/P/dQTY
	wgzCiLpg/zs5t7HqDZ45zE3sEXacZXiAv4SlAGlDnqX6WC1acCBXsZSuAGzGjblpj++QrlV5VYj35
	62YvBkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO0fK-000zVM-3B;
	Thu, 11 Jan 2024 19:24:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO0fI-000zUz-1e
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 19:24:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40BEwjZD012289;
	Thu, 11 Jan 2024 19:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=DNl
	WpZ0L6MS40umooaV+XdQdfO8wM83O25YiAyQqwRU=; b=pORZF7AmE+fo9CUnuGW
	LFpohaT+NYIAj2hND9gcxZyh03AfScCYHE5CE/H2VlD0JivSyyP+SlVYCfUWC61+
	mSyJRNHH63HkTVEzYyJLSwGxoCWpqljL8Ejb9EsKHlD6CG2tn0YsLHjFjWJGk9OV
	b+tFQBc+wCuu7SR78UC9upGmnEVVmmV+uoJNDZWUOWSUdJ4LiBlhyrN6FycJqy4X
	eKuZUGlbSqdItLkbJ5246B5UNXwgAL8yR38LZ9jlMXKs0H4JsoayAzgncdXQqAfc
	0aSAHesTODnukmtDnACPKdIOcHl4L+rOe5OhN0DcmkXzSLm/9GCQFbdZGoocvUAe
	ZxA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjjjj0mgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 19:24:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40BJORTs022843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 19:24:27 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 11:24:27 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 11 Jan 2024 11:24:23 -0800
Subject: [PATCH] wifi: ath11k: document HAL_RX_BUF_RBM_SW4_BM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGZAoGUC/x3NTQqDMBBA4avIrBvIiAj2KqUM+ZnUgSaWSbWCe
 PcGl9/mvQMqq3CFe3eA8iZVltKAtw7C7MqLjcRm6G0/WEQ0cQlr5vI1s3uT7uTXROoz1d9APpv
 JpTiNzvqACVrko5xkvwaP53n+AV6o8HRwAAAA
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -qaC1G6DoNyx-Ab7O8KvO9QvZr6CyBGS
X-Proofpoint-GUID: -qaC1G6DoNyx-Ab7O8KvO9QvZr6CyBGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0 mlxlogscore=423
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_112432_688512_FBBF4C95 
X-CRM114-Status: GOOD (  11.15  )
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

Commit 7636c9a6e7d7 ("wifi: ath11k: Add multi TX ring support for WCN6750")
added HAL_RX_BUF_RBM_SW4_BM to enum hal_rx_buf_return_buf_manager. However,
as flagged by the kernel-doc script, the documentation was not updated:

drivers/net/wireless/ath/ath11k/hal.h:689: warning: Enum value 'HAL_RX_BUF_RBM_SW4_BM' not described in enum 'hal_rx_buf_return_buf_manager'

So update the documentation. No functional changes, compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/hal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/hal.h b/drivers/net/wireless/ath/ath11k/hal.h
index 80447f488954..65e8f244ebb9 100644
--- a/drivers/net/wireless/ath/ath11k/hal.h
+++ b/drivers/net/wireless/ath/ath11k/hal.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef ATH11K_HAL_H
@@ -674,6 +674,7 @@ struct hal_srng_config {
  * @HAL_RX_BUF_RBM_SW1_BM: For Tx completion -- returned to host
  * @HAL_RX_BUF_RBM_SW2_BM: For Tx completion -- returned to host
  * @HAL_RX_BUF_RBM_SW3_BM: For Rx release -- returned to host
+ * @HAL_RX_BUF_RBM_SW4_BM: For Tx completion -- returned to host
  */
 
 enum hal_rx_buf_return_buf_manager {

---
base-commit: fba97a777dcb90896ab1dc32e796d85bb7bbcd69
change-id: 20240111-document-hal_rx_buf_rbm_sw4_bm-9afd96a0bc1f


