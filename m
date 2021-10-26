Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2A0C433F5
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C4A60238
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44C4A60238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/QO2pVvknEbsidMGcZgHae2FMH3EVE/kHVw3TN8W/8=; b=2IPN3LX/ksZmmn
	o2TvmCHERErskKg0XqpXXAhilaWDf5BbYIlpgoHuTpcel65KFwuAh6gUaErwQGVN4YT87UJhYhMe1
	MLTCjJUzjI8VsUodNIgpJ+Ob/+MgSRweOy/aBaEK6o22ofbUtVsa1vWvkDOipaHBAw3lbzotFyAFC
	AmPg5YLwBatxuel3QK7H0cnOk7OT5F9gmx5TatatMdK5U1yfMEoOS++yiQiXMEWw9ihdAveQvt1ca
	KqIeZKsijxHs0fB3b4fJXXX+6SCDWqdpyIgB4Zq5706HkAs0/RTNlQiAUuEPydpmbui499rUAFwQG
	YPPf2PXKOTR1iafK8ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfKV7-001chY-J1; Tue, 26 Oct 2021 11:20:17 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfKUz-001cRx-BX
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 11:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635247209; x=1666783209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ZhUzRgAxpp99YUc6DckpZ0gEBQu58giLRw4uQmyJXE=;
 b=zELk4TzqYixmi6UyTMlEvPumVNUPaM6VtuuiVJ6ohg8Yjz6rN1dW59Nn
 k30UfWiFGUxQtPBl8Fe4xSmgJb1W0Ggd5FoyYn11Zg4ZKfnQiXWLTUlxq
 5kTFVAbIgRWTvzZ1CkCYWmUcF191g787pVYAu3M5Z24ktO8H3HDrlGePJ k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 04:20:09 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 04:20:09 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 26 Oct 2021 04:20:07 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 15/15] ath11k: send TPC power to firmware for 6 GHz station
Date: Tue, 26 Oct 2021 07:19:13 -0400
Message-ID: <20211026111913.7346-16-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026111913.7346-1-quic_wgong@quicinc.com>
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_042009_481888_BFD100F2 
X-CRM114-Status: GOOD (  11.04  )
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

When station is connected to a 6 GHz AP, it has 2 way to configure
the power limit to firmware. The first way is to send 2 wmi command
WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
firmware which include more parameters for power control.

The first way is disabled in previous patch
"ath11k: discard BSS_CHANGED_TXPOWER when EXT_TPC_REG_SUPPORT for 6 GHz".

Prepare the parameter for wmi command WMI_VDEV_SET_TPC_POWER_CMDID and
send the firmware after vdev start response success from firmware, it
is for the second way of power control.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 301e08a85f47..88c18ffee7a3 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5312,6 +5312,12 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 		return ret;
 	}
 
+	if (ath11k_mac_station_support_tpc(ar, arvif, chandef)) {
+		ath11k_mac_fill_reg_tpc_info(ar, arvif->vif, &arvif->chanctx);
+		ath11k_wmi_send_vdev_set_tpc_power(ar, arvif->vdev_id,
+						   &arvif->reg_tpc_info);
+	}
+
 	ar->num_started_vdevs++;
 	ath11k_dbg(ab, ATH11K_DBG_MAC,  "vdev %pM started, vdev_id %d\n",
 		   arvif->vif->addr, arvif->vdev_id);
@@ -6098,7 +6104,7 @@ ath11k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 		if (power_type == IEEE80211_REG_UNSET_AP)
 			power_type = IEEE80211_REG_LPI_AP;
 		ath11k_reg_handle_chan_list(ab, reg_info, power_type);
-
+		arvif->chanctx = *ctx;
 		ath11k_mac_parse_tx_pwr_env(ar, vif, ctx);
 	}
 
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
