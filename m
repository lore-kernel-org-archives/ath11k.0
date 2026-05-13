Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8584CD343F
	for <ath11k@archiver.kernel.org>; Wed, 13 May 2026 03:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkJHePA5ylc7DrllEguE7yS7MQQUyp0sxg23OnXjj2s=; b=x4PKy6yunwdxkdeaI1v9FJZ+Ok
	8l4AuLxeR8rkIaMtzhTZMbIeKlZew14sKddSfx0xxuMFaq5D7B/fUfeiWYOVaUYs1KXQx27YGu8js
	iPRC+WGxLktyHNrRZ0leRC5zCNxwFhv9JrHoaT36PjhzpDmEYpDhGigrE9N7mtn9PVH8Z6QZjRr1H
	IiQzVIBq4kryGlhwVyNoL57osSoTTA00ecF1lbZxXXxSg+M0Kjrr7pOvyG4qXoAniTiZV9b2iE8Th
	/RewE92m8ilmEaOtjEjV7XyFiMRvQvaspBFedZY1Y2PbiF3Yj5vObLYKwdNz1vmAiKyXykKbDg1Td
	F/CHZMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0JT-000000013BP-0Tas;
	Wed, 13 May 2026 03:31:11 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN0JQ-000000013Ao-1oDk
	for ath11k@lists.infradead.org;
	Wed, 13 May 2026 03:31:09 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7dcdaf06498so4217846a34.2
        for <ath11k@lists.infradead.org>; Tue, 12 May 2026 20:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778643067; cv=none;
        d=google.com; s=arc-20240605;
        b=WgNa46BwfumE+gDzsf2pY0lEZE570qfnzOepfE9hGOekbLo2+n+F+9xsXlHFBfNyAs
         ky6icLbynZc4XTC27POF2cA7EscZJpyD/ep9yX/FnZ8eaOW8GFxZNXe9DxPYAA5SV3C7
         B0vczIUypIDMcZ+jrKbUXBpjUcsQS7fQcurVLS1p/bfhxvbOODVlA9kVLgd7vQNYEBiU
         F5PUriQDbBdphwmZaR8sSWLQ4ubTWxibToM329GO6KkH6BD/zzZLENXFGyd00+fvt9IO
         0D+bBx3eXrSknCh8gjED9XqQDL1slWhNUt+EmnNQ+WrgrnadgfHLjRaT0Kud0f1CoAjo
         2nHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mkJHePA5ylc7DrllEguE7yS7MQQUyp0sxg23OnXjj2s=;
        fh=yRRb9Z8Q2NouDeyJ4GfhuNtkTguUiu3zJbt2sJfrgGg=;
        b=HL/IvRD4IQgTScUqqCoVEg1nd9WEdLMtyRLy2SFNLOkEekltp2ykvkKQ4a7cDYb34d
         QHXKRAH0A84kuvFxMqBl8DLfmyOPdoHrPec4LGBukxluPKthVw0NmVH6O/FUCCBKF7FP
         k+uz3wIacMhp4F6497ELabPHqhWioMbEM1/kO8CbcHtTXyiNqt8Cig9c2wvkV9ZVSXUe
         fTEplstwto+pOkQrfBwsAyV2XNqwkTtsCL4xMmAYinxVX/C9b06y2TOA6YAsVYNLCs96
         Ayk2yIDtQlqrptcXXwx0f6PEFFM4dJ/NNei6bM6gKVUH6a7ZMKeLtqtMvYpzgPO3W5/s
         eIaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778643067; x=1779247867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkJHePA5ylc7DrllEguE7yS7MQQUyp0sxg23OnXjj2s=;
        b=lKjRNhSIn4+7O7PBmvNheLSTgDU6Fky6gA/yKaF6su8c86MKhIlUI9Ew9JNCoE8B/6
         XTCCPMJl2zMIRXlOLCn7x09qnZ/er+PP/7WmE2rpWYRPRjx1j3ASFkHdJQJ1hcI9OoXi
         amPii8Sl8KtCmnCA22Xnu+wGun7n8PI3KmrcXmlD/kmFa0xCh1as5KFWRsJZx/3GtrhP
         Pj8NnkU3JPalSL9KqAGSaC451xa6V51sOK0fJ7NZARx6YTvcup3FGZzR5tmT2GZWXHeJ
         jxObsmKQUfCjqThVdZaN8HAfJI0e8DyvxKSVubwN27y8uVaUM0aH7iIo8m6ZnQYoLBSe
         HWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778643067; x=1779247867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkJHePA5ylc7DrllEguE7yS7MQQUyp0sxg23OnXjj2s=;
        b=QVU/rXBkkZzV/6LKoUdrxW67DOKFNsxJ5uE+szu5qhWCaZwyZPAUbnaw3W95jhrSUU
         wQpkz4ShakRq/q5061IFdiIWGs3alqmj/PZNXaI6qfh9zTtuW5zR3kjzEMySut599qJc
         iV7hhduR8DwDvBpYcDRACPqOPV9J7QEQz8reZBPXgu5YK21613S0YynVowiWeDd3hNIX
         PwKHuN8iputhadCvHJtavLl/dsOajETP04ApaxO7YC6hxIZscZunUKGD/1DpLURG8FQa
         y/mOFoy5dVC6tX2Hqf1NmLQFRS2OUbis9w/WBHlPw59CRRzlT8IaS8/PqMS9ZCcU7ygl
         Vong==
