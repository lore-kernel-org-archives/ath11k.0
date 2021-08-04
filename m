Return-Path: <SRS0=Cifq=M3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99C1C4320A
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 18:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91A7D60F35
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 18:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91A7D60F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kwfhw6GtfK9Sd0i+ZVRFyuEJVz1L0C+H8V6AVCyp9t0=; b=iQhqj5bLt/pLbe
	oPYDyyoZKEz95hWtYugpZ4ZXLQSEvYOBUHJHUV9dB9cGzF8PEHKrj5GGKCeuOJwc3E7uJN3eLeTV9
	FqOyprezpqpfMrY/nSI+rgd71ZV93UeplMe8PIbbZhdulGM+WJYeETCt5jUafOWHSQc3Bytl/wkyh
	MYT7ysZMaFgKNVeOndbr7aDLxJ3RqfztJZ+hllEj6jBIdrBJ/W0Pa1cIGwTWuBUNNWm07YhRBi8Oq
	3EFyF97XIoClQWrdLM3h3l/mkT8UeS3YV2Gps38uJqhObkE7sjOYg3LSp75UEaolbJ7WgFL8nDEmB
	CaFIP0dy7k8PB9XvSsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBLNv-0078ih-Mo; Wed, 04 Aug 2021 18:12:55 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBLNo-0078dq-4w
 for ath11k@lists.infradead.org; Wed, 04 Aug 2021 18:12:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628100772; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YHpXMJRZpoJmaQV1ah1HjLRlJ7e+sclU9XDYMISB9O0=;
 b=uQ3fnQcvAJLGUgCekbSiu9C3WHUMpQYP+Bv2cNXaMip7kh2lW2lXb9OKJcpE3Ozy3U++SZMC
 Fwkv93AZKymSqMt+Hnc8JfFCLEVf1XZnz3mih+fi02OH+zSgfa9fD5uIH+t/upYYHKizsdr0
 gQp9BEikgtvvvlUf/dMhpVgPF48=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 610ad8911a9008a23ebe9c69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Aug 2021 18:12:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2816CC433D3; Wed,  4 Aug 2021 18:12:33 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-77-199-nat.elisa-mobile.fi
 [85.76.77.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4236EC43460;
 Wed,  4 Aug 2021 18:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4236EC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/3] ath11k: enable 6G channels for WCN6855
Date: Wed,  4 Aug 2021 21:12:16 +0300
Message-Id: <20210804181217.88751-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804181217.88751-1-jouni@codeaurora.org>
References: <20210804181217.88751-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_111252_568058_5B9B8B0A 
X-CRM114-Status: GOOD (  17.15  )
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

For some chips such as WCN6855, single_pdev_only is set in struct
ath11k_hw_params which means ath11k calls ieee80211_register_hw() only
once and create only one device interface, and that device interface
supports all 2G/5G/6G channels.

ath11k_mac_setup_channels_rates() sets up the channels and it is called
for each device interface. It is called only once for single_pdev_only,
and then set up all channels for 2G/5G/6G. The logic of
ath11k_mac_setup_channels_rates() is not suitable for single_pdev_only,
it leads to all 6G channels being disabled for the device interface
which is single_pdev_only such as WCN6855.

Add channel frequency checks for the 6G band and enable the 6G channels
properly based on what is supported by the chip.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index c83a968fc7ba..04a8f82e3a17 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7213,7 +7213,7 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 					   u32 supported_bands)
 {
 	struct ieee80211_supported_band *band;
-	struct ath11k_hal_reg_capabilities_ext *reg_cap;
+	struct ath11k_hal_reg_capabilities_ext *reg_cap, *temp_reg_cap;
 	void *channels;
 	u32 phy_id;
 
@@ -7223,6 +7223,7 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 		     ATH11K_NUM_CHANS);
 
 	reg_cap = &ar->ab->hal_reg_cap[ar->pdev_idx];
+	temp_reg_cap = reg_cap;
 
 	if (supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		channels = kmemdup(ath11k_2ghz_channels,
@@ -7241,11 +7242,11 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 
 		if (ar->ab->hw_params.single_pdev_only) {
 			phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_2G_CAP);
-			reg_cap = &ar->ab->hal_reg_cap[phy_id];
+			temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
 		}
 		ath11k_mac_update_ch_list(ar, band,
-					  reg_cap->low_2ghz_chan,
-					  reg_cap->high_2ghz_chan);
+					  temp_reg_cap->low_2ghz_chan,
+					  temp_reg_cap->high_2ghz_chan);
 	}
 
 	if (supported_bands & WMI_HOST_WLAN_5G_CAP) {
@@ -7265,9 +7266,15 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 			band->n_bitrates = ath11k_a_rates_size;
 			band->bitrates = ath11k_a_rates;
 			ar->hw->wiphy->bands[NL80211_BAND_6GHZ] = band;
+
+			if (ar->ab->hw_params.single_pdev_only) {
+				phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_5G_CAP);
+				temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
+			}
+
 			ath11k_mac_update_ch_list(ar, band,
-						  reg_cap->low_5ghz_chan,
-						  reg_cap->high_5ghz_chan);
+						  temp_reg_cap->low_5ghz_chan,
+						  temp_reg_cap->high_5ghz_chan);
 		}
 
 		if (reg_cap->low_5ghz_chan < ATH11K_MIN_6G_FREQ) {
@@ -7290,12 +7297,12 @@ static int ath11k_mac_setup_channels_rates(struct ath11k *ar,
 
 			if (ar->ab->hw_params.single_pdev_only) {
 				phy_id = ath11k_get_phy_id(ar, WMI_HOST_WLAN_5G_CAP);
-				reg_cap = &ar->ab->hal_reg_cap[phy_id];
+				temp_reg_cap = &ar->ab->hal_reg_cap[phy_id];
 			}
 
 			ath11k_mac_update_ch_list(ar, band,
-						  reg_cap->low_5ghz_chan,
-						  reg_cap->high_5ghz_chan);
+						  temp_reg_cap->low_5ghz_chan,
+						  temp_reg_cap->high_5ghz_chan);
 		}
 	}
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
