Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5470BCD4F39
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 05:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuzwaqTnGGM7aW7QOmJLmzcivKiPwogk91AON3LZsNM=; b=iP7yq9+6sOB9pobNXQ9lQ7Yj5t
	Uezx+fwmkWNpsiHRndtTt6Lwev+ObohYIxxgKxYHs0vm8ZXvIij7T9KtwTgIqs5bxqaBIlWffJkmC
	Ecwv2EjQvmIuFFd0MouHy/Yy/0JLgTyUGI8JwVwHRmRAqd+M/DfHRYEbNIG4tp/vhqAUSyOo/6Za5
	FWnKJFluEoMZKT9aaKiq5DxHQ+sK2GMwB4taw8AgKarYAisbCo4jJox6FPEDE6bd7VQqZ1fOdLRrO
	tm5oFCa+R4w4pGIKtw+yV4cewPH14HXzfHV0wnp3NBpb6VEciVHZJhguYmh2AfnaEBfNIf+5dJ8Lc
	v0qy9KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOCk-00000004aLs-3AZS;
	Thu, 14 May 2026 05:01:50 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNOCi-00000004aKj-1Ull
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 05:01:49 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-479d68a9063so2862656b6e.0
        for <ath11k@lists.infradead.org>; Wed, 13 May 2026 22:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778734907; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMhHX61PAv1HJed4cYxIAS8Lx/W5hfAG5us/GQrdZyjyAked0gbg7aOVemZsPj5XGZ
         OwGWHrTjoVYc2UZo4YxKsv5dNJQ+vWd9DwNzLIHpqN3ksJEvwn+noaEJkktSiWOFvBEF
         hqStHQ4HHHIMV8NP2Cpn0x/i3SjBOeBchR3ab65uXFGMVAz7H1ivOsfWbh0HqqFuRBuC
         TfxKtWr1G3kXLJ4IY78bG9BemOoSWdt39MePSPxg4bAKzSfdEP5cOCdofXVCwAhGm6jG
         rYDczpYJr8Hc8dUsRPUbayTTat6jU0C0qXAraYJMrgr9CkxY9/AfWGfx9KDVHZauOQ+7
         Vp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yuzwaqTnGGM7aW7QOmJLmzcivKiPwogk91AON3LZsNM=;
        fh=/Hg0Q/622Ycp6v2C5q84TCfYUpcwIWRc+73fiey10Ow=;
        b=RRpZ9O9kh/bimbucgI61mY6jBw/ogmsJUMZqR8L4/ayBpu+Gqg8CUOgPw4l8SzUEgd
         ARS6pAIGXkTRdlcsRQE135uB2HZ8tYSi0ZtG4YRx1mcFIDV/kEsfSRv3ecC88h24G3lE
         Y2EHabyHQ6aBFag8j4M8+feWy9QAvhb6mympXqCB7TEOVfucgjARsiUZAXSNroCVJKCp
         4QqEpQg8+zes96MqKM+h5yjaLpQSrQh4s4c2ANr9FRtn6sheZ8RrcsAXNgOUHmKeaxmn
         3mHDPSsxQoMXsqLqouE8xhJnhJniJVfPm1CwKhvEDjpynDCzouX4ObBC6OsL063XdqVO
         uYKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778734907; x=1779339707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuzwaqTnGGM7aW7QOmJLmzcivKiPwogk91AON3LZsNM=;
        b=AUAsS6WFZDOCXrQe4Jt5PEiQq12GlP/aYzXRQUEtmviJumKsXBV1B2DnfkTL0d+O04
         z/Hmcx94n0/mNF/eLN4wTF9jY3zxdz3ckLBIipImayyJ6994t5Tk/T67TQuPvCgySC4o
         Vs9pO2J+yB0dPIZRBAMvxyfR/w3XC6aK6MeNXqMfHpRwHSot/8MzwVfaeIQCcTxsmZL/
         /K9zlcGzWch81b4VQX4oT47+6lmcRFOkgjv/pnUNEKxCYM4F067rA2T/ZjIWRAM5gj0N
         v0rwbRvzpHWis2J3ZNcaesPl44vg51OHKthnvLJ6nA8sQayqkEImfFWjusgPi6su50iq
         Sb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778734907; x=1779339707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yuzwaqTnGGM7aW7QOmJLmzcivKiPwogk91AON3LZsNM=;
        b=IezM/b1VeHjtPzp4spVgNRmIY2p5SATbJTGJAgox6NGUjwgHjy1ASgFLEqRFSpQ9wK
         Wqi/hH3tm1bLMvYQqJ3YXb0dvdRN8+Y0O8/O9erXJCEgqfPcilLQLu6jGt6wHhiobmNg
         /mnmHguHrL47yUtalewKV7Pulb4D8iWEwGWxc835hK0yNxbpU7XgVihH8FYWEtQVZm3t
         2glEHpLuO+nwJYo9kUHYnXef3BEAazkgsrE4l+SysMa/lBx38BLTfmrfBSOdZHr4pvez
         YUm5RbtbrVmD9WbkG+2bFgSt8WjX5wzwmuzLbylFlj20JnbhIYQWGEIOXyk14z8McpBb
         GAqg==
