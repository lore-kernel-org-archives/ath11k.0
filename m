Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C181EC7113E
	for <ath11k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bpIIr412h6qi7YHWKmAJOkUa0XBDTSw1GCUKcTFMnYg=; b=tlBjDky7F8H1IiSOx2jdPI+Vtf
	qOLHgatDZUzlwbjhEKbiDd5BGEv42n/Dcu6li/HX1QM0pC444nc149HlgKujVvbUAHCY80uYa7YYn
	f7r60R6xehACRIbfETniarPh2+RL1O9DvtA+hcep2lXY6sXABxsOZ9PFS9Obw5LMCDMVZZgQ5xLc1
	G2GBiYtODHg+JwlrWa2WytByDiVMzz2gHGW3+V5Z5ywpYY48lxku8N+jsVEaoIoO9PtI7Kz1sUY6d
	RVLnXIOQ8/v22GkTh7vUNMACOeLcCcdaCgiJuTkLf9Rk09Ghb23QqocV3NDYvhtzI4A7ROWz5RDm1
	+/wMhn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYz-0000000B57r-0af7;
	Wed, 11 Jun 2025 19:56:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOUs-0000000Adgz-21eV
	for ath11k@lists.infradead.org;
	Wed, 11 Jun 2025 16:40:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so57964275e9.3
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 09:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1749660016; x=1750264816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpIIr412h6qi7YHWKmAJOkUa0XBDTSw1GCUKcTFMnYg=;
        b=gWpecQro5Fw3I3BK6eW4EFSh6c9MWtpuf+lYsFOKY5Dzx5/g8/BC/2TBvkkg/Kk/Ou
         3/ERYWqV+Fu6MqNtL47DmMZHZ1VTJ/B9E6xNwdqoLHp5gpIERZU2gZ2nFMq28mC+/UpT
         ik3vFw605bvUVauIzur3BOpTiRo5UqAYx1dNr+PMu9yAwfXacoNam6KZy5QuM2J2zBZc
         uS61Y8ZMmiq3XdJMkCJNemTExE4Ulg8+o5w+TOnf6kCQrAycKhRrYpd/bcywGL7Gz6b2
         qFsJtEj7+GDDha+ZNdZzlY9yudBJRRadnHCXeQh0BfXd8xGNOrq3rDx1AagTuTckKhUG
         iESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749660016; x=1750264816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpIIr412h6qi7YHWKmAJOkUa0XBDTSw1GCUKcTFMnYg=;
        b=SR505l6x1PVtd0E1fH0Z/N9yZXGaHE0NMSozwaSYgUG/3WR0WC7s6p0sQ/Qkvqh3Re
         3cCZYhgnxgbaQ/na1q4Q4/D9D2RTwEvwidy1hlhs1UKJitsw0RYm0Zjro1vG6IyaDXUO
         8/3b5U5yXusov9zeR/bLXr6lvV/lvgMtIC/xSgtabp7Ia0AJSIXwXSzzHWbnWO23DZD6
         GBIqcRxqVSRqFfmq+cCLLHRAVhAk2M5zWdbJ19pJFRS8/1Y/0m5fiAyrLuNJuFm7l0bm
         pgVEwNv6zPXM+s1Qa4NkH5fmzEzUYfR6bRJ1QfUYLUVtHNBvcOmkibDFJR3lbj3yxybg
         J33A==
X-Gm-Message-State: AOJu0Yz1nMYv2Di9UgJHLIiPUmZmMg0WvH/ESe1dLn1/oAEX4SQJppjS
	lqvhdivHYe5G2c1frEHSEUOCJzbM/Abmj8IlpBXEoDZGUsZElucRho5R/IF4/hIu/YY=
X-Gm-Gg: ASbGncsQIdlXD76FajTaRbBQ15UbXd02e0+jGBfBFiAGKRD/u7N6xyzdQhX+qoH3KGC
	puKVNLSIBzgYoZBNg3V2PXMhk4wYhDMNOUJSWu9c297oZvjcSqNP+HDEMTRa2VFBSGBy3C6kHfv
	MPp+luT2PIoaI7aKn+mCUbScFa+FlBvQpVZLlH/AgY+kOHOBYLIWsV574qkK+w43jvpGpTlIbGp
	ktsuew4YMH8/y6X8mCpr0CJDKxAFDnWk8MYVD3u02qv9LEtoFE6QOe1GQuH1bscSKLRJVMRJoe5
	YAOJA7uYrTC2PdLObxZy30yGhzj5QRgIKs1QJX08WwxxURbpn9uYhVlMWgEv6Ti6d1yVKSVhMwP
	AmPfW74ZqT8TT40klvk81Vg==
