Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E609CA5FC7
	for <ath11k@archiver.kernel.org>; Wed, 30 Sep 2026 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3xqmKVAFV4WbQWRk7ZQhQ7LMEFnygykagJl6VwnyQI=; b=V151r/zfVjb9RdgkzoSoYhrOqr
	sIdF9xmVbgVM2aR6hkIJDcmlvRMRScwK8Mz8ZjX2thMLWlRG/JPsvAdmm83Yg6pH90kmkt2ZM4hPA
	TQJQrvlzRIBLus3B7ltZt6WQMaCqSBOvkcfBkAA6UgtSZWzzYc0gxbkAP5rU63MiK2JLof+MUmSVs
	eEbFvOk6mJ0xmNB0mbvDZxsxYrxVHCGXhwEOQRZHJmdYm/v/Uod1wHP4JY8cldT4YVA4STmMY1y23
	MvxsW4xAFmP2ZBvCTxoXUYfo60MvJtxdPIHv+X3gdsVkBqdL9prpibu55IdX+kOeAdLYLac3vCRg7
	JNwBpjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1a-00000006FD2-43EW;
	Wed, 30 Sep 2026 14:11:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv1X-00000006FAX-1A53
	for ath11k@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p3xqmKVAFV4WbQWRk7ZQhQ7LMEFnygykagJl6VwnyQI=; b=Gyr/+c9XlLwWLFVK6kdvmyYlP8
	zTJRq+SJHaOR/ePoIEFqj9hgW9wsrZ+7hdSyl/LhHzggY0qelliyuVBq0Ier+ej9WG/y7k1HyY1UF
	nyulzPFwsmPa6jisPVtlUwGupMwP9eAzVGqDeNdeN/4KivJs9/8/BQTdiuy82iLNTMjNBzhmDW8+8
	HghH2oc2yWC2mEw/gOMqyk62QReVrazSDQPucC0oVk4kgvF1KomB3Oz4Fd8+SljkVzEc6Ils38nOD
	+CVEZi5z0HPWfCuZk/ZXs/xkUTdBCIsQD4vjFQTYDYzkYi1LQaRbogHWDSoiGepE7szfF2wQzyoJZ
	sQShc2Zg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv1U-00000003tdK-2V3K
	for ath11k@lists.infradead.org;
	Wed, 30 Sep 2026 14:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3xqmKVAFV4WbQWRk7ZQhQ7LMEFnygykagJl6VwnyQI=;
	b=Q745uX8cnJQHSRJBYocuhRl9Yu+/RM20sA5avxWc5gVOEpyM23ULNTZ+dvFzK1uPlZJrfB
	dbutVDOj06KfbbQNLk387z/hC/EKYdrTb81NwxItISGS2dbsbpiWQ+zFND9APIbyt+0VDd
	mKpVBVmok/uaWsLpInUXQUUq2J9Iucw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3xqmKVAFV4WbQWRk7ZQhQ7LMEFnygykagJl6VwnyQI=;
	b=Q745uX8cnJQHSRJBYocuhRl9Yu+/RM20sA5avxWc5gVOEpyM23ULNTZ+dvFzK1uPlZJrfB
	dbutVDOj06KfbbQNLk387z/hC/EKYdrTb81NwxItISGS2dbsbpiWQ+zFND9APIbyt+0VDd
	mKpVBVmok/uaWsLpInUXQUUq2J9Iucw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790777461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3xqmKVAFV4WbQWRk7ZQhQ7LMEFnygykagJl6VwnyQI=;
	b=Q745uX8cnJQHSRJBYocuhRl9Yu+/RM20sA5avxWc5gVOEpyM23ULNTZ+dvFzK1uPlZJrfB
	dbutVDOj06KfbbQNLk387z/hC/EKYdrTb81NwxItISGS2dbsbpiWQ+zFND9APIbyt+0VDd
	mKpVBVmok/uaWsLpInUXQUUq2J9Iucw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-307-SOCXgrpmO5qWs48VnazhLw-1; Wed,
 30 Sep 2026 10:09:09 -0400
