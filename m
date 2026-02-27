Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAD8FD5327
	for <ath11k@archiver.kernel.org>; Fri, 27 Feb 2026 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yS7Bze/a8ti6qyXbRJ/3YyCXLij4Qdq3uWU03KmRiOE=; b=IA0hvE9Ivi4UrgHKFVnbpOg6VZ
	9JGEMDWi1NdH60nucR01MKp1/nqnN8aVgJFhom62B/LLwgBlljWGdy5ALWmjVG0xqmktIygfzIQDx
	RBzuzFNYl1k55ykuCBoJd//8ej/egNTiUjpJzS6Jtwzz6+fpNxIK5nXyL8GtY6UDQX5AYL5xe32g6
	5Y+xFs6Y+zV7nVvxs9hBocmZrFQqmCUtcNlwAz1UbRMbZYnAD0uG03hsDwpvpXynVpPP5+krM71Lt
	sxjfFydiis/+GAAdkCwe9z93+r5isTfCvpGjT5jiz/s6oLhw1enQVXSLIJeRGHCHi7APWiCemnJ5z
	kdhoGgDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvua3-00000008CF3-3mGQ;
	Fri, 27 Feb 2026 09:56:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvua1-00000008CEh-1lev
	for ath11k@lists.infradead.org;
	Fri, 27 Feb 2026 09:56:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K8iL1600923
	for <ath11k@lists.infradead.org>; Fri, 27 Feb 2026 09:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yS7Bze/a8ti6qyXbRJ/3YyCXLij4Qdq3uWU
	03KmRiOE=; b=OzzvFA6nvHYDxWAXRsjrFwEz6qdp9Xiwd2DXBWp3bstx6GUP3kX
	BXiBiaZbxW22I0Qdy9AIfiuhwgiZfOztESjD4Du8ZP1mWznGzZM7qja4CkYWLWDX
	A7LuyYOockXxwIixl12JxKoclMX/5Gegvm3ojkmPQmpvC3iOI7FyCNmnCWs27BO1
	ebTwuvUh1Ew9vHn5RN67o6tfR4OnTUxJ+FLY9GvmFlG5BI0TwM9G2J213ptaDDzt
	GFGwLGkfaAUtF5sWrTXNbbe8eCd1PMivXm6etXOTJIw5W+WuAV+U8sluFRPINLQq
	5rECrUO/6Preh/b7C1xr/f1RHInakEGq3VA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99u3ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 27 Feb 2026 09:56:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adb1bdf778so18976955ad.3
        for <ath11k@lists.infradead.org>; Fri, 27 Feb 2026 01:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772186175; x=1772790975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yS7Bze/a8ti6qyXbRJ/3YyCXLij4Qdq3uWU03KmRiOE=;
        b=j0mp8IEHIIZkdm4AbU2e0mZbsIKxd2G3wT8dZi368iDDWplofiWXGqh6vvcttDkotu
         qFJ6jyz3sEClTwsE9D1re+nuRKyLhH7MsG6YvN4SSIJ77ZNntyqJfsturN3ovOBZEIiQ
         S+atMWPqD2QwCkpPuhULlqkFQ89UZ4nCHkWWKe02mexD2Hs9CJTpYvPxVjLOxNfqu+WJ
         yu8+AEvNW/n8y0qXmkwPTaV2EdwFTZUhF30GGIWW/rUt/o+cZVomlo5C7msseHqWRZI3
         lXA1c9eKog64BxXEgRUEy6eLL/jKuuk8ysHPtufpXDVr2tG0C7up4/5hXCUulCxq0PrO
         BQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772186175; x=1772790975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS7Bze/a8ti6qyXbRJ/3YyCXLij4Qdq3uWU03KmRiOE=;
        b=JF+9/ioQpRF+BBqHhlq9p6XVJuIFTetBn9rdBAqQL8FIT3Kk/jMneWNgcTYEgAbh0F
         X7ds6NXfesPnFhtdmxWFaLz/yyCRrK5JZp5algHIz4kYjQd71lwrcqUfClxV2+ydh1kX
         ySmOdvVsc+GkSirGoA9hZxilbtI3Nym9LeYjSudg3mOIswWwamB9szMqtd0bSemiaXuw
         VWpEqe5dNfoDtc4PAKj4Tlq8ms6Oa3EQ+AOmlMZtxNpNEQMc4kRv9lo+gKKV0M+b9Drd
         dEm0vdc48fzt9JgoGAIsHVkTYFYHKlKGaAQOYGgSvMbuZYdLnPCWbhhNxkeNL3ejAHbe
         RLbQ==
X-Gm-Message-State: AOJu0YwlUCqWU/53o0rQKBtATZ9azIJJJTXGRgayn9uM+KPKBdGCpg2F
	yjqJChefYCQ/4+GzbrsQtMpP7fPy3VcWJRB2swSrkFzSW3J2YlC3uNELLc3x454pcluaUP4PGUf
	QGE1pguFog6lIfWMAiDrdckCB5j/k8RfYFaq0mnvaucTq1RXwrbcvtSNHEmPlT5ojpzSDA3sj
