Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F830CCD183
	for <ath11k@archiver.kernel.org>; Fri, 17 Oct 2025 01:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XYpuQ1JyyKMbADlZznx3xZ+aiP62NyD/ZiYuDoLwtI=; b=SqkMQEZtOt1Ut9aRYK2MU7gCyU
	QQSZPKmS4JAdoc+RSJ1N6hc+7I7Zu/1IPGaBkyo8OF66Aoqxrx/v95RlfBn0aKuLaGeg4W/JIrx8x
	Es/0SVp9yUyshCPQ00U084NIxRXAC3u5HQeIL0AAr0wDwCg3PPmXQ3Kids3Sek07RrCj5ad4oRdNf
	msIXcnIJGil5JQ0OZcwBh+azoji6T5QXtnvMQIGnh/TjONMRkr+xSO0Z4S96AsMPDyaI+A8KpFVf9
	/2cWINLIymzVUoMg3CcWAcxWHhMkNjp108KNQPRbJ2OyYstFV8vHyZTGADEVJ0elqUuttSraFWQZH
	5Yh3EasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Zat-00000006MNW-2ON6;
	Fri, 17 Oct 2025 01:49:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Zar-00000006MMT-32fi
	for ath11k@lists.infradead.org;
	Fri, 17 Oct 2025 01:49:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLOBL025226
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 01:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/XYpuQ1JyyKMbADlZznx3xZ+aiP62NyD/ZiYuDoLwtI=; b=JZL4V6P+71iR2ups
	tjyL3CUCinCOCBDv6uchptYcWQo+XB3Rf9DlFYSkp6lsvGBYLMIahz5gtpArrXQ4
	51Nep1IzQZ6yBxbacRGNY9KaFd23mMlmV3nyGKZI1hb1YZTHs9zgK5SjVabOoroN
	oJSWp+ZHfph+RwPSTdLXpRiyBPpOMEbbhazHnDf5JkCfGV3nZW0KAdwSddKNhFTU
	nGvIrKaB0nqFk35uFgH0BsMrJS6KGRmBFy0ofpdyRrovwhfigiCykSXIxjCG4qs4
	Vt5NfMj1umBQ81TuZMFHWv05MYjrSLYhGPEWXNFM2H/rD5Q3XXpXbwhK0Bpmcv5m
	SXtUMA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkjds2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Oct 2025 01:49:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-781253de15aso3060234b3a.2
        for <ath11k@lists.infradead.org>; Thu, 16 Oct 2025 18:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760665759; x=1761270559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XYpuQ1JyyKMbADlZznx3xZ+aiP62NyD/ZiYuDoLwtI=;
        b=HBrqDS6hMQXxbQEZVtJeURb6vjMNHeTpFlaA4oVV2mApNLSbqAaRMRI9MVMhy+GSv5
         HT0pEmJ5C7E9UN/bs4Mi9dddjBSbDOeTZv7Acf2zOFltjiqbxHhJRm4buABPalB2Jgit
         40q4+BYRq5MIwX9ojSAcMr76TxFIb5jd89WaHc5UpCcnosiJyPwjk9uH01CRczeT5zKS
         BbVKZjhkYnssSFe9N7UJOQX8JPIHdwDpT5CseulAIWieN9F2Qt2k4M+QYHql1xtFGvyd
         0HwZxvPETw5iyVFx2CMWl50ERWlSB3t4JuH/oI8TKQEMvbzqv46qc3Sq8DkN69e8monO
         MmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBmVFkRtDW8ZKmU6EG78Nt5cnDdc61fVOU4alatVNjgAMkuTBUJ93J/irZomK70DJsEmcDtvg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEvhKGf9GPEBFMihgSytSivw6OFkQ61sZI2ibq3Dxa3X90jXm7
	+xHGjtY46/NBgVK+GQQpd4DKDY5sJD0ZWYpBEMLo1rqIst4CBmLFiaqZBNrXaaWwRGXI3Y09mae
	oXvxW6jQjES774qPWUTZw9txUdedOX1nFnlABZ3WiH94CKvop0+F69lE94V1zufjL
X-Gm-Gg: ASbGnctZTqsgDw2xwl1nY6oiRwn9diC35E98zHJDlHxxyDxwVRJJTp/5EVkrNqmd5Md
	d3gz8IeZ2Yoo9Yc8iiN8VCcSg0eB4w+T5yHYuz05Cts94uHCEvoyblwSW4wyRnP+DGgjBNCkjWZ
	wL2uYXw1uCdnWgLzwkOt9U7dl5d06NJQoWeXuUwXwZpGbKSUP5LOWyEa8ej5z7vH6f0Tw8z+GYi
	6aDRQiQWbF0Y2rvl11wFnaHOAKTMWH/65H2Uq4G0RfiDLJfktsewJMb2cjp35WM+9P1ep9fYEy3
	3oF7AaagT3tovBJcv3I3y7IJ5v02Z+mdex6TbXOQT1oLXnpf/1GZrrFSndmqnKuvEg+DMBqSLsx
	qGxQUI97wzb1FWbr2VO3m2QOb+6iDdx6GcPwRSs8kK/w4JokpWW9D
X-Received: by 2002:a05:6a20:72a4:b0:2f9:48ac:c8ed with SMTP id adf61e73a8af0-334a8534251mr2473338637.1.1760665759095;
        Thu, 16 Oct 2025 18:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSzREb57ve0N4OIyy8PIY7kbejAbHE5mVGSJSmEG4tBw33N64kIgs+Iph5yhu2Sgh1O4SsVw==
