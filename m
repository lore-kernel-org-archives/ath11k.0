Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB60EFDEE4D
	for <ath11k@archiver.kernel.org>; Thu, 23 Apr 2026 21:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VkI+kJH653kLgpHLSQ4P+17HKlApcKg+ogIwy7rHFZs=; b=XxoG/+xb83XEC5zCzYn8W0PWDn
	rbMDL57zfQzyaFKvkmPfmRa8awcCU6NEWVe8lkbNVcWhZrCXmZVA4mKJ07/Ub9cV/lDkOvN9V6HR/
	G3KmoMdeuFXwp4Usj4P5uUyBoBEUyiGtXGlFwLgNo13UM+i1hu9ZOjEkZeK6+60EemNrn0eBgxM2C
	PMm+jU5+ferniUtyicogNlUoQfvYfSEAT4COco6MaNNgGUgnby5recsB2h2Lw/M3xyfS8KWqFIgwf
	ea913onHTZ0o0xIJOLIbxvw6ZIs+1FA49CIqv59e1koMYd6TU/DJqSorB1lDXYRIdxneo7QMGpkqb
	EgcreKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1O7-0000000CKFA-0i2P;
	Thu, 23 Apr 2026 21:15:07 +0000
Received: from mx0.riseup.net ([198.252.153.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1O4-0000000CKDP-1Zou
	for ath11k@lists.infradead.org;
	Thu, 23 Apr 2026 21:15:05 +0000
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4g1plB3Y0vz9smD;
	Thu, 23 Apr 2026 21:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1776978902; bh=VkI+kJH653kLgpHLSQ4P+17HKlApcKg+ogIwy7rHFZs=;
	h=From:To:Cc:Subject:Date:From;
	b=GGRI4A1ZHTn6vDPRyLn+nbZV62lQbds483e6MIDf1x49DhKPRniIZAyC4IjSgaeK5
	 uzFakNzx0lGHpSrsnQ9K4wEsRPh8gfxbTnCnMtv+S7zR8OGd5fQGqJKG2W23YYokEI
	 HIJkrFVxS2WORMt0buwT89qW1EQNbNUq+ltSBxsk=
X-Riseup-User-ID: 1C3BC6EB3A684F2CA7FD9299946DD4FA0670C2ADF181111521174CAB2B0814B9
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4g1pl92zQ1z22My;
	Thu, 23 Apr 2026 21:15:01 +0000 (UTC)
From: =?UTF-8?q?Santiago=20Ruano=20Rinc=C3=B3n?= <santiagorr@riseup.net>
To: Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	kfarnung@outlook.com,
	koike@igalia.com
Subject: [PATCH] wifi: ath11k: Add two missing Lenovo IDs to the quirk table
Date: Thu, 23 Apr 2026 18:14:54 -0300
Message-ID: <20260423211458.458911-1-santiagorr@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_141504_481853_B2CB42FF 
X-CRM114-Status: UNSURE (   9.14  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for quirk
table") added some Lenovo platform IDs to the quirk table to address a
wakeup from suspend issue [1].  However, at least two more platform ID
are missing in that table: P14s Gen 5 AMD, as reported by Kyle Farnung [2]
and P14s Gen 3 AMD.  This commit adds one ID for each.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
[2] https://bugzilla.kernel.org/show_bug.cgi?id=219196#c23

Tested-on: P14s G3 AMD.

Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")
Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
---
 drivers/net/wireless/ath/ath11k/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 3f6f4db5b7ee..56938d5d42a1 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -957,6 +957,13 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
 		},
 	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* P14s G3 AMD */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21J5"),
+		},
+	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
 		.matches = { /* P14s G4 AMD #1 */
@@ -971,6 +978,13 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
 		},
 	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* P14s Gen 5 AMD */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
+		},
+	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
 		.matches = { /* T16 G2 AMD #1 */
-- 
2.53.0


