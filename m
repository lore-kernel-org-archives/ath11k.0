Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B95ACD8CAC
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=; b=A3CN0gwg5z87agZrDsQkzvXWyr
	XCzr7/ZLyFOISFdwsMlvgAw/XApIumZOmTkyzCAbVKioha3PCRyEIeAkEEm0yfdfgwSkcLP2MuTsI
	Z5XtHVdTDUVW1KUgNgTl0khctzvMofrYuyXZpJIoarB432EN4WUsowPgjbM50LylDXOps0b3y3CY2
	NNfFbrbHfWw4HHMcZcuUu6895tjUoPW8ljbvicHDk8QvzhFdMXqXgFrqCd8ZLXH7a5ttTcK0ZALQC
	H4PucTC3evGXPfNpynvpXjH3FG8GvEUWTyOJXjNCzbbRpJKJ2XCayPZddNfU/eNpFOFpH6ApLvgUN
	VJYHwU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvY-00000003bx9-0TS7;
	Mon, 08 Jun 2026 13:22:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvT-00000003boc-1aUP
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 13:22:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBJrt3417577
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 13:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=; b=dJ73VVEF8u3u6yrl
	2hxEoLrdMbk0CVx/HNqak8t1t7NRBVCu39o26Jsfap4tJLvgodFR9FGWDL65AK+g
	J+pYxKU3L1+gUlCkP1ILUYFhH1oXvkOEa4liEXqJtmUDhHaN6qvHOA+2kV5OYmw8
	Pf3JC/U+FuudCILAHRzRnBlMVSaSl79223CBSFjMVpg6OfVvgaob40LL6Wb5nUil
	Lh6LE3sC8n1adUmARFbHeJj4ZpoAo7lGCQDGwWXcvTfNSV+fVfB9aguL56GSvcHx
	TeHANNMNAUyV+b6m5xIWBOJFPcD32ExA0MgflaJD/ktjDtCS/tqdxcMQLpswAZjx
	eb3gaQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enuptgty5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 13:21:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30761ab3483so9520509eec.0
        for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924917; x=1781529717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=;
        b=OmiA0NQQzJ+4ovyLgHBAnM6i6T896M0uCzeh5CeZPeXm4TuYpDt8LQADeA6gL2xtaB
         UPaof5f1EGzUYOizL0L5MmM55pWZIzxAzXtHwG4degCSiVgs7s4lbw/3jOumL3lWVP0v
         VTwLIeAIg3/a4DdvWqWXNpiblaJQd0BUWKe61QOx4M+3X9yFyA0jk+gyUM4WcHO2lpC0
         JD6/rxc2P69IVVqr9dezaYY+GcG/MwJpUiLqNgjYUV6kF4v7EtwrjtbBWrO2SmgMjhOD
         I6K3ZLDl+JGum0po9Yiatc0dcenzXsy6itiDyupbhQUZuXIznlUP3WQ/lXfCwemq93eR
         Nuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924917; x=1781529717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MhPM3ubSNccRdzcMhDmRMMZnm9xv5JTl3e9WCBzFp8=;
        b=MeAvxPqTC7Y7jSgHNq6RcAQew4ohfUeN3d3P1yOQ4/5AMd+DfFz2WjnrD3fyZnvGOi
         cW/C8oF4PU6vxzE+IbYTCSRDoZDTqhSGihiU/A0I1uulq48uY2cobbiIE4FAm+xnlX52
         KIs2361K8BmnDszo4XBVG/SClc50+eW9UFPd8uD7WsQXFGKRaUA51UeXtAyrzEmn55Ie
         2/5G/3Wo2xpv6kk36d+vkI99omhDPM0Bp6BpLSsb/M6BNEB73Ro0tSTIlJD4O/4nfwWN
         rl10oP9H3KfenBO1mywRNL6A6EQekYN2ies/j0TxBZcww69BbUjWWWbevmI74rr6lZzO
         7Xyg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ik2FkX9tyF7YUlBc10Kc/w55CTJpNgdFsE3kP6lEO8msGse0V3KPW2YxKiXu5pUnxiM4Ynng=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3IRhBCKse/QV01pYmDM+hwV32ApCqYflhcCraruX49XCYObTw
	+elaIE/30uYcCAkLSyYDE9h3H63ZdqX/Qxm9LwR6kyWyIBNMCQ0rVGB4j2/szBwcGltui1gEdz1
	ciWfJV6s+wxJbtiSMwfWYEYlHabAl6Rx87a9YHcZ/izvB9PZj5hDOkKkIB4sTwyYo0bihj4fw
