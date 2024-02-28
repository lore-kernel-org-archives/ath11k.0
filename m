Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5558C47DD9
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BKd6AYY/qyTKWtkQvGPqgumRbX+7Xt8jtiNMbeWZso8=; b=jOJBKD1J05A+pF+oqtmX8xQ2wj
	CY78ArKCWRsY6zShDgcdZLQGgs/eWpRN9r6e6p7dzqM/TFAjzsDRCxqTGqmLYbKpjxWdHYaSzPGZx
	/P+aOfIDGP220wWdvr2liBb+xYKaBw9O5yNnEMzEak2eH+xuq/URQb8rom/QhJyna/+XlP4tSLtrB
	Fw+X/HVbD9Xs/0PWN+SADLGQU/Lf3bVOzoil/F0zZ6XiZNwK29EiAkb7DVpBaf3K1bRESxSxHOnhU
	kxvituKTzoGf2943NG/eVgleLNZb2pODpbSW8ZwGiPTvWAr2Qi5ci3n3oA+oRNocZJJuPEl7DkxQN
	shhkFPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJll-00000009QkG-1oG6;
	Wed, 28 Feb 2024 13:14:45 +0000
Received: from forward102c.mail.yandex.net ([178.154.239.213])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJlh-00000009Qh7-2GQp
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 13:14:44 +0000
Received: from mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:440b:0:640:fa3a:0])
	by forward102c.mail.yandex.net (Yandex) with ESMTPS id 4158D60A9D;
	Wed, 28 Feb 2024 16:14:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id TEZITt9GcOs0-3Rndb7bc;
	Wed, 28 Feb 2024 16:14:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1709126070; bh=BKd6AYY/qyTKWtkQvGPqgumRbX+7Xt8jtiNMbeWZso8=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=Zh6vIBIwD3HKf9QXIrjO+8dxj1pcdIn9cM52S56TGPK+j8f2ohMsArG9Hrg2bvWM+
	 QRbCArehx8ZXhYeVYtG1rVpfTsHGfRFUcNKIMdDz3R6naDJkDfJvJebX3XuMiYhw7z
	 7OCVP8Ft/flXLxBlFn30noMdVXAfTbzMZ+JVgdVA=
Authentication-Results: mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath11k: fix few -Wmaybe-uninitialized warnings
Date: Wed, 28 Feb 2024 16:14:06 +0300
Message-ID: <20240228131406.165786-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_051442_184660_84DA465E 
X-CRM114-Status: GOOD (  12.93  )
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

When compiling with gcc version 14.0.1 20240226 (experimental) and
W=12, I've noticed the following warnings:

drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_op_remain_on_channel':
drivers/net/wireless/ath/ath11k/mac.c:9230:12: warning: 'ret' may be used uninitialized
[-Wmaybe-uninitialized]
 9230 |         if (ret)

drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_file_target_mem':
drivers/net/wireless/ath/ath11k/qmi.c:2401:16: warning: 'ret' may be used uninitialized
[-Wmaybe-uninitialized]
 2401 |         return ret;

drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_bdf_qmi':
drivers/net/wireless/ath/ath11k/qmi.c:2494:17: warning: 'fw_entry' may be used uninitialized
[-Wmaybe-uninitialized]
 2494 |                 release_firmware(fw_entry);

And a bunch of them traced to uninitialized fields of the same
variable, e.g.:

drivers/net/wireless/ath/ath11k/spectral.c: In function 'ath11k_spectral_process_data':
drivers/net/wireless/ath/ath11k/spectral.c:700:47: warning: 'summ_rpt.meta.freq1' may
be used uninitialized [-Wmaybe-uninitialized]
  700 |         struct ath11k_spectral_summary_report summ_rpt;

Fix all of the above by using 0 and NULL initializers where appropriate.
Note there are few more (less obvious) -Wmaybe-uninitialized warnings
still remains, but they're hardly possible to fix without running on
a physical hardware. Compile tested oly.

Also noticed by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/mac.c      | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.c      | 4 ++--
 drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a6a37d67a50a..b89bc7ceaaa7 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9201,7 +9201,7 @@ static int ath11k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
 	struct ath11k *ar = hw->priv;
 	struct ath11k_vif *arvif = ath11k_vif_to_arvif(vif);
 	struct scan_req_params *arg;
-	int ret;
+	int ret = 0;
 	u32 scan_time_msec;
 
 	mutex_lock(&ar->conf_mutex);
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 5006f81f779b..4477f652e068 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2293,7 +2293,7 @@ static int ath11k_qmi_load_file_target_mem(struct ath11k_base *ab,
 	struct qmi_txn txn;
 	const u8 *temp = data;
 	void __iomem *bdf_addr = NULL;
-	int ret;
+	int ret = 0;
 	u32 remaining = len;
 
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
@@ -2406,7 +2406,7 @@ static int ath11k_qmi_load_bdf_qmi(struct ath11k_base *ab,
 {
 	struct device *dev = ab->dev;
 	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
-	const struct firmware *fw_entry;
+	const struct firmware *fw_entry = NULL;
 	struct ath11k_board_data bd;
 	u32 fw_size, file_type;
 	int ret = 0, bdf_type;
diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 79e091134515..4c826b539404 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -697,7 +697,7 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
 	struct ath11k_base *ab = ar->ab;
 	struct spectral_tlv *tlv;
 	struct spectral_summary_fft_report *summary = NULL;
-	struct ath11k_spectral_summary_report summ_rpt;
+	struct ath11k_spectral_summary_report summ_rpt = { 0 };
 	struct fft_sample_ath11k *fft_sample = NULL;
 	u8 *data;
 	u32 data_len, i;
-- 
2.43.2


