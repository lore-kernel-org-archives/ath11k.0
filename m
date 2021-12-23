Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B23BC433EF
	for <ath11k@archiver.kernel.org>; Thu, 23 Dec 2021 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZA+1YaCe+q/03mwpMDP71Vs4nAzdIztGr+/qadzz8SY=; b=4nB9G2b5ZUmeZH
	xaROnFKCBSxgdbF18bermdlgx3P9CVNydxYgPR4WTVMyrRezNnGL+PhPSdBz3hjolxt+Ok+ZehKmZ
	FJMoOK0hjgWCcV7/jYTHFHOhiHj9+vQGjJTqwo6K49V0e3h0xAjdYj3xlOrF2opbSfq85WV912xao
	nNgqvS3sl4nhazU7yCo7PIHCMz3Zt9qt+meBmdm/YDPnvPucp+XKiLriXM5btKfe8cUSQgrhk3S0q
	SvxA8v1AK4nT4m1QOPlaTphoQDABHO2cjQibZlzTt0Mql5g2/KB68D0FAHoNOedygtIz4DFsl7B3I
	9Bjm7NW5/Y8PNvfdeFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0LUA-00CWGt-A4; Thu, 23 Dec 2021 10:38:10 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0LU6-00CWFl-Mb
 for ath11k@lists.infradead.org; Thu, 23 Dec 2021 10:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640255886; x=1671791886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QYRlgldjCKzZ8Ggxua9DjI69vJbVYjPEQ4lPwiop5SM=;
 b=J63hGV+E7mdrbl3l6Y9sAbMJz5lBTirddZlh5SGr5WIEqYpvDmXeD2rM
 6mFXFx3C/M7XU/Vipyjhw9MW8OE6p8xRxLq1mpBkr6EmHReR6GU6ajj7h
 kBwgjnRsuR3ulZ4n5wiH8uU+YwkH9WqSIZ1VML2cc42cuDN7H2ni6v5gN 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Dec 2021 02:38:05 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 02:38:04 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 23 Dec 2021 02:38:04 -0800
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 23 Dec 2021 02:38:03 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] ath11k: Reconfigure hardware rate for WCN6855 after vdev is
 started
Date: Thu, 23 Dec 2021 18:37:28 +0800
Message-ID: <20211223103728.85022-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_023806_827975_6EFF54BE 
X-CRM114-Status: GOOD (  11.22  )
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
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 0103cfd0508d..18740cf2dc44 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -587,6 +587,7 @@ struct ath11k {
 #endif
 	bool dfs_block_radar_events;
 	struct ath11k_thermal thermal;
+	int hw_rate_code;
 };
 
 struct ath11k_band_cap {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 0050e2c84888..d1c51010e55a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2760,6 +2760,11 @@ static void ath11k_recalculate_mgmt_rate(struct ath11k *ar,
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
@@ -6595,6 +6600,19 @@ static int ath11k_start_vdev_delay(struct ieee80211_hw *hw,
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
