Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7572CA0EDC
	for <ath11k@archiver.kernel.org>; Wed, 20 Aug 2025 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoD6Jvb7fcPgvT4QiYpQRvBShAYWcwKCtyWZSasJpbY=; b=BJPjHRJWwRZVJmnyLz4ufBvLcD
	rNie8uL7xD4xvi3T9WEsl/8bWmgK5yXE2XUzMNvBRPQG6xYwkEj9c9zYU9dHrOizI5+Yy+kxDyXAN
	UcRJXnS86xheaSATxDFgsi5tDWz4WIfSY/jQ0Csau5ep/85IwSI700fYW+ofIc1sOAjpDXjcpcHT9
	uBXMFrn8GPyGVcYp9NrC/+1M7SP11bSoyAwosYOI1PUlyE5Ay+TQKrOOpAp1UZo/EP6JCfpwkI11y
	exeDWNH7K4JxU9JcTNBOhcgwofx4/K3lv7uoTsXDKr2NJ5db+TIp6lV2uTsYE4SKt/3nHmo2odeyN
	dLz4P0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoekm-0000000Cq1w-1JBi;
	Wed, 20 Aug 2025 09:05:08 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uody5-0000000ChFs-3W7A
	for ath11k@lists.infradead.org;
	Wed, 20 Aug 2025 08:14:51 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-53b174ca9bdso4630808e0c.2
        for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1755677688; x=1756282488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoD6Jvb7fcPgvT4QiYpQRvBShAYWcwKCtyWZSasJpbY=;
        b=KiouLgQdXFNm0t7CP1TB9f6WdrVwrcS/LZumv8Tw3cUFksCSt+oLdcTo6HF+LYCPLQ
         rFU/jIKHOfrmzhDJt6bYBEV8xQc0miiwuON+VwX5RJ4IWFEqrMqQxBU56YB3bv7jW9xg
         0u6OEIY1w3jYWIXMcrhbLGcOuOPAJj9Uxgs05Y8W5iVC2nTJXcAcPIIUECG6QlZWGwkD
         EJjmLCfbneQNLIZnzB8LO3erwFt7mJ+YEnkKaNm9ilY4Me4BRscHwoQm2Juvoz/UYVGu
         BJC0tyE1IHXfsyQSSM1i7XSoCSKli/OOodPwdyXJ3uQpPQp2aMohU/cGDXXRMxmF+Q1s
         9JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677688; x=1756282488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoD6Jvb7fcPgvT4QiYpQRvBShAYWcwKCtyWZSasJpbY=;
        b=CfDLR7r/oCpmBDyo1IC+4xaPJ0TKWPSvqtEZDP1Ysmw7byJ/g8A65MKBSsjYt89YUL
         YLo/7PEenY92WIofUY6aTDPTp7Mll7R8bWN0eCfBygZBvL5G0NqCvmNJXtZeyO0jWREv
         DuECLGy3O8etTsMQV+i7ogcPPlLQohp85+2Uk4087RwwoPtIWnDsyeh8yGu/SB9FMIhb
         VlOMmZ8vP4mjkAxWQ0JB9xAFj20k1/vAiR8tRUzM4NnwuccXtgmTaPPEP7ScdB4C+zfa
         yTA2jVRiw7Fv+Edc1lZk7KwQOocZ4dDWyqPweZcvgr9Z7Kw7+SEYvWWQ+XSjwv0p7DCE
         2PDw==
X-Forwarded-Encrypted: i=1; AJvYcCVhS1aNR9uF/yWAGsAY3h4/Hn5moCASBQO0lcIqdc4tfQI/8nazZsBY/1gT3eiHBsnn/emPJDg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPSHGr26QZDcGvzjN50+hJEOihh112aYFO7snKLJZqdWiNiMSy
	wyh6JhxQ3/OQwgmiUwMw+nBs3pAFMPY90bZ7jMTNes8zDQAZ3WlA2svCHs6OwU4VcF1M5FMpdNN
	xv16N0vufRA25rYLMsJSK37ZL6AB38ERI10eRgcfSZg==
X-Gm-Gg: ASbGnctZ1zSuq7oyjFvqDWazcPSffpYp797WjlzVXuNaWjcSTq6TsTWTFVumUpwoWTS
	4rTOMa0eXawsGnj4/+cLkbsY3S1DVrndEh9ft8Q5LZ8qRZSsbC8iv1+2QM90GuePvp9R0ke4ieI
	mM1H7FJkxXbrIcCrSpl4bSu1yLHqrzYC3D4WPwJbNPzxFt3wX0Ti7/vYxqprZqYtRl99Vysnoya
	AC9qi3XWw==
X-Google-Smtp-Source: AGHT+IH8ZPC5VW9vk5vRYJtfgjilWt/wkkgDPxES6TzVbPR9ibWB/LhfOZW2INutNpaHV4M5k/wRJxPg2Uyy3LvOuX0=
X-Received: by 2002:a05:6102:50a6:b0:4fa:d2c:4fe with SMTP id
 ada2fe7eead31-51a513b32d5mr550729137.26.1755677688226; Wed, 20 Aug 2025
 01:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com> <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com> <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
 <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com> <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
 <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com> <1321153053.0.1755624998195@boobie.home>
In-Reply-To: <1321153053.0.1755624998195@boobie.home>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Wed, 20 Aug 2025 10:14:11 +0200
X-Gm-Features: Ac12FXxhBB3Z1Fz5eOxICU2Y5Cr0csO4dqd3bF0XHzDGnb9CHwpO-aDrYx8e05Y
Message-ID: <CAONkfw452N+cOrLo4p7KXOE_W6p=CFHanBReDdnenXrgEY6Cww@mail.gmail.com>
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: Ameer Antar <ameerantar@comcast.net>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_011450_121601_ADA57744 
X-CRM114-Status: GOOD (  22.97  )
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

On Tue, Aug 19, 2025 at 7:36=E2=80=AFPM Ameer Antar <ameerantar@comcast.net=
> wrote:
>
> Balsam, do you have a patch for this? I also have cards that require diff=
erent
> bin files for each band. I haven't been able to figure out how to do this=
 via
> configuration rather than rebuilding drivers.
>

Hello Ameer,

Yes, indeed we have to rebuild ath11k but once with the patched
core.c, not each time we add a card.
Then you can add text files named with the pci device address and the
path to your board-2.bin inside,
for each instance of the driver.
That way we avoid building the driver or the kernel each time we add a
wifi card.
I'm cleaning up the patch and I will send it to the mailing list if
you are interested.

Best regards,
Balsam

> Thanks.
> -Ameer
>
> ----- Original Message -----
> From: Balsam Chihi <balsam.chihi@moment.tech>
> To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
> jjohnson@kernel.org
> Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shu=
tdown
> Date: 8/19/25 4:50:47 AM
>
> >Hello,
> >I Have a question on the same subject but not related to the bug.
> >I have many identical PCIe WiFi cards on the system and I need to load
> >a different board-2.bin on each one (1 adapter per frequency band).
> >Is there any kernel built-in solution for that?
> >I could not find any, so I had to create a patch that loads a
> >different board-2.bin for each card based on the pci device address.
> >I patched ath11k's core.c file so that it reads a string from a text
> >file in the rootfs (board-2.bin path per wifi card).
> >If the text file is not found, the driver loads the default file
> >provided by linux-firmware for all cards, the original behaviour.
> >Please let me know if there is a better solution for that.
> >Best regards.
> >Balsam