X-Received: by 2002:a05:6a20:72a4:b0:2f9:48ac:c8ed with SMTP id adf61e73a8af0-334a8534251mr2473304637.1.1760665758634;
        Thu, 16 Oct 2025 18:49:18 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bbe7a0sm4181475a12.38.2025.10.16.18.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 18:49:18 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 09:48:59 +0800
Subject: [PATCH ath-next 1/2] wifi: ath11k: fix VHT MCS assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-ath11k-mcs-assignment-v1-1-da40825c1783@oss.qualcomm.com>
References: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
In-Reply-To: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 5VfDvUdCK0CjQEjicQ4bnmnf7cIi_CXc
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68f1a0a0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=W8IGfRwF5v3UHo10cv0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 5VfDvUdCK0CjQEjicQ4bnmnf7cIi_CXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2YJWj1JW3Y/G
 5AMcDW+uatKaPykSSREWeAW1Ph8KnIsBRC64FDji2jCs34k7WyJY/mB/NAl0/QceIFL/T7hQXIk
 4Ly4nN1ME3CHMsil4V9+gyGo5MF8anReB0kcIRUfnhDHbzIlmX+bXSp4jfY4P8TVuowStH3MRpN
 +hfe8SiwwnBELDyQh4LkDSDAKq51Fy+BcsD4Dd3dTWKGN4BMfUbaKkUwCf8SR16JVbTS3PVPVtx
 tULWDLr2tku794VIWAg8SWa7YEevTsRzYrzwVbGedHoSCsExozzlDbe723C9hmWqyyhQoEf2ixS
 zVZ0cJQWPsFdsWF85F38BFISE9LIhaI9qqdVbVXKn5tCSbyouCOWxOztY1ptEHw/BA+oeN1mNxq
 dCSKplx2xXvww7W3lZs/LWXo+qGRwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_184921_892026_096F3B1A 
X-CRM114-Status: GOOD (  15.70  )
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

While associating, firmware needs to know peer's receive capability to
calculate its own VHT transmit MCS, currently host sends this information
to firmware via mcs->rx_mcs_set field, this is wrong as firmware actually
takes it from mcs->tx_mcs_set field. Till now there is no failure seen
due to this, most likely because almost all peers are advertising the
same capability for both transmit and receive. Swap the assignment to
fix it.

Besides, rate control mask is meant to limit our own transmit MCS, hence
need to go via mcs->tx_mcs_set field. With the aforementioned swapping
done, change is needed as well to apply it to the peer's receive
capability rather than transmit capability.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mac.c |  4 ++--
 drivers/net/wireless/ath/ath11k/wmi.c | 13 ++++++++-----
 drivers/net/wireless/ath/ath11k/wmi.h |  2 ++
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 0e41b5a91d66da872c2520a95c3d4af379a504da..49c639d73d58d46f869aec40f6439268526ea1bb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2235,9 +2235,9 @@ static void ath11k_peer_assoc_h_vht(struct ath11k *ar,
 	arg->peer_nss = min(sta->deflink.rx_nss, max_nss);
 	arg->rx_max_rate = __le16_to_cpu(vht_cap->vht_mcs.rx_highest);
 	arg->rx_mcs_set = __le16_to_cpu(vht_cap->vht_mcs.rx_mcs_map);
+	arg->rx_mcs_set = ath11k_peer_assoc_h_vht_limit(arg->rx_mcs_set, vht_mcs_mask);
 	arg->tx_max_rate = __le16_to_cpu(vht_cap->vht_mcs.tx_highest);
-	arg->tx_mcs_set = ath11k_peer_assoc_h_vht_limit(
-		__le16_to_cpu(vht_cap->vht_mcs.tx_mcs_map), vht_mcs_mask);
+	arg->tx_mcs_set = __le16_to_cpu(vht_cap->vht_mcs.tx_mcs_map);
 
 	/* In IPQ8074 platform, VHT mcs rate 10 and 11 is enabled by default.
 	 * VHT mcs rate 10 and 11 is not supported in 11ac standard.
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 0491e3fd6b5e16d464bd3e3c3933b9102641204b..942dfeb8b1af8553d1c872ac1444bfacf11f44cd 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/skbuff.h>
 #include <linux/ctype.h>
@@ -2061,10 +2061,13 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 	cmd->peer_bw_rxnss_override |= param->peer_bw_rxnss_override;
 
 	if (param->vht_capable) {
-		mcs->rx_max_rate = param->rx_max_rate;
-		mcs->rx_mcs_set = param->rx_mcs_set;
-		mcs->tx_max_rate = param->tx_max_rate;
-		mcs->tx_mcs_set = param->tx_mcs_set;
+		/* firmware interprets mcs->tx_mcs_set field as peer's
+		 * RX capability
+		 */
+		mcs->tx_max_rate = param->rx_max_rate;
+		mcs->tx_mcs_set = param->rx_mcs_set;
+		mcs->rx_max_rate = param->tx_max_rate;
+		mcs->rx_mcs_set = param->tx_mcs_set;
 	}
 
 	/* HE Rates */
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 3c4885a12855ba87dd815b44c71d619612596d5e..0f0de24a384089c1d36722a115aa007c042916c2 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -4119,8 +4119,10 @@ struct wmi_rate_set {
 struct wmi_vht_rate_set {
 	u32 tlv_header;
 	u32 rx_max_rate;
+	/* MCS at which the peer can transmit */
 	u32 rx_mcs_set;
 	u32 tx_max_rate;
+	/* MCS at which the peer can receive */
 	u32 tx_mcs_set;
 	u32 tx_max_mcs_nss;
 } __packed;

-- 
2.25.1


