Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9734CA9ECF
	for <ath11k@archiver.kernel.org>; Sun, 11 Oct 2026 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eskwLgMwD2YS4xUD+rb73EOM3qCajRipGLWj2T/h90=; b=rZEIW3zSpndfa3ZBBUTaO6CrQ8
	pPEKACHBgiLQDfV+zrIyf/9RDWUIdVuNnzIF2uvRnL1GRDzWbnsxpLphKUxAf8m9M6DsIsOeL9kmH
	cmRkJqPso5CFwblSdqBIO7V7/0nwQqb64lmziG+K5e7mXq0+v/PNbJgdxXOPIdgAX9ibAlfeVRdYb
	zye2zPCLbZI5g3myLAUXdrRUEJmkxxYqAmlU2pqDWpF37GPBaTjOZO0zb8hV/1I3fGJO52MlwOSKY
	IVt9LobIGg0cuxhl+XvqndnDKIN0611Z0SHFRteWsNByABDkZLLrWBQhl2wdBMOSuUfCeCh8dS+Q+
	6humw9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoG2-00000008ojc-0h3N;
	Sun, 11 Oct 2026 07:46:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFoFx-00000008oeO-0sox
	for ath11k@lists.infradead.org;
	Sun, 11 Oct 2026 07:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791704764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eskwLgMwD2YS4xUD+rb73EOM3qCajRipGLWj2T/h90=;
	b=PedfmAnIW7jTeeZh+/jglEnSoq5w9lgglsUJ+RWgHro/49JMgSb+PGdZYih9HjhfAEO7ZN
	zp7YTn6XG7vEYQSNoFKkOGbiNuYmlQiWaa15X5P6cOlGojHlWzNe1hLKZI/7/6qSgoGKIe
	RDQY7/MM/IO+AXdSvjAQhL2zXWZE8x4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-3MzqQL0NMde1fKR9P7nNOg-1; Sun,
 11 Oct 2026 07:45:59 +0000
X-MC-Unique: 3MzqQL0NMde1fKR9P7nNOg-1
X-Mimecast-MFC-AGG-ID: 3MzqQL0NMde1fKR9P7nNOg_1791704757
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 632851954ACF;
	Sun, 11 Oct 2026 07:45:57 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A906D1956041;
	Sun, 11 Oct 2026 07:45:53 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca,
	alex@shazbot.org,
	bhelgaas@google.com,
	jjohnson@kernel.org
Cc: johannes@sipsolutions.net,
	mani@kernel.org,
	yishaih@nvidia.com,
	skolothumtho@nvidia.com,
	kevin.tian@intel.com,
	linux-pci@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v2 4/7] ath11k: add PCIe link recovery retry
Date: Sun, 11 Oct 2026 09:45:11 +0200
Message-ID: <20261011074514.515894-5-jtornosm@redhat.com>
In-Reply-To: <20261011074514.515894-1-jtornosm@redhat.com>
References: <20261011074514.515894-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: p2k4pzbvAwhI17VXeDIBjgnw9JAhP2U1Cu87NdvIthA_1791704757
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_004605_578254_894D827C 
X-CRM114-Status: GOOD (  14.33  )
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

When ath11k devices are passed through to VMs via PCIe passthrough,
the PCIe link may not stabilize immediately after global reset due to
virtualization layer timing variations. This causes MHI initialization
to fail with "BHI offset: 0xffffffff is out of range" errors because
the device is read before it's ready.

Currently, ath11k_pci_soc_global_reset() just warns if the link is
down but continues anyway, leading to inevitable MHI failures.

This patch adds:
1. A retry loop (up to 5000ms) to wait for the PCIe link to recover
   after global reset (similar to the existing ath12k LTSSM retry logic)
2. Proper error propagation to prevent continuing with a dead link

This is especially important for VM environments where timing can vary
significantly from bare metal.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v2: Address Sashiko comments:
    - Replace jiffies-based timeout with iteration counter to work
      correctly in atomic/panic contexts where jiffies does not advance
      (consistency with ath12k patch 6/7)
v1: https://lore.kernel.org/all/20260930140833.576941-5-jtornosm@redhat.com/

 drivers/net/wireless/ath/ath11k/pci.c | 38 ++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index 7114eca8810d..4fc6aaf036c1 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -190,8 +190,10 @@ static void ath11k_pci_restore_window(struct ath11k_base *ab)
 	spin_unlock_bh(&ab_pci->window_lock);
 }
 
-static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
+static int ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 {
+	bool link_recovered = false;
+	int retries = 250;
 	u32 val, delay;
 
 	val = ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
@@ -211,14 +213,28 @@ static void ath11k_pci_soc_global_reset(struct ath11k_base *ab)
 
 	mdelay(delay);
 
-	val = ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
-	if (val == 0xffffffff)
-		ath11k_warn(ab, "link down error during global reset\n");
+	/* Wait for PCIe link to recover, especially important in VM environments
+	 * where timing can vary significantly from bare metal.
+	 */
+	while (retries-- > 0) {
+		val = ath11k_pcic_read32(ab, PCIE_SOC_GLOBAL_RESET);
+		if (val != 0xffffffff) {
+			link_recovered = true;
+			break;
+		}
+		mdelay(20);
+	}
+	if (!link_recovered) {
+		ath11k_err(ab, "PCIe link failed to recover - device may need power cycle\n");
+		return -ETIMEDOUT;
+	}
 
 	/* Restore window register as its content is cleared during
 	 * hardware global reset, such that it aligns with host cache.
 	 */
 	ath11k_pci_restore_window(ab);
+
+	return 0;
 }
 
 static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
@@ -373,8 +389,10 @@ static void ath11k_pci_force_wake(struct ath11k_base *ab)
 	mdelay(5);
 }
 
-static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
+static int ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 {
+	int ret;
+
 	mdelay(100);
 
 	if (power_on) {
@@ -387,8 +405,12 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
 
 	ath11k_mhi_clear_vector(ab);
 	ath11k_pci_clear_dbg_registers(ab);
-	ath11k_pci_soc_global_reset(ab);
+	ret = ath11k_pci_soc_global_reset(ab);
+	if (ret)
+		return ret;
 	ath11k_mhi_set_mhictrl_reset(ab);
+
+	return 0;
 }
 
 static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
@@ -818,7 +840,9 @@ static int ath11k_pci_power_up(struct ath11k_base *ab)
 
 	ab_pci->register_window = 0;
 	clear_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags);
-	ath11k_pci_sw_reset(ab_pci->ab, true);
+	ret = ath11k_pci_sw_reset(ab_pci->ab, true);
+	if (ret)
+		return ret;
 
 	/* Disable ASPM during firmware download due to problems switching
 	 * to AMSS state.
-- 
2.53.0


