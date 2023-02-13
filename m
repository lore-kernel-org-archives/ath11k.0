Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB74C636CC
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 13:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzjsWMHPyyk8BW1GyWevxmZXjZM2B3RKokWa6EvRnGI=; b=LnD2Rre2ky4/jl
	JkqSc6N2x8tcOYplT5DWE40kVqo7KrYHlVe93uMf5z4R7upgrlRCY8JJsnRD/zOLxycSEM5DPPBfz
	wK3vD9a1ghEdUUBH2eT68U7HfqJwUxmX6F3faNEoddyIIoE5sNlPs9yRRb7CzdQZn82o0F7b9oaKu
	zBHnzfHKmbTpIsCc7eGHeSkoU+JFC4uELy7aN1XajmY7DPdmJ8fHKCl4tFdMbkgIy04GNJ4wr4Er7
	I4dAtszOXknpArQGCHG/gNO/E8bOW30IqgUJIYDJRmAWqLKhDyt+2QqbPbZtny+JxWsh2YY25uFIV
	xK6vQD5GhF21elryAm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYab-00El90-Hp; Mon, 13 Feb 2023 13:09:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYaW-00El6w-4T
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 13:09:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DBSJJP004057;
	Mon, 13 Feb 2023 13:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=LyuSS9OX6wQgk5CzqWlhGLyFHL2ACEgsdBYZ0SA+DxM=;
 b=ZRUFN6fNYe1dxB4T+l3dxCZkTdIUoJICcOo0itNc0oSSGuJrEdHDMocOhpkgKgNF3V7J
 xRaMdnOCJ/NC72mZ0ROMpRVFBQWP6QaRvIO4oKFqZxQTO0OYe24OslgxmtugMjSfISU0
 Z7fI24asbBPbtRsXkuJgMmlpVRSEVB70txrPSnue27JmGrjHqQM0YKwz3tJvGxupHxw6
 RrJAzW4n/Snhim9mhjO7/15OHiHCDdpq0/MZU0ir/3UAy6vMT3uMOeKBwMMmtbKtUvSK
 2SYSznJaQVtYpiQQ1xkmYnXrj3NgG995jN9aF9JtCj/OZurpJY2bm5zZlPPGzRWxQ2MC Mw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3np0qpv6j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 13:09:43 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31DD9htV017116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 13:09:43 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 13 Feb 2023 05:09:41 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH 2/2] wifi: ath11k: Allow ath11k to boot without caldata in ftm mode
Date: Mon, 13 Feb 2023 18:38:54 +0530
Message-ID: <20230213130854.2473-3-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230213130854.2473-1-quic_rajkbhag@quicinc.com>
References: <20230213130854.2473-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L5Cq6AnrRcmAQlMvTDfFzQ-AMsBDE8Zc
X-Proofpoint-ORIG-GUID: L5Cq6AnrRcmAQlMvTDfFzQ-AMsBDE8Zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_050944_207031_0A1B873B 
X-CRM114-Status: GOOD (  19.89  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Currently, if ath11k is unable to load the calibration data file it will
always exit. However the calibration data may not be present in factory
test mode, so update the logic to allow the driver to execute in FTM mode
even if downloading the calibration data fails.

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index ab923e24b0a9..0108edb8d2ba 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/elf.h>
@@ -2457,6 +2457,14 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab,
 
 		fw_entry = ath11k_core_firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
 		if (IS_ERR(fw_entry)) {
+			/* Caldata may not be present during first time calibration in
+			 * factory hence allow to boot without loading caldata in ftm mode
+			 */
+			if (ath11k_ftm_mode) {
+				ath11k_info(ab,
+					    "Booting without cal data file in FTM mode\n");
+				return 0;
+			}
 			ret = PTR_ERR(fw_entry);
 			ath11k_warn(ab,
 				    "qmi failed to load CAL data file:%s\n",
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
