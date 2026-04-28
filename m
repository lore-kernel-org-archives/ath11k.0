Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A101BFF886D
	for <ath11k@archiver.kernel.org>; Tue, 28 Apr 2026 20:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8NzPUuQXwNwzOXO6cxunjkL9bjxxgNti1T1DyCWU3h0=; b=n0xVeKO4/CvuF7deWppBPuG44s
	fMUVU0j1a2Mv4aMxHZEnt4zFgIdtMDOljWkRuyshL+I9VipG3RYvttpFdmnBFh1UXBerov5mhYJXr
	clWkeK60AnBxL61ilrXhWS0ErqGc0IsbLiahOIbCNv09OjskB+xe26mxFKbKhMVaeI9Ro6I9KssE8
	gp47jtvyw2eK5OqAwKDt7AZOFE7/+WTlpgqrINVExEggb+emXSud4+c4zS6opF1MUXNBVXP1BBxRA
	wPTnPc75TleKHBSTT3sCRTvr01u2YPbYwPj/MI5+Vlq8jfpKEtFWNKxmgaQTeKfbvEvWKVv/rHnrA
	QUp8pr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpOA-00000002UOS-3m8t;
	Tue, 28 Apr 2026 20:50:38 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpO8-00000002UNS-1CVn
	for ath11k@lists.infradead.org;
	Tue, 28 Apr 2026 20:50:37 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f8cebc935so5169703b3a.0
        for <ath11k@lists.infradead.org>; Tue, 28 Apr 2026 13:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777409435; x=1778014235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NzPUuQXwNwzOXO6cxunjkL9bjxxgNti1T1DyCWU3h0=;
        b=QSvpXPm+s1BiTNOozKIGD/CvdG4I+xPKBfZ2LDOW72bmvOU/x9OEcngq02k+DHtZ7+
         6/5y9tIpUhXb+/eIcqZTjhcHnn0lzou2CGR7AfcIdwiVGGiFkZ02Y50QLSMtWtAfaiHa
         487PKp7ZfQngs3p7ZsPKg1d9hg1THVbJyrxpewVv4Gz3+ImEIaDxK209OyUH/R/c316g
         1yOSphyeHoBXM0NBUNxLWMLorX726oiGYCrpkxgT13Nma61eNiMJjHhvAWo/wzhlAm5X
         0z+3eHw3ihKOFd3sSpobgHLpsxJaOH1qDxlVj/jyPIMiXheUworhzO2JS1bNeTlJHsx0
         aGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777409435; x=1778014235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NzPUuQXwNwzOXO6cxunjkL9bjxxgNti1T1DyCWU3h0=;
        b=QuCqbh6tkhemZuhInNojeE4VpqldDSQJ4juWMztKSgMHREmSer1lLDxIqU7z/LA4rN
         F4nPCl2expCJzNX2U/qyQiYRbiJUtLoCi2lOu64FjqmNAEjYSXxwpz3gUYtwEDJDKix8
         7Kykr8IjJN3E6VKx1sWdqzdMWABiioO6UtHGUN9C1VXxqYRM31XY6QIKlOYzoDL1mJO1
         4OaHwTSlrJy0otdqWe0x14/tDAA66z2wzbTnfsc6CTXJYqhodwLQ5+RCGPu85Fv8tjqc
         xKst9M4sE7+0bjcpkZocU25oRTx0DIFVoa3UNKgsHccjwduimX/8EWzQdO7FxcrPyEPM
         pQiw==
X-Forwarded-Encrypted: i=1; AFNElJ/TwzHSHS5aJKJtvZ7jqLHC+mNOqyJfNJdOXTIX8E5VJvcnJpAQQn8/WdJfya73pfkXSJ4AQCY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+EbFUf6knFzv1nHuZ/x6BP6ZuOEP23tHyLtRwoJlCTnqRXUT8
	E+bsUzLWevzHkd+7nLcLuZT1GSVGKAUN4pwzoLHMi+Q1LN3fXzZwQQkM
