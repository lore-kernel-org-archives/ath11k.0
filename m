Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A434CA0FFC
	for <ath11k@archiver.kernel.org>; Wed, 27 Aug 2025 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KE7wb2ebz3aytmTHU9Nm2QadMUrN0mtKT6nbctYdj4g=; b=4zeU5dDFT6ywkSyIuUZDnDWH/O
	/M7/xDuMFsEhDdakMLFybpQQwgSoNq4Wq0WuamXRYxbBLg+CDGu9wQ8ccaZbXNFYZWDgYnQEMqyS1
	f9ZBRZm6KTPxw06pnZxqeWL/arC4YttcLbzBsCR7U7kUKY+XlD4ja+uMhpL3nORFi+agKItcLclBL
	qgYK46jDE+gwcwqwIfFy4b9QKa9IGhJ4Q/jhRDBkiWX0V1o+OEPo+sjGPi3/uFy+GtJ/hDMvWMDVc
	lEnF9xz7yF3MquZ6+J+eDomcJYKIr5BaAkLm7hpOxFPt42Emr4JI8whUBSlJPuZySQBoMnfrN/v71
	9iTSj+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJdR-0000000GGC3-1uoD;
	Wed, 27 Aug 2025 17:08:33 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGLy-0000000FbIX-3H10
	for ath11k@lists.infradead.org;
	Wed, 27 Aug 2025 13:38:21 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-89018eb083eso3863210241.0
        for <ath11k@lists.infradead.org>; Wed, 27 Aug 2025 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1756301897; x=1756906697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE7wb2ebz3aytmTHU9Nm2QadMUrN0mtKT6nbctYdj4g=;
        b=hFR5heaAB/5iTi0ftZxHOUaOh75krkyCeKnmlLeDKZe2WLRfCBg0umVIJyEN+fQWPw
         8mKWXto3nakmYOi9LjLCeYew9Jv6okDulpmPRHb+MKyiqfXNGMczjyglgz5DkQkWOudh
         TkMw8gL14qDGv6lxjH5bJz1OX7UlSEZaq26dNKw1T0e9gdRNSnZI6tYUzUctW/rxbYSg
         /6p2WOIvNPNJtj6XlUP32iO5PIQFJqmlFpX7ba6Lw8LZQxrsg76Q7yzAPD9X43bamPff
         Ncn2QrT9BpWXnbRDzJZtjYC28/4sCGsk/tnnmf+y2Z2hrTkrB1BDuiNSMUv9Qk4ICD5Z
         ohmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756301897; x=1756906697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE7wb2ebz3aytmTHU9Nm2QadMUrN0mtKT6nbctYdj4g=;
        b=uUIsSZrlbcXTVvxV9jtNXTAWOuqDSwItO3kxMO5e6VrBEaTk9j+WsmMZjGF4DuY8hB
         +0aQv7waUTTXyAA8UD9JEneuY+2pUgJBomLHfXccjr4Rwin3KvZZm59Q9gYM3SM8Sljx
         QIzfBJ+KVeRHXS5LkTKG9K0aaVSk+BLhgBA0/mycQWnlYVcRY74W3E4HMF1YCEduS2nl
         ZuWjnYwx3Z2zqWehi/2pFPy5qNOrCfBqR0vXLSHoqfnUbNN4yjxRzMPJy3hx2DEcLd+q
         YYSyT+uWP012SdlBwt2rpduGcsN03ZwZk71bFcKM8L30KPVZkPu4RAGMRaJNMb/yyaP7
         kBtg==
X-Forwarded-Encrypted: i=1; AJvYcCXR4mETiKgXDpVtLXUltnaBK3iCrzaKzUdOBB+zKWy/P5s1mjATT8YKQ+QxdA2wCa3XQzo+aXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy42jAJ/zlE6Uz10GgWcOpZijUTL7qBCTr9pIY99Ztj/9lH8aVc
	YTfvux3JDhP+NHxurRdcUhc49ZIitJxIMy99s+VYxF5sC+z+4U79LRl31zgK4MxLHgqoupqHnFN
	IwpTPqMG5jQ3G/eF5iSnP3IJBy0LtiqVAsQiEHeQNgA==