X-Gm-Gg: ATEYQzwOFTbk+AKMNVxTl1EUPcmsC5OPDApk93996C5DISBhOVRHbIo7Iu0Qb0AnCAB
	Svl6cTX6P4WztpzRJz7pUzY3xhZCqDVtbUSE3J8/8nv/qXTsN+TqmK9Kz1fEYoLtR0SKpcq1fvs
	1YJF7vULqgQW+MCxfEuDsiZEOQB2WxTIDvHKFnZ9dK1+ANH6x9yoYwPphlaOeVUUWx7AA7OI47W
	y5qrz8ndbPvwd6JSqyJGIrV7JbH1EUbq+f1lrMoPtK/qZxwgfg8ls5ws4D7zQ4MhCLbsTBzXrLK
	PJMTkRQ/U9QP+8+6rWIo+EQNl3LCGhB3qqXQWP1RMm5iIp/fjG9uG79ZIZDP3p4scSjkiWVGWJu
	BVTE/aqqgqO/n9eq2WUeIFwHwKDfU8yv6Ne57UHRwZuhvj68ipjaQz4+CU3jLwnh1f4v3Gc9LgZ
	Q3SkRdyfvPDY2QWe30l2PW086ZHR/iaMQPJEH2C0onqy546g==
X-Received: by 2002:a17:902:e547:b0:2a7:9ded:9b46 with SMTP id d9443c01a7336-2ae2e40a1e7mr20682875ad.17.1772186175202;
        Fri, 27 Feb 2026 01:56:15 -0800 (PST)
X-Received: by 2002:a17:902:e547:b0:2a7:9ded:9b46 with SMTP id d9443c01a7336-2ae2e40a1e7mr20682745ad.17.1772186174751;
        Fri, 27 Feb 2026 01:56:14 -0800 (PST)
Received: from hu-rrajkuma-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6f2495sm74271645ad.85.2026.02.27.01.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:56:14 -0800 (PST)
From: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
Date: Fri, 27 Feb 2026 15:26:09 +0530
Message-Id: <20260227095609.3691546-1-reshma.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a16a3f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vkfXM0Oplov9zySb:21 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_mytDIUbvz_f-yg6au4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hnGdAP-asue60bGoTaBR3tSTTG9RcFVe
X-Proofpoint-ORIG-GUID: hnGdAP-asue60bGoTaBR3tSTTG9RcFVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA4NSBTYWx0ZWRfX8fuJe9yyXVYv
 QqHM5Fkad3iICG8eahyxa+Bp12vNmCxCp8TQLSYPexAXZVjP9FpR3MeHD6E1WgZmYhLpzs60nxe
 2XlBiKas88nkPOaRCo2jw3Q89TCgYb1Q/iBwQpDI70vcdFO/O/Y1ezzCmoswKWl0FQobBXkFs+n
 TCq8Vs4gqMb/g3LNRcpYVtOa0w0OL4RErYAsUjQ/Y/lE1X2f6qYmcqw2VPaoIoh6V4lSV3G6gxM
 73HetCnWvmxQAFxYqSVVhWUySmYBRZ+tDTgkDblA/nA7j+O2yRyu/MaCIinzjPfOpy2nQxHx4wz
 gYmvz1MOtBs+1p9qPK0hdavA2ESZ3auHNsVZ0aBLiWhW9u5+r3X9pp6xtZCJzigM8odrg+iQoFD
 7HRWKYxBw0sBaAgHcUHJ+SN5bNEPBNF6jbemNP4kWjNOjuu16jCcbZSwapMeR+/od82q477X7Zn
 /3+lhlOtaXNUitA54iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015617_483999_8CBB40D7 
X-CRM114-Status: GOOD (  15.05  )
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

During ongoing traffic, a request to stop an AMPDU session
for one TID could incorrectly affect other active sessions.
This can happen because an incorrect TID reference would be
passed when updating the BA session state, causing the wrong
session to be stopped. As a result, the affected session would
be reduced to a minimal BA size, leading to a noticeable
throughput degradation.

Fix this issue by passing the correct argument from
ath11k_dp_rx_ampdu_stop() to ath11k_peer_rx_tid_reo_update()
during a stop AMPDU session. Instead of passing peer->tx_tid, which
is the base address of the array, corresponding to TID 0; pass
the value of &peer->rx_tid[params->tid], where the different TID numbers
are accounted for.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f2895 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
---
v2:
* Added QTI yearless copyright
 drivers/net/wireless/ath/ath11k/dp_rx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b9e976ddcbbf..00d27e0053b2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/ieee80211.h>
@@ -1110,9 +1111,8 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta = ath11k_sta_to_arsta(params->sta);
+	struct dp_rx_tid *rx_tid;
 	int vdev_id = arsta->arvif->vdev_id;
-	dma_addr_t paddr;
-	bool active;
 	int ret;
 
 	spin_lock_bh(&ab->base_lock);
@@ -1124,15 +1124,14 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 		return -ENOENT;
 	}
 
-	paddr = peer->rx_tid[params->tid].paddr;
-	active = peer->rx_tid[params->tid].active;
+	rx_tid = &peer->rx_tid[params->tid];
 
-	if (!active) {
+	if (!rx_tid->active) {
 		spin_unlock_bh(&ab->base_lock);
 		return 0;
 	}
 
-	ret = ath11k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, false);
+	ret = ath11k_peer_rx_tid_reo_update(ar, peer, rx_tid, 1, 0, false);
 	spin_unlock_bh(&ab->base_lock);
 	if (ret) {
 		ath11k_warn(ab, "failed to update reo for rx tid %d: %d\n",
@@ -1141,7 +1140,7 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 	}
 
 	ret = ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id,
-						     params->sta->addr, paddr,
+						     params->sta->addr, rx_tid->paddr,
 						     params->tid, 1, 1);
 	if (ret)
 		ath11k_warn(ab, "failed to send wmi to delete rx tid %d\n",

base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
-- 
2.34.1


