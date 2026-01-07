Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F9ACF6BE4
	for <ath11k@archiver.kernel.org>; Wed,  7 Jan 2026 06:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3MvI7j0vd4F+cVEtUNueM92+VITC/CkqafRNm9AbHnk=; b=gE9tGXUiNfr1dlBOQ3M4scBfX4
	3BvAdQCg7wjtns8CkilWOgXID+mN4ID7w6i7c1EWWb/XlREvHJPEzpKswitChyGXpb/Xx29bf2xSZ
	W5Vgh6JQK8sDdKd4rO7Z6BIiPThXjH1bpK9rY1q86oqK9oBNwCG+UIxyd1gffK5oPRASMQc7aD6qI
	MMv7ssuN1JDA+B7CHR/pTmo3nWUajAlMS56NLaZ0/FgPGFX1psZnw4SekGwJyZfitb490pTbqPkaA
	efkFzcxgMlQ8C5Hn3ne8A+oYeBs32nQGz2+4Pc1yDfEmYzhvw0MZkk2uyQzv4hX0alkQZQPtpI+JB
	czuqqfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdMdP-0000000ECEh-125H;
	Wed, 07 Jan 2026 06:03:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdMdM-0000000ECDN-43B0
	for ath11k@lists.infradead.org;
	Wed, 07 Jan 2026 06:03:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606KDK7H4048525
	for <ath11k@lists.infradead.org>; Wed, 7 Jan 2026 06:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3MvI7j0vd4F+cVEtUNueM92+VITC/CkqafR
	Nm9AbHnk=; b=XhgltAQ7KzNFUBi5O8vseUWjF4r2p/P8sbrMEBugFbk3WJuQjCN
	pEgJz7ZpWZAbMaoqN6SB345nKvjGX23OHECQUm+g2wbrAR4e8lKCklooxLUkBSYe
	po6EtgVusAzvrPTihleX36u8z2jMKRwBDvTVRRUxsJINPXOTnxVeVjSMf+syhKRB
	LlFfXz0/5iCZSbW5oH3Jm7UdlZSR5eP4B5+vbWbrFwM1OTncE2WCSbbMP+U3UqZb
	2QzQo7wFNc35Wb/RUUwE3Mgyg7FiM/1RRBagP5VZ7aU34cx5ohM0dAjSFjVykHTL
	bcrotNJGS0b1X8mFJ6aN8KSh7DwVAbIpboA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh25rtvs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 06:03:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso19595025ad.0
        for <ath11k@lists.infradead.org>; Tue, 06 Jan 2026 22:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767765783; x=1768370583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3MvI7j0vd4F+cVEtUNueM92+VITC/CkqafRNm9AbHnk=;
        b=VNVjSO/spm3OrCAYaiCwFlmzr10rvnkbD5ie8TChkWwfmIheL47oBFfcfzXdskhuYj
         vpz/3ejHNkc93d5DWpKF/a4hFgeTP/Lo6Tqcf3aVN1J/v53Ar0xkSUL+SFGwGoBQQxGy
         xcrNk6WU626gZCvKZ0DU+b1q1VozX9fhWaYyn/o6zj2EyY7GGI5KA+vLy/e1PKqqGcuM
         7lASmGej+bSNMoAtgjr8TLnDkAcoU3ocypUQJf2wiXrf9w+qg+aXVXrfDbMThRmsJvnp
         RaNDLNoWSDMwz/DSeMVo3VlSYUwbq5uO/DKbPgHFdLUAMo6XNvPElP87GOGAkSMDLRTJ
         snyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767765783; x=1768370583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MvI7j0vd4F+cVEtUNueM92+VITC/CkqafRNm9AbHnk=;
        b=iI0zs2acrh+EZaJkJuqE+Gk5C/CFNcSTMSzGLAUrFxqzPGFtRipFZWWyQducXRmN2C
         GRJQZ++s+5kezk2sy6ZsAoLO8rO47Bc6VOXVk/xVm6LKkU0ia0gxRFvUBf+lf5G+BbTi
         V/vN6gaXBfxxRFh9y9956Rwr/JypB20V/edElru7cBbN2IktlLFAHXNkFDAoHazjgIFp
         5gJLNgN0aUavO/cDW0wuesregL/BCYVmypQIT2QtABWtWPZ/WkkRG5GJ4fVWBf42YOv4
         ArYvh7M+r8Nxu8WJcwm/jLMo22G6HQhQVxMAPbn3a7a/ztBMDLazRtKtrfG1JtN+fyGA
         qCyQ==
X-Gm-Message-State: AOJu0Yx36X4VJE0QBw9nUIqPqgX5d/XCqYL2W2iuWM+e9Oe+LNLaZT7k
	J1ScRhqPXgjKzII5aoQsLrRZztbZRRg9066wBj2+JXH2CDp8DvCJzV2qh123ffRXGtGezhg40+z
	mPiwd3oKajDRdhNjG3fqgdvsF/jzAhSjjPSwhna8e6dCYzQFSjzVlXhxmM4bB6GyTgVnAPu/ROP
	zBNA==
