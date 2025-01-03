Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2A2E77188
	for <ath11k@archiver.kernel.org>; Fri,  3 Jan 2025 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZz1gAr6AH9VZR9mcSijrSsgtvQXf/lr7rOewXx+J4E=; b=dqIde797YwCJ/uy6Ty+p87tvyd
	qXXRlBUTq1lsnEwi3HJfl4cvRu/K8gNQYFs3TZf6gsPodRBLEitCl+lL3Jlx5JP23wRn16LgjzrPB
	LQ+nqHDUQY2eGs2DeTW4q2BcZHR3Uu4x05z4akwJhZzLm/tS1GoHsKd8WVlRqvxJAa22W6oDmPtwV
	0S2GYnot89pLBe9fSRuWKMPIY1M+Om0JmsI02NeU1RfOLrGsdZroUw5glhJQ7XC9fcDzvjS0VuckY
	VSUToxSHj6fYV5asupslTRsO8GbtpZ7zCIiH9iwHhI80xFF6BZVQJ8pNLTiyrfyuA+gY+LBN55UuS
	yBhQAgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiiH-0000000D7ON-1cZ7;
	Fri, 03 Jan 2025 14:31:45 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTiiE-0000000D7Nk-2Z60
	for ath11k@lists.infradead.org;
	Fri, 03 Jan 2025 14:31:43 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-467a3c85e11so77885561cf.2
        for <ath11k@lists.infradead.org>; Fri, 03 Jan 2025 06:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1735914701; x=1736519501; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KZz1gAr6AH9VZR9mcSijrSsgtvQXf/lr7rOewXx+J4E=;
        b=f4wz4mRsrUqte/TuzSODBZ+zBiC3EDhKOyXaoE2m2pKuJ7DGPLAumuOIXO27W8Wv5i
         tEHjWVMHQe1FJSJ8SoZG2tgdznMQxyvAxKNNZHFEzP3UZqhouORsLEgKP/K5hiKkPONr
         Yz32kxK/XH3CAhEsTzlBzi8pY+ciDh7VwK9EYOM4A/HySvxC0q2FEtbC8+oaX5MIYmu+
         SOPvn/G3kAuijiPIgZYRxaLsI3lkAowvmFGsgSl0nbjmiJwy4hZAVWzDwvHGQK/PZiqS
         asncSFtK2HSQZVo8uRO5SAhALVIrIhEVqirjLtuOGPHSdoa6vkpgnC97RnaHZCtQvMJG
         shrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735914701; x=1736519501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZz1gAr6AH9VZR9mcSijrSsgtvQXf/lr7rOewXx+J4E=;
        b=oVM8HRgRTL0eI4sUB9UFYhqTJfVIK31Ds1Glj6T92yMH8/d8UoM4ZenH7iAPQ3EECJ
         8wLdjbbTL8f07DAIAAbk3Ol87iY6jAfbDkmbleUx215WAI9hy3AJprqwp89CSEN8zNG9
         dUleNn99EVNJnemtVp6L2U+0sFD8EjCljJWMpt7qNbADtswGxFCQ7SGXaA3DfF+I33dx
         QVobixZqU3fQZRDkwz7iOKm/XkiprA3p4Q/iYPE48uqrrSFlWPAWBBZAQfOhcwFcXW5O
         DgkdFTc0Erf4zMTG11NPNLpWKuo8ZSWv3Ir8bivM336SepDn8yVdr1lEw06O7DjWmvLG
         JpPg==
X-Forwarded-Encrypted: i=1; AJvYcCV4Qrkauht2utIk9RDHyhMQjbL7nZABbfShGrIWNooH+TpPM0gtsh9yuLMBQ2EqXMpArASGlrI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyDIoJmVnwRQOBLYKJf5T7l5Uptott7O0HLMUWaKE5hgyTwO2b
	XqpMAyiuubuhEDSW1YKo2Xvl6YlHnVKP3d/0On9lR21VvcporWp+zS4x8BBr4RE=
X-Gm-Gg: ASbGncsVYhgPJ18dzgPc7yCfqrqM8gITQnYOLApFr/63dbyynfYFLNVnrEys5Upu4Dd
	4RJvNnv/32up8O6W3swatTfkpQ/wt6HHIhkg3za0y/7JAAWUtAvU7QGaN1h9iiYeKxELd4WKJuf
	2qp1sqy8iMbx8cAHidJ+CAIjc7ux6NrD90IKDpNzZtoR6lRg2JWBfKeIB3YRpP6XUu11usrupdB
	Y1cD5W2h9ixlmv8+UnTZPymy2mVGASlmZW8hlDBKA2X/F/J5XdzWVjlAW5HHJjR1fFOrDv8bO98
	sU9qBxkt6+vM91Pt3fo/r7KemLT1Dw==
X-Google-Smtp-Source: AGHT+IGiZCm/3QIaBTSxT82414Bd+tcXwlZF1XMVW0fnnGbWf0zxnCHe0OPTUe/2fE3HXHDT4SXs4g==
X-Received: by 2002:a05:622a:10c:b0:467:68a2:cb55 with SMTP id d75a77b69052e-46a4a8eb7eemr795329811cf.28.1735914701493;
        Fri, 03 Jan 2025 06:31:41 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e64cf47sm146147721cf.3.2025.01.03.06.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:31:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tTiiA-00000000iUS-1wLH;
	Fri, 03 Jan 2025 10:31:38 -0400
Date: Fri, 3 Jan 2025 10:31:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
	quic_bqiang@quicinc.com, kvalo@kernel.org, prestwoj@gmail.com,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
Message-ID: <20250103143138.GC26854@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170014.1583783-1-alex.williamson@redhat.com>
 <20240813163053.GK1985367@ziepe.ca>
 <87r0aspby6.ffs@tglx>
 <03fdfde8dc05ecce1f1edececf0800d8cb919ac1.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03fdfde8dc05ecce1f1edececf0800d8cb919ac1.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_063142_802551_034BD5BC 
X-CRM114-Status: GOOD (  10.35  )
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

On Fri, Dec 13, 2024 at 09:10:30AM +0000, David Woodhouse wrote:

> <fantasy>
> A: The guest OS just hands the device a standard MSI message encoding
> the target guest APIC ID and vector (etc.), and the IOMMU does the
> rest. Nothing 'intercedes' between the guest and the device to mess
> with that MSI message.
 
> /me wakes up...

Well, I share your dream at least. :\

Have the VMM shadow the virtual interrupt remapping tables and assign
it to the phyiscal remapping so that the physical addr/data pair
doesn't change. Driving interrupt routing fully via the remapping HW
and not via MSI interception.

IIRC Alex had a patch series for qemu to capture and rewrite the ath
non-standard MSI locations, so virtualization worries should not block
moving ath to use the device-specific MSI..

Jason

