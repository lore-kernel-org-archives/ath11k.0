Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510B7CD4F54
	for <ath11k@archiver.kernel.org>; Mon, 25 May 2026 02:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MsrGpr+YZgbAu3GU1QdDRHiOVznOzwgFXUt+yvs6LIY=; b=ErTvi9Xth5EP9gleRwblQTWNo1
	OaJSlRcdQXu6mSkNnQwhHQEj/mFJ5DPez2hOb6y11Y57GJEaPNUd1ixZdB4Jg///XsH2NxudINW5v
	qa6RKMq8CuqgtX1cYZfUVtYR/wWs9zDjxljl4aQG03nLo/nutTohld8HbdIeMAnqtYNoxNIWeuzr+
	E5OEP0+GUDimh7rfvuO9tQZJbzuman079VCX5wPNnr8GbN/soDr4O6CaKI/iqy18FE83M3NCqUjaS
	AUBoumXq9h/woUutRyQ+ovFgJS7ioifSgqttfYlBOKxl1qA3TabBrJrkxZUg+aYZLG1fAQv257J3y
	/gkNaf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKj0-0000000G5VD-3mO8;
	Mon, 25 May 2026 02:07:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKiy-0000000G5UY-3JVB
	for ath11k@lists.infradead.org;
	Mon, 25 May 2026 02:07:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P1xit42002726
	for <ath11k@lists.infradead.org>; Mon, 25 May 2026 02:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MsrGpr+YZgbAu3GU1QdDRHiOVznOzwgFXUt
	+yvs6LIY=; b=C6MtZNKfcJnz7/ykQSMFD1uVT83PZnjhgHddpsLQ/Wcxjt9Z/+f
	8pNAbz+pu6YPMXy+JbjjUUncLjKYnept/KK3Gv6CQcBEQfUfbwdAdS4DgNc2wfhu
	rnNoB+9Qjb1Xhloq7yMne4I7NjQnXB/92KUZFMUU8KZ0ZHlR6KF/w+gBZj/AV9Wl
	hnuLC/r5aBEX1Cs8Yu18KGhOYM9NtWKG+1PmNLjH/uAaQtHOZdMo+Ran3dv19YIP
	fwUc26X7vNzRQ6fyJvocoE31HKLi0PRtRxExduOLV8md26VQiogw/QCTpXdHic46
	3oiKsUNgkgq7s3NxB2jI/4aAQpG0e6T6dwA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmmw16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 25 May 2026 02:07:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so14592088eec.1
        for <ath11k@lists.infradead.org>; Sun, 24 May 2026 19:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779674842; x=1780279642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MsrGpr+YZgbAu3GU1QdDRHiOVznOzwgFXUt+yvs6LIY=;
        b=PS+42yP5kjrXX2VtpbxSOwQUc9CJxrbRJFJCK3hribIe+eLoCaDtSPn+vks50NmsTG
         gJgp/i+bssObOF7zGFntbg6SCqc7/DuUMDDfCE2opbjm28NvAm4CbJUVjgsPfOPEEuNU
         5qS7bRBJkQu0mJUPP3tfjfU0jZQLn9MBwVo/+poPEdMM92SYJc+r0ehPWkNheGP+W/lf
         WjKBj8OOK6W+rlvel2nkYYLhCTNXmkush9BvY9Lb+lYsGxfnw7HefBrt5De/KwFks2J1
         nA8b+kzMw3kZvjhnyEu9pn/8uL+kQkRhf8akGYrai/n52h5Rae1Sik2sY7qWZVlammDM
         D/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779674842; x=1780279642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsrGpr+YZgbAu3GU1QdDRHiOVznOzwgFXUt+yvs6LIY=;
        b=AKgFRs7HhgFaHhqven/kSi0fjBANFAqK3pz8nQr/mPyKqUStXDgmcVGIylEI0zeg+g
         P7DVcIr1M3aQCNqBVa9GZSyUT3Dy0KZ6CiaJR2X0shq3LP4WfzK0q0QU7DImdhWAO9lz
         DHBotjF2Qh6jLtNGMttjRGmoEXhVKGflwLLAOrkX2DhyediceCnFmlV3vpWvsbgISbzo
         yhTPIFRtoUIqBfLMl+hyk9FuTEkRqGEyyZQHXO4MvxD9Wqf4fMJ5g1n8vwsQy4bK6WaH
         rTjsnC5VVL7xqPMJ3CDwvCADAVofSmiED5kcQ1AsJqVeo0yD2md/uvHYRFWCUMb4qAQq
         XDtw==
X-Gm-Message-State: AOJu0YyUX6nPS9LLsi/+SVwenI5vsaP+eI69VUhd3MqA+RIxqozHl+At
	RzCdz4ZOgoKbEvQs9LPpbTsnIVT2IQNcvIzhgIKwgyJZZ0IlmftC81lRi9HsN2ZJ5FIIUMaHPRR
	NDgvXRI6g7IvJJFL6E/CxrbwO1Cotz0ucRl0T/nDLAavDzigc/VS3hAeWdZGHntSB
