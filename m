Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68967CD11DD
	for <ath11k@archiver.kernel.org>; Fri, 29 Mar 2024 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCcgt6TKCOdZP2imFffFoQL59mqSqTN8tHv9Ie2Y/NE=; b=rJ3SMU45SLLRxO7cUIU5Lh4ITO
	//wxXfEARnFXxUjSDvLV8rBiQTEwmIMyj89ErAj7pL4uLiiXvQJXFDQQjlI/MRFuUnKPHdrRDT7uE
	sFmWwIXvag9xh8bVSTyuclpHKzRrVY8U0hBJqaKZOaFjdfXFErpo2j54RXIEE20DmAqV9ZR1G0wcm
	/2uUN0PYsGPv/jdMVtzZNk1JgEvD9ROZ3JtZpgrl8RtW0rn2uknLImuN2k+m9x4wmnZLrVQUNMaLA
	mdeN0+bPCqNFQuYfHUDv8KcvbCxKk+nTjPIabndK/0I+3yWg7mTpLYEeANhhWUguQPq63ET0KDxRO
	8puVvnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBS5-00000000OLP-37IZ;
	Fri, 29 Mar 2024 12:35:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBQl-00000000NUp-3we8
	for ath11k@bombadil.infradead.org;
	Fri, 29 Mar 2024 12:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LCcgt6TKCOdZP2imFffFoQL59mqSqTN8tHv9Ie2Y/NE=; b=jtX1HywndjgYc39pCu7bTRJXtF
	gTIKpI22odydBUbJ8rPZZ2rbUWxGyDODxw/QhSXh5AomEZErivJA0zu2ViR5VOOiIfk2nqXVLVOG+
	R6iuFnWrCtul7t8MQ1qbvoK+p3DD6Dq7PKwtMDYmYAXk1r1u2u0M2C519DWAKl3nUr95iSzh0VfPr
	/rTeroEbSpT5g/09UDjbP7p/k0wZb/PGzHX8fLBCDjuwcapb3hI0sNU0+Q0tp6dd6t1qqcwQq8yF7
	qlP0FwS+tWwm0QTURWvZKu6peCRagjyzcH3EWIk+yl6cjTSp9vfjKxvXOvtpDjcYiY2FhHCNiLIqv
	20+VYCEQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBQi-00000001YXt-1Zz9
	for ath11k@lists.infradead.org;
	Fri, 29 Mar 2024 12:33:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C69E6191D;
	Fri, 29 Mar 2024 12:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F19BC43390;
	Fri, 29 Mar 2024 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715622;
	bh=+MP3Qc754c2KDXbkxgsqMAsQkw9M7j/oP6cyl3fXpfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R3u62zAhlDGe7LDMX4czmhYwVxV4vCK/xkVeEG9AXcR7Pid/M18Dc9qFkiqcM54pA
	 KYvNLdyQLKw8HMZ2F92I3+maS/jRjsPRfBpk0Y/Ijw1NHnpI3Nl2Yh905hoNRWP/9o
	 ZyfDGOiKHODqfd3LOcBdra0bN84BmDuXRYF7gUSGXbYOIhI46cPaeKkE4JgadYHBEo
	 fXp6GnmE1SlAGrwhX+i86aUhMrATjrA4hEuPeWR673Xzm7Mwdbz+ag1KqWvM3d4MfR
	 lbJHEiHN9aqgEVI3o1dYFvn2hHK0FSy+RnRZEvx/4Elh4OQPNa6hKwxSNPlaLTVzjb
	 W140+5lhUfumQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 13/20] wifi: ath11k: decrease MHI channel buffer length to 8KB
Date: Fri, 29 Mar 2024 08:33:01 -0400
Message-ID: <20240329123316.3085691-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123316.3085691-1-sashal@kernel.org>
References: <20240329123316.3085691-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.153
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_123356_832215_40B1F1FC 
X-CRM114-Status: GOOD (  11.68  )
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

From: Baochen Qiang <quic_bqiang@quicinc.com>

[ Upstream commit 1cca1bddf9ef080503c15378cecf4877f7510015 ]

Currently buf_len field of ath11k_mhi_config_qca6390 is assigned
with 0, making MHI use a default size, 64KB, to allocate channel
buffers. This is likely to fail in some scenarios where system
memory is highly fragmented and memory compaction or reclaim is
not allowed.

There is a fail report which is caused by it:
kworker/u32:45: page allocation failure: order:4, mode:0x40c00(GFP_NOIO|__GFP_COMP), nodemask=(null),cpuset=/,mems_allowed=0
CPU: 0 PID: 19318 Comm: kworker/u32:45 Not tainted 6.8.0-rc3-1.gae4495f-default #1 openSUSE Tumbleweed (unreleased) 493b6d5b382c603654d7a81fc3c144d59a1dfceb
Workqueue: events_unbound async_run_entry_fn
Call Trace:
 <TASK>
 dump_stack_lvl+0x47/0x60
 warn_alloc+0x13a/0x1b0
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? __alloc_pages_direct_compact+0xab/0x210
 __alloc_pages_slowpath.constprop.0+0xd3e/0xda0
 __alloc_pages+0x32d/0x350
 ? mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
 __kmalloc_large_node+0x72/0x110
 __kmalloc+0x37c/0x480
 ? mhi_map_single_no_bb+0x77/0xf0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
 ? mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
 mhi_prepare_channel+0x127/0x2d0 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
 __mhi_prepare_for_transfer+0x44/0x80 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
 ? __pfx_____mhi_prepare_for_transfer+0x10/0x10 [mhi 40df44e07c05479f7a6e7b90fba9f0e0031a7814]
 device_for_each_child+0x5c/0xa0
 ? __pfx_pci_pm_resume+0x10/0x10
 ath11k_core_resume+0x65/0x100 [ath11k a5094e22d7223135c40d93c8f5321cf09fd85e4e]
 ? srso_alias_return_thunk+0x5/0xfbef5
 ath11k_pci_pm_resume+0x32/0x60 [ath11k_pci 830b7bfc3ea80ebef32e563cafe2cb55e9cc73ec]
 ? srso_alias_return_thunk+0x5/0xfbef5
 dpm_run_callback+0x8c/0x1e0
 device_resume+0x104/0x340
 ? __pfx_dpm_watchdog_handler+0x10/0x10
 async_resume+0x1d/0x30
 async_run_entry_fn+0x32/0x120
 process_one_work+0x168/0x330
 worker_thread+0x2f5/0x410
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xe8/0x120
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x34/0x50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1b/0x30
 </TASK>

Actually those buffers are used only by QMI target -> host communication.
And for WCN6855 and QCA6390, the largest packet size for that is less
than 6KB. So change buf_len field to 8KB, which results in order 1
allocation if page size is 4KB. In this way, we can at least save some
memory, and as well as decrease the possibility of allocation failure
in those scenarios.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Reported-by: Vlastimil Babka <vbabka@suse.cz>
Closes: https://lore.kernel.org/ath11k/96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz/
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://msgid.link/20240223053111.29170-1-quic_bqiang@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index f2149241fb131..265b85c40a4ad 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -97,7 +97,7 @@ static struct mhi_controller_config ath11k_mhi_config_qca6390 = {
 	.max_channels = 128,
 	.timeout_ms = 2000,
 	.use_bounce_buf = false,
-	.buf_len = 0,
+	.buf_len = 8192,
 	.num_channels = ARRAY_SIZE(ath11k_mhi_channels_qca6390),
 	.ch_cfg = ath11k_mhi_channels_qca6390,
 	.num_events = ARRAY_SIZE(ath11k_mhi_events_qca6390),
-- 
2.43.0


