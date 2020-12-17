Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B715C4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 15:22:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1438D23975
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 15:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1438D23975
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rN8Fzi6yPNeusqKmLNCswocLXCehHACN6Rgd1aQ5P0c=; b=Y5y+qkOOqf+qWK2asO2ynDiMxS
	LCDmfe91D33R6MdiGUEwmQoqChN/JmS2MRGWMZUHWGc4n0VjJ6QKtxdjAeXQ7vASS1R/tq6EyKWz2
	2i7g8uYBEvPc9AlH9iHH1ti39xXw+WyFwj9bdGIqwirkiAJVIu9zro7rAj9sbVezOPy5UVIf/ROy3
	zSUoruK6RVDiumjHYCoYcURA2wyBGT655K9gBH/OOkhvElknyYcdxTKWJiJVe1EkpCQvnYOFPoEhG
	fHuuiSuQBqlWyccSl3AJ5X5/X7Vlbqw709lKwKN8TvSvOBwVBM3jCmwnRdzo5+udnsXcwPaaZ14yI
	4zhs+Kzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpv6p-00020N-Nm; Thu, 17 Dec 2020 15:22:27 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpv6m-0001xz-Ve
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 15:22:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608218544; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pyf2tLIZ+/7kutI8YsczrpoByzU49mm9UT18IYwlNEs=;
 b=w2LJqpCuOtZbkzqaH3g9Qb9rulC7A8ZVwo3P8QumN/YKaSit1JN++3iOwz3Vr3sPEmCaMmes
 lRPRC+1307cAjntDmAi+g05+I/YE3Qf55Z1zg95uHXOzIyDdqgcilZSIm+Er5+5NSVn7XCLX
 /rcfLbwdhau2gFwDU5ValEeFIlE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fdb77a70564dfefcd3a2abe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 15:22:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F3D2BC433ED; Thu, 17 Dec 2020 15:22:14 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B4E3C433C6;
 Thu, 17 Dec 2020 15:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8B4E3C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH v2] ath11k: pci: disable ASPM L0sLs before downloading firmware
Date: Thu, 17 Dec 2020 17:22:10 +0200
Message-Id: <1608218530-15426-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_102225_194005_C4AE4205 
X-CRM114-Status: GOOD (  15.51  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Carl Huang <cjhuang@codeaurora.org>

Sometimes QCA6390 doesn't switch to amss state as device enters
L1ss state, so disable L0sL1s during firmware downloading.
Driver recovers the ASPM to default value in start callback
or powerdown callback.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---

v2:

* add debug messages for asmp state 

* add comment to power_down()

 drivers/net/wireless/ath/ath11k/pci.c | 36 +++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/pci.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 9f9a824a4c2d..20b415cd96c4 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -886,6 +886,32 @@ static void ath11k_pci_free_region(struct ath11k_pci *ab_pci)
 		pci_disable_device(pci_dev);
 }
 
+static void ath11k_pci_aspm_disable(struct ath11k_pci *ab_pci)
+{
+	struct ath11k_base *ab = ab_pci->ab;
+
+	pcie_capability_read_word(ab_pci->pdev, PCI_EXP_LNKCTL,
+				  &ab_pci->link_ctl);
+
+	ath11k_dbg(ab, ATH11K_DBG_PCI, "pci link_ctl 0x%04x L0s %d L1 %d\n",
+		   ab_pci->link_ctl,
+		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L0S),
+		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
+
+	/* disable L0s and L1 */
+	pcie_capability_write_word(ab_pci->pdev, PCI_EXP_LNKCTL,
+				   ab_pci->link_ctl & ~PCI_EXP_LNKCTL_ASPMC);
+
+	set_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags);
+}
+
+static void ath11k_pci_aspm_restore(struct ath11k_pci *ab_pci)
+{
+	if (test_and_clear_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags))
+		pcie_capability_write_word(ab_pci->pdev, PCI_EXP_LNKCTL,
+					   ab_pci->link_ctl);
+}
+
 static int ath11k_pci_power_up(struct ath11k_base *ab)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
@@ -895,6 +921,11 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
 	clear_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 	ath11k_pci_sw_reset(ab_pci->ab, true);
 
+	/* Disable ASPM during firmware download due to problems switching
+	 * to AMSS state.
+	 */
+	ath11k_pci_aspm_disable(ab_pci);
+
 	ret = ath11k_mhi_start(ab_pci);
 	if (ret) {
 		ath11k_err(ab, "failed to start mhi: %d\n", ret);
@@ -908,6 +939,9 @@ static void ath11k_pci_power_down(struct ath11k_base *ab)
 {
 	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
 
+	/* restore aspm in case firmware bootup fails */
+	ath11k_pci_aspm_restore(ab_pci);
+
 	ath11k_pci_force_wake(ab_pci->ab);
 	ath11k_mhi_stop(ab_pci);
 	clear_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
@@ -965,6 +999,8 @@ static int ath11k_pci_start(struct ath11k_base *ab)
 
 	set_bit(ATH11K_PCI_FLAG_INIT_DONE, &ab_pci->flags);
 
+	ath11k_pci_aspm_restore(ab_pci);
+
 	ath11k_pci_ce_irqs_enable(ab);
 	ath11k_ce_rx_post_buf(ab);
 
diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
index 0432a702416b..fe44d0dfce19 100644
--- a/drivers/net/wireless/ath/ath11k/pci.h
+++ b/drivers/net/wireless/ath/ath11k/pci.h
@@ -63,6 +63,7 @@ struct ath11k_msi_config {
 enum ath11k_pci_flags {
 	ATH11K_PCI_FLAG_INIT_DONE,
 	ATH11K_PCI_FLAG_IS_MSI_64,
+	ATH11K_PCI_ASPM_RESTORE,
 };
 
 struct ath11k_pci {
@@ -80,6 +81,7 @@ struct ath11k_pci {
 
 	/* enum ath11k_pci_flags */
 	unsigned long flags;
+	u16 link_ctl;
 };
 
 static inline struct ath11k_pci *ath11k_pci_priv(struct ath11k_base *ab)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
