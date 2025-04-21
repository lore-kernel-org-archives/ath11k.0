Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F8DC369D5
	for <ath11k@archiver.kernel.org>; Mon, 21 Apr 2025 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i1hoqFNmT3gQKEQ8kWYkIq4lTJqguXCCiXvsYANyoDk=; b=UApFGfqr3Kdd7Ca9gs1Y/Y7OA4
	iHz2fMO4vPZes5c6yTl70dJ0r3BykcokDdwEQMmYFVqDoIQsAf+yKBJ8Ga2IiQmqmVcMlhq+9B+pr
	WYczJUTArAa81WZGUmSZTiaqkZ+zZn0V1OdPU1aXwtF5fqPLA1jGRyc+S5ouhh7XZ8idT1HNu82+C
	6pCZ0rYs0bHMhdCgIQa81loUd5oPaxvb5M4OaY0UYEVp09vDKjQTdQXED46KmZ+k4kgYoadC9eN4Q
	fRp2TGqcatIvVXQiVxbYoNeiC0XT+MS5Yc7eW23s8f5/SnuYILT4/bkWZbfdbiNDs/vrGYxLgVevg
	UvpYz5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pCk-00000004BXL-43Fp;
	Mon, 21 Apr 2025 11:20:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p7S-00000004B3w-1iOu
	for ath11k@lists.infradead.org;
	Mon, 21 Apr 2025 11:15:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L9iUnG007614
	for <ath11k@lists.infradead.org>; Mon, 21 Apr 2025 11:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=i1hoqFNmT3gQKEQ8kWYkIq4lTJqguXCCiXv
	sYANyoDk=; b=ipWuzdX1Co5PGopQUQbHSR1LoQb+VsA2nszAKGbCjuu07BSK7TT
	2Beqi6VB24nuh/pHW2MfSTJ1ikVFibmQOcD5zEilaCewftaYQrt6fbvxDW7My88r
	0Ki9WxudYECFQYdGAY2a0cknr6EmvPpepZgJZVchS2h4eZZ4dDaWH3zLv3HiCVZu
	t26wp7byvGu3Be3GyBgCrGL+xtNMKzzpPpBmJTJEyLoDl3S9/IGxttY0DOtcFeKU
	Q+9lH6dDb13O/6sXFlZPE62EL71ef+ofepI08oeNqEHDD2zsTxSGiYEd4bigqb7Q
	gJ91jMv1Xde8yutvW7QSSIwlpYjVJDF4BGA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464478v1dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 21 Apr 2025 11:15:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22647ff3cf5so32845575ad.0
        for <ath11k@lists.infradead.org>; Mon, 21 Apr 2025 04:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745234119; x=1745838919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1hoqFNmT3gQKEQ8kWYkIq4lTJqguXCCiXvsYANyoDk=;
        b=H4xaqOSvJjADsoxFFwBDnWDfI9fP2eVKrWrUtjNuDbRlbzm0UXCyrRjFwDlM6vaK87
         AI4pYyuS/0+ikCSH2B9pSEP+MmlNSFHWpdN+Rde9vLQIB8GnxJuXlyWtj0V8I301EDYb
         WwgY+7AUgyINt2GsTVKt7T9fJeP8u9dRBmiXJ7f634ihX9sYG+gBdv1Q9NHjfr6LCI3F
         nOTHpA1LERh36638m3zcu8eEHZ723btZ5gL1Y/NjgJb4skO5Dzu+blQTYCPiM3usESs8
         KCOhFxgAZ321sLh06YEarO42nEt+r1T4tXLhdNNC3j8HEOHfuwVJ7mhA588WCE6GQz3t
         FYww==
X-Forwarded-Encrypted: i=1; AJvYcCXbxYnM8dusUAQAR1guqpr/J+HZtX8jKIHUoHVFPMCEef65v11v/FUjSAKUMCPhGDyDVKLW3EE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWdDy7NQiMzXIAbQHPXbaMpu5sXHDaa9MqELcAF+7SCjb4i0ks
	TIyKMGagv6Sp7JtEkQ7FiGj1jKcVXxLIHIY3Pp2xbPf9oysgyyuwhoLJXL72/UWIUQrsLQBpHJ7
	1uWKPFbqhBckJ5IRfmsSey7GHFK2F3bwTzDliqnNmYW/QqTQWvx/BOU2dW9hX
X-Gm-Gg: ASbGncsDaFssfkMUSRLR5gKWa+PO/75r2PlM15/Sb8sLmLGyImDvyct8MUo+sB8Woo1
	Zq3ev/KNlmQZ0+yawXrEM/VziarFcLuI83j+9FbDToNnAwku1XNwrddNnTB0n1BYzcVJcgJz6uH
	+DaTnQ6VJIEFe2sagEhQkSnRDJeL00k7rzjg9PdlGTsMPjSkSzMTLNxWo4pF2sIIHgnvBB5/CxV
	/cLZ6Vt8IgdnaaGEH3ITOoBTBFpFPeKtMr5yp475cMBAC9NUEi1Fg7t17nPH5HmBYLqLKp7wqrV
	ckEwNQrIIsRmKjHgOgYJxf5ntPaBXdt0fyhCDZoH/fxpYFrR0OFigZ3T
X-Received: by 2002:a17:903:41c9:b0:224:78e:4ebe with SMTP id d9443c01a7336-22c53607d73mr160586125ad.33.1745234118773;
        Mon, 21 Apr 2025 04:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW1REMRM2nPAAMqdFJ1CLesEeN7hzj2YzvG6+nTHu1uQDuJjMGCatpxHvWRSmTiatZgcB1Aw==
X-Received: by 2002:a17:903:41c9:b0:224:78e:4ebe with SMTP id d9443c01a7336-22c53607d73mr160585845ad.33.1745234118434;
        Mon, 21 Apr 2025 04:15:18 -0700 (PDT)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0bdf5sm7172344a91.15.2025.04.21.04.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:15:17 -0700 (PDT)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next] wifi: ieee80211: define beacon protection bit field
Date: Mon, 21 Apr 2025 16:45:05 +0530
Message-Id: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fZ7zLIpZqxAwbgXQIahyiTfY47Lrvnag
X-Authority-Analysis: v=2.4 cv=CYgI5Krl c=1 sm=1 tr=0 ts=680628c8 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gy8QWGJEzyb5cfRzob4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: fZ7zLIpZqxAwbgXQIahyiTfY47Lrvnag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=839 mlxscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_041522_572108_F2B1951E 
X-CRM114-Status: GOOD (  12.13  )
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

An AP supporting Beacon Protection should set bit 84 in
the extended capabilities IE (9.4.2.25 in the 802.11be D7 spec).
So the *4th* bit of the 10th byte should be checked to figure out
whether beacon protection is enabled or disabled.

Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
---
 include/linux/ieee80211.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 508d466de1cc..aef5a616d598 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -4087,6 +4087,9 @@ enum ieee80211_tdls_actioncode {
 /* Defines support for enhanced multi-bssid advertisement*/
 #define WLAN_EXT_CAPA11_EMA_SUPPORT	BIT(3)
 
+/* Enable Beacon Protection */
+#define WLAN_EXT_CAPA11_BCN_PROTECT BIT(4)
+
 /* TDLS specific payload type in the LLC/SNAP header */
 #define WLAN_TDLS_SNAP_RFTYPE	0x2
 

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.34.1


