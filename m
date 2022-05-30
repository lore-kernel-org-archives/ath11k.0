Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC27DC433EF
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uqx8MnStOjux85tyNzEiPxW/96oFqo4ImNGim91S/A=; b=tKj+HhCWYlTfNC
	eyo0OZ6VqUFu1U/r9OaMhyvcpREcv/rwxeEimrbUau6g6sFwZWJxOotdg3NiWXHrSf58RV3RqLRd/
	ahGlCCkmHq7NX2Su+RBFswC86lfDRDkZvdS2t8W+B3aK+1qrjToHyFq9tgfcPhGZfbhiVIw5bbkBJ
	9piX+5Kfyj+o2fLR9Va8kdvmB4ZKVYgw7URB6D6rEr/lsF3im3tEgJKr53SjNFio610rHw/ywPcAO
	ccaNQv29Tv2elNDMfExkH611n7fp7JG1qtXVJk+TswSthuwvjuFAX4MxEpv3ohG4lnBdzMxU7Ds/m
	j8mqQ5nG+eDhQbhEiklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfu3-006yYv-Ot; Mon, 30 May 2022 13:57:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfdc-006oNa-18
	for ath11k@lists.infradead.org; Mon, 30 May 2022 13:40:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 780FF60F14;
	Mon, 30 May 2022 13:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAEAC3411C;
	Mon, 30 May 2022 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653918050;
	bh=ARbzlDf1UKpKv9/GIRtOkWDmRY3goZYnA1OEOS34yEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HKEcj1QJUhgUDu174cnGbCE0bTXshTygOuMRjuMpaWdyKMnmBDfUACfpeZSliBALt
	 qgyjFih2jZU8ZY5LVI+HRx9LRBHvvpTriJuGR5pAaCcRkUQF2eq4gq/tZ55lCF2gLS
	 p3IF2tK4fFePr6DchbKbG1B+qv3GMMNhERnTEHA1XA28cpZRJnDmNfXT46YrUSjYZ9
	 8p0McqQ8oF2MskOzAyAcNVZBDzCJjRdvSOSSPU1n4vby2l1V38aPRoOzvoCtzvgMXY
	 fIrOPtoWGoewcqnP5qi85L9ZnC2QASyckbpByyHKUDP9XBVndKUnyrmiPia6VmMz+j
	 a+RreHJAfHIIg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hari Chandrakanthan <quic_haric@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 043/109] ath11k: disable spectral scan during spectral deinit
Date: Mon, 30 May 2022 09:37:19 -0400
Message-Id: <20220530133825.1933431-43-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_064052_215529_5F27EC69 
X-CRM114-Status: GOOD (  11.75  )
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

From: Hari Chandrakanthan <quic_haric@quicinc.com>

[ Upstream commit 161c64de239c7018e0295e7e0520a19f00aa32dc ]

When ath11k modules are removed using rmmod with spectral scan enabled,
crash is observed. Different crash trace is observed for each crash.

Send spectral scan disable WMI command to firmware before cleaning
the spectral dbring in the spectral_deinit API to avoid this crash.

