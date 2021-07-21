Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B27C636C9
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA5E96113C
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 18:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA5E96113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58HoHo4quFB1fFm+Vsv+dw/0ThDKo9HF4qIcTYOWI44=; b=jHpVhNgBF4e8DR
	xDFcbkihgXlvpUfExACVk3qF9Myo2Xl5BtPWnRqCLjhORPicjKEDnhS2+bm9Sx6Mom3dl0h1gNhtx
	ddJJrxCn7aeHZTPO0SfRtp2ahKJtFmqoTRX44N+HJlzPrwmxHzV27D+EQADeP7XPeGw6l96rUulsL
	vrxR21jHWpYZeCIMXNMbf9wL96q1W/u9Lso4T6zsp5lhBF/hAGP2QPYD5NKUCqQmbsipXFz0xTKxD
	mIRJTXce4kYnSn/8jAeQeRYZQZNj+jWk4H0cv8j+O9Xc783tmNplOk/Pl63scdxqBJG6IGlZt8Qfn
	sNrMVvpNho2kOPYNnk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6GeO-00Gnr4-12; Wed, 21 Jul 2021 18:08:56 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6GeH-00GnkF-6j
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 18:08:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626890932; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=iw56kBFEnPJv2Ml359xnSyawWHHHwQ2ambPGYPjTJLA=;
 b=UxxLrAgN1SCjJVmLmZ4ybpiuxQraqnuWjMt+Y8OJeq37L8hCqRoB1M8yYk/Si9GKgJ26kHBa
 XkxIWmcJ53IFygkCyQz5YidqjPjjXxRUrb2/AobrwwWyX21qI9AjuvXywJP9Hy1kHmBDDm3V
 pGctDLuMicx/YJykroc2NHxDzDg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f862a1b653fbdaddc52aea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 18:08:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BD296C4338A; Wed, 21 Jul 2021 18:08:32 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F273EC433F1;
 Wed, 21 Jul 2021 18:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F273EC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 4/4] ath11k: Add spectral scan support for QCN9074
Date: Wed, 21 Jul 2021 21:08:09 +0300
Message-Id: <20210721180809.90960-5-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721180809.90960-1-jouni@codeaurora.org>
References: <20210721180809.90960-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_110853_103209_2F06B50F 
X-CRM114-Status: GOOD (  11.84  )
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

From: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Populate the below hw parameters as per the QCN9074 support
	1. FFT bin size as two bytes
	2. Maximum FFT bin count as 1024
	3. Summary report pad size as 16
	4. FFT report header length as 24

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 08b2e67c8e19..c97830633f1f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -201,6 +201,13 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.vdev_start_delay = false,
 		.htt_peer_map_v2 = true,
 		.tcl_0_only = false,
+		.spectral = {
+			.fft_sz = 2,
+			.fft_pad_sz = 0,
+			.summary_pad_sz = 16,
+			.fft_hdr_len = 24,
+			.max_fft_bins = 1024,
+		},
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
 					BIT(NL80211_IFTYPE_AP) |
 					BIT(NL80211_IFTYPE_MESH_POINT),
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
