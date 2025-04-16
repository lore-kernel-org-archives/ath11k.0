Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51462C369C2
	for <ath11k@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=543g44xea+VkS5dgpNjg5ImV/Iq2la3ZwMFisqth3UU=; b=rXNFpzqQ+cLu06NAtAWeZTKQSd
	F7LBaMKDmb4VVderAuQPb/VYu3cb9+Zd0TQXRx5mTQb46tGXiJeOEyLebsc5iy089S1Up6+BAP7ew
	9ifPGbeFfGveMmaLsV2cvhoC+a/DRmG/b3O9bOZjByn47KiPn6xlviOAzmA4PMMFYeMMub3PjbVw4
	4WrxxdwUdXBBEYFXrKLsww9250D/dX7cUOxsdZiuaDR3rHlOUdVxK1wx3xvMVzieMQuW3APk/cVrY
	/oeqa3zVw6PzKUOCS0AU/QHGlRWXhueuWrGktbm6fd6F669KX6Rxzw6BYdA/m05M0nkkItUgH20y7
	WeUcuf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u505G-00000009CoH-2cMX;
	Wed, 16 Apr 2025 10:33:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ziG-000000095LU-3N4m
	for ath11k@lists.infradead.org;
	Wed, 16 Apr 2025 10:09:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so352226f8f.1
        for <ath11k@lists.infradead.org>; Wed, 16 Apr 2025 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1744798186; x=1745402986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=543g44xea+VkS5dgpNjg5ImV/Iq2la3ZwMFisqth3UU=;
        b=xWpG/jbERDb6ZMW4P2NSsAXI+6NJmg5Vsmleu/o9fJzwpDzFZ1x/8RiWLHBGRiWDia
         qz676wNsC9acHiXzhv068no3c2urG/vhMKJfLUuksWQNi6cx+WYs43mND1aSW8gi/Mpt
         Am2/CbOtaJ/UAmkSnouMQYFckbP+Am2ZxAU5paV1+iRx0c5QVoT71n39Yvd308ohuew+
         WcH4TQ71NdggnKMi1dJDikZCVoAXSm1IXBA9OCW0Bi4/YFErue8u38LXveey+XrwmpXB
         8ki9Ppk6gD+o1+vLiJ6qDK/aRm9BRc6EUfM0rRLTuUKKa7KXgD1m1yhMXwRncaKbbpub
         Dj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798186; x=1745402986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=543g44xea+VkS5dgpNjg5ImV/Iq2la3ZwMFisqth3UU=;
        b=hge9ag/P6//v3SAsU453nOumkDQ8Mg+6I2vUJ4wcHHnOKyxT4g6TtRXYk7Fp124Kup
         Q4ENHjc+QVl1Wq9cC0wHjfZI9xB9rXkI8KuTwBVZ8HH9fkNWRrxGqaen2pxI9rC0z2Pv
         +7959uJ/X3lg7QLWLV5cxJFbRMTB25dyRgF0qHXp/JJ7OwvvoTYmGgqKr4ym6vsXzk3b
         E0JI+L+RjOp37fgiixl7NPhD8YStge+XfKxbf/nOnpMIrpvowy7FXGnOrhomYbijXVtE
         0trc3hCGocjFLPZ9BVpS9MSc+g9/gD3ixxiNMilFOSYPlaXg/3K4+IkRENQallDyBJ5d
         6jaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPNb5lkoB7ARbi9+ROKM4TbNP02sfnAwqpIuh7VYvmqv1OJh3Rid7aNITFiJtILpYtvK5Z2TQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGQVLSg314TP4MRw2xZ/SXuVFnWiGLtXKFSswUbomqn6iSuKmC
	O+yXmQu4JiVbWlwoTZLud8x3emNGVxCv0vjhSfZnwUxdBBtDzwU+oArkuDJP1s0=
X-Gm-Gg: ASbGncuzK4pEwhtj3AJ0kAI/+41S75ECAQNdGhbDXfgdGTQSdGhD8Cb9hx/8sRejYwz
	Hp+pIiVH+ttDw6FmTJNFNTv34bfDXOT6KLiZcsakXmPFoZW7LJPdWE0Jx9zE0947YcfNIkxAPvn
	4TWZZTIUQXftDkMM9Pdh1LLDGMG2XNFi/yzHYiKwvWLhUMMwrI3DlpJCdeWR2IEMep95yMX4W92
	99SF9zJKrp1qsij+N6wj1Z239iGSArTfp28IoVE76lhPQR02pOeW2XxdiuMhlwxhBq4719i2Ri+
	1NyDzaepzv/BKJz+72UjqohtMqGd2hGDJ++PNzcrrzL1T87JMDnxxcP6XTy1bHcE+WZurEUcgGX
	7F3AbglgOI8vD018GaGGBOQHNUQ==
