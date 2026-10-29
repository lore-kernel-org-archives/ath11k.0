Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AF0606A324
	for <ath11k@archiver.kernel.org>; Thu, 29 Oct 2026 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x/DSCD7I;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UwIl5Shz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=; b=x/DSCD7I8nZAXhR4rELSfg+m1c
	u9WO1kb+kn5qzzkfkRkLtYxIH4FhWMCe5+qNTlIECaRSq6YJcKR8TcWRjPfZxH4K+7PP+Lqlkx8/3
	/UnAr2p550n7BF9Ge9cF2ptwHf2kAByBZp9N6L3AtG5Dl/IWuFWmeRgiZVq4nwazM75SEKGxx8aQ0
	nkviUbNLFI6UWw6F6BSYxsRPuelB/aGxZSXCIHJroFO78NUKrMjGbrk1RuKwKF1KNEVL9uSL4bQU8
	8Say/ojp7A0uVEqm31tPwR+k27OAa3qOtbej9p75/zpoZ31q9jWFKrKXXnhA/C104H7x7Q0GikAMR
	Soi8FDpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTSp-00000009uSm-3wES;
	Thu, 29 Oct 2026 16:58:55 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTSj-00000009uPh-0pyN
	for ath11k@lists.infradead.org;
	Thu, 29 Oct 2026 16:58:54 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-93f2b8cf037so184654685a.1
        for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793293127; x=1793897927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=;
        b=UwIl5ShzOGS5JSEuaSEPajc53tD/YAenvAczr4mn7MvaMurwAXQuaY7OXkW8QzHP7C
         20n0DlruLDUqlfiEVPtMzfBCG2usQlsnCWKsgShz/bCPdWkYbUTab3hzqdwjdOWA4W3V
         +qBN0nHmOzajK/jgLYKMyVLdgS/GuYNh6aXrLqpUBCmFWsQPPeSiGvLdocSrCO4KDwTX
         EDA0ToArubk51/BByfKP6q/Xnk1+WjkMB8iibeNQ+Si+NJi10L9+8WDlISX27b2ehpal
         orks30mQh7tlQzrGJGUPAWIS6iXRVWPnHJSrQ6y9M1AniiIgKvN5CsgpoTaNRmLxX+Cr
         TVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293127; x=1793897927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bXwD83MIjcipNSA+r7WlJ6caQoTXebpCKMfW1alQus=;
        b=0nQUfkaBPAnl0S8F5SEJXoYvIyHuVCViQoGB0pIZydMcqXW6vHuyRbYDg1of+knabh
         0hjHq3fW0R6tEYm/cVzRFpOWZWXl+5KHZQzl5aybuIeGeXGjpqjDLloNFZV/5NDWDcCO
         8wqaUi45U0Scp+UZUeSfZkhYKa0c1Gczwx+bpUJuIn+HmslFIH54nJzWF3I73QpFV0iC
         0sCGPVR9a7gAoohietoujLYj0pvgw1CRoMAKbj7TR/zzss2WUAVsqmIgGiNgr4x/rApM
         dtcnV0sMbt5gw1t8L5FPjKOoOxMU04pRkV7mY/DgDAsEuyNpSflnV4dhOIQNTCOdl/VE
         isWw==
X-Forwarded-Encrypted: i=1; AKwUvBxwJKnYVCKLJ75x7vPwwLsS1FF7JQSqhY/M4ww6H92yPz4OJpTk1JaJOIr+4AEQpnpCYJojkyE=@lists.infradead.org
X-Gm-Message-State: AFq9FYJFRL3C6Rql4wv/GGOjSAjyjT4zaGlyY787njy39HM12Oq5Yp9X
	g2k0Yqqi0Ku8YyxGujubi9jeCK3Mu71ksaKcDY54EpZspjD76ef32QZR/B03iP9QS/Q=
X-Gm-Gg: AYBFou2HHvJ400x3YJC0bRCVkLWunTZwAc494nO2U/4ZMx/s1+wt9cJ7JPBqgg08CWD
	HG6e4ny7GRl0oEebg9sbh6cL6ET5Iv81ZslfKgIgDNo+OVDw727/fRk/HS0vh0TND2js3zpENyJ
	0KD3SAAYTofIoi4pTstLnVJVMffhzET/0nYpPOJ9eFTOvGeCZsWkpTl0yUjgq5ymsUkxZJgihXq
	1Ka3g9tF731xyHoZ6/F0IQfbTB4hjV4aSsiZLiGFmrjLlQ5geOTiUsONEJ54+K0lkK2Txmv0wy7
	gRNqC8HobRzXCEfYVv+jP93NQSI5r7mJFeiUSLGARrhIduPcNCkJbJjxJiCQ4N6fT9YRowrCtkL
	SNfZCzmyRZM7B/G8ruN+sXRTptjJWRJ70HCUkKyTwxnPCHsQROULI1QHLNX3HHYPEmbfKZU+m1R
	Hv/lgOltdQ7IXtHPAVQ0kfD9CgolAbjMUuweTF2hj42xa+BzCiLqf1TZSXs4lXJDle+ZVL42+B5
	6y+8A/bUozzf6XwVd4qDDzzLAN8gx36ByvwCpcvQHXLLqKxAP5Vi0xQNI9dPWbAbeMX5VvvFrS1
	V06r49I75gnOaE6zMLlMyYK39l1tHGy86pnOFNZ1zThGmChRrAf+oXFjcdrQqBrheuv6kVqIUoe
	4fhgvyazNxtpzVaXy2UjLpnygjt/e5jgz
