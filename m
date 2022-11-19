Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CDFC4332F
	for <ath11k@archiver.kernel.org>; Sat, 19 Nov 2022 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aC63h3lZk/FkrKeV/nS9fDtDbrPR/slUsvjI/36t+vw=; b=XzWGKp1zKRuuW7
	NOJzx5SjFHTMBIVL2i+Sp83UhktAkHB6aaRqaRAGELmX78iiGK3W7DkuK9K1nEon1gG+2DCS7OqZs
	iBcIJkhPsyPhtPP/XvNTO60zg8nKRrLivC/pDAWj47nW6rsmhjrsbAscU/ek1ao7Xlc92np0IrI7O
	tazajp51O5gOyuBDn2i4Yp9Goa3vXL1anb6ZWfzStIMeyzUucK4m/K+xiBR/pNf9P+UFCKkyu/NM2
	DGmSoaoHCdHCeCL3bfoY1cKHJr3zJzEifbaAX0hFIAWaJPWqnggvD4Lze/pe3E3EpWxNVXsF4uKYg
	u+NqkZqvtyZ1h6O7Jytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owQPs-00EsP6-IF; Sat, 19 Nov 2022 16:10:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owQPp-00EsGq-IK
	for ath11k@lists.infradead.org; Sat, 19 Nov 2022 16:10:03 +0000
Received: by mail-lf1-x135.google.com with SMTP id b3so12855072lfv.2
        for <ath11k@lists.infradead.org>; Sat, 19 Nov 2022 08:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JCRUeSvieg1P+WPED1XqFlENEXBLICCnQbS9NnGsPng=;
        b=ZtGW1WDQUdUbjczbOQNUkYeJPSoEAUDnsRp33PAWaq5EDmst6S9iU/coUCeRFRBIQN
         dZUcSodZD/v6i8BeZtfO40/daT5wgvqTXheSYchu7sAGH/D43Nc59SQfDD4HmvIBbE7h
         HhmRsNIFUtIcBLfhR7QVF6dcDYzs5807xPTHhmpT56BdxnR7czYpXag4FfuPqzusYBzu
         MwzqHq2p9IUq6c/pkxg8fFo8JnoDpCr1H5IsQPTREEiroQegj5Q8WffLLTnSOHbY+yU1
         hIHfbvYWr5ebwuJi0MRhSyNGiRnEX+dRPA27ma2XyyCSn89g8EcHL0Ckdj61sStSZD75
         +XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCRUeSvieg1P+WPED1XqFlENEXBLICCnQbS9NnGsPng=;
        b=lfaB/OoaM7H7yvsJK296apcrboG1MDjU6tWhjUgoLyCyChRiyXVW6qLuXWuuobYIxv
         AYan/adyuIToxrl/co5s8TPGWZ3nadNo07Z+FFDyeVFwEYNe4/uTBPa39kipePVhO3fN
         Z/n3XA9GnD9wsykmdcXtuQBQGnoeRvLFXfYhJmXfJn0SULjPLix2rJ1/GQbxrS8sX+kU
         8LM17tLds1gasFG6YclHv2QoOgjcZxp/B8uKmI6ACjdfjPTm7M8vByK16LfOx/A9S4gU
         m7sqYNt5tUtWAHge48raKE6YsEgWr1UFeCoVsxJ5wYT7XVNGbug3penkFLJfrrL18TY4
         siuQ==
X-Gm-Message-State: ANoB5pkYF/y4jsRkpX2PZ2DNGunkFJNkqCW/BL1FKuc2L6qlqrG1Fq7p
	N9fxhJLXiZsqPzINt9n8kwhfDIonAxhreIEPtTU=
X-Google-Smtp-Source: AA0mqf5+cXbRur4wJRF2lKgGxq8D0yF2n77GgyX51BZyd+qkQ1DsQl03MpPJOivIpKXfctL55y8aqjLWMW0wS7ZUF1A=
X-Received: by 2002:ac2:4ec3:0:b0:4a2:3c09:3019 with SMTP id
 p3-20020ac24ec3000000b004a23c093019mr3631214lfr.90.1668874198181; Sat, 19 Nov
 2022 08:09:58 -0800 (PST)
MIME-Version: 1.0
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org>
 <4660647.LvFx2qVVIh@sven-l14> <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com>
 <3684626.iIbC2pHGDl@sven-l14> <CAJrE-q7yW435fPqeNg9aEhbdyy152Q2q-dSbQ7_4xNP9EzHWHg@mail.gmail.com>
 <CA+HBbNGWQCR_RQK3iCX3cEHeMzMeKz6pdwG9=LrOw8fSB22x2Q@mail.gmail.com>
In-Reply-To: <CA+HBbNGWQCR_RQK3iCX3cEHeMzMeKz6pdwG9=LrOw8fSB22x2Q@mail.gmail.com>
From: Mariusz <enebeo@gmail.com>
Date: Sat, 19 Nov 2022 17:09:46 +0100
Message-ID: <CAJrE-q4nzWsHsCS5BQkiSkXyTqZLf8G1Bv_Ld_fp0-NJSdGgMA@mail.gmail.com>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
To: Robert Marko <robert.marko@sartura.hr>
Cc: Sven Eckelmann <sven@narfation.org>, walde <waldemar.stroh@uni-siegen.de>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_081001_773957_9E35CFC7 
X-CRM114-Status: GOOD (  46.44  )
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

I am just relying on what I am told by their support, really wanted to
deploy a 6E SoftAP for my home lab and expected some hackery but this
is like an early dev sample kind of environment with most stuff in the
works.

