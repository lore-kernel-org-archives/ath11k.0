Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB325CD8C92
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNdqdZDJFQxlY6R1Ryt/x6EY4f0slKtUl0PwQLfYsMw=; b=UkQhr2nH/p2p5GHNikA3pr6vJV
	1lOHgXK81JFznLKcgxifQ/ERxVs9WmdxgT2BCaaUxn0QzLZxsyhh77dAaTwR5ZWD+cQuzQLN/Oiz/
	PPwzgNFZ54KpAChSb1B9VM3qwiZvKdj6PumN4qXE739I4QlLZ9gqK58MG7Hgjvgi9ptjIwNwYHI9O
	Qifxsu2Y/fNnIRXBsn+7M+hQzvfGxOLmT07eySKh4U28PZUBwpD3o6TX8JQZOkLi4KlIumZGVjP2L
	AB0wTSvvMTF39ErbG6tsniXy9TpvSEE8/Dfx0gieS4DxmW/Uyzaix+xToI7gvH5gEcA0ZBkYC7K9T
	8jBvMD1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvV-00000003btZ-2985;
	Mon, 08 Jun 2026 13:22:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvR-00000003bn5-3ZJx
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 13:22:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9SIX3029591
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 13:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNdqdZDJFQxlY6R1Ryt/x6EY4f0slKtUl0PwQLfYsMw=; b=eGl0ph2Q1qrjm3Gy
	UOJW+yaU2fgB8ff9qBg7jXk0vJWS5D6EEkcSd0yXBugPhXp1d+d8ejSIZW0ifwFD
	4U4GhlR2Ui8p9Wh0+h5qHu1+mtp8a+F5o4Bu9SGkO525J9L1D4EkpKRLV3POWnOk
	+83xAAWnmwt5KG88Eb0EqU2cMKdbbTv+kDrLRSiSl0cYmzyi5s3Gc6TlqzrXEAY7
	0vL9gv8MPNwNGBB7MVxkwALWkdCHFVPxOGm2GW2fRM7CqMw0X+lpmADmGT5Sl7w/
	Zo81sEH/YrIb7brgyNGlustvt6QWXxNT4Mxi4N00fy1Ulm0fplU0sxMhTsAhcyGR
	im4kSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun40tbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 13:21:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8613efbso4138311eec.1
        for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924917; x=1781529717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNdqdZDJFQxlY6R1Ryt/x6EY4f0slKtUl0PwQLfYsMw=;
        b=KUvmS5h4cuQZtlWef1cJ33P6HTGa98D0x9KWSKoNXqOW9m4lPfNIGiJ6hLIQ8NEH03
         1dWBf5ylOuwca8FirdtarHOhL2oSeVLUzQ30yZD200A0y1d2KaCmB38Zim96lRxsYZdd
         27GqOYivDs6xhynBaIW2/5vIyH0cArfUeSpikKSLLeSEjk0k8kkYwOvtJI+Hg6/QwZB8
         Pw8H8fUNHQduqhpEgwJFbHme6xexJI2QRkdfq9+42usUv2W8wHKaMKQlrxnLy5zqQgDu
         xB/1GJ1JuG09Y/fKtUedSJIV/BZVIvvXmlFsYHiMoF42dF7lVJE30fZjsdlbnhv5TRbu
         PeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924917; x=1781529717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iNdqdZDJFQxlY6R1Ryt/x6EY4f0slKtUl0PwQLfYsMw=;
        b=Ck2+NcTqj1aNdOdulUVzpJ2Nj9Zip6d3XypsGiIHDDTm5Tg+cwCYJyPNwp4s/DbijX
         H66jbH+ymXNORkRt9uVkQets1MjilB+DRLY9vZT3OCIs9x4+Vjj4ObSCsVnkZIzLqLpX
         TT8P2BLgZhfwvciwXTcLCqHgRNHUeJsHOgaUIqy+NzlNVBCWI84onEWmMUAbgM4I3WZs
         lFrC/HpzeV2s112rKnADIPdPiPFH4yPDdk7pEphtkc9CKyW/a+j7t857XdCbsnROhg5b
         TIjm/B+NZQZ+tKVDQ5INTdTylUEqHcDGn4eMp82VdrraTcF0PyukEa0/GlIFY6AStey7
         bw+g==
