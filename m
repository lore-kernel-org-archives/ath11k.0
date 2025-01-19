Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2966EC02183
	for <ath11k@archiver.kernel.org>; Sun, 19 Jan 2025 05:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8C0b7AYRgqcY96BugJgxG5W46OpAEDFb3MbuCSajnwM=; b=BfaBFL116a6wXMm65bjDrln+oY
	904vsjwu3uU4GQ4kyy3qlexdKIZ1sCg89S6IErt82z0oUldjhFovwSw9sSFI6E0PnVxI3B6kBsBo7
	laKhoQ+26/I96GNCQNrNJHP25+DplPQF/0eO6bzsiKNhA95MvDKvMKSHI8KHT1Vad5Sj2Ns1qKGIV
	ZI0qtgvlA9Pwu8kMdaS+fklZR8ro0Mb5vLoi05CfQ3TNMtKk+Cwrk822MTi/WYMFs998v+82lsbF7
	o6R1Ve3BvLhrYS0LWHRwf69Q2pZoqifXnB/ZR7c7pSTJNiFxDvlQZkiKDykDhQ/Qmfw+ZCqICUmq9
	QwnQBd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNml-00000003QYY-3TUz;
	Sun, 19 Jan 2025 05:23:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZNm1-00000003QKk-2pgN
	for ath11k@lists.infradead.org;
	Sun, 19 Jan 2025 05:23:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J4iu8k002305
	for <ath11k@lists.infradead.org>; Sun, 19 Jan 2025 05:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8C0b7AYRgqc
	Y96BugJgxG5W46OpAEDFb3MbuCSajnwM=; b=EI6FwcuIjMhG8eWZ+ALgxOOKK0I
	tdSpDWmnVGhIxFm18D5sAZY5qYa0JgIPSXuauYlfrIuCVbUZJlw2n7vfNg+sEFSV
	+ncKcEWKD9brIkhJhUblSxWbSve27TFRVezU4egAUmY6kplkmSWfPPikB8/a6uKO
	olcslWz+glHsgvi5xVPGd6cx55oZP0QaVgS23kHpXIkoF/uMSFaWSr7v/0uaZqwx
	lu0gVyXCXbAmZ++0e2hcy9mj6GhM2dB9K+y51ilSNEacAC9MU47fI3KWINFKJsbH
	Z5GoQoMqw9KcgSx0oKLEYKhiuqdKwv4T8DmFKKh1MFv7U/QEA2HD+fLqYFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4484h19jv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 19 Jan 2025 05:23:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so9534896a91.3
        for <ath11k@lists.infradead.org>; Sat, 18 Jan 2025 21:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737264180; x=1737868980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8C0b7AYRgqcY96BugJgxG5W46OpAEDFb3MbuCSajnwM=;
        b=ThHSZCZSfZXQqkpNh8dI9KnIFrxkLaRaYN/sJ/BMQ5ptTHbvW4c1cWZxvE+F6KDq31
         jzRA8EawepyJMilZyYteKZVSewQcTcVXBFHg8+lLQCajzTIO+rwk5GPqKBC5CwQMO0OX
         Cr3h73hj87fX749U2tfxu/AchgTijbZAv7Ng+REx/3S6Uro0LapONysbw2UijjfSXfPC
         nYM2RmHbW7RpnQHTtYVUtE5lU3rwcSdx9DG7EDt7vLdYItrQ1FqMGDhEpPQPqc/kZWQ6
         4yXqdBJI8INqcLwdwCEYha0JKpHp40xQQ+8Af0EKENSxibo7RJSHl4kpZFLW7TABVItf
         Be5Q==
X-Gm-Message-State: AOJu0YzpofMefuKnjXE1pnofFFqg312mdZXQ2jwS9sMUUwwQFIV+iFIY
	vHTLztBT1HHyK2zKWY3Cb34Eq3x3m9fzkEgAY3YOU+lKPVtp6tzF1N2TFPfeYTTdJECWIA3RC9p
	mGPXQwwRgPzMrn2zhQc/RVIOjMoRukv8g9ExOBHQ7Tn24PcfwxdmyvKuJ4u93NLFkTVcV
