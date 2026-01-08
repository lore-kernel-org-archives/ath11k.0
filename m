Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDE7D14899
	for <ath11k@archiver.kernel.org>; Thu,  8 Jan 2026 03:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X8KmdR+T61aSIYfW+HbPKLU9ZV6zlFQqA8wLR8dZ4wc=; b=H35JvacppniM9OPYbAVyVvJBup
	aevb2qalIuCc5bcjE9SMAV6+QzE2KfJsBSFWzbOIKQxuyocR3AUmnyVmOszdsEDhf3AHYW6u45//t
	dy9TGHFJh1XmPz87B4IoFmwaOn6ZLorIkriOeXVGb/SzRb6WvR6uV2ElEGZhAZoCTI2YRKIHjkpHM
	gWidiDKEy/NUY0HKzOy2QaW/IbNojrNcsZ8wL+hb4xABn0xSOczXzh+Q48bUO9jNyXv6gbMRp/RI4
	5lsD2N8YrjrTR5nHFA2H4ZK1jG1WlKdcOcgWRh5U4tDHix6lV1Wh+DbGQ7nXwKda04hy3qq4eJUJS
	HDrrb+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgyb-0000000FtQ3-2Pga;
	Thu, 08 Jan 2026 03:46:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgyZ-0000000FtPV-09rH
	for ath11k@lists.infradead.org;
	Thu, 08 Jan 2026 03:46:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607Np750589581
	for <ath11k@lists.infradead.org>; Thu, 8 Jan 2026 03:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X8KmdR+T61aSIYfW+HbPKLU9ZV6zlFQqA8w
	LR8dZ4wc=; b=mH+5SE5EIy7G7DGE8jB0bleIMTvNj3Mh/Z/0OVs/5NpPQaDFW1P
	AVoEaxvP28mAFzm4oqMc7RFfaBmhwKr0dI4gfaHPPghfaK7K0kev3IyQPsuf95fu
	1dSbtgGJHCao656497KuzATGi+jzYCFgI7gAIp4EcPR8C8rj962rBOFUkYVX0KpD
	aRZuSb9LMM/TP8SwivYduoxhYt2wfEtHyJ8yNUE2bHukGEIQ8sjvzFOJNGagq6eX
	bFISXcb/RVbduXqpqnHr0RqYLDZKFdPDNTAyyVVT0PRlFEXt+vYPjBr2E3qpp47Q
	XglBxXha4urEmIB0X4V4dmOSuJUNlryiUVg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2nu11j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 08 Jan 2026 03:46:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c52743b781eso488505a12.2
        for <ath11k@lists.infradead.org>; Wed, 07 Jan 2026 19:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767843976; x=1768448776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X8KmdR+T61aSIYfW+HbPKLU9ZV6zlFQqA8wLR8dZ4wc=;
        b=jgZcka1YYvH3tZdbXe35Wcc5tal95htZ9ZaCXC18Xbx2J0ljiW9l6e9hOfN17hR/bx
         qpshGnbk3CgtObiwAGI5QyBpUvDNWXcdK82+BTAgw5im6x58IGfnAZSFzHtrP0qcf3eM
         zOB5SYOvEnthEuhZx6y+FRlEfPQVxebBjErpMzTfsTdALXhwd6DEXJaTO63vZlEmnLLZ
         XPkmnz6MDjgPo24d0W5xgNQqCl4Ugj4LjggvEDVrPTcYCoSaZH2+IiO4cBFIEBxOdDFC
         e8IvMpzsiTMOFDfVifVK+ePpYMq+r2nYZ4MA+3h1hCwN6g4DyIMZF+TeOEVdvjJghQLo
         2h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767843976; x=1768448776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8KmdR+T61aSIYfW+HbPKLU9ZV6zlFQqA8wLR8dZ4wc=;
        b=nQrHKyc0D3E2GQIDXnenhdWa1wKR72MABtUYt8rpqOR+2difBHoAwEUDwAjcKZfYf1
         8XRZwiI0aIC5AmKC66G1e7UFPfWsVj2fMjwfakI8XCu8f3dV8CCkX6d9rSPLOnM8Sw53
         UcAP7lSf/3AuvOXuO/4gbzRa3hR17vIlp/tzZrZ6dOHfB+McX77jrQOyAcyMycFsXPJO
         j8H172Fqr1QaueiLJRjLawVbzmlw4gynLyaiXi9cm3P4/mX31NGcaIVxQXPYM+fwUDjY
         81h6RYjnr6dN+PlSWnJc34k7HM2yviT/zdcXq0yW9qPA+2UlbLRuM1ZjJdMMz+o3A7Nu
         mzxw==
