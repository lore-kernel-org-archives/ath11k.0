Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D71A1075262
	for <ath11k@archiver.kernel.org>; Thu, 19 Mar 2026 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kDL4GcIf7vkqMUVqyyXog+v/pbycVtTqd3kv4sU5Zg4=; b=ikTe2fme63AjDXlgTERaMGkcg9
	oGI/qIYYVSbxHPSORZUiv3h1TFvI4nVD7W5jcXuQMI1VZ/S/PQaswmjioUbbg0KR2LUvGWVuVAH8H
	55U41iUpBVsFLpp4P0sFapyoRXczC/y5usmkROUSOkQ1B0KiHgOULI43QxUWgVO2tZcPo7d/0SQT+
	1Defnw+GO5S1g8Hs6jmvzkCBae3DC1DALWAixuC7GtEa/VDHJv27iScL/itPsu92uj9lozciaUQeh
	Jafp9SLulwXs7OWjiz7ArL5KzyNpRK+pITfWA0qYtg0tx81a79qih30wrQDK8wDE7Q3gvLjA4nSPK
	EQulyk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37Ir-0000000A4db-2kbv;
	Thu, 19 Mar 2026 06:56:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w37Io-0000000A4dF-3nZB
	for ath11k@lists.infradead.org;
	Thu, 19 Mar 2026 06:56:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XhFE3172445
	for <ath11k@lists.infradead.org>; Thu, 19 Mar 2026 06:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kDL4GcIf7vkqMUVqyyXog+v/pbycVtTqd3k
	v4sU5Zg4=; b=FMW02PfwyAZSj+X9IA9gdAqsRCeenSU7BewnFtYPzkls4x+37dc
	BXQlmuo9v8UEZMsaACXft0Jyp1OBeeoKjR9yA+nIjp+Ex1t7+R9IbxdaaEpSrwGs
	NoK34rtCKCdxkZ+p8zjNkh0b+W+oaSTEI5Ofoi0KtRqD5Qpbpnp+RI5Z2HB9QX/1
	y552boR/B1Ee6+pC6Yjxl/o81qeD7zLB3RcZvxil2vGFU6uI1bRvE43nGft4NzBy
	bqwlMGP2W3Ca8iY5Ifob7hFei98PBqgRyvid2Nio1HO/Ri2EN/JM8UQCWACA0q+C
	6QNXoiYd7m78VwJp5vMrRYkZ3PKKI5cvEiA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9j3wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Mar 2026 06:56:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354490889b6so2252436a91.3
        for <ath11k@lists.infradead.org>; Wed, 18 Mar 2026 23:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773903376; x=1774508176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDL4GcIf7vkqMUVqyyXog+v/pbycVtTqd3kv4sU5Zg4=;
        b=aopL+iEcgEsHmDZSwQby/u8BfVCFkTYLhDHWDtBFqIT9kw17FmFyEtfnIzsaMPExSR
         7HoQoY7iKYLAsmd5SGPcqHscGHaSh1mICNooi4EsSeA+uZLGWJUZb9PU6nNlMZj8mIZL
         euSs+1OI+0oFDBA6WdNNXr3PDbWjyl3kNaR9kWfV+I5gMZv01Vsxv1Iw0hBQtxeQbr78
         q1o95g8Ry+NCPeNgBEj0CJOMUgGZC3wL6Sy/Rd08DQQzQMmnaGYqOLg66OU0EpwKWHUy
         v+l/BZSPF1Ejq3y8pEDCMC9zVkvuEfkVcTKY3Be1257asXpQz+lJpp1G0JWaXUXKau6i
         geJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773903376; x=1774508176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDL4GcIf7vkqMUVqyyXog+v/pbycVtTqd3kv4sU5Zg4=;
        b=GtyViSRiLOz5DCTUPqR9docNXI5oEo4/fzbCt7P6J2men8MLJj+c319ElHLwGO1fSp
         RZfL+Q5FMp9aQnW3L+ReeNYp+Km81a+dZUVSRbyLlDMifBvD/9rjqlq3cs6dwcLgCEPN
         7N54gHtQwqGODcIAbCSTcG5LFBNm2rMChUr4Okh2u3zzDJAk2acpOBxzY3oG3XUf/eON
         E/f9JfGhrLjw2QMfgrTS2DsfStsV2PzRPyUHU1PzgJWbx0jAnYhtZwMJYyH/XiwLOfrA
         uBgOJTk34CBUdKkdzs5ee0NmERnRGBdsmCAQJwNlEijuytww0MbVqNUgmRaLzhP65sEU
         dtZg==
X-Gm-Message-State: AOJu0YyQfeYAsJvdAxn8P9gVz3NTnm5vB4qEW0W8ducx3vCLJnGmVId7
	bGTT2mytTtaybAFfRp8SfSPPZiH2jYCdI19lo1gnfiA2jtdZZqZZ3Jpd35/rcYk4YPCPlCVYWJd
	g79V5KxWXsoYQ3coPK9iQB+3YRRqOfyHxb64yvdLRBJ0UDxnQmiH/7psxXwCDftAGC+hvxl1d
