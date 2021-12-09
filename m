Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B1DC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 14:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LunjV2i218QG5wuVinwXGSm9J7xqzPRFi4BGybrzamc=; b=acIdHOrcgCNNFR
	tFqjhWebBMCOP8ReymdA/v3UngjhnDQP5afBHdiUBi4yYf+zuqGvOFt6xvX70N+ckvL+e/4vnO1k0
	t/gtyhxpGixaDrq28WHTALkdTRkuTG/p11IivuzhKMmWR2xmrLgF7/HfmQa2G8pvmdu5ABx8e8p1t
	QMF5g+74Kw7m1rPiQtmhWqAmwKU2migDml3jC76uJ9iEabX1N97p9pED0hTp/JyLF0cTRtZh4dDn0
	FGz74yZhuI/Twy8ITgUfr1Z1ukjaohwc/RKoYBqkeWExnO3K5zQcSO2LzQvCMNHHtpWK885VSn0iL
	4bcVF6ZgrCW0JiOOfnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKdC-00GOj8-4A; Thu, 09 Dec 2021 14:42:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKd7-00GOhK-SF
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 14:42:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id u17so4016297plg.9
 for <ath11k@lists.infradead.org>; Thu, 09 Dec 2021 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DlIzAa6h2Qdf88CQ4XAT+zAj7QyEiJFQv1x54NsjTKU=;
 b=izB4Ze5IwkTdDFN2UPnu25PTURU5BM0L76lRpnraNW9aOiFCIfT4kGA9KN4Hsp9dMI
 5yc45D+bNrTlgL5C6Ns35vhPzcgiVqugDyrdKVBl3GWVdyX7aH9sJ2i2mH2PkzvVFpfp
 FMB917/z54Wigzhm2+DyrWiRkYoIHWWOX/zgAVL3aB4rpx/GZM3/vGM6N0eWJ33hutyk
 cUzhIVJRdLGS1R6INlxbilcEnv2sI9plsP0iJ0PcxwL8zJooz2xqotKh3rt6BZUpHseP
 esFGUNhzXQuhALatzTkkVnEAVh3AG3FQzSy8RCUqvAmqnmf7IyCgQOFebnZCQFUodlQp
 EHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DlIzAa6h2Qdf88CQ4XAT+zAj7QyEiJFQv1x54NsjTKU=;
 b=5HMpRT3DUc4jeGZMoY1p+BXkmTfr++4rLuicNB2tSEoc+xo/os+t3O2F8At/zBDCYz
 dwR6my4RWQAiEbxVAMF1mKgaY6Ywun17i0gUfvWkLha/fb5ymSerookXbJgYW4SnOJMb
 QATEm/YtCH330Sqle8gVOp0fXWT1wPIBT5Hz377CPTlWmKCUXhmolur/bvlaX7UWiH0o
 eaFVOdC6jlxVoVdISudV393Wkgzs+HQ/3k2mhGl8hSSX6UbQBaUdqc5UkiGHAvqqdOcy
 3i0oqWGFAcfpRpNqR+CzFVW/nECKX5FCyNhQrlRavkqv1ub4wndQ0e6t/TnV7DvcQ0IH
 pNhw==
X-Gm-Message-State: AOAM533hMiryeI2MGxwNI/fhFHE2/yM5a2jFHEiliYq1fzMA/EZCg0iY
 DU+lHGOhNvas/2Z3tVyzaFiS
X-Google-Smtp-Source: ABdhPJxBp3vk9RdIYD+lyw7hUsxgLabInUSRiWT7uujnDncQbAcGGL+tWLA/fU6V5Iel2x2ks7eahA==
X-Received: by 2002:a17:90b:3149:: with SMTP id
 ip9mr16188630pjb.77.1639060960427; 
 Thu, 09 Dec 2021 06:42:40 -0800 (PST)
Received: from thinkpad ([2409:4072:902:fac4:6231:3e3b:50a6:33a7])
 by smtp.gmail.com with ESMTPSA id b1sm5985623pgk.37.2021.12.09.06.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:42:39 -0800 (PST)
Date: Thu, 9 Dec 2021 20:12:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: gregkh@linuxfoundation.org, mhi@lists.linux.dev, hemantk@codeaurora.org,
 bbhatt@codeaurora.org, loic.poulain@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 stable@vger.kernel.org, Pengyu Ma <mapengyu@gmail.com>
Subject: Re: [PATCH v2] bus: mhi: core: Add support for forced PM resume
Message-ID: <20211209144233.GA9253@thinkpad>
References: <20211209131633.4168-1-manivannan.sadhasivam@linaro.org>
 <87fsr13kya.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fsr13kya.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_064242_045786_A47D2405 
X-CRM114-Status: GOOD (  23.88  )
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

On Thu, Dec 09, 2021 at 04:35:25PM +0200, Kalle Valo wrote:
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
> 
> > From: Loic Poulain <loic.poulain@linaro.org>
> >
> > For whatever reason, some devices like QCA6390, WCN6855 using ath11k
> > are not in M3 state during PM resume, but still functional. The
> > mhi_pm_resume should then not fail in those cases, and let the higher
> > level device specific stack continue resuming process.
> >
> > Add an API mhi_pm_resume_force(), to force resuming irrespective of the
> > current MHI state. This fixes a regression with non functional ath11k WiFi
> > after suspend/resume cycle on some machines.
> >
> > Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179
> >
> > Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
> > Cc: stable@vger.kernel.org #5.13
> > Link: https://lore.kernel.org/regressions/871r5p0x2u.fsf@codeaurora.org/
> > Reported-by: Kalle Valo <kvalo@codeaurora.org>
> > Reported-by: Pengyu Ma <mapengyu@gmail.com>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > [mani: Switched to API, added bug report, reported-by tags and CCed stable]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >
> > Changes in v2:
> >
> > * Switched to a new API "mhi_pm_resume_force()" instead of the "force" flag as
> >   suggested by Greg. The "force" flag is now used inside the API.
> >
> > Greg: I'm sending this patch directly to you so that you can apply it to
> > char-misc once we get an ACK from Kalle.
> 
> Thanks! I now tested this patch on top v5.16-rc4 using QCA6390 and
> firmware WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1, no issues found:
> 
> Tested-by: Kalle Valo <kvalo@kernel.org>
> 
> I'm not expecting any conflicts with ath11k, so please take this via
> Greg's tree. It would be really good to get this regression fixed in
> v5.16, so is it possible to send this to -rc releases?
> 
> For the ath11k part:
> 
> Acked-by: Kalle Valo <kvalo@kernel.org>

Thanks. If this patch looks good to Greg, then it will be queued for the next
-rc release.

Thanks,
Mani

> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
