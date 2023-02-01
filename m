Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8C6C636D4
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SfCJdSVPJYsUOIRng1bnOQN2/ZzBjm4FW09cQwhZq0Y=; b=KAropLmgEhs3JP
	LR/vgg2qRO8Eph9irwgGEQnyLnCtn7e6jPxVmIQTZas7meKXx1VUWejXoCZTRZhHfvAdDXs1wmPfH
	G2hzzIFOjmepzq0FdYbikRg8QFgpUn6yPykjdkj4eoBlrwXQ3G7LgULZrpgHqPTvZLn6vlcgxxPrK
	PheU3YQ5ik6Hpc499uRrBwnSjJHZvUTYNp/X51KnD+EZV9lpADypmtMR+/lwur0+Il4i/xO51lU2S
	4+HUQgbUnO59zwXuBxq6bWiyiH1G4HQ7t9M708TjleGBGlr5/ygP2jBVHdIYBshq7PMZR0r8p1YsZ
	Xt9ovEmkWLS7X7e714Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN70G-00AWLC-FH; Wed, 01 Feb 2023 06:53:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6zw-00AW8J-JH
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 06:53:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3114hoLA024790;
	Wed, 1 Feb 2023 06:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=BNfCl0Dtj9dz2kdQpGkGuq1h/wq8rh3j2zEqp9CNros=;
 b=eMkYW0ncrZUh8L7ivvL8kFJdn9NiReTD7Md1u62wun3/rhMbGz0u0DLfnOlG7+Df6dvb
 La5FUWXRqnbhnkSLoD8ojd3tma1MP883oU3YvTI5KGbsdcykmJQuJ32MmJJtsjRb780U
 ljX0N/z+erqw9PtCcvwJDKVPJYvgZBoG8PsLfADmqz8G0HsQObWqk11A5ppuGBUcZH+c
 Kq9uUrGq6BO7tFW+2H1PrLh/O23drrFgeAGQ8QR1eA1yRnp0yEEX1gKzTvA3IV2YBubG
 qB2AxMyAN+1JvS3zlOwDbTiwDaYpyvfGPI1EmCLNOgEEjckBBorPJO2bZZuDdZzulJKp LA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3neuwcbba7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:53:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3116rWxR021832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 1 Feb 2023 06:53:32 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 31 Jan 2023 22:53:30 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <johannes@sipsolutions.net>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] wifi: cfg80211: call reg_notifier for self managed wiphy from driver hint
Date: Wed, 1 Feb 2023 01:53:13 -0500
Message-ID: <20230201065313.27203-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZDg-so4u13aztsX96o_D-SxpQ426TQGM
X-Proofpoint-ORIG-GUID: ZDg-so4u13aztsX96o_D-SxpQ426TQGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=956 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225336_807853_7070D39B 
X-CRM114-Status: GOOD (  17.82  )
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
ieee80211_channel become finished, so add notify to driver in
reg_process_self_managed_hint() from cfg80211 is a good way, then
driver could get the correct info in callback of reg_notifier.

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2:
   1. add flag WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER
   2. change to use reg_call_notifier()

 include/net/cfg80211.h | 3 +++
 net/wireless/reg.c     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 1f8f827290a2..df565425f954 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4682,6 +4682,8 @@ struct cfg80211_ops {
  *	in order to not have them reachable in normal drivers, until we have
  *	complete feature/interface combinations/etc. advertisement. No driver
  *	should set this flag for now.
+ * @WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER: The device could handle reg notify for
+ *	NL80211_REGDOM_SET_BY_DRIVER.
  */
 enum wiphy_flags {
 	WIPHY_FLAG_SUPPORTS_EXT_KEK_KCK		= BIT(0),
@@ -4707,6 +4709,7 @@ enum wiphy_flags {
 	WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL	= BIT(21),
 	WIPHY_FLAG_SUPPORTS_5_10_MHZ		= BIT(22),
 	WIPHY_FLAG_HAS_CHANNEL_SWITCH		= BIT(23),
+	WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER	= BIT(24),
 };
 
 /**
diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 4f3f31244e8b..cb35c8e9ced7 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -3198,6 +3198,9 @@ static void reg_process_self_managed_hint(struct wiphy *wiphy)
 	request.alpha2[1] = regd->alpha2[1];
 	request.initiator = NL80211_REGDOM_SET_BY_DRIVER;
 
+	if (wiphy->flags & WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER)
+		reg_call_notifier(wiphy, &request);
+
 	nl80211_send_wiphy_reg_change_event(&request);
 }
 

base-commit: 922932ca02191a390f7f52fb6e21c44b50e14025
prerequisite-patch-id: e365a8f3f2dda71872409315b416797c771a6c51
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
