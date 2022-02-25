Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACEBC43217
	for <ath11k@archiver.kernel.org>; Fri, 25 Feb 2022 08:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36GOC2CxA1/mdrQ3UlEsoToHZNoN8nBBpVZ77LUf0NA=; b=u8VzgBeRXFQE8s
	hsrpBU6Tk5xKdOiV4hvRsHr0KcWNABKi8ZKkwwDh6jXdor5gKXdkZv416tMktTnltTK4AUAnlhS/v
	ImKSQ4IL80Hd40T/QM4uWQMQByGx6lZA6Ghkz4bC7FSv7fMuTuiP0UNdwyW6yw7Cjk/KEazJ+583U
	r5WxnFZahWXX1kWvoSBhqLCPYWrmnqT4mACipWzDjNuIrCD6CHGg5SC4a1XTqIDpMW9/BC3LJNAPP
	1tFj69v4qVM+qsNq7LSBADQ/7wAQrAgKH4HC5byIjypOSyxusHp2whbSw68DYgF8LEhp/y2FfDYJc
	g51G6kj/sGbZImnPsWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNWEx-0040cu-3G; Fri, 25 Feb 2022 08:46:15 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNWEu-0040ax-02
 for ath11k@lists.infradead.org; Fri, 25 Feb 2022 08:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645778772; x=1677314772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=phngvTnaxifJzlhzmmF1rO3OdpLOMsIIKjL0g+CQaAE=;
 b=ux9MSwMn7qxwIaW/2lRJWQ+0soQrmu6ZtR2BXOEZThyccGpPNIXwjxwh
 FxBeYQjoxXW4C3ynpw0RCqkNnjxKg5E8icsA+faindDCEGLyMK+k/nIDu
 CsAXFUk2qomU8nhKTRJNp7u8lmKfyYuozYHOLvpP+RgicWFOPmcc8ofns Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 25 Feb 2022 00:46:11 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 00:46:12 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 00:46:11 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 00:46:10 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v7 4/4] ath11k: fix the warning of dev_wake in
 mhi_pm_disable_transition()
Date: Fri, 25 Feb 2022 03:45:48 -0500
Message-ID: <20220225084548.19534-5-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225084548.19534-1-quic_wgong@quicinc.com>
References: <20220225084548.19534-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_004612_117127_C496480E 
X-CRM114-Status: GOOD (  14.42  )
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

When test device recovery with below command, it has warning in message
as below.
echo assert > /sys/kernel/debug/ath11k/wcn6855\ hw2.0/simulate_fw_crash
echo assert > /sys/kernel/debug/ath11k/qca6390\ hw2.0/simulate_fw_crash

