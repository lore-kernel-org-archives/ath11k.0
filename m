Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14A1EEE27A
	for <ath11k@archiver.kernel.org>; Fri, 13 Sep 2024 04:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytV/cW8qP0AhnvyRSBmY1oJKJQJ5t2/DISr11I1TwTo=; b=VNFvlqGnj2xzNz2PdNOPmtIINN
	L4xLCUTxW0WGqqgHZsnKG55HbEInNQJbh66rsFIYDXabKkMoiUQBqssTpiPFyBDgJY97A5UGhBA65
	Zlnd6498ncyg8LxDx1oefolLRth3wz0JvEuur111ilKFgbRoux1LXFWmOGGIUl84QDTqOfaVqXrwD
	sFqntdfccKklihGB/HYtsQDlduGpaVBZpR3MVWb73ph6Zso9dh/iykR/jKzYvFWitcAMOe7HetOCQ
	xzdRPxR1p54EwvtbjuIf0JyIsdAzBB26EA5eG0XxZ0zTqkppf0ui4CeeIB0FZHJJdblh+f9QyOKpN
	M3wOjhOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soxgH-0000000Esdm-1IQd;
	Fri, 13 Sep 2024 04:13:13 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soxgE-0000000EsdE-41vp
	for ath11k@lists.infradead.org;
	Fri, 13 Sep 2024 04:13:12 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6b47ff8a59aso4107867b3.2
        for <ath11k@lists.infradead.org>; Thu, 12 Sep 2024 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726200790; x=1726805590; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ytV/cW8qP0AhnvyRSBmY1oJKJQJ5t2/DISr11I1TwTo=;
        b=tYmFYxp5qQ9ZBdxbsO92zpXFnQ4V4crP16RE9xZ+8Fpmi6AB1AwVcqwmB6ijEQwfSC
         GoKCwaquXY2tbVDo2g0l1iDUENWifA3APL3Uu9wG3ZQd+S6qGWVLGkt1SzW4w8MGT87s
         Gq/nCochDvOh7uVZYr439BerNWJDHvYuK9Xqmh+7eMVHfPLBbqZTHiLs6esIX1LQiejY
         eouzqiymAlLTgD+6xTJeyqr6B8+3NxOa4krPGlN2raiSc9RLIhkloQDyYVp1QY+Wyi4V
         fiT6V4G1iFD76Cgm1j+BcNF3E7MiGy40QZ8oJuMKfErQ8BSB66Wx3qsfWzEYEL0r42V5
         AydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726200790; x=1726805590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytV/cW8qP0AhnvyRSBmY1oJKJQJ5t2/DISr11I1TwTo=;
        b=pPtyxO0+OJirmSrHttmWBbVYfvs+ypaM3O7Je6+kc9/clRld6qAi/gpsQOqhkIAbA2
         4j9Da1SOZdS8JfX1pZRx62QEBUftPgmn67ah+aHDkzh6WMJ6TLUUTEyZmLa+GtV7U4zF
         RZK2MQuOk43upvDb+ZfarR95RVSDZRcBXfLZIZpC7WCCVJIzeNEcAq+83X885h0cpQJv
         sXc78uXrprNgqwiFDij8FdkeWRy930hd+ZGgoiGQm2wdBbWCSjR7vz76ByMoidLexF3L
         Hg2JaeB2jEgcFuqcUh+rbpaaHa7U8t8QpX1H0i6nF7758DkiUrARcU8M4ee/8T6dT5Vf
         vQdA==
X-Forwarded-Encrypted: i=1; AJvYcCWahtNvdRYX4VmI/KTneLBN6V9AlRYOl8cy6r6HcmyyBtZEikF8nWDtq9QWEE+mFaHHG3YhSok=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcE/3FDRKTg5Px5TwNZE5FMdtHtc9cluoRe8Z9uiI8eP3nePpM
	QEW8Dw1fP5dZlMGThQKmHVPSMJO/UT3PbYneqay4JWnEI8dJVVrf/Q/aDDRXRJMV/TI5fBFbIvE
	tDowr1aFlEfbhWUfVSHIVXHemcY+ffbDxG4aTIg==
