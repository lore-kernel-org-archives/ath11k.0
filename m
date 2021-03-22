Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5459AC433DB
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 23:13:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E79D26199F
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 23:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E79D26199F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q1XuqSDr7gi7lkYQ0UeH2ql40KeTWH1ItFYJHkyZW6E=; b=BIFbKAtiC6z0NxpxwjruKHoRB
	6NeokVvee7ugF1AP+qZA/ul1VpKM+hzzf6msf1H6FBt1W+PFI/Se7k2W1OcR3BNyA1FcdxLcb5gv5
	jBjVDdbMTkbH6WKBL6DRBHAfFRPfdiKmGylTyvjOXrygUVtEvOVp/Q7RHbMuu0rj9QBhmm9uk/ZOh
	GiwOlyg27RXwWI10LlJK85z/8um5WzE3O6tifT42tzS2Am+Y663+zUsd1ncTgLBg773sIJZ+PH6Im
	l4D6hsx8s++OvmC1TL97T06VjD3g9dyW3QVfucqdu8TSYQZaYMvhu1q2wXfpN6DL7U2a5XlpTBsMY
	vJHd+jSqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOTk3-00CpDh-Rq; Mon, 22 Mar 2021 23:13:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOTjt-00CpAA-D4; Mon, 22 Mar 2021 23:13:39 +0000
Received: by mail-wr1-x42c.google.com with SMTP id c8so5959775wrq.11;
 Mon, 22 Mar 2021 16:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tYvb3I5DkX3N6jN+5U7mg9SkFokyTC7DYO1POXsmyXA=;
 b=JAukgRqBFlBqYxoTg07QIe3L0u4Zd4pnU8/KawSiQ9CobCuM3gzIOiljfx6LuzgDWA
 UowTprAJ6pvQSXvs4KSQRoxyhk97bRV/HvA6p2Z7/U2jyU55VRoMchp/WW94qOWwfctx
 xjztqDCBK6KyOMwxPOwi4e26tFik5N8gD8ME46WI4P9N9+IGYjmYXftjUoCOmT9YRUhI
 oxS7NQe6LKxh0Fe3YkrHljuKHXVZGAd59GORjepGb1sCy/oTzRkzKEYxW8PIJ/sFr1d6
 zI5HyhOjX7JC0HU1eEG4mNxiJ04gBc9w35eUnfsZO8LW67/ihxMVwREYJPst2Xb0XGu3
 JGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=tYvb3I5DkX3N6jN+5U7mg9SkFokyTC7DYO1POXsmyXA=;
 b=hR1GDrpvTdnJXhIiEmTr6Y8CyE7vh+ER76hVkKgO/gund/DsDrvCd1NeheKW5uPJHG
 Ew+M1oKw0N7iW+nqq/y0mgGXbpAgXNlCGSX4UEAFo2dKTPeiGapfBmfGSGXVktEPD9kR
 zCKs7iCdsgswKBHK4zPlOMmDESwvBdFlCsmcghY+R04CrlYAp083fqmDQRASTqJJNqN4
 bEqRvvHCjTTaCHvHfMB3fD/q2R+Kks4c+Phn/QEeDclgp0+GrI/E3FBXIuVPkYK0U1PI
 CyYtpvYfYuxD0MY2T9mFj2pdg6O3XcECgXGYrY98aKnEtJsH6ZrPgG2MRclyoqZGYlMQ
 4JFg==
X-Gm-Message-State: AOAM531rt2fgLJay5D01B9BTnk1ZSo9VwOomP7+ZeyP7Yvjl/LjDq6IW
 H66hnX2DXXdltjnW8h60yAE=
X-Google-Smtp-Source: ABdhPJwD5sKWkDZI+WUiEv9LaU8t0tl7e3Sco91hCCQ6VjFxt+KbUyFjpi5+6SIPcvWKZoMwC1DUgg==
X-Received: by 2002:adf:b642:: with SMTP id i2mr867183wre.8.1616454815721;
 Mon, 22 Mar 2021 16:13:35 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id w6sm20916828wrl.49.2021.03.22.16.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:13:35 -0700 (PDT)
Date: Tue, 23 Mar 2021 00:13:32 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Martin Sebor <msebor@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Martin Sebor <msebor@gcc.gnu.org>, Ning Sun <ning.sun@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>,
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 tboot-devel@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, cgroups@vger.kernel.org,
 linux-security-module@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
Message-ID: <20210322231332.GA1984184@gmail.com>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
 <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_231337_506440_3B2B4446 
X-CRM114-Status: GOOD (  22.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


* Martin Sebor <msebor@gmail.com> wrote:

> > I.e. the real workaround might be to turn off the -Wstringop-overread-warning,
> > until GCC-11 gets fixed?
> 
> In GCC 10 -Wstringop-overread is a subset of -Wstringop-overflow.
> GCC 11 breaks it out as a separate warning to make it easier to
> control.  Both warnings have caught some real bugs but they both
> have a nonzero rate of false positives.  Other than bug reports
> we don't have enough data to say what their S/N ratio might be
> but my sense is that it's fairly high in general.
> 
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overread
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overflow
> 
> In GCC 11, all access warnings expect objects to be either declared
> or allocated.  Pointers with constant values are taken to point to
> nothing valid (as Arnd mentioned above, this is to detect invalid
> accesses to members of structs at address zero).
> 
> One possible solution to the known address problem is to extend GCC
> attributes address and io that pin an object to a hardwired address
> to all targets (at the moment they're supported on just one or two
> targets).  I'm not sure this can still happen before GCC 11 releases
> sometime in April or May.
> 
> Until then, another workaround is to convert the fixed address to
> a volatile pointer before using it for the access, along the lines
> below.  It should have only a negligible effect on efficiency.

Thank you for the detailed answer!

I think I'll go with Arnd's original patch - which makes the code a 
slightly bit cleaner by separating out the check_tboot_version() check 
into a standalone function.

The only ugly aspect is the global nature of the 'tboot' pointer - but 
that's a self-inflicted wound.

I'd also guess that the S/N ratio somewhat unfairly penalizes this 
warning right now, because the kernel had a decade of growing real 
fixes via other efforts such as static and dynamic instrumentation as 
well.

So the probability of false positive remaining is in fact higher, and 
going forward we should see a better S/N ratio of this warning. Most 
of which will never be seen by upstream maintainers, as the mishaps 
will stay at the individual developer level. :-)

Thanks,

	Ingo

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
