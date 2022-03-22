Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4AEC433F5
	for <ath11k@archiver.kernel.org>; Tue, 22 Mar 2022 03:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y81OAwiBwhcbAs4tDNshcBUIQZIx9CmFI0TjFtJkr3s=; b=InOYL6nRFdIKR/
	DLXTW/WnKHnSB+FRsT6WNs985c/1t4C0rOC52w4v4reRs5kXAsjQuC8xzX4oy513pGLAHhYt7h0rY
	+Gps4ZbBG6a89IG0fdGL8/Y1ogUmIBdb7pkqlXE2C6i4qWLvE4ymB+nv+2xV3/i7gS0GS3kumpxQB
	Dpe1xPP/KgDTngxKVM6S+XEEjyv+r2IvgqZstTtbdtpK80iRGILFN2grWKK2wc7umSADxHdZB1CoN
	PCdez1ajDrrFlGiCUF/u/ohnz/lXjjTI2JejhriDMJH+85DaGGsbtct0jA6i0R7pCPcAMpHDYcjCA
	oD5tLekcIS6Nd80Mbbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWV6f-009sLT-Jh; Tue, 22 Mar 2022 03:22:49 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWV6c-009sKV-NI
 for ath11k@lists.infradead.org; Tue, 22 Mar 2022 03:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647919366; x=1679455366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HSNnzBWbE5MmfhaOQEyYaWxuxKcVUVnQ9QNFKwIpyg4=;
 b=bXX5BKgbl+tlW/DBE4Pdd7t7dB1WlqLI7Oj9a0eQkVMmPKhuuakfVKvi
 Ij5V2Vd0ei0tPZ+q/uHNBjqFe2vKapd9C6vuMwHrE5IACt+HxrwSxyaX6
 RyEy0aj7bKhsoPHlZxuddVqLaJvrYhXU9pHq0hD4rxqOm3ABLAM/TIoCw U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Mar 2022 20:22:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 20:22:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 20:22:41 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 21 Mar 2022 20:22:40 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: store and send country code to firmware after recovery
Date: Mon, 21 Mar 2022 23:22:24 -0400
Message-ID: <20220322032224.11382-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_202246_831286_18E905BA 
X-CRM114-Status: GOOD (  11.91  )
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

Currently ath11k does not send the country code to firmware after device
recovery, as a result the regdomain info is reported from firmware by
default. Regdomain info is important, so ath11k also need to restore
it to the value which was used before recovery.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
depends on the patchset "ath11k: add feature for device recovery"
https://patchwork.kernel.org/project/linux-wireless/cover/20220228064606.8981-1-quic_wgong@quicinc.com/
which already exist in master-pending branch of ath.git

 drivers/net/wireless/ath/ath11k/core.c | 1 +
 drivers/net/wireless/ath/ath11k/core.h | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 8 ++++++++
 drivers/net/wireless/ath/ath11k/reg.c  | 1 +
 4 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 17c205e1c39c..0bded1c5dc98 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1261,6 +1261,7 @@ static void ath11k_update_11d(struct work_struct *work)
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
 
+		memcpy(&ar->alpha2, &set_current_param.alpha2, 2);
 		ret = ath11k_wmi_send_set_current_country_cmd(ar, &set_current_param);
 		if (ret)
 			ath11k_warn(ar->ab,
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 719667fcfb9e..8c23cacdbb99 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -619,6 +619,7 @@ struct ath11k {
 	bool regdom_set_by_user;
 	int hw_rate_code;
 	u8 twt_enabled;
+	u8 alpha2[REG_ALPHA2_LEN + 1];
 };
 
 struct ath11k_band_cap {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c9524e417cf6..9cca7c79c995 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7917,6 +7917,14 @@ ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH11K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		if (ar->ab->hw_params.current_cc_support &&
+		    ar->alpha2[0] != 0 && ar->alpha2[1] != 0) {
+			struct wmi_set_current_country_params set_current_param = {};
+
+			memcpy(&set_current_param.alpha2, ar->alpha2, 2);
+			ath11k_wmi_send_set_current_country_cmd(ar, &set_current_param);
+		}
+
 		if (ab->is_reset) {
 			recovery_count = atomic_inc_return(&ab->recovery_count);
 			ath11k_dbg(ab, ATH11K_DBG_BOOT,
diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 81e11cde31d7..35eb1a0c04dc 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -83,6 +83,7 @@ ath11k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 	 */
 	if (ar->ab->hw_params.current_cc_support) {
 		memcpy(&set_current_param.alpha2, request->alpha2, 2);
+		memcpy(&ar->alpha2, &set_current_param.alpha2, 2);
 		ret = ath11k_wmi_send_set_current_country_cmd(ar, &set_current_param);
 		if (ret)
 			ath11k_warn(ar->ab,

base-commit: d845cf007bdf8b2bf41522e1ecd0eb804e553d57
prerequisite-patch-id: 8bb6c2b19d735f076e8f60a4fe10ceea3ad1b80d
prerequisite-patch-id: 480ddeb9d867bda9fc673b0dd2af7e8fd0e1d184
prerequisite-patch-id: 2d69ea48692d11b6d8681447fa8f63d2753a7780
prerequisite-patch-id: bcfccd769faad1aa219c7e7d2b59def344c4a152
prerequisite-patch-id: abc29d03fdea060832fb3216c635991de46d0254
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
