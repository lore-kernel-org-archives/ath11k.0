Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C43C433FE
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cl2tFQ+wEDWbUPc6j72S4z8gDiA8uyDYifThngAR0Sk=; b=2ox7b6qj1mZbMk
	AJBN2oD6p2GVdU1EXT+VcpeCdYVd94kmPVDcFr5m2vTJ23trqfnRHndftUpBaAbbdRdEhyRazgRMk
	djwBkUAXHtgheOHvGXV3qzh4Ro3KkOIFrq4OAV3IOweRYstxooQy+Kq0dCAmF2cZwu9DZWKQLvPnK
	uL3W6KGMjbA6J6zUxIDE/JzZlOms+JEj7/lAc1E5ilfEipW3tZ6NLlKAcbqGWd49IfcWXyRMLb/E1
	Fv+GqBS6f56nsUo/Et2Mc9gT9wVOqsyyN9C3dVtsKpM5T3qHXM7DKVXgbB5HFZVz0p7+IprK6FcIQ
	j8eSBW+Pt1t2mIl38VZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWdD-00HCnh-In; Wed, 13 Apr 2022 06:37:35 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWcO-00HCNJ-NX
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 06:36:52 +0000
Received: by mail-qk1-x72f.google.com with SMTP id c1so672787qkf.13
 for <ath11k@lists.infradead.org>; Tue, 12 Apr 2022 23:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zaz1xfBZfBkVTLKo10m31VgYs16dDCH+Ct0mFM06kiY=;
 b=lBnJxscIgHEjYkuM/OcTyqMvrWMSOz+SY1eRCBWRpWKj2jw4MEJ9xexfDy0dWA/xLS
 5LxVMQW4erWV4JkdSejm+dyvDKx9hOgsyey9F+MXkgWAs4Lvl2c1qYeoDJd7JS6cuVpx
 M5WIdhUgo7FXxqD0QyB+NC+4DNJqj/SxsF577JBW2EIaYm1qwSuiapSZI7j/sNTSo2ub
 j+AX6qiB8R5+9b3SqzXzfVQ0NZnv4ZydBLBNg1IVdzp5KRuuhtL68yHphZIHXvE5/bCi
 yeWK0Du7rfR3RTXKX6uoOh8qVslXy21MsMSaL6rn+QgXmN08JHLEGFEmRC3DYeXFfho1
 DlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zaz1xfBZfBkVTLKo10m31VgYs16dDCH+Ct0mFM06kiY=;
 b=IUaHklOYkOzI2kk0RDRYzjfnaV+K1+PhdXE6DW1L4Hno32eY9n+fGonF7nE3k5hPd1
 qKA7aXz2Y5NTdY1VKmCTrK05ODWVpzsu+NcTohUIEkvaJDbI3D2d1jHvi4Un1XMqJZqQ
 thl+L/2PfbkAfaufD2NPZTOwmfkTfBlSGr+uhQ3NbYEYUDNgh019L5XFxT553ijmL5Z3
 KcramEtKc1O/+zmLn0YqsFaWlgBHHDQo1CDwkPweoniG+Ze58Y7bBbge4DDxN4HXW+KW
 ZR4s02F9OtQTKImopsAZyhHhzC+64+Pn9CNmWNbP/aA1ICcyzywktAiOU5cNyK21vSEq
 njKg==
X-Gm-Message-State: AOAM530IIX7vytBzFintyrS3TasyJd3BBk7L8iic8X5etLrHf/myJ9y6
 goDKdZbOPUYndBWLIsiUWrcRunPi2ByCz42wl/kF0Q==
X-Google-Smtp-Source: ABdhPJxKpHYZQhn8YwZgnRtEI+zJIEYZVP2lfiqFqrqmNGpTycVlUkRzIL6ePAKUpRFurT7uweDBqP3mKRxSle7M+1Y=
X-Received: by 2002:a05:620a:170e:b0:69c:3721:b8e6 with SMTP id
 az14-20020a05620a170e00b0069c3721b8e6mr5697661qkb.593.1649831801497; Tue, 12
 Apr 2022 23:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <1646679306-4768-1-git-send-email-quic_pmaliset@quicinc.com>
 <20220412060144.GA41348@thinkpad> <87k0buoa9j.fsf@kernel.org>
 <20220413054904.GA2015@thinkpad>
In-Reply-To: <20220413054904.GA2015@thinkpad>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Apr 2022 09:36:30 +0300
Message-ID: <CAA8EJprcQtVFvjL_WsMoDxvPSAqaRMS90ZuTsD_cDuujtr83Xw@mail.gmail.com>
Subject: Re: [PATCH v4] PCI: qcom: Add system PM support
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Prasad Malisetty <quic_pmaliset@quicinc.com>,
 agross@kernel.org, 
 bjorn.andersson@linaro.org, lorenzo.pieralisi@arm.com, robh@kernel.org, 
 kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rajatja@google.com, refactormyself@gmail.com, quic_vbadigan@quicinc.com, 
 quic_ramkri@quicinc.com, swboyd@chromium.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_233644_828914_D30C1CA4 
X-CRM114-Status: GOOD (  19.21  )
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

On Wed, 13 Apr 2022 at 08:49, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Tue, Apr 12, 2022 at 01:40:08PM +0300, Kalle Valo wrote:
> > + ath11k
> >
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> >
> > > +Kalle, linux-wireless
> > >
> > > On Tue, Mar 08, 2022 at 12:25:06AM +0530, Prasad Malisetty wrote:
> > >> Add suspend_noirq and resume_noirq callbacks to handle
> > >> system suspend and resume in dwc PCIe controller driver.
> > >>
> > >> When system suspends, send PME turnoff message to enter
> > >> link into L2 state. Along with powerdown the PHY, disable
> > >> pipe clock, switch gcc_pcie_1_pipe_clk_src to XO if mux is
> > >> supported and disable the pcie clocks, regulators.
> > >>
> > >
> > > Kalle, is this behaviour appropriate for WLAN devices as well? The devices
> > > will be put into poweroff state (assuming no Vaux provided in D3cold) during
> > > system suspend.
> >
> > ath11k leaves the firmware running during suspend. I don't fully
> > understand what the patch is doing, but if it cuts the power from the
> > WLAN chip during suspend that will break ath11k.
> >
>
> Thanks Kalle for the confirmation. Yes the device will be put into D3cold state
> and that will most likely equal to poweroff state.

Just to remind that ath11k on Qualcomm boards has a separate power
supply, not directly tied to the PCIe power supply.

> Prasad, you should try to just turn off the host resources like clocks and
> regulators (not refclk) and let the device be in the default state
> (D3hot/L{0/1}?) during suspend.


-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
