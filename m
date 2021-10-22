Return-Path: <SRS0=5A3f=PK=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783DFC433EF
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 12:39:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E2756109E
	for <ath11k@archiver.kernel.org>; Fri, 22 Oct 2021 12:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E2756109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gxhKek1O1oc8NfSRUIRczxI9N/g+OjBOS9ZT5QTfW8=; b=Lg0yVQUFWkp1rV
	nml+3H/DIyqvwsDuxprXz0K7K6g9EKth4qqOYC+mQKVlL7DWsM5MXh13dD72R7TwfLIWdWx0sXLEI
	XfjgjimzVHoky98ZyUynCZ+unzYMGeT+Wd8Gc0l3L4k5CzVCSPopX0dt7Z6xBpkg+tKeLeMceVnr8
	37ypmW38QXy8gSnG9CVlEwrRORxEhqVqSfx0gsKFws6Pz4kYgEc69sxgbDzs8rc+BEKM2HmqlwmXx
	63L2W9TViGa6+eGjh6snB6806xcGflvTxcNvEfDKgwk6MSj/D7FiOljSnHPhK8yDl4UXsYN2Rluae
	u0TNqZrl08iGVD4WOtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtpt-00AuDa-Uc; Fri, 22 Oct 2021 12:39:49 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtpl-00Au8F-KU
 for ath11k@lists.infradead.org; Fri, 22 Oct 2021 12:39:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634906385; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=hh1AyxhZ+WchS2mlgkOtAfyd302n9OhM6AjD211FV7M=;
 b=V1qj/PFzO6zCdq3BJGpjwLtqCW63iNqjQQjzf9+yT7heYTDixOzzqygnrHGFmAawhlilZMto
 xDXEgQjxJFVtQqTDMDtrqslayFxH1xMIe+KfbR9zENnc6AVG80+E8zO+I51ohcRwmYx3jeut
 vIG4MdWeot3Z9Y/Y0OEZGDG8KNQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6172b0f9321f240051e1e078 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Oct 2021 12:39:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 20ACBC43616; Fri, 22 Oct 2021 12:39:21 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ppranees)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D9EF2C43618;
 Fri, 22 Oct 2021 12:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D9EF2C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: P Praneesh <ppranees@codeaurora.org>
To: ath11k@lists.infradead.org,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, P Praneesh <ppranees@codeaurora.org>,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: [PATCH v3 2/3] ath11k: Refactor update channel list function
Date: Fri, 22 Oct 2021 18:07:06 +0530
Message-Id: <1634906227-22028-3-git-send-email-ppranees@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
References: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_053945_368754_3B8C2F1B 
X-CRM114-Status: GOOD (  21.92  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

For sending scan channel list command to firmware through wmi, remain on
channel's scan request parameter needs to be updated. Add scan_req_params
as an argument to the existing update_scan_chan_list to update scan request
parameter through wmi. Also, rename regulatory update scan channel list to
the ath11k_wmi_update_scan_chan_list since it is moved to wmi file.

Co-developed-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c |   2 +-
 drivers/net/wireless/ath/ath11k/reg.c |  96 +-------------------------------
 drivers/net/wireless/ath/ath11k/reg.h |   1 -
 drivers/net/wireless/ath/ath11k/wmi.c | 101 ++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.h |   4 ++
 5 files changed, 107 insertions(+), 97 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1cc5560..fc2edef 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5256,7 +5256,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 
 	/* TODO: Do we need to enable ANI? */
 
-	ath11k_reg_update_chan_list(ar);
+	ath11k_wmi_update_scan_chan_list(ar, NULL);
 
 	ar->num_started_vdevs = 0;
 	ar->num_created_vdevs = 0;
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index a66b5bd..a453329 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -88,100 +88,6 @@ ath11k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 			    "INIT Country code set to fw failed : %d\n", ret);
 }
 
