Return-Path: <SRS0=qRpf=PP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D88DC433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Oct 2021 09:38:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF98C60EDF
	for <ath11k@archiver.kernel.org>; Wed, 27 Oct 2021 09:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF98C60EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewZ+RvoDtPA92XObRW6zuKhHa/6Td51jbFYnzTqWJpU=; b=L0yu0hRDj47Pas
	XME5ojiExEfbcpkV+wHSZGp1oWsFZRNhCMrPjZV3twWNteFjeGhVkVOMsmXyFabdVLvE1lhQ2K5dF
	hQpFY9suxJxKNLapWYm2RvSQT+aQbfXF2QDZpBb9RhcYQtS6DzZqyaUbwN1OqzEHkrebmvGcVr1JF
	en4xb5J7Na6MM6k7Dy3FmxHXPHy7z9DFCVbW/P+yEI3j6jOl6K2eB4+AwfvM1yRT2Sx+kujOU0NXS
	B3/jVER2heowZfgpuuZ9l6o0wm8NpDn6s19FTFcXoCvyCaxowNkIe9Rz+Nrr24thVPurdrlNuzbJL
	0/X9nVC7R7HLwdO+Vkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffON-004SCo-JD; Wed, 27 Oct 2021 09:38:43 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffOL-004SCK-5t
 for ath11k@lists.infradead.org; Wed, 27 Oct 2021 09:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635327521; x=1666863521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OdC7LkPyp5AWTA7ablp9ZhOZuD4oCYcrlSj/zgD70NE=;
 b=SF9MgelclQdneD61XTpI9Kn4L0QvCCOSQ77ulGK2vrQ0syRbkiQia837
 jnhnDUksC2oBSQRTJuaqI4XkS0PBajRO4oVq1KoGOApBq6hwXtnLgjFQ+
 Lu6Urhx03PYzgdvJw92nmbtMQt5Z2sKu2ZQ6DmN00joyuYH33/ePrdwDL w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 27 Oct 2021 02:38:41 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 02:38:41 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 02:38:39 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: move peer delete after vdev stop of station for
 QCA6390 and WCN6855
Date: Wed, 27 Oct 2021 05:38:25 -0400
Message-ID: <20211027093825.12167-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_023841_307512_1BF95663 
X-CRM114-Status: GOOD (  10.42  )
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

When station connect to AP, the wmi command sequence is:
peer_create->vdev_start->vdev_up
and sequence of station disconnect fo AP is:
peer_delete->vdev_down->vdev_stop
The sequence of disconnect is not opposite of connect, it caused firmware
crash when it handle wmi vdev stop cmd when the AP is support TWT of
802.11 ax, because firmware need access the bss peer for vdev stop cmd.

kernel: [  390.438564] ath11k_pci 0000:05:00.0: wmi cmd send 0x6001 ret 0
kernel: [  390.438567] ath11k_pci 0000:05:00.0: WMI peer create vdev_id 0 peer_addr c4:04:15:3b:e0:39
kernel: [  390.472724] ath11k_pci 0000:05:00.0: mac vdev 0 start center_freq 2437 phymode 11ax-he20-2g
kernel: [  390.472731] ath11k_pci 0000:05:00.0: wmi cmd send 0x5003 ret 0
kernel: [  390.560849] ath11k_pci 0000:05:00.0: wmi cmd send 0x5005 ret 0
kernel: [  390.560850] ath11k_pci 0000:05:00.0: WMI mgmt vdev up id 0x0 assoc id 1 bssid c4:04:15:3b:e0:39

kernel: [  399.432896] ath11k_pci 0000:05:00.0: WMI peer delete vdev_id 0 peer_addr c4:04:15:3b:e0:39
kernel: [  399.432902] ath11k_pci 0000:05:00.0: wmi cmd send 0x6002 ret 0
kernel: [  399.441380] ath11k_pci 0000:05:00.0: wmi cmd send 0x5007 ret 0
kernel: [  399.441381] ath11k_pci 0000:05:00.0: WMI vdev down id 0x0
kernel: [  399.454681] ath11k_pci 0000:05:00.0: wmi cmd send 0x5006 ret 0
kernel: [  399.454682] ath11k_pci 0000:05:00.0: WMI vdev stop id 0x0

The opposite sequence of disconnect should be:
vdev_down->vdev_stop->peer_delete

This patch change the sequence of disconnect for station as above
opposite sequence for QCA6390, firmware not crash again with this patch.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 47d0dc69463a..ad3510bec4da 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3406,6 +3406,10 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		    new_state == IEEE80211_STA_NOTEXIST)) {
 		ath11k_dp_peer_cleanup(ar, arvif->vdev_id, sta->addr);
 
+		if (ar->ab->hw_params.vdev_start_delay &&
+		    vif->type == NL80211_IFTYPE_STATION)
+			goto free;
+
 		ret = ath11k_peer_delete(ar, arvif->vdev_id, sta->addr);
 		if (ret)
 			ath11k_warn(ar->ab, "Failed to delete peer: %pM for VDEV: %d\n",
@@ -3427,6 +3431,7 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 		spin_unlock_bh(&ar->ab->base_lock);
 
+free:
 		kfree(arsta->tx_stats);
 		arsta->tx_stats = NULL;
 
@@ -6313,6 +6318,19 @@ ath11k_mac_op_unassign_vif_chanctx(struct ieee80211_hw *hw,
 
 	arvif->is_started = false;
 
+	if (ab->hw_params.vdev_start_delay &&
+	    arvif->vdev_type == WMI_VDEV_TYPE_STA) {
+		ret = ath11k_peer_delete(ar, arvif->vdev_id, arvif->bssid);
+		if (ret)
+			ath11k_warn(ar->ab,
+				    "delete peer fail: %pM for VDEV: %d\n",
+				    arvif->bssid, arvif->vdev_id);
+		else
+			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+				   "removed peer after vdev stop: %pM for VDEV: %d\n",
+				   arvif->bssid, arvif->vdev_id);
+	}
+
 	if (ab->hw_params.vdev_start_delay &&
 	    arvif->vdev_type == WMI_VDEV_TYPE_MONITOR)
 		ath11k_wmi_vdev_down(ar, arvif->vdev_id);
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
