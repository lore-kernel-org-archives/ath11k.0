Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671DDC5AE59
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 02:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Plqgza0BSjshqZMIINpdNmmulzlcxz173yM49E5OgQ=; b=rI63DQpIg5jyt6YFfAp1jDp0Qy
	/xamPlw8PMp7oy0nu+Q6WKWPg3EPk5yrVt0DaunUb5wZnG/NTOa6EIbX8NIx8uvbJrjT91ADyPB9M
	LVfVd+h3qAGQlUIoQTCoRFpfQsoHWq+oUQaE/BITAt1jim8Pj1s1lP7DqGgSwTaWArVp4VoOm6dPR
	pjyi8gimC6FdCPeWzlbRXZddkZXH0oP6kUr93JY9CVazIF6tXTvSKMIRCBsyJiGiSihVGpfqpq0K+
	8qFZfFgk1x50ZOXsJ5B+TGRfCBSVm1XIVdekPU6k6KrtiotFaPZ9o8SHpXXy7AaF3JnELlou7Ly/s
	Wqzm7Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeF3-0000000CMPE-02MC;
	Wed, 04 Jun 2025 02:52:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcXv-0000000C8am-1zn8
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 01:03:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5565629E6;
	Wed,  4 Jun 2025 01:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1A5C4CEED;
	Wed,  4 Jun 2025 01:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999038;
	bh=vsadlEq658FL6rxyroyxw5ezva2/VAoEGbScX/P5FsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EgQuKVFAjMUBKrvawrvlrnxCWuG4yKEo8IVEjjfxG4LVINYnkKMDcQPvoViv4KXgY
	 njsonTUINTRhLL7qLZjWrh7UBSFBOugHsxYmcBb2h4azu64pvN1wh0+oF1hk92uFxz
	 ap7yo1JbpPg9ZJnLqA3SDtgJVXtmvTvlUKZSEXO/0mS4rJ206+gH1h03El/ebaX7Bc
	 T9cJ+VBnwrAYuZSOizpPGYlnPcvlQ9tpuvEmWC/j4j8CKQVfZHpHUW+IqFjw2J5jaV
	 RRdcqR2YmPLVO/Dmz2P/LpQbYpsywfyNsBcwA+WlIgM3iU3E94nEZ3zUKwb/8lweLU
	 ref05AFi7J27g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Takashi Iwai <tiwai@suse.de>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 59/62] wifi: ath11k: determine PM policy based on machine model
Date: Tue,  3 Jun 2025 21:02:10 -0400
Message-Id: <20250604010213.3462-59-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010213.3462-1-sashal@kernel.org>
References: <20250604010213.3462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit ce8669a27016354dfa8bf3c954255cb9f3583bae ]

To handle the Lenovo unexpected wakeup issue [1], previously we revert
commit 166a490f59ac ("wifi: ath11k: support hibernation"). So currently
WLAN target is put into WoWLAN mode during suspend. This is a temporary
solution as it does not work on machines where WLAN power is cut off.