-int ath11k_reg_update_chan_list(struct ath11k *ar)
-{
-	struct ieee80211_supported_band **bands;
-	struct scan_chan_list_params *params;
-	struct ieee80211_channel *channel;
-	struct ieee80211_hw *hw = ar->hw;
-	struct channel_param *ch;
-	enum nl80211_band band;
-	int num_channels = 0;
-	int i, ret;
-
-	bands = hw->wiphy->bands;
-	for (band = 0; band < NUM_NL80211_BANDS; band++) {
-		if (!bands[band])
-			continue;
-
-		for (i = 0; i < bands[band]->n_channels; i++) {
-			if (bands[band]->channels[i].flags &
-			    IEEE80211_CHAN_DISABLED)
-				continue;
-
-			num_channels++;
-		}
-	}
-
-	if (WARN_ON(!num_channels))
-		return -EINVAL;
-
-	params = kzalloc(struct_size(params, ch_param, num_channels),
-			 GFP_KERNEL);
-	if (!params)
-		return -ENOMEM;
-
-	params->pdev_id = ar->pdev->pdev_id;
-	params->nallchans = num_channels;
-
-	ch = params->ch_param;
-
-	for (band = 0; band < NUM_NL80211_BANDS; band++) {
-		if (!bands[band])
-			continue;
-
-		for (i = 0; i < bands[band]->n_channels; i++) {
-			channel = &bands[band]->channels[i];
-
-			if (channel->flags & IEEE80211_CHAN_DISABLED)
-				continue;
-
-			/* TODO: Set to true/false based on some condition? */
-			ch->allow_ht = true;
-			ch->allow_vht = true;
-			ch->allow_he = true;
-
-			ch->dfs_set =
-				!!(channel->flags & IEEE80211_CHAN_RADAR);
-			ch->is_chan_passive = !!(channel->flags &
-						IEEE80211_CHAN_NO_IR);
-			ch->is_chan_passive |= ch->dfs_set;
-			ch->mhz = channel->center_freq;
-			ch->cfreq1 = channel->center_freq;
-			ch->minpower = 0;
-			ch->maxpower = channel->max_power * 2;
-			ch->maxregpower = channel->max_reg_power * 2;
-			ch->antennamax = channel->max_antenna_gain * 2;
-
-			/* TODO: Use appropriate phymodes */
-			if (channel->band == NL80211_BAND_2GHZ)
-				ch->phy_mode = MODE_11G;
-			else
-				ch->phy_mode = MODE_11A;
-
-			if (channel->band == NL80211_BAND_6GHZ &&
-			    cfg80211_channel_is_psc(channel))
-				ch->psc_channel = true;
-
-			ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
-				   "mac channel [%d/%d] freq %d maxpower %d regpower %d antenna %d mode %d\n",
-				   i, params->nallchans,
-				   ch->mhz, ch->maxpower, ch->maxregpower,
-				   ch->antennamax, ch->phy_mode);
-
-			ch++;
-			/* TODO: use quarrter/half rate, cfreq12, dfs_cfreq2
-			 * set_agile, reg_class_idx
-			 */
-		}
-	}
-
-	ret = ath11k_wmi_send_scan_chan_list_cmd(ar, params);
-	kfree(params);
-
-	return ret;
-}
-
 static void ath11k_copy_regd(struct ieee80211_regdomain *regd_orig,
 			     struct ieee80211_regdomain *regd_copy)
 {
@@ -256,7 +162,7 @@ int ath11k_regd_update(struct ath11k *ar)
 		goto err;
 
 	if (ar->state == ATH11K_STATE_ON) {
-		ret = ath11k_reg_update_chan_list(ar);
+		ret = ath11k_wmi_update_scan_chan_list(ar, NULL);
 		if (ret)
 			goto err;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/reg.h b/drivers/net/wireless/ath/ath11k/reg.h
index 5fb9dc0..44830e6 100644
--- a/drivers/net/wireless/ath/ath11k/reg.h
+++ b/drivers/net/wireless/ath/ath11k/reg.h
@@ -32,5 +32,4 @@ struct ieee80211_regdomain *
 ath11k_reg_build_regd(struct ath11k_base *ab,
 		      struct cur_regulatory_info *reg_info, bool intersect);
 int ath11k_regd_update(struct ath11k *ar);
-int ath11k_reg_update_chan_list(struct ath11k *ar);
 #endif
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5ae2ef4..2fe32cb 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1950,6 +1950,107 @@ int ath11k_wmi_send_peer_assoc_cmd(struct ath11k *ar,
 	return ret;
 }
 
+int ath11k_wmi_update_scan_chan_list(struct ath11k *ar,
+				     struct scan_req_params *arg)
+{
+	struct ieee80211_supported_band **bands;
+	struct scan_chan_list_params *params;
+	struct channel_param *ch;
+	struct cfg80211_chan_def *chandef;
+	struct ieee80211_channel *channel, *req_channel;
+	enum nl80211_band band;
+	int num_channels = 0;
+	int params_len, i, ret;
+	bool found = false;
+
+	bands = ar->hw->wiphy->bands;
+	for (band = 0; band < NUM_NL80211_BANDS; band++) {
+		if (!bands[band])
+			continue;
+		for (i = 0; i < bands[band]->n_channels; i++) {
+			if (bands[band]->channels[i].flags &
+				IEEE80211_CHAN_DISABLED)
+				continue;
+			num_channels++;
+		}
+	}
+
+	if (WARN_ON(!num_channels))
+		return -EINVAL;
+
+	params_len = sizeof(struct scan_chan_list_params) +
+			    num_channels * sizeof(struct channel_param);
+	params = kzalloc(params_len, GFP_KERNEL);
+
+	if (!params)
+		return -ENOMEM;
+
+	params->pdev_id = ar->pdev->pdev_id;
+	params->nallchans = num_channels;
+
+	ch = params->ch_param;
+	chandef = arg ? arg->chandef : NULL;
+	req_channel = chandef ? chandef->chan : NULL;
+
+	for (band = 0; band < NUM_NL80211_BANDS; band++) {
+		if (!bands[band])
+			continue;
+		for (i = 0; i < bands[band]->n_channels; i++) {
+			channel = &bands[band]->channels[i];
+
+			if (channel->flags & IEEE80211_CHAN_DISABLED)
+				continue;
+
+			if (req_channel && !found &&
+			    req_channel->center_freq == channel->center_freq) {
+				ch->mhz = arg->freq;
+				ch->cfreq1 = chandef->center_freq1;
+				ch->cfreq2 = chandef->center_freq2;
+
+				ch->phy_mode = arg->phymode;
+				channel = req_channel;
+				found = true;
+			} else {
+				ch->mhz = channel->center_freq;
+				ch->cfreq1 = channel->center_freq;
+				ch->phy_mode = (channel->band == NL80211_BAND_2GHZ) ?
+								MODE_11G : MODE_11A;
+			}
+
+			/* TODO: Set to true/false based on some condition? */
+			ch->allow_ht = true;
+			ch->allow_vht = true;
+			ch->allow_he = true;
+
+			ch->dfs_set = !!(channel->flags & IEEE80211_CHAN_RADAR);
+			ch->is_chan_passive = !!(channel->flags & IEEE80211_CHAN_NO_IR);
+			ch->is_chan_passive |= ch->dfs_set;
+			ch->minpower = 0;
+			ch->maxpower = channel->max_power;
+			ch->maxregpower = channel->max_reg_power;
+			ch->antennamax = channel->max_antenna_gain;
+
+			if (channel->band == NL80211_BAND_6GHZ &&
+			    cfg80211_channel_is_psc(channel))
+				ch->psc_channel = true;
+
+			ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
+				   "mac channel [%d/%d] freq %d maxpower %d regpower %d antenna %d mode %d flag 0x%x chandef: %pK\n",
+				   i, params->nallchans,
+				   ch->mhz, ch->maxpower, ch->maxregpower,
+				   ch->antennamax, ch->phy_mode, channel->flags,
+				   chandef);
+
+			ch++;
+		}
+	}
+
+	ret = ath11k_wmi_send_scan_chan_list_cmd(ar, params);
+	kfree(params);
+
+	return ret;
+}
+
 void ath11k_wmi_start_scan_init(struct ath11k *ar,
 				struct scan_req_params *arg)
 {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 0584e68..aeec4e9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3311,6 +3311,9 @@ struct scan_req_params {
 	u32 num_hint_bssid;
 	struct hint_short_ssid hint_s_ssid[WLAN_SCAN_MAX_HINT_S_SSID];
 	struct hint_bssid hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
+	u32 phymode;
+	u32 freq;
+	struct cfg80211_chan_def *chandef;
 };
 
 struct wmi_ssid_arg {
@@ -5378,6 +5381,7 @@ int ath11k_wmi_send_peer_delete_cmd(struct ath11k *ar,
 				    const u8 *peer_addr, u8 vdev_id);
 int ath11k_wmi_vdev_delete(struct ath11k *ar, u8 vdev_id);
 void ath11k_wmi_start_scan_init(struct ath11k *ar, struct scan_req_params *arg);
+int ath11k_wmi_update_scan_chan_list(struct ath11k *ar, struct scan_req_params *arg);
 int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 				   struct scan_req_params *params);
 int ath11k_wmi_send_scan_stop_cmd(struct ath11k *ar,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
