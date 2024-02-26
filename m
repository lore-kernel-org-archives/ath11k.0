Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B49BC48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVg3+4MrPJeDgDG/+SZ95kFC8x4+K8jcoMQ3drqjs2s=; b=LPgQFA8VTsEhv7jQB9uI6Z75kE
	bPW/b9f6l1l9sCQQRqSJnHuPkBIaxe/HSo5eocvVhoapaTD/QqXJ5qBpT2Zzw/+1bYzUxODzrMry+
	5RWPZrgcHehv7cXOfBj4LQ3qfKrvc1nJVGiQzBjzn8iUSA8lCvYc6bdkdjR+YNroqevKDNQ66clX4
	YotmFy8qI340hQoZtJ53frv0BxMUMC0w/UAYn077RvNP2MjCfsHcYj/zG2VR90UdWrcvLNi2YUIn5
	mcmKCmPAWIMiIDhcLkoIsgie2+1CK0vPL4zyZApcoOqMus4CEE5RqTaoYwvIArmK8H6L0e2FWvTa4
	Kiyf8ecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWhL-0000000H7VC-3TRv;
	Mon, 26 Feb 2024 08:50:55 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWhF-0000000H7RO-0pqd
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 08:50:53 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 058E41F911;
	Mon, 26 Feb 2024 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708937446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jVg3+4MrPJeDgDG/+SZ95kFC8x4+K8jcoMQ3drqjs2s=;
	b=wfKheqgfxIiPGc70DzQV8gHwnadGVfgtUkY5klsdWCZNNGS1ybI2YDBPJPaNEDp1k6ZVB5
	ttX/0ubhpcHymwT/GGK/RvWGz7GSdXLfwEjZEH+/YR7sQEgJR6alD8KEKMBHf3frU9tEw3
	E2nwEgA3DwdX2MapODIbF0IsOzB9NQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708937446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jVg3+4MrPJeDgDG/+SZ95kFC8x4+K8jcoMQ3drqjs2s=;
	b=uy7Zbc0gqJJeLqdh8jsW34YKqqtLKH9keGE+5+VBfWIec7Mi8JMy7ulYAmGETuJVZrLehA
	BnH3Yr8TJlgND4BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708937446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jVg3+4MrPJeDgDG/+SZ95kFC8x4+K8jcoMQ3drqjs2s=;
	b=wfKheqgfxIiPGc70DzQV8gHwnadGVfgtUkY5klsdWCZNNGS1ybI2YDBPJPaNEDp1k6ZVB5
	ttX/0ubhpcHymwT/GGK/RvWGz7GSdXLfwEjZEH+/YR7sQEgJR6alD8KEKMBHf3frU9tEw3
	E2nwEgA3DwdX2MapODIbF0IsOzB9NQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708937446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jVg3+4MrPJeDgDG/+SZ95kFC8x4+K8jcoMQ3drqjs2s=;
	b=uy7Zbc0gqJJeLqdh8jsW34YKqqtLKH9keGE+5+VBfWIec7Mi8JMy7ulYAmGETuJVZrLehA
	BnH3Yr8TJlgND4BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72BBA13A58;
	Mon, 26 Feb 2024 08:50:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q93IF+VQ3GXqFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 26 Feb 2024 08:50:45 +0000
Date: Mon, 26 Feb 2024 09:50:45 +0100
Message-ID: <87wmqrzk0q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Takashi Iwai <tiwai@suse.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	ath11k@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: ath11k allocation failure on resume breaking wifi until power cycle
In-Reply-To: <a36b35a9-fb37-4afe-a718-a47dfe658cb5@suse.cz>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
	<0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
	<20240222054739.GG3374@thinkpad>
	<38c36d16-9cc1-4f03-b758-4a3ba90f8aa4@suse.cz>
	<abc0c24f-2137-41eb-bb99-80aea8dacdb2@quicinc.com>
	<a36b35a9-fb37-4afe-a718-a47dfe658cb5@suse.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_005049_488735_617AA4A4 
X-CRM114-Status: GOOD (  23.55  )
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

On Mon, 26 Feb 2024 09:45:17 +0100,
Vlastimil Babka wrote:
> 
> On 2/26/24 03:09, Baochen Qiang wrote:
> > 
> > 
> > On 2/23/2024 11:28 PM, Vlastimil Babka wrote:
> >> On 2/22/24 06:47, Manivannan Sadhasivam wrote:
> >>> On Wed, Feb 21, 2024 at 08:34:23AM -0800, Jeff Johnson wrote:
> >>>> On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
> >>>>> Hi,
> >>>>>
> >>>>> starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
> >>>>> on my laptop, which is Lenovo T14s Gen3:
> >>>>>
> >>>>> LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
> >>>>> ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> >>>>> ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> >>>>> ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> >>>>>
> >>>>> The problem is an allocation failure happening on resume from s2idle. After
> >>>>> that the wifi stops working and even a reboot won't fix it, only a
> >>>>> poweroff/poweron cycle of the laptop.
> >>>>>
> >>>
> >>> Looks like WLAN is powered down during s2idle, which doesn't make sense. I hope
> >>> Jeff will figure out what's going on.
> >> 
> >> You mean the firmware is supposed to power it down/up transparently without
> >> kernel involvement? Because it should be powered down to save the power, no?
> > Let me clarify: from backtrace info, seems you are using a kernel with 
> > the hibernation-support patches [1] applied, which are not accepted yet 
> > to mainline kernel or even 
> > git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git.
> 
> Oh, you're right. Sorry for confusing you all. The rc kernel builds we have
> for openSUSE have nearly no non-upstream patches so it didn't really occur
> to me to double check if there might be in the area.
> 
> Seems Takashi (Cc'd) added them indeed to make hibernation work:
> https://bugzilla.suse.com/show_bug.cgi?id=1207948#c51

Yeah, and I'm afraid that we still have the ath11k hibernation patches
in our 6.8-rc default kernel (i.e. patches are in both master and
stable branches).  But you can test vanilla flavor that has certainly
no downstream patches at all.


thanks,

Takashi

