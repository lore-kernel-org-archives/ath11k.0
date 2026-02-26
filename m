Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E643EFD460F
	for <ath11k@archiver.kernel.org>; Thu, 26 Feb 2026 04:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yH/WB+HwVrw7jUMbWcEH4YYI0VEemO5sUaGca0nV7VQ=; b=LzFtfMvfIL/Db9ZitAv7mHByGt
	+l1rlkYq7HYJGfrTBuXV7d0l7hMiaBSJuVMesxZ3WTDts0YufL6hIIZTBLz7IICvCm4PyygmLQOU3
	5JrsNwQnhpKCEBZ5EoyqjvRJuQSEGGyQki3SIrykgpEkzSPPetdhQSBphe1XrEEuePX7MxNq124Rf
	ET3AJLmglEUHXFn+ppwwvgc2rMYd/1OfmcmkZcSU3Hl9F/OBvbZz4yn4ED2LnQtCPWUubZgCDmF/L
	Jl7vq6qutcQqT8ekidvrleMZ8rnHEnQWN0HAq7jGRS2slD7rKZmhLMM59Z6iVoO6DgbcPCN3ndJHl
	xIBJBxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvSdC-00000005Lhi-47Jb;
	Thu, 26 Feb 2026 04:05:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvSd1-00000005LhG-2mPT
	for ath11k@lists.infradead.org;
	Thu, 26 Feb 2026 04:05:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PJ4gqU2818270
	for <ath11k@lists.infradead.org>; Thu, 26 Feb 2026 04:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yH/WB+HwVrw7jUMbWcEH4YYI0VEemO5sUaG
	ca0nV7VQ=; b=RyR4JdhK88Fcpfgl7QWO8XCMAIBnuDlO00Y069sJz4NaV3+XqRl
	iCp2pVI6dvXmLaRCFKBujeSmHyX2M55sh1VNglo1lQGmoylwz0pDRDUU6UlCfcxD
	7UofE5db52qmEeXnMlql0CGGYPVkDid52gYdWV49kzdzTx5guhWpoy1uGx90awuG
	0UA4eVL9O8a6VDQhd+OFUmYwVn7GAcip6jsqK2+zu9YjAF7v/tsNsDlhBs0pYscI
	cTNQkJmgsS8tAWBwDy47RG8/PvAYISkVfT32Cves0IgNy0URWSGnnVyg9qj68pYm
	i4qEvZU6WhpkKIgwYM2Ex1d/qsNWVhccCXQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj55ssnaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 26 Feb 2026 04:05:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aaf2ce5d81so5137625ad.1
        for <ath11k@lists.infradead.org>; Wed, 25 Feb 2026 20:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772078730; x=1772683530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yH/WB+HwVrw7jUMbWcEH4YYI0VEemO5sUaGca0nV7VQ=;
        b=ZoK9Gun0pB8EC/HsekCZZaZFd17kWS3WOiL8FVz7ylyd0pSIUz0tTqrFYkNwrjgBJX
         YOVK29WxWNhXd5I6wuV1H5fw+HwxvqNWtw5Bd0MdbcZ4oZfI4UfI2jGgWvDpa9C8t+9p
         zkndITVxMH4nHLozqLkIB5iyTUTCgfT+YOXoFEqwVWYYZhNlOjszBJ0vVMYHhq8fCo8X
         9/os9P06d5agZsdWof6B6maWcINXJXIwdkwQ2WZsbDtt8NRElW18+5d4tpf0mbWdVk34
         6kREwgVzKnFpPPRZL62abF86cQwaazuYe1einwKB9p/UrtViOw6WlFQ9EmVjqwJVb+9s
         VDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772078730; x=1772683530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yH/WB+HwVrw7jUMbWcEH4YYI0VEemO5sUaGca0nV7VQ=;
        b=q+8nVZ6Co6Kbb4bpiUPrGqMEHBI7bnpZJQu7qXVOJzaHyzNDkkxO6had/umOCz2WhX
         WXqk6H9kopznlK91zbrI4ZJsAXSZ9dx7zVW23MWUUdQEK6X2MPPSIqwqmhrsDrrTfyBW
         DYJW0RF4MvegSpOJfdWAgZU2UVyekTRWHXB+vXBX0tl4LsOtBVix4Ll/BtV+cE57Kzv4
         tqNf+4fq+Og2dy/ms1KyyXvtwdrhhBn9DbA5SoXKfMbdtuxps5dHh/ldeyot0+W0ko7x
         EUX6Tounju5K0xDQ5rhKWYvJ9rvcSWidJSeldpiX1e+7UN+zDA5weaSDcnE2LOihBV3T
         9FLw==
