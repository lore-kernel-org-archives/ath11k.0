Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366FDC43217
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mioh5OLWLIDsj0xhBBcBuE4iQm6oEtpfyV/Izr4KTpw=; b=cx2dgL4XkoFFxP
	CIJ+11IIg18sWIYfTYUYhC8dHT15OMkHZr6bYbGVM0e09xnRUlr7wy0HQMDRaF2pB6YP/qNLaJuo2
	BPdNP/58o2w0I3UFUzzHRQewHGXKLAvl6lqNticdqERkxzohYVPh/ATsOsRKTRkG6Cbsl2UllIrEF
	8I7WJkcfftFv4HguQvVeKD7LhHUR/tgD7OuozsP2S36RN60+Q3x3cGKncN8Dtdu6/CcBJ9ZItxdi1
	2Fk+cjUtUar2WpcMv08cBAFfMx8bon1uguJlyn8J9fjXWywOlqts5CZOaaM4v/kfqNGhojZVPGbYp
	WnoPZ3pyCIg5hmSSq45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIMd-0065bf-IP; Fri, 01 Apr 2022 14:34:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naILb-0064rE-Ea
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 14:33:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC6E361C1A;
 Fri,  1 Apr 2022 14:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB2CC34112;
 Fri,  1 Apr 2022 14:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823634;
 bh=I6ui8yr5ddiJmm8uIzxNym8y7SedmbS78BmSFkx9b2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YGPkVMDrDvqeqkeKO3utmuO40VKB+Qzz23g//7+mYAE76nQmqDM911iZTonjkFzb6
 80FOM9LWLu+pi9tXoz6o6sAoXAbc5pHtmYo/kqNar1jMgGp3TZpH/ZhN+KzrPeCJCH
 ywHqBFocy6Pf5PgwiQUHLKbcMxXnhZkUhe23AyTkwA683Q2ylnLxOnoK1+B873CzX+
 wcJULDWh943TBEwfu5Jc+eSm82ivV/NbPHiBGJeJ+Cfb6zsdta4dvUufBfZeiMUQSy
 DscyZDhfEZ3AF/SxwTfpWjzDh3gLWONaL2jSYMwxg6Vc7RZXs5EXWgUx+9D8ZURuXS
 JjBDmrXOkLcuw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kalle Valo <quic_kvalo@quicinc.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sasha Levin <sashal@kernel.org>, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 020/109] ath11k: pci: fix crash on suspend if
 board file is not found
Date: Fri,  1 Apr 2022 10:31:27 -0400
Message-Id: <20220401143256.1950537-20-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_073355_604368_90FDEAAD 
X-CRM114-Status: GOOD (  12.80  )
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

[ Upstream commit b4f4c56459a5c744f7f066b9fc2b54ea995030c5 ]

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
Link: https://lore.kernel.org/r/20220127090117.2024-1-kvalo@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 4c348bacf2cb..754578f3dcf1 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1419,6 +1419,11 @@ static __maybe_unused int ath11k_pci_pm_suspend(struct device *dev)
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
@@ -1431,6 +1436,11 @@ static __maybe_unused int ath11k_pci_pm_resume(struct device *dev)
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
2.34.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
