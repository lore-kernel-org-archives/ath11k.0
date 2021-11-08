Return-Path: <SRS0=XEXT=P3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE7CC433F5
	for <ath11k@archiver.kernel.org>; Mon,  8 Nov 2021 12:38:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1FA761288
	for <ath11k@archiver.kernel.org>; Mon,  8 Nov 2021 12:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1FA761288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7BCUXqBrqc7D1/9Y0oCV1nH2gZZz5yqwJm/vNNi8BY=; b=LY7Hy39phe+zNM
	HdV1mFx/ElTU+iPlxy3KX47Z02WX6nfqFnmz1VRx4JEDBBf9stJrRuOfC19SXtJSxqIOXvCYJp+yJ
	I6gGu9GzNAEFfB40lf2sdRVWz+ElEw3gjPi1G0H4S+xKSHodZXIdqNTtqaWE63mn+FjyEqwpgdzSd
	cb+a/oNpH51JrTueb/6AvqJhw/83++NttuPhlKRzS0IkeMyGLVdBJphhYq2fdkgx1HM/7krwkF1Nj
	4Scbfmt1KDsV7SAou94h2VwcHDotKOMuBIW8jDlCY4TPuprW22iUfyo6M4fD9nhlxABeW+5k2NzGM
	ELTQeNl6L+jvY05iN91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk3v6-00GOdS-T5; Mon, 08 Nov 2021 12:38:40 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk3v3-00GOcG-4i
 for ath11k@lists.infradead.org; Mon, 08 Nov 2021 12:38:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636375113; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YSgQqZ+Hm9QjVo2U12v1rsGze0V5cI8AQnix9P72WSI=;
 b=DxBpD/JTBXIVSu9HVxx5wHPd2zJAaUmPi7vVhKOSqM6QYqnOhr1PrH+GqiwPSOGDhi4D+cX0
 +njmRdVeoivmm2I+6rFrhh+ZG4F1SIrFy92hevCQI1mdkiWqocWdSuf/BQ9QpQuoa9hVNSb+
 4cdepPEJ/w5JgOqNH5qA6nKNcKU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61891a48facd20d795ba0a33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 12:38:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2E624C43460; Mon,  8 Nov 2021 12:38:32 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AD601C4360D;
 Mon,  8 Nov 2021 12:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AD601C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 2/2] ath11k: enable 802.11 power save mode in station mode
Date: Mon,  8 Nov 2021 14:38:26 +0200
Message-Id: <20211108123826.8463-2-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211108123826.8463-1-kvalo@codeaurora.org>
References: <20211108123826.8463-1-kvalo@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_043837_280932_E23C2070 
X-CRM114-Status: GOOD (  19.65  )
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

From: Carl Huang <cjhuang@codeaurora.org>

To reduce power consumption enable 802.11 power save mode in station mode. This
allows both radio and CPU to sleep more.

Only enable the mode on QCA6390 and WCN6855, it's unknown how other hardware
families support this feature.

To test that power save mode is running run "iw dev wls1 set power_save off",
check there is no NULL Data frame seen by a sniffer. And run "iw dev wls1 set power_save
on" and check there is a NULL Data frame in sniffer.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---

v2:

* improve commit log

* use existing ath11k_wmi_pdev_set_ps_mode()

* rename protocol_ps to supports_sta_ps

* cosmetic changes

 drivers/net/wireless/ath/ath11k/core.c |  5 ++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 87 ++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index b5a2af3ffc3e..a6c0d5ad7f9b 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -76,6 +76,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_monitor = true,
 		.supports_shadow_regs = false,
 		.idle_ps = false,
+		.supports_sta_ps = false,
 		.cold_boot_calib = true,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
@@ -125,6 +126,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_monitor = true,
 		.supports_shadow_regs = false,
 		.idle_ps = false,
+		.supports_sta_ps = false,
 		.cold_boot_calib = true,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
@@ -173,6 +175,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_monitor = false,
 		.supports_shadow_regs = true,
 		.idle_ps = true,
+		.supports_sta_ps = true,
 		.cold_boot_calib = false,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
@@ -221,6 +224,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_monitor = true,
 		.supports_shadow_regs = false,
 		.idle_ps = false,
