Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BBEC369D7
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0yjiKObWEJiwO02DaOrPmXbmFq+eaftYKKT34xnJk0=; b=Tx7o/vudN/S4J2F4TgVMmZs2dB
	4qIjHGCi2//ZtMC6CsbBHjPFBzACM8hqXOgo1BUEk85Amqr/AYZgk7PI+7FC8Qbx2XIWd0GVjmIjz
	XQCJM9ocu9bjtsYM8kb7EFEYtPrKZorHKdOn1caM0QP/yU1rYtTNl3J1Y49J3wyQvygebr0R6OUBn
	0wOk22VIJs7pngQXcVnTniYCvO/YjpQkO6ArUtSaQR5X+VeDVod/Z0TfOwA2c7BgLgMd5eqmG46N4
	4QOWq78qakoL5NtMJfiYCqrF/Sc6lWeLcav0DuMrmaIdEFT/ftr/+Lgszpu4dkPldno1ELgH3APYN
	Rdw9Cxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MUK-00000000KVG-00nW;
	Fri, 25 Apr 2025 17:05:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LFp-000000005yY-2GVw
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 15:46:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7398d65476eso2039560b3a.1
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595976; x=1746200776; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b0yjiKObWEJiwO02DaOrPmXbmFq+eaftYKKT34xnJk0=;
        b=iANBw5hRwq7piPV146/AqkvJMQHOJNaWlJWSth0z+yli9jIT3F73tte9GlNcelac4Q
         LvD4rR7e4JBw0Q2up47NootReEBQDZWYC1zaEEBKI4DdycfEf8wgNEL+z3QcAQIc92iZ
         Odg4uOA5HvRgmaUooZQlOKZhf7wLaYb8Ws6uCLgu4oYFZVkVH6RaAVyNtrNLdhvhfmGl
         7xt40PJVR/ZYV7rBXt2J4U4bpTdYEqR74xH9aN/7V1j45/gCY3n7OQ+R6VHANzlgu/p4
         i+2hQ+gdXF8aKJvSqWyXik7mDAMMoLV0Ok8jRoMSdAc5Pc9vQ2Lsj5TtmbhtowQOXsWX
         1krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595976; x=1746200776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0yjiKObWEJiwO02DaOrPmXbmFq+eaftYKKT34xnJk0=;
        b=nxjryPlVnvOp12mbHUhDYPG2GB3YF0LomVp7fFy7o/4llYWAuox/WBoKtR3DdoWm8v
         ACx/D+jks4P9Qjf0CWCfzgHhEhRu7hTDzer3/K84J1+107qONdcB1ZxOHNvvgl+fKbsU
         Yps6DnsrFyAFr00eTPe4jTLYybRVKgLb1JqV+eFlatOP4GptPzrXxhIVmEhbzSO9l8Et
         YUPmMnUc/xEfLG9rkqx2vBSkMGCV1vLiJLC3GYzipFE5NcJJru+3UqYYXmh2+vp/q8dZ
         j7jUzDo9RpOW7WkbuL6uCLHJnKMiKou7aJLGpg9ZaacAOEPidFqLQiufkENu3qNJIL2r
         dQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMoa0zkYHDR27aaM7yKjAZwS8TVKWeqJ4zppFXJBRuS2X/QQRj3r9QKyWzr2mG1UAPeii8wqc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwlypmoKtbLzCJ/6P8xz5xVAYLN2f7btanBY0Auzr3u3zv2jJD
	0YWfZTZBvRLSH0ptnxQBYxPccybVOeX3RTbmkWbienwcllBMc0chIBNQHw1sUQ==
X-Gm-Gg: ASbGncurf34sBi+w6Sbq2stx6JyeRby6Z+4aCQMK1nV+e6G3ZkbcUyR8+KVp+pyKXmD
	twt9l8GTE3kdZ7boLrGFT0z3m5otom9vImqVwbCz0W4GsoRmWPaRpV0M1gR2qlpMXeds4nsWox2
	OpleZ6lwY5LSnnzEU6OsuKMTpm6myOB/rKCS8AT1RgI67iW7rUVnreTzMVB2BMqk6Sz3/5HWz17
	Wfu8gQM0fhEYvO5yGHApQEEnSKm/81fFWbjv2HL1cknlEtBziUs6i0yVPHdvAkJlO6cylRSxH81
	SX6Cim9ifEWTFmekFIcfW33MOBbStBN3d0jwQza/sabyNR3D9YvL
X-Google-Smtp-Source: AGHT+IGs6qXZbOiWmzBGdrbn2GeizUSvYWBYF7LQu+E/gHowSvXPMU/F/cIhQAuYikQ05w1s5IHkLg==
X-Received: by 2002:a05:6a00:e1b:b0:736:b3cb:5db with SMTP id d2e1a72fcca58-73e268ee7b6mr11186888b3a.11.1745595976351;
        Fri, 25 Apr 2025 08:46:16 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25967608sm3316408b3a.81.2025.04.25.08.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:46:15 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:16:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 01/10] PCI: update current bus speed as part of
 pci_bus_add_devices()
Message-ID: <azxdhgvf6vo6eilmdmxa2ryir33h5uqwuru2a7jrgjuunyncrb@q3fdjhcaskjm>
References: <20250313-mhi_bw_up-v2-1-869ca32170bf@oss.qualcomm.com>
 <20250313170001.GA738398@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313170001.GA738398@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_084617_576007_F63E635B 
X-CRM114-Status: GOOD (  26.42  )
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

On Thu, Mar 13, 2025 at 12:00:01PM -0500, Bjorn Helgaas wrote:
> [+cc Bartosz since this is related to pwrctrl]
> 
> On Thu, Mar 13, 2025 at 05:10:08PM +0530, Krishna Chaitanya Chundru wrote:
> > If the link is not up till the pwrctl drivers enable power to endpoints
> > then cur_bus_speed will not be updated with correct speed.
> > 
> > As part of rescan, pci_bus_add_devices() will be called and as part of
> > it update the link bus speed.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >  drivers/pci/bus.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> > index 98910bc0fcc4..994879071d4c 100644
> > --- a/drivers/pci/bus.c
> > +++ b/drivers/pci/bus.c
> > @@ -432,6 +432,9 @@ void pci_bus_add_devices(const struct pci_bus *bus)
> >  	struct pci_dev *dev;
> >  	struct pci_bus *child;
> >  
> > +	if (bus->self)
> > +		pcie_update_link_speed((struct pci_bus *)bus);
> 
> Why the cast?  I guess to discard "const"?  I would prefer to avoid
> that if we can.
> 
> The only existing callers of pcie_update_link_speed() are from bwctrl,
> where it obviously makes sense because bwctrl manages link speed, and
> from pci_set_bus_speed() in the pci_alloc_child_bus() path.
> 
> If we call pcie_update_link_speed() here, do we still need the
> pci_set_bus_speed() in pci_alloc_child_bus()?
> 
> Bartosz, so you have any suggestions?  Is there a point in pwrctrl
> where it would make sense to do this, similar to what bwctrl does?
> 

I'm not Bartosz, but I could speak for pwrctrl.

This should really be part of pci_pwrctrl_notify() in pwrctrl driver. Pwrctrl
driver is already getting notified with device additions and removals. So the
update can be performed once the device addition happens.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

