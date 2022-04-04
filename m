Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9129C433FE
	for <ath11k@archiver.kernel.org>; Mon,  4 Apr 2022 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0O2Nr6w0Tu6wyGN4sbUAa/bwF9SxoL7a3KE9atyvb0=; b=JAkRa0I7j/uu95
	dT3Y5+xlmRIIII1o6OUaGkvELLxZy3IRVCULZbUIBJ7NDWrVGJRS4HxaSGAogE0pnEyPtjcFHppgo
	/iP63YeFKFO8F6iIUwkq//0yGxhuH0SrU093mWebk0sctFTb1NKg6J7YqsEJMOK42XqEdNE+/mOZD
	/YLyRMfoexsDg352+3QG2Z6bwWZzqG6i1HpVXR+rLN9QHkc62oqJ2ViPD8MesAY7bUQT9WqpElVTk
	dRbU0rEcADf9zJnUpYBdgr2xu/w3X3/Y8/R8ZPpVzkgfpkJyV13kWkLTKHzW1w2QyqXQqRScYKN4t
	Zs9v6aFwTobCkgDMwHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbI3C-00DqYr-9z; Mon, 04 Apr 2022 08:27:02 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbI39-00DqY1-OX
 for ath11k@lists.infradead.org; Mon, 04 Apr 2022 08:27:01 +0000
Received: by mail-qt1-x831.google.com with SMTP id c4so7110659qtx.1
 for <ath11k@lists.infradead.org>; Mon, 04 Apr 2022 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9B1vDg725ZL75B9hNHdJwVzoV1gBOAZG8QnNdH+UPxA=;
 b=TGG+Z2rYdZzDaSevItzamM42OIU80qWLeqPMTkTiFlEJxRmPVujDHJwDDXgYdExXTl
 Th8He6JC6kEtU2QmNDWKz6+FwBRWhSPyqUENADNgb/wiE37ZcaoNjnJ3tmawIDD9jYqR
 9Yuov0LGuC0CIzVkLbtK8fUjeiQcOA4MjIxh5vmmtxzejMYpLWpuv1jgyDWu8mpe7iOn
 v65RX/l5fJvJtfRlm5L27pG9q8PhaEpuVYzjGrAgxOFyxBDRRHzBXxDasIfbvRNreKu8
 4PqkbsNJdnCE2KX2PjBqSA+E/D1XA+kN+diAKPr8pHdNCYQQJwmHLFAhAE1e3GHaM528
 Am7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9B1vDg725ZL75B9hNHdJwVzoV1gBOAZG8QnNdH+UPxA=;
 b=qtTuuUq39KhT51cFuveaaP20LDfdJ1vaDYrCo2mVUXUxgwjWPsyjCnUfjpKL60lNBq
 6t49yG+zou1AxJAf2JZQp/jZby/QLo6YuNvuSphfXFrSTe0VmTbMmSyVOTNftyUZtUag
 7QA3nFqsga1n0oLZUhuSH66vc17zsXAyEytU9JzTdvYuGmtFXJwICeH9hH2ddOzF/PLo
 /y/F16Vvti9uihKJJLdjoPG96fVG8rGxm0RIkfC/t4L3i4cUy8ikkcSMADwvOcli3RXD
 trIbmpCNHdarnDSaPJd9QQH4ZjIC41Td400q0YQhao/Sza5ZYHDbIAIDCTN3U+ShUPmv
 KkbQ==
X-Gm-Message-State: AOAM5317XfihyXtHH+/Fn761RwT0U97GFLpg5A05V25FBQBmgV85llaw
 V/7r3KhEqDhAFksQqEZg5DEu8bhgyo+WwoIX9fHHaDSVIsk=
