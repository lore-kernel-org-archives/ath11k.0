Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4072C77B7F
	for <ath11k@archiver.kernel.org>; Wed, 17 May 2023 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukCWqFPPJt1XudweylTRqvF4uwgHwAa1pbg+1AudBIc=; b=WHl1gKOHXo36hq
	aU2ly4JwnxJqq4Zqno90O2Nx2DB1KSePc80plMubCv9yUgLi8fzzb1b9qq4osf4fSey2PmH+1WQI+
	UryF+EAGyRomYiqJQoyuPum4V3vOSzZBxziJ5OypRaLycHhvflfrQRyrgESntx+fmk7vA5H4YsiVe
	AfGar3wSGZbRz/sLQcxMlWFj9h3RvkqauRd7CeFKUz6v6Sw7/lj/YxaG/I/UYh1B9OlE78VMQ82Vx
	4cZeNbNMfZ1F4YkaCqFsWx+wzSgJTYolzLkcygxkcgdzBFjAQ7Q3Tv3GRMMl/vJI+8h6q/d7eP7BB
	fLJuKEhzzfCdCpyS8qVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHhE-00A3hI-1I;
	Wed, 17 May 2023 14:00:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHhC-00A3gA-12
	for ath11k@lists.infradead.org;
	Wed, 17 May 2023 14:00:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HDQp0x002220;
	Wed, 17 May 2023 14:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=4rD4Xw+UbZjzwLecppcLdIPwKGeRQ7L1flYMghdCPH4=;
 b=B15ebyggkprEItaoGXW8ouiaQkUEgHFjGktTN9Hla5qLUUdtMGWMOjl+1vrVE4F9kBsi
 uUEJ3FZfRjisktchRj1dzX0AtqTfYoCRmlLPZlplqzBV+LT6mFE4AFgndPaQa2M/OWt0
 FQ93uO/ufi3lljBR82TzPdjrdFDZsdJDMaRF6qnD2pdh+se0hxCbel/sZXJz2lOkcp8p
 U14nF1UNNIlskLYyGnVRTgbJ5Yw7eHSyXjvh5p3nw8b91DRkGUw9RL37hskTYGfp+gPU
 br75GrTNwIDgRPwsP6v8/Hc/B9rCNOuYw+ZUKSxh0w+tDpoXQmvtWU70B/h32ZbYp0WK 6w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmcc62e9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 14:00:01 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HE01JL021250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 14:00:01 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 06:59:59 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Govindaraj Saminathan
	<quic_gsaminat@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH v4 1/4] wifi: ath11k: remove unused function ath11k_tm_event_wmi
Date: Wed, 17 May 2023 19:29:31 +0530
Message-ID: <20230517135934.16408-2-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230517135934.16408-1-quic_rajkbhag@quicinc.com>
References: <20230517135934.16408-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CaTOL2c72RIQHFcEBwbgA53XwGOfWq3a
X-Proofpoint-ORIG-GUID: CaTOL2c72RIQHFcEBwbgA53XwGOfWq3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_070002_362864_784CFA90 
X-CRM114-Status: GOOD (  17.47  )
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