The thought here is that we do WoWLAN suspend on Lenovo machines while
do non-WoWLAN suspend (which is done in the reverted commit) on other
machines. This requires us to identify Lenovo machines from others.
For that purpose, read board vendor and product name from DMI interface,
match it against all known affected machines. If there is a match, choose
WoWLAN suspend mode, else choose non-WoWLAN mode. Save the mode in ab
for later reference.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219196

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Tested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Link: https://patch.msgid.link/20250328-ath11k-bring-hibernation-back-v3-1-23405ae23431@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should definitely be backported to stable kernel
trees. Here's my detailed analysis: ## Bug Fix Nature This commit
clearly fixes a specific user-visible bug affecting Lenovo laptops with
WiFi suspend/wake functionality. The commit message explicitly
references bugzilla.kernel.org issue #219196, indicating this addresses
real user complaints about unexpected wakeup behavior. This aligns
perfectly with the **YES** backport example (Similar Commit #1) which
also reverted hibernation support due to Lenovo platform suspend issues.
## Code Changes Analysis ### 1. DMI Quirk Table Addition ```c +static
const struct dmi_system_id ath11k_pm_quirk_table[] = { + { +
.driver_data = (void *)ATH11K_PM_WOW, + .matches = { +
DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"), + DMI_MATCH(DMI_PRODUCT_NAME,
"21J4"), + }, + }, ``` This is a standard, low-risk pattern used
throughout the kernel for hardware-specific workarounds. It only affects
machines that exactly match the DMI criteria. ### 2. PM Policy
Infrastructure ```c +enum ath11k_pm_policy { + ATH11K_PM_DEFAULT, +
ATH11K_PM_WOW, +}; ``` The commit adds a simple enum and uses existing
WoWLAN suspend mechanisms rather than introducing new power management
code. ### 3. Policy Selection Logic ```c + dmi_id =
dmi_first_match(ath11k_pm_quirk_table); + if (dmi_id) + ab->pm_policy =
(kernel_ulong_t)dmi_id->driver_data; + else + ab->pm_policy =
ATH11K_PM_DEFAULT; ``` This is straightforward DMI matching that sets a
policy flag without changing core functionality. ## Risk Assessment
**Extremely Low Risk:** - **Scope**: Only affects specific Lenovo laptop
models (21J4, 21K4, 21K6, 21K8, 21KA, 21F9) - **Fallback**: Non-matching
machines continue using existing default behavior - **Tested Path**:
WoWLAN suspend mode is already implemented and working - **No Core
Changes**: Doesn't modify suspend/resume logic, just selects which path
to use ## Comparison to Reference Commits This follows the same pattern
as **Similar Commit #1** (marked YES), which also addressed Lenovo
platform suspend issues by reverting hibernation support. Both commits:
- Target specific hardware compatibility issues - Use conservative
approaches (WoWLAN vs full hibernation) - Have minimal code footprint -
Address real user bug reports Unlike the **NO** examples which add new
features (WoWLAN support, new suspend capabilities), this commit uses
existing infrastructure to fix hardware-specific incompatibilities. ##
Stable Tree Criteria Alignment ✅ **Fixes important bugs** - Suspend/wake
functionality on laptops ✅ **Small and contained** - Only DMI table and
policy selection ✅ **Low regression risk** - Targeted to specific
hardware ✅ **User-visible impact** - Improves power management behavior
✅ **No architectural changes** - Uses existing WoWLAN mechanisms This is
an ideal stable backport candidate that fixes real user issues with
minimal risk.

 drivers/net/wireless/ath/ath11k/core.c | 55 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h |  7 ++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index fc7c4564a715c..51cc612b0c01a 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -704,6 +704,52 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 	},
 };
 
+static const struct dmi_system_id ath11k_pm_quirk_table[] = {
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21K8"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21KA"),
+		},
+	},
+	{
+		.driver_data = (void *)ATH11K_PM_WOW,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
+		},
+	},
+	{}
+};
+
 static inline struct ath11k_pdev *ath11k_core_get_single_pdev(struct ath11k_base *ab)
 {
 	WARN_ON(!ab->hw_params.single_pdev_only);
@@ -2011,8 +2057,17 @@ EXPORT_SYMBOL(ath11k_core_pre_init);
 
 int ath11k_core_init(struct ath11k_base *ab)
 {
+	const struct dmi_system_id *dmi_id;
 	int ret;
 
+	dmi_id = dmi_first_match(ath11k_pm_quirk_table);
+	if (dmi_id)
+		ab->pm_policy = (kernel_ulong_t)dmi_id->driver_data;
+	else
+		ab->pm_policy = ATH11K_PM_DEFAULT;
+
+	ath11k_dbg(ab, ATH11K_DBG_BOOT, "pm policy %u\n", ab->pm_policy);
+
 	ret = ath11k_core_soc_create(ab);
 	if (ret) {
 		ath11k_err(ab, "failed to create soc core: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index b044477624837..a85ba934932d6 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -840,6 +840,11 @@ struct ath11k_msi_config {
 	u16 hw_rev;
 };
 
+enum ath11k_pm_policy {
+	ATH11K_PM_DEFAULT,
+	ATH11K_PM_WOW,
+};
+
 /* Master structure to hold the hw data which may be used in core module */
 struct ath11k_base {
 	enum ath11k_hw_rev hw_rev;
@@ -992,6 +997,8 @@ struct ath11k_base {
 	} testmode;
 #endif
 
+	enum ath11k_pm_policy pm_policy;
+
 	/* must be last */
 	u8 drv_priv[] __aligned(sizeof(void *));
 };
-- 
2.39.5


