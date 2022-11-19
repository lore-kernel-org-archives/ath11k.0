Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719D8C433FE
	for <ath11k@archiver.kernel.org>; Sat, 19 Nov 2022 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYCkPtJu2LguvthDP2RH49Z5N5MPJWdZI3v98nGXc4Y=; b=QIrnD0Wh/F/dFR
	iupf5JNsWPZIcqE0btj7fPmC/dxK+/rqcGjagyYFMsW8eJh3hDNM7JtKUVVtuPCTTZ42ccJbUIn4E
	3+PqS4/3KnlEREfLNSGrPMc/MuChcnX/6J7Gr6C+HBcShIinsIAu6HD/BvmZNAAuT75SWtYZ8n7yG
	2b4inIoSK3CcMwY/eWsELe57Pq6izgAgZXqHPHQSDIUW7a6bwrQe855nUIIaZx+wBGFOU9lIiePer
	gVT9hRt8124rNbzNAmCm9xcya5WPgWuVveMoPVmD3K/Tx3E2h5yhchThxiipFll4OTp7WmMfP2fJE
	elXXB+c1NaSFThxwVLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owPaL-00EUQB-QD; Sat, 19 Nov 2022 15:16:49 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owPaI-00EUOz-HX
	for ath11k@lists.infradead.org; Sat, 19 Nov 2022 15:16:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id k15so7582269pfg.2
        for <ath11k@lists.infradead.org>; Sat, 19 Nov 2022 07:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy4iLMdtk1HsFYqPos6onr7oVnh2P0tD2TppV4f8OB4=;
        b=XwYC2bAs6Fucpx9l3r1WCtA1BPcGMcmL5n37X2AcXgQavZKahiMLrwqYqjtrTTdrk9
         DHe30crlN0e8E0UiocNGUWo/zzH8rS6WA7Pfl2Yr/u09JZiSQsfUjRdL/3VJrVrqN3e4
         zFpBDqWB0WPhUnLmIDuseU5ouBOTRmHJ005joLfZuj9OrVAtPHzU49eOgd/EAPPRPD3T
         FW8s1HweoT0fpwCbbrl8EeRPcLSeRA0sK2NqIbSevoUnFO5klif7PpWty269oNflUBsL
         yR5TXiRVdOCzsvuhIlGSJMvMmM7a0XvkQhUwiarLieLpLb+d8/nVlV/ITOvTyxFw0Rjt
         TzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wy4iLMdtk1HsFYqPos6onr7oVnh2P0tD2TppV4f8OB4=;
        b=2xglp9dLR+pG8UHBKUgPQx3RVh23QPlffM1jTnVwAZCV63pjefqyeLytJtjdKXLpaR
         ce0obLbXZCxy2MkSBt7QMCMcXxn0P7R2yeMAdnYvwamnyiXPOCKhEOpL0PdhkrrrWosb
         1zDtZLUjzZ7TAYTyejquoPkbadvSy2d2SCxpGThkEHGI9JNT37133pTRqxqJBBwNgepG
         IiZM5fjQQFTZ6WWKJHH6zFWorz7lC3mpFptkx1cZnP3a8WDZ/ZWYDbFNarbPXD10hkpd
         5JH8sxVoKFUwOP0bNlXXverAzzZZMcI/gK+2qj66LqQrwcHJP+0Mbr/EK+0jNnWX3QuV
         S5Zw==
X-Gm-Message-State: ANoB5pkLFGuD6qdmOdwsEy9oaYeiVg1DWOROPuKcNZZntUfhaGP7zRWB
	rsrMO8nfSmHs/2uurmH1p+dvtiXBekBTAXXx/nEauA==
X-Google-Smtp-Source: AA0mqf7OFjYsDX0zTKU8w3e1tT0qdd8swxJoFlK/2JP3yIGAgPPKs+RXF5Oj17UwOTob8uEzj204rSHdiP9SR384gEg=
X-Received: by 2002:a63:e802:0:b0:46f:ed3a:f36c with SMTP id
 s2-20020a63e802000000b0046fed3af36cmr11068708pgh.372.1668871004297; Sat, 19
 Nov 2022 07:16:44 -0800 (PST)
MIME-Version: 1.0
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org>
 <4660647.LvFx2qVVIh@sven-l14> <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com>
 <3684626.iIbC2pHGDl@sven-l14> <CAJrE-q7yW435fPqeNg9aEhbdyy152Q2q-dSbQ7_4xNP9EzHWHg@mail.gmail.com>
