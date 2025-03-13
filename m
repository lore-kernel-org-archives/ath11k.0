Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50668C28B28
	for <ath11k@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Xw3VpMz8C52VCmdIMX7o+gE7nhbLrip8BqtYuyGvv3Q=; b=bDi5LWXmiw/xN/
	WTdnriUul0dNC8tF27Na0e0lYZxYnd+RRXNuvxD2CpNaCF5cFDZAOncdx5vg/IEH2JhOaz8E5RMM0
	T4Aia+SXLCX3OEM77b1+FXL5Nad5wwnexrJWPb1RwkfCW4uUis14N3zzD5vKbE/xcmoFKWz05Dizl
	/2c+jaEpNGZiFEZjhz4QWB3Cq3AC893qw0kxSkNRXEyMqDwhJzGC/JihrANDL7te3pU2lBsByU+JT
	wrHnvyMoX+8ml9gX/IXlh/B2NHlgbE8oOf0MU2b7sgMnyo8zUtFUrJIW3g1l0FPDrCP6dTxUIBPRW
	UGGlxHp/cSQr66dDKwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmu1-0000000C6Qu-05ZN;
	Thu, 13 Mar 2025 18:03:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmMB-0000000C2cT-1nRi
	for ath11k@lists.infradead.org;
	Thu, 13 Mar 2025 17:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B922BA464EE;
	Thu, 13 Mar 2025 17:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20167C4CEDD;
	Thu, 13 Mar 2025 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741886910;
	bh=ysZJy/pStSvMTNKpMrLF6jzCLOYDpj1uIdVrASzzEoY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dQ2DxQ6sIpOoITZl4zyHIxnBnbZyOGDZNCdr6pjx83cxo7HKyABB0MY5WSzJPQMiy
	 3ol/5oSMjL14PA0/ckuboggAjr77NDLlyW/cF4PCSVOSERWtWivHsQYmquJI5Reogs
	 HM7bSJ5Xii3T05scdfAqplAxvpe8MfMcdZoOUm1paIPCyvWEzJO3msis1SJCp4K1cu
	 ccxcBkbSQ0hqb0svtmMvC8pQ8gomopQTsJ6IY3MkcJ50NnDR9gbOoogZ29hSAaGpyo
	 C7Z1Z+K13kh2VAUFqfC76Fp9gcjIaawMMPBmhHRhM7iyhlimU3im7nE91MoZikvLpk
	 ZsUdRxHkoL0iA==
Date: Thu, 13 Mar 2025 12:28:28 -0500
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
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>
Subject: Re: [PATCH v2 10/10] wifi: ath11k: add support for MHI bandwidth
 scaling
Message-ID: <20250313172828.GA740705@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-mhi_bw_up-v2-10-869ca32170bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_102831_611533_7DA22F3A 
X-CRM114-Status: GOOD (  21.44  )
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

On Thu, Mar 13, 2025 at 05:10:17PM +0530, Krishna Chaitanya Chundru wrote:
> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> Add support for MHI bandwidth scaling, which will reduce power consumption
> if WLAN operates with lower bandwidth. This feature is only enabled for
> QCA6390.

What is the event that initiates bandwidth scaling or reduces power
consumption?  Is there any kind of user interface like a sysfs knob
an administrator can use?

Does this happen based on ath11k usage?  Battery or thermal status?  

I guess reducing power consumption or reducing heat is probably the
driving factor since we would always use max performance if power and
heat were not issues?

Some hints here would be useful.

> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index 6e45f464a429..74769c0993ae 100644
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
> +
> +	pdev = pci_upstream_bridge(pci_dev);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	return pcie_set_target_speed(pdev, speed, true);

Seems kind of unfortunate that:

  1) The endpoint driver needs to be involved here, even though it
  does nothing that is endpoint-specific, and

  2) The endpoint driver twiddles something in *another* device (the
  upstream bridge).  There's a potential locking issue here and
  potential conflict with any other devices that may be below that
  bridge.

> +}
> +
>  static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
>  {
>  	struct device_node *np;
> @@ -389,6 +428,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>  	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
>  	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
>  	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
> +	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
> +	mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
>  
>  	switch (ab->hw_rev) {
>  	case ATH11K_HW_QCN9074_HW10:
> 
> -- 
> 2.34.1
> 