X-Forwarded-Encrypted: i=1; AFNElJ9FDGN2c1ceZl3cbFKo+Tv1IuGx2Ae8adNhpVNFhxzNk6GSVwrqh8hJm5FMgNGKL29t3QNbnoI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBcCF5d6+7zqNQ0fCD4SmpbgU02NO06d2zPGndQ/h94SO5WQ4N
	iWHYlWAhdqDmF4Cimt94MokHcR5TYxgTSh3wEIDRfApyAoMgAILM5I+ihaUqjzX8/GVJbpfx1Y+
	rUDSUEYeK45tyUstN2S5WHch8fSEkjQVNu8NzVV8=
X-Gm-Gg: Acq92OEIYoLdK+rpESRoqWGSIIlABWRu6DvW7YBJZYaQ0MM/9iZerSFhoDXpaVUXUla
	vrvqD5nlzWhiUFIDeLc2afH/UwC9Q/gX4RDg6ibGBQg6thUT5ZfQ362Dku9j/0rOglV1Y85gekW
	v9DsIcs/5qNVU6LzNhMrDMPSQotpv5qrFbCHTh33hwuU3xsVB11HpzTb1Mga/VOCEZEGQGoG8Se
	eZcGhzNfg7Gi37STbx+uFkqQlQtvXynuBpWu/5hmrLe0bM/mplQkf51QfW+JDHxnunz4O6UVyhB
	xiJCn+u9zpHdBcxhlHQWUJOCvgBIWL1cTnaAMrY=
X-Received: by 2002:a05:6830:3697:b0:7e3:7f84:4cf9 with SMTP id
 46e09a7af769-7e3da0cefcamr1048436a34.11.1778643067157; Tue, 12 May 2026
 20:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260506200249.317690-1-santiagorr@riseup.net> <45f1c979-ea8d-4118-8551-eff93966b4e1@oss.qualcomm.com>
In-Reply-To: <45f1c979-ea8d-4118-8551-eff93966b4e1@oss.qualcomm.com>
From: Kyle Farnung <kfarnung@gmail.com>
Date: Tue, 12 May 2026 20:30:55 -0700
X-Gm-Features: AVHnY4LEQy64KrKEqNOZLc_Lh90vHXqKfZK_pa-aabTj8o44CzX52CeEkWtIEYo
Message-ID: <CAOPSVF29ofKi8fpmJxuq9F5uQXHe4RrFvGb2V-odGMNA77NWXw@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath11k: Add two missing Lenovo IDs to the quirk table
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: =?UTF-8?Q?Santiago_Ruano_Rinc=C3=B3n?= <santiagorr@riseup.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kfarnung@outlook.com, Mark Pearson <mpearson-lenovo@squebb.ca>, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_203108_483014_C363577E 
X-CRM114-Status: GOOD (  27.58  )
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

