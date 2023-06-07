Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4164BC83005
	for <ath11k@archiver.kernel.org>; Wed,  7 Jun 2023 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4IJ2m5HXmX+i3ea2bQW9oOU55aMimbHwMzYQueliS8=; b=rjveS2mOG0+s8O
	1GMYSut8ociSDS0SpTQV4/O0I2T3643Q/oB3U9cmVJKyxnle6RYJVGB3Oi8tR7D8AhBgihH3qzNPE
	On2JVM1fecXw0+SLGS4KMnUdZ0xqWM8BDAYhcnb+VNtc6aNOJb69ZPR0Pa7IhDKeK8iuH5HD3lq5v
	SnKQRjG49Yhk5bkJal0S3xzyJTl35yHsJe2FePRUAwqCWnTCboUHbpGpNjrnrDaMhiHpRyB4r/YGD
	QZlJcsFeme1Tt1bz1fqfatoi5o9wzw5ux17zuRnlqRdO4UlFLfVMrlOTt9lcpn/QWT7ooY+nkDsra
	d5xLVYcPHuFUZgk4JZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6tX7-0068sK-0l;
	Wed, 07 Jun 2023 13:49:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6tX5-0068qz-2v
	for ath11k@bombadil.infradead.org;
	Wed, 07 Jun 2023 13:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wOJGWV0UDCN2iFJY+i2EopWC0m+jFuX9gIBjJHdCpzE=; b=nXLkTbykkl45sA2MyyqTY/oPHq
	nLzxXcAu0lX7xevGemX3tQmu89mbYEAnkNI8b98y4N8RNQ1s4w/2+lOsV7HVcI/ZxrtV0zg1a57z/
	M7JVvLSxI1rdlQlNkXfRQa9Ipm8yhBL595hMpIvQtK7dnAnuCDlT0/+ncmtZs8lVe7zNQJFsfqA0c
	uHqkAppHD+sved3RGQ6DVVJgU+LOgkaV9w3PLB+pTlvs7X7G6K1uXmhN3+g+tUEi/aobuweIA5qI9
	8QZZMkuU95E670zszoB+7CkcJi9S7617BHGAg9+gjBr+eSLqxdtH3QbsX3ZTzkotPZStdo4iICvcz
	i0jyvbFw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6sZG-0059QV-1f
	for ath11k@lists.infradead.org;
	Wed, 07 Jun 2023 12:47:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357Cjm54000899;
	Wed, 7 Jun 2023 12:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=wOJGWV0UDCN2iFJY+i2EopWC0m+jFuX9gIBjJHdCpzE=;
 b=VS/P4GbaT7WcXK1amvSHc3aY6JAT3Yw5Wu6aoZkxQeZpPRif/2tpgwEMnls83Feig07a
 muVaQ9vvdStydz4lrwjZsQVLQnqF+1CAzQzU+Viwt75CvyhVhGT+dics3iAh6KmRlyb6
 agbyEOlj3FrrIpv5Uys3uOUP4Ea7y5kTtmK4Qler/ugp9AkrZOH7SQAfDtRv7basiaxY
 +zrklf9goJpiuym2eyqEAkI9gp5AEuY3NvJyeFjpkBoCMKuhSmQGnh28OGeOVUKv+6sq
 0fwi5LY43V3Wal9IZjiMMNg9AQdsCkZw68By95b60IawBsu3M4etA4p3UKcNqa8vo8uC OQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a9u9tg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 12:47:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 357Cl7vW022452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Jun 2023 12:47:07 GMT
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 7 Jun 2023 05:47:05 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Aditya
 Kumar Singh" <quic_adisi@quicinc.com>
Subject: [PATCH 2/3] wifi: ath11k: fix CAC running state during virtual interface start
Date: Wed, 7 Jun 2023 18:16:46 +0530
Message-ID: <20230607124647.27682-3-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230607124647.27682-1-quic_adisi@quicinc.com>
References: <20230607124647.27682-1-quic_adisi@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZFzjnFsROrNqx0Uq56UHkLiWiQTdnbI0
X-Proofpoint-GUID: ZFzjnFsROrNqx0Uq56UHkLiWiQTdnbI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_134714_859255_C7A25E69 
X-CRM114-Status: GOOD (  22.48  )
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

Currently channel definition's primary channel's DFS CAC time
as well as primary channel's state i.e usable are used to set
the CAC_RUNNING flag for the ath11k radio structure. However,
this is wrong since certain channel definition are possbile
where primary channel may not be a DFS channel but, secondary
channel is a DFS channel. For example - channel 36 with 160 MHz
bandwidth.
In such cases, the flag will not be set which is wrong.

Fix this issue by using cfg80211_chandef_dfs_usable() function
from cfg80211 which return trues if at least one channel is in
usable state.

While at it, modify the CAC running debug log message to print
the CAC time as well in milli-seconds.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a31b8e89684b..31982545266b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5,6 +5,7 @@
  */
 
 #include <net/mac80211.h>
+#include <net/cfg80211.h>
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/inetdevice.h>
@@ -7193,6 +7194,7 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 	struct wmi_vdev_start_req_arg arg = {};
 	const struct cfg80211_chan_def *chandef = &ctx->def;
 	int ret = 0;
+	unsigned int dfs_cac_time;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
@@ -7272,20 +7274,21 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 	ath11k_dbg(ab, ATH11K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
 		   arvif->vif->addr, arvif->vdev_id);
 
-	/* Enable CAC Flag in the driver by checking the channel DFS cac time,
-	 * i.e dfs_cac_ms value which will be valid only for radar channels
-	 * and state as NL80211_DFS_USABLE which indicates CAC needs to be
+	/* Enable CAC Flag in the driver by checking the all sub-channel's DFS
+	 * state as NL80211_DFS_USABLE which indicates CAC needs to be
 	 * done before channel usage. This flags is used to drop rx packets.
 	 * during CAC.
 	 */
 	/* TODO Set the flag for other interface types as required */
-	if (arvif->vdev_type == WMI_VDEV_TYPE_AP &&
-	    chandef->chan->dfs_cac_ms &&
-	    chandef->chan->dfs_state == NL80211_DFS_USABLE) {
+	if (arvif->vdev_type == WMI_VDEV_TYPE_AP && ctx->radar_enabled &&
+	    cfg80211_chandef_dfs_usable(ar->hw->wiphy, chandef)) {
 		set_bit(ATH11K_CAC_RUNNING, &ar->dev_flags);
+		dfs_cac_time = cfg80211_chandef_dfs_cac_time(ar->hw->wiphy,
+							     chandef);
 		ath11k_dbg(ab, ATH11K_DBG_MAC,
-			   "CAC Started in chan_freq %d for vdev %d\n",
-			   arg.channel.freq, arg.vdev_id);
+			   "CAC (for %u ms) Started in center_freq %d center_freq1 %d for vdev %d\n",
+			   dfs_cac_time, arg.channel.freq, chandef->center_freq1,
+			   arg.vdev_id);
 	}
 
 	ret = ath11k_mac_set_txbf_conf(arvif);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
