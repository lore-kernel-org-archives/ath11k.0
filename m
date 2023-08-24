Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A685C7EE2C
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIrV/IZ5UIdfEHomy/GPsh5BfVEFaIzr8ppxqO0/6Ho=; b=WfdL1ugzpbIOIu
	UAMSR9opOz9wHGc4xWxo8/lWnmPzJ2q4hiCLdUnq2qNi93/b4xyzYvJ++2srT/dEElWxqgnJ7b/WH
	d1wQQGHv35saAPdzfI/9iq2NwDk7fdzdwTZKlCV0nnaA/s6VnzR03KInOujc/mDpHkR1x+z43mMqP
	pvlVGBCF367BrjnSdgQYXSniM0zebiySeBIW+ivXPY1BZPETy+fFHxofJb3vanEJX0gfROS6QaDzD
	UD3/pJZUVV7vnQGiBnymeks4r6hSLyuzoFO8RCJS8BdWLlrhrkyA/A/a5LZ1KaBbHAy0qUzGliz6e
	peg09kKrUgpoMgZtJX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5BH-002TRm-2d;
	Thu, 24 Aug 2023 07:55:03 +0000
Received: from forward100c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5BB-002TPd-0Y
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 07:55:01 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1e2b:0:640:94b5:0])
	by forward100c.mail.yandex.net (Yandex) with ESMTP id 24483600FD;
	Thu, 24 Aug 2023 10:54:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id nsFdET9WwmI0-OPLZSoHf;
	Thu, 24 Aug 2023 10:54:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692863692;
	bh=6NdYX2kixUoSH55JuKhY1SO/fR7GYU/C2rIRwedWVkU=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=XZ++PEfEK0ZpaFblRX3KQPGyWtXtZDhJZo0YrZ+9tvYrEuOGFjJl8ccbHwoYAl+Nu
	 NjQGHH/xbRFuO4JtMWO6V2TsDKfgAxCQDAFRvTFLz0sIYuZiKUPHbPajmTZ7onZOwI
	 MR2CE/Qc+d815TFFN9XgmQ0eB7m4e4k7pnyn8iRs=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	Tom Rix <trix@redhat.com>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath11k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 4/5] wifi: ath11k: use kstrtoul_from_user() where appropriate
Date: Thu, 24 Aug 2023 10:50:47 +0300
Message-ID: <20230824075121.121144-4-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824075121.121144-1-dmantipov@yandex.ru>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_005458_566949_3FA6A63F 
X-CRM114-Status: UNSURE (   9.25  )
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
and 'ath11k_write_file_spectral_bins()'

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/spectral.c | 26 +++++++---------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 97eb2a457685..b5530e484507 100644
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
