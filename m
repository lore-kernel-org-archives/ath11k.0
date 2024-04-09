Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C91CD1284
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 10:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D18zsKfXH63dj1S3Q8K0FBC8WrKFJn4nZwjzqAFKe8U=; b=c2//5ASBV5HlRdHuTCO/TT01/e
	fXlQsHggEczjxvcET21c+miVsiqopA/cKuahiJFoQbjnW0qdsGMFq2jsfKnuEDAInqwy7CURsTklW
	14LbUkN+6/Y5M2dvdYUVvl0J6aaRagSK5Pi1wAemE7svphe9lmxJXiq0idCDeirLRRn29IapbTxMs
	3vOjgxapxgzKoAOcMrFgRHYIYvOLm5SIayqloSwZOA9X0VuxUdntJ7nVRswGnlW6/pSZ2RUMIE3zt
	DC7xXW92FO30x8jIvee5qza6qk1pqJH6PT6WmYNaCwwsKxQTscKtIVuXQ8SUCwSR3bWg8FPNTixkj
	M3uQ95Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru958-00000001Wyd-1mAe;
	Tue, 09 Apr 2024 10:52:02 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru954-00000001Wxp-2MM4;
	Tue, 09 Apr 2024 10:52:00 +0000
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e37503115so3485043a12.1;
        Tue, 09 Apr 2024 03:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712659913; x=1713264713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D18zsKfXH63dj1S3Q8K0FBC8WrKFJn4nZwjzqAFKe8U=;
        b=KQLZ0f2+Gpn4Ji8xGocZlgiKuoK7JGJrZmDAXosF0ig5BOFhk7ZRYGfSiHALhyeFMr
         oP8aElPjRU6IunLimTnEvXb3ZS6iWxL2puR34719Cg5p8qlvDyVJxdxXI74c+/lriQpL
         maBS7TyJi+F0APzeFsvxTLKL/quSCyk4H/oZEiRDYuBkFJ+khTPdSffJCgdFMmb3CncL
         4Yg113YN0XkEzqKg/dTWAoejEvknUSevXKatuOjoV2nWHipxNW/QdL5vi/KARmsIW5tG
         RleipIfo9E2MCRLOEp1c1XIOs8XjXDXGpck83sSh2QAYh1eCMJOggHz5Tl2aA1A+jGVQ
         lNUA==
X-Forwarded-Encrypted: i=1; AJvYcCUh1YwVMCuSLI9CA76MEP600EGNNERL841m6Ya39j2kdWLTTyxfAafNwP9fsyauliySdXIJYpiA/Y0qyOP0PtdISF8qUx28PNG2ObImBXhpUkmpzQ6B9NaTOMPWEW4wqZ4vNfESfgk=
X-Gm-Message-State: AOJu0YzVLwBwNmZKkvM3jMES+EWaflxrG2s9QPcjk0xkoY0MyDtjRulA
	kJ2cPzw/u/K91tihz9Bn6r/4dmusKTZbhwg1ycCc5uQFJTAS6wYJ
X-Google-Smtp-Source: AGHT+IE0kN/ATp0XtOHlpEkNGSfsAHzZLZV+Ki8bifnpSHDIQZARfBa9Mlhn4h+hE0pT/2GjSI89Zg==
X-Received: by 2002:a50:ab5a:0:b0:56e:2d0c:6ed6 with SMTP id t26-20020a50ab5a000000b0056e2d0c6ed6mr6313316edc.41.1712659912586;
        Tue, 09 Apr 2024 03:51:52 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-007.fbsv.net. [2a03:2880:30ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id ij6-20020a056402158600b0056ddd9427d2sm5179868edb.58.2024.04.09.03.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:51:52 -0700 (PDT)
Date: Tue, 9 Apr 2024 03:51:50 -0700
From: Breno Leitao <leitao@debian.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: kuba@kernel.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, imitsyanko@quantenna.com,
	geomatsi@gmail.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] wifi: Un-embed ath10k and ath11k dummy netdev
Message-ID: <ZhUdxpnC+nMkNp+U@gmail.com>
References: <20240405122123.4156104-1-leitao@debian.org>
 <87y19r264m.fsf@kernel.org>
 <ZhPyRHHlVot+a8Xq@gmail.com>
 <87pluz24ap.fsf@kernel.org>
 <ZhRGo3I57rXxsMV/@gmail.com>
 <87edbe26qe.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edbe26qe.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_035158_643727_4BAE0A6A 
X-CRM114-Status: GOOD (  21.87  )
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

On Tue, Apr 09, 2024 at 01:03:21PM +0300, Kalle Valo wrote:
> Breno Leitao <leitao@debian.org> writes:
> 
> >> > Reading the issue, I am afraid that freeing netdev explicitly
> >> > (free_netdev()) might not be the best approach at the exit path.
> >> >
> >> > I would like to try to leverage the ->needs_free_netdev netdev
> >> > mechanism to do the clean-up, if that makes sense. I've updated the
> >> > ath11k patch, and I am curious if that is what we want.
> >> >
> >> > Would you mind testing a net patch I have, please?
> >> >
> >> >   https://github.com/leitao/linux/tree/wireless-dummy_v2
> >> 
> >> I tested this again with my WCN6855 hw2.0 x86 test box on this commit:
> >> 
> >> a87674ac820e wifi: ath11k: allocate dummy net_device dynamically
> >> 
> >> It passes my tests and doesn't crash, but I see this kmemleak warning a
> >> lot:
> >
> > Thanks Kalle, that was helpful. The device is not being clean-up
> > automatically.
> >
> > Chatting with Jakub, he suggested coming back to the original approach,
> > but, adding a additional patch, at the free_netdev().
> >
> > Would you mind running another test, please?
> >
> > 	https://github.com/leitao/linux/tree/wireless-dummy_v3
> >
> > The branch above is basically the original branch (as in this patch
> > series), with this additional patch:
> >
> > 	Author: Breno Leitao <leitao@debian.org>
> > 	Date:   Mon Apr 8 11:37:32 2024 -0700
> >
> > 	    net: free_netdev: exit earlier if dummy
> 
> I tested with the same ath11k hardware and this one passes all my
> (simple) ath11k tests, no issues found. I used this commit:
> 
> 1c10aebaa8ce net: free_netdev: exit earlier if dummy

Thank you so much for the test.

I will respin a v2 of this patchset with the additional patch included.

