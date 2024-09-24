Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E20DCF9C69
	for <ath11k@archiver.kernel.org>; Tue, 24 Sep 2024 19:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZAFC15upJHpYWIyEc4vqiTRRNBTzf2DlM6fPlb+qayY=; b=4tnFCja9yM45olOmkX+3r5+VuE
	f4Ab8tiZMppq6RWm157A2ixcx6NTa49PIYJgE2YbdHoUsKGiQjSUALgzL3RGLyLNYZGMiF34g0Nzt
	+wExie6SAzwf3wpG8dF1wow3Dv92E9oDV01dfCBESaXAW7QQLyZxzNAdB5MXMQpVyyEGtmd4jZXTv
	GtYzS8uBfwK+O6a/IKvW2ZwBoxb6w8kiOlBC1MdgR0oH8yrS+wgwv9bb3oaheimJSMJrnC/epvEKq
	AyTi2FXeiA7pyaVMn/9a8M56xSIhxHPXRIFxhWBKDcShT3p2fzew7OqglmD4eHj9svjMpJ3/piZoX
	Wjd9EA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stBP8-00000003Afx-0rNt;
	Tue, 24 Sep 2024 19:40:58 +0000
Received: from e3i110.smtp2go.com ([158.120.84.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stBP5-00000003AeS-1Bwg
	for ath11k@lists.infradead.org;
	Tue, 24 Sep 2024 19:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1727206840; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=ZAFC15upJHpYWIyEc4vqiTRRNBTzf2DlM6fPlb+qayY=;
 b=tyLnYGbwJCPdHH1jgGdBKm/oW8rPBXZWUDCgDIBXXfmWOf5ZFY5TKHXhbjyV+YzrWptN0
 m7My4tscbu9zjLmgrSjPAcejkkyIRRHT45zOh5XoozvE7iO7KM1Aiw3QsTbZIK+6wd7rr0t
 pDyzkGhNLvYxJBeYALp3fbulAR3BGRpOYzRpOkOCdKCIcjUbg6pjyD8R3XqcyABVF7zZGDQ
 3zaTUJAGylf69iYfTqFoJ7rfLwSYqYXs91N6xK00xRx/qKhLeH8qfxHVIL4PIa7F3sDamqz
 mSy0dTda+7/FHrdlpWosJjIMRB4P59lBCAo3MRt0KEJU+ByWlEEb4qeMk/0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1727206840; h=from : subject
 : to : message-id : date;
 bh=ZAFC15upJHpYWIyEc4vqiTRRNBTzf2DlM6fPlb+qayY=;
 b=SGe/yur1nrYOd4LZYfZYQMxPbN18Nl81HDwULEPdk++5T4S2QAMbQ2rgWSp4vb0FsbMII
 IZZD/sJqPHjN7BOGdfreNmWAbJ/Z1epjjZy907n4EruzRxW4XMbUTlO7i3LxJHgCKPx02Kd
 x5chcUFqLQ72PUvE6erFtGBbBBQbUKlsynsYEeOOJ7ZL+w6/AOjflEIkmpH9uKVa//Q76GF
 oX6/bW0RuZnaSJNhKzJ7ydIgWOJWv+f20a8qR5BIAMB+Tac44LTvFHkrvcyS+rpdIevohAl
 vBI2Fr+vVpMiUx0ZqiM3yjd+tlo/YT15fOzt7VnjQrX2tWtjlMAysUIv4+TA==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1stBOo-AIkwcC8mZ9b-HsRu;
	Tue, 24 Sep 2024 19:40:38 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Praneesh P <quic_ppranees@quicinc.com>,
	Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v2] wifi: ath11k: Fix invalid ring usage in full monitor mode
Date: Tue, 24 Sep 2024 21:41:19 +0200
Message-Id: <20240924194119.15942-1-repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sosVF_l1gq
X-smtpcorp-track: Tbd8jULSHOtM.hQErJH_nGGhI.GeIg9gdf1QR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_124055_585505_24D224F9 
X-CRM114-Status: GOOD (  13.19  )
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

On full monitor HW the monitor destination rxdma ring does not have the
same descriptor format as in the "classical" mode. The full monitor
destination entries are of hal_sw_monitor_ring type and fetched using
ath11k_dp_full_mon_process_rx while the classical ones are of type
hal_reo_entrance_ring and fetched with ath11k_dp_rx_mon_dest_process.

Although both hal_sw_monitor_ring and hal_reo_entrance_ring are of same
size, the offset to useful info (such as sw_cookie, paddr, etc) are
different. Thus if ath11k_dp_rx_mon_dest_process gets called on full
monitor destination ring, invalid skb buffer id will be fetched from DMA
ring causing issues such as the following rcu_sched stall:

 rcu: INFO: rcu_sched self-detected stall on CPU
 rcu:     0-....: (1 GPs behind) idle=c67/0/0x7 softirq=45768/45769 fqs=1012
  (t=2100 jiffies g=14817 q=8703)
 Task dump for CPU 0:
 task:swapper/0       state:R  running task     stack: 0 pid:    0 ppid:     0 flags:0x0000000a
 Call trace:
  dump_backtrace+0x0/0x160
  show_stack+0x14/0x20
  sched_show_task+0x158/0x184
  dump_cpu_task+0x40/0x4c
  rcu_dump_cpu_stacks+0xec/0x12c
  rcu_sched_clock_irq+0x6c8/0x8a0
  update_process_times+0x88/0xd0
  tick_sched_timer+0x74/0x1e0
  __hrtimer_run_queues+0x150/0x204
  hrtimer_interrupt+0xe4/0x240
  arch_timer_handler_phys+0x30/0x40
  handle_percpu_devid_irq+0x80/0x130
  handle_domain_irq+0x5c/0x90
  gic_handle_irq+0x8c/0xb4
  do_interrupt_handler+0x30/0x54
  el1_interrupt+0x2c/0x4c
  el1h_64_irq_handler+0x14/0x1c
  el1h_64_irq+0x74/0x78
  do_raw_spin_lock+0x60/0x100
  _raw_spin_lock_bh+0x1c/0x2c
  ath11k_dp_rx_mon_mpdu_pop.constprop.0+0x174/0x650
  ath11k_dp_rx_process_mon_status+0x8b4/0xa80
  ath11k_dp_rx_process_mon_rings+0x244/0x510
  ath11k_dp_service_srng+0x190/0x300
  ath11k_pcic_ext_grp_napi_poll+0x30/0xc0
  __napi_poll+0x34/0x174
  net_rx_action+0xf8/0x2a0
  _stext+0x12c/0x2ac
  irq_exit+0x94/0xc0
  handle_domain_irq+0x60/0x90
  gic_handle_irq+0x8c/0xb4
  call_on_irq_stack+0x28/0x44
  do_interrupt_handler+0x4c/0x54
  el1_interrupt+0x2c/0x4c
  el1h_64_irq_handler+0x14/0x1c
  el1h_64_irq+0x74/0x78
  arch_cpu_idle+0x14/0x20
  do_idle+0xf0/0x130
  cpu_startup_entry+0x24/0x50
  rest_init+0xf8/0x104
  arch_call_rest_init+0xc/0x14
  start_kernel+0x56c/0x58c
  __primary_switched+0xa0/0xa8

Thus ath11k_dp_rx_mon_dest_process(), which use classical destination
entry format, should no be called on full monitor capable HW.

Fixes: 67a9d399fcb0 ("ath11k: enable RX PPDU stats in monitor co-exist mode")
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
v2: set ppdu_status to DP_PPDU_STATUS_DONE as suggested by
    https://lore.kernel.org/ath11k/d376023d-267a-4512-8749-f816fefeb842@quicinc.com/

 drivers/net/wireless/ath/ath11k/dp_rx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index c087d8a0f5b2..40088e62572e 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5291,8 +5291,11 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		    hal_status == HAL_TLV_STATUS_PPDU_DONE) {
 			rx_mon_stats->status_ppdu_done++;
 			pmon->mon_ppdu_status = DP_PPDU_STATUS_DONE;
-			ath11k_dp_rx_mon_dest_process(ar, mac_id, budget, napi);
-			pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+			if (!ab->hw_params.full_monitor_mode) {
+				ath11k_dp_rx_mon_dest_process(ar, mac_id,
+							      budget, napi);
+				pmon->mon_ppdu_status = DP_PPDU_STATUS_START;
+			}
 		}
 
 		if (ppdu_info->peer_id == HAL_INVALID_PEERID ||
-- 
2.46.0


