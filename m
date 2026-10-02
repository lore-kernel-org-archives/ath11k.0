Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180D4CA5FDD
	for <ath11k@archiver.kernel.org>; Fri,  2 Oct 2026 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JC7rARt4feEVlvX1sGDg6LQ9cf+K6e0ZYnbt8TcaAx0=; b=hfC8flB0K7sfLDPtRJTCCDkfHe
	zQa2EoSKZXtpnT80P3T1LbfNrM87jnJzeBNyzS49RBKgnOYHhPoZAmBpkruCRFBRHCdAxVo+Hhq4U
	RRpp1I8s10oKYQQFmJHeXxu+NBKyg7+E8iQeIbfkHZnmCO6X11VoEw+A3wH9LNjZzkKEaVX2oY2i1
	rtDarQfrM4DX8UZRKub57+VcmIMobhXfX5kz7TmwjdgXz80nEWMjoptzq4F3DpGbR7MKB8XDPaVwD
	vpZNLDtvu6nPCbuN5Q5chLWjsCwiIjeuVnsYZu0jEFFButoLiaLm7Z+GB9Wz2kWFjyaUHBZ9Y2PvT
	4JcHoQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcEd-0000000BYHo-2BAZ;
	Fri, 02 Oct 2026 12:19:31 +0000
Received: from vtj.irix.systems ([82.76.27.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcEa-0000000BYGv-2jnh
	for ath11k@lists.infradead.org;
	Fri, 02 Oct 2026 12:19:29 +0000
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id EC0792DA65;
	Fri, 02 Oct 2026 15:19:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=sig1; bh=JC7rARt4feEVlvX1sGDg6LQ9cf+K6e0ZYnbt8TcaAx0=; b=
	Hy/CPedRShEol128p9GzBSLQrGqDV0FUuQtCJLZuXVKDvKXi4u8+BbfqJPI7ryzo
	J/3haq9/k+Y2JYNVx3UU92aGot8jI8dmnjBcfmaDjzZzEyvK3JozjsXHOPCO9yaK
	smp7ZmqMrRalX6oCmm2/q2mZb7GXT4GiO0NFp22hHnNTj7GdLaHvcwKyevDdvwLE
	mjJpzcM7zKUwkFqh+rNE9ra8ImcPyGTzuvJqjVcgbztsfXV43s+5SIMr4du5DJb5
	wPi572/+NCm+yrA8m01nOlacrhluroY5otPDhphFtewTiJbNJSxlHJJMhCc2Sjox
	9OMrc9lWCs7LG+yLoB3Myw==
Received: from VTJ-MX.corp.irix.systems (unknown [10.57.36.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 5FE382DA64;
	Fri, 02 Oct 2026 15:19:14 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:19:14 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Jeff Johnson <jjohnson@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: fix NULL dereference in pci remove when QMI init incomplete
Date: Fri, 2 Oct 2026 15:19:08 +0300
Message-ID: <20261002121909.994262-1-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2a02:2f04:1:9c23::c]
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_051928_892589_C4A5A13E 
X-CRM114-Status: GOOD (  13.81  )
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

If QMI messages never arrive (for example when qrtr_mhi is not
loaded), WLAN initialization stops before the device is registered.
In this case ATH11K_FLAG_QMI_FAIL is not set because no QMI event
handler is executed, and ATH11K_FLAG_REGISTERED is not set either.

When the driver is removed, ath11k_pci_remove() still calls
ath11k_core_deinit(), which eventually triggers
ath11k_ce_cleanup_pipes() on uninitialized CE pipes and results in a
NULL pointer dereference in ath11k_hal_srng_access_begin():

  ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
  ath11k_ce_cleanup_pipes+0x16c/0x170 [ath11k]
  ath11k_pcic_stop+0x20/0x3c [ath11k]
  ath11k_core_stop+0x30/0x58 [ath11k]
  ath11k_core_deinit+0xf8/0x1b8 [ath11k]
  ath11k_pci_remove+0x74/0x140 [ath11k_pci]

Fix this by also taking the QMI failure path in ath11k_pci_remove()
when ATH11K_FLAG_REGISTERED is not set: core initialization did not
complete, so ath11k_core_deinit() is unsafe. This is the PCI
counterpart of commit 1a7bcf5324c8 ("wifi: ath11k: fix NULL
dereference in ahb remove when QMI init incomplete").

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: 6fbd8898b301 ("ath11k: pci: fix rmmod crash")
Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
Found and fixed with an AI coding assistant (Claude Code), which also
drafted this changelog. The crash was reproduced on a Ubiquiti UniFi U6
Enterprise (IPQ5018 + 2x QCN9074) running 7.2.8 with the OpenWrt
backports ath11k: with qrtr_mhi withheld, rmmod ath11k_pci oopses as
above without this change and is clean with it. On ath-next the patch
is compile-tested (W=1) only.

 drivers/net/wireless/ath/ath11k/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index a163168f3617..1de8ccb02487 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -1181,7 +1181,8 @@ static void ath11k_pci_remove(struct pci_dev *pdev)
 
 	ath11k_pci_set_irq_affinity_hint(ab_pci, NULL);
 
-	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags)) {
+	if (test_bit(ATH11K_FLAG_QMI_FAIL, &ab->dev_flags) ||
+	    !test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags)) {
 		ath11k_pci_power_down(ab, false);
 		ath11k_debugfs_soc_destroy(ab);
 		ath11k_qmi_deinit_service(ab);
-- 
2.47.3



