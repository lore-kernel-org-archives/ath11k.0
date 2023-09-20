Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20B8CE79D0
	for <ath11k@archiver.kernel.org>; Wed, 20 Sep 2023 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8CrhOlGFfKAxfjpX8b4QPs3QmMRNb0Zl0Uzr20DTNOA=; b=r5OPwyl3SmNHQT
	T2G7An55Jh3IxiJxCJvHTAVuDKqf0phPj5ryP7XgOIx8nK6WoYiTnTBmbRSQJ2nxBoi4qalFajB+f
	O96W9q0wyaPWQUwUhTcbSwQkYttWIAjMk5BL+qRZzrzmWBEnomM7o3HdZKygFYeifNqragThBYjbG
	he4C1dPFqoEpk8S1zGHLG8BBkozjwIdu4YrV8CEkQcKTnRQvEL5T638kHjC8UYv3xVgKl4gC/fAFK
	hg+vjmRxAIw75vGBYulGtMJe21kSd6zfR9NNko0NWs6fvWF/QRl4TLn6lfP62PFejmzl+5jT08wVN
	tEb7selGdbXRXdEjDXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qivnb-002w3f-1N;
	Wed, 20 Sep 2023 11:55:19 +0000
Received: from forward100c.mail.yandex.net ([178.154.239.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qivnY-002w1s-35
	for ath11k@lists.infradead.org;
	Wed, 20 Sep 2023 11:55:18 +0000
Received: from mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:1215:0:640:367b:0])
	by forward100c.mail.yandex.net (Yandex) with ESMTP id A2270600FD;
	Wed, 20 Sep 2023 14:55:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 7tHqHADWpGk0-9GVgaGtu;
	Wed, 20 Sep 2023 14:55:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1695210908; bh=3c5PeWokgzzMqcgnV+f2qIXZF3JTEAld8A0W+J95PJ8=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=sDYpWZHFgIxY60G6G59Qiav2buPKKZklfcQ2AYVyEB/jwRo/RIn+AyMV9YcPdUb39
	 jvdOM0Pii9gu0gQBZyEWHNnkYHUGbAzKxpMPTbvGkLafA8eqRZL0ZfxjBofdsx3Gwc
	 I4FzNsgxe8NvVbDC1hGVzhWb3wVaqBhNS3+iD4pQ=
Authentication-Results: mail-nwsmtp-smtp-production-canary-88.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath11k: consistently use kstrtoul_from_user()
Date: Wed, 20 Sep 2023 14:54:43 +0300
Message-ID: <20230920115447.38355-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_045517_162264_DE1B5BC7 
X-CRM114-Status: UNSURE (   9.27  )
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

Use 'kstrtoul_from_user()' in 'ath11k_write_file_spectral_count()'
and 'ath11k_write_file_spectral_bins()' and so simplify both ones.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
Hopefully this doesn't violate "if it isn't broke, don't fix
it" rule (the same thing was recently accepted for ath9k).
---
 drivers/net/wireless/ath/ath11k/spectral.c | 26 +++++++---------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 705868198df4..51d0c4a56b93 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -382,16 +382,11 @@ static ssize_t ath11k_write_file_spectral_count(struct file *file,
 {
 	struct ath11k *ar = file->private_data;
 	unsigned long val;
-	char buf[32];
-	ssize_t len;
-
-	len = min(count, sizeof(buf) - 1);
-	if (copy_from_user(buf, user_buf, len))
-		return -EFAULT;
+	ssize_t ret;
 
-	buf[len] = '\0';
-	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+	ret = kstrtoul_from_user(user_buf, count, 0, &val);
+	if (ret)
+		return ret;
 
 	if (val > ATH11K_SPECTRAL_SCAN_COUNT_MAX)
 		return -EINVAL;
@@ -437,16 +432,11 @@ static ssize_t ath11k_write_file_spectral_bins(struct file *file,
 {
 	struct ath11k *ar = file->private_data;
 	unsigned long val;
-	char buf[32];
-	ssize_t len;
-
-	len = min(count, sizeof(buf) - 1);
-	if (copy_from_user(buf, user_buf, len))
-		return -EFAULT;
+	ssize_t ret;
 
-	buf[len] = '\0';
-	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+	ret = kstrtoul_from_user(user_buf, count, 0, &val);
+	if (ret)
+		return ret;
 
 	if (val < ATH11K_SPECTRAL_MIN_BINS ||
 	    val > ar->ab->hw_params.spectral.max_fft_bins)
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