X-Gm-Gg: Acq92OHFOKTebhw6WbO1ZzrMoha/PaAZ8e8ekNA6fYxUz4e4eBRQBjau0IxuJitq34R
	qKnGjw5OKAvSSFaDjlbhuvpo2p0iiqsa3rnIGXnfmkbzgZfWcXM+DinIEhqhwQAwjuqRhsUOn90
	dvJTgU+EyRshg6YL/fYIiwErACVUOzC1kyBgp9bcp3JlapqvZsM1MnW13xXaCgWe5xgliCkN2W/
	nqOF7/QOd9k/WU0kDIvnXxQ0JIFeMSAMpFRFsb8yyu76Aa7FNyG/dChwz7MWFWRzTQmqH5QAt1F
	i3GmKmd5Z5VX1QkxJ+USTNLF/j49dK62gs1O1RYx54kQApdmXJLvoVhT0o48pwWnDWhFZ/y/DUM
	olA4UjBBOWT7QGx8ijX6mN+RBiPvcQakjK6NaJLhxbUrsHIJq9/ox+kjXMmhF5Vu8WLQXsYR1HO
	zKFQ==
X-Received: by 2002:a05:7022:2528:b0:12d:ca31:f1b6 with SMTP id a92af1059eb24-1365f814439mr4377465c88.18.1779674841800;
        Sun, 24 May 2026 19:07:21 -0700 (PDT)
X-Received: by 2002:a05:7022:2528:b0:12d:ca31:f1b6 with SMTP id a92af1059eb24-1365f814439mr4377453c88.18.1779674841173;
        Sun, 24 May 2026 19:07:21 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aa88cffsm4839011c88.11.2026.05.24.19.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 19:07:20 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next] wifi: ath11k: raise max vdevs to 4 on hardware with P2P and dual-station support
Date: Sun, 24 May 2026 19:07:11 -0700
Message-ID: <20260525020711.2590815-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDAxOCBTYWx0ZWRfX5lS5E/PFn6iI
 EsQbk1WhxrHhN4pTdeLSyMurpNzx12twpzeeI3UOfjUgnwhQfinGQVe5oiX30/UNGlK61lXjTBd
 XvJoyCWKZMG47R7ahOhG0wV0s08Bgn0r4xvVy9IzxeH0yVGQGEofzvzfxc/xs8DaIM/w7oWpXRz
 zvlbuBEcbqcyz44nW9RhZYdwQw4TghGP9+7QubKb9IhK/5BmrEs3b2CpyaIBxZ/n6a7N66/m0Z5
 pSztUxpqq7d0O06HxdYpx2TzNryKy5XEeh6aKmOOg18RYobkGCV/HIv0sOa0YkiOSac+jKiluWg
 xgr7nmRkf+hY3SwhkdAu40CEw2RLPFxm2a7xsNjzbJTYZj09sEsUY9eC8dq9xb8BnsLvHB/f8G2
 HRlxmpHPevhOJRpYH9i1o1NUtGfUsjnjMGBCaxytilAIuFGvtKVhUf5g2SOpZXl1n/WvngtuIw5
 si5ITgFxzfxVB2qCiFw==
X-Proofpoint-ORIG-GUID: rcwVAha2oJBrEOq76RO_ntc8gYJ_zOtm
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a13aeda cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6dL03X2lIcQah84ha6YA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: rcwVAha2oJBrEOq76RO_ntc8gYJ_zOtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_07,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_190724_963237_6C6CC793 
X-CRM114-Status: GOOD (  12.61  )
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

When P2P support is enabled, wpa_supplicant creates a p2p-device
interface by default, which implicitly consumes one vdev. On systems
managed by NetworkManager, this interface cannot be reliably disabled,
leaving only two usable interfaces for user configurations.

Increase num_vdevs to four for QCA6390 hw2.0, WCN6855 hw2.0/hw2.1,
QCA2066 hw2.1, and QCA6698AQ hw2.1 to account for the implicit
p2p-device and enable common concurrency scenarios such as AP + AP + STA.

This change increases interface concurrency in the two-channel scenario
by raising the maximum vdev limit, while keeping other combination rules
unchanged.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 3f6f4db5b7ee..8dacc878c006 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -267,7 +267,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_ftm = false,
 		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
-		.num_vdevs = 2 + 1,
+		.num_vdevs = 4,
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
@@ -445,7 +445,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_ftm = false,
 		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
-		.num_vdevs = 2 + 1,
+		.num_vdevs = 4,
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
@@ -535,7 +535,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_ftm = false,
 		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
-		.num_vdevs = 2 + 1,
+		.num_vdevs = 4,
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
@@ -797,7 +797,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_ftm = false,
 		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
-		.num_vdevs = 2 + 1,
+		.num_vdevs = 4,
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
@@ -886,7 +886,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.coldboot_cal_ftm = false,
 		.cbcal_restart_fw = false,
 		.fw_mem_mode = 0,
-		.num_vdevs = 2 + 1,
+		.num_vdevs = 4,
 		.num_peers = 512,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),

base-commit: 2e9422a6a2d8bf4036287c2fd3b034392af64048
-- 
2.34.1


