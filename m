Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8466C433FE
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RQ3DgQQ0myXglhQZgM/gLLVcHpJWIfkBpkfSR2GHeeM=; b=rlyXJ6ItrwQRW0
	wpb2vg+uWj7opc+nCTkiltTAPRewTvzpMswusHeob1Pe0A09qC3/S58imU5x2Pjipx0n+gfU4A/TZ
	+FggmltioWZw5tiep2C/lOaq9mEyuor0ZXdBrlgejSuU03u3FfMrVf5ehW/X1e+ELnTSKj0/2vnN+
	SVAGLhIhArWy/d3wjCcVhsRxFniY+h38NbZ1cXUmQ19dmnvAI053Fte203wcDODUPR3VwJ5XKKpg7
	2McwcD64yLbS+3QeYo/Sq/cciqR8IRXMsCoDSyxy8+Z9SWI0hcRL6lqrdW5A8AWfImcISVNtHuf/S
	tWQQcjONPUE/IFbHjuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD0ek-00Emwl-9l; Thu, 27 Jan 2022 09:01:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD0eh-00EmvX-Kc
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 09:01:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 870D261B06
 for <ath11k@lists.infradead.org>; Thu, 27 Jan 2022 09:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7E1C340E4;
 Thu, 27 Jan 2022 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643274082;
 bh=HZQFsC8qWdLVHadapLXqNNuM7TltFeIiRjUJbNl9I7Q=;
 h=From:To:Cc:Subject:Date:From;
 b=YIk9O5IfnvBhIbdpqjKhSUFWswNIAU03PFLIFBq93nbuaBP7bmnZBAVJePJx2+aiR
 GIRG0bvLwRdJdEflp2CbxiEXLcgHM1UYSfHGdWxqENtf1ysYxFyYHh2v5aHTqRfJ6a
 +adQ52bClnM/uB3YXA1lmCo5WioynSezq06eujAZYzC//9M4UEJNbqWmKDO0uqy0vl
 1Muuu0ALGAOSvnvnTrz4/xhvBdpHIDUy2w43waCKN5FPB5wy0teHY5cT76J5yBei16
 gZpdVDLggTV7TtQ7NMQJj4Nj7v1tfa1icRXd+QcRSd3pdnhPK+kpzYgGQmOjHzi9WR
 dgw9JU5X1L+LA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 1/2] ath11k: pci: fix crash on suspend if board file is not
 found
Date: Thu, 27 Jan 2022 11:01:16 +0200
Message-Id: <20220127090117.2024-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_010123_806142_9C448E70 
X-CRM114-Status: GOOD (  12.84  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

Mario reported that the kernel was crashing on suspend if ath11k was not able
to find a board file:

[  473.693286] PM: Suspending system (s2idle)
[  473.693291] printk: Suspending console(s) (use no_console_suspend to debug)
[  474.407787] BUG: unable to handle page fault for address: 0000000000002070
[  474.407791] #PF: supervisor read access in kernel mode
[  474.407794] #PF: error_code(0x0000) - not-present page
[  474.407798] PGD 0 P4D 0
[  474.407801] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  474.407805] CPU: 2 PID: 2350 Comm: kworker/u32:14 Tainted: G        W         5.16.0 #248
[...]
[  474.407868] Call Trace:
[  474.407870]  <TASK>
[  474.407874]  ? _raw_spin_lock_irqsave+0x2a/0x60
[  474.407882]  ? lock_timer_base+0x72/0xa0
[  474.407889]  ? _raw_spin_unlock_irqrestore+0x29/0x3d
[  474.407892]  ? try_to_del_timer_sync+0x54/0x80
[  474.407896]  ath11k_dp_rx_pktlog_stop+0x49/0xc0 [ath11k]
[  474.407912]  ath11k_core_suspend+0x34/0x130 [ath11k]
[  474.407923]  ath11k_pci_pm_suspend+0x1b/0x50 [ath11k_pci]
[  474.407928]  pci_pm_suspend+0x7e/0x170
[  474.407935]  ? pci_pm_freeze+0xc0/0xc0
[  474.407939]  dpm_run_callback+0x4e/0x150
[  474.407947]  __device_suspend+0x148/0x4c0
[  474.407951]  async_suspend+0x20/0x90
dmesg-efi-164255130401001:
Oops#1 Part1
[  474.407955]  async_run_entry_fn+0x33/0x120
[  474.407959]  process_one_work+0x220/0x3f0
[  474.407966]  worker_thread+0x4a/0x3d0
[  474.407971]  kthread+0x17a/0x1a0
[  474.407975]  ? process_one_work+0x3f0/0x3f0
[  474.407979]  ? set_kthread_struct+0x40/0x40
[  474.407983]  ret_from_fork+0x22/0x30
[  474.407991]  </TASK>

The issue here is that board file loading happens after ath11k_pci_probe()
succesfully returns (ath11k initialisation happends asynchronously) and the
suspend handler is still enabled, of course failing as ath11k is not properly
initialised. Fix this by checking ATH11K_FLAG_QMI_FAIL during both suspend and
resume.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Reported-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215504
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index d73b522a0081..16a3560cfaf8 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1571,6 +1571,11 @@ static __maybe_unused int ath11k_pci_pm_suspend(struct device *dev)
 	struct ath11k_base *ab = dev_get_drvdata(dev);
 	int ret;
 
+	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot skipping pci suspend as qmi is not initialised\n");
+		return 0;
+	}
+
 	ret = ath11k_core_suspend(ab);
 	if (ret)
 		ath11k_warn(ab, "failed to suspend core: %d\n", ret);
@@ -1583,6 +1588,11 @@ static __maybe_unused int ath11k_pci_pm_resume(struct device *dev)
 	struct ath11k_base *ab = dev_get_drvdata(dev);
 	int ret;
 
+	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+		ath11k_dbg(ab, ATH11K_DBG_BOOT, "boot skipping pci resume as qmi is not initialised\n");
+		return 0;
+	}
+
 	ret = ath11k_core_resume(ab);
 	if (ret)
 		ath11k_warn(ab, "failed to resume core: %d\n", ret);
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