warning message:
[ 1965.642121] ath11k_pci 0000:06:00.0: simulating firmware assert crash
[ 1968.471364] ieee80211 phy0: Hardware restart was requested
[ 1968.511305] ------------[ cut here ]------------
[ 1968.511368] WARNING: CPU: 3 PID: 1546 at drivers/bus/mhi/core/pm.c:505 mhi_pm_disable_transition+0xb37/0xda0 [mhi]
[ 1968.511443] Modules linked in: ath11k_pci ath11k mac80211 libarc4 cfg80211 qmi_helpers qrtr_mhi mhi qrtr nvme nvme_core
[ 1968.511563] CPU: 3 PID: 1546 Comm: kworker/u17:0 Kdump: loaded Tainted: G        W         5.17.0-rc3-wt-ath+ #579
[ 1968.511629] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
[ 1968.511704] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
[ 1968.511787] RIP: 0010:mhi_pm_disable_transition+0xb37/0xda0 [mhi]
[ 1968.511870] Code: a9 fe ff ff 4c 89 ff 44 89 04 24 e8 03 46 f6 e5 44 8b 04 24 41 83 f8 01 0f 84 21 fe ff ff e9 4c fd ff ff 0f 0b e9 af f8 ff ff <0f> 0b e9 5c f8 ff ff 48 89 df e8 da 9e ee e3 e9 12 fd ff ff 4c 89
[ 1968.511923] RSP: 0018:ffffc900024efbf0 EFLAGS: 00010286
[ 1968.511969] RAX: 00000000ffffffff RBX: ffff88811d241250 RCX: ffffffffc0176922
[ 1968.512014] RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff888118a90a24
[ 1968.512059] RBP: ffff888118a90800 R08: 0000000000000000 R09: ffff888118a90a27
[ 1968.512102] R10: ffffed1023152144 R11: 0000000000000001 R12: ffff888118a908ac
[ 1968.512229] R13: ffff888118a90928 R14: dffffc0000000000 R15: ffff888118a90a24
[ 1968.512310] FS:  0000000000000000(0000) GS:ffff888234200000(0000) knlGS:0000000000000000
[ 1968.512405] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1968.512493] CR2: 00007f5538f443a8 CR3: 000000016dc28001 CR4: 00000000003706e0
[ 1968.512587] Call Trace:
[ 1968.512672]  <TASK>
[ 1968.512751]  ? _raw_spin_unlock_irq+0x1f/0x40
[ 1968.512859]  mhi_pm_st_worker+0x3ac/0x790 [mhi]
[ 1968.512959]  ? mhi_pm_mission_mode_transition.isra.0+0x7d0/0x7d0 [mhi]
[ 1968.513063]  process_one_work+0x86a/0x1400
[ 1968.513184]  ? pwq_dec_nr_in_flight+0x230/0x230
[ 1968.513312]  ? move_linked_works+0x125/0x290
[ 1968.513416]  worker_thread+0x6db/0xf60
[ 1968.513536]  ? process_one_work+0x1400/0x1400
[ 1968.513627]  kthread+0x241/0x2d0
[ 1968.513733]  ? kthread_complete_and_exit+0x20/0x20
[ 1968.513821]  ret_from_fork+0x22/0x30
[ 1968.513924]  </TASK>

Reason is mhi_deassert_dev_wake() from mhi_device_put() is called
but mhi_assert_dev_wake() from __mhi_device_get_sync() is not called
in progress of recovery. Commit 8e0559921f9a ("bus: mhi: core:
Skip device wake in error or shutdown state") add check for the
pm_state of mhi in __mhi_device_get_sync(), and the pm_state is not
the normal state untill recovery is completed, so it leads the
dev_wake is not 0 and above warning print in mhi_pm_disable_transition()
while checking mhi_cntrl->dev_wake.

Add check in ath11k_pci_write32()/ath11k_pci_read32() to skip call
mhi_device_put() if mhi_device_get_sync() does not really do wake,
then the warning gone.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 903758751c99..8a3ff12057e8 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -191,6 +191,7 @@ void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	u32 window_start;
+	int ret = 0;
 
 	/* for offset beyond BAR + 4K - 32, may
 	 * need to wakeup MHI to access.
@@ -198,7 +199,7 @@ void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 	if (ab->hw_params.wakeup_mhi &&
 	    test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
 	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+		ret = mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
 
 	if (offset < WINDOW_START) {
 		iowrite32(value, ab->mem  + offset);
@@ -222,7 +223,8 @@ void ath11k_pci_write32(struct ath11k_base *ab, u32 offset, u32 value)
 
 	if (ab->hw_params.wakeup_mhi &&
 	    test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
+	    offset >= ACCESS_ALWAYS_OFF &&
+	    !ret)
 		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
 }
 
@@ -230,6 +232,7 @@ u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 	u32 val, window_start;
+	int ret = 0;
 
 	/* for offset beyond BAR + 4K - 32, may
 	 * need to wakeup MHI to access.
@@ -237,7 +240,7 @@ u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 	if (ab->hw_params.wakeup_mhi &&
 	    test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
 	    offset >= ACCESS_ALWAYS_OFF)
-		mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
+		ret = mhi_device_get_sync(ab_pci->mhi_ctrl->mhi_dev);
 
 	if (offset < WINDOW_START) {
 		val = ioread32(ab->mem + offset);
@@ -261,7 +264,8 @@ u32 ath11k_pci_read32(struct ath11k_base *ab, u32 offset)
 
 	if (ab->hw_params.wakeup_mhi &&
 	    test_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags) &&
-	    offset >= ACCESS_ALWAYS_OFF)
+	    offset >= ACCESS_ALWAYS_OFF &&
+	    !ret)
 		mhi_device_put(ab_pci->mhi_ctrl->mhi_dev);
 
 	return val;
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
