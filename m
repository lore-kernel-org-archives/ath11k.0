Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60847C433EF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 07:53:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1051E60FBF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 07:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1051E60FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zdf7RcxuX8nMzcjEBpSPksqvj3xcYB/6Ypxo3ctM1us=; b=prK4n4g37KDW3o
	hyAW8kJCS+u2OjvDQ9fVgk5/027K5158KT+Q+cEBWFk2+4i+F+rsaEn6SKXJRoEsuYw0D9aztcjaT
	cCVvSCx/TFWwnuO9m1Z9QYGEjg7XIM0HYGOB/UAWER1HZpVW9SH197AGxLZ8rhKtpZxSQxb57TvK3
	XhQlCO9exNoCMp5TR9nVOnAmP0r2+qpCi/zyIns20jhkwLwV9mOm8FIeayXbx+n86K1W5dEid12n3
	HuOaZX1U2euHl/yJranJoY2novqa5nHATbmN1E5zwSlPsXZgkKg0c7WOtjihjhp4JCyCTR87IlG1o
	uroK6rWpHR0hEYE9KDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlRMz-009d75-TH; Fri, 12 Nov 2021 07:53:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlRMw-009d6f-SW
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 07:53:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636703585; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Usv1bhvG2ZJ5h/PsIIAjd8vLEElJgpWNXsgDlDvRsY0=;
 b=PFMQ3EL/SPEQNSoDtbO2j4bSoSZGk9mf/TyaSlUgJhkHUCG6zk8r8HqShBrfBvYbdNuG6eii
 UU4To90YUqKcPdPYZAK5nWTuggXXJcj5yZmk63GGu0ErmW/+xms/y6if8NXqG4cxxpuApFYk
 YSlL8iXBQ2kwIfaDLhs+VckFoM0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 618e1d4ff6c5b6c8d564a2ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Nov 2021 07:52:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7AE5FC43460; Fri, 12 Nov 2021 07:52:46 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A70FFC4338F;
 Fri, 12 Nov 2021 07:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A70FFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ath11k: process full monitor mode rx support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210721171905.61838-4-jouni@codeaurora.org>
