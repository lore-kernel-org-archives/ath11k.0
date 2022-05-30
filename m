Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4C0C433EF
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhIp5jDqPq2ghqBC+E0Kd9D3zRZ+AyePoMQAVQnF64o=; b=QDXSLh2o/TM9cS
	xsvAXFo+Y4xkFt4Ruw90lds3hNg7nrWoqnRqjqNzOuGy3ejF4YslvDUbWyK0LcZWF30858asVJZm4
	q2/UQXYBzu5ZUJ7CIbfmcgiwVa9W+VMN08PN0sb4h6fQ8Fjw6W7ZYZ7rnWqftN9EE8PIAuJxl3DbV
	pat71NoOV44GohmT8xFy2jSdSgEb+EsGRXs3JA9cmfAuZm1VHptaAYiJgzsKEoFDB/WohCRPkLHV8
	QCUWBWP+GkcrDpWPj8z8PuuKlxUDF5xeHff/RPF78VJhSC03DQKaJE3YWPJyDiE2UbJXBFHmsujfO
	Dx5GqLucwyqvAWIy1ZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfi4-006rCI-H8; Mon, 30 May 2022 13:45:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfXi-006lBJ-SK
	for ath11k@lists.infradead.org; Mon, 30 May 2022 13:34:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55B44B80DB4;
	Mon, 30 May 2022 13:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7F4C3411E;
	Mon, 30 May 2022 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917684;
	bh=a6ZbcZ0pyviOct835Ub4+gXpK5eWBK1Jv1/OF+CY8kE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sNVSZm/XxGzJHSuqwDrdzDJzk0yIgyOvlq7RBHUU+g+pAcnW/o9iSt0lja5ZnuVbe
	 B6rLmoNnnOMt5w0Dlbj9TrkL/IRKuXi9SU4NDGA+naYHllp+qe1bhOKGrfxhmIOs+E
	 wr53G+3/qR+viW0figuO2/LPFZ+X0pv/WB85skHVtOAPUEavOIIUcDCXNNTa6uGX55
	 VIRjBFjZrf00+S5uBAgl0F28UCd/teHHWE7IrhdJqYhIY5MOtNbUP0+Pt8HdTEEcdp
	 x8xSy+VrDdeePGPbIeF6A3XrHf0Bf+vnYoBBiuqfwap1eZfFf93dPirXuuQmjGBMqa
	 j2qtbeo/vC6yg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wen Gong <quic_wgong@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 061/135] ath11k: fix warning of not found station for bssid in message
Date: Mon, 30 May 2022 09:30:19 -0400
Message-Id: <20220530133133.1931716-61-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_063447_288638_718E7850 
X-CRM114-Status: GOOD (  14.31  )
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

From: Wen Gong <quic_wgong@quicinc.com>

[ Upstream commit 7330e1ec9748948177830c6e1a13379835d577f9 ]

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
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20220428022426.2927-1-quic_wgong@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 22921673e956..4ad3fe7d7d1f 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5616,9 +5616,9 @@ static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
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
 
@@ -5716,8 +5716,9 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
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
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
