Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFCBCFD313
	for <ath11k@archiver.kernel.org>; Mon, 24 Nov 2025 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gvouezs5UPpaF0WoJwfOHMI7NV7N3duzDW8JfGjpyPY=; b=tXdwWItIvDM+U12IZQyff76Phn
	XxvDiAiiI1JT6Mk9dYC4UiAz1JEZDJRwUsj+w36/4WpWv5+w19Ds+EK+A+/sIfKpXu8EDBLTVnmU2
	bD29dLm6GvNvkS5udo9lZtgI4PxiN676R8R3/kAkDMRWuLURmFtAH0lIU4z62s7U5K6ydCLAJoWy9
	fkOTwjorDX2O9t9iKp+Rm+XFdJLQX6ofGa+14jC7o8tkRaF1vsIAspJUT+DTFtMwnAY52V4mavmlr
	EbeT6NGuLeB/N3LnQP1grja8epDb7eFBphUi7ZQ62LXlOwwledamYzjwRkp8x+GwRrrDX1OxbanUx
	THtvOJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYYT-0000000BvhE-07rr;
	Mon, 24 Nov 2025 15:32:41 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYYQ-0000000Bvgq-0waT
	for ath11k@lists.infradead.org;
	Mon, 24 Nov 2025 15:32:39 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C596321FE8;
	Mon, 24 Nov 2025 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763998356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gvouezs5UPpaF0WoJwfOHMI7NV7N3duzDW8JfGjpyPY=;
	b=jSzXw9B0QXhij+kv7qTOMFTD1Du2I357kG4AH/Fopb+Cd2jJAxdNWO+kw3PPmTkyegbf4d
	xL7ytmpQVRaifWCjTnB9bdJpH/z7hIjJGEAqgiKMBmsl2OmgPWTgswRdWjmI0s/GGToqNW
	KxEMGM7d/Hif8uQDIb730kWZJIbLPDQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763998356;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gvouezs5UPpaF0WoJwfOHMI7NV7N3duzDW8JfGjpyPY=;
	b=mTFsoRpCO3MmDpPhxgIkNlvr7Nb5g4/maaOlhJ5Si+zX90ZGn+2VjwqGBq8SMSfJ2/xi8e
	9LkeuY4NsdKSqhDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ftw1Sm1k;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=r05TGoWy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763998355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gvouezs5UPpaF0WoJwfOHMI7NV7N3duzDW8JfGjpyPY=;
	b=ftw1Sm1k5gBRxMOnoEs3hoNAhPsj1wnb+X/xR7LRtBISfVOevbqM+b53Hmz5VS53xCVgtm
	FZPSpbWMiAfzE2Pt31mlAlnHOMIv2JaYIBd8WVzLqBVVwox7V9xRfApBvByWRWPi5OBiY9
	cNOJyKEmCFwU4/B9s8LTu1ctwb2/4Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763998355;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gvouezs5UPpaF0WoJwfOHMI7NV7N3duzDW8JfGjpyPY=;
	b=r05TGoWyillKzJAfJr22jHGmHBfP/j/f1G6dyZ7JPz/hjDkt4HPWbqKvWj2NS0qpJ75wYN
	I3IWC1Gs6j3LdRAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B05A3EA63;
	Mon, 24 Nov 2025 15:32:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FByYJJN6JGmiTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Nov 2025 15:32:35 +0000
Date: Mon, 24 Nov 2025 16:32:35 +0100
Message-ID: <878qfvqwdo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: "Takashi Iwai" <tiwai@suse.de>,
	"Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
In-Reply-To: <cb594fb5-faa3-4c6a-8ece-d2e176e196df@app.fastmail.com>
References: <20251124134713.5819-1-tiwai@suse.de>
	<cb594fb5-faa3-4c6a-8ece-d2e176e196df@app.fastmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: C596321FE8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_073238_412231_E8DCFB23 
X-CRM114-Status: GOOD (  32.90  )
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

On Mon, 24 Nov 2025 16:13:05 +0100,
Mark Pearson wrote:
> 
> Thanks Takashi-san,
> 
> On Mon, Nov 24, 2025, at 8:47 AM, Takashi Iwai wrote:
> > The recent kernels showed a regression wrt suspend/resume on Lenovo
> > Thinkpad T14s Gen 3 AMD model; it fails to reconnect on resume after a
> > long time sleep.  The only workaround was to unload/reload the driver
> > (or reboot).
> >
> > It seems that this model also requires the similar quirk with
> > ATH11K_PM_WOW which has been done for other Thinkpad models.
> >
> > Link: https://bugzilla.suse.com/show_bug.cgi?id=1254181
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >
> > I'm not sure whether this model has another DMI entry, so put Mark to
> > Cc.
> >
> > Also, I wonder which Thinkpad models are rather the ones that should
> > *not* take the quirk.  Since mine is Gen 3 and I already see Gen 2
> > entries, which else remaining...?
> >
> 
> It should only apply to models with the ath11k modem - but it looks like Gen 2 up to Gen 6....which is quite a lot. I don't know if all of those are impacted.
> I think we'll have to do more testing and get feedback from the FW team, which will take a bit I'm afraid. I'll look into it.

I see, thanks for confirmation!

> >
> >  drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c 
> > b/drivers/net/wireless/ath/ath11k/core.c
> > index 812686173ac8..3aa78a39394b 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -924,6 +924,13 @@ static const struct dmi_system_id 
> > ath11k_pm_quirk_table[] = {
> >  			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
> >  		},
> >  	},
> > +	{
> > +		.driver_data = (void *)ATH11K_PM_WOW,
> > +		.matches = { /* T14s G3 AMD */
> > +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "21CR"),
> > +		},
> > +	},
> >  	{
> >  		.driver_data = (void *)ATH11K_PM_WOW,
> >  		.matches = { /* T14 G4 AMD #1 */
> > -- 
> > 2.52.0
> 
> I think you need to add the "21CQ" Product Name for this platform too (every model has two IDs depending on where in the world it is deployed)
> 
> Unfortunately my T14s G3 AMD seems to be dead :( I can't test and confirm directly.

OK, I can resubmit with 21CQ entry later.

Also, maybe it'd be worth for adding a module option to specify /
override the quirk, so that one can test without recompiling the
kernel?


thanks,

Takashi

