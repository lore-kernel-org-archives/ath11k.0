Return-Path: <SRS0=s4Qy=G7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC528C433DB
	for <ath11k@archiver.kernel.org>; Thu, 28 Jan 2021 14:49:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D3764DE7
	for <ath11k@archiver.kernel.org>; Thu, 28 Jan 2021 14:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D3764DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WFsqSyBpXx0fhA+nARfw3ndk622wfEIN3wsq/cNII0g=; b=BAm4v/1I+Dfpx3F8Tbxxj558dz
	8u2hRglqzTizG3bOPk008i+/PuJnwn+T9urISaUo7k46jrvofgg1JB4NCDOV43YeSvqCy9f7ciy0H
	JVesZCTy96UzujNwnwnTHkBlB1qnLVnI8m7SRAyFiecUJbysF4DTivdsFtA2fjWrLBCDVtXA10Rtk
	4t0qkCwu3Eee008/yprhnQGEloLjuk6GFbV1pNtWjFTkpqBsi3lo4gcGQR5g05KwnVNQsANvAu5pQ
	CwuyaZWJJpeV8kgGjz5OSUQG7jufFMjZUGk24dnDrQtRJyZH8ZBG13eDS2j1i6a2fFT+V0+Xb7zjU
	QwtckBpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l58c9-0000c4-1a; Thu, 28 Jan 2021 14:49:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l58c6-0000bX-HE
 for ath11k@lists.infradead.org; Thu, 28 Jan 2021 14:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611845377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R1wB61RtOlNZBu/4s6IPC3Y9aKTFBZ1hLdvLyyOkKJs=;
 b=V7Dk3hIBXAUpfIb66HFZ1FVxd4b54IR++xNplqMKKh0DRgiAyFHEm1zcXswgkOHAc+YhNQ
 vP9ciXUt5XXBgAKsDVmPvpTDaNd5D7z2qxnxi6NH7WbmGKgOL98yQmaadBH+GP6R43Ez6W
 Hl7QU8Q1vt7Rl9HMt8jAfiCwxcYGvOI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-kBpcpgXtOPWo4F-8fhEcMQ-1; Thu, 28 Jan 2021 09:49:35 -0500
X-MC-Unique: kBpcpgXtOPWo4F-8fhEcMQ-1
Received: by mail-qv1-f69.google.com with SMTP id ew14so3844648qvb.21
 for <ath11k@lists.infradead.org>; Thu, 28 Jan 2021 06:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R1wB61RtOlNZBu/4s6IPC3Y9aKTFBZ1hLdvLyyOkKJs=;
 b=IcuhtyVBn8fceqlOL1B6b/36m0veLOGOrAwHKW15itI0vR2XgFfa9xmirkU+XyOdLb
 YNb8I5N/xOn4Gz0NiIxjiSZcqCVri9RYnNKCFnOEsCEooDFNd52JK/m4XzOOv0A5BP29
 lM1H8WxwFweCtQKvqA4Q7KDIsmgRkbYOupK6+sKnqWMgh+tzpKoRgoBsVs4EjS7y9YYY
 ZwmI+XR9A3f+FmGt0VK2WKDXapGZKS0uCHOLkaKfH9RtC4eH7yPHq6xRxRLVK7mtrFeN
 hpm/imXvkacXz+5OTJUuw+DejyiRJgyQJm5PfJ341kMYE4WibCVxVUaOFDbxViEXr4pl
 vIZA==
X-Gm-Message-State: AOAM5331rVRAcrDWpuNJXZSq7faIfluq5W7gHRByOk95PF/nMJ0jHdkX
 Q2BDx0klLK78e/hgAjCsYjyCfcd20JbXzSZaungxEAjNrRno3pymGX+427Pwg6QXUn3QvRd0T8Y
 al3ReZS1oI0FeScAe55gbxg==
X-Received: by 2002:a05:6214:12ab:: with SMTP id
 w11mr15366684qvu.8.1611845375232; 
 Thu, 28 Jan 2021 06:49:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCLuqdGPwPS5PK3P3TXw9Qxq7+q25oB8+s3fAglKWy2HeY2liKG0cQB0vFgfE3eC2o2geTNg==
X-Received: by 2002:a05:6214:12ab:: with SMTP id
 w11mr15366658qvu.8.1611845374975; 
 Thu, 28 Jan 2021 06:49:34 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id q25sm3635809qkq.32.2021.01.28.06.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:49:34 -0800 (PST)
