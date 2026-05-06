Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE33CD342C
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 20:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FBStJu5AVvcG88W9ms1p6fIs0VIKAoPet7WSD3JdXYY=; b=MiyhmO2vagjaMiUYlhzVAuM/cw
	/DOuvB4wXgFgbnaGt90KI4m1BI6Ik2+geaj0TYbrMCy8TZKg43Nv+C7Z2CWDlvGUCGYmNNDPHTQ8f
	Mc8i+N0u7hfdneoEL0NDMRXioRvcS6YXYespsz7qjfu2Agt/IvR87iwEnBIoXO2P4KXPh8vsG3Cx6
	nJ7WvTKYSB0eFwI8ItmiM1yPs51CDf/h8gs7CFNZTS4O5G9th7WB4AklN28lhMpZSg75WW/TIO2c0
	m0J28ey96Jl4uMxXebUcI+F+cf9RU+dQLm3oxqQPYiUa8ZYcBL8QatCkmSwEzuBp8FoMTFOU+Uo4J
	LoQ1JiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKiSQ-00000001w2s-1XOj;
	Wed, 06 May 2026 20:02:58 +0000
Received: from mx0.riseup.net ([198.252.153.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKiSO-00000001w2R-3nTq
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 20:02:57 +0000
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4g9mWy6nlBz9shx;
	Wed,  6 May 2026 20:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1778097775; bh=FBStJu5AVvcG88W9ms1p6fIs0VIKAoPet7WSD3JdXYY=;
	h=From:To:Cc:Subject:Date:From;
	b=rlqqI4/sRmkdMPJFfOVjGhA4mmzOwFUM/XK4XCwU2q4ni5FnSjE8ZwTK7sFbWhuRK
	 jLBFhEIrEzM1Z4D30Lr24Erm6BbhpTZklSllg3hAM6eT5H/e06N+SP2WgiB3ztlJNy
	 xELG5NYdlUI67iKp4bwfl/Jlp9zBM6k8EfnBOWrA=
X-Riseup-User-ID: CCE37216CA06750F7617076F546FDAFBDF4B17FA4091129CBB3034E01BC13F24
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4g9mWx0SxXz1y6Y;
	Wed,  6 May 2026 20:02:52 +0000 (UTC)
From: =?UTF-8?q?Santiago=20Ruano=20Rinc=C3=B3n?= <santiagorr@riseup.net>
To: Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	kfarnung@outlook.com,
	koike@igalia.com
Subject: [PATCH v2] wifi: ath11k: Add two missing Lenovo IDs to the quirk table
Date: Wed,  6 May 2026 16:54:46 -0300
Message-ID: <20260506200249.317690-1-santiagorr@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_130257_006644_530644BE 
X-CRM114-Status: GOOD (  10.83  )
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
wakeup from suspend issue [1].  However, at least P14s Gen 5 AMD, as
reported by Kyle Farnung [2], and P14s Gen 3 AMD are missing in the
table.  This commit adds the two corresponding Lenovo version IDs for
each.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
[2] https://bugzilla.kernel.org/show_bug.cgi?id=219196#c23

Tested-on: P14s G3 AMD running 7.0.3.

Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")
Co-authored-by: Kyle Farnung <kfarnung@gmail.com>
Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
---
Changes in v2:
- Merged the Lenovo P14s G5 AMD #1 and #2 related changes proposed by
  Kyle Farnung in
  https://lore.kernel.org/all/20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com/
- Added Kyle Farnung as Co-author of the commit
- Added the second ID of Lenovo P14s G3 AMD, and adapt the comments
  accordingly
- v1: https://lore.kernel.org/ath11k/20260423211458.458911-1-santiagorr@riseup.net/
---
 drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 3f6f4db5b7ee..c1ce0a11af44 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -957,6 +957,20 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
 		},
 	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* P14s G3 AMD #1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21J5"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* P14s G3 AMD #2 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
+		},
+	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
 		.matches = { /* P14s G4 AMD #1 */
@@ -971,6 +985,20 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
 		},
 	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* P14s G5 AMD #1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* P14s G5 AMD #2 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
+		},
+	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
 		.matches = { /* T16 G2 AMD #1 */
-- 
2.53.0


