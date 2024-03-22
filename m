Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64578C54E71
	for <ath11k@archiver.kernel.org>; Fri, 22 Mar 2024 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QdoXDPkirjhYNpXA2MhOMT7OeLESzKe1cciF8iSzK0=; b=TTNWK3n08/PRuNAjaM4wQhN8R/
	6DRCeBC7hB9PSBNKOn3FETMu60UsoQ5xO5lnanZmVgc5IJxEQgUVwpoJ7hDhwI05BA6Upc+Jy1c81
	nVNi+uxob0lbwuSK5LS4tcmIP7qu/uH3kqcgyFgjWOIeapTXJqbq5cYzrZc5zdLSwx/VAcLWuRETX
	yxEtooix93rvUZi665w0oTkEpEY8gIING66tNGsW+EJFnQ+8xiOpfTcUmSNKcc3xN0hARRy0EEvAz
	TMQ5X3OlKzwchPjQ2Br1GcVsE5wwJs83yRLfiovsQjU2nEolj3lZo2x/r9+UDgIlNYO8fdE2kuviw
	bZJaWcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rncSw-00000006rH2-3TFi;
	Fri, 22 Mar 2024 10:49:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rncSu-00000006rGP-0DJa
	for ath11k@lists.infradead.org;
	Fri, 22 Mar 2024 10:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711104574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7QdoXDPkirjhYNpXA2MhOMT7OeLESzKe1cciF8iSzK0=;
	b=IjVO6f7BByhemNANc3aB3cjYoO8BJFZvyDMD5uuxL/WD9YGdc52tBwkgWCl6OmnAh85XkM
	HlrHVJvP7L2jAy28cmOzHIYWcicQA+WBfhycEKkvpHufBGLIM4y/L9ugI9WtSV1KDWI6iJ
	+t27ip2xsCKIIAlwimEHJfB87havR/A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-CRPaDkl7NPSo9yKN7u25hg-1; Fri, 22 Mar 2024 06:49:31 -0400
X-MC-Unique: CRPaDkl7NPSo9yKN7u25hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC43385A58B;
	Fri, 22 Mar 2024 10:49:30 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB34B2022C1D;
	Fri, 22 Mar 2024 10:49:28 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: quic_bqiang@quicinc.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH V2] wifi: ath11k: workaround to use VMs
Date: Fri, 22 Mar 2024 11:49:12 +0100
Message-ID: <20240322104912.94811-1-jtornosm@redhat.com>
In-Reply-To: <87f0c6c9-43e5-4ea3-8f4c-9425e6a74b10@quicinc.com>
References: <87f0c6c9-43e5-4ea3-8f4c-9425e6a74b10@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_034936_200302_7A584827 
X-CRM114-Status: GOOD (  20.65  )
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
to solve it (with no more information, not hardware/firmware related help
or VMM action).
Meanwhile and using the information from Baochen Qiang, since the use of
VMs is very interesting for testing procedures, I would like to include
this workaround that consists on adding two parameters to pass the real MSI
vector address and data from host to the VM.
In that way, checking the 'lscpi' command output from host, it could be
handled manually or with some user tool in order to have the VM with the
driver working.
Of course, if the workaround is not used, that is if MSI vector address
parameter is not configured (zero value and default), we will have the same
behavior as always.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
V1 -> V2:
- Add parameter for msi vector data as Baochen Qiang suggests.

 drivers/net/wireless/ath/ath11k/pci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index be9d2c69cc41..4c84208dcf5d 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -31,6 +31,15 @@
 
 #define TCSR_SOC_HW_SUB_VER	0x1910010
 
+static ulong ath11k_host_msi_vector_addr = 0;
+module_param_named(host_msi_vector_addr, ath11k_host_msi_vector_addr, ulong, 0644);
+MODULE_PARM_DESC(host_msi_vector_addr,
+		 "Workaround to configure the MSI vector address that is used from host in order to be used in VM");
+static uint ath11k_host_msi_vector_data = 0;
+module_param_named(host_msi_vector_data, ath11k_host_msi_vector_data, uint, 0644);
+MODULE_PARM_DESC(host_msi_vector_data,
+		 "Workaround to configure the MSI vector data that is used from host in order to be used in VM");
+
 static const struct pci_device_id ath11k_pci_id_table[] = {
 	{ PCI_VDEVICE(QCOM, QCA6390_DEVICE_ID) },
 	{ PCI_VDEVICE(QCOM, WCN6855_DEVICE_ID) },
@@ -443,6 +452,18 @@ static int ath11k_pci_alloc_msi(struct ath11k_pci *ab_pci)
 
 	ath11k_pci_msi_disable(ab_pci);
 
+	if (ath11k_host_msi_vector_addr) {
+		ab_pci->ab->pci.msi.ep_base_data = ath11k_host_msi_vector_data;
+		ab->pci.msi.addr_hi = (u32)(ath11k_host_msi_vector_addr >> 32);
+		ab->pci.msi.addr_lo = (u32)(ath11k_host_msi_vector_addr & 0xffffffff);
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
@@ -482,6 +503,9 @@ static int ath11k_pci_config_msi_data(struct ath11k_pci *ab_pci)
 {
 	struct msi_desc *msi_desc;
 
+	if (ath11k_host_msi_vector_addr)
+		return 0;
+
 	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
 	if (!msi_desc) {
 		ath11k_err(ab_pci->ab, "msi_desc is NULL!\n");
-- 
2.44.0


