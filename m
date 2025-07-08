Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFCDC8303C
	for <ath11k@archiver.kernel.org>; Tue,  8 Jul 2025 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89RzSPZDlqOonhOCsMQr4M/buSfH0vF1XYakKGgUa1A=; b=1pQboF0VjfJXIpLHwrQWeNs7uC
	Ee59pCIqvFv4nSfWgmzo1eidvbgWEo4ABarvXweJ2xZXkK9mVLjz1AbRzxaQAOletxlSaNXMRtAe2
	hqnXJF4dvxi1cUDVt1MlcvWJ1UYUhYtX8wTzCrupGgHPFtOF1xex5gRJzCLxMNSQ3jv3Ue/IRFl1/
	FvXbDsxD5wPDZsZ9hbxHat7a7hBv4SZWnciUpmjOGHLJJoGL8CeIf7msamhlMypyeoIxkBok1PRdW
	Ky3HiG63t24kiUjNwiALHMlyyZ9OwgT/wthk/qV/gj/23mRqxTBAQepp2YiOTv1kLdymeNErEr4P9
	tBLUAImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCVq-00000006ArD-1rI2;
	Tue, 08 Jul 2025 17:53:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC2k-000000066eX-0lN2
	for ath11k@lists.infradead.org;
	Tue, 08 Jul 2025 17:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B409C43A71;
	Tue,  8 Jul 2025 17:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A93C4CEF5;
	Tue,  8 Jul 2025 17:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751995425;
	bh=IL2Ec5vcZd1gBfh4nN8IvjVJbCH2TCDHEEJdjkJNnvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv+unAi3RatHtwdAZ+PtpIEWyLlOsvs0JJiNmgaxCpCMwLn8AtGddyj2nbcLaSU/N
	 7TUssVOmnspDrZEVOIWnnLmhGBrqqeoA6suti0yLBMfNjRUp2BP20w+rIql4mjRfJA
	 6BAXLJTUUGWzX12Sl5dTV46fSCzw7ZYuChb+43xpaelMBEyGhxfn73spu9Nr4rfmfm
	 BsOJFBUx3zoJPikR8L73iCfQ8owzy70lCWgR4DHmz5Yui4oW7GPmirDZ89hvymRNoR
	 fTePvQ3dlE3TZske4RBXO41ev/QS0ARQZz3Hpra5j59vAEND4aSMAp2aiKh0KE6qsr
	 OoMCnIzU+vsrg==
Date: Tue, 8 Jul 2025 22:53:34 +0530
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
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: Re: [PATCH v4 11/11] wifi: ath11k: Add support for MHI bandwidth
 scaling
Message-ID: <7kgg4txp6fqfom7akzcodcvkfyjm6tlkgr6lhnnkluohydoiop@ywax65nn6emn>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-11-3faa8fe92b05@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-mhi_bw_up-v4-11-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_102346_261173_27CC3CB4 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Jun 09, 2025 at 04:21:32PM GMT, Krishna Chaitanya Chundru wrote:
> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> Add support for MHI bandwidth scaling, which will reduce power consumption
> if WLAN operates with lower bandwidth. This feature is only enabled for
> QCA6390.
> 
> Bandwidth scaling is initiated by the endpoint firmware based upon the
> bandwidth requirements, if there is high bandwidth data endpoint requests
> for higher data rates or if there is less bandwidth they request for lower
> data rates to reduce power. Endpoint initiates this through MHI protocol.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index acd76e9392d31192aca6776319ef0829a1c69628..f79507c7a82244f9e9d8a3ae6765df3f9432ae8c 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -20,6 +20,7 @@
>  #define MHI_TIMEOUT_DEFAULT_MS	20000
>  #define RDDM_DUMP_SIZE	0x420000
>  #define MHI_CB_INVALID	0xff
> +#define MHI_BW_SCALE_CHAN_DB 126
>  
>  static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
>  	{
> @@ -73,6 +74,17 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
>  		.client_managed = false,
>  		.offload_channel = false,
>  	},
> +	{
> +		.num_elements = 8,
> +		.irq_moderation_ms = 0,
> +		.irq = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_BW_SCALE,
> +		.priority = 2,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
>  };
>  
>  static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
> @@ -313,6 +325,33 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
>  	writel(val, addr);
>  }
>  
> +static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller *mhi_cntrl,
> +					   enum mhi_er_data_type type)
> +{
> +	if (type == MHI_ER_BW_SCALE)
> +		return MHI_BW_SCALE_CHAN_DB;
> +
> +	return -EINVAL;

-EOPNOTSUPP?

> +}
> +
> +static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
> +				  struct mhi_link_info *link_info)
> +{
> +	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
> +	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
> +	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
> +	struct pci_dev *pdev;
> +
> +	if (!pci_dev)
> +		return -EINVAL;

Is it really possible?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

