Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A381AC4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEjHFuYf1SWAW9ErBCDisncw9i/alN35xpkU1Jfxgp4=; b=G2sC2jq4ma8AxS
	mHMlwDpkIRNdJpU9TINP0XHlJELfVyKofCDbMFZSGA/P6WgVEFu9tFaZzc1kjCLn7FaVB5EUmrN3b
	gSD/ppm+DvqaJO1vOY4uwHFVYjtWMaHEZ2gPi/uty/MwxydNr9o/L5J8/yKQ2nNPk72RQZm3pJ0Y1
	i8oDLsRXxwaSo4vWN0Ujh37LGg8rvFNmsI4+W0kVjtKg7sq4IljRumq7AJ5JkcBv3LAu0LoMIhI/F
	U96dmQBS6NwACM2XFelfSxYRj/tGJCHfnlRfRwrPmPjIxZalTmbJpO6Mgl7rhbaBFNTg9VJwuF3Yk
	CXIWEEn9Q9uykTELWkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z7M-00EGWi-1C;
	Mon, 13 Nov 2023 15:44:52 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z7J-00EGW8-2C
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 15:44:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9e1fb7faa9dso696562566b.2
        for <ath11k@lists.infradead.org>; Mon, 13 Nov 2023 07:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699890288; x=1700495088; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgDXufcGApdsosmngflQhqbsh/yhalyQjn8XNJFsIHA=;
        b=wdwHT8E0FxhBceo1/IH8KZe47LHgIqB/Ht4lajBfkgPninH/435R3EImbp9JqXn59X
         ngZrPkfSJow2D36aiJRwordJ0zevzDSvOEdLEJIeROOt4ggXeg035D+diRsygYFsv5I8
         yz4paq3gsNa4pDdr/ReF8ARohDxDJhxEdSsAnsgpR0vQHRi8h70pWOXirzlu9FNZP3wt
         2pe1RnooAX8QCPg/3PA8tcMXuH5YD0NmS6R8anH4rs3gLkloUurM155/UgS2BuN+giye
         aGj5PT6TkkFCA22DFBpckU1gm5ft8TTacT9cylAnRxdme/XW5YX09q2JjBohvnIw9CTB
         YkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699890288; x=1700495088;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgDXufcGApdsosmngflQhqbsh/yhalyQjn8XNJFsIHA=;
        b=UJvnrKLANKbfc7vHrzeGOljjbR/OE5HkbgFGSQ4w2paeznUid6wtuWyIdwufD+mZWY
         vtxGFkCvs7XxPVlSir2HSPx80ow4NYSapG3B0H4nOdgUdoTN/GMEttgEFNsOdhKCCg5E
         PGDVCpI06NbCB8Olm2WpWU4XhSciFqJK5SMSgcTuaHsqpDDv0nJ5Dh/6fSSufzAo0Qaz
         84KSAx1IxgjwcNqKv3EBABXsYK159Z5ofJ+Z5AUorI5boGExnhNyDhy35UnV/rPQKXtK
         sVvfu/PcJ+iwjG1R/ncEDA7IMF5DVr/GbOGpHy6a3Sg3vYauOqIFR0Tu4whcfkY6Ng8G
         zEaA==
X-Gm-Message-State: AOJu0YxkCmLsS3tK8SfEywFCVkBNbsc0BmhLxsAWDxXc1DC75bFBPRGp
	BjnbNtE5mFJw4hUzzrgusZX2rA==
X-Google-Smtp-Source: AGHT+IEHMAox5Iv9eGuXw016c/3TV+peteMJ1y3z67BpqXVWkBFoTMrhn9Er8E6hF2KgzrgZEHDZxA==
X-Received: by 2002:a17:906:3b16:b0:9c2:a072:78c4 with SMTP id g22-20020a1709063b1600b009c2a07278c4mr4974623ejf.25.1699890287811;
        Mon, 13 Nov 2023 07:44:47 -0800 (PST)
