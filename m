Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A57C71145
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 07:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IduWyZOZ/+IrLYJ0S+wwIME6Q1uQwL9H8qapWR6Gfi4=; b=efmcTPuqNukEz7
	ujLaDpbDYsj5ql8Y9ElqIib4Xxzd3LZvF+diuo9hQaAVfSRRh0+dH6kAwmIroYixb4L5tPN1dh9dD
	BgkDIYjJIL6mtuWnRhHfp9kxRteoFV4eQSsL622IWFHDChI7CYhmxrPKpeP5T7eFfUHtTMjouv0X7
	IxUW0ad9EhlS/Lmk6Yh0HtN6XTnjitof12MN6SBCdkkQ08TV7BhixnKglR2XsT9ytZVEjdQKcMqUu
	QhW5hX7/8ZChzwAXUYmnl32sbwZj3KGii/PUcCifQdbX0IncztXtwR9pFsJgbK7cyNgE9pHgn1RnL
	vMJm5SDj6K0IxAR4qVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5BG-002TRI-0d;
	Thu, 24 Aug 2023 07:55:02 +0000
Received: from forward100b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5BB-002TPe-0Y
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 07:55:00 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1e2b:0:640:94b5:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTP id 6859360135;
	Thu, 24 Aug 2023 10:54:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id nsFdET9WwmI0-HwLOH6sP;
	Thu, 24 Aug 2023 10:54:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692863691;
	bh=qXPc9WQi8jtJuPmLlZa3OkWLGJnQUKyL8ylyggIXN3A=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=mJ+aNj2/JL5/wG8219fWP9uNBivlCZ8FpalRTtxoiGGt/XrV9hodQD1Q2VMDzJHEO
	 vcbBx6zMaDzOuuVjw8HS51vaYiZjIoitKoLq8fVJDMIM7mNjVJi2I4BhBzAUQ7/nAx
	 nfodvXEofI40fOjA24wMXQ5Qpodb8IVOz2iQmbJk=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath11k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 3/5] wifi: ath11k: simplify spectral pull functions
Date: Thu, 24 Aug 2023 10:50:46 +0300
Message-ID: <20230824075121.121144-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824075121.121144-1-dmantipov@yandex.ru>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_005458_566824_B808212F 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Since 'ath11k_spectral_pull_summary()' and 'ath11k_spectral_pull_search()'
always returns 0, both of them may be converted to 'void' and
'ath11k_spectral_process_fft()' may be simplified accordingly.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/spectral.c | 24 ++++++++--------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 705868198df4..97eb2a457685 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -470,10 +470,10 @@ static const struct file_operations fops_scan_bins = {
 	.llseek = default_llseek,
 };
 
-static int ath11k_spectral_pull_summary(struct ath11k *ar,
-					struct wmi_dma_buf_release_meta_data *meta,
-					struct spectral_summary_fft_report *summary,
-					struct ath11k_spectral_summary_report *report)
+static void ath11k_spectral_pull_summary(struct ath11k *ar,
+					 struct wmi_dma_buf_release_meta_data *meta,
+					 struct spectral_summary_fft_report *summary,
+					 struct ath11k_spectral_summary_report *report)
 {
 	report->timestamp = __le32_to_cpu(summary->timestamp);
 	report->agc_total_gain = FIELD_GET(SPECTRAL_SUMMARY_INFO0_AGC_TOTAL_GAIN,
@@ -500,13 +500,11 @@ static int ath11k_spectral_pull_summary(struct ath11k *ar,
 					__le32_to_cpu(summary->info2));
 
 	memcpy(&report->meta, meta, sizeof(*meta));
-
-	return 0;
 }
 
-static int ath11k_spectral_pull_search(struct ath11k *ar,
-				       struct spectral_search_fft_report *search,
-				       struct ath11k_spectral_search_report *report)
+static void ath11k_spectral_pull_search(struct ath11k *ar,
+					struct spectral_search_fft_report *search,
+					struct ath11k_spectral_search_report *report)
 {
 	report->timestamp = __le32_to_cpu(search->timestamp);
 	report->detector_id = FIELD_GET(SPECTRAL_FFT_REPORT_INFO0_DETECTOR_ID,
@@ -531,8 +529,6 @@ static int ath11k_spectral_pull_search(struct ath11k *ar,
 				       __le32_to_cpu(search->info2));
 	report->rel_pwr_db = FIELD_GET(SPECTRAL_FFT_REPORT_INFO2_REL_PWR_DB,
 				       __le32_to_cpu(search->info2));
-
-	return 0;
 }
 
 static u8 ath11k_spectral_get_max_exp(s8 max_index, u8 max_magnitude,
@@ -629,11 +625,7 @@ int ath11k_spectral_process_fft(struct ath11k *ar,
 		return ret;
 	}
 
-	ret = ath11k_spectral_pull_search(ar, data, &search);
-	if (ret) {
-		ath11k_warn(ab, "failed to pull search report %d\n", ret);
-		return ret;
-	}
+	ath11k_spectral_pull_search(ar, data, &search);
 
 	chan_width_mhz = summary->meta.ch_width;
 
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
