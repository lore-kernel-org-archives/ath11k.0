Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208E9C433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VisO3pu1FR98N9uSCjI7VxyiNkxMAOY2WVZvn0kONXU=; b=Nwb51tTq4BbeAQ
	U78sh1qWu3W2Nc/orSCVqojD+AL423U1uAfkOcTKY/PXj50SqJJQRewKvG4c3ggVz8y52t9UJBnyE
	hFgaDs4LEAz6jABF49APRsIK9hnO8Sr7H0Iu9/PkeBygIJgTTrogqVWu2TIkyALtFUXfSC5vWwAfg
	BrLSSBrWfbg1SbW+N1AerUKMMQnxPdlx3JGLOfZ4xjH/WYuRVSKvTt3ttaWUgJi7ErdK+UGF4VKle
	kNLclYKmYYENgUWW+ltiZi1i0usaaAZUpcHxrFeHE/HLQRE6tLoRK7wtvjThlFZdH3fNTDGFXIFnp
	TEnaZkP2sGXC+TgvrPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njgjj-001JhA-6a; Wed, 27 Apr 2022 12:25:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njgjf-001Jg7-5n
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 12:25:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8CA461A1B;
 Wed, 27 Apr 2022 12:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B406C385A9;
 Wed, 27 Apr 2022 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651062334;
 bh=viH9HrpEjudlC+s+Gw6A65xi/FPxOC8IPbCj+JuLc8Y=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=hGN7T5T66vDe8+HYglSqO0dSYsKgdEbfnNwn0Wf31bKf4Nu5GhCWwV0tvc2xYAcEF
 OekDCKMKPs9HUm9beFh82Mo6bKXHYijjSPta5ygf3f2U7nRusfW/Ua+w0ZPlWNWzuE
 AhM1/MSaZz8aIG1ij8Ob2FrUDTBFeOdJOMS8pvo/kSqyWmAqEeH18o3ccD3b5iXo4w
 8v4U0+80IHJ9DwOIQvxn7YgTNetL6nrktxCivk5V6TVdD4CyGTlfh+XCT6hDRQv0/z
 dQp/WhYnNFMlkl1V5+S3/JN+ZOzrjI6qbOmlnp/dET6dl/0GfEMlqfkm5++m3E8uVX
 +Sj+3mI82nwWw==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
Subject: Re: [PATCH v6 4/9] ath11k: Add register access logic for WCN6750
References: <20220427111848.9257-1-quic_mpubbise@quicinc.com>
 <20220427111848.9257-5-quic_mpubbise@quicinc.com>
Date: Wed, 27 Apr 2022 15:25:28 +0300
In-Reply-To: <20220427111848.9257-5-quic_mpubbise@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 27 Apr 2022 16:48:43 +0530")
Message-ID: <87pml2g1c7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_052535_330605_8B31372C 
X-CRM114-Status: GOOD (  20.56  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> WCN6750 uses static window mapping to access the HW registers.
> Unlike QCN9074 which uses 2nd window for CE and 3rd window
> for UMAC register accesses, WCN6750 uses 1st window for UMAC
> and 2nd window for CE registers.
>
> Code is refactored so that WCN6750 can use the existing
> ath11k_pci_read/write() APIs for accessing the registers.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c  |  6 +++
>  drivers/net/wireless/ath/ath11k/core.h |  2 +
>  drivers/net/wireless/ath/ath11k/pci.c  | 34 ++++++++++++++--
>  drivers/net/wireless/ath/ath11k/pcic.c | 54 +++++++++-----------------
>  4 files changed, 58 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index cfdd415f0203..fa12e50f32f4 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -34,7 +34,10 @@ static const struct ath11k_bus_params ath11k_ahb_bus_params = {
>  	.m3_fw_support = false,
>  	.fixed_bdf_addr = true,
>  	.fixed_mem_region = true,
> +	.static_window_map = false,
>  	.hybrid_bus_type = false,
> +	.dp_window_idx = 0,
> +	.ce_window_idx = 0,
>  };
>  
>  const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
> @@ -42,7 +45,10 @@ const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
>  	.m3_fw_support = false,
>  	.fixed_bdf_addr = false,
>  	.fixed_mem_region = false,
> +	.static_window_map = true,
>  	.hybrid_bus_type = true,
> +	.dp_window_idx = 1,
> +	.ce_window_idx = 2,
>  };
>  
>  #define ATH11K_IRQ_CE0_OFFSET 4
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 51f313dd7f26..ee0ad93d5843 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -756,6 +756,8 @@ struct ath11k_bus_params {
>  	bool fixed_mem_region;
>  	bool static_window_map;
>  	bool hybrid_bus_type;
> +	u8 dp_window_idx;
> +	u8 ce_window_idx;
>  };
>  
>  struct ath11k_pci_ops {
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index ddd1e2de6a2e..9184cb893bd4 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -115,12 +115,26 @@ static const struct ath11k_pci_ops ath11k_pci_ops_qcn9074 = {
>  	.window_read32 = ath11k_pci_window_read32,
>  };
>  
> -static const struct ath11k_bus_params ath11k_pci_bus_params = {
> +static const struct ath11k_bus_params ath11k_pci_bus_params_qca6390 = {
>  	.mhi_support = true,
>  	.m3_fw_support = true,
>  	.fixed_bdf_addr = false,
>  	.fixed_mem_region = false,
> +	.static_window_map = false,
>  	.hybrid_bus_type = false,
> +	.dp_window_idx = 0,
> +	.ce_window_idx = 0,
> +};
> +
> +static const struct ath11k_bus_params ath11k_pci_bus_params_qcn9074 = {
> +	.mhi_support = true,
> +	.m3_fw_support = true,
> +	.fixed_bdf_addr = false,
> +	.fixed_mem_region = false,
> +	.static_window_map = true,
> +	.hybrid_bus_type = false,
> +	.dp_window_idx = 3,
> +	.ce_window_idx = 2,
>  };
>  
>  static const struct ath11k_msi_config msi_config_one_msi = {
> @@ -704,11 +718,26 @@ static int ath11k_pci_probe(struct pci_dev *pdev,
>  {
>  	struct ath11k_base *ab;
>  	struct ath11k_pci *ab_pci;
> +	const struct ath11k_bus_params *bus_params;
>  	u32 soc_hw_version_major, soc_hw_version_minor, addr;
>  	int ret;
>  
> +	switch (pci_dev->device) {
> +	case QCA6390_DEVICE_ID:
> +	case WCN6855_DEVICE_ID:
> +		bus_params = &ath11k_pci_bus_params_qca6390;
> +		break;
> +	case QCN9074_DEVICE_ID:
> +		bus_params = &ath11k_pci_bus_params_qcn9074;
> +		break;

Now you are making bus_params device specific, that's not really the
point of bus params. They are supposed to be _bus_ specific parameters.

Can't you use hw_params like I mentioned in the review?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
