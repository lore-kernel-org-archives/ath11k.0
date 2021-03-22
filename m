Return-Path: <SRS0=owuj=IU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EDCC433DB
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 22:50:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7748E61972
	for <ath11k@archiver.kernel.org>; Mon, 22 Mar 2021 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7748E61972
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zZWLsuH6jeQrKUam8ivIhdaM/VvXNnsT6xFG3UAtchE=; b=f26wVrt/wUuse9wEsLOtz2dJT
	FPpPsvsRGn3T5g8WVIMoiunZAjVx01K6bOpj9KPvEKHLYidcf8bmEJ17hKY82E+mMbhmTJt6jWDaa
	SpKBUnDyDM9OnfxCIN5JSkMlrjSjpxzfwoQJGYxdte0dkdxCWauTu2e+BL4VPud0kbp+VpLgXzSNK
	4VQVLY4xOkMbGO4iKan16BGQr3hMxmFwRL/ffHDodpeBKnz6WlI+h9AFcKpWcUbJCiIPuwF2T6+/W
	HpJLInt62Mxh5Jjag1HYA2NL4UW/mARSQYz6OWIO45s9EdFeaVaQuOJs/mMwS78JVNSatZbez/vHU
	vS3drjY+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOTNK-00CkXL-QL; Mon, 22 Mar 2021 22:50:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOTNE-00CkUQ-MB; Mon, 22 Mar 2021 22:50:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6BB2619A9;
 Mon, 22 Mar 2021 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616453410;
 bh=uswimGLXSixuyDNhbT1lz8xZrWttoUKDID8KyDH0WG0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=amyVtju7uIURiCWdHdQflKk1Uy5uaUl0jSM14IOTPFAohfgjX6aNW2KNuxCJtYCAo
 Iq3iv0T/Fse0yOGtClBFW9lSZE7aaq5x8nvOG96GevRCer6irU7c+80RceV8EVJ5kx
 MyABhKHnqgLkwgPjFUcsT9rt5Ch7AD6xkqPlfErTbnJ16VSW7CL/8voAWgmiYiZP+2
 FNG8ibSI2xKBl+QJzXjnar4dGoW1lmiY/KAWQjWwKmqPmSQ5aiKJPzyqeCBCT+W6FE
 laR6EilYtVT8DnV5kJgvUwfjeNkVR5uJLU421n3+vr2W/G1PBIgRrNWzYxZ4T75LGD
 pwIqz5PKV+08w==
Received: by mail-oo1-f44.google.com with SMTP id
 j20-20020a4ad6d40000b02901b66fe8acd6so4498643oot.7; 
 Mon, 22 Mar 2021 15:50:10 -0700 (PDT)
X-Gm-Message-State: AOAM532VuBV39cm3Joi7qWa4H+fB/f/0TvJIMWDwzSQl7hbbX2E4ArtP
 YGCJzqJdkg0DmTki/MocTDjKUFv5UgVeCFjyHNY=
X-Google-Smtp-Source: ABdhPJyFT7IMFvy91F/uYGCzlkCC/fHWW2uOMBKkCcSHVU9m95IK8d72cGqN72gkARj9tN7bu2YOUo8AE/gjduOBJeY=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr1380770ooz.26.1616453409742; 
 Mon, 22 Mar 2021 15:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-3-arnd@kernel.org>
 <20210322202958.GA1955909@gmail.com>
 <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
In-Reply-To: <b944a853-0e4b-b767-0175-cc2c1edba759@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 22 Mar 2021 23:49:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0JW0AqQmHXaveD8za1np+W=Q3D4PuHnYKRd8UJqiwhsw@mail.gmail.com>
Message-ID: <CAK8P3a0JW0AqQmHXaveD8za1np+W=Q3D4PuHnYKRd8UJqiwhsw@mail.gmail.com>
Subject: Re: [PATCH 02/11] x86: tboot: avoid Wstringop-overread-warning
To: Martin Sebor <msebor@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
X-CRM114-CacheID: sfid-20210322_225014_364632_907B1658 
X-CRM114-Status: GOOD (  31.17  )
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

On Mon, Mar 22, 2021 at 11:09 PM Martin Sebor <msebor@gmail.com> wrote:
> On 3/22/21 2:29 PM, Ingo Molnar wrote:
> > * Arnd Bergmann <arnd@kernel.org> wrote:
> >
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
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overread
>    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=wstringop-overflow

Unfortunately, stringop-overflow is one of the warnings that is
completely disabled in the kernel at the moment, rather than
enabled at one of the user-selectable higher warning levels.

I have a patch series to change that and to pull some of these
into the lower W=1 or W=2 levels or even enable them by default.

To do this though, I first need to ensure that the actual output
is empty for the normal builds. I added -Wstringop-overflow to
the list of warnings I wanted to address because it is a new
warning and only has a dozen or so occurrences throughout the
kernel.

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
>
> diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
> index 4c09ba110204..76326b906010 100644
> --- a/arch/x86/kernel/tboot.c
> +++ b/arch/x86/kernel/tboot.c
> @@ -67,7 +67,9 @@ void __init tboot_probe(void)
>          /* Map and check for tboot UUID. */
>          set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
>          tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
> -       if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
> +       if (memcmp(&tboot_uuid,
> +                  (*(struct tboot* volatile *)(&tboot))->uuid,
> +                  sizeof(tboot->uuid))) {
>                  pr_warn("tboot at 0x%llx is invalid\n",

I think a stray 'volatile' would raise too many red flags here, but
I checked that the RELOC_HIDE() macro has the same effect, e.g.

@@ -66,7 +67,8 @@ void __init tboot_probe(void)

        /* Map and check for tboot UUID. */
        set_fixmap(FIX_TBOOT_BASE, boot_params.tboot_addr);
-       tboot = (struct tboot *)fix_to_virt(FIX_TBOOT_BASE);
+       /* RELOC_HIDE to prevent gcc warnings about NULL pointer */
+       tboot = RELOC_HIDE(NULL, fix_to_virt(FIX_TBOOT_BASE));
        if (memcmp(&tboot_uuid, &tboot->uuid, sizeof(tboot->uuid))) {
                pr_warn("tboot at 0x%llx is invalid\n", boot_params.tboot_addr);
                tboot = NULL;

     Arnd

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
