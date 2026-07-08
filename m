Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E15AC44508
	for <ath11k@archiver.kernel.org>; Wed,  8 Jul 2026 14:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWOk/yMb/DfRr2Yn4LCKXVEmejtbOqAdLmjyo6mC5fk=; b=YaYO5okDNuEBh7VvvGwkWwKZhd
	xoXBTFMY43J2m+kn7aHpUMre0CHaEzlNAn48tpNZft9qN1jQ+N9jPHBm7lySM8IUk5i3Az24WC1p4
	Kh2LNXu/+q6P0DEyi1UdcV0yNcwuIPTfSTbjhVMNpXchfS89lUXkIybO9hK5genb2qE3DQNk7jL/T
	hn8WORCnDlTLP/EusqW3QtmxUg7oRJqyfU+KBr5XNqLv1RWvGGVnho0IRKlyyp2WM5Kz2nXJrI6kZ
	avifvvWf4Md5yzw9IqpbEgueMaZf8NsBImEF7aQTs1mNSyNYqzBiR4GhcqqbAE9WZ/MQczNiK0u1a
	+hJ/LwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTI8-0000000HK68-0jh8;
	Wed, 08 Jul 2026 14:30:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTI5-0000000HK34-3pXQ;
	Wed, 08 Jul 2026 14:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62CF543F67;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43668C2BCF7;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783521021;
	bh=pxGH3Cj3T3IWZGVPncFNsgUx42ibALF5/SiwqEinBMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PB7kiWihiRYLcWnTEqaOtcGV/bwnS/QnMKDwvT2mzkkmrwOLAZ9TVwAtdusUI+bL6
	 /jgrdd6KU+ijUwV10ggZxiBoBdQXdreytotEoIbfWkFyutQuAIBmjR7NB371eQ9O4I
	 M3gHXPlvDskN5gd4TMnVp7FTYDywdwkhPSxGpeMX09cwgLWAnhLKStuDsc1wiGT7qx
	 KViuMGk5FY9AL6YL8tL3LoGQ4c75vZvSeQO04r5LPdd8xmorQbSt/tgwBlHZMVyVFF
	 zoH4JkP0+Rw5D2PanD+cjwabvKoHYT81I72c4pkMwiimhD0/bWDgnsNamtmKfgXWgf
	 JRYJFZ+Rjr+KQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C870C44501;
	Wed,  8 Jul 2026 14:30:21 +0000 (UTC)
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Wed, 08 Jul 2026 16:30:19 +0200
Subject: [PATCH v3 5/8] PCI/ASPM: Return enabled ASPM states from
 pcie_aspm_enabled() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-pci-aspm-fix-v3-5-6bd72451746e@kernel.org>
References: <20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org>
In-Reply-To: <20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Nirmal Patel <nirmal.patel@linux.intel.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
 ath10k@lists.infradead.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>, mani@kernel.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725; i=mani@kernel.org;
 h=from:subject:message-id;
 bh=JE1epGkh6OmrTgbOPCoGhLS46KX+aD9RGtBqPDoeheo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqTl75IEBeBr7vgPEyPnSoBoB6GZ79Rfh8KIORA
 bapu0keiCSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCak5e+QAKCRBVnxHm/pHO
 9TISCACKEukOmg8rnNBVcMT4pIqw0nQnoicAdF3BwaP+F67ZiYu7IvI/dohF5rQoJxZ1/M5XlKW
 z9Kebuzx8GGTVkWvwlAWb21bGBHzbABniUgfrscceykQOFaZzekzGCzpnbGIin/XwayXkcBzi6J
 m8OUTHHJ/L//t+yVO+TsjMZ1s8hrhYdMmPeDjaNnshFI2xJCB7RzvWWfo0Szihq8Dz6Z0JXscBf
 q8DJVQVZBCQeR9T3syqny5AxPjPtpkMzJa4Dn9Y6L2n7kZq9+cYmB0JvPkEZJbnvhTZYUUpLdOD
 d5tezCI2xDPDnkTlCj+4z9zMT3galiXwwD4GdMD2BuAbTOZ8
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for mani@kernel.org/default with
 auth_id=787
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

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

pcie_aspm_enabled() returns 'pcie_link_state::aspm_enabled' parameter which
contains the enabled states. But the API currently returns the 'bool' type
which is used by the callers to decide if ASPM is enabled or not.

To allow the future callers to also make use of the enabled ASPM states,
return the actual type of 'pcie_link_state::aspm_enabled' parameter, 'u32'.

Existing callers can still treat the return value as a 'bool' as the C11
standard guarantees the behavior (this API relied on the same behavior
before as well).

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/pcie/aspm.c | 6 ++++--
 include/linux/pci.h     | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 5e7e199c78d2..3ce6b9319566 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1694,15 +1694,17 @@ module_param_call(policy, pcie_aspm_set_policy, pcie_aspm_get_policy,
 	NULL, 0644);
 
 /**
- * pcie_aspm_enabled - Check if PCIe ASPM has been enabled for a device.
+ * pcie_aspm_enabled - Get the enabled PCIe ASPM states for a device.
  * @pdev: Target device.
  *
  * Relies on the upstream bridge's link_state being valid.  The link_state
  * is deallocated only when the last child of the bridge (i.e., @pdev or a
  * sibling) is removed, and the caller should be holding a reference to
  * @pdev, so this should be safe.
+ *
+ * Return: Enabled PCIe ASPM states. 0 if ASPM is disabled.
  */
-bool pcie_aspm_enabled(struct pci_dev *pdev)
+u32 pcie_aspm_enabled(struct pci_dev *pdev)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index be6719626c8f..61f6b78c19fd 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1921,7 +1921,7 @@ int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
 int pci_force_enable_link_state(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
-bool pcie_aspm_enabled(struct pci_dev *pdev);
+u32 pcie_aspm_enabled(struct pci_dev *pdev);
 #else
 static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
@@ -1935,7 +1935,7 @@ static inline int pci_force_enable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
 static inline void pcie_no_aspm(void) { }
 static inline bool pcie_aspm_support_enabled(void) { return false; }
-static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
+static inline u32 pcie_aspm_enabled(struct pci_dev *pdev) { return 0; }
 #endif
 
 #ifdef CONFIG_HOTPLUG_PCI

-- 
2.43.0