X-Gm-Gg: ASbGnctmlIO1EipsWcPn7qeA3hswppL8K5aFkzvJ2k51rA8KbV4wgVNq9FUZeAVc46n
	aMr3RYDotjbjyRltaobYKcJV7Bo78IPSWjrRhj6C+8qRIoVl2DdPzpkYrJFQXgrwvAt7ssdPzbx
	OXi0NOZJiU1X6LeAW7At+vHHrq6nYp+dfLBoYucLD1a2QizvPMXA1+89oto6ixRKZRArgPxZRj4
	x6P/P3M+DVwo4+Krza3
X-Google-Smtp-Source: AGHT+IHOqDXgOE/03CQt8aIYD8DKGk5dbif04xDsPj/PX5VTOIQqUQbqqsUc9xOX07v23ZYhz582V6jq78kP1LQp7Ck=
X-Received: by 2002:a05:6102:3e19:b0:4fa:e005:cb20 with SMTP id
 ada2fe7eead31-51d0c8d7a21mr6967682137.3.1756301896706; Wed, 27 Aug 2025
 06:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com> <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com> <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
 <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com> <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
 <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
 <69f3fef9-017d-86fa-8fbb-2ac2a1df8ae4@quicinc.com> <CAONkfw4cQktTqR6e3PGfVhGQPsqPctwjwLSPjdiAvm45tq5qEw@mail.gmail.com>
 <127cb2e9-5371-21fa-1f09-586e6770afcc@oss.qualcomm.com>
In-Reply-To: <127cb2e9-5371-21fa-1f09-586e6770afcc@oss.qualcomm.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Wed, 27 Aug 2025 15:37:40 +0200
X-Gm-Features: Ac12FXw1c-muGuOM_3hKorxmv6uk4EtkGN7FstlOP0GT4t_5hZAfRXFl3AYDogU
Message-ID: <CAONkfw5K0v7UJ1R8NmW1jVnukF9zsS38JAaV==j0_YXB3RynBA@mail.gmail.com>
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_063819_062623_360564FC 
X-CRM114-Status: GOOD (  42.36  )
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

On Wed, Aug 20, 2025 at 12:29=E2=80=AFPM Vasanthakumar Thiagarajan
<vasanthakumar.thiagarajan@oss.qualcomm.com> wrote:
>
>
>
> On 8/20/2025 2:03 PM, Balsam Chihi wrote:
> > On Wed, Aug 20, 2025 at 10:03=E2=80=AFAM Vasanthakumar Thiagarajan
> > <quic_vthiagar@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 8/19/2025 2:20 PM, Balsam Chihi wrote:
> >>> Hello,
> >>> I Have a question on the same subject but not related to the bug.
> >>> I have many identical PCIe WiFi cards on the system and I need to loa=
d
> >>> a different board-2.bin on each one (1 adapter per frequency band).
> >>
> >> So you are using multiple pcie devices at the same time in a system
> >> with ath11k? Wondering if you are using any private patches to address
> >> QRTR instance id clash issue [1][2].
> >>
> >
> > I'm not aware of any issue of QRTR instance id clash.
>

To clarify: my setup is based on an NXP LS1088A SoC hosting QCN9074
PCIe cards, using the ath11k_pci driver.
The cards communicate directly over PCIe, and QRTR/QMI infrastructure
is not used or enabled in my system.
Therefore, QRTR instance ID clashes are not applicable in my context.
Maybe QRTR is only applicable for SoC AHB based integrated WiFi IPs?
And I did not use any of the patches [1] and [2].

