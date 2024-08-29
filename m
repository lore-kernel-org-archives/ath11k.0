Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A18FC6FD35
	for <ath11k@archiver.kernel.org>; Thu, 29 Aug 2024 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bAH/oAM85EkYQewplQx4RP6QZxgIYQilhYlHugcbV88=; b=v1cmXdm7BvAoPvQ8pXUP1bCd+t
	u2K+bQ0ynauHgIE5XhmmbnuOPB/v2/M/EBae+7NwabjgKGn32JdwoDXGDQGTUcWFQp8XCIqbP9Eqe
	26m12SGwiODEDZyVfE1/C9ll6M04We4pLpcs4H3/rMESm2BNOb0b1W4/N9p9tbqpFwZWT4OudOMjS
	vjY5tsLA29IBnTX8rS0jCNw6pzyTgOh7iD4s8jBUoaNF3JBiD57nLIkC5GauWKBom1R8/iGdsf5mp
	G3ytAifhYw9QIlPO2jzHjpSUeg38jXTczisbRH/7SFL/SWFefWsL03Kp88Fg1f/803RKWp3pU/EYF
	LVdCq8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjZyH-000000012hQ-3P1q;
	Thu, 29 Aug 2024 07:53:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjZxt-000000012bZ-22j6
	for ath11k@lists.infradead.org;
	Thu, 29 Aug 2024 07:53:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMEm7026629;
	Thu, 29 Aug 2024 07:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bAH/oAM85EkYQewplQx4RP
	6QZxgIYQilhYlHugcbV88=; b=cclX8N9+MOVqY4ooNI8eNe1mVpD/wg4YSLnrrb
	v+JY+D5UjkXdUOlyrQQkrViQNs8FXZXjjTEmiUDAIy0rNh7ufKPr6xwYgwaZOL5y
	Mo9Iyug9aG7aH1zZei1cAybcrEtNCwow6Cop1mEQhy5+uKaMuwq+XzJmXEudH5/a
	SvKxTXj5RQpPttT4mA1+yNuSNBSC8NccFPuDFM/FezBdOngEkcwSt6pmPtXfXPrV
	V9nd1dDajQ/rOXMUMJff3FZKmW6ui7Btg5oa5Nlubf7qPbiHaVZB/mSyeVpKpPU4
	vSp5rZdx+Ji95b15Ju5QVa3c6zo38o4pQu4vBgy3w3sYguew==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puucb5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 07:53:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T7r4Pp019121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 07:53:04 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 00:53:02 -0700
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
To: <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: [PATCH] wifi: ath11k: fix the stack frame size warning in ath11k_vif_wow_set_wakeups
Date: Thu, 29 Aug 2024 15:52:53 +0800
Message-ID: <20240829075253.657667-1-quic_miaoqing@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kaa24pcrp6a5LxP8LX4uLf2IV7IhWcGO
X-Proofpoint-ORIG-GUID: Kaa24pcrp6a5LxP8LX4uLf2IV7IhWcGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_005309_558424_DFCE8769 
X-CRM114-Status: GOOD (  16.48  )
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

Fix the following W=1 kernel build warning:

drivers/net/wireless/ath/ath11k/wow.c: In function ‘ath11k_vif_wow_set_wakeups’:
drivers/net/wireless/ath/ath11k/wow.c:461:1: warning: the frame size of 1352 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Remove the nonessential variable 'struct cfg80211_pkt_pattern
old_pattern' by relocating bitmask to bytemask conversion into
ath11k_wow_convert_8023_to_80211().

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wow.c | 39 ++++++++++++++-------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index 99d8ba45a75b..827085a926b2 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2020 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -155,6 +155,7 @@ static void ath11k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
 	u8 hdr_8023_bit_mask[ETH_HLEN] = {};
 	u8 hdr_80211_pattern[WOW_HDR_LEN] = {};
 	u8 hdr_80211_bit_mask[WOW_HDR_LEN] = {};
