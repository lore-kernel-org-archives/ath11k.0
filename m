Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A97C77B7C
	for <ath11k@archiver.kernel.org>; Wed, 10 May 2023 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljwfkLOzf0NzrYNUP846I+ZamufRH/uIE1JwGipvrzI=; b=GdQ81JxPJQ79o5
	70PIXLtCLdjaQmVmUoQzFOfd6XuKKLunlJXCdU8iqR+IdxJc0dg5bsp3syt/J3zCYRTqmdkBmAEeo
	loIuPLUMdciZBkpE3mA44HmGbc6CPlgENg0UjIVTcZpjPmAPP8hjJpI6KcI+aHAdz30146jh8VCO6
	dY8TNPrvDdqgz/WUDrCT0+RJVxL0dva+B2dvbCdPRpmpglSYLVBbK197qsxR/u/ygOHMadCkfSvyd
	KEhYVWemNbDCbKq49RbPt2P4R0BDd6qs2L113LDZBgSZF0Imaat6ayK5ntwHV5RFWFS7Z6fA9dn3X
	+x4mjrELqXt2xDS+2Arg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgfC-005iPM-0H;
	Wed, 10 May 2023 10:03:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgf7-005iNp-2f
	for ath11k@lists.infradead.org;
	Wed, 10 May 2023 10:03:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A9CpCk023398;
	Wed, 10 May 2023 10:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=VBnGVhVzkE4Pjhmceq5966zhhdlGlPImiWh7n+ktrdM=;
 b=gjIw+w9g75RAjwhNIeZLK+DTcA6UUjyQaV7ElNHwux7qAU2ohHYkrfMc6gAU3KDT539e
 A45yByYKkmYTwJ46+/VoEZB/Kbx9xPtHd5C3hz0Wm1D6bmhrD4eUMG+E3m/hiS/RVWwK
 eMIW5oKuVyYbnJJ+ghcIMmOayUrNcnkAsJ39az6E0nZatIe5mm3QtbRNaEx90Ab4zWj3
 Sy8APwWMDNzBKxIgnkuDhEtNuubVNOXOdMLiNKwX7mbP1TsV0ds2Mxo+jR++8g939Avg
 hM61+H+pXN0wgIv80ZiMNIpAPicYdSXdqkqJNgi+5E3uASKJNrkldMfkpvnAo8occBlP pQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg79cr761-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 10:03:03 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AA32de029436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 10:03:02 GMT
Received: from che-siroccolnx03.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 03:03:01 -0700
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Maharaja Kennadyrajan
	<quic_mkenna@quicinc.com>
Subject: [PATCH v2 1/2] ath11k: Relocate the func ath11k_mac_bitrate_mask_num_ht_rates() and change hweight16 to hweight8
Date: Wed, 10 May 2023 15:32:41 +0530
Message-ID: <20230510100242.1241752-2-quic_mkenna@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510100242.1241752-1-quic_mkenna@quicinc.com>
References: <20230510100242.1241752-1-quic_mkenna@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zHnWDtZ4TJIX9yvhTi0TxIahnmBapY4y
X-Proofpoint-ORIG-GUID: zHnWDtZ4TJIX9yvhTi0TxIahnmBapY4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=549 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_030309_997878_70548485 
X-CRM114-Status: GOOD (  18.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Relocate the function ath11k_mac_bitrate_mask_num_ht_rates() definition
to call this function from other functions which helps to avoid the
compilation error (function not defined).

ht_mcs[] is 1 byte array and it is enough to use hweight8() instead
of hweight16(). Hence, fixed the same.

Tested on: Compile tested only.

Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a164b57dcf30..33620a7a444b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <net/mac80211.h>
@@ -4337,6 +4337,20 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	return ret;
 }
 
+static int
+ath11k_mac_bitrate_mask_num_ht_rates(struct ath11k *ar,
+				     enum nl80211_band band,
+				     const struct cfg80211_bitrate_mask *mask)
+{
+	int num_rates = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++)
+		num_rates += hweight8(mask->control[band].ht_mcs[i]);
+
+	return num_rates;
+}
+
 static int
 ath11k_mac_bitrate_mask_num_vht_rates(struct ath11k *ar,
 				      enum nl80211_band band,
@@ -7791,20 +7805,6 @@ static void ath11k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
 	ath11k_mac_flush_tx_complete(ar);
 }
 
-static int
-ath11k_mac_bitrate_mask_num_ht_rates(struct ath11k *ar,
-				     enum nl80211_band band,
-				     const struct cfg80211_bitrate_mask *mask)
-{
-	int num_rates = 0;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++)
-		num_rates += hweight16(mask->control[band].ht_mcs[i]);
-
-	return num_rates;
-}
-
 static bool
 ath11k_mac_has_single_legacy_rate(struct ath11k *ar,
 				  enum nl80211_band band,
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
