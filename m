Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D4606C3D4
	for <ath11k@archiver.kernel.org>; Mon,  2 Nov 2026 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mSxeQoUy;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZgU8hBwS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BGZaLVl/bf+VQNDSvC9YaFRzMNQ+JkOw52QT0TU0FxI=; b=mSxeQoUyzVbphN2UM1Aqu9h5T4
	Dm04uVeYm5eqxhsDujQXgHM4NhgWw+tEsWgPg0umQMMe5cYty6e4fZlK0ZqteaEUSIW0u86uY3dyV
	q/bQXW6QgGl9vcjK6ICMebFTStycPp//1y8a2kqVeBSst5VP0HXzGYDD+Ey5JzmRZUz/NY+aMVAGC
	VZ5+ZixuaoiRXzzbGaidAMvdwIL5G1nVcrRP+h3kmySfDd1r24U6DcNO/O8OPbXRse0pZP2DvyRND
	Oc1TSBaIwFGKK5MIIaDX18nxv+ixxcrAtwOaBjqGAU3qLo4sxJXHsiz6xC+3NzsVX9e1Lzz7jfJwo
	FkMtpotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtUr-0000000Gw8c-1AbY;
	Mon, 02 Nov 2026 14:58:53 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNtUp-0000000Gw7C-0ECR
	for ath11k@lists.infradead.org;
	Mon, 02 Nov 2026 14:58:52 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2e9821ca96fso50484605ad.0
        for <ath11k@lists.infradead.org>; Mon, 02 Nov 2026 06:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793631529; x=1794236329; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGZaLVl/bf+VQNDSvC9YaFRzMNQ+JkOw52QT0TU0FxI=;
        b=ZgU8hBwSq0U7OW7LJRwrxfxpTmv/EmxVmbVppYSfb9y1lyRogP2RA5ZJlve6SMUn36
         KJ7xxe6A1dElVuGflDxYdLs59jKb2tHrAHOKQWuUK6RbCBzQvlWM3XC8oCotkvrlSk6z
         t2aZOheKiN8MTj1rArLWsN01BRBZN9kHMo5Y/tR6+8dzpKuzaNhhAkCzpxyeXPxUakwn
         IeKLG3vmSyvEGjf4H8PwJ9MD+dbWOs1+NL2cjZCaTn+Bv38OYaU/nOwu25cmh1jAuKVj
         noX0GnEhWqXt1xeCUe8gIc6KQGRaGPHlJRwHRyCzaqFBt8/txOA1t0iaEslwIY/CSgwI
         R9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631529; x=1794236329;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGZaLVl/bf+VQNDSvC9YaFRzMNQ+JkOw52QT0TU0FxI=;
        b=e2qX8D20Jmy0Pw08jNNCLWaSp2WIvNQrIfgafI826gCB+qfciNUQVQHTnXgS82YxTx
         QV6YJCh7jKJ2OFwfqdy/778s30rU9dbcRbVz/6/IAz+7RrmUz6nN35C9i3DmyuRxXqYv
         FTytdXuNSo+otU+b9xPs4g6Vu04vDtOBbVbD0Zgz5uC8RjQTYclIcxmXHgIfDnMEAdtg
         Djwi3B1+cCu8KPB7rGvZrnSki8WVXAz0VK3rLDn8SKPwg1pGIDrMW2Nm2rKyG5aa+GGd
         Uv/Bxmj2eK2y0zPQuZqp2OjKZW1a5VyPrwwpfw5sNgfMwKNexGGHT16SxMMynfttUuHZ
         0z7g==
X-Forwarded-Encrypted: i=1; AKwUvBw2qkR82DLsag0Q+nKzpbvbTptM6tsBXmqXYoVLmNCUM0etPBE8rXMTlNVlwgCcstGng+5D294=@lists.infradead.org
X-Gm-Message-State: APuU4Z9DhWjldzr8YoWSxJnCZFTPlCE/8WwD3Wz7NVr/SjWlK66SWa1G
	e7vdfBBb8Nrpilv4rz7wXWRDdTtXHjoay7c61bHGuLZU4EpEbi+pQqi6+SklEXQQmtFMkitPwPX
	cBzFm7Q==
X-Received: from plnl5.prod.google.com ([2002:a17:902:fd85:b0:2ea:44fa:2c44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f691:b0:2e2:d39f:182f
 with SMTP id d9443c01a7336-2eb3643d489mr99134825ad.28.1793631529137; Mon, 02
 Nov 2026 06:58:49 -0800 (PST)
Date: Mon, 2 Nov 2026 06:58:48 -0800
In-Reply-To: <20261102074657.27715-1-jtornosm@redhat.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261029165845.GQ1685504@ziepe.ca> <20261102074657.27715-1-jtornosm@redhat.com>
Message-ID: <auilKFwKLjw-BnZM@google.com>
Subject: Re: [PATCH v3 2/8] KVM: add PCI MSI hypercall for VFIO passthrough
From: Sean Christopherson <seanjc@google.com>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: jgg@ziepe.ca, alex@shazbot.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, bhelgaas@google.com, jjohnson@kernel.org, 
	johannes@sipsolutions.net, kevin.tian@intel.com, kvm@vger.kernel.org, 
	kwilczynski@kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org, 
	lpieralisi@kernel.org, mani@kernel.org, pbonzini@redhat.com, robh@kernel.org, 
	vkuznets@redhat.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_065851_085368_A707E0BC 
X-CRM114-Status: GOOD (  11.87  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026, Jose Ignacio Tornos Martinez wrote:
> > I probably would not have selected this, it is why I suggested
> > virtio-msi or something that could be optional and seperate from the
> > core KVM guest ABI.
> >
> > But maybe there is interest in doing it this way?
> 
> Since there was no feedback from KVM maintainers,

NAK to adding any KVM-handled hypercall, and probably NAK to any approach that
requires KVM changes.

With regard to timing, please show a little patience and awareness.  It's Monday.
You posted a fairly large series on a Thursday, during a merge window.  If you
change direction after ~2 days for a series of this natures (touchs multiple
subsystems and introduces guest/host ABI), you're likely going to end up with
severe whiplash.

