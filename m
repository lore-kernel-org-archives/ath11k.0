Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDCEC021AA
	for <ath11k@archiver.kernel.org>; Wed, 19 Feb 2025 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hUfRF/9dSTrKR8PGuEgD33owCC+QawYNihvsUbTs4mc=; b=N80oVqMFRGcIlk
	7d+GsO4Wr7KxepNNOpiQHnjdlrsnXSZAEn55EqwA0Lq4AGcGiNqNikWngH4oibJhFqUfSiPfRcT5q
	NnIVn6zQqYhA27oWVXlrz/6pYO/P+WGtOX/njRYQcpXwmYwMW8ZzH5lCnM4h6EM2QmD1dmUbMzphx
	YSyiJ9PH6NTHfpApVOwdYxXbzyZrZBnYdfN/jq0tTm1s8O2ib2lB7Ofe5wk1uKBBF/CMdqGbXhwpC
	zBIs2H4yogIjGHxlNDeXgjgYAZ4Z6h0FrCsfTC8VE5DEJmYFCqwQqdktGvb+jOfLfGBrPcioDaP8O
	RY0BFwyM7g4aOAp1/bhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkooF-0000000EMQ5-2NSk;
	Wed, 19 Feb 2025 18:28:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkonW-0000000EM82-4B6F
	for ath11k@lists.infradead.org;
	Wed, 19 Feb 2025 18:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 325585C5BCB;
	Wed, 19 Feb 2025 18:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B6FC4CED1;
	Wed, 19 Feb 2025 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739989670;
	bh=UIoAHLKhxXMvwRVPNUAgVWM1OzHt8bv2gL9HuSb4s8g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oM/7VpTzi/qHrQlMXfwp1C2byH05D8tZNakXeSfti2tjiRVCusvRpVWuFJUofaKjZ
	 n2MkVMuuW4wNzNLERxr0VDX6bPR6a91Lo8/ONo9SmrsqvFChLUO1MTM4VwTLopoYB3
	 23XJT+Dnbarq/Ci0AYvXIPn2vNFu/a9FdcLD/KdzwdcAeeCyylSLoMe5mRLVctMfO1
	 QCcvib6Am/JwMH7sZvNuQHgfNTSfJmwSwGUsHD2UUvPIQEhRIVT0s11Iy4/93TksRK
	 2XMkZ3frjmXUteUMicgESwd8+nYmUp9e7fd7V6lZL8Ex/9otJIxLJ0DBtoVa5wtW/o
	 fIVXvX6Pk78jA==
Date: Wed, 19 Feb 2025 12:27:46 -0600
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
Message-ID: <20250219182746.GA226108@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0e5efb7-8ea0-a064-21e4-6d7596b1a9ae@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_102751_088443_B15D2E46 
X-CRM114-Status: GOOD (  14.56  )
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

On Wed, Feb 19, 2025 at 11:28:47PM +0530, Krishna Chaitanya Chundru wrote:
> On 2/19/2025 3:37 AM, Bjorn Helgaas wrote:
> > On Mon, Feb 17, 2025 at 12:04:11PM +0530, Krishna Chaitanya Chundru wrote:
> > > QCOM PCIe controllers needs to disable ASPM before initiating link
> > > re-train. So as part of pre_bw_scale() disable ASPM and as part of
> > > post_scale_bus_bw() enable ASPM back.
> > 
> > s/needs/need/
> > 
> > Why does Qcom need to disable ASPM?  Is there a PCIe spec restriction
> > about this that should be applied to all PCIe host bridges?  Or is
> > this a Qcom defect?
> > 
> It is QCOM controller issue, PCIe spec doesn't mention to disable ASPM.

OK.  I'm a little concerned that disabling/enabling
PCIE_LINK_STATE_ALL might clobber preferences set by drivers of
downstream devices, but I guess ...

Maybe we could add a comment in the code about this being done to work
around some Qcom issue so that browsers of
pci_enable_link_state_locked() don't get the idea that this needs to
be done generically.

Bjorn

