Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7B3C52D7C
	for <ath11k@archiver.kernel.org>; Mon, 12 Aug 2024 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71IkH4m84vmxtomePZ8JturrXjrRqWvm/AOWe4rNFpA=; b=caHnnbXkXKrDgY0eEw9SrIa6UK
	+sAPVgXfPqecPc7F4NMNKmDB2TXjPPQB82cyu3T4VicJtPB8R+aSD9dKXY+Wi4bRMw0jzhUhAMjV0
	TW1+ahd7MYwZOmpUyeUp/OGQTOQvFaMGzIY2+n9Q3kOAVu3ajkw4FM130+71DabvSmr80T4m9Uwyp
	xtv2AsRVm1PJRluboKWEp8l4UqFv0HsjRjrc5yx9ZZGNubizHoGK/OHpvSi4AquNA6Vfaf6jpRhzo
	w3gUGeHpr4lNepRFlr4Bx+glQf3K5VM3VmAVCczrm/nYkqB3NJ3Q4r+Dsur6+RmWq4C48+YnzYXwg
	1tfVd38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdYPY-00000000yEc-0wa4;
	Mon, 12 Aug 2024 17:00:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdYPU-00000000yDa-2rrf
	for ath11k@lists.infradead.org;
	Mon, 12 Aug 2024 17:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723482041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71IkH4m84vmxtomePZ8JturrXjrRqWvm/AOWe4rNFpA=;
	b=IQfsaRxjsji/DHQjwSk0s3MUgCbEXO/BEyw0hQnBcox1zVT28h2Ap66Zio/0LtmUkZOVi/
	+qL2MNijnusebVcZBQtT0W63C9woSA+78KIMhl0yln2xFKEJWuFgpSB0pG2cPwEi+NAkQt
	/wKgNGvHESVEa05yW+yUiC/VS0sUDh4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-ZMo_5AAdPfet8y4Ek6JJYw-1; Mon,
 12 Aug 2024 13:00:37 -0400
X-MC-Unique: ZMo_5AAdPfet8y4Ek6JJYw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8018B1954225;
	Mon, 12 Aug 2024 17:00:34 +0000 (UTC)
Received: from omen.home.shazbot.org (unknown [10.22.16.191])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 01C8719373D7;
	Mon, 12 Aug 2024 17:00:29 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: kvm@vger.kernel.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
	quic_bqiang@quicinc.com,
	kvalo@kernel.org,
	prestwoj@gmail.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	kernel@quicinc.com,
	johannes@sipsolutions.net,
	jtornosm@redhat.com
Subject: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI virtualization
Date: Mon, 12 Aug 2024 10:59:12 -0600
Message-ID: <20240812170014.1583783-1-alex.williamson@redhat.com>
In-Reply-To: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_100044_821459_4F522553 
X-CRM114-Status: GOOD (  18.61  )
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

vfio-pci has always virtualized the MSI address and data registers as
MSI programming is performed through the SET_IRQS ioctl.  Often this
virtualization is not used, and in specific cases can be unhelpful.

One such case where the virtualization is a hinderance is when the
device contains an onboard interrupt controller programmed by the guest
driver.  Userspace VMMs have a chance to quirk this programming,
injecting the host physical MSI information, but only if the userspace
driver can get access to the host physical address and data registers.

This introduces a device feature which allows the userspace driver to
disable virtualization of the MSI capability address and data registers
in order to provide read-only access the the physical values.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216055
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 drivers/vfio/pci/vfio_pci_config.c | 26 ++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_core.c   | 21 +++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  1 +
 include/uapi/linux/vfio.h          | 14 ++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 97422aafaa7b..5f86e75ea6ca 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -1259,6 +1259,32 @@ static int vfio_msi_cap_len(struct vfio_pci_core_device *vdev, u8 pos)
 	return len;
 }
 
