Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BA5C36018
	for <ath11k@archiver.kernel.org>; Fri, 28 Mar 2025 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqxWtIuCcrdkkE46Ko50a5+UC62lfstjJsbJflm6sE4=; b=3UaCKKLMkG1R+sjBeewL4AUaW7
	NT4U8XjsSCWyIjVzwSXQDQBI2H4ijTvjTFPwKJPVnWUSEpT8N/rR+YxsZakuSp1cv1Mh+36Wta3ow
	iA6dYa4aVAkQG7rAycMsa4XFsEkO+7vaSaRrRzNbycoK3onzgyyFtwh34BMTifNU0RFLimUlw62IF
	Yrww9lfvnvV2Dx1uHPF/jj+nm6COdtAt7W3Gi1XYhZL3ZkXbLzOcIvyg3gLUwdWpeJvj2kQrkWfJQ
	sF2cwKULES6CDqu3rg8x8Rb/3JDK0fvLE4ieMMWBFt24pxyAFn2MNR7tXA2WYl3VvC5B4/s/+kKcj
	LUeGln0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyC2Q-0000000DpLF-2QaE;
	Fri, 28 Mar 2025 15:54:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyByK-0000000Doc5-35mT;
	Fri, 28 Mar 2025 15:50:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44FD1614B5;
	Fri, 28 Mar 2025 15:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567E3C4CEE4;
	Fri, 28 Mar 2025 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743177015;
	bh=XpdgurEEM4pGK+nmglwdfRGJx7e9ro+vyFuyinGGwJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/+W/YuSDZSEKfr3TQLkBMnuic/Gx1VKjBmsiasBFVbA8EvKEXxt24hicmGH9DukJ
	 5O54wzgd91elXEKHbSDqEAU+IiA0cx6HjWKgflDkS45vveIsKbnp4m+4eHVpAVm8Tm
	 7ym3HIj/aU0ZIERlEIJt53fTjUm/vQ1Nf3TJv2gdkaSYPqlNouTcfxGj1ACXDBh2/w
	 PtvHKOYPBO8JD3lkxrcLGyuJMMywbAL+NW+fPu/SIuYInFrfRazQsf87Okkkhk77Ej
	 GdSCb+OgH6+E0Ihm1yvhGBrFqCuOu53yXWKT4Vo+ZD0et/sc+5c1w6y/y25TKibNtf
	 nyhMQt//M4miA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tyByO-000000000Hv-0XtU;
	Fri, 28 Mar 2025 16:50:20 +0100
Date: Fri, 28 Mar 2025 16:50:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot
 module
Message-ID: <Z-bFPDk3lziJkUmy@hovoldconsulting.com>
References: <20250328143646.27678-2-johan+linaro@kernel.org>
 <20250328151343.GA1505019@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328151343.GA1505019@bhelgaas>
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

On Fri, Mar 28, 2025 at 10:13:43AM -0500, Bjorn Helgaas wrote:
> On Fri, Mar 28, 2025 at 03:36:43PM +0100, Johan Hovold wrote:
> > Commits b88cbaaa6fa1 ("PCI/pwrctrl: Rename pwrctl files to pwrctrl") and
> > 3f925cd62874 ("PCI/pwrctrl: Rename pwrctrl functions and structures")
> > renamed the "pwrctl" framework to "pwrctrl" for consistency reasons.
> > 
> > Rename also the Kconfig symbols so that they reflect the new name while
> > adding entries for the deprecated ones. The old symbols can be removed
> > once everything that depends on them has been updated.
> 
> I considered changing the Kconfig symbols at the time, but didn't do
> it because I didn't want to break existing .config files.  Is that not
> a concern?  Or do you think the long-term benefit is worth having
> users re-answer these config questions?

I added entries for the old (deprecated) symbol names that select the
new ones so that should not be a problem.

> If we do want this, I would think we should squash all these so we
> don't have breakage between this patch and the following ones.

The entries using the old names make sure that there is no breakage as
long as the patches are applied in order. They also handle any new
users being added to other subsystem trees.

(As I mentioned in the cover letter we can drop those entries after a
couple of releases.)

Johan

