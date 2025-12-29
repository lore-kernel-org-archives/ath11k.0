Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DF2E92FCB
	for <ath11k@archiver.kernel.org>; Mon, 29 Dec 2025 18:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qjp8rl3nPGoDuaselUVmykEowQaimV2zANlt7iKEMWo=; b=cQ2+gVnTTPczzKa5ltvSV2AnJ/
	86wpucukfagNSwyIo2Q9+QYowDM5OgND/vGL4pBF2yM0waRO0H9FlT8aWUhzkfkfhYeonmO60HEZT
	vyJP90VAjrn3oHXJYjdnKnK7R7c9Em07TOF7AHttpTlIZLhj1oFStqIvhmz/vso6gA/2RHH49iwbi
	dz1Rt158Z24QCEaVpb3WZ2zlcmWXQcCCJSVO/cqqZ3nP37xltwCIEqEron5I87gpvlze2/wshKxfe
	mXdb5BqiMUc0n4Wwpe0gGBnp+DZ4Kr++6Z8lDYoduTrPj15ZUuv1LJvbtM5a7HGVx3g7qqSzQvoto
	PSQsFA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIQ8-00000003zQX-1Jl6;
	Mon, 29 Dec 2025 18:56:44 +0000
Received: from ravenhurst-smtp-tx.kallisti.us ([2600:3c03:e000:2e0::5] helo=ravenhurst.kallisti.us)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIQ5-00000003zQ3-1Y7S
	for ath11k@lists.infradead.org;
	Mon, 29 Dec 2025 18:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kallisti.us
	; s=20220106; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qjp8rl3nPGoDuaselUVmykEowQaimV2zANlt7iKEMWo=; b=GL2QuF2a8Sc+cMz4VpJQy+tmXn
	/ZWJ9ef0eNZjKGXFILpehcH3xbDbmJxJ9rzYpTJyUwHOdA8YL52bMxVRMtdXYen4dRyC0nySUaoev
	XPHgV2/UR9aNsFGsYIXzB+Pd3955cK1L3dLABDGnUxYFZgW7dz0bKme1rWcIVCjxZ4wc60a3CrXvO
	7d4usFoVwDlL08v12kbXuwvM09LKpHUmOgNLcqTrw2KTpYYavOdYNf20ymPj5cgEcsfrBZlheBwRc
	roPtxCnVkdtomq9QKdGf+Ft9n84F9gfKF7nKl3Ir9oE5OEFbeSA9ngiGwLu7/33r/6X6xWNac+gbe
	Eg0mB4LA==;
Received: from [50.52.120.217] (helo=vanvanmojo.kallisti.us)
	by ravenhurst.kallisti.us with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <ross@kallisti.us>)
	id 1vaIPz-000000072eQ-1Zad;
	Mon, 29 Dec 2025 13:56:35 -0500
Date: Mon, 29 Dec 2025 10:56:31 -0800
From: Ross Vandegrift <ross@kallisti.us>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: add pm quirk for Thinkpad Z16 Gen1
Message-ID: <lqdj7qwifphuvho2ag6fi25y63on2lzur7of6yt5prz3rxveur@zofllv7qgf2w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_105641_415908_12FAC1C2 
X-CRM114-Status: GOOD (  10.57  )
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
it fixes the issue for me.

There's normally a second DMI product id, but I don't know what it is.
I also suspect Z13 Gen1 should be added too.  Mark, do you have those?

[1] - https://bugzilla.kernel.org/show_bug.cgi?id=219196

Signed-off-by: Ross Vandegrift <ross@kallisti.us>
---
 drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 812686173ac8..1c910db69738 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -994,6 +994,13 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
 		},
 	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* Z16 G1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D4"),
+		},
+	},
 	{}
 };
 
-- 
2.47.3


