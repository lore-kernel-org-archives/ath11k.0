Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D00C77B76
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 12:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzjsWMHPyyk8BW1GyWevxmZXjZM2B3RKokWa6EvRnGI=; b=wRFkwp5uS9o5ks
	rLN3z98OQonApjgMSC5x3mYY51Zmi3FYlPXlVHXDbOALZXWn2PD8vYOPd1N1WcRpkP+kd8amY2u9l
	Nn1S3jKk6SANK98WFr3/NxZLl8/FsdK5vhgms113n/bkHcdK6awytG5bTeaOaKEE7CeyZ5R1Jz0ga
	Ofz31cflBBwa6gG15uEEUK6LffsCDqAEuH6rbCvTvHKg40SLX+XY+rAekFEGCM9Gb2mxZVNAEXJh8
	5QH3Kva8rMkumaVOE/cF7QchvOA2jzhx3J8qOXH+3DPFPHazj8Gg0zLNPMq8CXPJtn4urfq4DTL4M
	gRzVt0lpvlV5L3y814rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppT6N-0080sL-0M;
	Thu, 20 Apr 2023 12:09:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppT6J-0080qb-0q
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 12:09:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33KAqLKC013544;
	Thu, 20 Apr 2023 12:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=LyuSS9OX6wQgk5CzqWlhGLyFHL2ACEgsdBYZ0SA+DxM=;
 b=Ms9c3ML+HKD5hAFhektQjF5bJuwW0IK5FIEqLcbnQhxjxooSasHZ6Sv/jZGnXb+SkeTg
 uEnKuQyXonD6Dh4br2MEfhL2/kD6E2VvfcyGEFVNbaOhYzHa0GzUpGEJLplk7dKignOI
 MVljFo3op+oVo4h8KUuuIZ3qsfA52rBXgDmqKJbPGeDFzyj8IuM9r6T3VBYQJxf4pRh3
 w6xkM6EWBzPvRoEBltigtDlFO7hXU7lK+2y3yzGO9yMDwjWT5ifiJ6LHLwWX7H6DLPyS
 F5ZcNuuACj5sXV0JweBwItUfvmaI885kTzwhlZcBaDB4T4qvTYKwxYj7xiwsXOnB17zl 4w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2p4v9xbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 12:09:22 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KC9LXT025115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 12:09:21 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:09:19 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 4/4] wifi: ath11k: Allow ath11k to boot without caldata in ftm mode
Date: Thu, 20 Apr 2023 17:38:40 +0530
Message-ID: <20230420120840.18712-5-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230420120840.18712-1-quic_rajkbhag@quicinc.com>
References: <20230420120840.18712-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h8xghDOi9qaRTnD68Lt5XpGrjjfUu1qB
X-Proofpoint-ORIG-GUID: h8xghDOi9qaRTnD68Lt5XpGrjjfUu1qB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_07,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_050923_427677_FC8F2630 
X-CRM114-Status: GOOD (  20.30  )
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