X-Google-Smtp-Source: AGHT+IGFIiFoLnoMrNLvrbA7W6LP9mmwF8lL4/E9ZOuU3zznDzmplHUCmfvd8R2Oa0TFB8WWqzp74sQZmTr6M95s1TY=
X-Received: by 2002:a05:690c:101:b0:6b0:e813:753b with SMTP id
 00721157ae682-6dbcc592e0cmr12578527b3.38.1726200789447; Thu, 12 Sep 2024
 21:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org> <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Sep 2024 07:12:58 +0300
Message-ID: <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Doug Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_211311_033773_D54EA514 
X-CRM114-Status: GOOD (  35.98  )
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

On Fri, 13 Sept 2024 at 05:48, Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Thu, Sep 12, 2024 at 12:24:57PM +0300, Dmitry Baryshkov wrote:
> > Hello,
> >
> > I'm planning to send the following pull request to linux-firmware, adding WiFi
> > DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
> > check if it's fine with all affected maintainers.
> >
> > Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
> > most likely because of the differences in the TZ setup. This pull request adds
> > firmware specific to the qcm6490 / qcs6490 SoC family.
> >
>
> Given that this firmware runs on the SoC, isn't it device specific? Does
> it make sense to carry this under ath11k/, when it's expected to have
> the same form and distribution as the other remoteproc firmware?

This is an interesting question. I think that having all WiFi-related
firmware under athNk makes sense. For example wlanmdsp.mbn files are
also stored under ath10k/WCN3990/ subdirs.
So do q6 and m3 firmware files under ath11k/IPQ*/.

>
> >
> > @Kalle, I understand that you cannot and won't fully support this firmware set.
> > As a preparation to adding these files I moved existing files to the sc7280/
> > subdir and pil-squashed them.  It is a generic preference to use a single MBN
> > file instead of MDT + Bnn files. The mdt_loader detects the format without
> > using the extension, handles the differences internally and doesn't require any
> > changes to the driver or to the DT.  Could you please ack such a change?
> >
>
> I much prefer that we switch this to the single-file version, so I'm
> onboard with this.
>
> >
> > @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
> > and ath11k even if gets executed on the host.  I should have caught this while
> > reviewing DT changes.  This branch uses firmware name that isn't compatible
> > with the existing DT files.  Would you insist on adding compatibility symlink
> > or we'd better fix the DT files?
> >
>
> I think we have a limited user base of sc7280-chrome-common, so we
> should be able to fix up the DeviceTree, and avoid the symlink.

I think we should keep the ath11k/WCN6750/hw1.0/wpss.mdt symlink,
that's fine. I was talking about adding the qcom/qcm6490/wpss.mbn ->
ath11k/WCN6750/hw1.0/wpss.mbn and the same for qcs6490 (just for the
sake of existing DT files) or it's fine to fix the DT files instead
and omit the symlink.

>
> But I'd prefer Doug's ack on that.
>
> > ---
> >
> > The following changes since commit 4a0367b33aeaa7fe1255a920d0e39f825b6985c1:
> >
> >   Merge branch 'rtl8852b' into 'main' (2024-09-11 11:00:41 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> >
> > for you to fetch changes up to fb8c67987c89b6f33fb787dfc6ff6e5e0f317f6d:
> >
> >   ath11k: add device-specific firmware for QCM6490 boards (2024-09-12 11:58:57 +0300)
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (2):
> >       ath11k: move WCN6750 firmware to the device-specific subdir
> >       ath11k: add device-specific firmware for QCM6490 boards
> >
> >  WHENCE                                             |  18 ++++++++----------
> >  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn              | Bin 0 -> 7734064 bytes
>
> qcm or qcs?

qcm6490 as the main location, qcs6490 is symlinked via WHENCE file.

>
> Regards,
> Bjorn
>
> >  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
> >  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
> >  12 files changed, 8 insertions(+), 10 deletions(-)
> >  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> >  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt



-- 
With best wishes
Dmitry

