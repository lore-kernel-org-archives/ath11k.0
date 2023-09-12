Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB1FCA0EC3
	for <ath11k@archiver.kernel.org>; Tue, 12 Sep 2023 05:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUmNonkv12RlVIoYcskPClbFqFrZQVCSrb0IxF6d6b0=; b=SKA5rqqSOpYzaa
	yZSeXahaLJocICHh5v8X6Ao5w3AShWgCSPhinatCRn6QcMdPrK+SATV679Hbsx9H4qoYyJUiuYIbJ
	MhP6e/lBQX3crC1xg1lAECOF8pJXJC4q33yV2Clp52Mwyw5Xb5rL8ko1WSCeIXtMPif4rnWBP3WUn
	uoEuw8Uew738X6+CR1qefqsHSFgTTTgdk7BxDjVma2TkZKnLLx+HHt1sagJRM5o2Q6ni3Wn8+BXlV
	avpDUmM1uodPYrbb3tuzBashSixpVLIoEOjrS6RH4kb0El9zw5YbHYfUcwqvzWlGHedsFtuzILycs
	2YMKV0iO/yj6ObKgaq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfvoM-002Baf-2W;
	Tue, 12 Sep 2023 05:19:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfvoK-002BZn-1D
	for ath11k@lists.infradead.org;
	Tue, 12 Sep 2023 05:19:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C4kUdq016633;
	Tue, 12 Sep 2023 05:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=VPWzar/4Hsg4yeuCGBJ8BP9cGQY8+AbmSQ/zncQIc8o=;
 b=KXNwVVLEZsfrpVIOep9IpcOD5s7K6izxGxrBBsSrdNA0RTm1OTgwwThZNIGIvzUtwd/N
 T24zLCXCKUZtHzMJLgcWYyJC8AuT8wLuOUyyAVPurQkzACxXhcUmV0cuuS4A9nxgdPJe
 Ysh/VnvLcuCCtgGlvgXsEKUDoSN4iVDFFz5mB5fHiwWuHzQT74msahvdMmSDwLYrKdMy
 IQRuanMQT3x2j67CjmXCdrVdtbupt5xEBVF6Tu9B8eZNrlj+uoQReXIP6WdZXsQVC/on
 qj58/36mI8f0cIqLik/ZeAwlp0qnZEs+xtdJTBkIQCIa0RJMWDQStEfxlSgiRd+tBCW5 pw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t29b0gxgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 05:19:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38C5JU4A030850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 05:19:30 GMT
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 22:19:27 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Aditya
 Kumar Singh" <quic_adisi@quicinc.com>
Subject: [PATCH v2 1/3] wifi: cfg80211: export DFS CAC time and usable state helper functions
Date: Tue, 12 Sep 2023 10:48:55 +0530
Message-ID: <20230912051857.2284-2-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230912051857.2284-1-quic_adisi@quicinc.com>
References: <20230912051857.2284-1-quic_adisi@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o8Jw25YcclBJf6hNgcyxHXqr9_OhKEYb
X-Proofpoint-ORIG-GUID: o8Jw25YcclBJf6hNgcyxHXqr9_OhKEYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_221940_421653_4712EAFB 
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

cfg80211 has cfg80211_chandef_dfs_usable() function to know whether
at least one channel in the chandef is in usable state or not. Also,
cfg80211_chandef_dfs_cac_time() function is there which tells the CAC
time required for the given chandef.

Make these two functions visible to drivers by exporting their symbol
to global list of kernel symbols.

Lower level drivers can make use of these two functions to be aware
if CAC is required on the given chandef and for how long. For example
drivers which maintains the CAC state internally can make use of these.

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 include/net/cfg80211.h | 24 ++++++++++++++++++++++++
 net/wireless/chan.c    |  2 ++
 net/wireless/core.h    | 17 -----------------
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 3a4b684f89bf..92072a0f0ea6 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -953,6 +953,30 @@ int cfg80211_chandef_dfs_required(struct wiphy *wiphy,
 				  const struct cfg80211_chan_def *chandef,
 				  enum nl80211_iftype iftype);
 
+/**
+ * cfg80211_chandef_dfs_usable - checks if chandef is DFS usable and we
+ *				 can/need start CAC on such channel
+ * @wiphy: the wiphy to validate against
+ * @chandef: the channel definition to check
+ *
+ * Return: true if all channels available and at least
+ *	   one channel requires CAC (NL80211_DFS_USABLE)
+ */
+bool cfg80211_chandef_dfs_usable(struct wiphy *wiphy,
+				 const struct cfg80211_chan_def *chandef);
+
+/**
+ * cfg80211_chandef_dfs_cac_time - get the DFS CAC time (in ms) for given
+ *				   channel definition
+ * @wiphy: the wiphy to validate against
+ * @chandef: the channel definition to check
+ *
+ * Returns: DFS CAC time (in ms) which applies for this channel definition
+ */
+unsigned int
+cfg80211_chandef_dfs_cac_time(struct wiphy *wiphy,
+			      const struct cfg80211_chan_def *chandef);
+
 /**
  * nl80211_send_chandef - sends the channel definition.
  * @msg: the msg to send channel definition
diff --git a/net/wireless/chan.c b/net/wireless/chan.c
index 0b7e81db383d..a78a6183d11e 100644
--- a/net/wireless/chan.c
+++ b/net/wireless/chan.c
@@ -666,6 +666,7 @@ bool cfg80211_chandef_dfs_usable(struct wiphy *wiphy,
 
 	return (r1 + r2 > 0);
 }
+EXPORT_SYMBOL(cfg80211_chandef_dfs_usable);
 
 /*
  * Checks if center frequency of chan falls with in the bandwidth
@@ -965,6 +966,7 @@ cfg80211_chandef_dfs_cac_time(struct wiphy *wiphy,
 
 	return max(t1, t2);
 }
+EXPORT_SYMBOL(cfg80211_chandef_dfs_cac_time);
 
 static bool cfg80211_secondary_chans_ok(struct wiphy *wiphy,
 					u32 center_freq, u32 bandwidth,
diff --git a/net/wireless/core.h b/net/wireless/core.h
index 507d184b8b40..cc4eb3906c0c 100644
--- a/net/wireless/core.h
+++ b/net/wireless/core.h
@@ -469,29 +469,12 @@ int cfg80211_scan(struct cfg80211_registered_device *rdev);
 
 extern struct work_struct cfg80211_disconnect_work;
 
-/**
- * cfg80211_chandef_dfs_usable - checks if chandef is DFS usable
- * @wiphy: the wiphy to validate against
- * @chandef: the channel definition to check
- *
- * Checks if chandef is usable and we can/need start CAC on such channel.
- *
- * Return: true if all channels available and at least
- *	   one channel requires CAC (NL80211_DFS_USABLE)
- */
-bool cfg80211_chandef_dfs_usable(struct wiphy *wiphy,
-				 const struct cfg80211_chan_def *chandef);
-
 void cfg80211_set_dfs_state(struct wiphy *wiphy,
 			    const struct cfg80211_chan_def *chandef,
 			    enum nl80211_dfs_state dfs_state);
 
 void cfg80211_dfs_channels_update_work(struct work_struct *work);
 
-unsigned int
-cfg80211_chandef_dfs_cac_time(struct wiphy *wiphy,
-			      const struct cfg80211_chan_def *chandef);
-
 void cfg80211_sched_dfs_chan_update(struct cfg80211_registered_device *rdev);
 
 int
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
