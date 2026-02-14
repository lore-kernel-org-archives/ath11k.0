Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B404CEF5855
	for <ath11k@archiver.kernel.org>; Sat, 14 Feb 2026 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWk7hSSYb5Femz4tm04VaAzcrJLpwh3NfoBFPna66NA=; b=fyq7N2UeI93gXIcUujAihiT8OR
	xJTnwy5hIU3J0tmgP3Ig8QxAlSmKTNClouCtBcsPp/9P8TtwQ7PaKTje+dozdLCGRDMYCICLvkCcC
	MYsUE0NSeGnOYIEr7S4pONu3Act3qglzjvBxobecDeAqIDNvkAku44TOd7XtJbQ2S7zovcShSsQmR
	kRcWPAMp9yVKcsrZz8Bic6q39uQwoV7VuqIuo2DrbPoNUWgEaIWhWKXZnrDfr+o/BY1B3SPXBh7kR
	+fALFKMsGWIfVsITcZrItZw7uVsgWhLpGleu4ExtQbktpgF+n57N8Z3uOogmYwPAoUkAr9j2l2zTQ
	lqtB+pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN8Q-00000004wjv-0VVI;
	Sat, 14 Feb 2026 21:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrN8M-00000004wjF-3l2p
	for ath11k@lists.infradead.org;
	Sat, 14 Feb 2026 21:25:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D94240592;
	Sat, 14 Feb 2026 21:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1ADC19422;
	Sat, 14 Feb 2026 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771104296;
	bh=fxEy/VAQh7Q7g3K0+kZaqByD2cwf947wO4nxZ/CQB4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H2ktMjGCjDB6a2Dj2HpGptgRUc6wlHS0/xu+9de1f3kDkibBHeDtFPO3+c98JB+td
	 pShAga1eVSTBGwfrUAG5JdrX7s46+GHiyYIiwPF6Ep4uKFWA/P82NOeVPTJH4tUj5h
	 aztHxheSYG8Ze5s4aUsfb0JuAIea/y4V7EJzC8IaJ/izJsw1JPBqfJOgZwZHgAaxC8
	 zQ3nKyeaN4AUm/Fs/TCk+0EtaiAvQVmkI6odYqkyQkxbfkLQFS+M/Cwocs5KhFLhpx
	 OmT22MmjQc3LCeaGhpVigPjij9BZ44TVYJYbaNFr65WQuc+fh92d7si06IY3G+0h6W
	 VcC9ApXDzapHg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Qian Zhang <qian.zhang@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.12] wifi: ath11k: Fix failure to connect to a 6 GHz AP
Date: Sat, 14 Feb 2026 16:22:27 -0500
Message-ID: <20260214212452.782265-2-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214212452.782265-1-sashal@kernel.org>
References: <20260214212452.782265-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_132458_976785_70720312 
X-CRM114-Status: GOOD (  16.04  )
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

From: Qian Zhang <qian.zhang@oss.qualcomm.com>

[ Upstream commit 0bc8c48de6f06c0cac52dde024ffda4433de6234 ]

STA fails to connect to a 6 GHz AP with the following errors:
 ath11k_pci 0000:01:00.0: failed to handle chan list with power type 1
 wlp1s0: deauthenticating from c8:a3:e8:dd:41:e3 by local choice (Reason: 3=DEAUTH_LEAVING)

ath11k_reg_handle_chan_list() treats the update as redundant and
returns -EINVAL. That causes the connection attempt to fail.

Avoid unnecessary validation during association. Apply the regulatory
redundant check only when the power type is IEEE80211_REG_UNSET_AP,
which only occurs during core initialization.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Link: https://patch.msgid.link/20260108034607.812885-1-qian.zhang@oss.qualcomm.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The key prerequisite is `e3d373ec4f02b` which added the 6 GHz regulatory
type support and the `power_type` parameter to
`ath11k_reg_handle_chan_list()`. This was merged in v6.9 cycle. For
stable trees that don't have this function signature, the patch wouldn't
apply anyway (and wouldn't be needed since 6 GHz support wouldn't exist
in the same form).

### Summary

**What the fix does**: Narrows a regulatory update redundancy check to
only apply during core initialization (`IEEE80211_REG_UNSET_AP`), not
during association with a 6 GHz AP. Also fixes a memory leak on the
early-return path by properly calling `ath11k_reg_reset_info()`.

**Why it matters for stable users**: Without this fix, users with ath11k
WiFi cards (WCN6855, etc.) cannot connect to 6 GHz WiFi 6E access points
at all. This is a complete connectivity failure, not a subtle
performance issue.

**Meets stable criteria**:
- Obviously correct and tested on real hardware
- Fixes a real, user-visible bug (WiFi connection failure)
- Fixes an important issue (complete loss of 6 GHz WiFi connectivity)
- Small and contained (5 lines of logic in 1 file)
- Does not introduce new features
- Also fixes a memory leak (bonus)

**Risk assessment**: Very low. The change is conservative — it only
narrows an existing condition. The worst case scenario is that the
redundancy check doesn't fire during association, which is the correct
behavior since the regulatory update should be processed during
association.

**Dependencies**: Requires `e3d373ec4f02b` (6 GHz regulatory type
support) in the stable tree. This limits backport to 6.9+ stable trees,
but for those trees this fix is important.

**YES**

 drivers/net/wireless/ath/ath11k/reg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index d62a2014315a0..49b79648752cf 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause-Clear
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/rtnetlink.h>
 
@@ -926,8 +926,11 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 	 */
 	if (ab->default_regd[pdev_idx] && !ab->new_regd[pdev_idx] &&
 	    !memcmp((char *)ab->default_regd[pdev_idx]->alpha2,
-		    (char *)reg_info->alpha2, 2))
-		goto retfail;
+		    (char *)reg_info->alpha2, 2) &&
+	    power_type == IEEE80211_REG_UNSET_AP) {
+		ath11k_reg_reset_info(reg_info);
+		return 0;
+	}
 
 	/* Intersect new rules with default regd if a new country setting was
 	 * requested, i.e a default regd was already set during initialization
-- 
2.51.0