In-Reply-To: <CAJrE-q7yW435fPqeNg9aEhbdyy152Q2q-dSbQ7_4xNP9EzHWHg@mail.gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sat, 19 Nov 2022 16:16:33 +0100
Message-ID: <CA+HBbNGWQCR_RQK3iCX3cEHeMzMeKz6pdwG9=LrOw8fSB22x2Q@mail.gmail.com>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
To: Mariusz <enebeo@gmail.com>
Cc: Sven Eckelmann <sven@narfation.org>, walde <waldemar.stroh@uni-siegen.de>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_071646_617500_A2B05BFD 
X-CRM114-Status: GOOD (  35.09  )
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

On Sat, Nov 19, 2022 at 2:40 PM Mariusz <enebeo@gmail.com> wrote:
>
> I have contacted Wallys again but I am skeptical about resolution.
> They don't consider board_id an issue and provided the same response,
> on integrated systems it is due the bootloader to set it properly so
> it is not fused and obviously not included in x86 scenario.

Hi, this is not really the case, how would the bootloader set the board_id
which is supposed to be fused on the device so FW would report the correct one?
You can only workaround that by hardcoding it in the driver or on non-x86
in DTS and force-loading the correct BDF that way.

> Since this
> is a private project I doubt QCA will support my efforts and free
> access to their portals gives nothing. Found online some SDK for
> version ath10k/IPQ8074 and athtestcmd to deal with OTP/fusing but
> that's far beyond home project effort.
>
> Tried also to compile it in OpenWRT with moderate success. ath11ko /
> qrtr.ko modules are built but the module never goes past power on
> success.
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
>
> Even the newest kernel in OpenWRT master development branch 5.16 is
> quite behind and backporting anything is another non-trivial task.

ath11k won't work in OpenWrt master currently, I have been supporting IPQ807x
and recently PCI version as well out-of-tree with hopes of getting it soon into
OpenWrt once 6.1 backports become available as that gets rid of like 300-ish
backported patches.

Regards,
Robert
>
> On Fri, 18 Nov 2022 at 15:06, Sven Eckelmann <sven@narfation.org> wrote:
> >
> > On Friday, 18 November 2022 13:48:43 CET Mariusz wrote:
> > > Mine is from a different supplier - Wallys - and I bought it 2 weeks
> > > ago but not sure how old their stock is. PCB looks slightly different
> > > than Pinapple's. Is it likely to have the same issue?
> >
> > It definitely has the same issue (because you reported that board_id is
> > 255/0xff) but I have no idea whether Wallytech ever fixed it. At least I was
> > never in contact about this problem with them. But sending around precompiled
> > kernel module binaries (for an unknown kernel build), with some hacks to fix
> > their hardware production errors (missing module id fusing in the OTP for
> > their separately sold modules), doesn't make me confident that they are able
> > to solve this problem correctly.
> >
> > In their defense, QCA doesn't make it really easy. It seems like their
> > reference designs with Pine on 6Ghz are (mostly?) for (embedded Linux) APs
> > which use the normal flash (NOR or NAND) to store the calibration data. And
> > for these devices, they use the devicetree (or various other hacks) to load
> > the correct board data.
> >
> > Wallystech has to find the correct document on createpoint which describes the
> > process. It was something like "module" "board id" "fusing". But it is not the
> > "Board ID Fusing for 802.11ax WLAN AP Chipsets" which only describes the way
> > how you would to it for thei internal wifi of the IPQ807x/IPQ60xx/... SoC.
> > You/they are searching for the corresponding document for Pine IPQ9074. Most
> > likely hidden in some QDART documents.
> >
> >
> > Regarding the problem that some countries are not allowing 6GHz: You have to
> > either get a firmware from QCA which has it enabled or you modify the BDFs
> > ("board-" files in the board-2.bin) to enable 6GHz in the (enabled) embedded
> > REGDB of the BDFs for the specific country. Unfortunately, the data structures
> > of the BDF are not officially documented and you would need an official QSDK/
> > ATH.11.X release from QCA to fetch the bdf2txt.py, txt2bdf.py and the
> > corresponding template for your BDF to extract and modify it.
> >
> > Kind regards,
> >         Sven
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