X-Gm-Gg: AeBDievjrWt6VSJaxfhnwq5lZ2Kg8+dg20AM6itPn11+0Vk1UKjp96OP8y+m+XYlo5+
	UucsgGZr0/GZPqFucyfvASW5qr6cE600ihW43G4cCRV5nzfvGQnKQlmZ8aApXoKnLR4vizKbQbF
	/LHY1RyM6aAERytmdNWRYauRaHlPOwx1+JqSU+hGcU/8tvupr9tr4hm7aV8uTPecUNQ5EpBOnQc
	KHUHJe9N6aBB2AG0ZH+zj3x+qCRS9Lm71DC4UWsq8I48yJ2a75zcO/dav6RNfw/TSVnnSb92IaI
	TElUzMJztPMlUCH726VYAQQUCXqF0t8JyC9c8fj7r9bDR1jsoIMtqVqeCvDeveI9hO3G62wfDo8
	yuxLK07p6jjVfOkKrGNAR5BRmDdsXRNVHJUcwCUmTOag14yLs/uO7xqaw2nzGftZisbmIjarUwQ
	eso09dEMJ2UqfY5QZgWH+dmaSAHWMu7MWqvdEvS5dPAdykMSKh60f8JQ/h4t/rumYJufpA7HWxu
	bcfsjl0smaWTFyt76Deqy5N+w==
X-Received: by 2002:a05:6a00:950d:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-834ea2200cdmr812642b3a.0.1777409434826;
        Tue, 28 Apr 2026 13:50:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae1fd8esm3301581b3a.13.2026.04.28.13.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:50:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv3 ath-next] wifi: ath11k: use kzalloc_flex
Date: Tue, 28 Apr 2026 13:50:17 -0700
Message-ID: <20260428205017.26288-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_135036_328301_36E83BA6 
X-CRM114-Status: GOOD (  16.74  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.

Add __counted_by to get extra runtime analysis. Move counting variable
assignment immediately after allocation before any potential accesses.
kzalloc_flex does this anyway for GCC >= 15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: remove one more kfree for chan_list.
 v2: reword counting variable comment.
 drivers/net/wireless/ath/ath11k/mac.c | 72 ++++++++++-----------------
 drivers/net/wireless/ath/ath11k/wmi.h |  2 +-
 2 files changed, 28 insertions(+), 46 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4a68bb9ca4fa..8d9e1e33e47d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4228,13 +4228,14 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 	if (ret)
 		goto exit;
 
-	arg = kzalloc_obj(*arg);
+	arg = kzalloc_flex(*arg, chan_list, req->n_channels);
 
 	if (!arg) {
 		ret = -ENOMEM;
 		goto exit;
 	}
 
+	arg->num_chan = req->n_channels;
 	ath11k_wmi_start_scan_init(ar, arg);
 	arg->vdev_id = arvif->vdev_id;
 	arg->scan_id = ATH11K_SCAN_ID;
@@ -4262,38 +4263,27 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 		arg->scan_f_passive = 1;
 	}
 