+/* Disable virtualization of the MSI address and data fields */
+int vfio_pci_msi_novirt(struct vfio_pci_core_device *vdev)
+{
+	struct pci_dev *pdev = vdev->pdev;
+	struct perm_bits *perm = vdev->msi_perm;
+	u16 flags;
+	int ret;
+
+	if (!perm)
+		return -EINVAL;
+
+	ret = pci_read_config_word(pdev, pdev->msi_cap + PCI_MSI_FLAGS, &flags);
+	if (ret)
+		return pcibios_err_to_errno(ret);
+
+	p_setd(perm, PCI_MSI_ADDRESS_LO, NO_VIRT, NO_WRITE);
+	if (flags & PCI_MSI_FLAGS_64BIT) {
+		p_setd(perm, PCI_MSI_ADDRESS_HI, NO_VIRT, NO_WRITE);
+		p_setw(perm, PCI_MSI_DATA_64, (u16)NO_VIRT, (u16)NO_WRITE);
+	} else {
+		p_setw(perm, PCI_MSI_DATA_32, (u16)NO_VIRT, (u16)NO_WRITE);
+	}
+
+	return 0;
+}
+
 /* Determine extended capability length for VC (2 & 9) and MFVC */
 static int vfio_vc_cap_len(struct vfio_pci_core_device *vdev, u16 pos)
 {
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index ba0ce0075b2f..acdced212be2 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1518,6 +1518,24 @@ static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
 	return 0;
 }
 
+static int vfio_pci_core_feature_msi_novirt(struct vfio_device *device,
+					    u32 flags, void __user *arg,
+					    size_t argsz)
+{
+	struct vfio_pci_core_device *vdev =
+		container_of(device, struct vfio_pci_core_device, vdev);
+	int ret;
+
+	if (!vdev->msi_perm)
+		return -ENOTTY;
+
+	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_SET, 0);
+	if (ret != 1)
+		return ret;
+
+	return vfio_pci_msi_novirt(vdev);
+}
+
 int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 				void __user *arg, size_t argsz)
 {
@@ -1531,6 +1549,9 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 		return vfio_pci_core_pm_exit(device, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
 		return vfio_pci_core_feature_token(device, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_PCI_MSI_NOVIRT:
+		return vfio_pci_core_feature_msi_novirt(device, flags,
+							arg, argsz);
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 5e4fa69aee16..6e6cc74c6579 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -53,6 +53,7 @@ int vfio_pci_ioeventfd(struct vfio_pci_core_device *vdev, loff_t offset,
 
 int vfio_pci_init_perm_bits(void);
 void vfio_pci_uninit_perm_bits(void);
+int vfio_pci_msi_novirt(struct vfio_pci_core_device *vdev);
 
 int vfio_config_init(struct vfio_pci_core_device *vdev);
 void vfio_config_free(struct vfio_pci_core_device *vdev);
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 2b68e6cdf190..ddf5dd9245fb 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1458,6 +1458,20 @@ struct vfio_device_feature_bus_master {
 };
 #define VFIO_DEVICE_FEATURE_BUS_MASTER 10
 
+/**
+ * Toggle virtualization of PCI MSI address and data fields off.  By default
+ * vfio-pci-core based drivers virtualize the MSI address and data fields of
+ * the MSI capability to emulate direct access to the device, ie. writes are
+ * allowed and buffered where subsequent reads return the buffered data.
+ * VMMs often virtualize these registers anyway and there are cases in user-
+ * space where having access to the host MSI fields can be useful, such as
+ * quirking an embedded interrupt controller on the device to generate physical
+ * MSI interrupts.  Upon VFIO_DEVICE_FEATURE_SET of the PCI_MSI_NOVIRT feature
+ * this virtualization is disabled, reads of the MSI address and data fields
+ * will return the physical values and writes are dropped.
+ */
+#define VFIO_DEVICE_FEATURE_PCI_MSI_NOVIRT 11
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**
-- 
2.45.2


