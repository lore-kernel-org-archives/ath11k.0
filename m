Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9CEFED2F5
	for <ath11k@archiver.kernel.org>; Fri, 13 Mar 2026 00:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F3YA59Mp4HTuyJkhwuElaXOAlXnXSvbB0FwywcY2nbs=; b=l1oVtcCBIJdDEzt/93Hlvo95EW
	YIJesjezwugpZlwn/yF3p5RJ/1Ah8fLsO411wyebc0Jkq6mebPE/2n2Iu7WWfR1POsA0p+wkBPGJB
	YFCC5EAZW7tD1kRsawbwTJN8vtcLUHAZ6GFcxaYSlvtoX3MyG8GRA9Cbt32VN7NJ1vUpcINTf7oqZ
	xCCOT1/TU1G3QqbfLp9mcZTXG8KBtGRb0FNXOIe7yyECjepymGnJ6yZU5I3RR126Qy9GlwJgaZ/NS
	vH72w4cnf3y3PcX9v6n5hUVmMCCtKmIjL1kf3w+x+96M9XLSjaThmZxUG8OeujWBbQ4SH3Ym/n77f
	qfsuOpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qCc-0000000FtdJ-0cvA;
	Fri, 13 Mar 2026 00:16:30 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qCZ-0000000Ftch-3czZ
	for ath11k@lists.infradead.org;
	Fri, 13 Mar 2026 00:16:28 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-64c97997b0fso1366967d50.3
        for <ath11k@lists.infradead.org>; Thu, 12 Mar 2026 17:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773360987; x=1773965787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F3YA59Mp4HTuyJkhwuElaXOAlXnXSvbB0FwywcY2nbs=;
        b=PIjsGwhJZY5fqUyNN0WGHARVTWr1iWJju0eoXvmP99mUV1lHH93jjdmo5+oKTC24ZA
         v1fr4VnBdMVY2Epauyn0Gy8lTsylf0eglQVf1tvYG4sHmz6xYGjQCV+7W5djliMH9jfl
         2sh/VBRuNZs0GyHrC9h19t4U3JVDl+1dTc4+/PNe3xuLLrQ6CCupAvEGLwR2YbuOLl24
         8ceLbrhWZ1mmSrhHX5oRr+n3Uh/yl8k8qkct5SE51jT5yqkFVa5qlw7A8KM2KF5CZ+bB
         0yyD5o6XOhYfaOOCkQs7RKFXT+EZv/Q05/ygAkBLcO+Q/zSogZFp0037J8jY8MKRjAZY
         2ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773360987; x=1773965787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3YA59Mp4HTuyJkhwuElaXOAlXnXSvbB0FwywcY2nbs=;
        b=UFwlCANrpEoEWJoTiHtzVlMcLEEx6ybxKZQgyVugJPI/iq4hBv4Up6ZuEBLplfhbep
         VVxK+U6RYmik8waRtbiNeJbibz1REY4/PTfNb8IvtyDdtFbLgNQDa8Fgjpg4VysKwMOh
         VW1mU7ZuEfzZ/cO2QI0m19WnUvo22P6IA2gJGMayBF0VgFhXd1NRxS4RHXa6nOMdvrxv
         NDS3Pq+5gJrVtdDGtslbYr0MmSGeJtGYi54EgmyXvwnEj6oiVYRnwz1Gj1Sg8FOsj//0
         +BIDw4I20gZYorU8Uxx/S/FxH2Bvd922cLvBW+3EpzAfVpSsCTUWw07ZbUG7ioJXvbln
         /8Og==
X-Forwarded-Encrypted: i=1; AJvYcCUTo6XpjSlHpzulJJ43GwoEO6SMZG2Dr5iA+T6KMJdHRHivh3ejNqk4BCdvQsAL8xDOiMLfLbc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/sco/r6uJZVCt5v1fBStlDX86fJu3dppnBOH69BZ+qu4w09Mh
	iSsP3yTZq8LODwH2pmePE9ZZiyfflfe9WCcIJlRUsOiLwq2ALTz0Ni4Z
X-Gm-Gg: ATEYQzxqDJLOfT2gfUiVLYSapaSyQngdTYrEtcEW9lQo3XZd10Z2PxHZ2Dr/VRaFPbj
	No8ReStpb96MgSHH+iZdvOOMDSeawI/VzL9SRD2k+2D6FTQcoVyLpH4i+2ri6herRS13atBlJmU
	XdgHFbDH5uJlFBByeSdi8FQdcnczhM0SX01aRVhLoXizdHpp7ddpX5a6UmMWh2aLsMs/r7fJdKE
	hRpaQ7u3vh8a7p0DWATmXWGJgRZMH8pe1QGpjiwNbZKHwqCUY+ny/7cqW5Ofi1ulmD+CeqVpkDj
	d1Ia12oqtNAlnEVoSdmKlNZLrxMRYJlbm3thtHMYpgTiNSdL1sS367TzU6fxjPljCYAUYgrUpPv
	Trf99JRsdtsneZlegl+8/wbHdlosf/QWh+MqBAvGYv/3B0LlLOM1Cqk410AR/BPu5oRwZJtLls3
	27hvcSHypJZgYHg9+09sby3VAS0ULA9orZqaGrQuL4uO/Tn0vOClh1ew==
X-Received: by 2002:a53:c448:0:b0:64c:9fd7:676a with SMTP id 956f58d0204a3-64e630dc827mr1182932d50.83.1773360986740;
        Thu, 12 Mar 2026 17:16:26 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a405c5sm157460d50.2.2026.03.12.17.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:16:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH ath-next] wifi: ath11k: use kzalloc_flex
Date: Thu, 12 Mar 2026 17:16:08 -0700
Message-ID: <20260313001608.118294-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_171627_916773_D29E012A 
X-CRM114-Status: GOOD (  16.01  )
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
assignment immediately after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 71 ++++++++++-----------------
 drivers/net/wireless/ath/ath11k/wmi.h |  2 +-
 2 files changed, 28 insertions(+), 45 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4a68bb9ca4fa..b5f3d7221b5f 100644
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

@@ -9736,19 +9726,14 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,

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
@@ -9769,7 +9754,7 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		spin_lock_bh(&ar->data_lock);
 		ar->scan.state = ATH11K_SCAN_IDLE;
 		spin_unlock_bh(&ar->data_lock);
-		goto free_chan_list;
+		goto free_arg;
 	}

 	ret = wait_for_completion_timeout(&ar->scan.on_channel, 3 * HZ);
@@ -9779,7 +9764,7 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 		if (ret)
 			ath11k_warn(ar->ab, "failed to stop scan: %d\n", ret);
 		ret = -ETIMEDOUT;
-		goto free_chan_list;
+		goto free_arg;
 	}

 	ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
@@ -9787,8 +9772,6 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,

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
2.53.0


