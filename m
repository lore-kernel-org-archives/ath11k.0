Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DC2C4332F
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 12:17:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D4C60C49
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 12:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21D4C60C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xf9PVGDbLwT2Jrj8vQPUPtdOK2RYduArdvLmZZTbEw4=; b=lQAxjHWH2OCz1R
	Nihi1msFAGpzWnFIRCvNRj71yN9bDTXsfJQ63QrImuPAgb3yAPj58IQFHTvd5Zudz+jZu83mXQPUG
	PcRPsrb/cCZdDw2A61j4MrIfxGMPDBF/HNWXRNN+Tg86Ot479oPkws7pE6LazKbx0ozW9e7pVQVWa
	DYulgidwkEG8zkzvCsag+JqIlpsccx2VQ9Ojau7ASM+HEm3YHc/AW8y++SAYaNp2uQVMtCR6BTUaQ
	m4+eYsVMqGXi1lm21Yr7T8Z/VbKGv08hH8fcNoP4KpnFjK6EjX8cuitNi4LNl5PCXLHPhKLtkGu2Y
	tZXscUNEWpr+IDxFK66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meyv0-00GO8R-3i; Mon, 25 Oct 2021 12:17:34 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meyuy-00GO7K-1p
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 12:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635164252; x=1666700252;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=CoO8fG3XYZh2qdyBkOvtTBsE0q5aPqOPTI8LniuqIwM=;
 b=tDtTPXXrufqxlMmQNlKuwPRj+cBrXVN2IzXltm/ANI3DhzJKmo8nUeZU
 Q2YNDJzW428MB4omTzLI/9q4leVz1TPWufOkMPIoPQBlwoRZYVAmcnZTQ
 rwPyDv3ihiF18RyVq+qv4pMyyf7eLXcZPk7VuZTkBUBuoGO5/i8jMHCi9 g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 05:17:32 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 05:17:32 -0700
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 05:17:29 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>, 
 Lavanya Suresh <lavaks@codeaurora.org>
Subject: [PATCH] ath11k: send proper txpower and maxregpower values to firmware
Date: Mon, 25 Oct 2021 17:47:09 +0530
Message-ID: <1635164229-22880-1-git-send-email-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_051732_191466_F32CEDCE 
X-CRM114-Status: GOOD (  10.02  )
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

Set proper values for max_regpower, max_power, max_antenna_gain as it
is because firmware will convert power values to 0.5dbm steps by
multiplying it with 2.

If txpower is not set, it will lead to cca stuck resulting in latency
issues for QCN9074.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01386-QCAHKSWPL_SILICONZ-1

Co-developed-by: Lavanya Suresh <lavaks@codeaurora.org>
Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
Depends-on: "ath11k: Add ROC support for wide band scan"
---
 drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++------
 drivers/net/wireless/ath/ath11k/wmi.c |  2 ++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3d197d8..e0dae04 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -775,9 +775,9 @@ static int ath11k_mac_monitor_vdev_start(struct ath11k *ar, int vdev_id,
 	arg.channel.chan_radar = !!(channel->flags & IEEE80211_CHAN_RADAR);
 
 	arg.channel.min_power = 0;
-	arg.channel.max_power = channel->max_power * 2;
-	arg.channel.max_reg_power = channel->max_reg_power * 2;
-	arg.channel.max_antenna_gain = channel->max_antenna_gain * 2;
+	arg.channel.max_power = channel->max_power;
+	arg.channel.max_reg_power = channel->max_reg_power;
+	arg.channel.max_antenna_gain = channel->max_antenna_gain;
 
 	arg.pref_tx_streams = ar->num_tx_chains;
 	arg.pref_rx_streams = ar->num_rx_chains;
@@ -6127,9 +6127,9 @@ ath11k_mac_vdev_start_restart(struct ath11k_vif *arvif,
 		ath11k_phymodes[chandef->chan->band][chandef->width];
 
 	arg.channel.min_power = 0;
-	arg.channel.max_power = chandef->chan->max_power * 2;
-	arg.channel.max_reg_power = chandef->chan->max_reg_power * 2;
-	arg.channel.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
+	arg.channel.max_power = chandef->chan->max_power;
+	arg.channel.max_reg_power = chandef->chan->max_reg_power;
+	arg.channel.max_antenna_gain = chandef->chan->max_antenna_gain;
 
 	arg.pref_tx_streams = ar->num_tx_chains;
 	arg.pref_rx_streams = ar->num_rx_chains;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index c428a025..242990e 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2535,6 +2535,8 @@ int ath11k_wmi_send_scan_chan_list_cmd(struct ath11k *ar,
 					    tchan_info->reg_class_id);
 			*reg2 |= FIELD_PREP(WMI_CHAN_REG_INFO2_ANT_MAX,
 					    tchan_info->antennamax);
+			*reg2 |= FIELD_PREP(WMI_CHAN_REG_INFO2_MAX_TX_PWR,
+					    tchan_info->maxregpower);
 
 			ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 				   "WMI chan scan list chan[%d] = %u, chan_info->info %8x\n",
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