X-Forwarded-Encrypted: i=1; AFNElJ9chjJvktmFHlZhmS9/oaedIf2bNM3mXk/798bcjmYQZ3bGxSJeVRPsrwKn7cpcIDipRzHNXjs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlaMSmrw5HpyN7D+F6FlabxvMdjs7Uwee/F2rJ6GZlwjeV5qYt
	dwP4LXjJoZnemaCaoc0wTvkSf20gwPBusiwz3B9UsP8DHhEx7L/J4mlOAsgmpgcM3ub49pk7TxS
	9UUtFe+fVXCc4O2lz7vZl6AIzJrKaJy5eBEr3jaVGjBdJ5Z8grhworqJTmzgL3+IGCTVGE8di
X-Gm-Gg: Acq92OF8BswgWlFSgrJLtIs2IYNeEUPtSQhIYMM1bQqVFuGOcui2G9WyHpbInNDGYo6
	VCgg89wV/6usL8eapuUKvAMBGl115v7clUd4N2spcTsdXO6UUEoQ113iKsKlKyJe34DPtkeyq5G
	3QejpC/O10XBXjhVZRTP9mABIqQWP16hPS8ufy+YAJDZBAXf2e5eFhDiYoX6HGK0qwDhEYze++S
	7yW0yWd0Dr6B4ty5b5CWQ+66mh9NrE7vzY3a4xnVb4qEgbnqeoNq/rOuOAwYW6Grwsy1tqW/uu/
	MArGKVnUJs7jYFpBvU9IjdFNODwW9PbChtidb+BScvqRfpgLG4byOTtrih5Tz9PUxh6ttU22+q+
	bCMOYBLaXsP1l7XIJRPNX3N3KN7nqeS4ZVFVTfE3wJytK4BRSCA5stVgiCsNpAfYhLrhHmSBisT
	3YNmMsF8flBoc=
X-Received: by 2002:a05:7300:320b:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-3077b709e8cmr8872015eec.16.1780924915990;
        Mon, 08 Jun 2026 06:21:55 -0700 (PDT)
X-Received: by 2002:a05:7300:320b:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-3077b709e8cmr8871955eec.16.1780924914816;
        Mon, 08 Jun 2026 06:21:54 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm21607280eec.13.2026.06.08.06.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:21:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:21:33 -0700
Subject: [PATCH ath-next v2 2/4] wifi: ath11k: Update Qualcomm copyrights
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v2-2-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfX3+bK1joix37q
 ea0ioofehly3J4LbJinyMOJHFHFp7YNbavtdAlcGg5Y++IlYgMc2NLAbZKo18/f4rLMEvKFv/9v
 GR/Uz7ziJqc1/E2JcemyyNasj77cnswxO5JHiTkds3pPu3UlfcyCddS47QzS3dhuGJsYSkGb9NW
 xdwqWpFkCiC6QTJxadVeuUMY3gE7m3tKq2cgvB2doYnwR7CpS/MegN1vgw/TcVLWuWp4fRnUib4
 u8F+Zm20LCSAK4Wde/IIiTSi+AS2JAi1HldCpyRmxZ4SxkzTm/obUFSZcmTnWEBty8sxH1KB0As
 Ku2ILTISFLEOCplFdgXtxZ9mCm3/JhDz8AD6WtB3pkEw93WxHULsJG7bfq6SW5dtLFa1ESu5Jkt
 4Jhmq4tfqO20LaBfqZbvq6ksDKFnZtTs9fnGe4G8kBrmzZUge6SBW1xhPrANUx0ub50eqUY/R+l
 3CgjYxBOUjRZ1aVJpYQ==
