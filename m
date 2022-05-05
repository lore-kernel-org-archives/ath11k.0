Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042FCC433F5
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 03:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rzn9NpcH6UkWaVOSb51iTS4J3nfGXpzL98U0o0e1XIs=; b=0PpvphTmNBvidu
	UdVRiEh/XCD0CCdbEr5P0Viph1OFYMoqms5cQh1T9IUFidizqikOrqbmbJJgA/XQbNofyX6yAxmjG
	Hc7fA3TiakOyf4EqdN9sZp4IVgR4tzhdz34ABQzl44gPgBDYpOo8TUMutpwydpkWKNGkAVuTwYoQJ
	CJxoUxTCaCtBRKu/BxhAJC4RMXjOj7xCFS6YdwlI5w+ek/Y7fDN0lztIST1PgVtXW1GUiPsAfaoAH
	b8ayejlyle5ePP4goXUOTNGlyJxNDnSn8adWRt3ZcyIdvpuaCqSeS1KtNIDYQgS5/9Dc40lndQn46
	TMsu+SB14CKpDfuPGlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmSSb-00DpW3-CF; Thu, 05 May 2022 03:47:25 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmSSZ-00DpVb-4s
 for ath11k@lists.infradead.org; Thu, 05 May 2022 03:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651722443; x=1683258443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jefepVVl/sNPBVzmZrKR8tfQDsdCIXmbz+YBjz/5+kI=;
 b=OzigomHXnmF3FTAzhRTt6ILm+zTcl/a4l/RQulnmSgEjdR6AyTUWjmLh
 Saj49wDFzucQeDVu5kCMmsJSh93AJsbCNLyN+4qzX1M7WaixGH/E/Yg/i
 huQQaUmoz2BUONrmXoSIoMB1etsxKGBhvkrpIs8U7iUf2LUrLR1Szn6DH U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 04 May 2022 20:47:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 20:47:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 20:47:14 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 20:47:13 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: reset 11d state in process of recovery
Date: Wed, 4 May 2022 23:46:36 -0400
Message-ID: <20220505034636.29582-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_204723_259450_9FD13ABC 
X-CRM114-Status: GOOD (  13.98  )
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

When doing simulate_fw_crash operation periodically with a short interval
time such as 10 seconds, it is easy happened WMI command timed out for
WMI_SCAN_CHAN_LIST_CMDID in ath11k_reg_update_chan_list().

log:
[42287.610053] ath11k_pci 0000:01:00.0: wmi command 12291 timeout
[42287.610064] ath11k_pci 0000:01:00.0: failed to send WMI_SCAN_CHAN_LIST cmd
[42287.610073] ath11k_pci 0000:01:00.0: failed to perform regd update : -11

Note that this issue does not occur with a longer interval such as 20 seconds.

The reason the issue occurs with a shorter interval is the following steps:
1) Upon initial boot, or after device recovery, the initial hw scan plus
the 11d scan will run, and when 6 GHz support is present, these scans
can take up to 12 seconds to complete, so ath11k_reg_update_chan_list()
is still waiting the completion of ar->completed_11d_scan.
2) If a simulate_fw_crash operation is received during this time, those
scans do not complete, and ath11k_core_pre_reconfigure_recovery()
complete the ar->completed_11d_scan, then ath11k_reg_update_chan_list()
wakeup and start to send WMI_SCAN_CHAN_LIST_CMDID, but firmware is crashed
at this moment, so wmi timed out occur.

To address this issue, reset the 11d state during device recovery so that
WMI_SCAN_CHAN_LIST_CMDID does not timed out for short interval time such
as 10 seconds.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Fixes: 1f682dc9fb37 ("ath11k: reduce the wait time of 11d scan and hw scan while add interface")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 5 +++++
 drivers/net/wireless/ath/ath11k/reg.c  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7e074b7716e7..5dfac931f70b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1499,6 +1499,7 @@ static void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 
 		ieee80211_stop_queues(ar->hw);
 		ath11k_mac_drain_tx(ar);
+		ar->state_11d = ATH11K_11D_IDLE;
 		complete(&ar->completed_11d_scan);
 		complete(&ar->scan.started);
 		complete(&ar->scan.completed);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index da994d89d69d..44a3a9b1c29f 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6155,6 +6155,11 @@ void ath11k_mac_11d_scan_stop(struct ath11k *ar)
 	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac stop 11d vdev id %d\n",
 		   ar->vdev_id_11d_scan);
 
+	if (ar->state_11d == ATH11K_11D_PREPARING) {
+		ar->state_11d = ATH11K_11D_IDLE;
+		complete(&ar->completed_11d_scan);
+	}
+
 	if (ar->vdev_id_11d_scan != ATH11K_11D_INVALID_VDEV_ID) {
 		vdev_id = ar->vdev_id_11d_scan;
 
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 79ac2142317a..7ee3ff69dfc8 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -139,6 +139,9 @@ int ath11k_reg_update_chan_list(struct ath11k *ar, bool wait)
 			   "reg hw scan wait left time %d\n", left);
 	}
 
+	if (ar->state == ATH11K_STATE_RESTARTING)
+		return 0;
+
 	bands = hw->wiphy->bands;
 	for (band = 0; band < NUM_NL80211_BANDS; band++) {
 		if (!bands[band])

base-commit: 3637b73b8e805d011202e2bf10947f2d206695d4
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
