Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68503C433F5
	for <ath11k@archiver.kernel.org>; Thu, 28 Apr 2022 02:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AGTkh3lSQy6vHpokkgz6bmYg1h0Uto1fiuyXvCVrzGU=; b=szHem3G52E7tN5
	XI9PiI3GDqQCH3TcKI++id+VUv91xtRLztFaeOJtJImTAbjPCu4NNLvyt3EyGPoY0mNpA4nbnW+Bi
	uHuowOOM6ZvUnDw7a0W/omPB4uHjfLxzChTEv+ACcD71Jy+zIwfjosjZ/JVYTMawa5gy8UGjGy80+
	ODxZSRDJDDzKNq4TZvhqq4PJiBtRKx2nBRSpEG0Lcp7b/cZyTLHIEAgdFWB7jqawKwUxUHnCuu5dJ
	SO3jvI0KIw7Pz1Zub7lNb0R9nUi7CwT8PlgqCIATsIsF6pnGYpi8CAjoxIRCmxqrbf8yexaGArggu
	oyhu6w32GDZSdT5B2spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njtps-004Otu-AJ; Thu, 28 Apr 2022 02:24:52 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njtpq-004OtE-0j
 for ath11k@lists.infradead.org; Thu, 28 Apr 2022 02:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651112689; x=1682648689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R0XRcNoLTJ9hAnAXRMm/Q9jClpBR+gxUNuH+KRjiYKQ=;
 b=gLit0VAASESFhaDBwfBTyQbRrWWst76nH9Xr1r3dUt33xr2rx+Kg/ta9
 ysTYHfJEzBjk3DftJjnDAanJvBhyHM8s9W9eY1BvqJXqI4Ys9jxFIxSnw
 movoTv+8H63q90hL+SThsU4/642nt0rDrnw3rXfvtzm5eG+V9oxnzmAiN Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Apr 2022 19:24:45 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 19:24:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 19:24:45 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 19:24:44 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: fix warning of not found station for bssid in message
Date: Wed, 27 Apr 2022 22:24:26 -0400
Message-ID: <20220428022426.2927-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_192450_125164_B0A667E8 
X-CRM114-Status: GOOD (  11.90  )
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

When test connect/disconnect to an AP frequently with WCN6855, sometimes
it show below log.

[  277.040121] wls1: deauthenticating from 8c:21:0a:b3:5a:64 by local choice (Reason: 3=DEAUTH_LEAVING)
[  277.050906] ath11k_pci 0000:05:00.0: wmi stats vdev id 0 mac 00:03:7f:29:61:11
[  277.050944] ath11k_pci 0000:05:00.0: wmi stats bssid 8c:21:0a:b3:5a:64 vif         pK-error
[  277.050954] ath11k_pci 0000:05:00.0: not found station for bssid 8c:21:0a:b3:5a:64
[  277.050961] ath11k_pci 0000:05:00.0: failed to parse rssi chain -71
[  277.050967] ath11k_pci 0000:05:00.0: failed to pull fw stats: -71
[  277.050976] ath11k_pci 0000:05:00.0: wmi stats vdev id 0 mac 00:03:7f:29:61:11
[  277.050983] ath11k_pci 0000:05:00.0: wmi stats bssid 8c:21:0a:b3:5a:64 vif         pK-error
[  277.050989] ath11k_pci 0000:05:00.0: not found station for bssid 8c:21:0a:b3:5a:64
[  277.050995] ath11k_pci 0000:05:00.0: failed to parse rssi chain -71
[  277.051000] ath11k_pci 0000:05:00.0: failed to pull fw stats: -71
[  278.064050] ath11k_pci 0000:05:00.0: failed to request fw stats: -110

Reason is:
When running disconnect operation, sta_info removed from local->sta_hash
by __sta_info_destroy_part1() from __sta_info_flush(), after this,
ieee80211_find_sta_by_ifaddr() which called by
ath11k_wmi_tlv_fw_stats_data_parse() and ath11k_wmi_tlv_rssi_chain_parse()
cannot find this station, then failed log printed.

steps are like this:
1. when disconnect from AP, __sta_info_destroy() called __sta_info_destroy_part1()
and __sta_info_destroy_part2().

2. in __sta_info_destroy_part1(),  it has "sta_info_hash_del(local, sta)"
and "list_del_rcu(&sta->list)", it will remove the ieee80211_sta from the
list of ieee80211_hw.

3. in __sta_info_destroy_part2(), it called drv_sta_state()->ath11k_mac_op_sta_state(),
then peer->sta is clear at this moment.

4. in __sta_info_destroy_part2(), it then called sta_set_sinfo()->drv_sta_statistics()
->ath11k_mac_op_sta_statistics(), then WMI_REQUEST_STATS_CMDID sent to firmware.

5. WMI_UPDATE_STATS_EVENTID reported from firmware, at this moment, the
ieee80211_sta can not be found again because it has remove from list in
step2 and also peer->sta is clear in step3.

6. in __sta_info_destroy_part2(), it then called cleanup_single_sta()->
sta_info_free()->kfree(sta), at this moment, the ieee80211_sta is freed
in memory, then the failed log will not happen because function
ath11k_mac_op_sta_state() will not be called.

Actually this print log is not a real error, it is only to skip parse the
info, so change to skip print by default debug setting.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3c0ac1e29479..3b7a6d2f8f2c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5794,9 +5794,9 @@ static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
 					   arvif->bssid,
 					   NULL);
 	if (!sta) {
-		ath11k_warn(ab, "not found station for bssid %pM\n",
-			    arvif->bssid);
-		ret = -EPROTO;
+		ath11k_dbg(ab, ATH11K_DBG_WMI,
+			   "not found station of bssid %pM for rssi chain\n",
+			   arvif->bssid);
 		goto exit;
 	}
 
@@ -5894,8 +5894,9 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
 					   "wmi stats vdev id %d snr %d\n",
 					   src->vdev_id, src->beacon_snr);
 			} else {
-				ath11k_warn(ab, "not found station for bssid %pM\n",
-					    arvif->bssid);
+				ath11k_dbg(ab, ATH11K_DBG_WMI,
+					   "not found station of bssid %pM for vdev stat\n",
+					   arvif->bssid);
 			}
 		}
 

base-commit: 3637b73b8e805d011202e2bf10947f2d206695d4
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
