Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F3CC433F5
	for <ath11k@archiver.kernel.org>; Thu,  6 Oct 2022 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Hqs0M4Mv5ATuYevD0z3Z1BAWWhS9iaJBpiCGPoui7o=; b=FhcsfMp698bcL/
	RNioycfaMJopQGBfxFBCwzYr/xqVE2rCeYX+3hMN/swF1HsIAf2pDbuWIvZdbN7bcuriOR0VufxuZ
	h02gYSyd42UyBDF7RGc+LdjaC2nsTrRkqn2VoLApyAJGA5u3ZYfypuHFjGxtnOLtxzWuMqlCI7eS7
	ydR0THdCLNt8bcnvfssx2TcGUXulrx+rGjgvCPLZEIzE3prPkKI7/UMVbQZZ9OeMrpvEJt81zixMQ
	PYgwcw2mQHOShEmuLcn7W77nXNfaf9c1UDS17eJOm7Xekq3KWsQ7kuBV1EsI1Qf972k++tRHor/yt
	RW9/BQK2DsRIZS0jgF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogShE-003Kme-7v; Thu, 06 Oct 2022 15:22:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogSdH-003IWP-OS
	for ath11k@lists.infradead.org; Thu, 06 Oct 2022 15:17:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1DF10B81FBC
	for <ath11k@lists.infradead.org>; Thu,  6 Oct 2022 15:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3267EC433D7;
	Thu,  6 Oct 2022 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665069471;
	bh=AG5Ac2emcPzRFBBg15HIT6wLr4b0DU2UCLkBxMw6ZLk=;
	h=From:To:Cc:Subject:Date:From;
	b=NUFdzuX+Ye21uDHHcILeMlbl0RtamHNo9v/T/bwgF9I2Jhac9WE6OI+4kdnXeXCED
	 BPgpsYl6CA5QffNlnrXvGQ7hlUB7l8bJ7xRrOz1XCUbv+9//fwDOmW7VdtbXCSPwUv
	 l2/zNi0kkb4/EurDXZ+h1I1EsW4Srvq5C+O0/Fz7/0aggkAQUKdwTmL4gol06E0d+b
	 H4uduIC958EPVhzPOijs/mgd1DNBUek/cK5MV7DkNVkFtFzcbuf4vfyCuPh/KbeR5G
	 ASBZX7zU2b/aN0SVPTuTewzPwo3Qh2LW+tBxXtoqEjrvmrXJ5dz/tB10F0DidYxyF9
	 U3dk++1QgSGew==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()
Date: Thu,  6 Oct 2022 18:17:47 +0300
Message-Id: <20221006151747.13757-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_081756_124101_BA9B4B89 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Wen Gong <quic_wgong@quicinc.com>

Running this test in a loop it is easy to reproduce an rtnl deadlock:

iw reg set FI
ifconfig wlan0 down

What happens is that thread A (workqueue) tries to update the regulatory:

    try to acquire the rtnl_lock of ar->regd_update_work

    rtnl_lock+0x17/0x20
    ath11k_regd_update+0x15a/0x260 [ath11k]
    ath11k_regd_update_work+0x15/0x20 [ath11k]
    process_one_work+0x228/0x670
    worker_thread+0x4d/0x440
    kthread+0x16d/0x1b0
    ret_from_fork+0x22/0x30

And thread B (ifconfig) tries to stop the interface:

    try to cancel_work_sync(&ar->regd_update_work) in ath11k_mac_op_stop().
    ifconfig  3109 [003]  2414.232506: probe:

    ath11k_mac_op_stop: (ffffffffc14187a0)
    drv_stop+0x30 ([mac80211])
    ieee80211_do_stop+0x5d2 ([mac80211])
    ieee80211_stop+0x3e ([mac80211])
    __dev_close_many+0x9e ([kernel.kallsyms])
    __dev_change_flags+0xbe ([kernel.kallsyms])
    dev_change_flags+0x23 ([kernel.kallsyms])
    devinet_ioctl+0x5e3 ([kernel.kallsyms])
    inet_ioctl+0x197 ([kernel.kallsyms])
    sock_do_ioctl+0x4d ([kernel.kallsyms])
    sock_ioctl+0x264 ([kernel.kallsyms])
    __x64_sys_ioctl+0x92 ([kernel.kallsyms])
    do_syscall_64+0x3a ([kernel.kallsyms])
    entry_SYSCALL_64_after_hwframe+0x63 ([kernel.kallsyms])
    __GI___ioctl+0x7 (/lib/x86_64-linux-gnu/libc-2.23.so)

The sequence of deadlock is:

1. Thread B calls rtnl_lock().

2. Thread A starts to run and calls rtnl_lock() from within
   ath11k_regd_update_work(), then enters wait state because the lock is owned by
   thread B.

3. Thread B continues to run and tries to call
   cancel_work_sync(&ar->regd_update_work), but thread A is in
   ath11k_regd_update_work() waiting for rtnl_lock(). So cancel_work_sync()
   forever waits for ath11k_regd_update_work() to finish and we have a deadlock.

Fix this by switching from using regulatory_set_wiphy_regd_sync() to
regulatory_set_wiphy_regd(). Now cfg80211 will schedule another workqueue which
handles the locking on it's own. So the ath11k workqueue can simply exit without
taking any locks, avoiding the deadlock.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
[kvalo: improve commit log]
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/reg.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 7ee3ff69dfc8..6fae4e61ede7 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -287,11 +287,7 @@ int ath11k_regd_update(struct ath11k *ar)
 		goto err;
 	}
 
-	rtnl_lock();
-	wiphy_lock(ar->hw->wiphy);
-	ret = regulatory_set_wiphy_regd_sync(ar->hw->wiphy, regd_copy);
-	wiphy_unlock(ar->hw->wiphy);
-	rtnl_unlock();
+	ret = regulatory_set_wiphy_regd(ar->hw->wiphy, regd_copy);
 
 	kfree(regd_copy);
 

base-commit: 023baf1318ef21442fab3842bf03883bc81223e0
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