X-Forwarded-Encrypted: i=1; AFNElJ+HupI0ev0TZqclh2VQ5iHkfN3cq5492m7wAdQE36P6/P+tBXsck9wqPxDzA6WoZ3sfc3W2Wxg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKupp04wlQ4FElOeLf4paoZDCkacPynEfHsYQSJPdU78TFByAI
	p9/t1eUuTwqN8O20uN/SvcEBSxymcQqaWw7kuRaohU3fHSbntsIFOhgua4C8mr2d0nU/HzHEsTz
	wcrQM2/p3vigYOuirNoEIMziG3S+CWts=
X-Gm-Gg: Acq92OHh1hnOYrNrzEQFqD+zYoPMyQLwaJckfE+2ObFn2NOcowHX+UfXlmMm0b4SL7+
	vLSHUoP3uFNey7A6gXeFSgCIE4e4nnbKp5h7DAnojcXQF+apDGtX+WzR+IlPyMh9Exh2KZuEONA
	r7H0hmbhLcwgVVZVlB/Ss3khxVO5kvijvsKEQlo07HgSQodRFm73n/E7YLT1CLxhHhmWZQmoz5+
	xCv3jlH5a3/5OUxTm7ch4A9I5/pPJgugvzrUXM5k6+O1xnzvrEH4jETcFGHxTPWNf0yxIKna/Vc
	x4iYmACDk96ZU2sX0VUrzc+VmU2rD8VGGqNzb8ncWmMZC3r1YA==
X-Received: by 2002:a05:6808:144d:b0:460:f435:2aa1 with SMTP id
 5614622812f47-482b2e43247mr3644664b6e.46.1778734906908; Wed, 13 May 2026
 22:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260506200249.317690-1-santiagorr@riseup.net>
 <45f1c979-ea8d-4118-8551-eff93966b4e1@oss.qualcomm.com> <CAOPSVF29ofKi8fpmJxuq9F5uQXHe4RrFvGb2V-odGMNA77NWXw@mail.gmail.com>
 <agS7fr8mDI9TLpvh@voleno>
In-Reply-To: <agS7fr8mDI9TLpvh@voleno>
From: Kyle Farnung <kfarnung@gmail.com>
Date: Wed, 13 May 2026 22:01:35 -0700
X-Gm-Features: AVHnY4KMie7IknPXt13rC7yQCXAqPuhefYjAM7GsLBndz1dWNFxsmaiUpDup55s
Message-ID: <CAOPSVF2xwpR63MmngbG06_wPtQe2tOoVe87fanzXGRHBeJGYUA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath11k: Add two missing Lenovo IDs to the quirk table
To: =?UTF-8?Q?Santiago_Ruano_Rinc=C3=B3n?= <santiagorr@riseup.net>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kfarnung@outlook.com, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_220148_407661_BC5730D7 
X-CRM114-Status: GOOD (  38.83  )
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

