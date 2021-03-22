Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD8DC433C1
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 21:40:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40EA261874
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 21:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40EA261874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sZDeulZToe/QKMEAKXEJzINWmWI6G0xZz2S6iIlC2Tk=; b=rPvtgInP2YuCsqDbF+5THTVXn
	6p2YUhP6Ev2/wljamT/izPilwt9pWENLBlG43an581TPIH1W39IbOQsP4XKQhjsBiwCtCcAEKGXdY
	BKJnl5qbScl2fxiIKxkH0VPXP8LSsSGTwMtOh/r523Aa97nFPzw6ThCtayRFpuISHYxHcRZAn3zjX
	7Qk8FEuPooaomCqRZfaz0dnBISBEnhtHiRawBrJ4bMA013HvuKdxgmmv4NZRP3UUSJfXXQCN2Nei5
	7xIG0M/pGBp59j9vzGFjWD8obz7qbLhj0sHRte9N2iEEdtdnQKqh0EAyH4tSEg0m2ChBOzONkrSmA
	ifK7vH4HA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOSHZ-00CbuN-Bl; Mon, 22 Mar 2021 21:40:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOSHS-00Cbsy-9x; Mon, 22 Mar 2021 21:40:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A21B619B1;
 Mon, 22 Mar 2021 21:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616449204;
 bh=ZjEe7Re0RKu002ndI22T8BlfDJ+aY+HHY+t9XvQS7Q8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bJZCpZ5EEGZerp3UrSyvokIM6nH3GPNLIsyJMJB5nyc4Sgnjtzn+OMtjUL2ZBSie+
 Fi83eey5HsMSKc/9qaD2RuZEeUeUwoE2M6qwk7wrSCjkj4ws8OGv18z8EyYcukmWHT
 jM35+ir6/srZfSH78DCRwpRXtTCanNR0ouNRk+r0zZqC9uicwbh5Vl6qVN2J0nC7fg
 yAR8A/u0nDcj41ohiNdL688eDQ2opEHdctaDOmgytVvpFgfvzBz92vFYBp5Nn21+zL
 vtNIUbcaOAFjelvCYqZ6uXvufN0DecSq4tETddYi+zxgAsQXGrS7YO4xRruhTqWyYj
 CraMDT8xmXxbw==
Received: by mail-ot1-f42.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so17483531otn.1; 
 Mon, 22 Mar 2021 14:40:04 -0700 (PDT)
X-Gm-Message-State: AOAM530F2tJZAoKVxItLJFds3/EFqKOkhqG8dZkAplMhdfj15nytlHBj
 Hvs6TqO71GhVxY043m4aX5I7EN/IroFG3xitL2Y=
X-Google-Smtp-Source: ABdhPJzNzw6/c6SVRTMWeDvzQfOYlqmnHJ7XZUtZKGXGAyd4E2bODGHMqyepsXMnLh1hlMatZvPmNE5xJdhqw6/8ZCE=
X-Received: by 2002:a9d:316:: with SMTP id 22mr1561463otv.210.1616449203436;
 Mon, 22 Mar 2021 14:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
In-Reply-To: <20210322202958.GA1955909@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 22 Mar 2021 22:39:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a10d8hgBiO5W=34oLqw8m22=Xi4C=MxVSY_fGnXZUJ3iA@mail.gmail.com>
Message-ID: <CAK8P3a10d8hgBiO5W=34oLqw8m22=Xi4C=MxVSY_fGnXZUJ3iA@mail.gmail.com>
Subject: Re: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
To: Ingo Molnar <mingo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Martin Sebor <msebor@gcc.gnu.org>, 
 Ning Sun <ning.sun@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, "the arch/x86 maintainers" <x86@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Kalle Valo <kvalo@codeaurora.org>, Simon Kelley <simon@thekelleys.org.uk>, 
 James Smart <james.smart@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 Anders Larsen <al@alarsen.net>, Tejun Heo <tj@kernel.org>,
 Serge Hallyn <serge@hallyn.com>, Imre Deak <imre.deak@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 tboot-devel@lists.sourceforge.net, 
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, ath11k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, 
 linux-scsi <linux-scsi@vger.kernel.org>, Cgroups <cgroups@vger.kernel.org>, 
 LSM List <linux-security-module@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_214011_023575_27247F7A 
X-CRM114-Status: GOOD (  17.28  )
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

On Mon, Mar 22, 2021 at 9:29 PM Ingo Molnar <mingo@kernel.org> wrote:
> * Arnd Bergmann <arnd@kernel.org> wrote:
> > From: Arnd Bergmann <arnd@arndb.de>

> This is indeed rather ugly - and the other patch that removes a debug
> check seems counterproductive as well.
>
> Do we know how many genuine bugs -Wstringop-overread-warning has
> caught or is about to catch?
>
> I.e. the real workaround might be to turn off the -Wstringop-overread-warning,
> until GCC-11 gets fixed?

See the [PATCH 0/11] message. The last two patches in the series are for
code that I suspect may be broken, the others are basically all false positives.

As gcc-11 is not released yet, I don't think we have to apply any of the
patches or disable the warning at the moment, but I posted all the patches
to get a better understanding on which of them should be addressed in
the kernel vs gcc.

       Arnd

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
