Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CB7CA5FC7
	for <ath11k@archiver.kernel.org>; Wed, 30 Sep 2026 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BxRhMSUFbC0ZUhx2ycCj3+AeDAxyb/zT+LTlcEooUE=; b=yhEi/j4rcgA8VJJXj34iLGDBhn
	ucKL6sXJeArt1TygTc1tvmYYTMRCqPQ3wSr8sBeeJUVqDtMtx8TKlpp5cu5cNRC7AwVuNVOb9EXhK
	qSn7tBvw7xUD0bY2Uh/ClqRxG9mw0JXosMUjCChnZvQgMq0PmefutJ+amZSEPViS7H2z+l6S6PHzJ
	9oMbYGUz+3NbjQOnH6YCNrRQEi4eh+PJL/26zpXmUSu+NgQr4z7zhuI/PpXuzcVUcSCTOllW6WdkH
	3KKA6I/7qWk+HcDmpoybJNxsfbRP4X6frEKZTvmlqA+cimk7X5mOux0MiR1b119URyxSyATuVvubO
	y8mwAnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1i-00000006FGG-04u2;
	Wed, 30 Sep 2026 14:11:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1Y-00000006FBH-2bbX
	for ath11k@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9BxRhMSUFbC0ZUhx2ycCj3+AeDAxyb/zT+LTlcEooUE=; b=J9kxvdmMcKORmrceqPEflRPvE+
	0cdSLSdFMdDVVLUhOTP+67YfN8nQpLGB+/EvOiYQULKJITWbC7Jrhw+NKTX8uYZdCcx9+BA64tjYL
	l0OfgCuLzFStcg4oyd1blGxZBBBibtPQ1tu+mZqIcTi1EEYGZRUcvjtAGc6i4ei3OLTJV8sJLf5Ti
	uqoov5DxdAXqSCFEq3l/D+CBSrYFz5agTunoSd+ZnIi5MTBo2alvv8IXzIIxGvVZ3369z6JOLloYo
	wFsq7hcGnnNCjhnV6IgO8kBCiJ82xBCSeKmechlRO6gKaHEtylZhbwKAWSI2tS8sxTEpl2b9jv8rm
	dA2cYa+A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv1V-00000003tdJ-3CGc
	for ath11k@lists.infradead.org;
	Wed, 30 Sep 2026 14:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9BxRhMSUFbC0ZUhx2ycCj3+AeDAxyb/zT+LTlcEooUE=;
	b=huqAamnh84to4LTe01mpdU6QRT7/0eVxtCsgkelNq8QlFzKBJJN0OZfl0iG7d3CD/Hc1yV
	Ah23gswn5Zd7pLiHJhGofiKPnTyeby4XyhquTUzZuLuR9QvvNJ07/N4+Rv7UOi62RULHsR
	JUMb26gazOnrmriccUqc+R7olEtejw0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9BxRhMSUFbC0ZUhx2ycCj3+AeDAxyb/zT+LTlcEooUE=;
	b=huqAamnh84to4LTe01mpdU6QRT7/0eVxtCsgkelNq8QlFzKBJJN0OZfl0iG7d3CD/Hc1yV
	Ah23gswn5Zd7pLiHJhGofiKPnTyeby4XyhquTUzZuLuR9QvvNJ07/N4+Rv7UOi62RULHsR
	JUMb26gazOnrmriccUqc+R7olEtejw0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9BxRhMSUFbC0ZUhx2ycCj3+AeDAxyb/zT+LTlcEooUE=;
	b=huqAamnh84to4LTe01mpdU6QRT7/0eVxtCsgkelNq8QlFzKBJJN0OZfl0iG7d3CD/Hc1yV
	Ah23gswn5Zd7pLiHJhGofiKPnTyeby4XyhquTUzZuLuR9QvvNJ07/N4+Rv7UOi62RULHsR
	JUMb26gazOnrmriccUqc+R7olEtejw0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317--DlMhR4oP8mqRPeBD6UlLg-1; Wed,
 30 Sep 2026 10:09:18 -0400
X-MC-Unique: -DlMhR4oP8mqRPeBD6UlLg-1
X-Mimecast-MFC-AGG-ID: -DlMhR4oP8mqRPeBD6UlLg_1790777356
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00CBD1977531;
	Wed, 30 Sep 2026 14:09:16 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8D5871956044;
	Wed, 30 Sep 2026 14:09:11 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: bhelgaas@google.com,
	alex@shazbot.org,
	jjohnson@kernel.org
Cc: johannes@sipsolutions.net,
	mani@kernel.org,
	jgg@ziepe.ca,
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
Subject: [PATCH 2/7] vfio: Add qcom_vfio.h header for MSI cache protocol
Date: Wed, 30 Sep 2026 16:08:28 +0200
Message-ID: <20260930140833.576941-3-jtornosm@redhat.com>
In-Reply-To: <20260930140833.576941-1-jtornosm@redhat.com>
References: <20260930140833.576941-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: CMwmszWph3vx_Wkg-6gHRc27TpUqSfwLFFIMBTZyR2A_1790777356
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151105_939366_8B98875D 
X-CRM114-Status: GOOD (  18.63  )
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

