Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3646C433EF
	for <ath11k@archiver.kernel.org>; Sat,  2 Apr 2022 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooNUceC4+ePqFqTIpv5Q4pEFD/2RlV9iy2t2b8avd2A=; b=A6mAWOFraTRzkA
	LzoGVEknRUeD1o94l71FPZPcall5CH1Sem0pFNwj68u7utNn7ndhu4LGYce45wvbekK7rqkrAS9IN
	Qgvo3kOvC10g9behrZe6nevCZks6xkvwUsRtBwf0q1Ox5Od1m56nVSfq2pZD/pY7G5tvn6uILrmgQ
	oyYfpJ9d8z5xNN8vCta2iFfL1w1uTdH3HP+mP4doyKpT9JVoSiVrF1771WN02sUD2gJ042VL6/PDA
	5h2j9Ed/XU3bFXXaNjfJTMf9iuayVlBku7RNQugpF4ewKLqpdetKD1G+yBBhCQsxYEV65CLxi6Dzv
	e1vt/XV43LstcIIY3ubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naaQu-008QJ8-Gd; Sat, 02 Apr 2022 09:52:36 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naaQs-008QIi-5S
 for ath11k@lists.infradead.org; Sat, 02 Apr 2022 09:52:35 +0000
Received: by mail-qt1-x834.google.com with SMTP id o15so2680754qtv.8
 for <ath11k@lists.infradead.org>; Sat, 02 Apr 2022 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rf+Z8BCmAsoqSh2imF0kTHHsFmoLp9md0M8PNzOORW0=;
 b=FpjP+yDw+rd8QIuPn3pAflciBU8szYdoU9YGdbrT3mDllMK2WthyTvaRMVJyXhWwf+
 NZwiHHwVcxGhm9/fc3iVPMB8CtrcqxkWDayKmli159Hi2vbE5Sp+iUAa56LzExqyFzZF
 fqQxgW51lj//KnlluAqJ4+b4rXSU8yW2d8H5Zm7U31dW435C8NQCmKGkDMHDlwsUUV3Y
 C5+qo4qACTYkiJXZ9BiJ4CeT9LkvkfD3isd1pc5xt1bbzjyUWFlpFOWMZsxxgkFmFCzZ
 Ny2uM5CDI3opmvKuHc+JCX88TYNEZnPHxYsdxQuGCC0bGaD/1ZFT/qzxmlKKzmH5yuHZ
 njnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rf+Z8BCmAsoqSh2imF0kTHHsFmoLp9md0M8PNzOORW0=;
 b=MpbMTVfHYWnQAd8ubpIqkexzqdnNETQJaxQQpRlyGrFS94UN6ysUfcje/0TzW0N+vd
 LhNqZbGCs6hBHxgZouSyPbquR5uhS15T5A3vK3yN9xgk0d73pggxrKQipiuKREshmxRD
 LUwhl2xWtqSW0s7waVHLLhiTB4khikzUSXikc85wGFEGqsCxaGXVB905vKvEharv8FsC
 me5yHe7UwDJSWuoiKsUGUkogjRcOR1LiIILmvIr1Y5c1ZKCirKKFD016+iCzH7bDm247
 PFtdw6iUOOAXdeO3Qf3N+H4d0tQxQzJC76+syoGnuY/QAebdrRwHNJpi591JlgwugvrX
 N8IA==
X-Gm-Message-State: AOAM532+rLzHNUQDpcJtad2NA4SY0eM50ROT0ksbi4gSn7R0XwRYNZsl
 z+9ZM+xkcIQ3MEJvJZepGUVwghwwKMEqFBp6aPY=
X-Google-Smtp-Source: ABdhPJzM3PO5vJI14orWCHqDgZL3GwaLuRPCeqgqlwej3gH0Wk3KtPQmkf0ZAisVJGYGwj4tfQH5Nz4ETHT/H2ITgIo=
X-Received: by 2002:a05:622a:4cd:b0:2e1:ec2f:8c22 with SMTP id
 q13-20020a05622a04cd00b002e1ec2f8c22mr11532022qtx.494.1648893152007; Sat, 02
 Apr 2022 02:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220401093554.360211-1-robimarko@gmail.com>
 <87ilrsuab4.fsf@kernel.org>
In-Reply-To: <87ilrsuab4.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Sat, 2 Apr 2022 11:52:21 +0200
Message-ID: <CAOX2RU4pCn8C-HhhuOzyikjk2Ax3VDcjMKh7N6X5HeMN4xLMEg@mail.gmail.com>
Subject: Re: [PATCH] ath11k: select QRTR for AHB as well
To: Kalle Valo <kvalo@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_025234_263786_29A1B653 
X-CRM114-Status: GOOD (  19.16  )
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

On Fri, 1 Apr 2022 at 16:51, Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > Currently, ath11k only selects QRTR if ath11k PCI is selected, however
> > AHB support requires QRTR, more precisely QRTR_SMD because it is using
> > QMI as well which in turn uses QRTR.
> >
> > Without QRTR_SMD AHB does not work, so select QRTR in ATH11K and then
> > select QRTR_SMD for ATH11K_AHB and QRTR_MHI for ATH11K_PCI.
> >
> > Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
> > index ad5cc6cac05b..b45baad184f6 100644
> > --- a/drivers/net/wireless/ath/ath11k/Kconfig
> > +++ b/drivers/net/wireless/ath/ath11k/Kconfig
> > @@ -5,6 +5,7 @@ config ATH11K
> >       depends on CRYPTO_MICHAEL_MIC
> >       select ATH_COMMON
> >       select QCOM_QMI_HELPERS
> > +     select QRTR
> >       help
> >         This module adds support for Qualcomm Technologies 802.11ax family of
> >         chipsets.
> > @@ -15,6 +16,7 @@ config ATH11K_AHB
> >       tristate "Atheros ath11k AHB support"
> >       depends on ATH11K
> >       depends on REMOTEPROC
> > +     select QRTR_SMD
> >       help
> >         This module adds support for AHB bus
> >
> > @@ -22,7 +24,6 @@ config ATH11K_PCI
> >       tristate "Atheros ath11k PCI support"
> >       depends on ATH11K && PCI
> >       select MHI_BUS
> > -     select QRTR
> >       select QRTR_MHI
> >       help
> >         This module adds support for PCIE bus
>
> I now see a new warning:
>
> WARNING: unmet direct dependencies detected for QRTR_SMD
>   Depends on [n]: NET [=y] && QRTR [=m] && (RPMSG [=n] || COMPILE_TEST [=n] && RPMSG [=n]=n)
>   Selected by [m]:
>   - ATH11K_AHB [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH11K [=m] && REMOTEPROC [=y]

Ahh yeah, since it's SMD then it requires RPMGS which in turn requires
more stuff.
What do you think about making it depend on QRTR_SMD instead, because
without it AHB literally does not work?

Regards,
Robert
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