+		.supports_sta_ps = false,
 		.cold_boot_calib = false,
 		.supports_suspend = false,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
@@ -269,6 +273,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.supports_monitor = false,
 		.supports_shadow_regs = true,
 		.idle_ps = true,
+		.supports_sta_ps = true,
 		.cold_boot_calib = false,
 		.supports_suspend = true,
 		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 31d234a51c79..2f1e10b7cc17 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -240,6 +240,7 @@ struct ath11k_vif {
 	bool is_started;
 	bool is_up;
 	bool spectral_enabled;
+	bool ps;
 	u32 aid;
 	u8 bssid[ETH_ALEN];
 	struct cfg80211_bitrate_mask bitrate_mask;
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 19223d36846e..1c298c24b617 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -170,6 +170,7 @@ struct ath11k_hw_params {
 	bool supports_monitor;
 	bool supports_shadow_regs;
 	bool idle_ps;
+	bool supports_sta_ps;
 	bool cold_boot_calib;
 	bool supports_suspend;
 	u32 hal_desc_sz;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f6511fc8ae8c..82fd44f34df2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1049,6 +1049,83 @@ static int ath11k_mac_monitor_stop(struct ath11k *ar)
 	return 0;
 }
 
+static int ath11k_mac_vif_setup_ps(struct ath11k_vif *arvif)
+{
+	struct ath11k *ar = arvif->ar;
+	struct ieee80211_vif *vif = arvif->vif;
+	struct ieee80211_conf *conf = &ar->hw->conf;
+	enum wmi_sta_powersave_param param;
+	enum wmi_sta_ps_mode psmode;
+	int ret;
+	int timeout;
+	bool enable_ps;
+
+	lockdep_assert_held(&arvif->ar->conf_mutex);
+
+	if (arvif->vif->type != NL80211_IFTYPE_STATION)
+		return 0;
+
+	enable_ps = arvif->ps;
+
+	if (!arvif->is_started) {
+		/* mac80211 can update vif powersave state while disconnected.
+		 * Firmware doesn't behave nicely and consumes more power than
+		 * necessary if PS is disabled on a non-started vdev. Hence
+		 * force-enable PS for non-running vdevs.
+		 */
+		psmode = WMI_STA_PS_MODE_ENABLED;
+	} else if (enable_ps) {
+		psmode = WMI_STA_PS_MODE_ENABLED;
+		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
+
+		timeout = conf->dynamic_ps_timeout;
+		if (timeout == 0) {
+			/* firmware doesn't like 0 */
+			timeout = ieee80211_tu_to_usec(vif->bss_conf.beacon_int) / 1000;
+		}
+
+		ret = ath11k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
+						  timeout);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to set inactivity time for vdev %d: %i\n",
+				    arvif->vdev_id, ret);
+			return ret;
+		}
+	} else {
+		psmode = WMI_STA_PS_MODE_DISABLED;
+	}
+
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac vdev %d psmode %s\n",
+		   arvif->vdev_id, psmode ? "enable" : "disable");
+
+	ret = ath11k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
+	if (ret) {
+		ath11k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
+			    psmode, arvif->vdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ath11k_mac_config_ps(struct ath11k *ar)
+{
+	struct ath11k_vif *arvif;
+	int ret = 0;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list) {
+		ret = ath11k_mac_vif_setup_ps(arvif);
+		if (ret) {
+			ath11k_warn(ar->ab, "failed to setup powersave: %d\n", ret);
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 {
 	struct ath11k *ar = hw->priv;
@@ -2942,6 +3019,16 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		ath11k_mac_txpower_recalc(ar);
 	}
 
+	if (changed & BSS_CHANGED_PS &&
+	    ar->ab->hw_params.supports_sta_ps) {
+		arvif->ps = vif->bss_conf.ps;
+
+		ret = ath11k_mac_config_ps(ar);
+		if (ret)
+			ath11k_warn(ar->ab, "failed to setup ps on vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+	}
+
 	if (changed & BSS_CHANGED_MCAST_RATE &&
 	    !ath11k_mac_vif_chan(arvif->vif, &def)) {
 		band = def.chan->band;
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