X-Gm-Gg: ASbGncvXrIBpr6mNmmnopr7mIO7oMj0z/9lo42q7dvQoZ5hfinSAqz4fWvpAUPA6l1Y
	/rTws9QLBLv3QcKTMx/xmgkEuhwQA6z4gpZa2r+4UKRMHKLs+FEsRxzW+5IJIMnkqZEK9+7DHA9
	EiSqvmEIslgrzD2Up77B7dxDYr4hnN/U/3nQKHLcmd8G+cn7xj6/WnAUh8GxJSNA6tTMNIrjiTO
	V6Z9LjxiRmAs9BMd1nYSlxW9/2HQaRwWwqlWtzw9SfDbhtRvTiZyiqabxQ86/JlA1kRMYDmklfT
	AZ2GFJqD8dux0SENGOLi6VAe1X5Kux3sYiNmgIP+Uij9rhgzhg==
X-Received: by 2002:a17:90b:4c06:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2f782d4ed29mr11908734a91.27.1737264179972;
        Sat, 18 Jan 2025 21:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENc7B+HoPGEEKk4Pd69z1iWgwP551nWnln3SXSfO2+MqehG3HMf2oVBJ1VJ8o/QYexWRI+pA==
X-Received: by 2002:a17:90b:4c06:b0:2ee:b2e6:4276 with SMTP id 98e67ed59e1d1-2f782d4ed29mr11908713a91.27.1737264179645;
        Sat, 18 Jan 2025 21:22:59 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a295sm5062553a91.7.2025.01.18.21.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 21:22:58 -0800 (PST)
From: aloka.dixit@oss.qualcomm.com
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v2 4/5] wifi: ath12k: pass tx arvif for MBSSID and EMA beacon generation
Date: Sat, 18 Jan 2025 21:22:49 -0800
Message-Id: <20250119052250.3488343-5-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XkhSz6Ysb1bHjlvW5gDjpgGb1vIWSyAo
X-Proofpoint-GUID: XkhSz6Ysb1bHjlvW5gDjpgGb1vIWSyAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501190042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_212302_563356_CBA24FFF 
X-CRM114-Status: GOOD (  13.94  )
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

From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>

Add new input parameter to ath12k_mac_setup_bcn_tmpl_ema() for
'tx_arvif' as the caller ath12k_mac_setup_bcn_tmpl() already
stores it locally. Avoid duplicate retrieval.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f189ee008226..8a856cc1d801 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -1562,13 +1562,13 @@ static void ath12k_mac_set_arvif_ies(struct ath12k_link_vif *arvif, struct sk_bu
 	}
 }
 
-static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
+static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif,
+					 struct ath12k_link_vif *tx_arvif)
 {
 	struct ath12k_vif *ahvif = arvif->ahvif;
 	struct ieee80211_bss_conf *bss_conf;
 	struct ath12k_wmi_bcn_tmpl_ema_arg ema_args;
 	struct ieee80211_ema_beacons *beacons;
-	struct ath12k_link_vif *tx_arvif;
 	bool nontx_profile_found = false;
 	int ret = 0;
 	u8 i;
@@ -1581,7 +1581,6 @@ static int ath12k_mac_setup_bcn_tmpl_ema(struct ath12k_link_vif *arvif)
 		return -ENOLINK;
 	}
 
-	tx_arvif = ath12k_mac_get_tx_arvif(arvif);
 	beacons = ieee80211_beacon_get_template_ema_list(ath12k_ar_to_hw(tx_arvif->ar),
 							 tx_arvif->ahvif->vif,
 							 tx_arvif->link_id);
@@ -1651,7 +1650,7 @@ static int ath12k_mac_setup_bcn_tmpl(struct ath12k_link_vif *arvif)
 			return 0;
 
 		if (link_conf->ema_ap)
-			return ath12k_mac_setup_bcn_tmpl_ema(arvif);
+			return ath12k_mac_setup_bcn_tmpl_ema(arvif, tx_arvif);
 	} else {
 		tx_arvif = arvif;
 	}
-- 
2.34.1