> Then better take [1] for proper functioning with multiple pcie devices.
> The other one requires a new firmware feature flag.
>
> >
> >>> Is there any kernel built-in solution for that?
> >>> I could not find any, so I had to create a patch that loads a
> >>> different board-2.bin for each card based on the pci device address.
> >>
> >> Current board data selection for QCN from board-2.bin is based on pci+=
chip-id+board-id
> >> combination, not based on pci device address. You can find the chip-id=
 and board-id in the
> >> debug during QMI boot stage. Then you can use ath11k-bdencoder [3] to =
encode those
> >> board data binaries into board-2.bin. This way you can package all the=
 needed board
> >> specific binaries for a hardware into a single board-2.bin. Ath11k boa=
rd data file
> >> load logic uses chip-id and board-id to download the right board data =
for the given
> >> hardware variant.
> >
> > I have multiple PCIe WiFi adapters based on QCN9074 from different
> > manufacturers.
> > The problem is that I could not distinguish between them at the system =
level.
> > All have 0xFF as board ID.
>
> Hmmm, ideally it should have a valid board-id other than 0xff.
>

I asked the manufacturers about it and they said that all their pcie
wifi cards are with
board_id=3D0xFF and I have to use the provided board-2.bin because of
the calibration data,
regulatory date, band capability and many other reasons...
That's why I had the need to write the patch.

> > So, when loading the default board-2.bin they behave the same way.
> > When I contacted the manufacturers they sent me board-2.bin for each
> > configuration :
> > 2x2, 4x4, 2.4Ghz, 5GHz... (maybe calibration data and more?)
> > The default board-2.bin for board ID 0xFF does not support all bands.
> > My requirement is to have 2.4Ghz band on slot 1 and 5Ghz band on slot 2=
.
>
> I can not think of the cleaner solution when board-id is not programmed.
> If you can make changes to ath11k driver and your system has device-tree,
> may be you can add a hack to pass board-id/chip-id through dt (new dt pro=
perties)
> to driver. In any case, you need to encode all your board data binaries i=
nto
> one board-2.bin to enable auto download of the right board data into firm=
ware.
>

Adding DT properties will require patching the driver too to be able
to read them.
So, I already patched it. Without the need to change the DTS.
And as you just said the board id is not programmed...

> > So the patch reads from rootfs a text file named with the pci device ad=
dress,
> > the path to the custom board-2.bin.
> >
> > P.S. : qca-swiss-army-knife did not succeed in decoding the custom
> > board-2.bin files.
>
> I that encoded binary with TLV for each board data or it is board data
> binary itself. You can run ath11k-bdencoder -i <board-2.bin> to
> get the information about the board-2.bin. You can use ath11k-bdencoder -=
e <board-2.bin>
> to extract the board binaries and json used to package the board-2.bin
>

ath11k-bdencoder -i <board-2.bin> and ath11k-bdencoder -e <board-2.bin>
did work for the public board-2.bin file and i was able to extract a
bin file per board id :
bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D160.bin created size: 131072
bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D161.bin created size: 131072
bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D162.bin created size: 131072
bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D255.bin created size: 131072
bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D163.bin created size: 131072
bus=3Dpci,qmi-chip-id=3D0,qmi-board-id=3D164.bin created size: 131072

but the commands did not work for board-2.bin from WiFi card manufacturers.
i noticed that their board-2.bin have the same size as the extracted ones.
I tried to run the commands on the extcraced ones and i've got the same err=
or :
invalid signature found.
This means that their board-2.bin could be integrated to the public board-2=
.bin.
but in my case it is not the solution because of the board_id=3D0xFF.
So, the PCI device address is used to decide which slot will do 2GHz or 5GH=
z,
even if I swap the cards and it's quite useful for me like that.

>
> Vasanth
>
> >>
> >> [1] https://patchwork.kernel.org/project/linux-wireless/list/?series=
=3D692423&state=3D*&order=3Ddate
> >> [2] https://lore.kernel.org/all/20230111170033.32454-1-kvalo@kernel.or=
g/
> >> [3]
> >> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/=
ath11k/ath11k-bdencoder
> >

