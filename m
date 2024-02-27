Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B562AC5478C
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0zvhbCPiCFCYCeFD7LK8Y8h9az5jZBUIzn1XEZBm2A=; b=F+rYsIWJhJDp1bixc1rBVVQd0C
	jgml3F6IQhlwybpORhNLAb61N/sxr3x/eUH1NDPyVoT2Cxuo71s5ciJKQ92EIXmei0U5KgNgGpv7I
	HJ+okUgAMTZ/GM8N+CQuQc3NyqfvntyjfqFyeNeXScBJyvJFbKNHnp4lrkQN2yeMnp9oGlVO0VAh2
	eEweCsgNDKdtc3Ur7x05f8c6aHRMaB6JWT4qP5XtR/lMbCsye5YYQNMe7OplBeBbRTRVJVhWUaFSf
	l1cfgQxSk3XcFD5kj2nydCO1x0F7RfFo2gtKF34SrfdrpEzNlFX4lm34h87X9xnK2KGLb3H6o0CZw
	vPcx8Wlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuC5-00000004cRr-0Cyz;
	Tue, 27 Feb 2024 09:56:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuC1-00000004cQ0-3Ezz
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 09:56:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dbd32cff0bso29981395ad.0
        for <ath11k@lists.infradead.org>; Tue, 27 Feb 2024 01:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709027768; x=1709632568; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0zvhbCPiCFCYCeFD7LK8Y8h9az5jZBUIzn1XEZBm2A=;
        b=xbbZDdv/9YTnZx50A5c301r8bW91ONwS/GPs7UYaiOT/NUnCUkngeQgyBkla8zPIgr
         mXbaosueRsHnjoLElP+uERe8RUpDgaCIqx803hedil/QArk8CWK4keG5Qcx5Sr0zT4Vr
         ubkDVwQXTeRIyjzWv/bvxXvNk8aEAnyWeN54nfTn9l/ra0f/FPUBXY+uHTRQUsgQh0tr
         ufunfaDckwpAd2EVG6OZohouLnTpfAdBN5Qr7f7E8+Q89B7/3ME4Mva3YLNeMEuRdxbs
         lkORZMPP4rUiumvdyTToDRaQMvm+Zs5jMU9nip8cZjx9U0gBDN3P9KLDIQKjlhQJ0sV9
         MktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709027768; x=1709632568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0zvhbCPiCFCYCeFD7LK8Y8h9az5jZBUIzn1XEZBm2A=;
        b=uSAXQtsTbfLR0wrUmY9DvIhcJ8P8KCbCHVHp15+2IEDouLmQFPg5F4fwoBlgTd61lK
         uPPY5z8PdPmKtqQ/TvRg4Y5qLhvVxmHJOuNQB5NOwA5DUnnQyOeXXldxwAGGWFzjlFU5
         tFhfYeaQK0jZYcDJCQqXH2/Ss3cZndl/z9XJUbSfcf80KKpKwdDU9KYWarHZ9o+dKlJ0
         CJDNcf/BOmfTyFVx9xIVvst1cimqMFE3Q993/u6owJIFUIkCl7U6GQb5QOWQwh4AQEi4
         EatdIRxjpE7vA+ou8OsLvwA/oWa7lgWUTVAL/QOz1W3fGsjjJbApcWlQfTxRHbhotzvP
         vLoQ==
X-Gm-Message-State: AOJu0Yx70yVOFupCSxPJqa2Mv1ESpln9NX1wAeigY4n41TyAPszaO9Bl
	sXKhTVp1y3V+nQucmmPcj2lUlQEiXtXBCIJj/YZSSt70R8XHG1LodcAhTlNJJA==
X-Google-Smtp-Source: AGHT+IE9YTOwwA5pib+X9K66GLYALzgiY71GH4bQuMmT3p83XMqAy3UfA9W4xlkOJqFp3BKOBu0+Xw==
X-Received: by 2002:a17:903:24e:b0:1dc:7890:72d6 with SMTP id j14-20020a170903024e00b001dc789072d6mr10534336plh.22.1709027768485;
        Tue, 27 Feb 2024 01:56:08 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id jz12-20020a170903430c00b001dca68b97d3sm1149704plb.44.2024.02.27.01.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 01:56:08 -0800 (PST)
Date: Tue, 27 Feb 2024 15:26:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] net: qrtr: support suspend/hibernation
Message-ID: <20240227095602.GK2587@thinkpad>
References: <20240227063613.4478-1-quic_bqiang@quicinc.com>
 <20240227063613.4478-3-quic_bqiang@quicinc.com>
 <20240227071531.GD2587@thinkpad>
 <7b743820-850a-4871-a0d8-aded36e11aba@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b743820-850a-4871-a0d8-aded36e11aba@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_015609_840054_1D8AC10A 
X-CRM114-Status: GOOD (  26.62  )
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

On Tue, Feb 27, 2024 at 04:39:41PM +0800, Baochen Qiang wrote:
> 
> 
> On 2/27/2024 3:15 PM, Manivannan Sadhasivam wrote:
> > On Tue, Feb 27, 2024 at 02:36:12PM +0800, Baochen Qiang wrote:
> > > MHI devices may not be destroyed during suspend/hibernation, so need
> > > to unprepare/prepare MHI channels throughout the transition, this is
> > > done by adding suspend/resume callbacks.
> > > 
> > > The suspend callback is called in the late suspend stage, this means
> > > MHI channels are still alive at suspend stage, and that makes it
> > > possible for an MHI controller driver to communicate with others over
> > > those channels at suspend stage. While the resume callback is called
> > > in the early resume stage, for a similar reason.
> > > 
> > > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> > > 
> > > Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > 
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Could you please confirm if this patch can be applied separately and won't cause
> > regression?
> Just searched the kernel and found another two drivers using IPCR channels,
> one is pci_epf_mhi_driver in drivers/pci/endpoint/functions/pci-epf-mhi.c
> and the other is mhi_pci_driver in drivers/bus/mhi/host/pci_generic.c.
> 
> For pci_epf_mhi_driver, this is not impacted because the devices for those
> channels are attached to mhi_ep_bus_type while QRTR MHI driver attached to
> mhi_bus_type.
> 
> For mhi_pci_driver, I am afraid there would be regressions caused by this
> patch. The regression is because when system suspends, mhi_pci_suspend() is
> called and then qcom_mhi_qrtr_pm_suspend_late() called, however the latter
> would fail because MHI is moved to M3 state by call mhi_pm_suspend() in
> mhi_pci_suspend(). To address this, there might be two options: the first is
> to move mhi_pci_suspend() to a late suspend stage which would be called
> after qcom_mhi_qrtr_pm_suspend_late(). and the second is to avoid whole QRTR
> suspend operation in such cases. I prefer the second one, because if MHI is
> going to suspend, instead of power down, it is pointless to unprepare MHI
> channels and re-prepare them after resume back. We can achieve this purpose
> by adding a status_cb() to QRTR MHI driver which would be called when MHI
> goes to low power mode. And then QRTR MHI driver could decide not to
> suspend/resume if low power mode is notified.
> 
> Your thoughts?
> 

I'd rather query the MHI state of the device in suspend/resume callback using
mhi_get_mhi_state(mhi_dev->mhi_cntrl) and if the device is found to be in M3
(suspend) state, then I'd skip prepare/unprepare part.

Because this makes it clear that, if the device is in suspend state, then no
need for the client drivers to unprepare/prepare the channels.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

