Return-Path: <SRS0=juds=GQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F53C433DB
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 10:40:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6968B23122
	for <ath11k@archiver.kernel.org>; Wed, 13 Jan 2021 10:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6968B23122
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=technolu.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hGIbEgLnqSJovFKHZx2NEOO9DfKN/IE6aI9gsS574QI=; b=uEYmX1dnRlxyaNa5V6aG8+xN5
	CmU+FBR7hbMFErdEWUYS4Q4VEGEXTX/qn7xZPAxAeXPVi1FaNz+cZH0tQyiyPJ89qOQJ2S0vTfgZV
	xupbcCcpNYtrXj0aYd9jafHhzg5X9b0y7CZ72V0Dem4Tz8EadmAtfKWTpR7dIiyLr6nxk/+/pHcv8
	tJOx/1dj8rTGMa9tJsKMRsh8fwrD+GG2Y2fZ5fAmuaRmCvtR50CG2FI4emGQFQBu9T3G3D6/DKpJn
	1Ig/OumV5pRpNvKuTDpx/OJ4fa+qM1asiQWImeRm1iGypa5RvzHu5vJGGHSSkt173bUKv+C2b9LFr
	jy06g6LLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdZu-0001VZ-MM; Wed, 13 Jan 2021 10:40:38 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdZs-0001V2-7p
 for ath11k@lists.infradead.org; Wed, 13 Jan 2021 10:40:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id jx16so2324101ejb.10
 for <ath11k@lists.infradead.org>; Wed, 13 Jan 2021 02:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technolu-st.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GGeqU7qntA3NMqLp9xQbkaTusdI81o6twZI9lAMTIes=;
 b=ed7gCnZ34pRwusYV6hayz6nxKtcsvWHe5n4yIl/NGSc+t4L+piO9ZQvOt92VL7XWtw
 BZw6L/EwuwNeaaK5l7ieF+N4wTmcPhf6OGhkZYmC24Efb7/V8euTtW27O5CmCBIr+Hkw
 vx2BQiaTZ3F7WdSVSM3b8aqDPDnSyc9Q8Q3sQ/v9Hk69nlgYYM6fQkwb0XQ0yZS/44Yj
 5a2KFJg+Xw8iEb9uPfCogHtUfB4jh+qbMvLnYLJxzjiRJ+8VqLdk28NqLkNFIV/nY1AJ
 DVbkRE4xTxYLi2Pyvlwc0obvt/5avTLz8jLgkXHWkeKL0y5ReQudRFsccNCj/SLsqMR0
 1diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GGeqU7qntA3NMqLp9xQbkaTusdI81o6twZI9lAMTIes=;
 b=IJG37BV4X66E/C1I3RIv4R96tcEDEbDXIfuRBJ6TTUNa1hzvxJG4cQM2CNGirGvz9/
 QrPRrsHjJZsdgSRUaBPPvS0J9jxOXKIHvqQhBc4nvF9er95OEACL+WSl/fZ2dHL4444y
 BaZ9ayyqtmu+qVBn0p9otXqbqrBi9X1hsAPcp+0su+7BDsH4loHFYrqM3iBGwnSJeA34
 baBBH/Z8X5j/tnNd+Es4GsNaZ+XfWp5S3gQ6YUtB1zXeyRmM2wd6XuzSBXKgr5LI0jKw
 cQCTiPDbrynXsms9dYXgtIOfvbErg7rrQQAYwBiIS/K0NIHt12dkwG+ulR6ZYmEbnDdJ
 48Yg==
X-Gm-Message-State: AOAM533G+mPslQA5ugN3WIkdUDT++CD2OaQy+8KQ1kPuW5BIIAnXsPAP
 Nl0JdTfoa11U4tTgn72MZOpdCC8Q5aGbjD/F6EQxAs6lJ9oarO8M
X-Google-Smtp-Source: ABdhPJymwCiQr2StyuJTKQj6y2PdmveiRHQn89YuyyU4uloaquoCE5Qkmz+mZSMrccfyErC2Fzx/3f+gwvjuJLEOnlM=
X-Received: by 2002:a17:906:77c5:: with SMTP id
 m5mr1081059ejn.424.1610534432045; 
 Wed, 13 Jan 2021 02:40:32 -0800 (PST)
MIME-Version: 1.0
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
In-Reply-To: <87h7nli16d.fsf@codeaurora.org>
From: wi nk <wink@technolu.st>
Date: Wed, 13 Jan 2021 11:40:21 +0100
Message-ID: <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_054036_436334_30D390F3 
X-CRM114-Status: GOOD (  23.60  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 11:25 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Kalle Valo <kvalo@codeaurora.org> writes:
>
> > Mitchell Nordine <mail@mitchellnordine.com> writes:
> >
> >>> But I have now ordered Dell XPS 13 laptop and I should get it in
> >> three weeks, keeping fingers crossed. That should make things easier
> >> as I can test patches myself.
> >>
> >> Hi Kalle, you may already be aware of this, but I just wanted to make sure!
> >>
> >> Not all Dell XPS 13 9310 laptops come with the AX500 connectivity chip
> >> (the one that uses the QCA6390). It seems that only the models with
> >> 32GB RAM tend to come with the AX500 wifi chip.
> >>
> >> Most models appear to come with the AX1650 which I believe uses a
> >> totally different chip and driver that is already well supported in
> >> Linux.
> >>
> >> It might be worth double-checking the model that you have ordered has the AX500.
> >
> > I had heard about that so I did order the 32 GB RAM model and multiple
> > times specified that I only want AX500. So I'm optimistic that I should
> > get the right chip, but you never know how it goes :)
>
> I got the XPS 13 9310 now and it indeed had AX500. But it also has an
> updated BIOS:
>
> [    0.000000] DMI: Dell Inc. XPS 13 9310/0MRT12, BIOS 1.1.4 11/23/2020
>
> And with that I can get 32 MSI vectors:
>
> [    2.758219] ath11k_pci 0000:56:00.0: WARNING: ath11k PCI support is experimental!
> [    2.758778] ath11k_pci 0000:56:00.0: BAR 0: assigned [mem 0x8c300000-0x8c3fffff 64bit]
> [    2.758797] ath11k_pci 0000:56:00.0: enabling device (0000 -> 0002)
> [    2.759086] ath11k_pci 0000:56:00.0: MSI vectors: 32
> [    3.208447] ath11k_pci 0000:56:00.0: qmi req mem_seg[0] 0x3f000000 3522560 1
> [    3.208449] ath11k_pci 0000:56:00.0: qmi req mem_seg[1] 0x3f500000 884736 4
> [    3.215355] ath11k_pci 0000:56:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
> [    3.215358] ath11k_pci 0000:56:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k

Kalle,

  I did see the updated BIOS from a few weeks ago, but I've been a
little hesitant to update since I wasn't sure what would happen or if
I could downgrade.  So to confirm, the new BIOS is allowing the driver
to obtain all 32 msi vectors removing the need for the single MSI
patching?  Does the MHI / M2 behavior also change to work properly?

Thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
