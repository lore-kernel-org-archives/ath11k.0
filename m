Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641DFC433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 05:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSqO7esww6zWwDir2OXv85az7uI6MMttVl0jDNeI4dU=; b=fx8NHcvrcwucJq
	IEBYVErHRzUzuhrF5a7/2ZKv9P0meBzlNwTQ6AVCzasgAXG45FdaKkdoM3rpHv2IiNsIwruLWjZKG
	+qz/KeIRck1zFvdf5HUGLUPnI6okG8o4ziz6L4VqHnnXtJSeN/QUEoZMejBZ9j/CxaMwhR8tyOGV0
	umxEMcxrXqFUBcOq3/di3OYbsN9YeT/rJDOH2OCVE3fF8u6x/0QXSUY5jyw7x5xliB+AvzCePA8rD
	Wxuh2L+5EFdhoz0Hkhu1eT14fqFogxceutG0/ss7006SbmUi7S/cKBRhLo0QM32k9iV2VmKs1QAcz
	P7kaHHxnFZD7I73Sq6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neVsV-00GuHz-5Q; Wed, 13 Apr 2022 05:49:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neVsR-00GuGt-IQ
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 05:49:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id bg24so965236pjb.1
 for <ath11k@lists.infradead.org>; Tue, 12 Apr 2022 22:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=++WYL6Zt9T+pjnxfNGqRWUGNrfCfPTVdR2mFPpgsHyM=;
 b=cdrKuK+h/K6zHzr8fXTUAaQxO4P5qOJnyxchmmC453ZSXHQynpsHIPiyhBLk4oGpaO
 Eh1rpq2E7uZCV0NpRM+qLsYHQsXEs4jf9s9LRT5D1rkdC43N/W1JWNo7B6eEK+W+vV/C
 J6qkXgFWLXWMh0a9I82vVTbCR0zOgvafJAUPOzu4Nip4s4fsooQ5ym3bdOb7O5IaUSPT
 UyErhx8P4wiy018SH/Poslyy7cwZOWz1Wa1shwoFeh1S+lRB8fl6g92BCJrU6cgaluns
 d5YdLIIrxxkyHPp2fT0QU3bVXxSShjt1E4LvwvR0l2zzApgHN/XEBwEo0QD/ZbMAaByF
 SQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=++WYL6Zt9T+pjnxfNGqRWUGNrfCfPTVdR2mFPpgsHyM=;
 b=NOk3exmYF2e+b8EojYwluqdMNRIsGXen6ug7oXLAi1IH6H4kBxeWsYE3jXLUnNL0Rj
 Q4HdgDKcTeInw9g3XwtZw5TQRY4rxCJ6uJ72jokedFqmuAcmMo6NTMpwKgr0X0ZltPUN
 ACx+ufRfpuZAfJH/OsVzIawZP/fU44itaPXvd0S2pZU8is2LP/VxnR7qTL55mSXYCJKn
 i9s86gv3IvXfrujOk7awj9f5Aud3twjKtVA94RSGIskfP0rhFLYA6eX92Qma2V7Pu3EB
 TVs6b43VQUbsSDBmQ0WN6hE1blaxqBvrU5dw7JcKRNYk9eo1Pr12lmOxOYD+PQD9AUmI
 +GlA==
X-Gm-Message-State: AOAM532mCWmX4XP3T3w8k9rg0vCi1N3C29E6bery/OVf0UQsLLY/u1tm
 h9pEFh7wHXsmCuEMdslsa/rS
X-Google-Smtp-Source: ABdhPJwcc3PlIFBt3ZP5T+VE0u3r8B82BGVZ12UY01gRML95BVEK1gq3N81z6R3ZtvV9UGa5GBPwRg==
X-Received: by 2002:a17:90a:9313:b0:1cd:4053:9cf3 with SMTP id
 p19-20020a17090a931300b001cd40539cf3mr4621694pjo.182.1649828952972; 
 Tue, 12 Apr 2022 22:49:12 -0700 (PDT)
Received: from thinkpad ([117.207.28.49]) by smtp.gmail.com with ESMTPSA id
 r76-20020a632b4f000000b003820643e1c2sm4776893pgr.59.2022.04.12.22.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 22:49:12 -0700 (PDT)
Date: Wed, 13 Apr 2022 11:19:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Prasad Malisetty <quic_pmaliset@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, bhelgaas@google.com,
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, rajatja@google.com,
 refactormyself@gmail.com, quic_vbadigan@quicinc.com,
 quic_ramkri@quicinc.com, swboyd@chromium.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v4] PCI: qcom: Add system PM support
Message-ID: <20220413054904.GA2015@thinkpad>
References: <1646679306-4768-1-git-send-email-quic_pmaliset@quicinc.com>
 <20220412060144.GA41348@thinkpad> <87k0buoa9j.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0buoa9j.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_224915_647742_FA159168 
X-CRM114-Status: GOOD (  16.17  )
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

On Tue, Apr 12, 2022 at 01:40:08PM +0300, Kalle Valo wrote:
> + ath11k
> 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > +Kalle, linux-wireless
> >
> > On Tue, Mar 08, 2022 at 12:25:06AM +0530, Prasad Malisetty wrote:
> >> Add suspend_noirq and resume_noirq callbacks to handle
> >> system suspend and resume in dwc PCIe controller driver.
> >> 
> >> When system suspends, send PME turnoff message to enter
> >> link into L2 state. Along with powerdown the PHY, disable
> >> pipe clock, switch gcc_pcie_1_pipe_clk_src to XO if mux is
> >> supported and disable the pcie clocks, regulators.
> >> 
> >
> > Kalle, is this behaviour appropriate for WLAN devices as well? The devices
> > will be put into poweroff state (assuming no Vaux provided in D3cold) during
> > system suspend.
> 
> ath11k leaves the firmware running during suspend. I don't fully
> understand what the patch is doing, but if it cuts the power from the
> WLAN chip during suspend that will break ath11k.
> 

Thanks Kalle for the confirmation. Yes the device will be put into D3cold state
and that will most likely equal to poweroff state.

Prasad, you should try to just turn off the host resources like clocks and
regulators (not refclk) and let the device be in the default state
(D3hot/L{0/1}?) during suspend.

Thanks,
Mani

> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
