Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D129DCD4F21
	for <ath11k@archiver.kernel.org>; Wed, 13 May 2026 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uu0Ury0RB4Jz8n9cKBHsi6ncR/kg9AlVj4sjmyqoarQ=; b=zvkYjYl6ZNgDvGuFEkuAeD3fnW
	ip5Zt9kL9nTQFaLOFBI9nVCsNbAxrN2OcQxHVXxHpj9omgJjbpZyDHhMR8Te3n0/yDRzsVUtXJ/As
	Gkme6Ed00Fgy4gk1cFj0g5gye1r1N/vWuXULomgdKMCOXmQ8Cl+xQ2gUC5b/OxvbPZzlpAqf7jyCE
	vzls/gOZTbIIBTqT9NAvXO8QETwnDgPGVFXPG71cAbBD3J72p7CGANxmV6BflibJQ6NO8n87N7qVV
	f6Ia1yesPKcY6rD64ZRrSggPUl8pyHJR9h3ii5Fs3OMDSkRQpZZqGxamG8yM9SZmEq5I5BBkNcenk
	YmTi54FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDpw-00000003PSn-2qxl;
	Wed, 13 May 2026 17:57:36 +0000
Received: from mx1.riseup.net ([198.252.153.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDpu-00000003PRn-1mv4
	for ath11k@lists.infradead.org;
	Wed, 13 May 2026 17:57:36 +0000
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4gG1Pz13rtzDtMg;
	Wed, 13 May 2026 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1778695047; bh=Uu0Ury0RB4Jz8n9cKBHsi6ncR/kg9AlVj4sjmyqoarQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQkgR1YSoPPecXK7tPD2J+PWn9Lo27uUCM/PructzgOmUzWI1yRMnxQw10PLe0vV+
	 r/KKAx0EepIwxhKVeW/8HmEf9IP8aIehQqJZkqY4MZviI4O4qUHoFlTQnL61OZoaay
	 6Bojo3j80wrVNtDjlhxW5zVzc5C3fnJSTlmT8bQ4=
X-Riseup-User-ID: FDEA97DCFEFD1AD42A6E284BEB520E068F61E67A59937672D6FCB631F4E492EE
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4gG1Px56s6z1yhC;
	Wed, 13 May 2026 17:57:25 +0000 (UTC)
Date: Wed, 13 May 2026 14:57:18 -0300
From: Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= <santiagorr@riseup.net>
To: Kyle Farnung <kfarnung@gmail.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	kfarnung@outlook.com, Mark Pearson <mpearson-lenovo@squebb.ca>,
	koike@igalia.com
Subject: Re: [PATCH v2] wifi: ath11k: Add two missing Lenovo IDs to the quirk
 table
Message-ID: <agS7fr8mDI9TLpvh@voleno>
References: <20260506200249.317690-1-santiagorr@riseup.net>
 <45f1c979-ea8d-4118-8551-eff93966b4e1@oss.qualcomm.com>
 <CAOPSVF29ofKi8fpmJxuq9F5uQXHe4RrFvGb2V-odGMNA77NWXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPSVF29ofKi8fpmJxuq9F5uQXHe4RrFvGb2V-odGMNA77NWXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_105734_544831_4067B536 
X-CRM114-Status: GOOD (  33.53  )
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

El 12/05/26 a las 20:30, Kyle Farnung escribió:
> On Tue, May 12, 2026 at 5:03 PM Jeff Johnson
> <jeff.johnson@oss.qualcomm.com> wrote:
> >
> > On 5/6/2026 12:54 PM, Santiago Ruano Rincón wrote:
> > > Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for quirk
> > > table") added some Lenovo platform IDs to the quirk table to address a
> > > wakeup from suspend issue [1].  However, at least P14s Gen 5 AMD, as
> > > reported by Kyle Farnung [2], and P14s Gen 3 AMD are missing in the
> > > table.  This commit adds the two corresponding Lenovo version IDs for
> > > each.
> > >
> > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
> > > [2] https://bugzilla.kernel.org/show_bug.cgi?id=219196#c23
> > >
> > > Tested-on: P14s G3 AMD running 7.0.3.
> > >
> > > Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")
> > > Co-authored-by: Kyle Farnung <kfarnung@gmail.com>
> >
> > This is not a standard Linux kernel commit tag.
> > Co-developed-by: could be used, but I'd need a Signed-off-by: from Kyle
> >
> > Kyle, if you'd like these added please reply with both a Co-developed-by and
> > a Signed-off-by tag
> 
> I re-tested the bug behavior on the v7.0.4 tag and found that I'm not able
> to reproduce it on my device. I put the device to sleep and then unplugged
> and replugged power; it never woke up until I intentionally woke it.
> 
> Based on discussion in [3], I narrowed my issue with wi-fi disassociation
> on wake to a suspect commit [4]. I'm developing a patch that clears the rdp
> and wrp buffers during wake to clear out any stale state in the LMAC rings.
> I'll submit that once I'm done testing it.
> 
> Santiago: Are you seeing the sleep/wake bug from [1] or something similar
> to what I was seeing around disconnections on wake?

I was seeing wifi issues after wake-up, including disassociations, as
described at https://bugs.debian.org/1132343.

> 
> [3] https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com/
> [4] 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and
> re-initialize again")
> 
> >
> > I can apply these fixes when I process the patch in my tree.
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
> >
> > > Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
> > > ---
> > > Changes in v2:
> > > - Merged the Lenovo P14s G5 AMD #1 and #2 related changes proposed by
> > >   Kyle Farnung in
> > >   https://lore.kernel.org/all/20260330-p14s-pm-quirk-v2-1-ef18ce07996b@gmail.com/
> > > - Added Kyle Farnung as Co-author of the commit
> > > - Added the second ID of Lenovo P14s G3 AMD, and adapt the comments
> > >   accordingly
> > > - v1: https://lore.kernel.org/ath11k/20260423211458.458911-1-santiagorr@riseup.net/
> > > ---
> > >  drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >
> > > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> > > index 3f6f4db5b7ee..c1ce0a11af44 100644
> > > --- a/drivers/net/wireless/ath/ath11k/core.c
> > > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > > @@ -957,6 +957,20 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
> > >                       DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
> > >               },
> > >       },
> > > +     {
> > > +             .driver_data = (void *)ATH11K_PM_WOW,
> > > +             .matches = { /* P14s G3 AMD #1 */
> > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21J5"),
> > > +             },
> > > +     },
> > > +     {
> > > +             .driver_data = (void *)ATH11K_PM_WOW,
> > > +             .matches = { /* P14s G3 AMD #2 */
> > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
> > > +             },
> > > +     },
> > >       {
> > >               .driver_data = (void *)ATH11K_PM_WOW,
> > >               .matches = { /* P14s G4 AMD #1 */
> > > @@ -971,6 +985,20 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
> > >                       DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
> > >               },
> > >       },
> > > +     {
> > > +             .driver_data = (void *)ATH11K_PM_WOW,
> > > +             .matches = { /* P14s G5 AMD #1 */
> > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21ME"),
> > > +             },
> > > +     },
> > > +     {
> > > +             .driver_data = (void *)ATH11K_PM_WOW,
> > > +             .matches = { /* P14s G5 AMD #2 */
> > > +                     DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_PRODUCT_NAME, "21MF"),
> > > +             },
> > > +     },
> > >       {
> > >               .driver_data = (void *)ATH11K_PM_WOW,
> > >               .matches = { /* T16 G2 AMD #1 */
> >