X-Proofpoint-ORIG-GUID: FkN5MNFmyqiPIKBbIhUbs5DLhj5n_d-p
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26c1f5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1foTlPHGAKRYhzXQz54A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: FkN5MNFmyqiPIKBbIhUbs5DLhj5n_d-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062157_919414_49487357 
X-CRM114-Status: GOOD (  11.43  )
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
 drivers/net/wireless/ath/ath11k/ahb.c               | 2 +-
 drivers/net/wireless/ath/ath11k/ahb.h               | 2 +-
 drivers/net/wireless/ath/ath11k/ce.c                | 1 -
 drivers/net/wireless/ath/ath11k/ce.h                | 2 +-
 drivers/net/wireless/ath/ath11k/coredump.c          | 1 -
 drivers/net/wireless/ath/ath11k/coredump.h          | 2 +-
 drivers/net/wireless/ath/ath11k/debug.c             | 1 -
 drivers/net/wireless/ath/ath11k/debugfs.c           | 1 -
 drivers/net/wireless/ath/ath11k/debugfs.h           | 2 +-
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 1 -
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h | 2 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.h       | 2 +-
 drivers/net/wireless/ath/ath11k/dp.c                | 1 -
 drivers/net/wireless/ath/ath11k/dp.h                | 2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.h             | 2 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c             | 1 -
 drivers/net/wireless/ath/ath11k/dp_tx.h             | 2 +-
 drivers/net/wireless/ath/ath11k/fw.c                | 1 -
 drivers/net/wireless/ath/ath11k/fw.h                | 2 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h          | 2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.h            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c            | 2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h            | 2 +-
 drivers/net/wireless/ath/ath11k/hif.h               | 2 +-
 drivers/net/wireless/ath/ath11k/htc.c               | 2 +-
 drivers/net/wireless/ath/ath11k/htc.h               | 2 +-
 drivers/net/wireless/ath/ath11k/hw.c                | 2 +-
 drivers/net/wireless/ath/ath11k/mac.h               | 2 +-
 drivers/net/wireless/ath/ath11k/mhi.h               | 2 +-
 drivers/net/wireless/ath/ath11k/p2p.c               | 2 +-
 drivers/net/wireless/ath/ath11k/p2p.h               | 2 +-
 drivers/net/wireless/ath/ath11k/pcic.c              | 1 -
 drivers/net/wireless/ath/ath11k/pcic.h              | 2 +-
 drivers/net/wireless/ath/ath11k/peer.c              | 2 +-
 drivers/net/wireless/ath/ath11k/peer.h              | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h               | 2 +-
 drivers/net/wireless/ath/ath11k/reg.h               | 2 +-
 drivers/net/wireless/ath/ath11k/rx_desc.h           | 2 +-
 drivers/net/wireless/ath/ath11k/spectral.c          | 1 -
 drivers/net/wireless/ath/ath11k/spectral.h          | 2 +-
 drivers/net/wireless/ath/ath11k/testmode.c          | 2 +-
 drivers/net/wireless/ath/ath11k/testmode.h          | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.c           | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.h           | 2 +-
 drivers/net/wireless/ath/ath11k/trace.h             | 2 +-
 drivers/net/wireless/ath/ath11k/wow.c               | 2 +-
 drivers/net/wireless/ath/ath11k/wow.h               | 2 +-
 48 files changed, 38 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 08d3a0c8f105..f566d699d074 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index 415ddfd26654..8c1eb1e8e6b1 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef ATH11K_AHB_H
 #define ATH11K_AHB_H
diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index f2d5106adb01..c56dd8a86760 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/ce.h b/drivers/net/wireless/ath/ath11k/ce.h
index bcde2fcf02cf..308f425fcec0 100644
--- a/drivers/net/wireless/ath/ath11k/ce.h
+++ b/drivers/net/wireless/ath/ath11k/ce.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_CE_H
diff --git a/drivers/net/wireless/ath/ath11k/coredump.c b/drivers/net/wireless/ath/ath11k/coredump.c
index 1949d57b007a..3de34295ddc8 100644
--- a/drivers/net/wireless/ath/ath11k/coredump.c
+++ b/drivers/net/wireless/ath/ath11k/coredump.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/devcoredump.h>
diff --git a/drivers/net/wireless/ath/ath11k/coredump.h b/drivers/net/wireless/ath/ath11k/coredump.h
index 3960d9385261..1be82207690f 100644
--- a/drivers/net/wireless/ath/ath11k/coredump.h
+++ b/drivers/net/wireless/ath/ath11k/coredump.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _ATH11K_COREDUMP_H_
 #define _ATH11K_COREDUMP_H_
diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 37d23a559ba3..f65e6cf846f7 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 0c1138407838..70922612d3fb 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/debugfs.h b/drivers/net/wireless/ath/ath11k/debugfs.h
index ed7fec177588..859071938a65 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH11K_DEBUGFS_H_
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
index 11d28c42227e..731f3ca86711 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
index 476689bbd4da..856aa74ba365 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef DEBUG_HTT_STATS_H
diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.h b/drivers/net/wireless/ath/ath11k/debugfs_sta.h
index ace877e19275..6d4cf365d937 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.h
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH11K_DEBUGFS_STA_H_
diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 5a50b623bd07..f389b97acbdd 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/dp.h b/drivers/net/wireless/ath/ath11k/dp.h
index 1bd513f68a3c..84f66839f0c6 100644
--- a/drivers/net/wireless/ath/ath11k/dp.h
+++ b/drivers/net/wireless/ath/ath11k/dp.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023, 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_DP_H
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.h b/drivers/net/wireless/ath/ath11k/dp_rx.h
index c322e30caa96..f69d9301e0a1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef ATH11K_DP_RX_H
 #define ATH11K_DP_RX_H
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 9c2310665713..cac970c92806 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 795fe3b8fa0d..9303b5ba6e01 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_DP_TX_H
diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
index 07d775a7b528..ef1b4c81843a 100644
--- a/drivers/net/wireless/ath/ath11k/fw.c
+++ b/drivers/net/wireless/ath/ath11k/fw.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/fw.h b/drivers/net/wireless/ath/ath11k/fw.h
index d9893ceb2c3d..df2fab2c1143 100644
--- a/drivers/net/wireless/ath/ath11k/fw.h
+++ b/drivers/net/wireless/ath/ath11k/fw.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
- * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_FW_H
diff --git a/drivers/net/wireless/ath/ath11k/hal_desc.h b/drivers/net/wireless/ath/ath11k/hal_desc.h
index b2fd180bd28e..c8b01f6921c0 100644
--- a/drivers/net/wireless/ath/ath11k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath11k/hal_desc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include "core.h"
 
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 51e0840bc0d1..75f7b8d8a0d7 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "debug.h"
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.h b/drivers/net/wireless/ath/ath11k/hal_rx.h
index 0fa9aef9d533..475807b89a1a 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_HAL_RX_H
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.c b/drivers/net/wireless/ath/ath11k/hal_tx.c
index b919df6ce743..b7e9b1cdd76a 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "hal_desc.h"
diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.h b/drivers/net/wireless/ath/ath11k/hal_tx.h
index 46d17abd808b..f2dc6e270534 100644
--- a/drivers/net/wireless/ath/ath11k/hal_tx.h
+++ b/drivers/net/wireless/ath/ath11k/hal_tx.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_HAL_TX_H
diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
index cd9c4b838246..017fed1b4bd1 100644
--- a/drivers/net/wireless/ath/ath11k/hif.h
+++ b/drivers/net/wireless/ath/ath11k/hif.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _HIF_H_
diff --git a/drivers/net/wireless/ath/ath11k/htc.c b/drivers/net/wireless/ath/ath11k/htc.c
index 4571d01cc33d..5f9ee5e633da 100644
--- a/drivers/net/wireless/ath/ath11k/htc.c
+++ b/drivers/net/wireless/ath/ath11k/htc.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
index 86f77eacaea7..945c409bc08f 100644
--- a/drivers/net/wireless/ath/ath11k/htc.h
+++ b/drivers/net/wireless/ath/ath11k/htc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_HTC_H
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index d19c4b372a2a..93f9a03c48dc 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/types.h>
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 5e61eea1bb03..59f83c7175fd 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023, 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_MAC_H
diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wireless/ath/ath11k/mhi.h
index 5c5c2b03c81f..7e7561ce883c 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.h
+++ b/drivers/net/wireless/ath/ath11k/mhi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _ATH11K_MHI_H
 #define _ATH11K_MHI_H
