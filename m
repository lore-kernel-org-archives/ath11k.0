Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954EECA0FE4
	for <ath11k@archiver.kernel.org>; Fri, 30 Aug 2024 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OA1aR3D6P1yKqxLc97SjhIL90dq/6HD+PrvzA+JcrbM=; b=Gk5gMrxj4oOSSM+fTYgVUaiBip
	AhbU12mKfvJFfWu9XiiBSBIzGQIbRmusZS5wAZ+pLJt5dR2H6UNzI+z6wGMfW8yqBgAkZok0jsHsE
	vpmVq2gT11+Wc1XGgxp83Sp0/nHCKEuxXySqZgyovrXsgiUzdFqNpUVy/ehl2lmdH595Xlvp1SVSg
	Gzc50TVXW/mLOXbPKf0+8j8smb6y/AaON40AQ0Ipc9xMZldszkJY5tEl1zLfjX7Yrocl/waubQ7jB
	esGFpYVcxk92HBdsqi3jPPENmZXP9ajMuCMrLZTmEZhSM3QBMPsuqRRjXpNolKv1j0jcdeKPOq29E
	tb3AEFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0LE-000000069fu-46Y2;
	Fri, 30 Aug 2024 12:03:00 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0L1-000000069dp-05GO
	for ath11k@lists.infradead.org;
	Fri, 30 Aug 2024 12:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1725019350;
	bh=OA1aR3D6P1yKqxLc97SjhIL90dq/6HD+PrvzA+JcrbM=;
	h=From:To:Cc:Subject:Date;
	b=tJusOvkdi8dVS31EJTeCmtE69JrLUrzVgk8A2L5TLqvTVTSY8JMKwyraGJCHBnrQR
	 s7JqmWapCYcLH9UWJexJSpP49hZbILXnDc8l96e4cw1mg/vjPJFRRFVUVKSY3P9F9a
	 QkfYtUVvz/mjBjopss08yyEcGpDFAK5GG+o1Z/UQ=
Received: from localhost.localdomain ([114.246.200.160])
	by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
	id 9B9724D; Fri, 30 Aug 2024 20:02:27 +0800
X-QQ-mid: xmsmtpt1725019347t06pasczv
Message-ID: <tencent_A64CA96B962349E369B349EA01EBC53C3505@qq.com>
X-QQ-XMAILINFO: NC4p7XQIBeahN2F7hMEA1AVw+JUb7RBJt6sTjs23qCy/OS5FN4fOGKhiTx4KdQ
	 D/HZi7E1nEusnimX1P2/8k+Iy9G6z1dD4iTIDMtCCN6aHgXGwUFTQ8h1Wn9aB1zsY9+TNABMdVxo
	 hPjy2LfueW00uXt2E8iRr0wbOayJ5VoWbhEXFqwJa4hHdparD3tlPlgvvFFhd1+vCl16Ss5st04P
	 tFHhUMPS27Iay60LoGHeoM2JyT4/JHdKNqcK1tueNLcxX3N7gkX6nYN32U3MSVN8vvrtWqNq+rr3
	 UzCOkyxGIxDJsqe2No5yd4GthrX7VXZsWqkK4dnX4NQRMTWbYDKGCN+D8A0WaqzBYgpV8B+a8AHy
	 C0+lhohDqukjNq521opqeX2yRaRY89KBJlda+U+n14DFty6SrHUa6uKOquSRAy0+ru2Dw+EdLGxu
	 tgFyG6BHEhzXWdq0fsZhVzS2Tlp/BrJaUE4A2MUaeyIjte1xhXN8YneNKpbuXz0E3lcPC8bbzKbr
	 gx585I2MAD2KvQGIv77trrQqHq+VNH+N01SbHsLKw5Q278JSivg4d2K6nigIk6tO0OnunRW3PopU
	 mEV2vq++QWfyx5OXlJFIPQC5J0XvL/oe2KyTZxe94RLYpaLIMsoueVDek4LNlDT3lTSg+F+BVbYX
	 b3zNum3vklVkwlJDEFs3bMzI51CNSjNyOj5hRz0gyukHw1lRv1rAgw4bbwzLaZRIRAzWkR3agmq9
	 EhJCWS8S6EJFbgvhHVnkHLTO7EW6gpyCi3bis/kyEZgzi4MUU3p0MTmQ/DoGQIum8ZeIHYfv7I28
	 ipTZ/ZZgJlnyUyF1+AipASAhbEaSJovXl+V0Q3xZmA5TPU8FhZ6VGRGQQokGxsAa95VqLtEfBzoL
	 vggH5WA65f4rMyRglkwinvFLBWbcv7d8bt8sE20cA8376QBO3mR5EmulFrTMUAF7HZXwfErQSboq
	 MJfsrvtKapFaF33B2TWB/k3fN6CdPlpir7OSdy2D9Kj5Nf09uUpWyoPUWS7TdE+SehLoZt7Y5Ttb
	 xgSltRo4UtXARiGDilj9e8W1f4E2DhcRjdpjvLlaebE1eubDuaa/awcioNQIo=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Jiawei Ye <jiawei.ye@foxmail.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	corbet@lwn.net
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ath11k: Fix potential RCU dereference issue in ath11k_debugfs_htt_ext_stats_handler
Date: Fri, 30 Aug 2024 12:02:27 +0000
X-OQ-MSGID: <20240830120227.1025690-1-jiawei.ye@foxmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_050247_419008_3165BD8A 
X-CRM114-Status: GOOD (  11.21  )
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

In the `ath11k_debugfs_htt_ext_stats_handler` function, the `ar` pointer
obtained via RCU lock is accessed after the RCU read-side critical
section might be unlocked. According to RCU usage rules, this is illegal.
Reusing this pointer can lead to unpredictable behavior, including
accessing memory that has been updated or causing use-after-free issues.
The `ath12k_debugfs_htt_ext_stats_handler` function in the
`drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c` file provides a good
example to follow for addressing this issue.

This possible bug was identified using a static analysis tool developed
by myself, specifically designed to detect RCU-related issues.

To address this issue, the RCU read lock is now kept until all accesses
to the `ar` pointer are completed. A `goto exit` statement is introduced
to ensure that the RCU read unlock is called appropriately, regardless of
the function's exit path.

Signed-off-by: Jiawei Ye <jiawei.ye@foxmail.com>
---
 drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
index 870e86a31bf8..325377e00818 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c
@@ -4572,15 +4572,14 @@ void ath11k_debugfs_htt_ext_stats_handler(struct ath11k_base *ab,
 	pdev_id = FIELD_GET(HTT_STATS_COOKIE_LSB, cookie);
 	rcu_read_lock();
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, pdev_id);
-	rcu_read_unlock();
 	if (!ar) {
 		ath11k_warn(ab, "failed to get ar for pdev_id %d\n", pdev_id);
-		return;
+		goto exit;
 	}
 
 	stats_req = ar->debug.htt_stats.stats_req;
 	if (!stats_req)
-		return;
+		goto exit;
 
 	spin_lock_bh(&ar->debug.htt_stats.lock);
 
@@ -4599,6 +4598,8 @@ void ath11k_debugfs_htt_ext_stats_handler(struct ath11k_base *ab,
 
 	if (send_completion)
 		complete(&stats_req->cmpln);
+exit:
+	rcu_read_unlock();
 }
 
 static ssize_t ath11k_read_htt_stats_type(struct file *file,
-- 
2.34.1


