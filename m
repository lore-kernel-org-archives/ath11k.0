Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3FBC4332F
	for <ath11k@archiver.kernel.org>; Wed, 14 Dec 2022 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2TjXpdj4/ddrhpxfE/NpUKNaSm524LeN0BOiEnfOzdU=; b=Mk1QU02VaqFANu
	XJo4WyipqT8I05zvYcMNQhUOPcMPIAkfh/4WpCdgo/0Q5WUddcQFzfhaJRGsJu5gI1CGuJ6yhRoJg
	04G7IQc3jASkLw/00uTL67wUajNonZQivR6HrVO2kU4kfZq9hS6DwjHVTtX8eaIBpaqGmKrhDcFH4
	vvYyuineUb/kVoqX/IBO1JFO1xBX4BE3GiMgMn+Z64oHzytk3mzFcxcIYojy80mrixr0jtzxh3FCh
	Omox7IJFHmC0y6n/BBW9gbdmm4JKwYtwd+oRCe5mxcMc0ykwERh4lBcthAp3gKynEwO2rZk956s5Z
	fsh8Y1bC7icIO9DGI14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5OF9-00FC17-VA; Wed, 14 Dec 2022 09:40:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5OF7-00FBy3-BK
	for ath11k@lists.infradead.org; Wed, 14 Dec 2022 09:40:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BE9R793004237;
	Wed, 14 Dec 2022 09:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=89ZQ6jkpZxUnRtX/ZZVOfblWawR1yYrS+8jEyYqsKIc=;
 b=nx+dW6EI1IfVjKPumz0NzCjK1m3uTCktvSIdioxfmDU1Juc5sWGFE3Mea80Oz01KjEu4
 uzHIFuxxIdLJg2vNssdH3/qH8949khxf2Q+0xD7OadhBMR0V1sTbq3jfotPSwJUl3DIo
 +hUBZycaXMOC9r83anX230kTcTg+ltEmHEbvVs0A6mbZHLspKEqVTKA7PRGma/JdZw++
 hvw7ZSfh+x0zhroAb8EJmCP/6VLyoBYpbmhfR5/ZaoK5L9KL+/09hYZBPgtYb9O2cLS8
 pO6HozScDEPSMoJ6uQszV1XQhPn5myiH7T1/TC0G3sva+HSz3uznPIjJG+lMesJN8DZf Tw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rvrk2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 09:39:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BE9drLh021902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Dec 2022 09:39:53 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 14 Dec 2022 01:39:52 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: cfg80211: call reg_notifier for self managed wiphy from driver hint
Date: Wed, 14 Dec 2022 04:39:37 -0500
Message-ID: <20221214093937.14987-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ropPHB8IANkwUPI808U-jB35xs3zp7gV
X-Proofpoint-ORIG-GUID: ropPHB8IANkwUPI808U-jB35xs3zp7gV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_014001_546113_9FDF591C 
X-CRM114-Status: GOOD (  16.52  )
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

Currently the regulatory driver does not call the regulatory callback
reg_notifier for self managed wiphys. Sometimes driver needs cfg80211
to calculate the info of ieee80211_channel such as flags and power,
and driver needs to get the info of ieee80211_channel after hint of
driver, but driver does not know when calculation of the info of
ieee80211_channel become finished, so add notify to driver after
reg_process_self_managed_hint() from cfg80211 is a good way, then
driver could get the correct info in callback of reg_notifier.

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 net/wireless/reg.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 4f3f31244e8b..e3f500832427 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -3085,6 +3085,18 @@ static void reg_process_hint(struct regulatory_request *reg_request)
 	reg_free_request(reg_request);
 }
 
+static void queue_regulatory_request(struct regulatory_request *request)
+{
+	request->alpha2[0] = toupper(request->alpha2[0]);
+	request->alpha2[1] = toupper(request->alpha2[1]);
+
+	spin_lock(&reg_requests_lock);
+	list_add_tail(&request->list, &reg_requests_list);
+	spin_unlock(&reg_requests_lock);
+
+	schedule_work(&reg_work);
+}
+
 static void notify_self_managed_wiphys(struct regulatory_request *request)
 {
 	struct cfg80211_registered_device *rdev;
@@ -3095,6 +3107,13 @@ static void notify_self_managed_wiphys(struct regulatory_request *request)
 		if (wiphy->regulatory_flags & REGULATORY_WIPHY_SELF_MANAGED &&
 		    request->initiator == NL80211_REGDOM_SET_BY_USER)
 			reg_call_notifier(wiphy, request);
+
+		if (wiphy->regulatory_flags & REGULATORY_WIPHY_SELF_MANAGED &&
+		    request->initiator == NL80211_REGDOM_SET_BY_DRIVER &&
+		    request->wiphy_idx == get_wiphy_idx(wiphy)) {
+			reg_call_notifier(wiphy, request);
+			request->wiphy_idx = WIPHY_IDX_INVALID;
+		}
 	}
 }
 
@@ -3172,6 +3191,7 @@ static void reg_process_self_managed_hint(struct wiphy *wiphy)
 	const struct ieee80211_regdomain *regd;
 	enum nl80211_band band;
 	struct regulatory_request request = {};
+	struct regulatory_request *driver_request;
 
 	ASSERT_RTNL();
 	lockdep_assert_wiphy(wiphy);
@@ -3199,6 +3219,13 @@ static void reg_process_self_managed_hint(struct wiphy *wiphy)
 	request.initiator = NL80211_REGDOM_SET_BY_DRIVER;
 
 	nl80211_send_wiphy_reg_change_event(&request);
+
+	driver_request = kzalloc(sizeof(struct regulatory_request), GFP_KERNEL);
+	if (!driver_request)
+		return;
+
+	memcpy(driver_request, &request, sizeof(*driver_request));
+	queue_regulatory_request(driver_request);
 }
 
 static void reg_process_self_managed_hints(void)
@@ -3225,18 +3252,6 @@ static void reg_todo(struct work_struct *work)
 	rtnl_unlock();
 }
 
-static void queue_regulatory_request(struct regulatory_request *request)
-{
-	request->alpha2[0] = toupper(request->alpha2[0]);
-	request->alpha2[1] = toupper(request->alpha2[1]);
-
-	spin_lock(&reg_requests_lock);
-	list_add_tail(&request->list, &reg_requests_list);
-	spin_unlock(&reg_requests_lock);
-
-	schedule_work(&reg_work);
-}
-
 /*
  * Core regulatory hint -- happens during cfg80211_init()
  * and when we restore regulatory settings.

base-commit: 922932ca02191a390f7f52fb6e21c44b50e14025
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
