Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C82F94CB5
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 23:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VTFjozRKzlcsUeI3wET9p6IVNlwFbfMKkKPMEGBJgq8=; b=jNQ6073Sr4bKm0xtQKVMgN5znc
	TXN7kzQwZ3ojj/bcdo55pA3UIBVgRGWzMOZLo3JOFHQrN7Uuq6GTWsmvuwZCkp9cDJZ5nPeCAFTs6
	z2c33JeL9qfN9xg1lc0c+22dh5Sm9dIWSrSYzeAhW4S+1CK2Iynf1mm6rDAhofSilETJZOxet8jGu
	azgjRpfV2jEn3TzFVRsvFsfTlt2F3nfviL70mqipRzzMuJR5I4iltzWaaWQzUq6wcIJuvXp+00CG2
	L4dyInQasA8TVVLRrbAQHyighcQ26H7ciExjrj1dyzC5TFwTUcNQBE8bAm8TKt64/GvPwtbQiszH3
	PdI7nN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFKGY-00000009P8Y-1Btn;
	Tue, 21 Apr 2026 23:12:26 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFKGV-00000009P8B-38rJ
	for ath11k@lists.infradead.org;
	Tue, 21 Apr 2026 23:12:24 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso2761959a91.3
        for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 16:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776813142; x=1777417942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VTFjozRKzlcsUeI3wET9p6IVNlwFbfMKkKPMEGBJgq8=;
        b=EsfddnzF6DeEmG7g+TI+bBjdQVgT4B1dx8NkKq8G922yteVzSFa8FlZ+VbyJWHqFxC
         bv7Vm4CpTC/9jxElVjLsHZb5mf+Dve9I3UCkXYw52KwbjzgnF656rND+WFn0t7s7oqdN
         iwZ4RWcCgXHZ8/ucB3Q2QZvD+dsUTXvMAxCbBRQEe46RalIFGhQsA0dA3QBtU2Bc9zHi
         vFBI1CJCFBKDpLnDdjjhWsQwjVhwkigSdlWCnUn6XqOD3483tcmGWm50XznHdZtieZRx
         uAVdxy+yVinTESESiKLPLBI/9MYH0rdFLYAPPQFXYKc6LizSFMrWnkHVa9c691AR5NM8
         oX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776813142; x=1777417942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTFjozRKzlcsUeI3wET9p6IVNlwFbfMKkKPMEGBJgq8=;
        b=Q0y+iRGcNFedeKFMT/AEXWTEMj4lizUozXsIt44kCXblglTsaWS6zMaff4+FJpxSSf
         MYXe8Lb4W4JfiVwrTmoUNVWVugO9HzKszKk/uapX+SZhCKBLxLlsavSMdBo1gwKoDHM1
         qrf/9H3bNHYMwQx5AOQb00iIYaIyNEn07tIObKhmRFgIHNigAN9Tss1RYDmdY0nin5zO
         t+tvhhk8rVsN+8fUjhaq2mOiDhhoJtbodVJht8kj4oz7QSNlh4k6TjzyAhOrky9Y2Ufi
         DBYMfMu/BOhTOqopve4w0loGFVs5RDxcQkp17Pi7zu1Qus7sg8v/2GIS82zhMVAqsAXc
         DRyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tYKhvPfFDs3u6Q7fYRpKj7RSMFIcAzJ123DpV3myHj8X5XHYjUj1IOuQprFUQ0DclPTlmqUU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyfjhVtn7Gd+TYkUGbgvFe3XF7WxUm9WFC7dtaC+qgb1ZZuH/Im
	w1olj4nOByABlE3fs3MFuFHNfy15A6EIsQTs7jncc/cJajqm1qzlA3jT
X-Gm-Gg: AeBDiesEBf/HeBvpf264+JIERviudSN4A848h/VaObKdmh4ky7lI/azG0Aepi4CmOkf
	ww4bnx20eHiakQfd5UCyPmtWdu58kzSnzFf23MAgJpJKbPGyHV/5jV8MRwYW8Oyeets6+V1ffPT
	NgTNtalc46MBrcAnHswsohLJNUP43NaX7qCzRvhTLUEyUh4AWrU1v0cm3w7EEQIDJ2nsvlb0Nsi
	CWmPZ/XgIVPuMSSV647ECtVJNhC+nF7YT8ZfGilzjYfvsd+DIsN9Ms3GkQHPN+Vhb02io+SxKKb
	Ao4WeBRmxv/H7nUGXUIutjrnV4xCayaeF3KT5YJ2HE+j92GDgIonCFNgsIgXTBMhkLIsxeJJUH/
	lXRwwqZjDRlYDqHVxWHakCOJC7VM0BtEXz1cOjnTXqnJouRmoHwj5PtxW2xAnk9BRyWycfE/kAi
	1gyMLOsY6tmbALEqZrhDJP4MRTQnA2GALT0Fd514TMd82gXM5S4VsfArM033K59dS9QQ==
X-Received: by 2002:a17:90b:3b89:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-361403cb172mr19257134a91.4.1776813142527;
        Tue, 21 Apr 2026 16:12:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8be])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc575bsm14881131a91.4.2026.04.21.16.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 16:12:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 ath-next] wifi: ath11k: use kzalloc_flex
Date: Tue, 21 Apr 2026 16:12:05 -0700
Message-ID: <20260421231205.77361-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_161223_838359_815C41D9 
X-CRM114-Status: GOOD (  16.52  )
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
 v2: reword counting variable comment.
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


