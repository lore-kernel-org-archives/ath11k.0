Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC97FED9EF
	for <ath11k@archiver.kernel.org>; Tue, 17 Mar 2026 18:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rmu91ZOlkBlRgG8B13OKfLVMrQD3YYnQngV2MlJEfFw=; b=Y4dowytU/opepDa+wzLn9HXyYf
	y8BkHFTIzZW+U0K8PafJgFKh7mVQ0T4F9RYKeUYQjbaYODYGtoJL88agZwE27//CGLpfJuJiesMuj
	MrkrtriruXDCb8TTUb9eQ6DQJXCVgGZfUJ+4m65bEQGDGMP7JVHKxs6XYkHUSEkSeBw1wrypdMBN7
	fjPgJJWoMVpwgZhqKwaN6GpkJftTsfyhO0W3ksWXpxKyMNiiXaQVR4A2i9kVhQbfysn9QQIb0dM63
	UxQcmpA1vR7Hcam5q9pZ+kycJLQxUKTB9GQmTzxzD/p/Ca470S2FA0pO9ve22u0DYk9x6awaYJwbi
	23H1rsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yqi-000000071Y0-408d;
	Tue, 17 Mar 2026 18:09:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Yqg-000000071Wi-3mpY
	for ath11k@lists.infradead.org;
	Tue, 17 Mar 2026 18:08:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDiOvm2906089
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 18:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rmu91ZOlkBlRgG8B13OKfLVMrQD3YYnQngV
	2MlJEfFw=; b=Mk49nYIk7ZnuEPJasHlRpYRKKc5eT9b2s3qF6ljsghjDlGxV5xT
	2fa+JkJHqngW2LNCCK6KzVy6FBEfHT+pLwsaplapo341KJhnOQovYfQ/XzF9g56G
	VP8Neil4Dm7Bj3jEtlBCqlBR/zA0gq3hUU7yhKRbliDpQiafC+rPwiW6T4zoLtVU
	S+zjjkPMatvswqavF/AxSsezD52hjIZ9vVn41ehHKZZ/cTtFpBSdhiCfw3l06S7b
	FksnC5Eom7HnjUDfplwTZ24qInn5/GJZblDPATvl8/yGoGX5kkbaF3cJhoXi03Bh
	+INIhFqhUeKKYw3XyCLXMcJKEHYhAVAdBog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2jxjed1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 18:08:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd827a356aso559371185a.3
        for <ath11k@lists.infradead.org>; Tue, 17 Mar 2026 11:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773770936; x=1774375736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rmu91ZOlkBlRgG8B13OKfLVMrQD3YYnQngV2MlJEfFw=;
        b=O7HXnRv3HD06hcc2q1hICm5dTCIwjtqmSQ/tpCHdB+y0aihVFTpWtNPvtlLx2K8inv
         IC1tb1oMwUknlzni5oGdajwQO88JS4f5wQNtvUN//UUoNGbp0jtJfYESzUN3W5v7s/23
         A6AJKiW3G2wxypRXFuRca7xkkcHEBzMaEMhOx82QSnjaYKVwtTNjefvSydY82h3huyg5
         /GNOh1bH/dvwDMF4cge8KPft+VqBgXrDj3w05KteRztE7dQzdTEOt8jucbR6OJGPeKLP
         cyaYpMbx0xaFHrtKAcKPO39DFKFj2s9fbIyS8Z0XxWsOBbj3I3hpH2JJEIbWlUe6wSeG
         cuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770936; x=1774375736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rmu91ZOlkBlRgG8B13OKfLVMrQD3YYnQngV2MlJEfFw=;
        b=TBtKBUIpbtPvgh1PK254VcI6De8Bw/wAYItDnQWwMFSXyGyOaCwuTrlpEr8ijTsL5z
         QjzYPFFc+9uMkUjeNcJIFUuN2q3Yikwao4GfhhU3f7+EfYv9ZuN9FQ70zG1vX2IKgxTw
         s0LdOXfXTghF7N+8QtZnMwUYY4nnmTcVd6vweP9dk9yqaG7MsWZZX+rgGtk0ODfb7uvy
         j1mvmFkr64SmUbUZx30xjPf8C7ag2d9VYEjPd/pLWMWZ20VW01mrYJz+/CecBXUKzh61
         BAFp0XsC9W75es1ly1pT/6Zo2wSK1wYYvsu5OsUS/MtXRCzPsh5zAgR511SEBz97jBzl
         d53g==