X-Google-Smtp-Source: ABdhPJyMyNUGjmhcgxdxcxIUEwWFso/oW3ZHbINEDa3SsiRO5EUgB3PU/yUmWSq8iuC7Ed8DE1CELm3ObEm4rETLdHo=
X-Received: by 2002:ac8:598a:0:b0:2e1:e81a:d059 with SMTP id
 e10-20020ac8598a000000b002e1e81ad059mr16436086qte.297.1649060817152; Mon, 04
 Apr 2022 01:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220401093554.360211-1-robimarko@gmail.com>
 <87ilrsuab4.fsf@kernel.org>
 <CAOX2RU4pCn8C-HhhuOzyikjk2Ax3VDcjMKh7N6X5HeMN4xLMEg@mail.gmail.com>
 <87zgl1s4xr.fsf@kernel.org>
In-Reply-To: <87zgl1s4xr.fsf@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 4 Apr 2022 10:26:46 +0200
Message-ID: <CAOX2RU4+6_64MBxZAT9q0QQvjROteDtAsPiYYYWd-Yjijik91w@mail.gmail.com>
Subject: Re: [PATCH] ath11k: select QRTR for AHB as well
To: Kalle Valo <kvalo@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_012659_855288_25B1B66A 
X-CRM114-Status: GOOD (  24.03  )
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

On Mon, 4 Apr 2022 at 09:06, Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > On Fri, 1 Apr 2022 at 16:51, Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Robert Marko <robimarko@gmail.com> writes:
> >>
> >> > Currently, ath11k only selects QRTR if ath11k PCI is selected, however
> >> > AHB support requires QRTR, more precisely QRTR_SMD because it is using
> >> > QMI as well which in turn uses QRTR.
> >> >
> >> > Without QRTR_SMD AHB does not work, so select QRTR in ATH11K and then
> >> > select QRTR_SMD for ATH11K_AHB and QRTR_MHI for ATH11K_PCI.
> >> >
> >> > Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> >> >
> >> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> >> > ---
> >> >  drivers/net/wireless/ath/ath11k/Kconfig | 3 ++-
> >> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
> >> > index ad5cc6cac05b..b45baad184f6 100644
> >> > --- a/drivers/net/wireless/ath/ath11k/Kconfig
> >> > +++ b/drivers/net/wireless/ath/ath11k/Kconfig
> >> > @@ -5,6 +5,7 @@ config ATH11K
> >> >       depends on CRYPTO_MICHAEL_MIC
> >> >       select ATH_COMMON
> >> >       select QCOM_QMI_HELPERS
> >> > +     select QRTR
> >> >       help
> >> >         This module adds support for Qualcomm Technologies 802.11ax family of
> >> >         chipsets.
> >> > @@ -15,6 +16,7 @@ config ATH11K_AHB
> >> >       tristate "Atheros ath11k AHB support"
> >> >       depends on ATH11K
> >> >       depends on REMOTEPROC
> >> > +     select QRTR_SMD
> >> >       help
> >> >         This module adds support for AHB bus
> >> >
> >> > @@ -22,7 +24,6 @@ config ATH11K_PCI
> >> >       tristate "Atheros ath11k PCI support"
> >> >       depends on ATH11K && PCI
> >> >       select MHI_BUS
> >> > -     select QRTR
> >> >       select QRTR_MHI
> >> >       help
> >> >         This module adds support for PCIE bus
> >>
> >> I now see a new warning:
> >>
> >> WARNING: unmet direct dependencies detected for QRTR_SMD
> >>   Depends on [n]: NET [=y] && QRTR [=m] && (RPMSG [=n] || COMPILE_TEST [=n] && RPMSG [=n]=n)
> >>   Selected by [m]:
> >>   - ATH11K_AHB [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH11K [=m] && REMOTEPROC [=y]
> >
> > Ahh yeah, since it's SMD then it requires RPMGS which in turn requires
> > more stuff. What do you think about making it depend on QRTR_SMD
> > instead, because without it AHB literally does not work?
>
> To be honest I don't know qrtr well enough to comment right now :)

I dont know details about QRTR as well, but I know that its used for
both AHB and PCI versions for QMI.
AHB versions use it over SMD and without it, AHB support wont work, it
will find the HW model and revision and that's it, only after the
QRTR_SMD is inserted you can use QMI to load the caldata etc.

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