call trace from one of the crash observed:
[ 1252.880802] Unable to handle kernel NULL pointer dereference at virtual address 00000008
[ 1252.882722] pgd = 0f42e886
[ 1252.890955] [00000008] *pgd=00000000
[ 1252.893478] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[ 1253.093035] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.89 #0
[ 1253.115261] Hardware name: Generic DT based system
[ 1253.121149] PC is at ath11k_spectral_process_data+0x434/0x574 [ath11k]
[ 1253.125940] LR is at 0x88e31017
[ 1253.132448] pc : [<7f9387b8>]    lr : [<88e31017>]    psr: a0000193
[ 1253.135488] sp : 80d01bc8  ip : 00000001  fp : 970e0000
[ 1253.141737] r10: 88e31000  r9 : 970ec000  r8 : 00000080
[ 1253.146946] r7 : 94734040  r6 : a0000113  r5 : 00000057  r4 : 00000000
[ 1253.152159] r3 : e18cb694  r2 : 00000217  r1 : 1df1f000  r0 : 00000001
[ 1253.158755] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
[ 1253.165266] Control: 10c0383d  Table: 5e71006a  DAC: 00000055
[ 1253.172472] Process swapper/0 (pid: 0, stack limit = 0x60870141)
[ 1253.458055] [<7f9387b8>] (ath11k_spectral_process_data [ath11k]) from [<7f917fdc>] (ath11k_dbring_buffer_release_event+0x214/0x2e4 [ath11k])
[ 1253.466139] [<7f917fdc>] (ath11k_dbring_buffer_release_event [ath11k]) from [<7f8ea3c4>] (ath11k_wmi_tlv_op_rx+0x1840/0x29cc [ath11k])
[ 1253.478807] [<7f8ea3c4>] (ath11k_wmi_tlv_op_rx [ath11k]) from [<7f8fe868>] (ath11k_htc_rx_completion_handler+0x180/0x4e0 [ath11k])
[ 1253.490699] [<7f8fe868>] (ath11k_htc_rx_completion_handler [ath11k]) from [<7f91308c>] (ath11k_ce_per_engine_service+0x2c4/0x3b4 [ath11k])
[ 1253.502386] [<7f91308c>] (ath11k_ce_per_engine_service [ath11k]) from [<7f9a4198>] (ath11k_pci_ce_tasklet+0x28/0x80 [ath11k_pci])
[ 1253.514811] [<7f9a4198>] (ath11k_pci_ce_tasklet [ath11k_pci]) from [<8032227c>] (tasklet_action_common.constprop.2+0x64/0xe8)
[ 1253.526476] [<8032227c>] (tasklet_action_common.constprop.2) from [<803021e8>] (__do_softirq+0x130/0x2d0)
[ 1253.537756] [<803021e8>] (__do_softirq) from [<80322610>] (irq_exit+0xcc/0xe8)
[ 1253.547304] [<80322610>] (irq_exit) from [<8036a4a4>] (__handle_domain_irq+0x60/0xb4)
[ 1253.554428] [<8036a4a4>] (__handle_domain_irq) from [<805eb348>] (gic_handle_irq+0x4c/0x90)
[ 1253.562321] [<805eb348>] (gic_handle_irq) from [<80301a78>] (__irq_svc+0x58/0x8c)

Tested-on: QCN6122 hw1.0 AHB WLAN.HK.2.6.0.1-00851-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/1649396345-349-1-git-send-email-quic_haric@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/spectral.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index 1afe67759659..e5af9358e610 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -214,7 +214,10 @@ static int ath11k_spectral_scan_config(struct ath11k *ar,
 		return -ENODEV;
 
 	arvif->spectral_enabled = (mode != ATH11K_SPECTRAL_DISABLED);
+
+	spin_lock_bh(&ar->spectral.lock);
 	ar->spectral.mode = mode;
+	spin_unlock_bh(&ar->spectral.lock);
 
 	ret = ath11k_wmi_vdev_spectral_enable(ar, arvif->vdev_id,
 					      ATH11K_WMI_SPECTRAL_TRIGGER_CMD_CLEAR,
@@ -829,9 +832,6 @@ static inline void ath11k_spectral_ring_free(struct ath11k *ar)
 {
 	struct ath11k_spectral *sp = &ar->spectral;
 
-	if (!sp->enabled)
-		return;
-
 	ath11k_dbring_srng_cleanup(ar, &sp->rx_ring);
 	ath11k_dbring_buf_cleanup(ar, &sp->rx_ring);
 }
@@ -883,15 +883,16 @@ void ath11k_spectral_deinit(struct ath11k_base *ab)
 		if (!sp->enabled)
 			continue;
 
-		ath11k_spectral_debug_unregister(ar);
-		ath11k_spectral_ring_free(ar);
+		mutex_lock(&ar->conf_mutex);
+		ath11k_spectral_scan_config(ar, ATH11K_SPECTRAL_DISABLED);
+		mutex_unlock(&ar->conf_mutex);
 
 		spin_lock_bh(&sp->lock);
-
-		sp->mode = ATH11K_SPECTRAL_DISABLED;
 		sp->enabled = false;
-
 		spin_unlock_bh(&sp->lock);
+
+		ath11k_spectral_debug_unregister(ar);
+		ath11k_spectral_ring_free(ar);
 	}
 }
 
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