X-Gm-Gg: ATEYQzxPH8X+SOFyzyDDPPTKckwZAdHUHye+I9DMpU0zRqh+N677B4HLL5cnqxxiHH6
	8e3UgqZTXgeuy77sua14McTGEEjc7+sIHe8OO9RPEXs/Zh8NWD7PKs+quf1hpQmd5ExHw4nebVL
	OqBSRBZpUnR26l6Mg6G+TPhgalduDL7TUPxIDd2Lzhhpe5uJ598H0r7BeIiWW/K7QIzeESOIFBJ
	7a0udVYYit/2ioOExJGzkoXOQg3bsda4241CXRj0R+ZeLvcxjNTT8vK6K/ARyOGa3JumgcR38xN
	6/wHrCnDYAr4B5i5bbZFAlBcmatBVIlyNZ31ZtSArKXG/2KCzxPg/PAik/4fsCg9NRSFOIdW4Qz
	wz4mR5fkt0FmInBxKxhGPKIAx+j4uMw+TozVfVgTXvY6TxNIwZC9qk/o2+xiSu/pnvSyKsUCBsN
	cOOAw/I8F3hDabKjuo+P0Nb1do5U+IHP7BCfhdvPsME9QtbA==
X-Received: by 2002:a05:6a20:d504:b0:398:7a23:2779 with SMTP id adf61e73a8af0-39b99ff5f44mr5798910637.52.1773903376233;
        Wed, 18 Mar 2026 23:56:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:d504:b0:398:7a23:2779 with SMTP id adf61e73a8af0-39b99ff5f44mr5798883637.52.1773903375660;
        Wed, 18 Mar 2026 23:56:15 -0700 (PDT)
Received: from hu-rrajkuma-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e583626sm4223557a12.30.2026.03.18.23.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:56:15 -0700 (PDT)
From: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Subject: [PATCH ath-next v3] wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
Date: Thu, 19 Mar 2026 12:26:08 +0530
Message-Id: <20260319065608.2408179-1-reshma.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA1MyBTYWx0ZWRfX/N5svvy8TpBc
 EOeHITPC+fSLx+bAqqYAAEGTn5ZVvR7ZYXpSTkr1vbbRX9zA6+ly1BOO42yzcsre7WnshBHpuAh
 KHwzQ9Pz3bm2JSMCjeFmXycA4fzpHr38BP69yLT7wsC+pvYDO4KIyeb8dBA6EVoSXu3JxPW6YbO
 1mKcRC1cCG/EzOVjjsDvALDgyEwd+c/89AQUUNsrpXG0BnxfIAK7Gq09nCviMV9wqIUibQgduEp
 8kMWypuJeFQWAkDWF9JI5NXue4u6NIWtXbp0wOhIojwPmAEvgUsF3Rntpy15YtQW1YVMlFO9hJJ
 LW7sAHb8AV4THdgNpTe6DnlVXjlB/IbOAuJaPp71ruSW1jMXEgPygVnYlQnytzQ5xuIyArJI5h/
 CPkhp+evukl2/gL/iHX2YlyeK1BLKaCCKV3108yPtIZSe2xQvUVBb7Vce5aI0Fpse2vhUpvAJ0n
 pO3XjCcwXsxYLJRPAHg==
X-Proofpoint-GUID: oiydRFLrUqxp6yuIPNJwY9QAlG06h5r4
X-Proofpoint-ORIG-GUID: oiydRFLrUqxp6yuIPNJwY9QAlG06h5r4
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bb9e11 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vkfXM0Oplov9zySb:21 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JY0uwkuL_i1N_za9zYAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_235619_093031_EDEC473D 
X-CRM114-Status: GOOD (  15.58  )
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
v3:
* Removed QUIC copyright information
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 49d959b2e148..85defe11750d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/ieee80211.h>
@@ -1110,9 +1110,8 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 	struct ath11k_base *ab = ar->ab;
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta = ath11k_sta_to_arsta(params->sta);
+	struct dp_rx_tid *rx_tid;
 	int vdev_id = arsta->arvif->vdev_id;
-	dma_addr_t paddr;
-	bool active;
 	int ret;
 
 	spin_lock_bh(&ab->base_lock);
@@ -1124,15 +1123,14 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
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
@@ -1141,7 +1139,8 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
 	}
 
 	ret = ath11k_wmi_peer_rx_reorder_queue_setup(ar, vdev_id,
-						     params->sta->addr, paddr,
+						     params->sta->addr,
+						     rx_tid->paddr,
 						     params->tid, 1, 1);
 	if (ret)
 		ath11k_warn(ab, "failed to send wmi to delete rx tid %d\n",

base-commit: 7bbb578fc43e7dcb8690cfc98844bd67bc311e8a
-- 
2.34.1


