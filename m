Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E380C433F5
	for <ath11k@archiver.kernel.org>; Wed, 12 Jan 2022 02:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vFcyNKfz44q6pUyUphuj0YUwc1xElJFcObXmjOOM2yc=; b=Mi9yM6RDVFxtKe
	9ERuD7vB/ucDnczkrbPaISpfu2vw7KiiFO4Jh6t6kGeqTplwFHD11OqfB5k/OtQsdigVEC2bA7R8X
	KMNlLpmHR/pYswwkPXCzwiAvciTFIBYLX0uPI1MJLx6KQMUkIDALGRVR9vOhn2nLpq3I1TgwCAqBX
	3p+LGDICcmO6824v5RY4Pj/8DQA9VoSdA2+Y4MN5iP6IW1sMoe3SN9TOuLtD83PIlEassdYI0n8k3
	3/1FkbW0SRVX+Nvr5qs+n/dB4GkHcOS+Udgl5YwsPKMUkUS1DuY+2RaS0bw2Jl35w+JL1pPX2E7TT
	PHCLY4sybmV9K7+6F5KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TmB-000xeg-1R; Wed, 12 Jan 2022 02:54:15 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Tm8-000xd4-9V
 for ath11k@lists.infradead.org; Wed, 12 Jan 2022 02:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1641956052; x=1673492052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1tGvm+Lj5qp1GZg2ruRVNnL0FMxNupLJ0HbhidN+eh8=;
 b=T9tTzCHtJpt4Cum00WQi0vzWKEbszgigTDA3GCvscY//cQ2KuXape3Dp
 pSAVrYahjhVfJY7Wk2DurQM+o5/HodlcUzC1bXJ6gquF+csZ0SAJDQMUv
 rPACndfG4qE22cwW13xkN5sgHt0Jag74t2La8xH/5ONEQ/gf8VLqEfnHs U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Jan 2022 18:54:10 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 18:54:10 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 11 Jan 2022 18:54:10 -0800
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 11 Jan 2022 18:54:09 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v2] ath11k: Reconfigure hardware rate for WCN6855 after vdev
 is started
Date: Wed, 12 Jan 2022 10:54:00 +0800
Message-ID: <20220112025400.2222-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_185412_409608_BB28594C 
X-CRM114-Status: GOOD (  12.16  )
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

There is an issue that WCN6855 tries to connect to an AP using
a hardware rate of 1Mb/s , even though the AP has announced
expected rates as [24, 36, 48, 54] in Probe Response frame.

The reason is that WCN6855 firmware clears hardware rate info
of management frames when vdev starts and uses 1Mb/s as default.
To solve it, reconfigure the rate after vdev is started.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
v2:
 Rebased on latest ath.git.

 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 9e88ccca5ca7..4eda15c56b04 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -603,6 +603,7 @@ struct ath11k {
 	struct completion finish_11d_ch_list;
 	bool pending_11d;
 	bool regdom_set_by_user;
+	int hw_rate_code;
 };
 
 struct ath11k_band_cap {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 07f499d5ec92..0d8e20d89988 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2862,6 +2862,11 @@ static void ath11k_recalculate_mgmt_rate(struct ath11k *ar,
 	if (ret)
 		ath11k_warn(ar->ab, "failed to set mgmt tx rate %d\n", ret);
 
+	/* For WCN6855, firmware will clear this param when vdev starts, hence
+	 * cache it here so that we can reconfigure it once vdev starts.
+	 */
+	ar->hw_rate_code = hw_rate_code;
+
 	vdev_param = WMI_VDEV_PARAM_BEACON_RATE;
 	ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id, vdev_param,
 					    hw_rate_code);
@@ -6955,6 +6960,19 @@ static int ath11k_start_vdev_delay(struct ieee80211_hw *hw,
 		return ret;
 	}
 
+	/* Reconfigure hardware rate code since it is cleared by firmware.
+	 */
+	if (ar->hw_rate_code > 0) {
+		u32 vdev_param = WMI_VDEV_PARAM_MGMT_RATE;
+
+		ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id, vdev_param,
+						    ar->hw_rate_code);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to set mgmt tx rate %d\n", ret);
+			return ret;
+		}
+	}
+
 	if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {
 		ret = ath11k_wmi_vdev_up(ar, arvif->vdev_id, 0, ar->mac_addr);
 		if (ret) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