Received: from localhost (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kl5-20020a170907994500b0099bc8bd9066sm4174126ejc.150.2023.11.13.07.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 07:44:47 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 13 Nov 2023 16:44:47 +0100
Message-Id: <CWXSTD60OPP1.143YPQNX3QVRU@fairphone.com>
Cc: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Defer on rproc_get failure
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kalle Valo" <kvalo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
 <87lebowjyf.fsf@kernel.org> <CWJ4ZLEZCKQC.2STOBNUU06B2P@fairphone.com>
 <87a5rhu0iy.fsf@kernel.org>
In-Reply-To: <87a5rhu0iy.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_074449_725683_6EADBDDB 
X-CRM114-Status: GOOD (  33.54  )
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

On Mon Nov 13, 2023 at 4:37 PM CET, Kalle Valo wrote:
> "Luca Weiss" <luca.weiss@fairphone.com> writes:
>
> > On Fri Oct 27, 2023 at 10:25 AM CEST, Kalle Valo wrote:
> >
> >> Luca Weiss <luca.weiss@fairphone.com> writes:
> >>
> >> > If we already have gotten the rproc_handle (meaning the "qcom,rproc"
> >> > property is defined in the devicetree), it's a valid state that the
> >> > remoteproc module hasn't probed yet so we should defer probing instead
> >> > of just failing to probe.
> >> >
> >> > This resolves a race condition when the ath11k driver probes and fails
> >> > before the wpss remoteproc driver has probed, like the following:
> >> >
> >> >   [    6.232360] ath11k 17a10040.wifi: failed to get rproc
> >> >   [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
> >> >   [    6.232478] ath11k: probe of 17a10040.wifi failed with error -22
> >> >        ...
> >> >   [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is available
> >> >   [    6.252776] remoteproc remoteproc2: powering up 8a00000.remoteproc
> >> >   [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm6490/fairphone5/wpss.mdt, size 7188
> >> >
> >> > So, defer the probe if we hit that so we can retry later once the wpss
> >> > remoteproc is available.
> >> >
> >> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>
> >> Did you test this on a real device? If yes, what ath11k hardware and firmware
> >> did you use? We use Tested-on tag to document that:
> >>
> >> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag
> >
> > Hi,
> >
> > Yes I tested this on qcm6490-fairphone-fp5 including some extra patches
> > for wpss-pas remoteproc support (nothing special, just adding it to the
> > existing PAS driver) and wifi enablement in dts.
>
> Nice, do you have a link to the patches or a git tree which has
> everything? And how difficult would it be for me to run vanilla
> kernel.org kernel (no vendor kernels or anything like that) on Fairphone
> 5? Any documentation available for that?

I'm happy you ask ;)
Currently pure kernel.org doesn't boot much because quite a few patches
are still being upstreamed, like this one.

In terms of git tree, this here is the last tag for everything I have
working on the device, it's ~100 patches on top of v6.6, a good chunk
should be merged for v6.7-rc1 already:
https://github.com/z3ntu/linux/commits/v6.6.0-sc7280

You can flash the device with that kernel and postmarketOS using the
pmbootstrap tooling:
https://wiki.postmarketos.org/wiki/Fairphone_5_(fairphone-fp5)
https://wiki.postmarketos.org/wiki/Pmbootstrap

Let me know if you hit any issues, or if I can help somehow.

>
> I'm asking because I don't have a test setup for WCN6750 right now. It
> would be awesome if I could use Fairphone for testing :)
>
> > I built this line from info from the dmesg, hope it's okay:
> >
> > Tested-on: wcn6750 hw1.0 AHB WLAN.MSL.1.0.1-01264-QCAMSLSWPLZ-1.37886.3
>
> Thanks, I added that to the commit message.
>
> > And thinking about it, a Fixes tag would also be appropriate for this
> > patch. The code was moved to a different file in commit ba929d6fe31a
> > ("ath11k: Remove rproc references from common core layer") but I think
> > this tag should be correct.
> >
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
>
> Ok, I added that as well.

Thanks!

Regards
Luca


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
