Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB393FB3CF7
	for <ath11k@archiver.kernel.org>; Mon, 30 Mar 2026 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhHwvehmTHZtifYiXh4Tzw8zeAax+/ugk5zeNJe7YzY=; b=2uE3ksD0Yl71Fkj8++n1I7Bg6N
	bqp8kNqWIo37GXcUr+d8l8/XxKCxf2A3KYsrBmttUCtuRKmbisGXhD70jIsg9/90YOnJiW5TmuF4a
	N7mWc5JVGudvOHkJpFuv2bsexOoznGzrW0kagI5Lz0lL2SdKrrFl6fdP1pb8JP/qWkWhSkozsi3hJ
	i69skVbiRnneb0SFLgalYcDkbyk1sVcduHpDxiDMyc2Hg4H1cG1bujRAR4A82cxna5TqgBVCCADXG
	zJi8HK74s7hyDsD5NwfzvTB2FuV3uSGJo0eBcboo1eLORvXOx6NpSWks3HhH1cqkO7Z79TJ+gCept
	EHodOTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79VX-0000000B0sv-48o1;
	Mon, 30 Mar 2026 10:06:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79VR-0000000B0ri-0McE
	for ath11k@lists.infradead.org;
	Mon, 30 Mar 2026 10:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774865158;
	bh=2Px1vFmVelvllOxT/hL/0VnYYWZyh+UKt4NS9+SHuFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BRK91mSobPtGrDz7gGNcgOYhrnozUQ50KD313+nAgjXQmBO/yfZCrJ6D8PZpXFtQY
	 pghvkhibzpWyDPY6mq0R6uGw0H2SH5jYDf8/qp+NoeGeolV/4pLUM3U5yhbPXPATJg
	 /Rx5fJ5U4ohR2R2/MeXA1TQsKnfPXinzMWP3PAq1y3Lo7QG0PVE+d9pQDi/WrjnZ0w
	 NOH266CQGIVAtj8moOCAyI4l3enicspCDQr0eKUNhO8KczP1j58pbZYlD2Txxt66NY
	 uOKJoXbHPHSJr8WALKDeXa+XKRoaiDmRPgzhG75FhvlbcgLGYEwNR6q6LNn5wBXnkB
	 JTQFSoCRF2bTw==
Received: from [192.168.1.53] (unknown [IPv6:2a01:6243:628:0:43ea:f64d:fc7e:3a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6525D17E41AE;
	Mon, 30 Mar 2026 12:05:58 +0200 (CEST)
From: Matthew Leach <matthew.leach@collabora.com>
Date: Mon, 30 Mar 2026 11:05:31 +0100
Subject: [PATCH RESEND RFC 1/3] net: ath11k: fix redundant reset from stale
 pending workqueue bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ath11k-lockup-fixes-v1-1-7ed21095c2c4@collabora.com>
References: <20260330-ath11k-lockup-fixes-v1-0-7ed21095c2c4@collabora.com>
In-Reply-To: <20260330-ath11k-lockup-fixes-v1-0-7ed21095c2c4@collabora.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_030601_276423_6A77764D 
X-CRM114-Status: GOOD (  10.14  )
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


