Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7909C433F5
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PtiT43n343jhkpbAdf6Clc8Ejh/p6PVF1D0I6D3r2w=; b=YE6DI/1GFNHPp0
	dOvfIgCF+M3vL+7R3clIFlot9OTwJxcAzL/fO0liO2bUwL4qoJn9veQmXHNh3a1lG2dzvjh3HiZ+b
	6h92qPmXuaF2cUjyIO9MezCa3G0Wv9WIyuvaxNhtRtDccJX7grzWxfu9S2msav18ED7Izs10hQisf
	WzNcKdosj2Pt7JoIPHkMcz+UyQE+utv5RjMDh4JuxsXJA8Y/oRcYzKBqfH38PdDlEUWy5zOYA4vfb
	f7ku9qEfguU6wqpZnd1R0uEqDrFrD3gqQDYJL+gKLMBiNnttG8dQJHhRO53PkRUcIN7yB8z13UEKY
	2LOLPPiJ3df5I2ACqKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfRk-006hWH-B7; Mon, 30 May 2022 13:28:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfQt-006h0x-4J
	for ath11k@lists.infradead.org; Mon, 30 May 2022 13:27:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3601B80DA8;
	Mon, 30 May 2022 13:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499C2C36AE9;
	Mon, 30 May 2022 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917260;
	bh=MQrjqXErBDcH5v3vhgMjiO1PsCtlzbFiX1PZbys4/vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pY6i3qKzFO7g45zu2rWn1VBukt6piBW6Rr5tOhyZZWde4B7hUlPwo0OLlTo2D5x+P
	 zcqcDaGkhp9ndA1u8Aiuhz2P5IXgyqLks8cR3WCBTetgBBv8m5yBZvZ+2bUWtEIpY/
	 4vYFd4EF1/NO68WaPDZsZaZZ1iLqSDwa3u05yTOfNRVd5Vl/+WAQqiswjlYgTF+86R
	 bWvZRvdxcS9r5BFyLTNnqZ7+R2CQdw6kGiWuYdNZQMZhDpstH/mGCPkoFU7E5T5tSf
	 o0u5kwA7PsqsjSN/8+UnNRPfcdf5gBbxq5OiElV5QaZktYJd2BW6FnEAOdzsj1eJqc
	 2EaSpNAdYKz2A==
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
Subject: [PATCH AUTOSEL 5.18 073/159] ath11k: fix warning of not found station for bssid in message
Date: Mon, 30 May 2022 09:22:58 -0400
Message-Id: <20220530132425.1929512-73-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_062743_542952_D43F9BB0 
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
index 2751fe8814df..0900f75eef20 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5789,9 +5789,9 @@ static int ath11k_wmi_tlv_rssi_chain_parse(struct ath11k_base *ab,
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
 
@@ -5889,8 +5889,9 @@ static int ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
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
