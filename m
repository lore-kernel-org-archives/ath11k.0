Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67359EF5855
	for <ath11k@archiver.kernel.org>; Sat, 14 Feb 2026 21:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGA3qce0pMgK5nD3xJB2S0Pl8lHWXqa0BxNwGHhq21Q=; b=0g2QPDjCvU+yAWBOEK4NzYawJW
	BzJuxmCbtIxubooY/x3wWLSXpV4tFKgEvTfjyVLY5Apu99XFkViP9RfU6eTRQGeN9W0tlMhhLJe60
	kFtdq0MGH2TVUYEaWkTJcAPceRUbUyXznQ8WtlG2X2MqY9dh51JPopPguXzFbim42KhUkvdeNR1L0
	3wpqQcSyGMU5K2yQTlkD8ffvpMkoSahDPf9QHEL3bPMjozmQv2bYNpylkM7pO5nuHKcjtUMj+QlX+
	VknxwZjIvoV/NrGX3f7DHlDtZ0KM9NBSJCmXzW9X9Z3Gz71UfJE1wO3J8N5M4rRSHaERgvkRHtBEE
	x+oWKNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN9O-00000004wvT-0IvW;
	Sat, 14 Feb 2026 21:26:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN9M-00000004wu6-1koi
	for ath11k@lists.infradead.org;
	Sat, 14 Feb 2026 21:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F8E16011F;
	Sat, 14 Feb 2026 21:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2F1C19423;
	Sat, 14 Feb 2026 21:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104358;
	bh=LfB/OXHK6nNuZXdd4ErG/FdhVBuHyGyB7eImBfTn8ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fny6I+Ah2cJEkwHGKIlvJPmiWBrCAryO2eAJ8N6N3pVP6mu/ez60oz90y6WTlv6+W
	 s+bigyKqlwQ+pQlShTTQCPWFRXaqGcJlRGiA6sK276d0TWbDs9QaJp55pcD548BZhW
	 N5HXDUbbXZn9C7+B5c4LurClax/bxkdWq+oI3HEzEdITCs9pQGT/g+SlzbYbEANssX
	 ZjVORSKCuHS324kDjQt4Vzzd6mwVjiquajRXmV3wTeQJL5p/sonadNCf2iCm8+Gui6
	 haR/MJgUPTwuQOvxFt32yv3aMk9S0YUGcXIL6ZVw6AIutpD/YohV9BwdqmrvVlFamS
	 WIhHTeLDHnp5Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ross Vandegrift <ross@kallisti.us>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.6] wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
Date: Sat, 14 Feb 2026 16:23:03 -0500
Message-ID: <20260214212452.782265-38-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214212452.782265-1-sashal@kernel.org>
References: <20260214212452.782265-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
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

From: Ross Vandegrift <ross@kallisti.us>

[ Upstream commit 4015b1972763d7d513172276e51439f37e622a92 ]

Z16 Gen1 has the wakeup-from-suspend issues from [1] but was never added
to the appropriate quirk list.  I've tested this patch on top of 6.18.2,
it fixes the issue for me on 21D4

Mark Pearson provided the other product IDs covering the second Z16 Gen1
and both Z13 Gen1 identifiers.  They share the same firmware, and folks
in the bugzilla report do indeed see the problem on Z13.

[1] - https://bugzilla.kernel.org/show_bug.cgi?id=219196

Signed-off-by: Ross Vandegrift <ross@kallisti.us>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Link: https://patch.msgid.link/wj7o2kmb7g54stdjvxp2hjqrnutnq3jbf4s2uh4ctvmlxdq7tf@nbkj2ebakhrd
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### Commit Message Analysis

This commit adds DMI-based power management quirk entries for Lenovo
ThinkPad Z13 Gen1 and Z16 Gen1 laptops to the `ath11k_pm_quirk_table[]`.
The commit message clearly states:

- The Z16 Gen1 has known wakeup-from-suspend issues documented in kernel
  bugzilla #219196
- The fix has been tested on actual hardware (21D4 model)
- Additional product IDs were provided by Mark Pearson (Lenovo engineer)
  covering both Z13 Gen1 and Z16 Gen1 variants
- The devices share the same firmware and users in the bugzilla confirm
  the problem exists on Z13 as well

### Code Change Analysis

The change adds exactly 4 new DMI table entries to the existing
`ath11k_pm_quirk_table[]` array:
- Z13 G1: product names "21D2" and "21D3"
- Z16 G1: product names "21D4" and "21D5"

Each entry follows the identical pattern as every other entry in the
table:
```c
{
    .driver_data = (void *)ATH11K_PM_WOW,
    .matches = {
        DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
        DMI_MATCH(DMI_PRODUCT_NAME, "XXXX"),
    },
},
```

This is a pure data addition — no logic changes, no new code paths, no
new APIs.

### Classification: Hardware Quirk/Workaround

This falls squarely into the **QUIRKS and WORKAROUNDS** exception
category explicitly called out in the stable kernel rules. It adds
hardware-specific quirk entries for devices with broken suspend/resume
behavior. The quirk table and the `ATH11K_PM_WOW` mechanism already
exist in the kernel — this merely extends coverage to additional laptop
models.

### Risk Assessment

- **Risk: Extremely low.** Adding DMI match entries to an existing quirk
  table cannot break anything for other users. The entries only activate
  on the specific Lenovo product IDs listed.
- **Scope: Minimal.** Only one file changed, only data additions, no
  logic changes.
- **Testing: Strong.** The commit has `Tested-by:` from Mark Pearson
  (Lenovo), `Reviewed-by:` from both the Qualcomm ath11k maintainer
  (Baochen Qiang) and Mark Pearson, and was tested by the author on
  actual hardware.

### User Impact

- **Problem:** WiFi fails to work properly after suspend/resume on
  ThinkPad Z13/Z16 Gen1 laptops — a critical issue for laptop users.
- **Affected users:** All owners of these specific Lenovo ThinkPad
  models using the ath11k WiFi driver.
- **Severity:** High — broken suspend/resume on a laptop is a
  significant usability issue that affects daily use.
- **Bugzilla link:** The issue is documented with multiple users
  confirming it.

### Dependency Check

No dependencies on other commits. The quirk table infrastructure already
exists in stable trees. The entries follow the exact same format as
existing entries.

### Conclusion

This is a textbook stable backport candidate: a small, zero-risk, data-
only addition of hardware quirk entries to an existing table, fixing a
real and well-documented suspend/resume bug on specific laptop models,
with proper testing and review from both the hardware vendor and the
subsystem maintainer.

**YES**

 drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 812686173ac8a..03dddc1cd003a 100644
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
2.51.0


