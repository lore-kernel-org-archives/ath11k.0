Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764FFC83F1B
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=W01db+1mczPBTvWVtVitpTOjinfzBwysdxg5Y0eyWHQ=; b=nTknbRzK7fLIFe
	INatqKF+g23+SREKXJvUCQ2RZLSo5bmCHwOJnysC/93O7sCR+j0eX2RVubBN9U8QnGamtRKb4qi4G
	NvtWFTnFRehtJqKXgCvaevdOlWe4Scijwgh9p3JLklgsVbngr1D42E0jiaRMM8uEvYLM8r9tygJoe
	peWM0GILxJqICGexSLR0+gRHmHONZuYxIUwoH6QLiCxb8gxI+6xRo6tgwAuRzrLHmJ498dNyx9H+F
	i+ZHk6Ng7h2lQ/vCBwQJ4m6EApshQbXxMGrLNk4FVfMvb2B8OA968HHKTsVEpraHnnPzCwNXaONV5
	f9qXxjg/Z6BCPNlVgiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLKk-0000000Ftg3-3Vmh;
	Fri, 11 Jul 2025 21:31:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLJa-0000000FtXk-2fbN
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 21:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E8309A5507C;
	Fri, 11 Jul 2025 21:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED08C4CEED;
	Fri, 11 Jul 2025 21:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752269393;
	bh=ibAPHTfDkkiDBSvj4LMehyyAm2RUtgYdLgLWKQky8rg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=IggaAPoQMRlwpsh8jIo0AYU3XJwQulFIQJEQ3ZpCaBuf2mhN01Ksj6WVs1FFYvoG3
	 LCP4gUN3zot5vMpLo0eDtiAp3SFvkZDVoOpH20Dqj03eGwHVGdNoSI6zYLuk+G8hOj
	 eiv6dtO/gFSyswt+lssP5mZyDWHNm9zIMSTum5chnBQELGVGyuxX3nJXDOfMLi7tl9
	 XvuEtFLIss0frhi/0rv8O4EYr4NXbsMPYceY1gEytWYciXqHSQgM6/ANIE1wc912XU
	 mI34+NepD6PGUtB4Ch0quEyTTdgD2er6N5ey2J6p/DPHoSQTsjdztW5Gd/EzAAumvk
	 58UFmRQfSKPvQ==
Date: Fri, 11 Jul 2025 16:29:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] PCI: qcom: Add support for PCIe
 pre/post_link_speed_change()
Message-ID: <20250711212952.GA2308100@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-mhi_bw_up-v4-8-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_142954_736105_7C6625D9 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 09, 2025 at 04:21:29PM +0530, Krishna Chaitanya Chundru wrote:
> QCOM PCIe controllers need to disable ASPM before initiating link
> re-train. So as part of pre_link_speed_change() disable ASPM and as
> part of post_link_speed_change() enable ASPM back.

Is this a QCOM defect?  Or is there something in the PCIe spec about
needing to disable ASPM during retrain?  What about
pcie_retrain_link()?  Does that work on QCOM?

> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -276,10 +276,16 @@ struct qcom_pcie {
>  	struct dentry *debugfs;
>  	bool suspended;
>  	bool use_pm_opp;
> +	int aspm_state; /* Store ASPM state used in pre & post link speed change */

Whatever this is, it's definitely not an int.  Some kind of unsigned
thing of specified size, at least.

