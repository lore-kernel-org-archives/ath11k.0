Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F90CE7B1D
	for <ath11k@archiver.kernel.org>; Fri,  6 Sep 2024 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=el2og2tliCL7jdMYZqsyOU9CHsx5llSDTEeU20kATsA=; b=q/uy+mniXx4PpLyw7gjMZIDEEQ
	KnqpIpi9C+WdOT3sc13S1/Bk/rS28yKGvQgqCd0Hpw+f2A4niBu/SkJgM+A8K71l2bWyBkdMR2s9N
	vdJZFEyOZPWrPKtRx+3fk8xop3OyBvvq0gcmMfFz+XYkjx7XJNY5RFAnILtWz7xre9eA0whIFhzx6
	fB1SLoSCgDaR8lYcafa9y8pVqX34bnnLa/qkJABKIb3e7ezy4ocp56+Ep7Yvv8xwy3MAZW2jrXcaL
	ZhYGMj57V/72mi43MgMrdPgiWhe9GwalHCloHRVKUkq18gOFpsW6XZ73fa4mUMgIKrw9L2Ego/vfv
	lhrinjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaKS-0000000CcnV-3MDa;
	Fri, 06 Sep 2024 14:52:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaKP-0000000Ccmv-0bAU
	for ath11k@lists.infradead.org;
	Fri, 06 Sep 2024 14:52:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B404A5C5A2C;
	Fri,  6 Sep 2024 14:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693ABC4CEC4;
	Fri,  6 Sep 2024 14:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725634367;
	bh=3kB8JTs7MpRpTKnwYyM1DCNjyPquzyUbSpH6JXUZUnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1a7U9QaAMgphGBt51CclHTBBa3dFP2CS/XL8IxjXjBp91XcNnaWySmhmI6cP3whm
	 tnM8/gWUFzuQgQS3YjhimhFkDG5aqjDQHpW3I7eKlKYwOWwUSyrtTNshvhvggP8KYB
	 BqTvkU7usoAr+9z+BTwYVuLbapL2wgDc/sHVgrReqStFvsVHCDIHxYN4oZJkZTcvie
	 T7W+nh2nqHjpzXsr+tKUdnbX+vT20GmFYGQvFvHFWE6bL1vtmngRyUc9w8PDJdgVhz
	 960XEXIBvD+s4b03eTmJNzbnwsHydcXss0tRRgDp5GOpGL/DtmY1BOXOM1qWrjNRm/
	 3dnMfjW/2ZFJw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1smaKh-000000005HB-4529;
	Fri, 06 Sep 2024 16:53:08 +0200
Date: Fri, 6 Sep 2024 16:53:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <ZtsXUyBRV9yDeq1P@hovoldconsulting.com>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
 <87v7zagcyf.fsf@kernel.org>
 <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_075249_267780_425C5FD8 
X-CRM114-Status: GOOD (  12.04  )
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

On Thu, Sep 05, 2024 at 10:26:04PM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:

> > There have not been really any naming rules for the variant string, it
> > just needs to be unique so that it doesn't conflict with other variant
> > strings. What have you been thinking?
> 
> QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (following
> marketing name). Or maybe QTI_ instead of QC_. WDYT?

The x1e80100 uses ath12k and the calibration data was recently pushed to
linux firmware (and does not use a calibration variant).

This thread is about sc8280xp and ath11k as I guess you've noticed by
now.

Johan

