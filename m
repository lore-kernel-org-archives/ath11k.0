Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB66DC4332F
	for <ath11k@archiver.kernel.org>; Fri, 10 Nov 2023 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVU0ty5Cm2WaxFFlfADXz9O3CwGb3Qnj7pr0cdkTT74=; b=lpKNPVzp1lPudp
	KZR8GQYfEBZX/P8aNY22gT/lM5gcQKSyLOxdDHk3CN3lGkbkR+C8gIg+qBZEkh3RhgHiId51DwpAM
	jro7rikwwELDxHPrvu7HvhA36wgc4lVWhTaNruXLx4SqjHNazI36e76j6zqoM8V2qoWO9ysI+X9Ez
	tqXIMAZc4pWaR5cV06Uvb6VWk+6wlLkYPJZtY70rVK2aXehgXDO8pE8NaVJMfRGhlO2rv+yiuucC1
	go+Cccsm0ClEXKRJmw+mP5rop338TjSINyCyeMoCUt2Hot1Msd2VbkogjHcsdUWRbD0g7kTdB8Vj+
	zpgOa62KBw6zCPXSI1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeU-008Hsg-1Z;
	Fri, 10 Nov 2023 10:22:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1OeQ-008Hpi-31
	for ath11k@lists.infradead.org;
	Fri, 10 Nov 2023 10:22:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 94F7AB81FAE
	for <ath11k@lists.infradead.org>; Fri, 10 Nov 2023 10:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36980C433CA;
	Fri, 10 Nov 2023 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699611729;
	bh=5ou17yiktRU9nagkHXi6c6F9I8XPQs9jzQuZICUzCw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kd2bZGTTww+NHdBdmpixjeUbted6II9Zmcrm1Y1tUbHnmuxVbsY+zZXeZx7h+vCem
	 UOVVaGTqAgDgIYeeHfOui1/hpCTLy9CzyO0aGhzFNF5zVqemBWVlxvribKdvfNdZy7
	 q50zCxJiOlesEpZKVWVjwWnOadJQpZMfLsP6MOCzGGNaPkzrRmS2L35QNph9FAFyCW
	 GwOjCR/eF32U5jhFEPo1u9dlB43KDYGCstJhrDd/PHM9YI32s5QoULPrVH4yXj2dT9
	 kxIb6q6lWNe4P4DewJ6PVCAKpN8RETVgqj9PcVDNS14YgKiT0YDIdo1bQyXM0KGAnZ
	 6Fd1lIZOMl5JA==
From: Kalle Valo <kvalo@kernel.org>
To: mhi@lists.linux.dev
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH RFC 3/8] wifi: ath11k: handle irq enable/disable in several code path
Date: Fri, 10 Nov 2023 12:21:57 +0200
Message-Id: <20231110102202.3168243-4-kvalo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110102202.3168243-1-kvalo@kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_022211_112431_0419D060 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

For non WoW suspend/resume, ath11k host powers down whole hardware
when suspend and power up it when resume, the code path it goes
through is very like the ath11k reset logic.

In order to reuse that logic, do some IRQ management work to make
it work.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 0c6ecbb9a066..fbd6b6a0e12c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -852,9 +852,6 @@ int ath11k_core_resume(struct ath11k_base *ab)
 		return ret;
 	}
 
-	ath11k_hif_ce_irq_enable(ab);
-	ath11k_hif_irq_enable(ab);
-
 	ret = ath11k_dp_rx_pktlog_start(ab);
 	if (ret) {
 		ath11k_warn(ab, "failed to start rx pktlog during resume: %d\n",
@@ -1775,10 +1772,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
 
 	mutex_lock(&ab->core_lock);
 	ath11k_thermal_unregister(ab);
-	ath11k_hif_irq_disable(ab);
 	ath11k_dp_pdev_free(ab);
 	ath11k_spectral_deinit(ab);
-	ath11k_hif_stop(ab);
+	ath11k_ce_cleanup_pipes(ab);
 	ath11k_wmi_detach(ab);
 	ath11k_dp_pdev_reo_cleanup(ab);
 	mutex_unlock(&ab->core_lock);
@@ -2033,8 +2029,8 @@ static void ath11k_core_reset(struct work_struct *work)
 	time_left = wait_for_completion_timeout(&ab->recovery_start,
 						ATH11K_RECOVER_START_TIMEOUT_HZ);
 
-	ath11k_hif_power_down(ab);
-	ath11k_hif_power_up(ab);
+	ath11k_hif_irq_disable(ab);
+	ath11k_hif_ce_irq_disable(ab);
 
 	ath11k_dbg(ab, ATH11K_DBG_BOOT, "reset started\n");
 }
-- 
2.39.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