X-Google-Smtp-Source: AGHT+IGwQ3IXzcguNuHXUXMsKyJBwB6sWZPhOqSpcFC9W5QC8DJ5RR8zkrsi+bOfsec4FmA9/kCOrQ==
X-Received: by 2002:a5d:64a7:0:b0:39e:cbe1:8d68 with SMTP id ffacd0b85a97d-39ee5b10f0amr1143077f8f.6.1744798186117;
        Wed, 16 Apr 2025 03:09:46 -0700 (PDT)
Received: from localhost.localdomain (288080060.box.freepro.com. [130.180.210.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf447777sm16458263f8f.100.2025.04.16.03.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:09:45 -0700 (PDT)
From: balsam.chihi@moment.tech
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	Balsam CHIHI <balsam.chihi@moment.tech>
Subject: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload with QCN9074 PCIe WiFi 6 modules
Date: Wed, 16 Apr 2025 12:09:39 +0200
Message-ID: <20250416100939.282481-1-balsam.chihi@moment.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_030949_047280_E970D9F4 
X-CRM114-Status: GOOD (  12.91  )
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

This patch addresses a crash issue that occurs when unloading the
ath11k_pci driver with QCN9074 PCIe WiFi 6 modules.
The crash is caused by the driver attempting to perform reset
operations during unload, leading to a synchronous external abort
and kernel panic, as indicated by the error log:

[ 5615.902985] Internal error: synchronous external abort: 0000000096000210 [#1] SMP
...
[ 5616.056382] CPU: 7 PID: 12605 Comm: procd Tainted: G O 6.6.73 #0
...
[ 5616.069876] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 5616.076841] pc : ath11k_pci_get_msi_irq+0x18b4/0x1914 [ath11k_pci]
[ 5616.083035] lr : ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
[ 5616.163712] Call trace:
[ 5616.166153] ath11k_pci_get_msi_irq+0x18b4/0x1914 [ath11k_pci]
[ 5616.171993] ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
[ 5616.177583] ath11k_pcic_read32+0x30/0xb4 [ath11k]
[ 5616.182391] ath11k_pci_get_msi_irq+0x528/0x1914 [ath11k_pci]
[ 5616.188143] ath11k_pci_get_msi_irq+0x147c/0x1914 [ath11k_pci]
[ 5616.193983] ath11k_pci_get_msi_irq+0x1764/0x1914 [ath11k_pci]
[ 5616.199822] pci_device_shutdown+0x34/0x44
[ 5616.203923] device_shutdown+0x160/0x268
[ 5616.207847] kernel_restart+0x40/0xc0
[ 5616.211512] __do_sys_reboot+0x104/0x23c
[ 5616.215436] __arm64_sys_reboot+0x24/0x30
[ 5616.219447] do_el0_svc+0x6c/0xfc
[ 5616.222761] el0_svc+0x28/0x9c
[ 5616.225817] el0t_64_sync_handler+0x120/0x12c
[ 5616.230174] el0t_64_sy
[ 5616.233839] Code: f94e0a80 92404a73 91420273 8b130013 (b9400273)
[ 5616.239932] ---[ end trace 0000000000000000 ]---
[ 5616.244547] Kernel panic - not syncing: synchronous external abort: Fatal exception in interrupt
[ 5616.253343] Kernel Offset: disabled
[ 5616.256827] CPU features: 0x0,00000000,00020000,1000400b
[ 5616.262138] Memory Limit: none
[ 5616.265188] Rebooting in 3 seconds..
[ 5620.268926] Unable to restart system
[ 5620.272503] Reboot failed -- System halted

The fix involves adding a conditional check for the power state before
performing the reset operations in the ath11k_pci_sw_reset function.
This ensures that the reset functions are only called when loading the driver,
preventing the crash during driver unload.

Signed-off-by: Balsam CHIHI <balsam.chihi@moment.tech>
---
 drivers/net/wireless/ath/ath11k/pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 78444f8ea1535..b9c8963c17047 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -368,9 +368,12 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 	}
 
 	ath11k_mhi_clear_vector(ab);
-	ath11k_pci_clear_dbg_registers(ab);
-	ath11k_pci_soc_global_reset(ab);
-	ath11k_mhi_set_mhictrl_reset(ab);
+
+	if (power_on) {
+		ath11k_pci_clear_dbg_registers(ab);
+		ath11k_pci_soc_global_reset(ab);
+		ath11k_mhi_set_mhictrl_reset(ab);
+	}
 }
 
 static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
-- 
2.43.0