-	if (req->n_channels) {
-		arg->num_chan = req->n_channels;
-		arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
-					 GFP_KERNEL);
+	for (i = 0; i < arg->num_chan; i++) {
+		if (test_bit(WMI_TLV_SERVICE_SCAN_CONFIG_PER_CHANNEL,
+			     ar->ab->wmi_ab.svc_map)) {
+			arg->chan_list[i] =
+				u32_encode_bits(req->channels[i]->center_freq,
+						WMI_SCAN_CONFIG_PER_CHANNEL_MASK);
 
-		if (!arg->chan_list) {
-			ret = -ENOMEM;
-			goto exit;
-		}
-
-		for (i = 0; i < arg->num_chan; i++) {
-			if (test_bit(WMI_TLV_SERVICE_SCAN_CONFIG_PER_CHANNEL,
-				     ar->ab->wmi_ab.svc_map)) {
-				arg->chan_list[i] =
-					u32_encode_bits(req->channels[i]->center_freq,
-							WMI_SCAN_CONFIG_PER_CHANNEL_MASK);
-
-				/* If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set in scan
-				 * flags, then scan all PSC channels in 6 GHz band and
-				 * those non-PSC channels where RNR IE is found during
-				 * the legacy 2.4/5 GHz scan.
-				 * If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set,
-				 * then all channels in 6 GHz will be scanned.
-				 */
-				if (req->channels[i]->band == NL80211_BAND_6GHZ &&
-				    req->flags & NL80211_SCAN_FLAG_COLOCATED_6GHZ &&
-				    !cfg80211_channel_is_psc(req->channels[i]))
-					arg->chan_list[i] |=
-						WMI_SCAN_CH_FLAG_SCAN_ONLY_IF_RNR_FOUND;
-			} else {
-				arg->chan_list[i] = req->channels[i]->center_freq;
-			}
+			/* If NL80211_SCAN_FLAG_COLOCATED_6GHZ is set in scan
+			 * flags, then scan all PSC channels in 6 GHz band and
+			 * those non-PSC channels where RNR IE is found during
+			 * the legacy 2.4/5 GHz scan.
+			 * If NL80211_SCAN_FLAG_COLOCATED_6GHZ is not set,
+			 * then all channels in 6 GHz will be scanned.
+			 */
+			if (req->channels[i]->band == NL80211_BAND_6GHZ &&
+			    req->flags & NL80211_SCAN_FLAG_COLOCATED_6GHZ &&
+			    !cfg80211_channel_is_psc(req->channels[i]))
+				arg->chan_list[i] |=
+					WMI_SCAN_CH_FLAG_SCAN_ONLY_IF_RNR_FOUND;
+		} else {
+			arg->chan_list[i] = req->channels[i]->center_freq;
 		}
 	}
 
@@ -4336,7 +4326,6 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
 
 exit:
 	if (arg) {
-		kfree(arg->chan_list);
 		kfree(arg->extraie.ptr);
 		kfree(arg);
 	}
@@ -9736,19 +9725,14 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 
 	scan_time_msec = ar->hw->wiphy->max_remain_on_channel_duration * 2;
 
-	arg = kzalloc_obj(*arg);
+	arg = kzalloc_flex(*arg, chan_list, 1);
 	if (!arg) {
 		ret = -ENOMEM;
 		goto exit;
 	}
-	ath11k_wmi_start_scan_init(ar, arg);
+
 	arg->num_chan = 1;
-	arg->chan_list = kcalloc(arg->num_chan, sizeof(*arg->chan_list),
-				 GFP_KERNEL);
-	if (!arg->chan_list) {
-		ret = -ENOMEM;
-		goto free_arg;
-	}
+	ath11k_wmi_start_scan_init(ar, arg);
 
 	arg->vdev_id = arvif->vdev_id;
 	arg->scan_id = ATH11K_SCAN_ID;
@@ -9769,7 +9753,7 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		spin_lock_bh(&ar->data_lock);
 		ar->scan.state = ATH11K_SCAN_IDLE;
 		spin_unlock_bh(&ar->data_lock);
-		goto free_chan_list;
+		goto free_arg;
 	}
 
 	ret = wait_for_completion_timeout(&ar->scan.on_channel, 3 * HZ);
@@ -9779,7 +9763,7 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		if (ret)
 			ath11k_warn(ar->ab, "failed to stop scan: %d\n", ret);
 		ret = -ETIMEDOUT;
-		goto free_chan_list;
+		goto free_arg;
 	}
 
 	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
@@ -9787,8 +9771,6 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 
 	ret = 0;
 
-free_chan_list:
-	kfree(arg->chan_list);
 free_arg:
 	kfree(arg);
 exit:
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index baed501b640b..b2dade0516ac 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3423,7 +3423,6 @@ struct scan_req_params {
 	u32 num_bssid;
 	u32 num_ssids;
 	u32 n_probes;
-	u32 *chan_list;
 	u32 notify_scan_events;
 	struct wlan_ssid ssid[WLAN_SCAN_PARAMS_MAX_SSID];
 	struct wmi_mac_addr bssid_list[WLAN_SCAN_PARAMS_MAX_BSSID];
@@ -3436,6 +3435,7 @@ struct scan_req_params {
 	struct hint_bssid hint_bssid[WLAN_SCAN_MAX_HINT_BSSID];
 	struct wmi_mac_addr mac_addr;
 	struct wmi_mac_addr mac_mask;
+	u32 chan_list[] __counted_by(num_chan);
 };
 
 struct wmi_ssid_arg {
-- 
2.54.0


