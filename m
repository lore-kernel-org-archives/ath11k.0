Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A181CE7AAD
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 03:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhJ+eqJMwoZRzmfds+qANVZ5VsqhN8EeaH6l4z2rl3E=; b=dN6ZQHOivoPwj5bQunDXI03UMR
	tjK/kCdYQjgoZUC8hlKcWh4glBBBlR5KaFbeJ1WG6xHUk8X+hRaRfq+ZOFVq1PoqrE3GR57S4kGqh
	Pi5dpHBvtehIxtulfgMOAcpl/fUpCcYMyeWV1UB4F/EKuh2G4PGdqTAO7LcMFYDMygtGzoIZCqE6X
	/4H91hn1SAetSErCabuHaSiG4o3zj04Viqc6c7mxYfBNlQddzm2ai3ux8E5lXtOygRMcSD2tWEGXc
	QixkEp3BVJiznB1uH4yWMoaGPbu7xui367r378/Hpp7+Gyx5tzObGeWwngme8dInCgkN0luBcmQTC
	MQEjOMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smPi3-0000000AXCL-2vlC;
	Fri, 06 Sep 2024 03:32:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smPhz-0000000AXAZ-3SJ7
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 03:32:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IPxpd032629;
	Fri, 6 Sep 2024 03:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IhJ+eqJMwoZRzmfds+qANVZ5VsqhN8EeaH6l4z2rl3E=; b=BqzoZIzVl3J18rNt
	4WeKB1gz3xmnG+cgu2CcMNy9jMQEATPATny54nTQ/g1Zr20gEt0rEY4MSmnbqGf8
	voASQSJjKnKCt/SksHxkuwdMSi2jqUuzc8mR5GQgm3y55qKMblgt6klrscR/F1ya
	4kTF3L91SgTejZNkmxhLdIfy/1KVunxwUK/UseUKVRH3WzNFChpEBZ+bkFA5WInP
	RBye/iQG7VSsgswurrj7v2O9SqY/rPttxgpSq/t1+ke4DcKpAWRvOEBPBTiAf2+Y
	xLor/4EEm7ngkMqjxyD48Rfsrk+6tohyN1VS4uW+JQ1yoTj5QfIaVeeHdaq4jFJp
	dda48A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwt8xq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 03:32:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4863WONC027891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 03:32:24 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 20:32:23 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v2 1/2] wifi: ath11k: move update channel list from update reg worker to reg notifier
Date: Fri, 6 Sep 2024 11:31:59 +0800
Message-ID: <20240906033200.472-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20240906033200.472-1-quic_kangyang@quicinc.com>
References: <20240906033200.472-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SyFB5n6E13QQq4yzjGHJckSV3h4qpyFh
X-Proofpoint-ORIG-GUID: SyFB5n6E13QQq4yzjGHJckSV3h4qpyFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_203228_028922_E3884699 
X-CRM114-Status: GOOD (  16.13  )
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

From: Wen Gong <quic_wgong@quicinc.com>

Currently ath11k call regulatory_set_wiphy_regd() in ath11k_regd_update()
to notify the reg domain change to cfg80211 and update channel list by
reg_work, then ath11k immediately update channel list to firmware by
ath11k_reg_update_chan_list(). 

callstack:
ath11k_regd_update
->regulatory_set_wiphy_regd
           -> schedule_work(&reg_work)
-> ath11k_reg_update_chan_list

They are running in two threads, it leads the channel list data out of
sync caused by muti-threads without synchronization. At this time,
ath11k may update wrong channel list to firmware because the reg_work
still running or even hasn't started yet.

The correct flow is after reg_work update the channel list according to
new reg domain, ath11k call ath11k_reg_update_chan_list() and update the
new channel list to firmware.

reg_call_notifier()(finally it will call ath11k_reg_notifier()) will be
called to by reg_work to notify ath11k when it finishes the channel
list update. So at this time, call ath11k_reg_update_chan_list() in
reg_call_notifier() with initiator type NL80211_REGDOM_SET_BY_DRIVER.
Then ath11k_reg_update_chan_list() will use the correct channel list.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Fixes: f45cb6b29cd3 ("wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/reg.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index b0f289784dd3..cb2cf9b63d18 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -55,6 +55,19 @@ ath11k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	ath11k_dbg(ar->ab, ATH11K_DBG_REG,
 		   "Regulatory Notification received for %s\n", wiphy_name(wiphy));
 
+	if (request->initiator == NL80211_REGDOM_SET_BY_DRIVER) {
+		ath11k_dbg(ar->ab, ATH11K_DBG_REG,
+			   "driver initiated regd update\n");
+		if (ar->state != ATH11K_STATE_ON)
+			return;
+
+		ret = ath11k_reg_update_chan_list(ar, true);
+		if (ret)
+			ath11k_warn(ar->ab, "failed to update channel list: %d\n", ret);
+
+		return;
+	}
+
 	/* Currently supporting only General User Hints. Cell base user
 	 * hints to be handled later.
 	 * Hints from other sources like Core, Beacons are not expected for
@@ -293,12 +306,6 @@ int ath11k_regd_update(struct ath11k *ar)
 	if (ret)
 		goto err;
 
-	if (ar->state == ATH11K_STATE_ON) {
-		ret = ath11k_reg_update_chan_list(ar, true);
-		if (ret)
-			goto err;
-	}
-
 	return 0;
 err:
 	ath11k_warn(ab, "failed to perform regd update : %d\n", ret);
@@ -977,6 +984,7 @@ void ath11k_regd_update_work(struct work_struct *work)
 void ath11k_reg_init(struct ath11k *ar)
 {
 	ar->hw->wiphy->regulatory_flags = REGULATORY_WIPHY_SELF_MANAGED;
+	ar->hw->wiphy->flags |= WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER;
 	ar->hw->wiphy->reg_notifier = ath11k_reg_notifier;
 }
 
-- 
2.34.1


