Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D238C54E71
	for <ath11k@archiver.kernel.org>; Fri, 22 Mar 2024 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMb2IgPKyZnj/ue62em5Q9KAY8/Lp0+DnO65BTLg4OM=; b=ZxvXG5iPXXTohDm7lZfWehTyIJ
	doFq35STwV5Z1O+SIwNo8kqbp6pbWx5Yqhtk873qFdk+gG7YOFuzCFVY8Dwft+ASdOAPj7J5APZHl
	n3Jg+Kat/irdFT61aPC0/f2g+C3BInQ4wc/4EBtbQr3oJ2SfWiAiv0XOrJLbHJH5ZN90cbTnZeQja
	+kJ6vYUE66R3NgU+r43tFG8ZmGgikxfmbNr8Um2Eqz5C0NE3K/oUI7ig7dRvaIG7EvwnwRsqfS7Z9
	68eAh/2c1JkxbqdoNxAApEzFBfsKdaItGT9P86g14HNkSSgplxchFEv8RcXbB23M1KyH4gpqvoHtH
	32hpCncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngdA-00000007iwu-3F1N;
	Fri, 22 Mar 2024 15:16:28 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngd5-00000007ivd-2ReI
	for ath11k@lists.infradead.org;
	Fri, 22 Mar 2024 15:16:27 +0000
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56bc8cfc19fso2421546a12.1
        for <ath11k@lists.infradead.org>; Fri, 22 Mar 2024 08:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711120580; x=1711725380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMb2IgPKyZnj/ue62em5Q9KAY8/Lp0+DnO65BTLg4OM=;
        b=aQCGb5GIqAveEu4doXDNbJsIZLbJ8o3MK92lYTqoYt9Uzaf3vYxmiLfVHbZeieClys
         WfVkDO0pPdRnzekUlDIioXiOaPUMsiYU0Alm82D5fEBEuESFlakv4eOrWkT0r9DpF/qx
         Jh/E4emDuEqgej65XNVYEagjzkZFAph1omPQNGTlX82DZqRe9tPUnEOAB1o91Z0ZO5Aj
         H7FmdbmE1fGYIQd0OWmCJY+QQ4QQ65h74ifLRCf4lRVJwqukDNnIc0UYiiEg0wrkcFWX
         EbgbYNNnWNfbZRW2rm0ofCtYW3mBQQJWloEB7R4p5kuTX+twhurjl0otGJ3C0JjgMA+9
         i3uA==
X-Forwarded-Encrypted: i=1; AJvYcCVyZv/nDuWosa5rHu+fO+Wf6DMem1/iajUOtOmhqoiXKmDuTBe6DtU+2SsGbcN6sPdbUq/1L2RLIYWIM5E5hg3K3JnxxZJNdPPvtw==
X-Gm-Message-State: AOJu0Yxo/TxgOEBJDKIuBURwr9xsk4zGC6nzTnuw3ws6JkCKGZaL8He8
	XwiHA8x6TYBENZTX8HxK/g+45RGXNO3nIn+Ymtr7RhAIG0AY5XT6
X-Google-Smtp-Source: AGHT+IG19fJVfmLxYOcOEr80oE8P0l2x5mYegvQxSIpQMrvkuLrpfoVX+O792HS4x99bT+I74w91TA==
X-Received: by 2002:a17:906:1843:b0:a46:f958:2eb6 with SMTP id w3-20020a170906184300b00a46f9582eb6mr1801147eje.67.1711120580209;
        Fri, 22 Mar 2024 08:16:20 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-120.fbsv.net. [2a03:2880:30ff:78::face:b00c])
        by smtp.gmail.com with ESMTPSA id oz27-20020a170906cd1b00b00a473490aae8sm543234ejb.24.2024.03.22.08.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 08:16:19 -0700 (PDT)
Date: Fri, 22 Mar 2024 08:16:17 -0700
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, kuba@kernel.org,
	keescook@chromium.org,
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,
	"open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: allocate dummy net_device dynamically
Message-ID: <Zf2gwaEU4PQ+6GMe@gmail.com>
References: <20240319185735.1268980-1-leitao@debian.org>
 <871q85as8e.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871q85as8e.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_081626_551504_4FA0F0E9 
X-CRM114-Status: GOOD (  16.68  )
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

On Wed, Mar 20, 2024 at 04:32:49PM +0200, Kalle Valo wrote:
> Breno Leitao <leitao@debian.org> writes:
> 
> > Embedding net_device into structures prohibits the usage of flexible
> > arrays in the net_device structure. For more details, see the discussion
> > at [1].
> >
> > Un-embed the net_device from struct ath11k_ext_irq_grp by converting it
> > into a pointer. Then use the leverage alloc_netdev() to allocate the
> > net_device object at ath11k_ahb_config_ext_irq() for ahb, and
> > ath11k_pcic_ext_irq_config() for pcic.
> >
> >  The free of the device occurs at ath11k_ahb_free_ext_irq() for the ahb
> > case, and ath11k_pcic_free_ext_irq() for the pcic case.
> >
> > [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
> >
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> This crashes on my nuc x86 test box with WCN6855 hw2.0 when running
> rmmod, stacktrace below. I used tag ath-202403201010 from my ath.git
> tree as the baseline. Sorry that I'm not able to debug this further
> right now.

Thanks for the detailed log. I am trying to understood the issue, and I think
we are deferring a null pointer, which is likely net_device->dev_addr.

Here, dev->dev_addr seems to be NULL.

>   27:	83 e6 07             	and    $0x7,%esi
>   2a:*	42 0f b6 14 30       	movzbl (%rax,%r14,1),%edx		<-- trapping instruction

In this case, and I understand RAX seems to be dev->addr, and R14 is the
KASAN shadow:

	RAX = 0000000000000000
	R14 = dffffc0000000000 (CONFIG_KASAN_SHADOW_OFFSET)

So, we are clearly deferring a NULL pointer.

Now, why? Not sure yet.

