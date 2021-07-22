Return-Path: <SRS0=fz0E=MO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83696C63797
	for <ath11k@archiver.kernel.org>; Thu, 22 Jul 2021 10:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5292E61289
	for <ath11k@archiver.kernel.org>; Thu, 22 Jul 2021 10:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5292E61289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWacDFhOhdJcFI/Ta6p5cpqA3TVeW2ZQRYRCQDYp2Lw=; b=GgRZWTa9kgfobQ
	8vDjXKjRmHIlACLYXzsm3o7peWisSK61C8M0xCWS7lGhA27M+BgsCWoJTZp7eSgAvDGcodoYwtjKq
	hZ9VwZUuG7UWw6Hm9t1muNfnCalzx2a1fgyH6giY18rUGtSnIBfLgX44F8lX9vS5BLN3Fwy6FtGoI
	8XrklzLdk6M3FSmfQbiy/MUEsENZ1OeVUlQm4r+qapR48SZTPxvitWYt2QvN9bSExQXp+Iudb8f8A
	JJbVcggLEGB5slfJCzaAKkRTEaXLe1hbcdpw3jl3IXnlzcDn7OI4DuJumKholDEGJDYr1Tp83z02N
	I0GXZxdOUd3NfrVYCdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VpX-001CXg-B3; Thu, 22 Jul 2021 10:21:27 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VpJ-001CTA-Fu
 for ath11k@lists.infradead.org; Thu, 22 Jul 2021 10:21:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626949276; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Z6he0fZsKF9btV5t8ENd5pIp0RgzPSh7F0zadVElmwk=;
 b=T4ifZQELyhNnQ+xbl98TU2yFDChATjyHMy3mWXbLTv155IDSsPNd4Ddh2N7bRCQmT8KiMaXd
 fAVPlR4ay7jSK4wvUAXzOzxhamZHZOgKv8WD3zqmLUUBm7y4QFY4s/lXedVe4lFf6xbLVjuj
 JEvbRwyDWyO4bPY9EVSqgD/ZZq8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60f94690fcf9fe7b7876d4eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 10:21:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DBB3BC43460; Thu, 22 Jul 2021 10:21:04 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A9F5C433D3;
 Thu, 22 Jul 2021 10:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1A9F5C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/3] ath11k: fix packet drops due to incorrect 6 GHz freq
 value in rx status
Date: Thu, 22 Jul 2021 13:20:53 +0300
Message-Id: <20210722102054.43419-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722102054.43419-1-jouni@codeaurora.org>
References: <20210722102054.43419-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_032116_486551_4E18FDBB 
X-CRM114-Status: GOOD (  14.47  )
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

From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Frequency in rx status is being filled incorrectly in the 6 GHz band as
channel number received is invalid in this case which is causing packet
drops. So fix that.

Fixes: 5dcf42f8b79d ("ath11k: Use freq instead of channel number in rx path")
Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c |  9 ++++++---
 drivers/net/wireless/ath/ath11k/wmi.c   | 10 +++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 9d9af6d65afd..90da56316e7e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2393,8 +2393,10 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 	channel_num = meta_data;
 	center_freq = meta_data >> 16;
 
-	if (center_freq >= 5935 && center_freq <= 7105) {
+	if (center_freq >= ATH11K_MIN_6G_FREQ &&
+	    center_freq <= ATH11K_MAX_6G_FREQ) {
 		rx_status->band = NL80211_BAND_6GHZ;
+		rx_status->freq = center_freq;
 	} else if (channel_num >= 1 && channel_num <= 14) {
 		rx_status->band = NL80211_BAND_2GHZ;
 	} else if (channel_num >= 36 && channel_num <= 173) {
@@ -2412,8 +2414,9 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
 				rx_desc, sizeof(struct hal_rx_desc));
 	}
 
-	rx_status->freq = ieee80211_channel_to_frequency(channel_num,
-							 rx_status->band);
+	if (rx_status->band != NL80211_BAND_6GHZ)
+		rx_status->freq = ieee80211_channel_to_frequency(channel_num,
+								 rx_status->band);
 
 	ath11k_dp_rx_h_rate(ar, rx_desc, rx_status);
 }
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5e196829ecf3..e7429d17030b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -6184,8 +6184,10 @@ static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 	if (rx_ev.status & WMI_RX_STATUS_ERR_MIC)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-	if (rx_ev.chan_freq >= ATH11K_MIN_6G_FREQ) {
+	if (rx_ev.chan_freq >= ATH11K_MIN_6G_FREQ &&
+	    rx_ev.chan_freq <= ATH11K_MAX_6G_FREQ) {
 		status->band = NL80211_BAND_6GHZ;
+		status->freq = rx_ev.chan_freq;
 	} else if (rx_ev.channel >= 1 && rx_ev.channel <= 14) {
 		status->band = NL80211_BAND_2GHZ;
 	} else if (rx_ev.channel >= 36 && rx_ev.channel <= ATH11K_MAX_5G_CHAN) {
@@ -6206,8 +6208,10 @@ static void ath11k_mgmt_rx_event(struct ath11k_base *ab, struct sk_buff *skb)
 
 	sband = &ar->mac.sbands[status->band];
 
-	status->freq = ieee80211_channel_to_frequency(rx_ev.channel,
-						      status->band);
+	if (status->band != NL80211_BAND_6GHZ)
+		status->freq = ieee80211_channel_to_frequency(rx_ev.channel,
+							      status->band);
+
 	status->signal = rx_ev.snr + ATH11K_DEFAULT_NOISE_FLOOR;
 	status->rate_idx = ath11k_mac_bitrate_to_idx(sband, rx_ev.rate / 100);
 
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
