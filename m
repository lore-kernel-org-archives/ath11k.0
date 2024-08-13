Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E7C52D7B
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROqRYY1dqCAC6kog/NOEL1zLkAqrmdMPMSau7oyZjtU=; b=cW4/n1CuxQJHTX3CA1Pnb7mUNi
	nvv2C4y7+wgsQCu5ziBXKac7fQevGgDYyWnOZGcmZv8aktLXDfIibaIBojsi/ImA8MF4eIFI6+knn
	gcv4vR2kTDl1TrRKwNhbLXcCWqfVqFqjFBApHqIRuZt2Go0qqbjqGWbRR17GabnWQ/tot92a/cm/N
	gNIdcW8pGHblpFyg8m3yfWGoW17pRGoG9OO4MAo3Z5jxiwL/J64kUH3BNWKguba9DJP4qUiSRkCSq
	rtOBJsEJXPAIxcWmLZoPaG9DKjx0UmED0t7bcbF1K+9wW1ShAUZgxUEfcHNe/mmlxdu9ByG9eyzNG
	/9SBW1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sducc-00000004Ohn-3djL;
	Tue, 13 Aug 2024 16:43:46 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduca-00000004Ogo-3vDC
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 16:43:46 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5d80752933bso3905044eaf.1
        for <ath11k@lists.infradead.org>; Tue, 13 Aug 2024 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723567423; x=1724172223; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ROqRYY1dqCAC6kog/NOEL1zLkAqrmdMPMSau7oyZjtU=;
        b=hiM0VOISIF9XQOtr5igWPQQ0p5oGPKNXgR3tunCzmG4XFprwd6OBNjFofiSXGsX/cj
         s58FCuSjY+N3LWOT0cv/V+ci3EHp5UvQyzyvXwZ6zhw29QtVlA1kMdxMlMb33EOUKzFJ
         b9YfNwQ34nb8CZK+9GEh9MrM0J1qGWGJsFnrX+5IHnf6Cxm+LsuSMOivo7Zm0sUfZEwx
         XxAC+Wfdpm/r/fo328drbUCsAe+xG21bgRmg9hO/2jjJgbClHOsuz6wxKHeusUhHhIs/
         EuFQtWxngtNu/Wv2S2+QXegC2gPDkFQCB2bxom4AtkE7bo3Ss9YAo8DD8zuYVTF5b+pv
         MjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723567423; x=1724172223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROqRYY1dqCAC6kog/NOEL1zLkAqrmdMPMSau7oyZjtU=;
        b=FiopiqEScluhecxw5wTt/0glR+2NbIg9LONNfRGieoOGpz4bSvszzqXT4QqbFBORLr
         4eDq+T1sOTjiB45n6b3i2KNW5MVxQMoldCt9zT8U0ymY2hKINV6SlIMcce2cGMvH19v0
         R0Wgk+zj+rT8eL9qViG7eb/OrujplIMUXSscPcIYjORfE3Vt3otAYM4OOvQq8c+TSh87
         NgRfRASCmOBU2cor9MfdS1k4pVrweZckxk6PujPYtGs1p/uDNJh6XQosPQ+4pwiDnzbm
         amg0Vy3LIG+ZLLEqkn1/n9Hp+XAR6tSemnu+W3M2O/U7jmg3vscZGadgp0scCiiUu1iV
         LJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX64/6+mLHUqA42CHMTVtQ0uBkfkkAEQj/Bbr2T/XFESaBH3IkY60gkmx6nPZAjoFl5xACDVUXD8+ou/XkfnSYpWiayyMcgztW7CA==
X-Gm-Message-State: AOJu0YzGZuRN7xgT/vWoMTZkP35yKtVoygMSYx3u6eF2saqjQe05MQ4i
	c6S16YfwKCtakNe0lVYhYhMVmOf2unjBgvMOVtatdsScaNqTLD2ST+1yaX190p8=
X-Google-Smtp-Source: AGHT+IEvmSCVnjpjqrFJiGnBKOZvxrmuCp6UnsBlqoXz0YHrq61kKl9NZyVY0sS6gN/GBZB3kKmjIg==
X-Received: by 2002:a05:6359:410d:b0:19e:fa9c:5ec9 with SMTP id e5c5f4694b2df-1b1aab4ccf6mr3925955d.9.1723567423216;
        Tue, 13 Aug 2024 09:43:43 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82e2f405sm35400856d6.79.2024.08.13.09.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:43:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sducX-008U9H-Jt;
	Tue, 13 Aug 2024 13:43:41 -0300
Date: Tue, 13 Aug 2024 13:43:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, quic_bqiang@quicinc.com,
	kvalo@kernel.org, prestwoj@gmail.com,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci-quirks: Quirk for ath wireless
Message-ID: <20240813164341.GL1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170045.1584000-1-alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812170045.1584000-1-alex.williamson@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_094344_996569_A6E44952 
X-CRM114-Status: GOOD (  19.25  )
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

On Mon, Aug 12, 2024 at 11:00:40AM -0600, Alex Williamson wrote:
> These devices have an embedded interrupt controller which is programmed
> with guest physical MSI address/data, which doesn't work.  We need
> vfio-pci kernel support to provide a device feature which disables
> virtualization of the MSI capability registers.  Then we can do brute
> force testing for writes matching the MSI address, from which we can
> infer writes of the MSI data, replacing each with host physical values.
> 
> This has only been tested on ath11k (0x1103), ath12k support is
> speculative and requires testing.  Note that Windows guest drivers make
> use of multi-vector MSI which requires interrupt remapping support in
> the host.

The way it is really supposed to work, is that the guest itself
controls/knows the MSI addr/data pairs and the interrupt remapping HW
makes that delegation safe since all the interrupt processing will be
qualified by the RID.

Then the guest can make up the unique interrupts for MSI and any
internal "IMS" sources and we just let the guest directly write the
MSI/MSI-X and any IMS values however it wants.

This hackery to capture and substitute the IMS programming is neat and
will solve this one device, but there are more IMS style devices in
the pipeline than will really need a full solution.

> + * The Windows driver makes use of multi-vector MSI, where our sanity test
> + * of the MSI data value must then mask off the vector offset for comparison
> + * and add it back to the host base data value on write.

But is that really enough? If the vector offset is newly created then
that means the VM built a new interrupt that needs setup to be routed
into the VM?? Is that why you say it "requires interrupt remapping
support" because that setup is happening implicitly on x86?

It looks like Windows is acting as I said Linux should, with a
"irq_chip" and so on to get the unique interrupt source a proper
unique addr/data pair...

Jason

