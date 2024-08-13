Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89E0C52D7C
	for <ath11k@archiver.kernel.org>; Tue, 13 Aug 2024 23:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9bxAIpVX1riLRh+ADxS60pDEc8y/s/U7SNAzk7+y9E=; b=s5ONL+gwKm6xdLLtAQDcLyWnd2
	QRQO+H8KhOGqL0RTSzqf913WOIhOMWFM1Ii0JUNxVaVtm9VNC/zsaJ0pMTZYyU8zlTUpylWwCDcmh
	70F9MUOhm1k3XPBWRycrbz7TcT8cENzaQ2uOSDUBgLmnuK93fpLB+IMvmq7wz3bV15Rwau2twiew9
	PFCCCnT/c9SqPyGHi8yWIfA4yQGRgK2mFWZpFJO8Jkt5gHM9UA84ojuFi4QIO8QRfqqHxBkp4ow4F
	68CPy3OkMEaoCVWVJlM4xTJmUZAAK5cbDrWgJLrPopUjvfJUsnjIQ5w6tiwW4KJwTBaQgSc5egoGQ
	e/DEVy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se0l0-000000059kX-0ILJ;
	Tue, 13 Aug 2024 23:16:50 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se0kw-000000059jV-1885
	for ath11k@lists.infradead.org;
	Tue, 13 Aug 2024 23:16:48 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-493d748ba72so2192876137.3
        for <ath11k@lists.infradead.org>; Tue, 13 Aug 2024 16:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1723591004; x=1724195804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9bxAIpVX1riLRh+ADxS60pDEc8y/s/U7SNAzk7+y9E=;
        b=H+5DNvaC+XeauaQX5bIoILL/IbYtamwohIjaN5T4Y2elHgG3vGvwG4vZd56OgzCS3y
         lNgv9TXhesiZwM7q9FWfIHK1lxw3Xq2JnSeUvLPT/LD7vth+/S5o0h3bjWOs0G7ZPE6P
         b/5KqrbS5rknu1Uk4isw4qO5oXXfgVcGW8T+WMRQDGm6Kh8oQyfqDsdklCk/wU8+kemi
         QRgu2+BRfCrxr6bSnSkVrYI47Bh4b8ewqyUehY6ZmPVcYPp5a1FkEhKud0OXyvIhNpyB
         3NeZZ/ygsWuAL24wados+bcF0fAvifuVX5S721K5JJtzD3XqCvGjKKaAgCFUMEL7vDQL
         GZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723591004; x=1724195804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9bxAIpVX1riLRh+ADxS60pDEc8y/s/U7SNAzk7+y9E=;
        b=hwCsy+gBg5fGshLJ8L5uJDe8Tsv+fCP1xdeKAIkBNqnKPx/bRhxa3n+H/0z9fq88Dc
         zGfgoNJLHjJRvx6XFPoRXINsT2gXrUGaCT4u8wuYrjj/KKtvMIyd0jC6mi3KoItNi3BW
         nft6g+FfHAX6N4iUFRBaFAij4bS4TQCKmg2kswVmyFJ1p07L5NeIUS+cDApY7ZdF06se
         vBczn5XmWRsdtbNLyeMeawI90XwSoVF8hUyNKIGj+70pevip/kuWpkY9hSjHo3zS2qkW
         9k4PyOG8kjMfrgTAaJakGWfAvVrxdftHC8GFp12jkZGaJ4RXFImBrMUHYMiJ6AV+Koor
         13zw==
X-Forwarded-Encrypted: i=1; AJvYcCXRmlJJU8pXLnJciFWs9UFrfx5U/BSJasnku1lrD4zKSVnPHp5q7Yc3OwnowwODB7XNTiQwIriE5/oRcQTlcYBWuma22tN4JK2HzA==
X-Gm-Message-State: AOJu0YyPYFGwcA53xi/TL5g+0QGdteWvNdbaHqBi18LgYgvAnihCY2gh
	Y5jRRQ98jwY8VqxlDBIFHpRT4/ho3zFGWIwnEqDPaqBCLfXg7CuaB+ZDcRnTbMU=
X-Google-Smtp-Source: AGHT+IGoFDoTtoRoD3WRlWY/s4rTnkFYy3lRwr/J9OksbksRZd84IshvgLRkB13t/Qhd5u1Rki87Bw==
X-Received: by 2002:a05:6102:c4c:b0:491:f22:3a8 with SMTP id ada2fe7eead31-497599bc0efmr1522313137.29.1723591004199;
        Tue, 13 Aug 2024 16:16:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7e0ddfasm379556485a.126.2024.08.13.16.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:16:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1se0ks-00AITY-S3;
	Tue, 13 Aug 2024 20:16:42 -0300
Date: Tue, 13 Aug 2024 20:16:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org,
	quic_bqiang@quicinc.com, kvalo@kernel.org, prestwoj@gmail.com,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, kernel@quicinc.com,
	johannes@sipsolutions.net, jtornosm@redhat.com
Subject: Re: [PATCH RFC/RFT] vfio/pci: Create feature to disable MSI
 virtualization
Message-ID: <20240813231642.GR1985367@ziepe.ca>
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <20240812170014.1583783-1-alex.williamson@redhat.com>
 <20240813163053.GK1985367@ziepe.ca>
 <20240813151401.789c578f.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813151401.789c578f.alex.williamson@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_161646_448172_AD998593 
X-CRM114-Status: GOOD (  16.56  )
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

On Tue, Aug 13, 2024 at 03:14:01PM -0600, Alex Williamson wrote:

> > Personally, I very much dislike this. Encouraging such hacky driver
> > use of the interrupt subsystem is not a good direction. Enabling this
> > in VMs will further complicate fixing the IRQ usages in these drivers
> > over the long run.
> 
> Clearly these _guest_ drivers are doing this regardless of the
> interfaces provided by vfio, so I don't see how we're encouraging hacky
> driver behavior, especially when it comes to Windows guest drivers.

Because people will then say the Linux driver can't be fixed to
properly use an irq_domain/etc as the only option that works in VMs
will be the hacky copy from MSI-X approach :\

> > Thomas Gleixner has done alot of great work recently to clean this up.
> > 
> > So if you imagine the driver is fixed, then this is not necessary.
> 
> How so? 

Because if the driver is properly using the new irq_domain/etc
infrastructure to model its additional interrupt source then this
patch won't make it work in the VM anyhow, so it is not necessary..

Your other patch would be the only short term answer.

Jason