Add shared header defining the communication protocol between
qcom-vfio-pci variant driver and Qualcomm device drivers (ath11k,
ath12k) for passing physical host MSI addresses to VMs.

Qualcomm device firmware requires physical host MSI addresses rather
than guest IOVA addresses. The qcom-vfio-pci driver caches host MSI
values in extended PCI config space with a magic signature "QMSI" for
VM discovery.

Protocol:
 1. Host: qcom-vfio-pci finds free space in extended config (0x100-0xFFF)
 2. Host: Writes magic signature "QMSI" (0x49534D51) followed by MSI data
 3. VM: Device driver searches for "QMSI" signature to locate cached MSI
 4. VM: Reads MSI values and programs device firmware

This avoids offset mismatch when QEMU filters certain capabilities,
causing host and VM to see different extended capability chains.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 include/linux/qcom_vfio.h | 88 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 include/linux/qcom_vfio.h

diff --git a/include/linux/qcom_vfio.h b/include/linux/qcom_vfio.h
new file mode 100644
index 000000000000..c59c81936e84
--- /dev/null
+++ b/include/linux/qcom_vfio.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-FileCopyrightText: Copyright Red Hat */
+
+#ifndef _QCOM_VFIO_H_
+#define _QCOM_VFIO_H_
+
+#include <linux/pci.h>
+
+/*
+ * MSI Address Passthrough Quirk
+ *
+ * Qualcomm device firmware requires physical host MSI addresses rather than
+ * guest IOVA addresses. The qcom-vfio-pci variant driver caches host MSI
+ * values in extended PCI config space with a magic signature for VM
+ * discovery.
+ *
+ * Protocol:
+ *  1. Host: qcom-vfio-pci finds free space in extended config (0x100-0xFFF)
+ *  2. Host: Writes magic signature "QMSI" (0x49534D51) followed by MSI data
+ *  3. VM: Device driver searches for "QMSI" signature to locate cached MSI
+ *  4. VM: Reads MSI values and programs device firmware
+ *
+ * This avoids offset mismatch when QEMU filters certain capabilities, causing
+ * host and VM to see different extended capability chains.
+ *
+ * Layout in extended config space:
+ *   +0x00: Magic signature "QMSI" (0x49534D51)
+ *   +0x04: MSI address low 32 bits
+ *   +0x08: MSI address high 32 bits
+ *   +0x0C: MSI data (16 bits)
+ *
+ * Applicable to:
+ *  - ath11k WiFi (PCI ID 0x17cb:0x1103)
+ *  - ath12k WiFi (PCI ID 0x17cb:0x1107)
+ */
+
+/* Magic signature "QMSI" to identify cached MSI data */
+#define QCOM_VFIO_MSI_MAGIC		0x49534D51
+
+/* Space needed for magic + MSI passthrough data */
+#define QCOM_VFIO_MSI_SPACE_SIZE	16
+
+/* Relative offsets from base discovered by qcom_vfio_find_msi_offset() */
+#define QCOM_VFIO_MSI_MAGIC_OFFSET	0x00	/* Magic signature "QMSI" */
+#define QCOM_VFIO_MSI_ADDR_LO_OFFSET	0x04	/* Host MSI address low 32 bits */
+#define QCOM_VFIO_MSI_ADDR_HI_OFFSET	0x08	/* Host MSI address high 32 bits */
+#define QCOM_VFIO_MSI_DATA_OFFSET	0x0C	/* Host MSI data (16 bits) */
+
+/**
+ * qcom_vfio_find_msi_offset - Find free space for host to cache MSI
+ * @pdev: PCI device
+ *
+ * Host-side function: Finds free space in extended config to write MSI cache.
+ * Uses PCI core utility to scan capability chain.
+ *
+ * Returns: Offset in extended config space (>= 0x100), or 0 if no space found
+ */
+static inline int qcom_vfio_find_msi_offset(struct pci_dev *pdev)
+{
+	return pci_find_free_ext_cap_offset(pdev, QCOM_VFIO_MSI_SPACE_SIZE);
+}
+
+/**
+ * qcom_vfio_find_msi_cache - Locate cached MSI data by magic signature
+ * @pdev: PCI device
+ *
+ * VM-side function: Searches extended config space for "QMSI" magic signature
+ * to locate host-cached MSI values. This avoids offset mismatch when QEMU
+ * filters certain capabilities.
+ *
+ * Returns: Offset of MSI data (after magic), or 0 if not found
+ */
+static inline int qcom_vfio_find_msi_cache(struct pci_dev *pdev)
+{
+	u32 magic;
+	int offset;
+
+	for (offset = 0x100; offset <= 0xf00; offset += 4) {
+		if (pci_read_config_dword(pdev, offset, &magic))
+			continue;
+		if (magic == QCOM_VFIO_MSI_MAGIC)
+			return offset;
+	}
+
+	return 0;
+}
+
+#endif /* _QCOM_VFIO_H_ */
-- 
2.53.0


