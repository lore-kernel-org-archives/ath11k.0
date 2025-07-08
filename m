Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE4BC83F0A
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 17:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tw14MDsa5mRoI3Wmd8Akc6syvcVQTGwpNg+xvK4anuw=; b=xgIbZphqsgbNVInIqBBz5EppSn
	ZaELtYNCudesKg3bukz5FMtqX1KaxbO3TyW0e/xVnw6ErbNKyZ3XnG1Y2+S1U3OcW53P32cgAcUcm
	Hjfpt43Ziu776wjJsW+Z+93McepK15ttLwU4ht0OuRF8K1lF8cxk+jN1ljm0gw3lmepq5YDPIfQyp
	PWvH4pInxZssOUHHp9qq0uIiHomMSkCroD9DxsjsRXzji9JOYWXme903YDDW+Tco7OVPqf8m8Vya4
	R1DQ8UZLew9ZpOtbZeKDzeNwurUI5vNuGYyCkcEgMxnJAmGkBJV9MlfXH/xcMqdyRGbmTa8PeIois
	4d9XcIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBmp-000000063YW-0BF5;
	Tue, 08 Jul 2025 17:07:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBJH-00000005zP6-3oey
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 16:36:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 097A561441;
	Tue,  8 Jul 2025 16:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A70C4CEF5;
	Tue,  8 Jul 2025 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751992606;
	bh=Fq16w6yigup0/1Gx4GUeS33HgO6zOpkQLfv4O0E9MSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MbnSnm+5bQHKagD8W9wVWehev94ceUmcyutF8u7DJo+b8g/pCTmw1SpODtNWmPE5G
	 yaZEld6Ul2QWowEjc5yRk9Ovg+bCv0OdkkhdRf8sj52k5j3jRDuhewufTpyKMA9ry8
	 qRWlHY2bwlQX5y5DnYzZBhOrN/qNUUC3D+eOFyjx1yTRf4WM5r3LvkExHkVXTi64b6
	 7iItAUAoOhYGzangISWBGRyJ6WkGgCIxESvxRVI4w2OBcmK3z+L6YF2IMcHJkJLelW
	 LSbiHalmsVyl63slG2oupucDQPZMQicdFbSttocAR1uRhsE94clqvocOxoKKZ0Y6w8
	 xPIE6AHSTEw9w==
Date: Tue, 8 Jul 2025 22:06:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] bus: mhi: host: Add support to read MHI
 capabilities
Message-ID: <ttjbjmixxbzatcfthaucuy3j4hosu4azpizes6ptxjnkzsawa5@5axodfdyjff2>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-3-3faa8fe92b05@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-mhi_bw_up-v4-3-3faa8fe92b05@qti.qualcomm.com>
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

On Mon, Jun 09, 2025 at 04:21:24PM GMT, Krishna Chaitanya Chundru wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
> located after the ERDB array. The location of this group of registers is
> indicated by the MISCOFF register. Each capability has a capability ID to
> determine which functionality is supported and each capability will point
> to the next capability supported.
> 
> Add a basic function to read those capabilities offsets.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h    | 13 +++++++++++++
>  drivers/bus/mhi/host/init.c | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index dda340aaed95a5573a2ec776ca712e11a1ed0b52..58f27c6ba63e3e6fa28ca48d6d1065684ed6e1dd 100644
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
> @@ -204,6 +208,15 @@
>  #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
>  							       MHI_PKT_TYPE_COALESCING))
>  
> +enum mhi_capability_type {
> +	MHI_CAP_ID_INTX = 0x1,
> +	MHI_CAP_ID_TIME_SYNC = 0x2,
> +	MHI_CAP_ID_BW_SCALE = 0x3,
> +	MHI_CAP_ID_TSC_TIME_SYNC = 0x4,
> +	MHI_CAP_ID_MAX_TRB_LEN = 0x5,
> +	MHI_CAP_ID_MAX,
> +};
> +
>  enum mhi_pkt_type {
>  	MHI_PKT_TYPE_INVALID = 0x0,
>  	MHI_PKT_TYPE_NOOP_CMD = 0x1,
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 13e7a55f54ff45b83b3f18b97e2cdd83d4836fe3..9102ce13a2059f599b46d25ef631f643142642be 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -467,6 +467,40 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	return ret;
>  }
>  
> +static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
> +{
> +	u32 val, cur_cap, next_offset;
> +	int ret;
> +
> +	/* Get the first supported capability offset */
> +	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF, MISC_CAP_MASK, offset);
> +	if (ret)
> +		return ret;
> +
> +	*offset = (__force u32)le32_to_cpu(*offset);

Why do you need __force attribute? What does it suppress? Is it because the
pointer is not le32?

- Mani

> +	do {
> +		if (*offset >= mhi_cntrl->reg_len)
> +			return -ENXIO;
> +
> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
> +		if (ret)
> +			return ret;
> +
> +		val = (__force u32)le32_to_cpu(val);
> +		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
> +		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
> +		if (cur_cap >= MHI_CAP_ID_MAX)
> +			return -ENXIO;
> +
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

-- 
மணிவண்ணன் சதாசிவம்