X-Gm-Gg: AY/fxX5Y37ALMaMOSaHJ5oF078mfgfW3ttecsjXeGMBlMkiK+WYVTuWBlqT5wcD1RPR
	7F8hWxH1sgVIDEKPJM8GhnysVUo9SW581eUKZtlCvMJ9UKC1nhBq8+saf96MTUMdokRUcqEQSsF
	s/MAxbNOraBmnE1eZrOoG1qzgpTiakWVWwNNIzBYC9mBGb2sXgEi5SIHDG9eUviT+ntlDVn8UmH
	rjSOm700iTaZ4WM0zqEnkUK4e5ox8zv9Sxl9qj83kxIRzkZzSF5JOONlE+3/PpXEkvoSC9utQrP
	20kQ7yFR5Oorrv9RkYn/n/QkQRZ0my+DcMRbdCqBP6Vk+7cL5Lwa+hGKhuV7YqRLPR3WckpJm5K
	2avulz6y3EIMahyb+da7SUi4s2tDtnw==
X-Received: by 2002:a17:903:1585:b0:2a3:1d78:7505 with SMTP id d9443c01a7336-2a3ee4b72c2mr12443935ad.56.1767765782912;
        Tue, 06 Jan 2026 22:03:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg5Xj3sfQhEqVVpCrMiKcrmv8NcTJfC6i4EDzIVHijtU5iCkJ6kj+BqeRF1WXao8FI89tCGw==
X-Received: by 2002:a17:903:1585:b0:2a3:1d78:7505 with SMTP id d9443c01a7336-2a3ee4b72c2mr12443675ad.56.1767765782327;
        Tue, 06 Jan 2026 22:03:02 -0800 (PST)
Received: from zhangq-gv.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2c5bsm38938905ad.58.2026.01.06.22.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 22:03:01 -0800 (PST)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next v1] wifi: ath11k: Fix failure to connect to a 6 GHz AP
Date: Wed,  7 Jan 2026 14:02:55 +0800
Message-Id: <20260107060255.29530-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WglVZaLcg6hSPf5sCDlzvoHd6zWjfQED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0NyBTYWx0ZWRfX90ZcYDUYhDX2
 3rtlZRG0UHg2j3mprrgM83KLVodhjN609080tHujFdMS6Wh/90YTEHyFYjABs6Beg7V4+VMvvji
 hes2rhIufbHl1oEegyQeLhPl2CVFZ2UuRxip0Ym+J0OFAMsTDCi5mdc6XM//aJiDYM/3mBivVLn
 1a2/ftjP30wdWWd3USUmrR6SgVfise0aTFz9hk762doDTZqqY+0hN2oLXpxuXdiuVlu8MRj8fc1
 FiPmw2gzZWuumJCO4thOgAykFW+bwfH6S+DGg1sSM2ywrjquDBp/CoB1+PNF6/EyxmVl3mp3Kfe
 gj1LcaUbqhu1dyYylv/XOeXdZIrVZWRa4u1dTI0eKHTgP6G1+NYmI9kW5ZexS+bcUGn0LrzBrtk
 yaEv+JWI81L2QtFsMBDSYZC1jQFOwhI6/BMYZGx7WCMe07MbBWi+l6evtULh+td/gHO2EcCMbza
 uVASAFgF2xoBqMRL2xQ==
X-Proofpoint-ORIG-GUID: WglVZaLcg6hSPf5sCDlzvoHd6zWjfQED
X-Authority-Analysis: v=2.4 cv=G48R0tk5 c=1 sm=1 tr=0 ts=695df717 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7kaDdzVXBmEKihqrnZAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_220305_008971_3B5E0C8E 
X-CRM114-Status: GOOD (  15.43  )
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

STA fails to connect to a 6 GHz AP with the following errors:
 ath11k_pci 0000:01:00.0: failed to handle chan list with power type 1
 wlp1s0: deauthenticating from c8:a3:e8:dd:41:e3 by local choice (Reason: 3=DEAUTH_LEAVING)

ath11k_reg_handle_chan_list() treats the update as redundant and
returns -EINVAL. That causes the connection attempt to fail.

Avoid unnecessary validation during association. Apply the regulatory
redundant check only when the power type is IEEE80211_REG_UNSET_AP,
which only occurs during core initialization.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/reg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index d62a2014315a..8786ca3870fc 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/rtnetlink.h>
 
@@ -926,8 +926,11 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 	 */
 	if (ab->default_regd[pdev_idx] && !ab->new_regd[pdev_idx] &&
 	    !memcmp((char *)ab->default_regd[pdev_idx]->alpha2,
-		    (char *)reg_info->alpha2, 2))
-		goto retfail;
+		    (char *)reg_info->alpha2, 2)) {
+		if (power_type == IEEE80211_REG_UNSET_AP)
+			ath11k_reg_reset_info(reg_info);
+		return 0;
+	}
 
 	/* Intersect new rules with default regd if a new country setting was
 	 * requested, i.e a default regd was already set during initialization

base-commit: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc
-- 
2.34.1