X-Received: by 2002:a05:620a:298c:b0:93f:38c7:70f4 with SMTP id af79cd13be357-94408aa100cmr927645385a.26.1793293126718;
        Thu, 29 Oct 2026 09:58:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-944209818c7sm8131885a.3.2026.10.29.09.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:58:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMTSf-0000000G2uI-1sK7;
	Thu, 29 Oct 2026 13:58:45 -0300
Date: Thu, 29 Oct 2026 13:58:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, pbonzini@redhat.com, seanjc@google.com,
	bhelgaas@google.com, jjohnson@kernel.org, johannes@sipsolutions.net,
	mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, vkuznets@redhat.com, kevin.tian@intel.com,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
Message-ID: <20261029165845.GQ1685504@ziepe.ca>
References: <20261029163713.1366077-1-jtornosm@redhat.com>
 <20261029163713.1366077-3-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163713.1366077-3-jtornosm@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_095849_291911_DB41B885 
X-CRM114-Status: GOOD (  23.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 05:37:07PM +0100, Jose Ignacio Tornos Martinez wrote:
> Some PCI devices (e.g. Qualcomm WiFi adapters) have firmware that
> programs MSI addresses directly into device BAR registers, bypassing
> the standard PCI config MSI path. When these devices are passed
> through to VMs via VFIO, the firmware programs the guest virtual MSI
> address instead of the host physical IRTE address, causing DMAR faults
> and non-functional interrupts.
> 
> Add a KVM hypercall (KVM_HC_PCI_MSI_ALLOC) that allows a guest to
> request the host's physical MSI address/data for a VFIO-assigned PCI
> device. The hypercall is dispatched from the x86 hypercall handler to
> a VFIO backend that:
> 
> 1. Finds the host PCI device matching the guest's vendor:device ID
>    using vfio_file_find_pci_device() (introduced in a previous patch)
> 2. Reads the host MSI address/data from the device's msi_desc or
>    by walking the IRQ domain compose chain
> 3. Returns the result to the guest via a GPA response buffer

This is not quite what I suggested, this still relies on the host
setting up the msi using the trapped MSI emulation, which is the
primary hack..

Was it too hard to make this an 'allocate msi' operation?

> The VFIO handler is connected to the KVM instance via a function
> pointer (pci_msi_alloc) in struct kvm, set when the VFIO device is
> created and cleared on release. This avoids a hard dependency between
> KVM and VFIO subsystems.

I feel like VFIO shouldn't be involved here, for the purpose of MSI
all we need is to inform KVM what struct pci_device * is at a vBDF and
then KVM can do the interrupt bits. Maybe this is already happening?

> +	case KVM_HC_PCI_MSI_ALLOC: {
> +		struct msi_msg msg = {};
> +		struct {
> +			u32 address_lo;
> +			u32 address_hi;
> +			u32 data;
> +			u32 reserved;
> +		} resp;
> +
> +		if (vcpu->kvm->pci_msi_alloc == NULL) {
> +			ret = -KVM_ENOSYS;
> +			break;
> +		}

Yet here it is called alloc?

Nothing should use vendor/device ID either, it should all be drive on
vBDF.

> +	irq = pci_irq_vector(pdev, vector);
> +	if (irq <= 0) {
> +		memset(msg, 0, sizeof(*msg));
> +		return 0;
> +	}
> +
> +	irqd = irq_get_irq_data(irq);
> +	if (!irqd) {
> +		memset(msg, 0, sizeof(*msg));
> +		return 0;
> +	}
> +
> +	desc = irq_get_msi_desc(irq);
> +	if (desc) {
> +		*msg = desc->msg;

And this isn't alloc, it is some query..

I think kvm maintainers would insist on a complete API here if this is
the direction.

I probably would not have selected this, it is why I suggested
virtio-msi or something that could be optional and seperate from the
core KVM guest ABI.

But maybe there is interest in doing it this way?

Jason