X-MC-Unique: SOCXgrpmO5qWs48VnazhLw-1
X-Mimecast-MFC-AGG-ID: SOCXgrpmO5qWs48VnazhLw_1790777347
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 098451954B1D;
	Wed, 30 Sep 2026 14:09:07 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 717C31956044;
	Wed, 30 Sep 2026 14:09:02 +0000 (UTC)
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
Subject: [PATCH 1/7] PCI: Add pci_find_free_ext_cap_offset() helper
Date: Wed, 30 Sep 2026 16:08:27 +0200
Message-ID: <20260930140833.576941-2-jtornosm@redhat.com>
In-Reply-To: <20260930140833.576941-1-jtornosm@redhat.com>
References: <20260930140833.576941-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: TEjYnhjHwdClX7W-2PYuFKMkGLMah6uDvBDRDldN-kU_1790777347
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151104_794335_6912AA47 
X-CRM114-Status: GOOD (  18.86  )
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

Add helper function to find free space in PCI extended configuration
space. This is needed by VFIO variant drivers that need to use unused
extended config space for device-specific purposes, such as passing
metadata to VMs.

The function scans the extended capability chain and returns an offset
to a gap of at least the requested size. This allows drivers to safely
use extended config space without conflicting with existing capabilities.

Use case: The qcom-vfio-pci variant driver uses this to find space for
caching host MSI addresses that need to be passed to Qualcomm device
firmware in VMs.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/pci/pci.c   | 54 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h |  3 +++
 2 files changed, 57 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8f7cfcc00090..7fa261140457 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -552,6 +552,60 @@ u16 pci_find_ext_capability(struct pci_dev *dev, int cap)
 }
 EXPORT_SYMBOL_GPL(pci_find_ext_capability);
 
+/**
+ * pci_find_free_ext_cap_offset - Find free space in extended config
+ * @dev: PCI device to query
+ * @size: Minimum size needed (in bytes)
+ *
+ * Scans the extended capability chain to find a gap of at least @size bytes
+ * in the extended configuration space (0x100-0xFFF). This can be used by
+ * drivers that need to use unused extended config space for device-specific
+ * purposes (e.g., VFIO quirks for VM passthrough).
+ *
+ * Returns the offset to free space, or 0 if no suitable gap found.
+ */
+int pci_find_free_ext_cap_offset(struct pci_dev *dev, size_t size)
+{
+	int pos = PCI_CFG_SPACE_SIZE;
+	int last_cap_start = 0;
+	int free_offset;
+	u32 header;
+	int next;
+
+	if (!pci_is_pcie(dev))
+		return 0;
+
+	while (pos >= PCI_CFG_SPACE_SIZE) {
+		if (pci_read_config_dword(dev, pos, &header))
+			break;
+
+		if (header == 0 || header == 0xffffffff)
+			break;
+
+		last_cap_start = pos;
+		next = PCI_EXT_CAP_NEXT(header);
+		if (!next)
+			break;
+		pos = next;
+	}
+
+	/*
+	 * Use space after the last capability. We align to the next capability
+	 * boundary (typically 4-byte aligned). Start at a safe offset past the
+	 * last capability - capabilities vary in size, so use a conservative
+	 * offset. Most extended capabilities are <= 64 bytes.
+	 */
+	if (last_cap_start) {
+		free_offset = last_cap_start + 64;
+		free_offset = ALIGN(free_offset, 4);
+		if (PCI_CFG_SPACE_EXP_SIZE - free_offset >= size)
+			return free_offset;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_find_free_ext_cap_offset);
+
 /**
  * pci_get_dsn - Read and return the 8-byte Device Serial Number
  * @dev: PCI device to query
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..5d1ccbb2ed29 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1287,6 +1287,7 @@ u8 pci_find_ht_capability(struct pci_dev *dev, int ht_cap);
 u8 pci_find_next_ht_capability(struct pci_dev *dev, u8 pos, int ht_cap);
 u16 pci_find_ext_capability(struct pci_dev *dev, int cap);
 u16 pci_find_next_ext_capability(struct pci_dev *dev, u16 pos, int cap);
+int pci_find_free_ext_cap_offset(struct pci_dev *dev, size_t size);
 struct pci_bus *pci_find_next_bus(const struct pci_bus *from);
 u16 pci_find_vsec_capability(struct pci_dev *dev, u16 vendor, int cap);
 u16 pci_find_dvsec_capability(struct pci_dev *dev, u16 vendor, u16 dvsec);
@@ -2160,6 +2161,8 @@ static inline u8 pci_find_next_capability(struct pci_dev *dev, u8 post, int cap)
 { return 0; }
 static inline u16 pci_find_ext_capability(struct pci_dev *dev, int cap)
 { return 0; }
+static inline int pci_find_free_ext_cap_offset(struct pci_dev *dev, size_t size)
+{ return 0; }
 
 static inline u64 pci_get_dsn(struct pci_dev *dev)
 { return 0; }
-- 
2.53.0


