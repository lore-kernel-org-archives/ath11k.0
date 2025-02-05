Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19853C02192
	for <ath11k@archiver.kernel.org>; Wed,  5 Feb 2025 22:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7QtXsxVavLUFWgY/AN/K9Qycf6vg7WLQZg/R82r5mY=; b=p87BjD0p5ly8OOntQgADIWg3rD
	5gtRsgI9vCbd5DCE71rmhrRICli+OCWKEPfLJYFs5I6yY5davvfTNBPzLx9iXx+qNn3/YIPQWVkNE
	ZGLtItXBm3xwhJoChD6NXAdfGTP6KanwhrKhGYN3kRz5cihazhu0AmQ3jJMem4B6azWit9nAS4Wk/
	Ppauf+a6IrmatIGaeF63dct7g8iQfDr5NfUVrcCT+Dg0nejkgVjMWUiXqIjcl5vzd+1PBzhAxYx5x
	tF0h7Jp0PdcYA4Q4whCVSG0e1teh4FqrOpqrZM37VKzYVQHJWeZG+F7D07HDWQ0d2de9pjC4jQz//
	m3S2Cu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnjq-00000004iEy-2VMb;
	Wed, 05 Feb 2025 22:19:18 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfndO-00000004hLg-3OVs
	for ath11k@lists.infradead.org;
	Wed, 05 Feb 2025 22:12:40 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6f6ca9a3425so2615397b3.2
        for <ath11k@lists.infradead.org>; Wed, 05 Feb 2025 14:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738793557; x=1739398357; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7QtXsxVavLUFWgY/AN/K9Qycf6vg7WLQZg/R82r5mY=;
        b=Uunzp/UUrHp0VYaCEFCLF9+VujD1sE4TKkqa3wKkuxy53CGuFFHnbSYTEEgSG0iKue
         4ZcSXpJeKXGjHPkwlg3PoQP/EI/L9igy//Q1gzlcpQaNAOFVMvbF6yR6BeFyPiZK3rq/
         5ZgagmN/J2p+A08dznSJXd01H7aSp/alVzogRiWfe99E35hpl4QTskxJFA+m9iR6O4LE
         kj5FLA7JT1gmuGXBucWyMS1h23V03Udv1niP5bX/pJoRSkhKij6O8h9Zzz3BaZLIVe0Y
         Cit32pyLm6ZAC7I/tQgukPpa3jVTYIZHL/ZSYvuYY2oOsjC+JMhC8cudQEjJJxLe6ZEG
         G7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738793557; x=1739398357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7QtXsxVavLUFWgY/AN/K9Qycf6vg7WLQZg/R82r5mY=;
        b=uYLtpE2RIS4XYhrFlzaUf9YOOjJ8GIFe4R45VirHExLzpMJBq9Y2hxdiD2Ea05W9t8
         V643FwXt/ZsZs6XOnKaL1KHtD3QzidIuENxVfS+nRG22YEgGbsxjygyYdfF2mFqQyvt2
         LTfPmHVZpXBxIAxHTlPG97Na3rsiUN5s9Ytz079syc2Y/aSP9O09C9U7ScuZW20bKciI
         8DH5yfnz9OykHzRoipLzc6RaV8xzX39OrULkpe2nlQsG2Q3K6rtuSk/LG4wgUYRQmjZH
         JkRJNFZs1ysrWRqrzeZlFTMyh7n0pFSR7iW6XyeuOdCiFGE+hUpC960jhtgCADwst50W
         4OGQ==
X-Gm-Message-State: AOJu0YzMOzr/j8ES9UqRuwV3meuEX7hAnMY1+Dm3JiWNi9rG2RStLb51
	LHD4HSq1b+FHmm5VaQmBpgxoqWmW8uEkw08ITCIZc6MM3JsJbTKhcfgB4so9EGKY7UQvwhUAW/0
	ftYwdfKM7G3Bi8UxfVVrZ4up30Ngu0So8WwG2eZTKXG3pBrLUxV4=
X-Gm-Gg: ASbGnctoNfvXspZWTveAH0lbyqokNzDHhle4wUNhK/XLpwrzpUWxtB6x5P401TmOSha
	NEfp7/z0n9WapUreKeOj3wB0e/PNcfS6hXef626VOLBEWK5i1T0FDC4iwjUzbubHFRIgunHE=
X-Google-Smtp-Source: AGHT+IFhAhS10+zrWdih03o2CEn3V2QZhNOqn9ZUKMdukpqWd+ZlfDyf4YPbIkwfMsg+f4i0a/66NxkBMlOJLtTiWgY=
X-Received: by 2002:a05:690c:48c3:b0:6f6:cad0:9ddd with SMTP id
 00721157ae682-6f989ee68bbmr44089747b3.18.1738793557654; Wed, 05 Feb 2025
 14:12:37 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
 <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com>
In-Reply-To: <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Feb 2025 00:12:28 +0200
X-Gm-Features: AWEUYZm56HWZv5UIHjCax8T-rZJreFLb0juXHGJzpSx4_VuWMdfATxczjYbKKdc
Message-ID: <CAA8EJpoEpbtEDU1kC8xMEM8dxGzG31vSf3wFsaG8+CZky4sanA@mail.gmail.com>
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF, v2
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_141238_867324_B6A5D2EA 
X-CRM114-Status: GOOD (  15.17  )
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

On Wed, 5 Feb 2025 at 20:46, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>
> On 2/4/2025 3:05 PM, Dmitry Baryshkov wrote:
> > Hello,
> >
> > With the hopes of getting this into the February linux-firmware release:
> > Please add the following BDF file to the archive.
> >
> > Changes since v1: added regdb from the same archive
> >
> > * description for what hardware this is
> >   - Qualcomm Robotics RB3 gen2 platform
> >   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> > * origin of the board file
> >   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> > release, licenced under LICENSE.qcom
> > * ids to be used with the board file
> >   - WCN6750 / hw 1.0
> >      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> > * md5sum of each new board file to add
> >
> > 39b270f43cb6d733cde607bf2b23e2be
> > bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> > bfbd247fe961dffc4e7fb413703fb284
> > regdb-bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> >
> >
>
> staged...
> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/ae4407c02a434534590dec3e0ef26b371fd7888b

It's proably not worth it now, but it might be nice to have a
changelog of any kind. Like 'added BDF for Foo Bar' / 'updated BDF for
Foo Baz'. If that's not too troublesome ;-)

-- 
With best wishes
Dmitry

