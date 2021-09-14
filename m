Return-Path: <SRS0=aNMw=OE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22C8C433EF
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 16:38:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A46DF60EB6
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 16:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A46DF60EB6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/P106B2Wz3ap3JKoSxLq40Jyg24galGo8DyeKMN9LA=; b=Y+bgxW5dRTc4Aq
	guZ2MmrbOige6mu4fOktGlbvNXxRtq2mr5PndfOd5A9urNX4mvxGPhMoaKR4bhHGiiUMEVCEOhtIs
	1ePWUxhVT/U0DpIEHKS1cMCgxcJ+NdG8GHdAQOuhZK6Gk46tNG4FyBkKbPnOkKzxDIW2WM9MAtre0
	K07atFeT7koUpZBWVCJFzBJxWcNrLptD5oM4iSF0WE/B5t+copo4taoJvrZwFYaY69OcM1LEarx7q
	JnlFuRrXloaF6whWzp3vkR2qgCpg5pfsHQghSQjrKIY8guIdS+e8LyNyl8lMu3p5CuUtPdKst+oH8
	RK2VMy2x6Q7vI5kXWD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQBRa-006TeX-O0; Tue, 14 Sep 2021 16:38:02 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQBRU-006TZP-DU
 for ath11k@lists.infradead.org; Tue, 14 Sep 2021 16:38:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631637480; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wIoJOvqF8dE6kwZEz+Y+D1Dd0q2DEPU/2+Tzin+CbL0=;
 b=kPhUhOAZpMbz2oFF6j1oSlkTmOGKN0ayLbZHhRgoAryCeOrIMOaXPA9ytcbnP7pFbcmUCfVV
 AMv1JYgID+Pwgp9JIdqJBosvHFtmfQYQ1voZUutUkEw+LosBcbR2Gvazg15AD0Bv4s6e+fmb
 fPksWoQmvg0+rW83qEVYQfW9FDA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6140cfd3507800c880b23b17 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 16:37:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9D466C43618; Tue, 14 Sep 2021 16:37:38 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A46D4C43460;
 Tue, 14 Sep 2021 16:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A46D4C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/3] ath11k: set correct NL80211_FEATURE_DYNAMIC_SMPS for
 WCN6855
Date: Tue, 14 Sep 2021 19:37:26 +0300
Message-Id: <20210914163726.38604-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914163726.38604-1-jouni@codeaurora.org>
References: <20210914163726.38604-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_093800_139531_BB57813F 
X-CRM114-Status: GOOD (  16.47  )
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

From: Wen Gong <wgong@codeaurora.org>

Commit "ath11k: support SMPS configuration for 6 GHz" changed "if
(ht_cap & WMI_HT_CAP_DYNAMIC_SMPS)" to "if (ht_cap &
WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)" which means
NL80211_FEATURE_DYNAMIC_SMPS is enabled for all chips which support 6
GHz. However, WCN6855 supports 6 GHz but it does not support feature
NL80211_FEATURE_DYNAMIC_SMPS, and this can lead to MU-MIMO test failures
for WCN6855.

Disable NL80211_FEATURE_DYNAMIC_SMPS for WCN6855 since its ht_cap does
not support WMI_HT_CAP_DYNAMIC_SMPS.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 265ff225bd81..2bae8c5184d4 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -279,6 +279,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.sram_dump = &sram_dump_wcn6855,
 		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
 		.hal_params = &ath11k_hal_params_qca6390,
+		.check_dynamic_smps = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index c6831fb110ba..7463b96770b7 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -180,6 +180,7 @@ struct ath11k_hw_params {
 	const struct ath11k_hw_sram_dump *sram_dump;
 	u8 max_tx_ring;
 	const struct hal_param *hal_params;
+	bool check_dynamic_smps;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1f4765e43546..97a2c92b7b9b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7570,7 +7570,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	 * for each band for a dual band capable radio. It will be tricky to
 	 * handle it when the ht capability different for each band.
 	 */
-	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)
+	if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS ||
+	    (ar->supports_6ghz && !ab->hw_params.check_dynamic_smps))
 		ar->hw->wiphy->features |= NL80211_FEATURE_DYNAMIC_SMPS;
 
 	ar->hw->wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
