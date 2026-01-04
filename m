Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E221C2A064
	for <ath11k@archiver.kernel.org>; Sun,  4 Jan 2026 01:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=shza/H2dQJXR6JluhC10VoHA78PjwQvcEkvEM14HAIs=; b=Pt+23hMW6x7MZyV8QuXvFk1ISJ
	BiU/F2Qcx4AVxBxkeY7CMv/NdyFY3jj9zI+wROw/qh2TSHgOTjIiHR7qq1CMNARMN5/p/1mSDK2na
	NLYC3VWuVC36jXFYKEifvMW9ttiw5EoP9PPGpt4RJUZ+yJzpWlJYXxnn0AKO3kc0BumvaRwgE0QUx
	Q/zDecidBa0MlDrSSRe7PgYm1p6rDVWIr+A2AFcRdZpRfGQzV2xqJOnntKnIA2Sz6fiH5i7/g+bvm
	e0NrH1WjQsHVOf6CbIhBXbO8sKvYjSmeuPZuExKWja8dnoWWYbmg/xc/2LQoIKsS081sEgLBcg+eA
	OieFDeXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcCUB-00000009vUC-1vjC;
	Sun, 04 Jan 2026 01:00:47 +0000
Received: from ravenhurst-smtp-tx.kallisti.us ([2600:3c03:e000:2e0::5] helo=ravenhurst.kallisti.us)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcCU8-00000009vTX-1cRk
	for ath11k@lists.infradead.org;
	Sun, 04 Jan 2026 01:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kallisti.us
	; s=20220106; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=shza/H2dQJXR6JluhC10VoHA78PjwQvcEkvEM14HAIs=; b=iIJXRjT619TuNfMsXRwcqEsur6
	lgE3VPCDm8f1wA7pw+IEn/9nctnSyq5orub5XaaY5tWmYUmy7jOb85N0unKcUJZwDUt58zsEGwIlN
	m4SMDjOb2hds/86RKk/pDCOJSSehU1n7REkpHqpPTD5TcfgTtPIcOI4+eGxv1E/tlia/GejxpN7TW
	8taoTx4smdtdY519u8gvxKUXk7afJvZDlS8dgkBVbJGCw+qBWm/1to6wvz3UEUXEadKcjAGEZJuGX
	8vl8YVAfnwP2+KChv0xVdSRRaCUaLRfC60A0gLukd8HXDbe+d54EH0qJvBnlObwgvp5KMmM9U9PjI
	GFsyhObg==;
Received: from [50.52.120.217] (helo=vanvanmojo.kallisti.us)
	by ravenhurst.kallisti.us with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <ross@kallisti.us>)
	id 1vcCU2-00000007agP-1q50;
	Sat, 03 Jan 2026 20:00:38 -0500
Date: Sat, 3 Jan 2026 17:00:34 -0800
From: Ross Vandegrift <ross@kallisti.us>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
Message-ID: <wj7o2kmb7g54stdjvxp2hjqrnutnq3jbf4s2uh4ctvmlxdq7tf@nbkj2ebakhrd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_170044_437274_C6B1A004 
X-CRM114-Status: UNSURE (   9.74  )
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

Z16 Gen1 has the wakeup-from-suspend issues from [1] but was never added
to the appropriate quirk list.  I've tested this patch on top of 6.18.2,
it fixes the issue for me on 21D4

Mark Pearson provided the other product IDs covering the second Z16 Gen1
and both Z13 Gen1 identifiers.  They share the same firmware, and folks
in the bugzilla report do indeed see the problem on Z13.

[1] - https://bugzilla.kernel.org/show_bug.cgi?id=219196

Signed-off-by: Ross Vandegrift <ross@kallisti.us>
---
 drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 812686173ac8..03dddc1cd003 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -994,6 +994,34 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
 		},
 	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* Z13 G1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D2"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* Z13 G1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D3"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* Z16 G1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D4"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* Z16 G1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
+		},
+	},
 	{}
 };
 
-- 
2.47.3


