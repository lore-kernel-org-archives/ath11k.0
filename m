Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C0C67861
	for <ath11k@archiver.kernel.org>; Mon,  8 Apr 2024 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfCVjviWJeub0v2MSTKXDx11MJAse5lPODUz+n33hmU=; b=Cn9Kkydc+Ty+GGL5ids6aKMIls
	7XnAAr3Na9OJGY/V1S9H4Yvp87wVkgP+yMs2miVBrc8AOdqxNMNA4tNwKxi3KDvWJ4UG8+y2loWcX
	604Tf5BMfs665V8oR0aOZ6pfSFOQs5Gzg2kfWeJLZRqbrrtQZWdhF7kmvTYg1SaOl4IZlGseKlvTM
	+fVAJMXe/C/Bjk3ps7CccRaQrhUkSOOikioGWhIbk3xJd82fiso13922mdL2WxUzvH5OZDFXNJNAy
	NwwFr0fx2bTtk8jQmyf6a3JmD95OHR/Byq3E0BHdIJL9ZZdB9HTqmQGCr7s43lbsMwTf5e1LGF397
	6SZaC2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtukn-0000000Gdvm-3Zpc;
	Mon, 08 Apr 2024 19:34:06 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtukk-0000000Gdv5-0yCN;
	Mon, 08 Apr 2024 19:34:03 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a51e368c6dcso72163366b.3;
        Mon, 08 Apr 2024 12:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712604838; x=1713209638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfCVjviWJeub0v2MSTKXDx11MJAse5lPODUz+n33hmU=;
        b=dB/NtHjR4nRqr3UX5L2sPE9j4NEjCQy1iQF8Lc1Z1loLaoR5FtrFTpDUnvJ5ieAeft
         AmYHR9A/Dz2w2c5pmAUwLCSCuFfVjOClCC9jGteb3qUP6S8y2zRDJ7VEXk/rNWPlXjg7
         REWzeRJM0etQkJSZHOLSgpGtHLgCg/zyvsoRcxzBF7uRppFqwiDmrjFYYamJt9rIvtFM
         zN1hLjPydx4Bt1EQhQ6je+Sxp1c7Poc3y7b4wzLaxLkzhG5/BPclC2NTxdq6vOpPXGEE
         8eCpm3kIhIG7XsG8MMEyZrW3oSYRmkVkNffvDZue0oS95mpnWTKUkhr0+RzAqZOyCsRs
         g9gA==
X-Forwarded-Encrypted: i=1; AJvYcCV/VbMslhxxAMxLzekK3If0g34vmiuY2cCbH94J1KtVSvyk4e4aZazy9XMG11ixvQByiucu8oQpMQ6XpPDzvseYZElWAbddCmq1ktT4MRoyai+HAVZGBRWwKwgbGQ2YAO2Q5oHLHlI=
X-Gm-Message-State: AOJu0YxUmTDvI4E5O55AkEBwsltAh69OmeI8VbiKEk7kFsfqk+thdvF5
	OwmYsUty/E2gmK9ttv9aoAtjIBDja2OMQZy24xU8bKDZG8qE7wJm
X-Google-Smtp-Source: AGHT+IFVHHOuNQdDkgTThZIsOIA2O31M9s6h62JAwb2e7rIFNi7t+6i8asIMrJ5fM6Dg38+17TsPPA==
X-Received: by 2002:a17:907:7213:b0:a4e:609c:3985 with SMTP id dr19-20020a170907721300b00a4e609c3985mr8079720ejc.52.1712604838302;
        Mon, 08 Apr 2024 12:33:58 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-008.fbsv.net. [2a03:2880:30ff:8::face:b00c])
        by smtp.gmail.com with ESMTPSA id gs44-20020a1709072d2c00b00a46a3ad035esm4804743ejc.179.2024.04.08.12.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 12:33:57 -0700 (PDT)
Date: Mon, 8 Apr 2024 12:33:55 -0700
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: kuba@kernel.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, imitsyanko@quantenna.com,
	geomatsi@gmail.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] wifi: Un-embed ath10k and ath11k dummy netdev
Message-ID: <ZhRGo3I57rXxsMV/@gmail.com>
References: <20240405122123.4156104-1-leitao@debian.org>
 <87y19r264m.fsf@kernel.org>
 <ZhPyRHHlVot+a8Xq@gmail.com>
 <87pluz24ap.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pluz24ap.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_123402_320290_2138239D 