On Tue, May 12, 2026 at 5:03=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 5/6/2026 12:54 PM, Santiago Ruano Rinc=C3=B3n wrote:
> > Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for quirk
> > table") added some Lenovo platform IDs to the quirk table to address a
> > wakeup from suspend issue [1].  However, at least P14s Gen 5 AMD, as
> > reported by Kyle Farnung [2], and P14s Gen 3 AMD are missing in the
> > table.  This commit adds the two corresponding Lenovo version IDs for
> > each.
> >
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196
> > [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196#c23
> >
> > Tested-on: P14s G3 AMD running 7.0.3.
> >
> > Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machin=
e model")
> > Co-authored-by: Kyle Farnung <kfarnung@gmail.com>
>
> This is not a standard Linux kernel commit tag.
> Co-developed-by: could be used, but I'd need a Signed-off-by: from Kyle
>
> Kyle, if you'd like these added please reply with both a Co-developed-by =
and
> a Signed-off-by tag

I re-tested the bug behavior on the v7.0.4 tag and found that I'm not able
to reproduce it on my device. I put the device to sleep and then unplugged
and replugged power; it never woke up until I intentionally woke it.

Based on discussion in [3], I narrowed my issue with wi-fi disassociation
on wake to a suspect commit [4]. I'm developing a patch that clears the rdp
and wrp buffers during wake to clear out any stale state in the LMAC rings.
I'll submit that once I'm done testing it.

Santiago: Are you seeing the sleep/wake bug from [1] or something similar
to what I was seeing around disconnections on wake?

[3] https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=3Do9wVcFMc6f=
-yhmSBcZqQ@mail.gmail.com/
[4] 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and
re-initialize again")

>
> I can apply these fixes when I process the patch in my tree.
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#wh=
en-to-use-acked-by-cc-and-co-developed-by
>
> > Signed-off-by: Santiago Ruano Rinc=C3=B3n <santiagorr@riseup.net>
> > ---
> > Changes in v2:
> > - Merged the Lenovo P14s G5 AMD #1 and #2 related changes proposed by
> >   Kyle Farnung in
> >   https://lore.kernel.org/all/20260330-p14s-pm-quirk-v2-1-ef18ce07996b@=
gmail.com/
> > - Added Kyle Farnung as Co-author of the commit
> > - Added the second ID of Lenovo P14s G3 AMD, and adapt the comments
> >   accordingly
> > - v1: https://lore.kernel.org/ath11k/20260423211458.458911-1-santiagorr=
@riseup.net/
> > ---
> >  drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wirel=
ess/ath/ath11k/core.c
> > index 3f6f4db5b7ee..c1ce0a11af44 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -957,6 +957,20 @@ static const struct dmi_system_id ath11k_pm_quirk_=
table[] =3D {
> >                       DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
> >               },
> >       },
> > +     {
> > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > +             .matches =3D { /* P14s G3 AMD #1 */
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21J5"),
> > +             },
> > +     },
> > +     {
> > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > +             .matches =3D { /* P14s G3 AMD #2 */
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
> > +             },
> > +     },
> >       {
> >               .driver_data =3D (void *)ATH11K_PM_WOW,
> >               .matches =3D { /* P14s G4 AMD #1 */
> > @@ -971,6 +985,20 @@ static const struct dmi_system_id ath11k_pm_quirk_=
table[] =3D {
> >                       DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
> >               },
> >       },
> > +     {
> > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > +             .matches =3D { /* P14s G5 AMD #1 */
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
> > +             },
> > +     },
> > +     {
> > +             .driver_data =3D (void *)ATH11K_PM_WOW,
> > +             .matches =3D { /* P14s G5 AMD #2 */
> > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
> > +             },
> > +     },
> >       {
> >               .driver_data =3D (void *)ATH11K_PM_WOW,
> >               .matches =3D { /* T16 G2 AMD #1 */
>

