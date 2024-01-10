Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51145C4706C
	for <ath11k@archiver.kernel.org>; Wed, 10 Jan 2024 00:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kM8heQLb1WxBeDONq1X7q8jQ8JXiO0fRAK69Y+bY9XY=; b=XXQ8DdczKxkRldvlLUM4ZZk06W
	TdaQrGsrEJrlTGXcIpf6iqx8oQ2oETqgspCBnKNNULVxD3zYNYGjgAxkXekz6DDAo18elKM8fHsZh
	gKv6x5pxDt8nTQuz5EJWm3XDmedcR0aL1vs2azMXMe/PrkomKSIly7FcLIdeJ0LMkBbN7EhNZk/jn
	z5w1dDsbhaVR621zx1poSirPgzTcsh1mvydOxONPP7ta+OFTCG6+hxq3R0S2vBGit6dTI6inluq3F
	9wcpz3kjsM6OJeJGjdpY/KzGQoVSiSv1r2zVYayqybI8r4ntOJ4bE8R6G3i408ioVSBM1wKirVL3K
	PS4/1tEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNMgX-009zLT-03;
	Wed, 10 Jan 2024 00:43:09 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNMgT-009zI2-1b
	for ath11k@lists.infradead.org;
	Wed, 10 Jan 2024 00:43:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso40229661fa.1
        for <ath11k@lists.infradead.org>; Tue, 09 Jan 2024 16:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704847382; x=1705452182; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kM8heQLb1WxBeDONq1X7q8jQ8JXiO0fRAK69Y+bY9XY=;
        b=JNWlpi4AMSjHOtZLR/6aLflfb+QO4QLuMpv6Od2geQSS3TTHSNRj4c+H70EDmfwHOC
         B1tRqJcLKdq4LKz8YwOm41QzaDhzXLjpDjvKITrniteLoGc7yzm8/uN2iwxZbvfTNSEk
         WLEKrmL+B5t6gBVnfdn1McUO65D1VzJJRwsyg7zg49DTPseZCuu7RdtbUiPsPBkjs06x
         HGxfbPmNfK81bgStQaL4hfTyQ29Z7e2KaoAg4Kt5H5s+OXwgrm3q9HIKW3QSzZfczpvn
         i0iq5YNrbsEFRA3nGcl++tToUWjJjwoKSozKwJQ/8f8yjZTtMZGKsBv0z2o59UVb8EIj
         Mq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704847382; x=1705452182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM8heQLb1WxBeDONq1X7q8jQ8JXiO0fRAK69Y+bY9XY=;
        b=RPyA24T4GlZcYZbI3mobbrbjLd8SrmRjVGbvCfq9KWMzbGXof1pWzZM3sSEw30Obf/
         wawd1OdGfHDbbNiV5bPKsIT1CKm2kCOdTIEw+Q/L/ncD85vim1M1nf/sEQDwgl/1HduI
         avUWYt00DY+UWLvaYTb8SC9Iv9xdAI5lzQY72LM94qOcC2/Ac6uxjRCJpQIs4ta3Fhk3
         DfwMVRsqvXvcqvZLMDkViniU9SMw5IjY2bqRSrBuzcimPmlIy+pMbB4NfkFyVBkG0/Ao
         RtgFebNB60H+KK4RTVydT43LsST+x0ycFzBZOU0ddWrkmcAmAweS3rikT3FL9BObnPuG
         C1RA==
X-Gm-Message-State: AOJu0YwvrHnr1PAw4pu0qm7L6QJhzHGRTcJKMBgDsL8eyYC0ZlpUqipu
	ALQ+qtkGFQBackS7ncQuqj+iiwZwdmj5CafhiAc=
X-Google-Smtp-Source: AGHT+IGp7Svf1+qtr+oIJ3lI1JMomxiI1ELL3hpayjh1w0As/k9QdU0Q4TgGJGkw6bBmNF8huV0bjq91MJiwdckEomk=
X-Received: by 2002:a05:651c:1315:b0:2cc:e919:eb8f with SMTP id
 u21-20020a05651c131500b002cce919eb8fmr75322lja.101.1704847381655; Tue, 09 Jan
 2024 16:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20231212031914.47339-1-imguzh@gmail.com> <8734v6ecp1.fsf@kernel.org>
In-Reply-To: <8734v6ecp1.fsf@kernel.org>
From: Zhenghao Gu <imguzh@gmail.com>
Date: Tue, 9 Jan 2024 18:42:50 -0600
Message-ID: <CAMuEUs+ZOwgOmNXSc42H5yFiNWQQiKJL7Q1isBUCBO1AaVsN1g@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath11k: fix IOMMU errors on buffer rings
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_164305_531734_466B6B90 
X-CRM114-Status: GOOD (  18.72  )
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

On Tue, Jan 9, 2024 at 9:41=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrote:
>
> Zhenghao Gu <imguzh@gmail.com> writes:
>
> > virt_to_phys doesn't work on systems with IOMMU enabled,
> > which have non-identity physical-to-IOVA mappings.
>
> Can you give an example of such system? Just curious where you are
> seeing this.

I'm testing on an AMD system with IOMMU enabled in the BIOS and "iommu=3Dno=
pt"
in the kernel command line. I also noticed
https://bugzilla.kernel.org/show_bug.cgi?id=3D217056
which may be the same issue.

>
> > It leads to IO_PAGE_FAULTs like this:
> > [IO_PAGE_FAULT domain=3D0x0023 address=3D0x1cce00000 flags=3D0x0020]
> > and no link can be established.
>
> What do you mean with link in this context? Are you talking about 802.11
> association?

Yes.

>
> > This patch changes that to dma_map_single(), which works correctly.
>
> Good catch. And virt_to_phys() documentation even says this:
>
>  *      This function does not give bus mappings for DMA transfers. In
>  *      almost all conceivable cases a device driver should not be using
>  *      this function
>
> > Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> > Signed-off-by: Zhenghao Gu <imguzh@gmail.com>
>
> Jeff, are you ok with this?
>
> I did some cosmetics changes in the pending branch (removed unnecessary
> parenthesis, reverse xmas tree etc), please check:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=
=3Dpending&id=3Dfefa43d63e1928fce6e8c2bb626900e9ce98ca69

