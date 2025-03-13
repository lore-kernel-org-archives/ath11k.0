Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB950C35FF7
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xFTuMx5Moh/ZipYRIyYO3EWdiBV/NFnVzeKHsFWnjM0=; b=1QuKjP8yxLWNSM
	1a0KM2/vTWX/nx0MKHaU6lDlSxqr2YiYjqiBXp8fe7joUsDWSXw5GZ1y95OD4IBU+vXKwN2wdeT6s
	RuHpXqV4mQ4d7q41dZ914+rF2yL3BSEkwcjS6AjbqtgQDZ2IeeXY4q1u8gwmyqZH2u4BGAjo8NG3g
	+Nq/DdRjUl2/uOMRcW6z3QWqY3PnmdjX/JJDmy5RMciMF5lswSishaoCZbgybHUFC+Y6Gf/nY7Bu5
	Z7d2P1SG+LUz6WQi4rpMbNyqiDH48GY9/J3CR33TxTaHmBzTIBkPH88KmePGudUKBTYAbD9ncRqk4
	0e482l9zQBBp76p4jIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9j-0000000Bz1I-1nvC;
	Thu, 13 Mar 2025 17:15:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslzV-0000000Bv5J-37uW
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 17:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0F69FA477F3;
	Thu, 13 Mar 2025 16:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A13AC4CEDD;
	Thu, 13 Mar 2025 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741885504;
	bh=VCw61kDDKPEEVAbOsalb7B/m4QeaA68e6JeTKmVJYao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oJQAnSaJypK+GCzi7ekXGTtSCo21nK0djOltX04Hrp3bBKT4Hn1eGhXuaUybes1es
	 bk5Sw7XwbSw/ig1HL1V8NZzlUFt01Pxr2NX6honv21EYaU5UmKPsWpQLsoc143QGFE
	 YH0VDr7b1wMJZuuDBqt8G4rKz2PTmh4P2RLcc6+qnF/Y5NVF7PgEmanbYMvE2GK5yq
	 aKxrVLwzZO7qV3SyAhpsYTYY0y59yC2aFp8jOGB5SO7tqcEnpjdB37Xn8qAfDGCknG
	 6nmgB2vArGJOMhFP2JwiRLc7ztFWDgmfAJrNhaewIz8yeKI5PrhSLbIPhnk7Mi5V5B
	 GOSBx0CV/uGOw==
Date: Thu, 13 Mar 2025 12:05:03 -0500
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
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com,
	quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
	quic_mrana@quicinc.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 06/10] bus: mhi: host: Add support to read MHI
 capabilities
Message-ID: <20250313170503.GA738903@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-mhi_bw_up-v2-6-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_100505_915750_CE455E1E 
X-CRM114-Status: GOOD (  19.08  )
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

On Thu, Mar 13, 2025 at 05:10:13PM +0530, Krishna Chaitanya Chundru wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> As per MHI spec sec 6.6, MHI has capability registers which are located
> after the ERDB array. The location of this group of registers is
> indicated by the MISCOFF register. Each capability has a capability ID to
> determine which functionality is supported and each capability will point
> to the next capability supported.
> 
> Add a basic function to read those capabilities offsets.

Sounds like an MHI version of pci_find_capability().  Maybe could be
named similarly too?

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h    |  4 ++++
>  drivers/bus/mhi/host/init.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index dda340aaed95..eedac801b800 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -16,6 +16,7 @@
>  #define MHICFG				0x10
>  #define CHDBOFF				0x18
>  #define ERDBOFF				0x20
> +#define MISCOFF				0x24
>  #define BHIOFF				0x28
>  #define BHIEOFF				0x2c
>  #define DEBUGOFF			0x30
> @@ -113,6 +114,9 @@
>  #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
>  #define MHISTATUS_SYSERR_MASK		BIT(2)
>  #define MHISTATUS_READY_MASK		BIT(0)
> +#define MISC_CAP_MASK			GENMASK(31, 0)
> +#define CAP_CAPID_MASK			GENMASK(31, 24)
> +#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>  
>  /* Command Ring Element macros */
>  /* No operation command */
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index a9b1f8beee7b..0b14b665ed15 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -467,6 +467,35 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	return ret;
>  }
>  
> +static int mhi_get_capability_offset(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
> +{
> +	u32 val, cur_cap, next_offset;
> +	int ret;
> +
> +	/* get the 1st supported capability offset */
> +	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
> +				 MISC_CAP_MASK, offset);
> +	if (ret)
> +		return ret;
> +	do {
> +		if (*offset >= mhi_cntrl->reg_len)
> +			return -ENXIO;
> +
> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
> +		if (ret)
> +			return ret;
> +
> +		cur_cap = FIELD_PREP(CAP_CAPID_MASK, val);
> +		next_offset = FIELD_PREP(CAP_NEXT_CAP_MASK, val);
> +		if (cur_cap == capability)
> +			return 0;
> +
> +		*offset = next_offset;
> +	} while (next_offset);
> +
> +	return -ENXIO;
> +}
> +
>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  {
>  	u32 val;
> 
> -- 
> 2.34.1
> 