X-Gm-Message-State: AOJu0YyrSvF2MopaODnJgMgsfJ1vVznpTCj63DoK67iDu5o+VPCNLGrG
	P1Ye3nKXF69niQYtRz/D7mwBf6rCxtWfcg22ICq5pJT+VuNFSmGbMCeXlnEZRm5U8ugAneZbTT+
	wM6pnvrQo85kOy7upeAQ9pbjTdk4TpOHeVzqlpbxV5NDk0nd6P0vLLxNBGZa4Pc7sTZ1k8y5Z
X-Gm-Gg: ATEYQzw5f7yJs1orXxztKXf9IU4jO9tTBXK8rA4LJX2J3Cm7LuSaVZ7znsAek3CmFq5
	F4EjvJ2TKIkr3TiHnRSdagmp71v+ikiyt1POikW/nsc/fZbiK7GyAlZL8Kh8ti7fiGNaR+bqAmB
	c0HsnftmxSrumQHz/JK3LyqhQNNnzCSsVXgvOaBeAUewMUa0eqtdEipVPRqiZO5f9ergCX41LGh
	JjUdCKDgm5Kj3x4fd7LyQqmvpWYzGMHux4EVnjWnColBCLH4E9MsIBoglTqCuXIiesyupwgXG4j
	jpScMNnVQaib2pQphUGuQ2PRYThyUhrBW2npFA3m6VmBcwuvMIolbSemVqy1yJfBTW3MDXWb4RN
	TcFT2ueXlWvBKMdH5Ra++C00lHZecwGZqx9GOFrgbXomwOrBc+xe1WPKdmfM0fJg5blJHyL4Wr5
	xLNNq6+2FZ4r+MszTHOKjm5d3oCl6HNKrZDfq+vOV8l3gH4Q==
X-Received: by 2002:a17:902:e5c8:b0:2ad:9a9b:e418 with SMTP id d9443c01a7336-2ade99d91cemr25645525ad.22.1772078729619;
        Wed, 25 Feb 2026 20:05:29 -0800 (PST)
X-Received: by 2002:a17:902:e5c8:b0:2ad:9a9b:e418 with SMTP id d9443c01a7336-2ade99d91cemr25645105ad.22.1772078729127;
        Wed, 25 Feb 2026 20:05:29 -0800 (PST)
Received: from hu-rrajkuma-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f9c2sm8189505ad.51.2026.02.25.20.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 20:05:28 -0800 (PST)
From: Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
Date: Thu, 26 Feb 2026 09:35:23 +0530
Message-Id: <20260226040523.1496520-1-reshma.rajkumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAzMiBTYWx0ZWRfX+EjS6MyMBIkd
 lXqkg7FuL3ysEDupacQt6uWe+JmWvIEwqnf2Ps7iAne3pbJW8i2hFQBUJhwrdya13Rz1EWD9aPU
 zTrhaRkoVS6/HsWHM17YM82u2K+PkeD02ZuORKTncEQL/i2ms+svtWCmjLcSLM/BiQuFyorJvWU
 LMBx/befkp/Tzl5cbD/vAK7BagZ29AiF5nvusE4JIRfdT24wvh3wlUhRB2ct78mjDDgAg7ZOLXh
 9G+3Bcj/UrRm5RP23V/X+AqlDCYDe2tF/maw++A3mQRyeZocnntIOD8P/JOxVF1xWxIrdVpW1NQ
 UgOXS0oabohnVLm2mYrr3M+Qd+4p1rhHBPeBSOYAdu8oOew2mBZxT9VFCCYi0HrZ26d3lV9LGTr
 gBW2f0VmY/V+lDt79bYIoOId7l3kvQPUlUKHmYXP9D7xgU5VcrplmgQLfkEpqNypJk2CfkBjSnS
 A0FDRsQQ14IEU29UfyQ==
X-Proofpoint-GUID: 3fqL8q-Rk_eftGtwe4mJQTAPsMvBlV-E
X-Authority-Analysis: v=2.4 cv=JfGxbEKV c=1 sm=1 tr=0 ts=699fc68a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vkfXM0Oplov9zySb:21 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_mytDIUbvz_f-yg6au4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3fqL8q-Rk_eftGtwe4mJQTAPsMvBlV-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_200539_525028_B20B5FB9 
X-CRM114-Status: GOOD (  13.63  )
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
 drivers/net/wireless/ath/ath11k/dp_rx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b9e976ddcbbf..d0a737995220 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
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
@@ -1141,7 +1139,7 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
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


