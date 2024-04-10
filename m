Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1755DCD128A
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v050svZEeKX6xCxDWehqmojLYZEjuvnVFUXjaedZaw=; b=ZgOdwWPIEALkOWkSIbmAlPPzBW
	zaN+t+Ug45JAkGUGD2LMiib4heZun0qwLaAb9il+7UrZvmWYXRuX9lyOUoiAEOECaTKXUwC59wpdz
	NJucHK++bFAcNGpuc2LBLyRxromk5bHVhHh1DwPfrK09OHDBg0m7wLXp4sKUC9qBWC6/rpjCU8ffH
	Fw+lLwzciCqkXKb8CbYIlIeaPBNKSDoKg2oEP8NOMIh4oJJgFRg0sN3XoXn0r5cjqXV8JB/cm0Cz0
	cB9UbM3XPi9c5lSbAi+s7JfEfjMKdQyU71NrdKMxe/83Byk5ZMY5yWAoPoY/tc2zXEXdSJ8GGkJL9
	ArNafBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXKt-00000006wL4-3B77;
	Wed, 10 Apr 2024 12:45:55 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXKn-00000006wJd-21vH;
	Wed, 10 Apr 2024 12:45:51 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a51beae2f13so478433266b.1;
        Wed, 10 Apr 2024 05:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753146; x=1713357946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0v050svZEeKX6xCxDWehqmojLYZEjuvnVFUXjaedZaw=;
        b=dGxr5fUZKtIozuaC+z0aesE5nTlYWelXw4kVcNhlna/iK74dnL6GlwgofdDWhONdwm
         3k5xPdVJmSydv8qAt6Fdhr31O2twrnKFwnZWSiS6bVz9o3KJfcZW/97ufT1S7crFyrpm
         ZYJaR1VDliu/xCYaBJhVh4Ie/QWNHpVdQrGUOd5WYJbD//cuHuHM8olIBXRSNe1g1+xV
         ClElYIGWChd7bywWqnrBIWUfE3kZj4ZrEDN4cJisWbE8/4FrPIBah1LHDWBj71uzJd/A
         +6yj1zg0qwvWWvLsQp1HWCdl55d0vtsemlOsXw/sagToSgSirsDPlbmQ+Dv+DnUPMQt6
         vTWg==
X-Forwarded-Encrypted: i=1; AJvYcCUzm3wXyWQ3XQUlcQ7mbX+B4AmcGpwZe9y2TKnSMM41DOrs+S0kw6o8tFJBWEtTxIT8XImEpbApD0/WB54wKzybyG6zTqQ4CugG0wxZDThtkNcR4d2ZEgMh5Lf6AQWU+Pikh84n7dnUrz8ATFtwmOxABBtanrOKClW11HRgfZA1qznpqZv0yVPL/3PyVPvogSaIewm3BMIW3ETtDpZKqQmKF9Z9Q4aezJmC7BszGOxBAw==
X-Gm-Message-State: AOJu0YyHQW1/schjeyxI/JI+oRqBtk9o9DoHPa6TTDE+QDQSCDoSiuAh
	XfU36PyOHbN4HdnEvRMIt1tkUSmpGw2AuE5UBz73+bn5VcIcDoDD
X-Google-Smtp-Source: AGHT+IGHTIvSnYbc16oL+rmZ6uXCsyNfTppKX/R1tU+P7ojp/FGa9JEJ+FKYxGWNNfYEH5ZZNCyv/A==
X-Received: by 2002:a17:907:7da8:b0:a51:dd50:6a with SMTP id oz40-20020a1709077da800b00a51dd50006amr2008839ejc.66.1712753145630;
        Wed, 10 Apr 2024 05:45:45 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-007.fbsv.net. [2a03:2880:30ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id jg18-20020a170907971200b00a51a60bf400sm6765658ejc.76.2024.04.10.05.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:45:45 -0700 (PDT)
Date: Wed, 10 Apr 2024 05:45:41 -0700
From: Breno Leitao <leitao@debian.org>
To: Ido Schimmel <idosch@idosch.org>
Cc: aleksander.lobakin@intel.com, kuba@kernel.org, davem@davemloft.net,
	pabeni@redhat.com, edumazet@google.com, elder@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nbd@nbd.name,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org, taras.chornyi@plvision.eu,
	ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, geomatsi@gmail.com,
	kvalo@kernel.org, quic_jjohnson@quicinc.com, leon@kernel.org,
	dennis.dalessandro@cornelisnetworks.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	amcohen@nvidia.com
Subject: Re: [PATCH net-next v4 2/9] net: create a dummy net_device allocator
Message-ID: <ZhaJ9WkG2OYXkvGo@gmail.com>
References: <20240409125738.1824983-1-leitao@debian.org>
 <20240409125738.1824983-3-leitao@debian.org>
 <ZhZzjNDRaHtdYjDg@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhZzjNDRaHtdYjDg@shredder>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_054549_615666_CF990673 
X-CRM114-Status: GOOD (  29.45  )
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

On Wed, Apr 10, 2024 at 02:10:04PM +0300, Ido Schimmel wrote:
> On Tue, Apr 09, 2024 at 05:57:16AM -0700, Breno Leitao wrote:
> > It is impossible to use init_dummy_netdev together with alloc_netdev()
> > as the 'setup' argument.
> > 
> > This is because alloc_netdev() initializes some fields in the net_device
> > structure, and later init_dummy_netdev() memzero them all. This causes
> > some problems as reported here:
> > 
> > 	https://lore.kernel.org/all/20240322082336.49f110cc@kernel.org/
> > 
> > Split the init_dummy_netdev() function in two. Create a new function called
> > init_dummy_netdev_core() that does not memzero the net_device structure.
> > Then have init_dummy_netdev() memzero-ing and calling
> > init_dummy_netdev_core(), keeping the old behaviour.
> > 
> > init_dummy_netdev_core() is the new function that could be called as an
> > argument for alloc_netdev().
> > 
> > Also, create a helper to allocate and initialize dummy net devices,
> > leveraging init_dummy_netdev_core() as the setup argument. This function
> > basically simplify the allocation of dummy devices, by allocating and
> > initializing it. Freeing the device continue to be done through
> > free_netdev()
> > 
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> 
> We were about to submit another user of init_dummy_netdev() when I
> noticed this patch. Converted the code to use alloc_netdev_dummy() [1]
> and it seems to be working fine. Will submit after your patch is
> accepted.

Thanks. It seems that this patch is close to get accepted. Let's see...

> See a few minor comments below.
> 
> [...]
> 
> > +/**
> > + *	init_dummy_netdev	- init a dummy network device for NAPI
> > + *	@dev: device to init
> > + *
> > + *	This takes a network device structure and initialize the minimum
> 
> s/initialize/initializes/
> 
> > + *	amount of fields so it can be used to schedule NAPI polls without
> > + *	registering a full blown interface. This is to be used by drivers
> > + *	that need to tie several hardware interfaces to a single NAPI
> > + *	poll scheduler due to HW limitations.
> > + */
> > +void init_dummy_netdev(struct net_device *dev)
> > +{
> > +	/* Clear everything. Note we don't initialize spinlocks
> > +	 * are they aren't supposed to be taken by any of the
> 
> I assume you meant s/are/as/ ?

Thanks for the feedback, I agree with all of them.

Since these lines were not introduced by this patch, and this patch is
just moving code (and comments) around, I would add a new patch to the
patch series fixing the grammar errors.