X-Gm-Gg: Acq92OEO6rad/h0BXKuMdDn+hbZZiJB6TczItbynR9url8M9UriWXmSh9KNzFMOm+XM
	dwhiV4+vw+ynqZo0TYRIsT+tiBDz9xjM0KCcq5PQfjny1soYtE7WZTFRCHmexrjyfoUoUJ/s1cy
	A5rgN7cpPaVlDDc8NHwS8COvCrFKIjEZ4TH2gfuBaOrWhLYnaJb9EKQyRmL2syM8Ta0G2BJcadl
	6Y0YUS8FudIuTlkQHNi6ll+UxMD9uKBSaudZ+OR9hkhWyuVv5EPjH3OT3eAheMUwhEteQDP9igB
	MO0upCJ+Qbgp5w2DchwQGYp3b+BkmlV0Ku56SLOmhAI0meHWueMc+D9rsDWNBqfiOjRsBNfkWVB
	z6XOcjx/hhmNt/kDhmGxZ3kgCby7WPhiKSDG+XWh4dwzAkq5RdV3ZCQb9SrEr67xSHLKDaUdfcn
	ZCQfECkGGnRRo=
X-Received: by 2002:a05:7301:100a:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-3077b5eab1emr7149999eec.23.1780924917231;
        Mon, 08 Jun 2026 06:21:57 -0700 (PDT)
X-Received: by 2002:a05:7301:100a:b0:2c5:b972:b436 with SMTP id 5a478bee46e88-3077b5eab1emr7149967eec.23.1780924916510;
        Mon, 08 Jun 2026 06:21:56 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm21607280eec.13.2026.06.08.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:21:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:21:34 -0700
Subject: [PATCH ath-next v2 3/4] wifi: ath10k: Update Qualcomm copyrights
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v2-3-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: MzoVO1dlsGRjTHBFk8EqtEBU5DRy_CLV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfX/W5sXscVQQV5
 DUzgAMGdp00kIKp0dXHZMqXs4Qlwt8/x8KJ+LnfHtwq3El0Tr+74cGEPNaH2SBDty7NOY0wGuOH
 uyBio0uh8QQJOQ4uAYrOjZbM5C++IsAg+BSMT0DGau41s72q2qgBpQEF9X3VOQv9XcJtSJI8okf
 9HcN7ldZLka1CKsg4aI6U27B2BVwEtWHHuO6xyCVqRNbuC6oxZOSAB9eu9FUwYfRLb3DkmFUYfI
 nKAzbHehmA/3w9nqyb4ZAam/PBEMSJxFKbpyGR9Kl+Dqkbyt00r44SHanumZp5on+F+Qn+IqJ+u
 pONeF7dF/S4/ONbkMKoh23mU7ek2t+AhbDEdT62jSS+VNy7L5xWgOn5o56rSfquAIoOkqjsn/Uz
 aHaPI2u6oCoXpsp72i38C+UZWJFY8UZ1W8ls6Xqrz8VblxnjeurtnjyrbvwM6UeHkjJS1oYmSct
 IzR06Yvglvk/sEYk8rQ==
X-Authority-Analysis: v=2.4 cv=XKAAjwhE c=1 sm=1 tr=0 ts=6a26c1f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=eysLYOW-m-FfG_z2xPkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: MzoVO1dlsGRjTHBFk8EqtEBU5DRy_CLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062159_581159_B09DD5DB 
X-CRM114-Status: GOOD (  12.08  )
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
 drivers/net/wireless/ath/ath10k/bmi.c          | 1 -
 drivers/net/wireless/ath/ath10k/ce.c           | 1 -
 drivers/net/wireless/ath/ath10k/coredump.c     | 1 -
 drivers/net/wireless/ath/ath10k/coredump.h     | 2 +-
 drivers/net/wireless/ath/ath10k/debug.c        | 1 -
 drivers/net/wireless/ath/ath10k/debugfs_sta.c  | 1 -
 drivers/net/wireless/ath/ath10k/htc.c          | 1 -
 drivers/net/wireless/ath/ath10k/htt.c          | 2 +-
 drivers/net/wireless/ath/ath10k/htt.h          | 2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c       | 1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c       | 1 -
 drivers/net/wireless/ath/ath10k/hw.c           | 2 +-
 drivers/net/wireless/ath/ath10k/hw.h           | 2 +-
 drivers/net/wireless/ath/ath10k/pci.c          | 1 -
 drivers/net/wireless/ath/ath10k/pci.h          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 2 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h      | 2 +-
 drivers/net/wireless/ath/ath10k/sdio.c         | 2 +-
 drivers/net/wireless/ath/ath10k/thermal.c      | 2 +-
 drivers/net/wireless/ath/ath10k/usb.h          | 2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h      | 2 +-
 drivers/net/wireless/ath/ath10k/wow.c          | 2 +-
 23 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/bmi.c b/drivers/net/wireless/ath/ath10k/bmi.c