On Wed, May 13, 2026 at 10:57=E2=80=AFAM Santiago Ruano Rinc=C3=B3n
<santiagorr@riseup.net> wrote:
>
> El 12/05/26 a las 20:30, Kyle Farnung escribi=C3=B3:
> > On Tue, May 12, 2026 at 5:03=E2=80=AFPM Jeff Johnson
> > <jeff.johnson@oss.qualcomm.com> wrote:
> > >
> > > On 5/6/2026 12:54 PM, Santiago Ruano Rinc=C3=B3n wrote:
> > > > Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for q=
uirk
> > > > table") added some Lenovo platform IDs to the quirk table to addres=
s a
> > > > wakeup from suspend issue [1].  However, at least P14s Gen 5 AMD, a=
s
> > > > reported by Kyle Farnung [2], and P14s Gen 3 AMD are missing in the
> > > > table.  This commit adds the two corresponding Lenovo version IDs f=
or
> > > > each.
> > > >
> > > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196
> > > > [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196#c23
> > > >
> > > > Tested-on: P14s G3 AMD running 7.0.3.
> > > >
> > > > Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on ma=
chine model")
> > > > Co-authored-by: Kyle Farnung <kfarnung@gmail.com>
> > >
> > > This is not a standard Linux kernel commit tag.
> > > Co-developed-by: could be used, but I'd need a Signed-off-by: from Ky=
le
> > >
> > > Kyle, if you'd like these added please reply with both a Co-developed=
-by and
> > > a Signed-off-by tag
> >
> > I re-tested the bug behavior on the v7.0.4 tag and found that I'm not a=
ble
> > to reproduce it on my device. I put the device to sleep and then unplug=
ged
> > and replugged power; it never woke up until I intentionally woke it.
> >
> > Based on discussion in [3], I narrowed my issue with wi-fi disassociati=
on
> > on wake to a suspect commit [4]. I'm developing a patch that clears the=
 rdp
> > and wrp buffers during wake to clear out any stale state in the LMAC ri=
ngs.
> > I'll submit that once I'm done testing it.
> >
> > Santiago: Are you seeing the sleep/wake bug from [1] or something simil=
ar
> > to what I was seeing around disconnections on wake?
>
> I was seeing wifi issues after wake-up, including disassociations, as
> described at https://bugs.debian.org/1132343.

Thanks for the confirmation. I went ahead and submitted a patch for the
suspected SRNG restart issue in [5].

For my P14s Gen 5 AMD, I don't think the PM quirk is the right fix at
this point, so please don't include the 21ME/21MF IDs on my account for
now. This new patch seems like a better match for the disassociation
issue I was seeing after resume.

Please try it out if you have a chance. I've done around 12 sleep/wake
cycles so far without issue.

[5] https://lore.kernel.org/all/20260513-kfarnung-ath11k-srng-clear-pointer=
-state-v1-1-bc700dd8b333@gmail.com/

>
> >
> > [3] https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=3Do9wVcF=
Mc6f-yhmSBcZqQ@mail.gmail.com/
> > [4] 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and
> > re-initialize again")
> >
> > >
> > > I can apply these fixes when I process the patch in my tree.
> > >
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l#when-to-use-acked-by-cc-and-co-developed-by
> > >
> > > > Signed-off-by: Santiago Ruano Rinc=C3=B3n <santiagorr@riseup.net>
> > > > ---
> > > > Changes in v2:
> > > > - Merged the Lenovo P14s G5 AMD #1 and #2 related changes proposed =
by
> > > >   Kyle Farnung in
> > > >   https://lore.kernel.org/all/20260330-p14s-pm-quirk-v2-1-ef18ce079=
96b@gmail.com/
> > > > - Added Kyle Farnung as Co-author of the commit
> > > > - Added the second ID of Lenovo P14s G3 AMD, and adapt the comments
> > > >   accordingly
> > > > - v1: https://lore.kernel.org/ath11k/20260423211458.458911-1-santia=
gorr@riseup.net/
> > > > ---
> > > >  drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++=
++++
> > > >  1 file changed, 28 insertions(+)
> > > >
> > > > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/w=
ireless/ath/ath11k/core.c
> > > > index 3f6f4db5b7ee..c1ce0a11af44 100644
> > > > --- a/drivers/net/wireless/ath/ath11k/core.c
> > > > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > > > @@ -957,6 +957,20 @@ static const struct dmi_system_id ath11k_pm_qu=
irk_table[] =3D {
> > > >                       DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
> > > >               },
> > > >       },
> > > > +     {
> > > > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > > > +             .matches =3D { /* P14s G3 AMD #1 */
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21J5"),
> > > > +             },
> > > > +     },
> > > > +     {
> > > > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > > > +             .matches =3D { /* P14s G3 AMD #2 */
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
> > > > +             },
> > > > +     },
> > > >       {
> > > >               .driver_data =3D (void *)ATH11K_PM_WOW,
> > > >               .matches =3D { /* P14s G4 AMD #1 */
> > > > @@ -971,6 +985,20 @@ static const struct dmi_system_id ath11k_pm_qu=
irk_table[] =3D {
> > > >                       DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
> > > >               },
> > > >       },
> > > > +     {
> > > > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > > > +             .matches =3D { /* P14s G5 AMD #1 */
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
> > > > +             },
> > > > +     },
> > > > +     {
> > > > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > > > +             .matches =3D { /* P14s G5 AMD #2 */
> > > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
> > > > +             },
> > > > +     },
> > > >       {
> > > >               .driver_data =3D (void *)ATH11K_PM_WOW,
> > > >               .matches =3D { /* T16 G2 AMD #1 */
> > >