X-Forwarded-Encrypted: i=1; AJvYcCU26F52dDpsVo0hpo4g8KfxBAdqqPh/36gxcUxiviA6ZmyB2EiJV5Tn6wIqwDxkfRg9R28wpsI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxVMXbB9B2WRMBr+Yuou3/WVkpwPmW1U5Dat04qkFnIwFHQ7fB
	tDB2ygzCiF6JhB3/Q90otahb9W3maAk3OHRwE2vi6iqhFHFlseKhvUVaiuvbUr8CEOtVXG/KixB
	OzHrnPB4Za4TG2TyjfO9+QuyWFpslSPaw7yP+ABj33mYcBgC1UrICVuvyq9hZprOa
X-Gm-Gg: ATEYQzxZGEf/d8LHqLn/97W0AgAKe0XFmQhztM+efNMH8swNHy0B9Mk/zoiLaqC1opt
	fROQf301v5/pf/fZWgJOKGqX3CKoQ/HVhqVP9CtgNn3mkA+XStvZQXDMB4h7Zn82gNKzEIhjZJE
	qgt9wi6z2MnL52uuMMme45/M59IK+ytEeK0PyuOwOCC8+Zcxr35MNXbVOVuMRPQ+xcigBiG3XqI
	9yMFm7zJ98fT5O36BYWrMs1DkdLx0ckH+vSOAVC6rpAFB6u04IEliEqno2GG/7uWDSZRrygKDLg
	A6k/CFpgHhw62guIZOriUM9Quru9LU6IRD/Sppe4Ed3b6ix9c79YQSDfZFW5r0vwjBd6rB8S3Wt
	dOUThr8oP9dGaXQCUPSsCRjqN3TQHQtv0nVfJelyCWezaIgPcNw==
X-Received: by 2002:a05:620a:1706:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cfad1e452cmr74868685a.28.1773770936016;
        Tue, 17 Mar 2026 11:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1706:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cfad1e452cmr74864285a.28.1773770935576;
        Tue, 17 Mar 2026 11:08:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4614c4dsm1501765e9.16.2026.03.17.11.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:54 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER),
        ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER),
        linux-kernel@vger.kernel.org (open list),
        ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER)
Subject: [PATCH] wifi: ath: Fix the license marking
Date: Tue, 17 Mar 2026 19:08:32 +0100
Message-ID: <20260317180833.3061582-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yU4epVQHEHiQt6lCGVhiz3vqaMprCV4M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1OSBTYWx0ZWRfX/doY4Rq80wrx
 0xXERqXr9UHxULq5vGTjFrQGnC3ylNqGhqFmoVcm7v8POEbnvlJ9gFFDbddjipLtVIzDUVWKB6r
 6KjArCMg5de8A0PHUoTkS7lws6LCcVWskiWYdoiWdQ/i87eOEm9dHyzjg2KO9W9oHMCTN7+yipe
 ekVZoXGwfICof+j5VFBqd0zXyzYKttXO28qWNG6CoPfRwJmxDg9w6n62wYLhb1ntizB+kNCiPc/
 kKtAZm+XIaXB8pRuD9lb2B9/08ka8DOwe8xxgNvZ+FQyJpWOoEvmqWS4jjtgc1fgurZ3He+puk+
 4oDdnllTjETdK540/kG0G45fqVFSupWaNSH2/pxiOKjZ9SWnFMjB54JPnw8EFPvOOdree1A00Di
 lnVP7izahi4HIXExswqQ+VpRs8/IuH0zLvvMA403kObPSWlyGLrz3YDt2wg24x98TjNirmyP477
 IFpTZ/E3l9pLoQEMBaQ==
X-Authority-Analysis: v=2.4 cv=c4imgB9l c=1 sm=1 tr=0 ts=69b998ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=GxoTDrp_cBUVqGJeqSQA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: yU4epVQHEHiQt6lCGVhiz3vqaMprCV4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110858_936567_9E6B09EF 
X-CRM114-Status: GOOD (  12.49  )
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

The Copyright for Qualcomm changed its format and replaces the old
Qualcomm Innovative Center by Qualcomm Technology Inc.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 4fdd0af415d5..acad75d49d98 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/completion.h>
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 1397756d6251..410a7ee076a0 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-- 
2.43.0