References: <20210721171905.61838-4-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163670356167.27466.16885352465690914644.kvalo@codeaurora.org>
Date: Fri, 12 Nov 2021 07:52:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_235307_033677_5F816A21 
X-CRM114-Status: GOOD (  10.61  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> From: Anilkumar Kolli <akolli@codeaurora.org>
> 
> In full monitor mode, monitor destination ring is read before monitor
> status ring. mon_dst_ring has ppdu id, reap till the end of PPDU. Add
> all the MPDUs to list. Start processing the status ring, if PPDU id in
> status ring is lagging behind, reap the status ring, once the PPDU ID
> matches, deliver the MSDU to upper layer. If status PPDU id leading,
> reap the mon_dst_ring. The advantage with full monitor mode is hardware
> has status buffers available for all the MPDUs in mon_dst_ring.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>

I changed the commit log to this to better describe how this patch helps:

    ath11k: process full monitor mode rx support
    
    In full monitor mode, monitor destination ring is read before monitor
    status ring. mon_dst_ring has ppdu id, reap till the end of PPDU. Add
    all the MPDUs to list. Start processing the status ring, if PPDU id in
    status ring is lagging behind, reap the status ring, once the PPDU ID
    matches, deliver the MSDU to upper layer. If status PPDU id leading,
    reap the mon_dst_ring.
    
    The advantage with full monitor mode is hardware has status buffers available
    for all the MPDUs in mon_dst_ring, which makes it possible to deliver more
    frames to be seen on sniffer.
    
    Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1

But now I see a new warning with QCA6390 caused by patch 3. Please fix that and submit v2.

[  108.354361] ath11k_pci 0000:06:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
[  108.354547] ath11k_pci 0000:06:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id 
[  110.995359] INFO: trying to register non-static key.
[  110.995429] The code is fine but needs lockdep annotation, or maybe
[  110.995489] you didn't initialize this object before use?
[  110.995546] turning off the locking correctness validator.
[  110.995604] CPU: 1 PID: 0 Comm: swapper/1 Kdump: loaded Tainted: G        W         5.15.0-wt-ath+ #522
[  110.995664] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
[  110.995720] Call Trace:
[  110.995774]  <IRQ>
[  110.995828]  dump_stack_lvl+0x57/0x7d
[  110.995887]  register_lock_class+0x1604/0x17e0
[  110.995945]  ? check_prev_add+0x7bb/0x20f0
[  110.996002]  ? is_dynamic_key+0x1a0/0x1a0
[  110.996058]  ? validate_chain+0xac3/0x1b30
[  110.996127]  __lock_acquire+0x96/0x1870
[  110.996196]  ? check_prev_add+0x20f0/0x20f0
[  110.996266]  ? sched_clock_cpu+0x15/0x1b0
[  110.996339]  ? mark_lock+0xd0/0x14a0
[  110.996401]  lock_acquire.part.0+0x117/0x340
[  110.996470]  ? ath11k_dp_rx_mon_dest_process.constprop.0+0x13a/0x6e0 [ath11k]
[  110.996553]  ? rcu_read_unlock+0x40/0x40
[  110.996622]  ? rcu_read_lock_sched_held+0x3a/0x70
[  110.996685]  ? lock_acquire+0x1a8/0x210
[  110.996751]  ? ath11k_dp_rx_mon_dest_process.constprop.0+0x13a/0x6e0 [ath11k]
[  110.996831]  _raw_spin_lock_bh+0x34/0x80
[  110.996892]  ? ath11k_dp_rx_mon_dest_process.constprop.0+0x13a/0x6e0 [ath11k]
[  110.996971]  ath11k_dp_rx_mon_dest_process.constprop.0+0x13a/0x6e0 [ath11k]
[  110.997071]  ? ath11k_dp_rxbufs_replenish+0x7a0/0x7a0 [ath11k]
[  110.997187]  ? mark_held_locks+0xa5/0xe0
[  110.997272]  ? ath11k_hal_rx_parse_mon_status_tlv+0x6d7/0x1880 [ath11k]
[  110.997389]  ? ath11k_hal_rx_parse_mon_status+0xed/0x170 [ath11k]
[  110.997506]  ath11k_dp_rx_process_mon_rings+0x3f9/0x580 [ath11k]
[  110.997600]  ? ath11k_dp_rx_pdev_alloc+0xd50/0xd50 [ath11k]
[  110.997680]  ath11k_dp_service_mon_ring+0x67/0xe0 [ath11k]
[  110.997759]  ? ath11k_dp_rx_process_mon_rings+0x580/0x580 [ath11k]
[  110.997835]  call_timer_fn+0x167/0x4a0
[  110.997903]  ? add_timer_on+0x3b0/0x3b0
[  110.997967]  ? lockdep_hardirqs_on_prepare.part.0+0x18c/0x370
[  110.998031]  __run_timers.part.0+0x539/0x8b0
[  110.998123]  ? ath11k_dp_rx_process_mon_rings+0x580/0x580 [ath11k]
[  110.998228]  ? call_timer_fn+0x4a0/0x4a0
[  110.998314]  ? clockevents_program_event+0xdd/0x280
[  110.998408]  ? recalibrate_cpu_khz+0x10/0x10
[  110.998496]  ? ktime_get+0x119/0x2f0
[  110.998579]  ? hrtimer_interrupt+0x32f/0x770
[  110.998679]  run_timer_softirq+0x97/0x180
[  110.998764]  __do_softirq+0x276/0x86a
[  110.998850]  __irq_exit_rcu+0x11c/0x180
[  110.998934]  irq_exit_rcu+0x5/0x20
[  110.999017]  sysvec_apic_timer_interrupt+0x8e/0xc0
[  110.999100]  </IRQ>
[  110.999181]  <TASK>
[  110.999261]  asm_sysvec_apic_timer_interrupt+0x12/0x20

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210721171905.61838-4-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
