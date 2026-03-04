Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C816E67A8A
	for <ath11k@archiver.kernel.org>; Wed,  4 Mar 2026 12:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhHwvehmTHZtifYiXh4Tzw8zeAax+/ugk5zeNJe7YzY=; b=pUXShtYD0kLmoMM/XgLuO02x5G
	jMiIqRUhfEyAAqb7UMHs2gger4D+xOef4rcqYM5D9lEZKSG01v/jhGR1NRy1MIfb4499+BTM5c1XR
	srQZRtW2xvDlJa7ZyGBwtT3AKKeN8bnWH6Q3JShpJXfdQbhV+tUsZYSvD7zSLDSfWrzsxqJIPPQ4p
	BEWyvZYKpa9vonmDa1bWoTWnRNdZH+CBegvV3Nkd5OYrpgBfcd/sXOBEQeUSfP/OFLOlGRkAJ1orZ
	tI8/uhBV8ZYBUekfg5kwJxBe3wBnCdU0+xkYCWtjH08ekwE3VKa5hIda98aoAEbLVoZkiFODN+nlc
	/QRxHEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxldu-0000000HCWJ-2NZA;
	Wed, 04 Mar 2026 12:47:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlds-0000000HCV3-1TWb
	for ath11k@lists.infradead.org;
	Wed, 04 Mar 2026 12:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772628474;
	bh=2Px1vFmVelvllOxT/hL/0VnYYWZyh+UKt4NS9+SHuFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CTxnIKC7UdaRXM8a+hW0pkNCbAus2GnLGXNaLMzjb4yLe9XZFASK5JMoCqVv+8Wf0
	 2nxzsDe3VsUGOze7P9uhvTCBaqYwY5pOobOnPR4qgV4HDtlZeY0AfKS39YIU8D7ijY
	 0/lCF0XDN4eQL/6yQPGxH0aHaiiBrVRUIJgE+7dpTx36sW7zOU+VkAmYFZGgXPwz5w
	 omBevQutqqnG+5HhQ0nww+wD5j8heiyC9X6uB8vkw6hIqc2rXEmPg03IyHXRpisDbB
	 bEDKWiAK2lAFTgumqJQ3gXpUkuOnhQ4Wa+FBcqa3hNDCgMJ0RFau3WVpsxkxDyztk+
	 icrA7OhihOBhQ==
Received: from [192.168.1.53] (unknown [IPv6:2a01:6243:64f:0:a5a5:9171:d9e9:ce23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8CD217E05B5;
	Wed,  4 Mar 2026 13:47:53 +0100 (CET)
From: Matthew Leach <matthew.leach@collabora.com>
Date: Wed, 04 Mar 2026 12:47:13 +0000
Subject: [PATCH RFC 1/3] net: ath11k: fix redundant reset from stale
 pending workqueue bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-ath11k-lockup-fixes-v1-1-67143c2fe2a1@collabora.com>
References: <20260304-ath11k-lockup-fixes-v1-0-67143c2fe2a1@collabora.com>
In-Reply-To: <20260304-ath11k-lockup-fixes-v1-0-67143c2fe2a1@collabora.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_044756_538093_E65835B3 
X-CRM114-Status: GOOD (  10.20  )
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

During a firmware lockup, WMI commands time out in rapid succession,
each calling queue_work() to schedule ath11k_core_reset().  This can
cause a spurious extra reset after recovery completes:

1. First WMI timeout calls queue_work(), sets the pending bit and
   schedules ath11k_core_reset(). The workqueue clears the pending bit
   before invoking the work function. reset_count becomes 1 and the reset
   is kicked off asynchronously. ath11k_core_reset() returns.

2. Second WMI timeout calls queue_work() and re-queues the work. When it
   runs after step 1 returns, it sees reset_count > 1 and blocks in
   wait_for_completion(). The pending bit is again cleared.

3. Third WMI timeout calls queue_work(), the pending bit was cleared in
   step 2, so this succeeds and arms another execution.

4. The asynchronous reset finishes. ath11k_mac_op_reconfig_complete()
   decrements reset_count and calls complete(). The blocked worker from
   step 2 wakes, takes the early-exit path, and decrements reset_count to
   0.

5. The workqueue sees the pending bit from step 3 and runs
   ath11k_core_reset() again. reset_count is 0, triggering a
   full redundant hardware reset.

Fix this by calling cancel_work() on reset_work in
ath11k_mac_op_reconfig_complete() before signalling completion. This
clears any stale pending bit, preventing the spurious re-execution.

Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index e4ee2ba1f669..748f779b3d1b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9274,6 +9274,10 @@ ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 			 * the recovery has to be done for each radio
 			 */
 			if (recovery_count == ab->num_radios) {
+				/* Cancel any pending work, preventing a second redudant
+				 * reset.
+				 */
+				cancel_work(&ab->reset_work);
 				atomic_dec(&ab->reset_count);
 				complete(&ab->reset_complete);
 				ab->is_reset = false;

-- 
2.53.0


