Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98723C54E41
	for <ath11k@archiver.kernel.org>; Thu, 29 Feb 2024 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etD7nXdUPW+wM9En1JEoPr/6++ncac2+Uo/5yHDDw2w=; b=yQLhZKl7uF+5sLldB6WjPucgpS
	2ZuCe/8Tfzw9qh5Zta5w4PkFHeSvtWfmt6EsdwhDZtyuYjogJslcM0Z0/veODM57tQzMXMCAMGJn3
	X7V7JRdhnW0lBaOjAU6jxoIerUqK1pJod7HsHt+3N1c+KN0Ef/JMm7vLtaVy8kveRejqrZkIh9csU
	FdlZGBf30dZi2f1OCAYZU/ip6OpQ6WcpFhy8ZSTKxXRgFr98oaBvNHk5CyWKrIndZud/AvRAtDO/D
	kvPC3dizqN0PZsYGBDTDcTJ7aQs1FGdq7A45RcpfaH6QEbP6NXNEBv/gnjxCxbN0fMZdMTmnAq0bc
	DCWro0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbyX-0000000CiBT-11H5;
	Thu, 29 Feb 2024 08:41:09 +0000
Received: from forward101b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfbyT-0000000Ci7f-2bSK
	for ath11k@lists.infradead.org;
	Thu, 29 Feb 2024 08:41:07 +0000
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:6e01:0:640:627f:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id 814E560A7A;
	Thu, 29 Feb 2024 11:40:59 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id teVSqmLJiW20-ppqodj5g;
	Thu, 29 Feb 2024 11:40:58 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1709196058; bh=etD7nXdUPW+wM9En1JEoPr/6++ncac2+Uo/5yHDDw2w=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=YVWJWqBzZPFo39FdY5QZJ0WeKhxQhrd54W3PQ4T/d8hlnf4+GBEshzvy191xaGHQk
	 JNxbWY4U8bwRZHHIijJvWPrZoHsj6W7qHMDst1NHXZ6fkA4UKlv8kOCktPbnVOEbL8
	 bmzUteaGyvzWNJX9I5dErU0rqipzgarnmmjpky8w=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 3/3] [v2] wifi: ath11k: fix few -Wmaybe-uninitialized warnings
Date: Thu, 29 Feb 2024 11:40:31 +0300
Message-ID: <20240229084031.51957-3-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229084031.51957-1-dmantipov@yandex.ru>
References: <788f1df8-64e1-4b3c-ae8e-00c67be1c3de@quicinc.com>
 <20240229084031.51957-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_004106_095669_068E8169 
X-CRM114-Status: GOOD (  13.16  )
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

drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_file_target_mem':
drivers/net/wireless/ath/ath11k/qmi.c:2401:16: warning: 'ret' may be used uninitialized
[-Wmaybe-uninitialized]
 2401 |         return ret;

drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_bdf_qmi':
drivers/net/wireless/ath/ath11k/qmi.c:2494:17: warning: 'fw_entry' may be used uninitialized
[-Wmaybe-uninitialized]
 2494 |                 release_firmware(fw_entry);

And a bunch of them traced to an uninitialized fields of the same
variable, e.g.:

drivers/net/wireless/ath/ath11k/spectral.c: In function 'ath11k_spectral_process_data':
drivers/net/wireless/ath/ath11k/spectral.c:700:47: warning: 'summ_rpt.meta.freq1' may
be used uninitialized [-Wmaybe-uninitialized]
  700 |         struct ath11k_spectral_summary_report summ_rpt;

Fix all of the above by using 0, NULL, and {} initializers, respectively.
Note there are few more (less obvious) -Wmaybe-uninitialized warnings
still remains, but they're hardly possible to fix without running on
a physical hardware. Compile tested only.

Also noticed by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: use {} initializer (Jeff Johnson) and aggregate to the series
---
 drivers/net/wireless/ath/ath11k/qmi.c      | 4 ++--
 drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 79e091134515..9834e7dc5120 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -697,7 +697,7 @@ static int ath11k_spectral_process_data(struct ath11k *ar,
 	struct ath11k_base *ab = ar->ab;
 	struct spectral_tlv *tlv;
 	struct spectral_summary_fft_report *summary = NULL;
-	struct ath11k_spectral_summary_report summ_rpt;
+	struct ath11k_spectral_summary_report summ_rpt = {};
 	struct fft_sample_ath11k *fft_sample = NULL;
 	u8 *data;
 	u32 data_len, i;
-- 
2.44.0