X-Google-Smtp-Source: AGHT+IExmN5nKKRM3cMk/QnLRlHaydJ/Cszjs13vnlBuajVpdmmRJFpfo/it2FNx38EQznXuFXW3vQ==
X-Received: by 2002:a05:600c:3586:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4532b8c2c9amr5327405e9.15.1749660016157;
        Wed, 11 Jun 2025 09:40:16 -0700 (PDT)
Received: from Ubuntu24x64.. (288080060.box.freepro.com. [130.180.210.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532461211sm15561599f8f.86.2025.06.11.09.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:40:15 -0700 (PDT)
From: balsam.chihi@moment.tech
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	Balsam CHIHI <balsam.chihi@moment.tech>
Subject: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
Date: Wed, 11 Jun 2025 18:40:04 +0200
Message-ID: <20250611164004.38580-1-balsam.chihi@moment.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_094018_753624_B58CB754 
X-CRM114-Status: GOOD (  12.48  )
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

From: Balsam CHIHI <balsam.chihi@moment.tech>

During system reboot or module removal (rmmod), a crash was observed
due to a synchronous external abort caused by invalid register access
in ath11k_pci_clear_dbg_registers(). This happens when the device is
already powered off and the driver attempts to read debug registers.

The crash log shows:
root@OpenWrt:~# reboot
[  343.663492] Internal error: synchronous external abort:
0000000096000210 [#1] SMP
[  343.670992] Modules linked in: [...]
[  343.842432] CPU: 7 PID: 9435 Comm: procd Tainted: G O 6.6.86 #0
[  343.849746] Hardware name: LS1088A
[  343.856969] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  343.863933] pc : ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
[  343.870125] lr : ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
[...]
[  343.950800] Call trace:
[  343.953241]  ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
[  343.959080]  ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
[  343.964671]  ath11k_pcic_read32+0x30/0xb4 [ath11k]
[  343.969477]  ath11k_pci_get_msi_irq+0x528/0x1900 [ath11k_pci]
[  343.975230]  ath11k_pci_get_msi_irq+0x1460/0x1900 [ath11k_pci]
[  343.981068]  ath11k_pci_get_msi_irq+0x1750/0x1900 [ath11k_pci]
[  343.986906]  pci_device_shutdown+0x34/0x44
[  343.991004]  device_shutdown+0x160/0x268
[  343.994928]  kernel_restart+0x40/0xc0
[  343.998594]  __do_sys_reboot+0x104/0x23c
[  344.002518]  __arm64_sys_reboot+0x24/0x30
[  344.006529]  do_el0_svc+0x6c/0x100
[  344.009931]  el0_svc+0x28/0x9c
[  344.012986]  el0t_64_sync_handler+0x120/0x12c
[  344.017344]  el0t_64_sync+0x178/0x17c
[  344.021009] Code: f94e0a80 92404a73 91420273 8b130013 (b9400273)
[  344.027102] ---[ end trace 0000000000000000 ]---

This patch adds a `power_on` flag to conditionally skip debug register
reads when the device is not powered, preventing invalid memory access.

With this change, the system no longer crashes on reboot or rmmod,
and the driver continues to function correctly when reloaded.

Tested-on: QCN9074 hw2.0 PCIe on LS1088A
Tested-on: OpenWrt 24.10.1
Fixes: crash on reboot/rmmod due to invalid register access
Signed-off-by: Balsam CHIHI <balsam.chihi@moment.tech>
---
 drivers/net/wireless/ath/ath11k/pci.c | 36 ++++++++++++++++-----------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 78444f8ea153..0c1b55957557 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -203,16 +203,18 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 		ath11k_warn(ab, "link down error during global reset\n");
 }
 
-static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
+static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab, bool power_on)
 {
-	u32 val;
+	if (power_on) {
+		u32 val;
 
-	/* read cookie */
-	val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
+		/* read cookie */
+		val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
+		ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val);
 
-	val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
+		val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
+		ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
+	}
 
 	/* TODO: exact time to sleep is uncertain */
 	mdelay(10);
@@ -223,14 +225,18 @@ static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
 	ath11k_pcic_write32(ab, WLAON_WARM_SW_ENTRY, 0);
 	mdelay(10);
 
-	val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
+	if (power_on) {
+		u32 val;
 
-	/* A read clear register. clear the register to prevent
-	 * Q6 from entering wrong code path.
-	 */
-	val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
-	ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
+		val = ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
+		ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val);
+
+		/* A read clear register. clear the register to prevent
+		* Q6 from entering wrong code path.
+		*/
+		val = ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
+		ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
+	}
 }
 
 static int ath11k_pci_set_link_reg(struct ath11k_base *ab,
@@ -368,7 +374,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 	}
 
 	ath11k_mhi_clear_vector(ab);
-	ath11k_pci_clear_dbg_registers(ab);
+	ath11k_pci_clear_dbg_registers(ab, power_on);
 	ath11k_pci_soc_global_reset(ab);
 	ath11k_mhi_set_mhictrl_reset(ab);
 }
-- 
2.43.0


