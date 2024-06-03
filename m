Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F374C41513
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdfEPpYp2q55Lbd2/moAUzqffW0IB2tS5IgblPD0OA8=; b=yNi2kbczoOhDYpDW+SpjS2HN/Z
	mgMKkygBQZEsOIgTEg97eSzQZrBLHC842n3j5CnSHtGWuyYyeeYurW6BoRLKsN0P6fngJ1XkWcjy1
	X0i/J85MML+ZmznpH/iYNkVZv1N1LckuKSqMjp19QAzvzl2zZ5bJTz/64rr4VKtyZb/4NQKWX516T
	h/zuB79di8zgX/VT/sxi9gjrwD8nspzkfYTRHuMeLKRqfXY4qfGGCyqhg2vHAOb7Ca2r1+x8o7GyT
	ZZLZk4IuD+leXDZtLbDxf1xH9uuPAPQ1lX+3Y2/rCRpjNZWtzW7CGQWU0OcgkJzM105Q0Rao5DnUF
	MDd2lABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3nJ-0000000G9yW-0upy;
	Mon, 03 Jun 2024 09:15:57 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3nF-0000000G9wz-35Xy
	for ath11k@lists.infradead.org;
	Mon, 03 Jun 2024 09:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=LdfEPpYp2q55Lbd2/moAUzqffW0IB2tS5IgblPD0OA8=; b=NGzWma
	CVcolg6ZPrhBUwk1hNWstW5WslGXGh9X4xJVd+aOGNFRTOtgzHi77MTYd1szZseA
	pjQ/5aoNkBnm7yMiViL5bZf/RwXmeNX1D4MH30dmXReeZOax9ewXf0zIw9jDDbQQ
	+byec288G7tXebFyoMNuk/9U7Z7zgB3SwHo93MrGQssLsAHWawlWYsSLKsbLtH/N
	+d7s/0PbfaJn1MNRoj+l3p9cH7ZnK8MXY2roydMSCoXhL2VOqwWWVY1iDhhc95hx
	qH8eeJqOdEHkl77DLg/m98mnPN8jWld5wcttt0yq6C5S12vrdHys15Nndax2Qbad
	Aq5lFb08sx2QJhQA==
Received: (qmail 1899265 invoked from network); 3 Jun 2024 11:15:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:15:45 +0200
X-UD-Smtp-Session: l3s3148p1@fPQ9x/gZ+oUgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH 1/6] wifi: ath11k: use 'time_left' variable with wait_event_timeout()
Date: Mon,  3 Jun 2024 11:15:34 +0200
Message-ID: <20240603091541.8367-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603091541.8367-1-wsa+renesas@sang-engineering.com>
References: <20240603091541.8367-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_021554_831736_B949F17D 
X-CRM114-Status: GOOD (  10.04  )
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_event_timeout() causing patterns like:

	timeout = wait_event_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index d4a243b64f6c..2fe0ef660456 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2859,7 +2859,7 @@ int ath11k_qmi_firmware_start(struct ath11k_base *ab,
 
 int ath11k_qmi_fwreset_from_cold_boot(struct ath11k_base *ab)
 {
-	int timeout;
+	long time_left;
 
 	if (!ath11k_core_coldboot_cal_support(ab) ||
 	    ab->hw_params.cbcal_restart_fw == 0)
@@ -2867,11 +2867,11 @@ int ath11k_qmi_fwreset_from_cold_boot(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "wait for cold boot done\n");
 
-	timeout = wait_event_timeout(ab->qmi.cold_boot_waitq,
-				     (ab->qmi.cal_done == 1),
-				     ATH11K_COLD_BOOT_FW_RESET_DELAY);
+	time_left = wait_event_timeout(ab->qmi.cold_boot_waitq,
+				       (ab->qmi.cal_done == 1),
+				       ATH11K_COLD_BOOT_FW_RESET_DELAY);
 
-	if (timeout <= 0) {
+	if (time_left <= 0) {
 		ath11k_warn(ab, "Coldboot Calibration timed out\n");
 		return -ETIMEDOUT;
 	}
@@ -2886,7 +2886,7 @@ EXPORT_SYMBOL(ath11k_qmi_fwreset_from_cold_boot);
 
 static int ath11k_qmi_process_coldboot_calibration(struct ath11k_base *ab)
 {
-	int timeout;
+	long time_left;
 	int ret;
 
 	ret = ath11k_qmi_wlanfw_mode_send(ab, ATH11K_FIRMWARE_MODE_COLD_BOOT);
@@ -2897,10 +2897,10 @@ static int ath11k_qmi_process_coldboot_calibration(struct ath11k_base *ab)
 
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "Coldboot calibration wait started\n");
 
-	timeout = wait_event_timeout(ab->qmi.cold_boot_waitq,
-				     (ab->qmi.cal_done  == 1),
-				     ATH11K_COLD_BOOT_FW_RESET_DELAY);
-	if (timeout <= 0) {
+	time_left = wait_event_timeout(ab->qmi.cold_boot_waitq,
+				       (ab->qmi.cal_done  == 1),
+				       ATH11K_COLD_BOOT_FW_RESET_DELAY);
+	if (time_left <= 0) {
 		ath11k_warn(ab, "coldboot calibration timed out\n");
 		return 0;
 	}
-- 
2.43.0


