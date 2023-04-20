Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE12C77B7E
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 12:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukCWqFPPJt1XudweylTRqvF4uwgHwAa1pbg+1AudBIc=; b=kZ4vnWHJXNNZNY
	RBR0DO449gJTKqLldQ2S8D1XmIVu8xk/09vIprQUEn8EV59FasYK43CAJaOWkCup5Iw0X6gpzo4zO
	rH7WsMWYKRK+99y8KRKPPYyns74yZ0UlsdJUwIfrpxd7SyVEV/xmBLih6RgKe9P764eoZx+iXg95K
	Z+HSJwNivOvLvzWMhVs4Hup2LkncOML+H43WhbC6Wa4PQ6Wpq9OLnuMGIO2P3xIS/t99TDT0t3/HC
	fcWOp75UcK+p/GLiD68fEXyEQFGTA4HcRHl5DZlo1gXtOHM5dFMtR3aIOng87m+6m2+d6w0+EC60A
	7Y1Yn0MZEnOzKj/YxObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppT6E-0080os-3D;
	Thu, 20 Apr 2023 12:09:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppT6B-0080nm-1G
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 12:09:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33KC2F4Y011443;
	Thu, 20 Apr 2023 12:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=4rD4Xw+UbZjzwLecppcLdIPwKGeRQ7L1flYMghdCPH4=;
 b=SQ4gfBHDuHLIrXChlrWeLE5ZN+stY3y1J7BQC2nXsO1DxcQa9sKMLBOV0fHtPbORumbI
 dxnNP/Po+uz+XsRtr4uqjxdHXY4xF5z1Yj+6yntxyH2XCGWYON+yF5gk5zDOkDwW/EYl
 RO0vqA2DonB2R2XrDeIbS1upW+VLT5aNqMXsMu9aE8U/F3+2FlIn29kG7exOPkJ52zYP
 Cc4WC36TLnMULQBsZoKbxJQM+5dRRLqyfa1pFw1yel2jUr7Nz+SkMF8JgKd9cSvRYggk
 vJU6BGzHvro7/BLOJzkuDiKHnFc9FtVIgEpyCM7hkET+Avdd8cs4f3gejLvO7Ihg8hkL Tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2xuhrxeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 12:09:14 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KC9EuH025019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Apr 2023 12:09:14 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:09:12 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Govindaraj Saminathan
	<quic_gsaminat@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v3 1/4] wifi: ath11k: remove unused function ath11k_tm_event_wmi
Date: Thu, 20 Apr 2023 17:38:37 +0530
Message-ID: <20230420120840.18712-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230420120840.18712-1-quic_rajkbhag@quicinc.com>
References: <20230420120840.18712-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: c0tWztBnNVAVPj3f6O1MoKKXUQwLsGgh
X-Proofpoint-GUID: c0tWztBnNVAVPj3f6O1MoKKXUQwLsGgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_050915_434463_840803AC 
X-CRM114-Status: GOOD (  18.02  )
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

From: Govindaraj Saminathan <quic_gsaminat@quicinc.com>

The function ath11k_tm_event_wmi() is only defined and it is not used
anywhere. Hence remove unused function ath11k_tm_event_wmi().

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/testmode.c | 64 +---------------------
 drivers/net/wireless/ath/ath11k/testmode.h |  8 +--
 2 files changed, 2 insertions(+), 70 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
index 4bf1931adbaa..ebeca5eb6a67 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.c
+++ b/drivers/net/wireless/ath/ath11k/testmode.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "testmode.h"
@@ -20,69 +21,6 @@ static const struct nla_policy ath11k_tm_policy[ATH11K_TM_ATTR_MAX + 1] = {
 	[ATH11K_TM_ATTR_VERSION_MINOR]	= { .type = NLA_U32 },
 };
 
-/* Returns true if callee consumes the skb and the skb should be discarded.
- * Returns false if skb is not used. Does not sleep.
- */
-bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id, struct sk_buff *skb)
-{
-	struct sk_buff *nl_skb;
-	bool consumed;
-	int ret;
-
-	ath11k_dbg(ar->ab, ATH11K_DBG_TESTMODE,
-		   "testmode event wmi cmd_id %d skb %pK skb->len %d\n",
-		   cmd_id, skb, skb->len);
-
-	ath11k_dbg_dump(ar->ab, ATH11K_DBG_TESTMODE, NULL, "", skb->data, skb->len);
-
-	spin_lock_bh(&ar->data_lock);
-
-	consumed = true;
-
-	nl_skb = cfg80211_testmode_alloc_event_skb(ar->hw->wiphy,
-						   2 * sizeof(u32) + skb->len,
-						   GFP_ATOMIC);
-	if (!nl_skb) {
-		ath11k_warn(ar->ab,
-			    "failed to allocate skb for testmode wmi event\n");
-		goto out;
-	}
-
-	ret = nla_put_u32(nl_skb, ATH11K_TM_ATTR_CMD, ATH11K_TM_CMD_WMI);
-	if (ret) {
-		ath11k_warn(ar->ab,
-			    "failed to put testmode wmi event cmd attribute: %d\n",
-			    ret);
-		kfree_skb(nl_skb);
-		goto out;
-	}
-
-	ret = nla_put_u32(nl_skb, ATH11K_TM_ATTR_WMI_CMDID, cmd_id);
-	if (ret) {
-		ath11k_warn(ar->ab,
-			    "failed to put testmode wmi even cmd_id: %d\n",
-			    ret);
-		kfree_skb(nl_skb);
-		goto out;
-	}
-
-	ret = nla_put(nl_skb, ATH11K_TM_ATTR_DATA, skb->len, skb->data);
-	if (ret) {
-		ath11k_warn(ar->ab,
-			    "failed to copy skb to testmode wmi event: %d\n",
-			    ret);
-		kfree_skb(nl_skb);
-		goto out;
-	}
-
-	cfg80211_testmode_event(nl_skb, GFP_ATOMIC);
-
-out:
-	spin_unlock_bh(&ar->data_lock);
-
-	return consumed;
-}
-
 static int ath11k_tm_cmd_get_version(struct ath11k *ar, struct nlattr *tb[])
 {
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/ath/ath11k/testmode.h b/drivers/net/wireless/ath/ath11k/testmode.h
index aaa122ed9069..ffdb0c30b276 100644
--- a/drivers/net/wireless/ath/ath11k/testmode.h
+++ b/drivers/net/wireless/ath/ath11k/testmode.h
@@ -1,24 +1,18 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include "core.h"
 
 #ifdef CONFIG_NL80211_TESTMODE
 
-bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id, struct sk_buff *skb);
 int ath11k_tm_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		  void *data, int len);
 
 #else
 
-static inline bool ath11k_tm_event_wmi(struct ath11k *ar, u32 cmd_id,
-				       struct sk_buff *skb)
-{
-	return false;
-}
-
 static inline int ath11k_tm_cmd(struct ieee80211_hw *hw,
 				struct ieee80211_vif *vif,
 				void *data, int len)
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
