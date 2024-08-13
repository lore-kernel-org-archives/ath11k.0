Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB16C52D7B
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 23:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98OTBv0aioFqa8eP+pfN2QrHRSjQQBWkH6KFwlgEV7s=; b=b6t+hXbcD8zKpIQGu909NPOD3w
	q9hBUjfy3HJjB5o5nrEIlkba4VbefAeAtAxPDFtvY3KxBGMWTw5TiZdqPvKmxLnnMmB/zbMYimllb
	WC0fRTd8JPVaDvJLrah9TNFOI6ipK9VcQMc6wpXDn5xKMzgfYC1igpXJc79d9rReSpuR5LhClsLP0
	7VnKAWU3h9V6weZSXtpbCkjrB5RVmYk6li0XXJjnfWeXXn9L0itp/xXqJ2218jY/EPaXVE+kNbiNX
	KMJ8CQpuE6h9xrVCzxnO+3k8i9qXWq9BJzp4vzeSIlw4W0NeBRwSpAtDxfHcd69LDsf+3V0/rg4c1
	vuXUTIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se17A-00000005CiQ-2uxA;
	Tue, 13 Aug 2024 23:39:44 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se177-00000005Chb-0bqG
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 23:39:42 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-823423e3accso1888564241.2
        for <ath11k@lists.infradead.org>; Tue, 13 Aug 2024 16:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723592380; x=1724197180; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=98OTBv0aioFqa8eP+pfN2QrHRSjQQBWkH6KFwlgEV7s=;
        b=LKVxxe4FxJXai1rF/OQ0Sj0pEK8dB7vu83L+5mdqBvGK8dndGyRqD0XIn9+eNHqtjn
         KxQTHZ1HjelghBuMNE8Tc1XjLNpD7c8GFO5pfVxNQfnI5BZFEcvyQ6Z/So+8KjyBP18g
         sPyaQLFdZymq+yOIm+fVzPJnOEjk+7HLWzOM2AUagib0yqY3UPS6Og7zXIzHqbgx2A1/
         Ffx14u4IBt+XF2VU3HTPnD4Xh+Nj4AalADz/jXhlVplcqJEjBhuLL8IoB5ggRFxylgDa
         wN3FF26YvqeMhoesSMm/PUYl4d5TwKKF/fWVyNBXtECG8nSfWmRavQv2HTkbHvmDdkFp
         D15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723592380; x=1724197180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98OTBv0aioFqa8eP+pfN2QrHRSjQQBWkH6KFwlgEV7s=;
        b=pDvaXr6up8B7eKijwPPbS1rtg0dM+wOI3wJTN58GrjRFc4AzcrLW9pidgufNT9/SxD
         YFUivdDKxSYB5QFWV4oCZaRti3JWekqnvN4t2m16rh5+GTiNcYyzmqKDJP8QYPytUuLh
         j1T+bPDdVun8rA1Gnk71iJFR7vvjSW3LZ8INQlSJjH0iRzsru1bpLv25NbAp/gyEHnrw
         JjOISkIengoW9mmo2dCpIHnbXe6v7IgDQCMEoOUGKTCAL2A3T4HxWM60aUE2WkODofim
         H52kvSwjoYixvNdPpMoItPgkf35N8L9+cBof5xIu00Pm4A86vT3ZEDZGnITwIWocF7Dg
         ZIDw==
X-Forwarded-Encrypted: i=1; AJvYcCW6zWAY6TQcQwEqIYKkpSZgIyiz71sRoN/e1jsZOkKNxOGB4YzrOJ0+sl8oGl7F6YP8MV2lrYl2fTOKaucA2buqriaBc84G59OWQw==
X-Gm-Message-State: AOJu0YyXJujsweY2fSor+V24DZPs/I7kTQOTqb6Upv7Y6wtKuVdT3iTF
	DzGkz4QV5m8EK58g1n2kAHh7r+nOV4s7mq0tOKlxUhyOe4BvBsSn/0kClilrGv4=
X-Google-Smtp-Source: AGHT+IE48TPAx7DnvwgaTUAY+Kff+tTrcpLLhWszaW51zZJR6kZlFg0WGCb5G5Fvkt7muunVnyyQLw==
X-Received: by 2002:a05:6102:6ce:b0:48f:df47:a4a8 with SMTP id ada2fe7eead31-497599e66c9mr1595703137.29.1723592379937;
        Tue, 13 Aug 2024 16:39:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82ca1ab5sm37630276d6.62.2024.08.13.16.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:39:39 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1se175-00AOnT-0P;
	Tue, 13 Aug 2024 20:39:39 -0300
Date: Tue, 13 Aug 2024 20:39:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
	quic_bqiang@quicinc.com, kvalo@kernel.org, prestwoj@gmail.com,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
Message-ID: <20240813233939.GT1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170014.1583783-1-alex.williamson@redhat.com>
 <20240813163053.GK1985367@ziepe.ca>
 <87r0aspby6.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0aspby6.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_163941_206416_CF44DF1B 
X-CRM114-Status: GOOD (  14.85  )
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

On Tue, Aug 13, 2024 at 07:30:41PM +0200, Thomas Gleixner wrote:
> > Howver, it will still not work in a VM. Making IMS and non-MSI
> > interrupt controlers work within VMs is still something that needs to
> > be done.
> 
> Sure, but we really want to do that in a generic way and not based on ad
> hoc workarounds.
>
> Did the debate around this go anywhere?

No, it got stuck on the impossible situation that there is no existing
way for the VM to have any idea if IMS will work or is broken. Recall
Intel was planning to "solve" this by sticking a DVSEC in their
virtual config space that said to turn off IMS :\

So using IMS in the real world looked impractical and interest faded a
bit.

But the underlying reasons for IMS haven't gone away and more work is
coming that will bring it up again...

Jason