X-Gm-Message-State: AOJu0YzgavRku35eYWIFzOm94hu0OcTL0dOMRN1e1RcIanbCLUO6QmJF
	sXlkRxzywIaVDeEpbTdVTwuX1zWKtQMi3oSvvLzW6e14Fz8PQHsC2v4dr3PjSpsFn9IlP/qICJh
	O29VzooIuo6/zdYWOTQT3bDWx+IHY01hF5PDmbCf+VU9ygtWM4zsnJ+B6deil/7LtMCluC4P37T
	ZhEA==
X-Gm-Gg: AY/fxX6UW/KaH+vLJmISeYo+4oaZtFGnVy7Bf6UY0iXeegJBtRKTZSxtoVCX9cXEHZM
	oYdNrxC322TOcr8N0dangbUl+wUruI59CghwBrqPOJpWUJHw0z7w+URgaCE4ocapvBDvjJSXA49
	dZvIftSY9/C8sVoAl3iPx5U5KDU/b+gjWaate1fEzUhGPGDAkQIlehlsqyOk1r05rxuwBpgIZwJ
	rzbkY4qND9lI/HJcAh7nc+G3/V4l12m6NY2pH2GlDmPDlw17j81yncNOnlg4BrjNZAZ1o5yoQhT
	gSDP1TS3KYJaRhHS0bSDzY0WErm1obxP5e0L7mPO+h2RyPSVbGlp5k58Qj6YGgQwrbVm5fm+V7p
	s1L8YxerzecvVJ49Pgf3UmijRgf1Gbw==
X-Received: by 2002:a05:6a20:3d86:b0:366:1a31:a70a with SMTP id adf61e73a8af0-3898f888af4mr4372137637.10.1767843976295;
        Wed, 07 Jan 2026 19:46:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuKtz1HgzsDQSYlMSF0IneA8k2lMSH184tr4ZuJR8aqEaV+XhheuHZfMh0A3YbdXqSeXUCTA==
X-Received: by 2002:a05:6a20:3d86:b0:366:1a31:a70a with SMTP id adf61e73a8af0-3898f888af4mr4372118637.10.1767843975747;
        Wed, 07 Jan 2026 19:46:15 -0800 (PST)
Received: from zhangq-gv.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc05cd9d9sm6785013a12.16.2026.01.07.19.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 19:46:15 -0800 (PST)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath11k: Fix failure to connect to a 6 GHz AP
Date: Thu,  8 Jan 2026 11:46:07 +0800
Message-Id: <20260108034607.812885-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAyMyBTYWx0ZWRfX8tQN2FXEsonV
 +/+LRiKdPxV0iIf1bXh4E2jUx1/4JjY0CXW5pqHP+8FmkpA0rtZlw+qMTD4E6kA0tFXFEyU7jwJ
 yS+UbF+bjIS1vSJ5jr5+lDBTRqjc0zhXiEMWSIwrIT643iVVOyk+pciba+VxgMXPUaSNxhYBuO4
 2onZO0WaAFbdSssxJqPdGdWdF99aaFsQetZ4EMl9CALwJUg6bXG4nCpAmcgMKDc4iLWQWfDB2Dl
 TVKA97pfSJ5J7FJT3HUsxD2KKnltoiJMkKu9CZSLZxKANnm5OSEAqpcY6JEl/pV397nM542ls8X
 YGdHnVPgACHBcWsnLKTuJ0DRKMXAtAkJYIW3dgd3HDU5MvWxSKJtmu7cAZAJvb6ijep6vTruN1z
 WjhqBecg4+bOhNK7hmebwEwOcex1AbKmRJLE5/enyo17hDD434XiDHcjiqukED3BOQqYxsYOy1P
 zr4MRuv8cKwZWrGlQAg==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695f2889 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OMkZRiVep83eAS_9AiQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: I0haN6fr_6XFJ_IZhS_O_bFZuq3uk_DL
X-Proofpoint-ORIG-GUID: I0haN6fr_6XFJ_IZhS_O_bFZuq3uk_DL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_194619_245945_3B6693B2 
X-CRM114-Status: GOOD (  15.25  )
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
Changes in v2:
- only return in IEEE80211_REG_UNSET_AP cases
---
 drivers/net/wireless/ath/ath11k/reg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index d62a2014315a..49b79648752c 100644
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
+		    (char *)reg_info->alpha2, 2) &&
+	    power_type == IEEE80211_REG_UNSET_AP) {
+		ath11k_reg_reset_info(reg_info);
+		return 0;
+	}
 
 	/* Intersect new rules with default regd if a new country setting was
 	 * requested, i.e a default regd was already set during initialization

base-commit: e33fc1c6d54ee1569a57255e11c2978ba9a42ffc
-- 
2.34.1