For the time being this is exactly what I did with hardcoding board_id
into the driver: /drivers/net/wireless/ath/ath11k/qmi.c:2234:
ab->qmi.target.board_id = 0xA2;
After this no more board.bin hackery is needed and correct firmware is
loaded from board-2.bin. This of course means I cannot use any other
ath11k card in the system as it would be forced to this id but that's
not an issue. My objective is to have only 6E add on to my network.

Now correctly reported:
[ 1525.142906] ath11k_pci 0000:07:00.0: chip_id 0x0 chip_family 0x0
board_id 0xa2 soc_id 0xffffffff
[ 1525.142909] ath11k_pci 0000:07:00.0: fw_version 0x270206d0
fw_build_timestamp 2022-08-04 12:48 fw_build_id
WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

and the correct FW is loaded with 6Ghz channels enabled.


Debug is no longer showing any errors, hostapd is not reporting
anything wrong everything pretends to work but it does not in
practice. What puzzles me is that raw dump of wireless frames off
AX210 client shows there is beacon transmission from the module but
for whatever reason the client ignores it as a valid AP option.

airodump-ng -C 6115 -i wlan0mon --bssid C4:4B:D1:D0:00:7E

Freq 6115 ][ Elapsed: 0 s ][ 2022-11-18 13:48

BSSID PWR Beacons #Data, #/s CH MB ENC CIPHER AUTH ESSID

C4:4B:D1:D0:00:7E -46 12 0 0 33 54e WPA3 CCMP SAE dupa

On Sat, 19 Nov 2022 at 16:16, Robert Marko <robert.marko@sartura.hr> wrote:
>
> On Sat, Nov 19, 2022 at 2:40 PM Mariusz <enebeo@gmail.com> wrote:
> >
> > I have contacted Wallys again but I am skeptical about resolution.
> > They don't consider board_id an issue and provided the same response,
> > on integrated systems it is due the bootloader to set it properly so
> > it is not fused and obviously not included in x86 scenario.
>
> Hi, this is not really the case, how would the bootloader set the board_id
> which is supposed to be fused on the device so FW would report the correct one?
> You can only workaround that by hardcoding it in the driver or on non-x86
> in DTS and force-loading the correct BDF that way.
>
> > Since this
> > is a private project I doubt QCA will support my efforts and free
> > access to their portals gives nothing. Found online some SDK for
> > version ath10k/IPQ8074 and athtestcmd to deal with OTP/fusing but
> > that's far beyond home project effort.
> >
> > Tried also to compile it in OpenWRT with moderate success. ath11ko /
> > qrtr.ko modules are built but the module never goes past power on
> > success.
> > mhi mhi0: Requested to power ON
> > mhi mhi0: Power on setup success
> > mhi mhi0: Wait for device to enter SBL or Mission mode
> >
> > Even the newest kernel in OpenWRT master development branch 5.16 is
> > quite behind and backporting anything is another non-trivial task.
>
> ath11k won't work in OpenWrt master currently, I have been supporting IPQ807x
> and recently PCI version as well out-of-tree with hopes of getting it soon into
> OpenWrt once 6.1 backports become available as that gets rid of like 300-ish
> backported patches.
>
> Regards,
> Robert
> >
> > On Fri, 18 Nov 2022 at 15:06, Sven Eckelmann <sven@narfation.org> wrote:
> > >
> > > On Friday, 18 November 2022 13:48:43 CET Mariusz wrote:
> > > > Mine is from a different supplier - Wallys - and I bought it 2 weeks
> > > > ago but not sure how old their stock is. PCB looks slightly different
> > > > than Pinapple's. Is it likely to have the same issue?
> > >
> > > It definitely has the same issue (because you reported that board_id is
> > > 255/0xff) but I have no idea whether Wallytech ever fixed it. At least I was
> > > never in contact about this problem with them. But sending around precompiled
> > > kernel module binaries (for an unknown kernel build), with some hacks to fix
> > > their hardware production errors (missing module id fusing in the OTP for
> > > their separately sold modules), doesn't make me confident that they are able
> > > to solve this problem correctly.
> > >
> > > In their defense, QCA doesn't make it really easy. It seems like their
> > > reference designs with Pine on 6Ghz are (mostly?) for (embedded Linux) APs
> > > which use the normal flash (NOR or NAND) to store the calibration data. And
> > > for these devices, they use the devicetree (or various other hacks) to load
> > > the correct board data.
> > >
> > > Wallystech has to find the correct document on createpoint which describes the
> > > process. It was something like "module" "board id" "fusing". But it is not the
> > > "Board ID Fusing for 802.11ax WLAN AP Chipsets" which only describes the way
> > > how you would to it for thei internal wifi of the IPQ807x/IPQ60xx/... SoC.
> > > You/they are searching for the corresponding document for Pine IPQ9074. Most
> > > likely hidden in some QDART documents.
> > >
> > >
> > > Regarding the problem that some countries are not allowing 6GHz: You have to
> > > either get a firmware from QCA which has it enabled or you modify the BDFs
> > > ("board-" files in the board-2.bin) to enable 6GHz in the (enabled) embedded
> > > REGDB of the BDFs for the specific country. Unfortunately, the data structures
> > > of the BDF are not officially documented and you would need an official QSDK/
> > > ATH.11.X release from QCA to fetch the bdf2txt.py, txt2bdf.py and the
> > > corresponding template for your BDF to extract and modify it.
> > >
> > > Kind regards,
> > >         Sven
> >
> > --
> > ath11k mailing list
> > ath11k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath11k
>
>
>
> --
> Robert Marko
> Staff Embedded Linux Engineer
> Sartura Ltd.
> Lendavska ulica 16a
> 10000 Zagreb, Croatia
> Email: robert.marko@sartura.hr
> Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
