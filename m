Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19CFC433FE
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 11:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0KgXAqiYdBI4HoLRLgj7YuNXC5vJTsdyea7dSRDYw8w=; b=z8ZbXkMYS48ow6
	Hf8pTgCSFAQwRk22QCLQqFCl7Knc7bhmlxaxeMxXuprBkg2YXrYGdZRp9N8OCXcPWC41VF6L9N90t
	gqvkSwf9x95K1epxj8okF6NCKa0Kmrb0xJxqBKcVJyzMsM1xXIYqLt2q60ABSh7ouRspmtjmdvlYK
	Y7VMFJaJ7OBoqxaEvJLPv9OWXWi0qbjPaeLlJaP4iE/Xvhbfxu6SUet2ebuG4dDUCYZFb2OFG/mhO
	WvcimcOohrIdZ50AR94wGdXkCo3RJk7rE3mVH8VwmCEGKqfoNO/JgiZaDsxnmFh5fKIe9rEjne3F/
	JrfyOtE0bnvPZcnwiHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqCE8-00ApFH-49; Wed, 02 Nov 2022 11:48:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqCE5-00ApEV-8j
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 11:48:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BA0A0B82191
	for <ath11k@lists.infradead.org>; Wed,  2 Nov 2022 11:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B52C433D6;
	Wed,  2 Nov 2022 11:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667389686;
	bh=iu0AtyeEiI1Zhs24ANJ2UESvd4tZ9TmK3ZE4UIaXa6s=;
	h=From:To:Cc:Subject:Date:From;
	b=koQgX18Yz4Xyv5U+5qfAJ2MVeLjE+fQvwsVLgl0/goapKT4dPF03tDDqxLmIUEZwL
	 r1bgltngBbMQa2AW9bDchZaAIepV0jW18OlxalpdJGd2xdzk7hnUA2Bd2hq148uE8q
	 CiDOFEIq+7NwyH/qSGEX3oDO1nxcpnje1rrJn4o6NbSOmaUCuf6v/J8kbEwSnuZkz2
	 b1HaX7LS4XpUS7++fvPEiWeqTi9HqqmUmp2D4rvL5fXSwhqe6jpo8dR/MAQR1Z0Fjl
	 AgHq4+X6g4V6m1v5Tcpj4HTUHyD5m5f6rPv/a/NQGZty4bpPEy/EoZ33yLLOVYVJiX
	 IwJxQgRaDUenA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v6.1] wifi: ath11k: avoid deadlock during regulatory update in ath11k_regd_update()
Date: Wed,  2 Nov 2022 13:48:03 +0200
Message-Id: <20221102114803.13485-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_044809_615633_2F0128C8 
X-CRM114-Status: GOOD (  13.10  )
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

(cherry picked from commit d99884ad9e3673a12879bc2830f6e5a66cccbd78 in ath-next
as users are seeing this bug more now, also cc stable)

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

Cc: <stable@vger.kernel.org>
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
 

base-commit: 30ac96f7cc973bb850c718c9bbe1fdcedfbe826b
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