+	u8 bytemask[WOW_MAX_PATTERN_SIZE] = {};
 
 	int total_len = old->pkt_offset + old->pattern_len;
 	int hdr_80211_end_offset;
@@ -172,11 +173,17 @@ static void ath11k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
 	struct rfc1042_hdr *new_rfc_mask =
 		(struct rfc1042_hdr *)(hdr_80211_bit_mask + hdr_len);
 	int rfc_len = sizeof(*new_rfc_pattern);
+	int i;
+
+	/* convert bitmask to bytemask */
+	for (i = 0; i < old->pattern_len; i++)
+		if (old->mask[i / 8] & BIT(i % 8))
+			bytemask[i] = 0xff;
 
 	memcpy(hdr_8023_pattern + old->pkt_offset,
 	       old->pattern, ETH_HLEN - old->pkt_offset);
 	memcpy(hdr_8023_bit_mask + old->pkt_offset,
-	       old->mask, ETH_HLEN - old->pkt_offset);
+	       bytemask, ETH_HLEN - old->pkt_offset);
 
 	/* Copy destination address */
 	memcpy(new_hdr_pattern->addr1, old_hdr_pattern->h_dest, ETH_ALEN);
@@ -232,7 +239,7 @@ static void ath11k_wow_convert_8023_to_80211(struct cfg80211_pkt_pattern *new,
 		       (void *)old->pattern + ETH_HLEN - old->pkt_offset,
 		       total_len - ETH_HLEN);
 		memcpy((u8 *)new->mask + new->pattern_len,
-		       (void *)old->mask + ETH_HLEN - old->pkt_offset,
+		       bytemask + ETH_HLEN - old->pkt_offset,
 		       total_len - ETH_HLEN);
 
 		new->pattern_len += total_len - ETH_HLEN;
@@ -393,35 +400,31 @@ static int ath11k_vif_wow_set_wakeups(struct ath11k_vif *arvif,
 	}
 
 	for (i = 0; i < wowlan->n_patterns; i++) {
-		u8 bitmask[WOW_MAX_PATTERN_SIZE] = {};
 		u8 ath_pattern[WOW_MAX_PATTERN_SIZE] = {};
 		u8 ath_bitmask[WOW_MAX_PATTERN_SIZE] = {};
 		struct cfg80211_pkt_pattern new_pattern = {};
-		struct cfg80211_pkt_pattern old_pattern = patterns[i];
-		int j;
 
 		new_pattern.pattern = ath_pattern;
 		new_pattern.mask = ath_bitmask;
 		if (patterns[i].pattern_len > WOW_MAX_PATTERN_SIZE)
 			continue;
-		/* convert bytemask to bitmask */
-		for (j = 0; j < patterns[i].pattern_len; j++)
-			if (patterns[i].mask[j / 8] & BIT(j % 8))
-				bitmask[j] = 0xff;
-		old_pattern.mask = bitmask;
 
 		if (ar->wmi->wmi_ab->wlan_resource_config.rx_decap_mode ==
 		    ATH11K_HW_TXRX_NATIVE_WIFI) {
 			if (patterns[i].pkt_offset < ETH_HLEN) {
-				u8 pattern_ext[WOW_MAX_PATTERN_SIZE] = {};
-
-				memcpy(pattern_ext, old_pattern.pattern,
-				       old_pattern.pattern_len);
-				old_pattern.pattern = pattern_ext;
 				ath11k_wow_convert_8023_to_80211(&new_pattern,
-								 &old_pattern);
+								 &patterns[i]);
 			} else {
-				new_pattern = old_pattern;
+				int j;
+
+				new_pattern = patterns[i];
+				new_pattern.mask = ath_bitmask;
+
+				/* convert bitmask to bytemask */
+				for (j = 0; j < patterns[i].pattern_len; j++)
+					if (patterns[i].mask[j / 8] & BIT(j % 8))
+						ath_bitmask[j] = 0xff;
+
 				new_pattern.pkt_offset += WOW_HDR_LEN - ETH_HLEN;
 			}
 		}
-- 
2.25.1


