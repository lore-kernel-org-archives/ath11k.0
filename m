Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA0CC54E58
	for <ath11k@archiver.kernel.org>; Thu, 21 Mar 2024 17:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nx/csSlPOluSCIW0mpv5oVPqUBgi5HWFro0Q1XSjqX8=; b=LPx0TVlaYSGVXlb/ybP6MM+ms8
	S+4YMHwCpm47k4Qol5q4E9a/x81XIZn2nKdb7iwt3ipk9OtH3kfZLSqNF+Tihu+0w2zYd3++HDMPy
	Gbqk1WOPqFhKDYoTXkgFH8WRpQjgSnesK1aTRVfn2kgCrkyan953gSDEEbiE/xFkFyzggyC9L3KOQ
	+Z+rKzFByEOV8T/1EkE0fW968WhaRXaPf06Ju5fGbJPwTLmkQE3+QV1Hqth5imJUo3dl3yfYy2d1+
	v5UHrNnEmNqVtJxc2Dqn+1XwlspnYWbz8lUQGdpRUXK6eMpoHUA0qXxHc7nzI4y1dDbfq+F1oXClH
	SkEjQVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnM9M-000000044Fw-3bR3;
	Thu, 21 Mar 2024 17:24:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnM9J-000000044FD-336K
	for ath11k@lists.infradead.org;
	Thu, 21 Mar 2024 17:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711041854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nx/csSlPOluSCIW0mpv5oVPqUBgi5HWFro0Q1XSjqX8=;
	b=hyx78quDSSaMfPqqggWq0VWUMvlmXvGV7ULXRm+9Y1gO6HgDG+O1byH5hOy9y8jpNxA71S
	2p3TbGQZUBIVXObNeK+6nkbQ64tLWumoiMqlKa3DVmrxiqv6oe8HXViIhQ6pvdkp3HXT8f
	rS/wB7UzmTVUvMWmIGFzV7fDl/c7SL8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-BIZles-tO0q0bkr2sYcD1w-1; Thu,
 21 Mar 2024 13:24:11 -0400
X-MC-Unique: BIZles-tO0q0bkr2sYcD1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAB8638009FB;
	Thu, 21 Mar 2024 17:24:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.172])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 373F18173;
	Thu, 21 Mar 2024 17:24:09 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: quic_bqiang@quicinc.com,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] wifi: ath11k: workaround to use VMs
Date: Thu, 21 Mar 2024 18:23:53 +0100
Message-ID: <20240321172402.346191-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_102417_857206_BF2B87B9 
X-CRM114-Status: GOOD (  18.87  )
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

Currently, this driver is not working when the device is handled in a
Virtual Machine (PCI pass-through), as it was already reported here:
https://lore.kernel.org/all/fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com/T/
Baochen Qiang focused the problem and described how to have it working
for a specific real MSI vector from host that needs to be used in VM too.
And this value, as it was commented, can change.

The problem seems complex to me and I don't know if there is any easy way
to solve it. Meanwhile and using the information from Baochen Qiang,
since the use of VMs is very interesting for testing procedures,
I would like to just add this workaround that consists on adding a
parameter to pass the real MSI vector from host to the VM. In that way,
checking the 'lscpi' command output from host, it could be handled manually
or with some user tool in order to have the VM with the driver working.
Of course, if this parameter is not configured (zero value and default),
we will have the same behavior as always.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index be9d2c69cc41..0e322956b10f 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -31,6 +31,11 @@
 
 #define TCSR_SOC_HW_SUB_VER	0x1910010
 
+static ulong ath11k_host_msi_addr = 0;
+module_param_named(host_msi_addr, ath11k_host_msi_addr, ulong, 0644);
+MODULE_PARM_DESC(host_msi_addr,
+		 "Workaround to configure the MSI address that is used from host in order to be used in VM");
+
 static const struct pci_device_id ath11k_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCA6390_DEVICE_ID) },
 	{ PCI_VDEVICE(QCOM, WCN6855_DEVICE_ID) },
@@ -443,6 +448,18 @@ static int ath11k_pci_alloc_msi(struct ath11k_pci *ab_pci)
 
 	ath11k_pci_msi_disable(ab_pci);
 
+	if (ath11k_host_msi_addr) {
+		ab_pci->ab->pci.msi.ep_base_data = 0;
+		ab->pci.msi.addr_hi = (u32)(ath11k_host_msi_addr >> 32);
+		ab->pci.msi.addr_lo = (u32)(ath11k_host_msi_addr & 0xffffffff);
+
+		ath11k_dbg(ab, ATH11K_DBG_PCI, "msi addr hi 0x%x lo 0x%x base data is %d\n",
+			   ab->pci.msi.addr_hi,
+			   ab->pci.msi.addr_lo,
+			   ab->pci.msi.ep_base_data);
+		return 0;
+	}
+
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
 	if (!msi_desc) {
 		ath11k_err(ab, "msi_desc is NULL!\n");
@@ -482,6 +499,9 @@ static int ath11k_pci_config_msi_data(struct ath11k_pci *ab_pci)
 {
 	struct msi_desc *msi_desc;
 
+	if (ath11k_host_msi_addr)
+		return 0;
+
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
 	if (!msi_desc) {
 		ath11k_err(ab_pci->ab, "msi_desc is NULL!\n");
-- 
2.44.0


