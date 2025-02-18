Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC68C021AA
	for <ath11k@archiver.kernel.org>; Tue, 18 Feb 2025 23:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=F2dFyZ3ruzYY78f7HN/Z6OXpCQ8qKwHYdxBChXcqC3s=; b=maHekGS5GM38ag
	AFvZ97Adq2aTvmQcvopfIbEtz4DunY5OXuZ2wRVj3OX9GpulHfnUSVc+Hju7sMcumJeTAkrkJHwpz
	xdur2vAOkYYKEP6aX39K5Hu7TOlS8LlKjRsi8RzQEJ5vw7iba21FnG3FZoq4EbjEnfi/ieH74mG0d
	fV/1colymNwB1p3uNIjncRqDo5gmsRIj5Cu/p7406bHf0plA5LK6Y8U9N1cUNOQ8pqWX2BHNy+krI
	UdQHDYfqJWGCWOn6fQwfkBQTqOKlVudkNc+q2wV8HL05xNQWpM2IfVvvhGyYihj8CPpNJ98OATZ29
	zhuRnuP6eWqKCRT3NtmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkWk7-0000000AERw-21kX;
	Tue, 18 Feb 2025 23:11:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVkf-0000000A6KJ-1m1B
	for ath11k@bombadil.infradead.org;
	Tue, 18 Feb 2025 22:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=F2dFyZ3ruzYY78f7HN/Z6OXpCQ8qKwHYdxBChXcqC3s=; b=Aj/pcPeyeRf40W9ZVVcGAq5gEz
	ZeCFRh+44vm7RsooqgPw25N1BCQeQD7IWld39GmxG8GR4SAfjcV4jpL+S9PWv4N2Ugsll7hCbr1pg
	W/L0fXKhfN7BEtY1LqGQ/gbxP9Ho18MYOdLU5iOoXgmfJuz8LO5m1dVxaHJivKSaHAqP0ifLkFmpO
	VzTFEloy5ZVaWxizrIYgkMiFJaWPl4+wyCxUA2nu3YyxXshyEf7TisXI/PRrNIFJUIhvJy+f1XTGh
	/7pMQOGSFRuNgN2QbzuoUMeW/HJgQrQCX1Wx7eWzNFp4PiqunMvWCy8ibe0f2uKq4fF8Epz1YpgoE
	qdN1GYOg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVkc-000000023um-0DLi
	for ath11k@lists.infradead.org;
	Tue, 18 Feb 2025 22:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42A4B5C622A;
	Tue, 18 Feb 2025 22:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A86C4CEE2;
	Tue, 18 Feb 2025 22:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739916450;
	bh=NZOWiC+glLsY8qZo0mE4K4nGd+wVcIoNUq4I6bumeiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XBWsNAQnXEBFVzMi2wOxo+aI15uZwNSrE7WK8dzWdCzuS131u3gCjVmwyiEFHMNm3
	 pM6H8UtOGiaVKAMtsQvc6PPBZ1SJOTiF9SXc0SzOe2qKqNznBRCwvGn2bAaxNUkvqL
	 o1Eeab/OepqaasRX0QMayV8ABDywbK5xFer3PEHM760RpbkNoqIytbQmtzqryOuX/V
	 x10DlupQiN7JHfUdErs+Ya7QroonPr2jf2IZa0qJRneU1f/r509POY5CNCt2i49Czm
	 sMG+SJDZ4n6lgQGEnnhWhiCjXSSk4SXGH4V3LRpDeCEkchs49lb/kxYshH3Hi6D1l+
	 bodSzda7o3FvA==
Date: Tue, 18 Feb 2025 16:07:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, quic_jjohnson@quicinc.com,
	quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH 4/8] PCI: dwc: qcom: Update ICC & OPP votes based upon
 the requested speed
Message-ID: <20250218220728.GA194681@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-mhi_bw_up-v1-4-9bad1e42bdb1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_220734_547734_FD8DB824 
X-CRM114-Status: GOOD (  15.05  )
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

Make subject line match history for this file.

On Mon, Feb 17, 2025 at 12:04:11PM +0530, Krishna Chaitanya Chundru wrote:
> QCOM PCIe controllers needs to disable ASPM before initiating link
> re-train. So as part of pre_bw_scale() disable ASPM and as part of
> post_scale_bus_bw() enable ASPM back.

s/needs/need/

Why does Qcom need to disable ASPM?  Is there a PCIe spec restriction
about this that should be applied to all PCIe host bridges?  Or is
this a Qcom defect?

> Update ICC & OPP votes based on the requested speed so that RPMh votes
> gets updated based on the speed.

s/gets/get/

> Bring out the core logic from qcom_pcie_icc_opp_update() to new function
> qcom_pcie_set_icc_opp().

This refactoring possibly could be a separate patch to make the meat
of this change clearer.

> +static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
> +{
> +	struct dw_pcie *pci = pcie->pci;
> +	unsigned long freq_kbps;
> +	struct dev_pm_opp *opp;
> +	int ret, freq_mbps;
> +
> +	if (pcie->icc_mem) {
> +		ret = icc_set_bw(pcie->icc_mem, 0,
> +				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
> +		if (ret) {
> +			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
> +				ret);
> +		}
> +	} else if (pcie->use_pm_opp) {
> +		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
> +		if (freq_mbps < 0)
> +			return -EINVAL;
> +
> +		freq_kbps = freq_mbps * KILO;
> +		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
> +						 true);
> +		if (!IS_ERR(opp)) {
> +			ret = dev_pm_opp_set_opp(pci->dev, opp);
> +			if (ret)
> +				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
> +					freq_kbps * width, ret);
> +			dev_pm_opp_put(opp);
> +		}
> +	}
> +
> +	return ret;

Looks uninitialized in some paths.

