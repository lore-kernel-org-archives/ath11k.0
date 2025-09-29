Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC8ECAC5B9
	for <ath11k@archiver.kernel.org>; Mon, 29 Sep 2025 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfQKgoj9sFKuTXtBwbqoDkLJI+gJiyffPRmuhrKgtQc=; b=PtS4YPLJlBAsIX2eCRj8gq51Q6
	V3QV4jyF4GOE51dXJ9ZRvyLvZyuGmO9kXrQanixuRapn4JsCRcliqp9GqMofHBVtDFyY44XbyCOWF
	Ys1GGVmgGgE+ht94wh3BiUlUwMYQQZKvrR0O/0jI6+mw4HoeuXs9KLNslB6Ms3Id9xiaVGBMh2v3J
	uiB810pz95l6+22pHrKhfr8jZjYaqhwWHZQE+UmEZfThpriX6YLDFtgFBtqlpFusw69aYHGcvVaPz
	B4bPaDNAwYgwL0RbFQETqHhHrugsGPslibM22X5lIwyzFEzshWXClwzOk7S/JBNJO4lIwVKw3cv2U
	0Zt9nn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3JRa-00000003LHP-0Dqr;
	Mon, 29 Sep 2025 19:21:54 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3JRW-00000003LGi-3Ifu
	for ath11k@lists.infradead.org;
	Mon, 29 Sep 2025 19:21:52 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 2A9E5EC0170;
	Mon, 29 Sep 2025 15:21:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 29 Sep 2025 15:21:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1759173709; x=
	1759260109; bh=bfQKgoj9sFKuTXtBwbqoDkLJI+gJiyffPRmuhrKgtQc=; b=Q
	XEsuj1XK0ok5o6RDn6FbMiz5tz1Ufhy64qZUXxr23JT0UQ4ZR5ko4By1j1fBo1HG
	udaiUNM+iffAF3RAdJIIAWhE1FZESSzFgt/zj5F+JaKUEuAYGaay71d57hudcL9Z
	IUIKZDoUi1V29vX29F714hXAIKTTRwkmW4o1lpIxQCHSG9qDNu2Sa7pnKFisTvpL
	PEW82mO7QlBwcnRr4CKwHizcgZxPRql6jrg+YTAkuPfLgDs7GpLro4rXMeTop/qa
	Jj2QVi7JZJQl79r2/DxgQpRieZMejLwdrJXuJqiOKmP8E4oTLcVpUCWR8RIMmFkH
	XDidxyySGep6F7qyK3yaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1759173709; x=1759260109; bh=b
	fQKgoj9sFKuTXtBwbqoDkLJI+gJiyffPRmuhrKgtQc=; b=HgmlHyFVsQtqRHdfg
	nnTkHgq8pVT/703XJvGcMGpQGSrhNrFoewFvHoE4E+SEoXwvg8vqMs9CFp5AVvsq
	WpQCNVDbshXiMrszVDLwe7TbvOoiXz0EGdM4C396ytPMum0NXwjSHVi83AQPL5Fa
	C2O5r2tsQQp0HOXhW5K1BFv+jPCIES0qcY/Za8W09eNz92YhgTZK6fS+ltzeF9Vh
	vG8rZ/8b6RSx1zdL4qlv2ynsoYcCv2AxjoyAwrhb1guZ43ZG5DVI8BenMkQUJZ7F
	me0LHnTAYdNmMezOCFZag0e0G7klsMpR87EEtwdmwOwrep0ptGQquSgFSGNazXAY
	p/aug==
X-ME-Sender: <xms:TNzaaC4TNlQkS4doqlyd0ucV2hJ9LZe21LruayHQT4SoTvqa7VakbA>
    <xme:TNzaaE3YpQaY8HS5jX5NDd-I9uWsjEtU6ZMHkNJZCvtNHbx2_050meXQPbfq17Nb0
    geyWSI9P-t1BFWPXWQ1Pup0pgZysOve8YfJkx8JTZMgTg3GUtC2I8Y>
X-ME-Received: <xmr:TNzaaNCOJ1jnkXl0uociQJPCDth7P2e4e4blxYmFRiseY3UKhO_YUdphKVAZfHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejkeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecuogetfedtuddqtdduucdludehmdenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforghrkhcurfgvrghrshhonhcu
    oehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtth
    gvrhhnpeevtdelgfeggfejtedtvdfgkefhuefguedtkeeffeduueduvdeiuedtleejvdfh
    vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhq
    uhgvsggsrdgtrgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdprhgtphht
    thhopehjjhhohhhnshhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghthhduud
    hksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    fihirhgvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:TNzaaPPvVxKVDzHu4qWCm3xqLRPONgJa5nIh2p4dex0gk7iWxZGJsg>
    <xmx:TNzaaCbXzAedOiNXkBZAVavcHL5MWE-m5CgU3DP2QoOmORHWlK0l4g>
    <xmx:TNzaaOsueYrO-BZwkIXiP1Dqog3nTGM3JPhr2JmaBTEkk_Rw2OjQOA>
    <xmx:TNzaaEPr2UZerHWnhKUBo9BJp3UZM3eiLvKYuEVY4xBzDkSk6oZBNA>
    <xmx:TdzaaOoYBrfZ47_QNhXSi0-3gff0j-bnt1AdM33PueMXnxDPphjZsfxB>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Sep 2025 15:21:48 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: jjohnson@kernel.org,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: Add missing platform IDs for quirk table
Date: Mon, 29 Sep 2025 15:21:35 -0400
Message-ID: <20250929192146.1789648-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_122151_223288_15C50B29 
X-CRM114-Status: GOOD (  10.05  )
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

Lenovo platforms can come with one of two different IDs.
The pm_quirk table was missing the second ID for each platform.

Add missing ID and some extra platform identification comments.
Reported on https://bugzilla.kernel.org/show_bug.cgi?id=219196

Tested-on: P14s G4 AMD.
Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")
Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
 - Correct typo for T14s G4 AMD to use correct ID. Sorry!
 - Added in Fixes and Tested-on tags correctly.

 drivers/net/wireless/ath/ath11k/core.c | 54 +++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index d49353b6b2e7..47522fa186a1 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -912,42 +912,84 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 static const struct dmi_system_id ath11k_pm_quirk_table[] = {
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
-		.matches = {
+		.matches = { /* X13 G4 AMD #1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21J3"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* X13 G4 AMD #2 */
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
 		},
 	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
-		.matches = {
+		.matches = { /* T14 G4 AMD #1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21K3"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* T14 G4 AMD #2 */
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
 		},
 	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
-		.matches = {
+		.matches = { /* P14s G4 AMD #1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21K5"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* P14s G4 AMD #2 */
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
 		},
 	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
-		.matches = {
+		.matches = { /* T16 G2 AMD #1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21K7"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /* T16 G2 AMD #2 */
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "21K8"),
 		},
 	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
-		.matches = {
+		.matches = { /*P16s G2 AMD #1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21K9"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /*P16s G2 AMD #2 */
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "21KA"),
 		},
 	},
 	{
 		.driver_data = (void *)ATH11K_PM_WOW,
-		.matches = {
+		.matches = { /*T14s G4 AMD #1 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21F8"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = { /*T14s G4 AMD #2 */
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
 		},
-- 
2.43.0


