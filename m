Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C396C433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ktsmmpngb1Xe16r3RQias3PPhhSIEq/CFtD7CDQvnHA=; b=4a6mCUBDpchHZD
	ogjv+ayOuuyBH/KR7pzeKbQlDhtZb2yPplkuyorumKlAAlnQenVWmspoqRpVjn3MWkx6Mcz0vdsSB
	S875JYUIKdFjEXT+vjN4Io9js6LWcuTxYnBonIbQGNxCL4bOhL+oA6RQZ5WYZccxYF81unHzXj2xv
	oPKjMVhWlz3v4u79ybJZGUVL4I7ZaQcPEqvaLq6oYQcYo+vcGOjtT3MTpL11izYBUYMLtY3PruwmI
	OgXrUjMr7o4yacBAvkhUDkcKMxXTVnWYkiVO3c7hLS0mhA8WRkCSQCna30s2Qk+HY4+c29Z24kv+J
	j5HNeojAPibVenc51KFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neX4j-00HLR0-20; Wed, 13 Apr 2022 07:06:01 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neX4b-00HLP6-QL
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 07:05:56 +0000
Received: by mail-pf1-x434.google.com with SMTP id a21so1194648pfv.10
 for <ath11k@lists.infradead.org>; Wed, 13 Apr 2022 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wA/XhN+liF7FNQdYD63xlSjmBiv/wnn45LKu56yG8aw=;
 b=AreLMy3LsZ/2P+aighUoU5gjlgpeBV8R7aO4E6ZmNrH9sPFlHDYfXCQ9dsaQSKUUDZ
 jV695MA6AjTW9RaVAKwYYDjPOSnx5VhKZBhY+t+VOpMmHsvuvmUO3uevsu7U4SoQZX/Q
 hKY670Ht3+qDXUL6ihxfD4vmxjl3ro3ScX1SDiJ3bn9yNvTvyI5Jk5d9mYgm8hoPX7qr
 1+qPrlrepeFD1qFKz+Inw4HQwj7zVmeaIa1RIZvKj+dElNrFnhxT76DSr9HnuNU6qNNj
 CDAr/V+AXPW6hm65wKobzJCFQHpgmZ/HCfP68ZL1bibg1imj6sYE0SrrHqGdYcyfLpKZ
 /IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wA/XhN+liF7FNQdYD63xlSjmBiv/wnn45LKu56yG8aw=;
 b=oqLucXnXDBlh+Z7N2s6lUpNpobE+AvAnxKDa3rLWT73/Nd7CjcdaE1oEDA+MsP83s7
 Xxh4EUn1NQ94MaY2sH0mVI5Zjq2eWTN0Oz0YkoamEJuFC00Pxciq5ZH+MGEc/cHRJf2h
 OPucIFwfr4240zP2uBf0sK8CRyXoggE37uYhdptiXTNN48Cbrgke0cPhl6vlbf3gO8SE
 o4rPIaNRs16z8zusmKgdX0fwxz3LF32xh0ns+zwZ77zs//ABJk8tzvC0QEznfHKND8y6
 Pubd5S3PpemI5bee21/L/4lzRi1+ZoKNf2ofJBs9rCTrtRQBIiRxMFXp++fEVApSYXgS
 dqug==
X-Gm-Message-State: AOAM533g20CXyF6gPpYdKr8G5r/CrSvnvu25h6A/SsWVizSB/aE86xw9
 GnzxQiVhxjIoRUtxP3io+CHF
X-Google-Smtp-Source: ABdhPJzozXDajJ1TNHGEamoE5ZZSxjlxIF5/046swX9Uyn7xnV9vkvwlcsjXH3KBZ12ieR4vKeneWw==
X-Received: by 2002:a05:6a00:10cc:b0:505:ada6:e03e with SMTP id
 d12-20020a056a0010cc00b00505ada6e03emr17405824pfu.45.1649833552212; 
 Wed, 13 Apr 2022 00:05:52 -0700 (PDT)
Received: from thinkpad ([117.207.28.99]) by smtp.gmail.com with ESMTPSA id
 t15-20020a63b70f000000b00381510608e9sm5035307pgf.14.2022.04.13.00.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 00:05:51 -0700 (PDT)
Date: Wed, 13 Apr 2022 12:35:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>,
 Prasad Malisetty <quic_pmaliset@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, bhelgaas@google.com,
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, rajatja@google.com,
 refactormyself@gmail.com, quic_vbadigan@quicinc.com,
 quic_ramkri@quicinc.com, swboyd@chromium.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4] PCI: qcom: Add system PM support
Message-ID: <20220413070542.GB2015@thinkpad>
References: <1646679306-4768-1-git-send-email-quic_pmaliset@quicinc.com>
 <20220412060144.GA41348@thinkpad> <87k0buoa9j.fsf@kernel.org>
 <20220413054904.GA2015@thinkpad>
 <CAA8EJprcQtVFvjL_WsMoDxvPSAqaRMS90ZuTsD_cDuujtr83Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA8EJprcQtVFvjL_WsMoDxvPSAqaRMS90ZuTsD_cDuujtr83Xw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_000553_920598_6428D995 
X-CRM114-Status: GOOD (  24.58  )
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

On Wed, Apr 13, 2022 at 09:36:30AM +0300, Dmitry Baryshkov wrote:
> On Wed, 13 Apr 2022 at 08:49, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Tue, Apr 12, 2022 at 01:40:08PM +0300, Kalle Valo wrote:
> > > + ath11k
> > >
> > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> > >
> > > > +Kalle, linux-wireless
> > > >
> > > > On Tue, Mar 08, 2022 at 12:25:06AM +0530, Prasad Malisetty wrote:
> > > >> Add suspend_noirq and resume_noirq callbacks to handle
> > > >> system suspend and resume in dwc PCIe controller driver.
> > > >>
> > > >> When system suspends, send PME turnoff message to enter
> > > >> link into L2 state. Along with powerdown the PHY, disable
> > > >> pipe clock, switch gcc_pcie_1_pipe_clk_src to XO if mux is
> > > >> supported and disable the pcie clocks, regulators.
> > > >>
> > > >
> > > > Kalle, is this behaviour appropriate for WLAN devices as well? The devices
> > > > will be put into poweroff state (assuming no Vaux provided in D3cold) during
> > > > system suspend.
> > >
> > > ath11k leaves the firmware running during suspend. I don't fully
> > > understand what the patch is doing, but if it cuts the power from the
> > > WLAN chip during suspend that will break ath11k.
> > >
> >
> > Thanks Kalle for the confirmation. Yes the device will be put into D3cold state
> > and that will most likely equal to poweroff state.
> 
> Just to remind that ath11k on Qualcomm boards has a separate power
> supply, not directly tied to the PCIe power supply.
> 

It may change in the future or on a different OEM setup. Irrespective of that,
this patch sends the PME_Turn_Off event to the ep devices. The devices in turn
will shutdown the internal resources for poweroff/refclk removal. Therefore the
device state shall be lost.

Thanks,
Mani

> > Prasad, you should try to just turn off the host resources like clocks and
> > regulators (not refclk) and let the device be in the default state
> > (D3hot/L{0/1}?) during suspend.
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