index 52118867ecde..e4c84be44ba6 100644
--- a/drivers/net/wireless/ath/ath10k/bmi.c
+++ b/drivers/net/wireless/ath/ath10k/bmi.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2014,2016-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index a9cbe955e084..5a796e704ae9 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.c b/drivers/net/wireless/ath/ath10k/coredump.c
index 50d0c4213ecf..7fdc06fff79f 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.c
+++ b/drivers/net/wireless/ath/ath10k/coredump.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
index 8d274e0f374b..95ee70d23370 100644
--- a/drivers/net/wireless/ath/ath10k/coredump.h
+++ b/drivers/net/wireless/ath/ath10k/coredump.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _COREDUMP_H_
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index b7520220465a..fb61e53ff4c3 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index b9fb192e0b48..7f7be7c69232 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2014-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index ce9b248c12dc..821a12090ba9 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index dbaf262cd7c1..1c2e137b6002 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/slab.h>
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 603f6de62b0a..25c6b2e2f81c 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _HTT_H_
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 25ab945fecef..faac359aa9ac 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 29e99fbf36fd..e46f579d745d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 59b6cebfdd8f..6f5019bf0b7d 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2014-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/types.h>
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index da71dce9babf..cd468b24bd33 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _HW_H_
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 97b49bf4ad80..335bc7c488e4 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 4c3f536f2ea1..d114778edb41 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _PCI_H_
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
index 0e85c75d2278..279aeb2a7dbc 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/soc/qcom/qmi.h>
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 88d58f78989d..8d4b929e8437 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: ISC */
 /*
  * Copyright (c) 2018 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef WCN3990_QMI_SVC_V01_H
diff --git a/drivers/net/wireless/ath/ath10k/rx_desc.h b/drivers/net/wireless/ath/ath10k/rx_desc.h
index 564293df1e9a..e6d92a29d2a0 100644
--- a/drivers/net/wireless/ath/ath10k/rx_desc.h
+++ b/drivers/net/wireless/ath/ath10k/rx_desc.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _RX_DESC_H_
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 43a6b1ba8fb8..65e941b52751 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2004-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2012,2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2016-2017 Erik Stromdahl <erik.stromdahl@gmail.com>
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/module.h>
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 8b15ec07b107..9bb486f8e920 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: ISC
 /*
  * Copyright (c) 2014-2015 Qualcomm Atheros, Inc.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/device.h>
diff --git a/drivers/net/wireless/ath/ath10k/usb.h b/drivers/net/wireless/ath/ath10k/usb.h
index 7e4cfbb673c9..517afbd73764 100644
--- a/drivers/net/wireless/ath/ath10k/usb.h
+++ b/drivers/net/wireless/ath/ath10k/usb.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2004-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2012 Qualcomm Atheros, Inc.
  * Copyright (c) 2016-2017 Erik Stromdahl <erik.stromdahl@gmail.com>
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #ifndef _USB_H_
diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
index 8a2f87d0a3a3..ea18ed8939db 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
@@ -3,7 +3,7 @@
  * Copyright (c) 2005-2011 Atheros Communications Inc.
  * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #ifndef _WMI_TLV_H
 #define _WMI_TLV_H
diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
index 78653f257925..92af8bc63362 100644
--- a/drivers/net/wireless/ath/ath10k/wow.c
+++ b/drivers/net/wireless/ath/ath10k/wow.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2015-2017 Qualcomm Atheros, Inc.
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include "mac.h"

-- 
2.43.0


