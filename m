Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527E4CFD368
	for <ath11k@archiver.kernel.org>; Tue, 25 Nov 2025 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tF7oEVPymOKUXjtl1HNvWc8B4h40Zvg8z66G49GIa5A=; b=diYmXPvmuLvIrBQpCjwCrOuB67
	ioAElSPiThLGR2OCINDmqnlZey4edUl3NLcLAp0lCt/2PURKmqDImxyQgRaHSuIMiDYooQN5IcBRQ
	NCpvgeAMC3iWLzU8KZsczd4KKYNTnxmK+BCzbOpocz1zuI253ldmeFk1F/0KBzBtXL30wVjlq+5lM
	SlU15gBoOAZn65XOA0GZfuFea3bttflfHLEDAHwJy9haUqAdaAG2i1QY9/hPsf2BqYvi+I+y2+dWH
	mIhZ17nfGpbedacHJmzck7H/v32ixiXF0lCJTrkYj4DoCmIX16DY8d33d8cwcA3lcqVCOlz6ijtYw
	/g98s26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNmz9-0000000CqZt-3dHw;
	Tue, 25 Nov 2025 06:57:11 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNmz7-0000000CqZY-2Pwn
	for ath11k@lists.infradead.org;
	Tue, 25 Nov 2025 06:57:11 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5633F225E7;
	Tue, 25 Nov 2025 06:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764053827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tF7oEVPymOKUXjtl1HNvWc8B4h40Zvg8z66G49GIa5A=;
	b=xqYn27WhKgwBHMBXU7GNbBpKULpEQc9PwaIvj3zyXP58deTPHRFBnKNOOnnB472904gD2y
	ZkSWDS1pZPAK7vii4/1B0EuZnmJv2X7Cma0p7HWpoL4ChADnfV94kxA23ZCw/iueB9+vKQ
	KMP0e/1/lePMtOuInXXjyB2ckw3aK2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764053827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tF7oEVPymOKUXjtl1HNvWc8B4h40Zvg8z66G49GIa5A=;
	b=H+uRAIAut+fLa3oFYVBLp71SLR4sJuCUtjKzuQUwBhPUiS5SiuOUqN2biob4PRnzMPKWDg
	LQYlQEX7zhAofFCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xqYn27Wh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H+uRAIAu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764053827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tF7oEVPymOKUXjtl1HNvWc8B4h40Zvg8z66G49GIa5A=;
	b=xqYn27WhKgwBHMBXU7GNbBpKULpEQc9PwaIvj3zyXP58deTPHRFBnKNOOnnB472904gD2y
	ZkSWDS1pZPAK7vii4/1B0EuZnmJv2X7Cma0p7HWpoL4ChADnfV94kxA23ZCw/iueB9+vKQ
	KMP0e/1/lePMtOuInXXjyB2ckw3aK2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764053827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tF7oEVPymOKUXjtl1HNvWc8B4h40Zvg8z66G49GIa5A=;
	b=H+uRAIAut+fLa3oFYVBLp71SLR4sJuCUtjKzuQUwBhPUiS5SiuOUqN2biob4PRnzMPKWDg
	LQYlQEX7zhAofFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DCA93EA63;
	Tue, 25 Nov 2025 06:57:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xXwaBkNTJWmdLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Nov 2025 06:57:07 +0000
Date: Tue, 25 Nov 2025 07:57:06 +0100
Message-ID: <87ecpmppkt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
In-Reply-To: <2faa8f4e-cb30-4e91-87d2-853c90458b01@oss.qualcomm.com>
References: <20251124134713.5819-1-tiwai@suse.de>
	<2faa8f4e-cb30-4e91-87d2-853c90458b01@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 5633F225E7
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_225709_774386_759BAB73 
X-CRM114-Status: GOOD (  33.95  )
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

On Tue, 25 Nov 2025 03:28:22 +0100,
Baochen Qiang wrote:
> 
> 
> 
> On 11/24/2025 9:47 PM, Takashi Iwai wrote:
> > The recent kernels showed a regression wrt suspend/resume on Lenovo
> > Thinkpad T14s Gen 3 AMD model; it fails to reconnect on resume after a
> > long time sleep.  The only workaround was to unload/reload the driver
> 
> how long? and with a short suspend you don't see the issue?

I can't say exactly, but usually after some hours.  I see it happening
when the machine is resumed in the morning after an overnight sleep.
Short suspends can resume mostly, as far as I tested.

> > (or reboot).
> > 
> > It seems that this model also requires the similar quirk with
> > ATH11K_PM_WOW which has been done for other Thinkpad models.
> 
> the quirk is to workaround the unexpected wakeup issue, which seems not the same with
> yours. Hence not sure if this is the right fix.

Yes, I wonder that, too.  The whole suspend/resume procedure look
fairly different with PM WoW quirk, so some of them might matter.

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
> > 
> >  drivers/net/wireless/ath/ath11k/core.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> > index 812686173ac8..3aa78a39394b 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -924,6 +924,13 @@ static const struct dmi_system_id ath11k_pm_quirk_table[] = {
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
> 
> so with the change, the issue is not seen after a __long__ suspend?

Right, the connection gets resumed properly.

> >  	{
> >  		.driver_data = (void *)ATH11K_PM_WOW,
> >  		.matches = { /* T14 G4 AMD #1 */
> 
> Hmm, I am feeling that we need to dig more to root cause this issue. Can you please help
> to collect verbose wpa_supplicant/iwd log and kernel log?
> 
> wpa_supplicant:
> 	cd /lib/systemd/system
> 	diff --git a/wpa_supplicant.service b/wpa_supplicant.service
> 	index d5c7ef8..69693d0 100644
> 	--- a/wpa_supplicant.service
> 	+++ b/wpa_supplicant.service
> 	@@ -5,7 +5,8 @@ Before=network.target
> 	 [Service]
> 	 Type=dbus
> 	 BusName=fi.epitest.hostap.WPASupplicant
> 	-ExecStart=/sbin/wpa_supplicant -u -s -O /run/wpa_supplicant
> 	+ExecStart=/sbin/wpa_supplicant -u -s -t -f/var/log/wpa_supplicant.log -dd -O
> /run/wpa_supplicant
> 
> 
> IWD:
> simply add '-d' option when starting it. You may directly add it to the systemd service
> entry if you like. See
> 
> https://archive.kernel.org/oldwiki/iwd.wiki.kernel.org/debugging.html

OK, I'll try to get the log (in tomorrow morning :)

Meanwhile, the PM WoW quirk looks fine for this Thinkpad model, I see
no other regression with the quirk.  As a stop gap, would it be
acceptable?  If yes, I'll resubmit with the entry of another Gen 3
model Mark suggested.


thanks,

Takashi

