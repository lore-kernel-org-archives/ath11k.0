Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93690CDB486
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwNBbuw8UOf+1dXa3y03/tXoSoDq8QeAaGNShCLnraQ=; b=H9Fgc1azOXorjN
	gQSO5ExU1aRJ9D80xcFRWmwIXkbFaHkkqSpLpanS7zKF5rd8Swj0k+0te56X1fx47UWe09FLbIARr
	/QEorw1tJagW/OGqgF8uZ/4qjhhymFI77EzWZH5d0jWKwCJlubwgBnRZgRqmIqF4AuC3ovtHYZeAC
	JV/gYWu4hipYjx48VzwtV1dEk4i9pV8srIuZF4NyxVxRO92/LV8I7n515JBsUcBJZeLNjc5mkfGFG
	TZhZTrwDxfL/JguqbC7iC0XxxUyevxJJebYP6Wss1gKmOE4ZZsSR2gpbGNqc7ggpEIeoq+kEh9Ru3
	PN9i5iXNh5mV9SYqRHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV1B-000CZ6-33;
	Thu, 19 Oct 2023 15:33:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV18-000CXr-2O
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1842AB82494;
	Thu, 19 Oct 2023 15:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F38EC433C7;
	Thu, 19 Oct 2023 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697729576;
	bh=ybnrjlLviCjSD8GSKMljRyMDeDtfP4Uw7YCw85cfwvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WPXJJ494N+eQZDwnrF5/v4p3ljxHkhrb79+NS63aMaP8W7GUKRqOqEEWUV/LreBag
	 HTxotFRSHtLz/rFWarbLOJNw1T2cWLMnZdVQ335Hp2fEyrar9dvQO05e82mbwu5yKq
	 DTjzRvqhCmIJWpe1BO4BmxWi5s8ogvv3+H5rjW/jO53qoFb6ZaVbwdMcZz7Z/p8Rws
	 UQzf2yGkDD8Me+A2p5mgUwCArQEExqPnb85OvdAndNgu2aZjBRI1AvVW4JCOqHNYFq
	 iUOofKwV48HRgk75KinzjO9cPqCR5y7YtmJ3e191nYLXKnfqUq/IwCffYcSxO7pzTy
	 brbnGVQpzxGug==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtV1A-0006tA-0W;
	Thu, 19 Oct 2023 17:33:00 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] wifi: ath11k: fix temperature event locking
Date: Thu, 19 Oct 2023 17:31:14 +0200
Message-ID: <20231019153115.26401-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019153115.26401-1-johan+linaro@kernel.org>
References: <20231019153115.26401-1-johan+linaro@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_083258_953785_328EEC4E 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

The ath11k active pdevs are protected by RCU but the temperature event
handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
read-side critical section as reported by RCU lockdep:

	=============================
	WARNING: suspicious RCU usage
	6.6.0-rc6 #7 Not tainted
	-----------------------------
	drivers/net/wireless/ath/ath11k/mac.c:638 suspicious rcu_dereference_check() usage!

	other info that might help us debug this:

	rcu_scheduler_active = 2, debug_locks = 1
	no locks held by swapper/0/0.
	...
	Call trace:
	...
	 lockdep_rcu_suspicious+0x16c/0x22c
	 ath11k_mac_get_ar_by_pdev_id+0x194/0x1b0 [ath11k]
	 ath11k_wmi_tlv_op_rx+0xa84/0x2c1c [ath11k]
	 ath11k_htc_rx_completion_handler+0x388/0x510 [ath11k]

Mark the code in question as an RCU read-side critical section to avoid
any potential use-after-free issues.

Fixes: a41d10348b01 ("ath11k: add thermal sensor device support")
Cc: stable@vger.kernel.org      # 5.7
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 23ad6825e5be..da1582b8dc30 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -8383,14 +8383,17 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
 	ath11k_dbg(ab, ATH11K_DBG_WMI, "event pdev temperature ev temp %d pdev_id %d\n",
 		   ev->temp, ev->pdev_id);
 
+	rcu_read_lock();
+
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev->pdev_id);
-		kfree(tb);
-		return;
+		goto exit;
 	}
 
 	ath11k_thermal_event_temperature(ar, ev->temp);
+exit:
+	rcu_read_unlock();
 
 	kfree(tb);
 }
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
