Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32701CC6B12
	for <ath11k@archiver.kernel.org>; Tue, 13 Oct 2026 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyjwC2WBuD3zNw2RX08XNRIFsnb2jRmWsy8BXsOZxS8=; b=pm4X2lnQVNASv1W04zCaAc9SHL
	p2YR8pFUFt30/UcZwWTpjBIpHnzawUe6D7QLzPCs9TldPNKoZ350JyFw3EANW+dDRTF8RBbcqauB9
	LOE/WvG5J8TxVRvFDgk9P2GO3qqfCEjqLdwyI4l59y6qZHeUCrbk2IgrTXHUCc6ppyfiM7sp6HV/1
	BRsYM1mSA51S4qcXswrs1PgT3l43ECBGbhVi/WZw9fXuEWIpGH0hKGKjrQjNtvJkiZzpbrwH4Ze9B
	CXfv8n/XR/Z+ZbSj61mncMdBHoDXBqVaHhtgaRfBURzB0qIKwOPs7FwrX2US5nkHNOcyKX2lJAacN
	kZxbna7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeeP-0000000DOSt-2OH5;
	Tue, 13 Oct 2026 15:42:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeeM-0000000DORw-3nga
	for ath11k@lists.infradead.org;
	Tue, 13 Oct 2026 15:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791906165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyjwC2WBuD3zNw2RX08XNRIFsnb2jRmWsy8BXsOZxS8=;
	b=UWLTpmmr+XVVOq/XRiyMg9zDECTlZKgsroEd6xJTNyTf6HHkYhJdN6NS/ONefsECHmtWzI
	l2Zxa9Y+QMsUUXZVP9OFyFVVDK+H6MMq3wMrd6nbtGzpStDwPE6vHSst4AqY8hB5iR4V7l
	7CukXkjlUiZ+4nH5cl2bDR8qZWFnqU4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-iy-R_dc5MQuOD1Wh1XsSUw-1; Tue,
 13 Oct 2026 15:42:35 +0000
X-MC-Unique: iy-R_dc5MQuOD1Wh1XsSUw-1
X-Mimecast-MFC-AGG-ID: iy-R_dc5MQuOD1Wh1XsSUw_1791906153
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31E421964CEF;
	Tue, 13 Oct 2026 15:42:32 +0000 (UTC)
Received: from jtornosm-thinkpadp1gen7.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C209B1956041;
	Tue, 13 Oct 2026 15:42:26 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jgg@ziepe.ca
Cc: alex@shazbot.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	johannes@sipsolutions.net,
	jtornosm@redhat.com,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	skolothumtho@nvidia.com,
	yishaih@nvidia.com
Subject: Re: [PATCH 0/7] Enable Qualcomm WiFi PCIe passthrough to VMs
Date: Tue, 13 Oct 2026 17:42:25 +0200
Message-ID: <20261013154225.214531-1-jtornosm@redhat.com>
In-Reply-To: <20261013140345.GK14213@ziepe.ca>
References: <20261013140345.GK14213@ziepe.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: kzd1iVfC_9AKQaQxtcX-OfS61ZwMt72d3ktUKL4f3O8_1791906153
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084247_016267_B67CBA05 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

Thank you for the direction on device MSI domains. The Hyper-V
reference is difficult for me to follow for this case. Could
you point me to some existing KVM/VFIO equivalent, or similar
example for my use case? Any pointers to relevant code,
documentation, or previous discussions on this topic would be
very helpful to get started in the right direction.

Also, where would this need to be implemented? Kernel only
because it is already supported in QEMU in a general way, or
kernel and QEMU for some specifics?

Best regards
Jose Ignacio