From: trix@redhat.com
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH] ath11k: remove h from printk format specifier
Date: Thu, 28 Jan 2021 06:49:28 -0800
Message-Id: <20210128144928.2557605-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_094938_612198_D31D89CB 
X-CRM114-Status: GOOD (  10.79  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, Tom Rix <trix@redhat.com>,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

This change fixes the checkpatch warning described in this commit
commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
  unnecessary %h[xudi] and %hh[xudi]")

Standard integer promotion is already done and %hx and %hhx is useless
so do not encourage the use of %hh[xudi] or %h[xudi].

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 +++++-----
 drivers/net/wireless/ath/ath11k/mac.c   | 10 +++++-----
 drivers/net/wireless/ath/ath11k/trace.h |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.c   |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 42328a06107b..859cfcabceb5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1292,7 +1292,7 @@ int ath11k_dp_htt_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 		len -= sizeof(*tlv);
 
 		if (tlv_len > len) {
-			ath11k_err(ab, "htt tlv parse failure of tag %hhu at byte %zd (%zu bytes left, %hhu expected)\n",
+			ath11k_err(ab, "htt tlv parse failure of tag %u at byte %zd (%zu bytes left, %u expected)\n",
 				   tlv_tag, ptr - begin, len, tlv_len);
 			return -EINVAL;
 		}
@@ -1381,22 +1381,22 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	 */
 
 	if (flags == WMI_RATE_PREAMBLE_HE && mcs > 11) {
-		ath11k_warn(ab, "Invalid HE mcs %hhd peer stats",  mcs);
+		ath11k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
 		return;
 	}
 
 	if (flags == WMI_RATE_PREAMBLE_HE && mcs > ATH11K_HE_MCS_MAX) {
-		ath11k_warn(ab, "Invalid HE mcs %hhd peer stats",  mcs);
+		ath11k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
 		return;
 	}
 
 	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > ATH11K_VHT_MCS_MAX) {
-		ath11k_warn(ab, "Invalid VHT mcs %hhd peer stats",  mcs);
+		ath11k_warn(ab, "Invalid VHT mcs %d peer stats",  mcs);
 		return;
 	}
 
 	if (flags == WMI_RATE_PREAMBLE_HT && (mcs > ATH11K_HT_MCS_MAX || nss < 1)) {
-		ath11k_warn(ab, "Invalid HT mcs %hhd nss %hhd peer stats",
+		ath11k_warn(ab, "Invalid HT mcs %d nss %d peer stats",
 			    mcs, nss);
 		return;
 	}
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c1608f64ea95..9f56e0ad1fee 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4849,7 +4849,7 @@ static int ath11k_mac_op_add_chanctx(struct ieee80211_hw *hw,
 	struct ath11k_base *ab = ar->ab;
 
 	ath11k_dbg(ab, ATH11K_DBG_MAC,
-		   "mac chanctx add freq %hu width %d ptr %pK\n",
+		   "mac chanctx add freq %u width %d ptr %pK\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx);
 
 	mutex_lock(&ar->conf_mutex);
@@ -4873,7 +4873,7 @@ static void ath11k_mac_op_remove_chanctx(struct ieee80211_hw *hw,
 	struct ath11k_base *ab = ar->ab;
 
 	ath11k_dbg(ab, ATH11K_DBG_MAC,
-		   "mac chanctx remove freq %hu width %d ptr %pK\n",
+		   "mac chanctx remove freq %u width %d ptr %pK\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx);
 
 	mutex_lock(&ar->conf_mutex);
@@ -5117,7 +5117,7 @@ ath11k_mac_update_vif_chan(struct ath11k *ar,
 		arvif = (void *)vifs[i].vif->drv_priv;
 
 		ath11k_dbg(ab, ATH11K_DBG_MAC,
-			   "mac chanctx switch vdev_id %i freq %hu->%hu width %d->%d\n",
+			   "mac chanctx switch vdev_id %i freq %u->%u width %d->%d\n",
 			   arvif->vdev_id,
 			   vifs[i].old_ctx->def.chan->center_freq,
 			   vifs[i].new_ctx->def.chan->center_freq,
@@ -5214,7 +5214,7 @@ static void ath11k_mac_op_change_chanctx(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	ath11k_dbg(ab, ATH11K_DBG_MAC,
-		   "mac chanctx change freq %hu width %d ptr %pK changed %x\n",
+		   "mac chanctx change freq %u width %d ptr %pK changed %x\n",
 		   ctx->def.chan->center_freq, ctx->def.width, ctx, changed);
 
 	/* This shouldn't really happen because channel switching should use
@@ -5583,7 +5583,7 @@ static int ath11k_mac_set_fixed_rate_params(struct ath11k_vif *arvif,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac set fixed rate params vdev %i rate 0x%02hhx nss %hhu sgi %hhu\n",
+	ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "mac set fixed rate params vdev %i rate 0x%02x nss %u sgi %u\n",
 		   arvif->vdev_id, rate, nss, sgi);
 
 	vdev_param = WMI_VDEV_PARAM_FIXED_RATE;
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index 66d0aae7816c..d2d2a3cb0826 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -43,7 +43,7 @@ TRACE_EVENT(ath11k_htt_pktlog,
 	),
 
 	TP_printk(
-		"%s %s size %hu pktlog_checksum %d",
+		"%s %s size %u pktlog_checksum %d",
 		__get_str(driver),
 		__get_str(device),
 		__entry->buf_len,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 73869d445c5b..2e6ce28ecc8d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -169,7 +169,7 @@ ath11k_wmi_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 		len -= sizeof(*tlv);
 
 		if (tlv_len > len) {
-			ath11k_err(ab, "wmi tlv parse failure of tag %hhu at byte %zd (%zu bytes left, %hhu expected)\n",
+			ath11k_err(ab, "wmi tlv parse failure of tag %u at byte %zd (%zu bytes left, %u expected)\n",
 				   tlv_tag, ptr - begin, len, tlv_len);
 			return -EINVAL;
 		}
@@ -177,7 +177,7 @@ ath11k_wmi_tlv_iter(struct ath11k_base *ab, const void *ptr, size_t len,
 		if (tlv_tag < ARRAY_SIZE(wmi_tlv_policies) &&
 		    wmi_tlv_policies[tlv_tag].min_len &&
 		    wmi_tlv_policies[tlv_tag].min_len > tlv_len) {
-			ath11k_err(ab, "wmi tlv parse failure of tag %hhu at byte %zd (%hhu bytes is less than min length %zu)\n",
+			ath11k_err(ab, "wmi tlv parse failure of tag %u at byte %zd (%u bytes is less than min length %zu)\n",
 				   tlv_tag, ptr - begin, tlv_len,
 				   wmi_tlv_policies[tlv_tag].min_len);
 			return -EINVAL;
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