diff --git a/drivers/net/wireless/ath/ath11k/p2p.c b/drivers/net/wireless/ath/ath11k/p2p.c
index 01e14523f1fe..77672099c602 100644
--- a/drivers/net/wireless/ath/ath11k/p2p.c
+++ b/drivers/net/wireless/ath/ath11k/p2p.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath11k/p2p.h b/drivers/net/wireless/ath/ath11k/p2p.h
index d907940a9b09..449f0c61b600 100644
--- a/drivers/net/wireless/ath/ath11k/p2p.h
+++ b/drivers/net/wireless/ath/ath11k/p2p.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_P2P_H
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index fc6e7da05c60..2259adc3bbdc 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/pcic.h b/drivers/net/wireless/ath/ath11k/pcic.h
index ac012e88bf6d..7a654a6ef9d1 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.h
+++ b/drivers/net/wireless/ath/ath11k/pcic.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH11K_PCI_CMN_H
diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index 027cc7aa58c8..b30a90698544 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
index f5ef1a27f8f2..20c68ef52301 100644
--- a/drivers/net/wireless/ath/ath11k/peer.h
+++ b/drivers/net/wireless/ath/ath11k/peer.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_PEER_H
diff --git a/drivers/net/wireless/ath/ath11k/qmi.h b/drivers/net/wireless/ath/ath11k/qmi.h
index eae416db8b52..350816c81ee5 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.h
+++ b/drivers/net/wireless/ath/ath11k/qmi.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_QMI_H
diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
index 72b483594015..fed9bedc52ef 100644
--- a/drivers/net/wireless/ath/ath11k/reg.h
+++ b/drivers/net/wireless/ath/ath11k/reg.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_REG_H
diff --git a/drivers/net/wireless/ath/ath11k/rx_desc.h b/drivers/net/wireless/ath/ath11k/rx_desc.h
index 2da6da727278..3780bd909bbf 100644
--- a/drivers/net/wireless/ath/ath11k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath11k/rx_desc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef ATH11K_RX_DESC_H
 #define ATH11K_RX_DESC_H
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index b6b0516819a6..03af39071839 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath11k/spectral.h b/drivers/net/wireless/ath/ath11k/spectral.h
index 789cff7c64a7..b582f2c36c08 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.h
+++ b/drivers/net/wireless/ath/ath11k/spectral.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019-2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef ATH11K_SPECTRAL_H
diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index c72eed358f6d..21a85301bf9f 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "testmode.h"
diff --git a/drivers/net/wireless/ath/ath11k/testmode.h b/drivers/net/wireless/ath/ath11k/testmode.h
index 2f62f2c4422f..45019b79fcf1 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.h
+++ b/drivers/net/wireless/ath/ath11k/testmode.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wireless/ath/ath11k/thermal.c
index 18d6eab5cce3..67246b5ca5bf 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.c
+++ b/drivers/net/wireless/ath/ath11k/thermal.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/device.h>
diff --git a/drivers/net/wireless/ath/ath11k/thermal.h b/drivers/net/wireless/ath/ath11k/thermal.h
index cdaf4e01d92e..15e4e97c944f 100644
--- a/drivers/net/wireless/ath/ath11k/thermal.h
+++ b/drivers/net/wireless/ath/ath11k/thermal.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _ATH11K_THERMAL_
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index 75246b0a82e3..d43776229bc9 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #if !defined(_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index f02edc9b8a9e..d6c2725903cc 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/delay.h>
diff --git a/drivers/net/wireless/ath/ath11k/wow.h b/drivers/net/wireless/ath/ath11k/wow.h
index c85811e3f42b..13dbcfec9227 100644
--- a/drivers/net/wireless/ath/ath11k/wow.h
+++ b/drivers/net/wireless/ath/ath11k/wow.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _WOW_H_

-- 
2.43.0