X-CRM114-Status: GOOD (  34.94  )
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

On Mon, Apr 08, 2024 at 07:43:42PM +0300, Kalle Valo wrote:
> Breno Leitao <leitao@debian.org> writes:
> > On Fri, Apr 05, 2024 at 06:15:05PM +0300, Kalle Valo wrote:
> >> Breno Leitao <leitao@debian.org> writes:
> >> 
> >> > struct net_device shouldn't be embedded into any structure, instead,
> >> > the owner should use the private space to embed their state into
> >> > net_device.
> >> >
> >> > This patch set fixes the problem above for ath10k and ath11k. This also
> >> > fixes the conversion of qtnfmac driver to the new helper.
> >> >
> >> > This patch set depends on a series that is still under review:
> >> > https://lore.kernel.org/all/20240404114854.2498663-1-leitao@debian.org/#t
> >> >
> >> > If it helps, I've pushed the tree to
> >> > https://github.com/leitao/linux/tree/wireless-dummy
> >> >
> >> > PS: Due to lack of hardware, unfortunately all these patches are
> >> > compiled tested only.
> >> >
> >> > Breno Leitao (3):
> >> >   wifi: qtnfmac: Use netdev dummy allocator helper
> >> >   wifi: ath10k: allocate dummy net_device dynamically
> >> >   wifi: ath11k: allocate dummy net_device dynamically
> >> 
> >> Thanks for setting up the branch, that makes the testing very easy. I
> >> now tested the branch using the commit below with ath11k WCN6855 hw2.0
> >> on an x86 box:
> >> 
> >> 5be9a125d8e7 wifi: ath11k: allocate dummy net_device dynamically
> >> 
> >> But unfortunately it crashes, the stack trace below. I can easily test
> >> your branches, just let me know what to test. A direct 'git pull'
> >> command is the best.
> >
> > Thanks for the test.
> >
> > Reading the issue, I am afraid that freeing netdev explicitly
> > (free_netdev()) might not be the best approach at the exit path.
> >
> > I would like to try to leverage the ->needs_free_netdev netdev
> > mechanism to do the clean-up, if that makes sense. I've updated the
> > ath11k patch, and I am curious if that is what we want.
> >
> > Would you mind testing a net patch I have, please?
> >
> >   https://github.com/leitao/linux/tree/wireless-dummy_v2
> 
> I tested this again with my WCN6855 hw2.0 x86 test box on this commit:
> 
> a87674ac820e wifi: ath11k: allocate dummy net_device dynamically
> 
> It passes my tests and doesn't crash, but I see this kmemleak warning a
> lot:

Thanks Kalle, that was helpful. The device is not being clean-up
automatically.

Chatting with Jakub, he suggested coming back to the original approach,
but, adding a additional patch, at the free_netdev().

Would you mind running another test, please?

	https://github.com/leitao/linux/tree/wireless-dummy_v3

The branch above is basically the original branch (as in this patch
series), with this additional patch:

	Author: Breno Leitao <leitao@debian.org>
	Date:   Mon Apr 8 11:37:32 2024 -0700

	    net: free_netdev: exit earlier if dummy

	    For dummy devices, exit earlier at free_netdev() instead of executing
	    the whole function. This is necessary, because dummy devices are
	    special, and shouldn't have the second part of the function executed.

	    Otherwise reg_state, which is NETREG_DUMMY, will be overwritten and
	    there will be no way to identify that this is a dummy device. Also, this
	    device do not need the final put_device(), since dummy devices are not
	    registered (through register_netdevice()), where the device reference is
	    increased (at netdev_register_kobject()/device_add()).

	    Suggested-by: Jakub Kicinski <kuba@kernel.org>
	    Signed-off-by: Breno Leitao <leitao@debian.org>

	diff --git a/net/core/dev.c b/net/core/dev.c
	index 2b82bd1cd2f8..5d2cb97d0ae6 100644
	--- a/net/core/dev.c
	+++ b/net/core/dev.c
	@@ -11058,7 +11058,8 @@ void free_netdev(struct net_device *dev)
		dev->xdp_bulkq = NULL;

		/*  Compatibility with error handling in drivers */
	-       if (dev->reg_state == NETREG_UNINITIALIZED) {
	+       if (dev->reg_state == NETREG_UNINITIALIZED ||
	+           dev->reg_state == NETREG_DUMMY) {
			netdev_freemem(dev);
			return;
		}

