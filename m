Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77872C433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s2vVtCZIIOk+v5DJ2y0J7TywApy1ZjR0Ohvs4Qz8big=; b=d7HJa6EhWx8eYg
	lq4KH9rrLKKyB2hFSwvd3QPQiVt2RFnRVPOrA4abg5rvx8oaNZIVrgShUqLIxKKt9oSgE48yWIieO
	5an6iaub6xr74bz38SgK458c8wND2F/FXgiO9fxElbYE+jkyZ4GCdxgsbxKIytogSCmrSNzzSm0Bq
	LXNiAwCIc+E5asjc+EumfxOT/3WPfvI53m2PlQlPDk035W9e8MMjPnhciNmNAPa+9jfubF9Ac1HrY
	nu4yMrjPoCbiIDcxVFzH7nT1Ju2SqORUxVc/Ej/Be24lUUrcHkiAqFenCVWGUDv9rglOdKXsAHn9R
	3K6RE6Lr4A9gMo5E9Vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mreXn-000VWO-0p; Mon, 29 Nov 2021 11:09:59 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mreXk-000VVg-IQ
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 11:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638184196; x=1669720196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YOg3epeOYjJtoChU9S5PIQ8Pg5aK5gjy7h4SRE7uFyo=;
 b=zSeQ/2hbdisfGlW2ZdtgykYUrb8EgCHdt97ILPOYOGFgVicB1Q8bSjOU
 28iLh+1qlam6tw74dLlvsP3V5KDBgjyOPP726+Rk8FWIdHq9rD7DHqC+G
 DnHgbYjKUi/73XcwGQnszPdNoBTcvn7PEIqiO3BdP508FXWNC6fy53xsf Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Nov 2021 03:09:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 03:09:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 29 Nov 2021 03:09:54 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 29 Nov 2021 03:09:52 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: change to use dynamic memory for channel list of scan
Date: Mon, 29 Nov 2021 06:09:39 -0500
Message-ID: <20211129110939.15711-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_030956_657374_5FB1BE29 
X-CRM114-Status: GOOD (  14.23  )
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

Currently there are about 60 channels for 6 GHz, then the size of
chan_list in struct scan_req_params which is 40 is not enough to
fill all the channel list of 6 GHz.

Use dynamic memory to save the channel list of scan.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 10 ++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h |  3 +--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 06d20658586a..bad2f720a444 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3500,6 +3500,14 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 	if (req->n_channels) {
 		arg.num_chan = req->n_channels;
+		arg.chan_list = kcalloc(arg.num_chan, sizeof(*arg.chan_list),
+					GFP_KERNEL);
+
+		if (!arg.chan_list) {
+			ret = -ENOMEM;
+			goto exit;
+		}
+
 		for (i = 0; i < arg.num_chan; i++)
 			arg.chan_list[i] = req->channels[i]->center_freq;
 	}
@@ -3518,6 +3526,8 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 						      ATH11K_MAC_SCAN_TIMEOUT_MSECS));
 
 exit:
+	kfree(arg.chan_list);
+
 	if (req->ie_len)
 		kfree(arg.extraie.ptr);
 
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 8e8bac1b7370..35f5432357f5 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3082,7 +3082,6 @@ enum scan_dwelltime_adaptive_mode {
 
 #define WLAN_SCAN_MAX_NUM_SSID          10
 #define WLAN_SCAN_MAX_NUM_BSSID         10
-#define WLAN_SCAN_MAX_NUM_CHANNELS      40
 
 #define WLAN_SSID_MAX_LEN 32
 
@@ -3303,7 +3302,7 @@ struct scan_req_params {
 	u32 num_bssid;
 	u32 num_ssids;
 	u32 n_probes;
-	u32 chan_list[WLAN_SCAN_MAX_NUM_CHANNELS];
+	u32 *chan_list;
 	u32 notify_scan_events;
 	struct wlan_ssid ssid[WLAN_SCAN_MAX_NUM_SSID];
 	struct wmi_mac_addr bssid_list[WLAN_SCAN_MAX_NUM_BSSID];
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
