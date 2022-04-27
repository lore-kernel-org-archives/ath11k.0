Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E472C433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehOvVi49AiWH3u/x/PIyR/xYgXNgwg9MF3D2gpF6YXQ=; b=U6emO5V5e0oy7m
	o17WSXUVzCRnkvV9fLTjuKpfW+TrYQWENXCPaooadrAfZoFo5A6x4p3k/3ZbXIMvplArBW5mUU4qB
	vcvxX8jLiEpyzmytsLi6hD/AmMmfn1Erl1zaUVxaS56o6EW/4Hwf9E8TgL+MjxCbtAxhaFmJLLIxP
	0IzgMTI4SgtkNBLFUU20GQWpNQ6M9CJBnyN2Z6TzlcySUcGqzEsk0TEI8ONqBJj+TganbgYxncJDS
	F6yoq88D5KzIbt8SF9TpN6fKgq3OzNxrnfNRw0MaTALjMqj/gBzGvdK898OKnpf+jPWSucYMqrf34
	hciSyCN0tlLpk9X0W5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nja7v-00HSoj-57; Wed, 27 Apr 2022 05:22:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nja7r-00HSnO-2l
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:22:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89CE0B824B1;
 Wed, 27 Apr 2022 05:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3460C385A7;
 Wed, 27 Apr 2022 05:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651036924;
 bh=Jf5bAmd395nAILviWn9V78VFyFC1FDEPpRKFtHfRsjw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=TNSbSG5obLOcS+gl5pUIRWib5g2Glq9xlsiH5s6rtMEYYFo2OF2FE6JX4tr6tfI2X
 JMGTbyfrOYaGi56ve7uixV1hIjsfjINJik72QSsQCIRf6DVJKH8g0DVQz8VkFgWAPU
 h2mh3hpICGqRgW3REtvcegPxirRU0ZekeLICy7RI2yr38R9qJKsVaanf/jsvgmIF7Q
 FeOXyZX5eHTFCpFPXOVzITK4OBq7T/wb+Y35fy913jY+NmiWN3J7ritr7vCh/njtxE
 aFqrnC8WOUA/CUaDbrGbzpqs8+tKkx1r5uu/gizpIW6fXUQt3sYWVAeW28PYsjWUl9
 C0PmB4uqSP0Gg==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
Subject: Re: [PATCH v4 02/12] ath11k: Add HW params for WCN6750
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <20220406094107.17878-3-quic_mpubbise@quicinc.com>
Date: Wed, 27 Apr 2022 08:21:56 +0300
In-Reply-To: <20220406094107.17878-3-quic_mpubbise@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 6 Apr 2022 15:10:56 +0530")
Message-ID: <87k0bbhzij.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_222207_447626_5AFDB8B0 
X-CRM114-Status: GOOD (  15.93  )
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

> Add HW params for WCN6750. It is similar to the HW params
> of QCA6390 with few differences wrt DP APIs and register
> offsets.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 61 ++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/core.h |  1 +
>  drivers/net/wireless/ath/ath11k/qmi.h  |  2 +
>  3 files changed, 64 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index cbac1919867f..8695f999acb2 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -427,6 +427,67 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.dbr_debug_support = false,
>  		.global_reset = true,
>  	},
> +	{
> +		.name = "wcn6750 hw1.0",
> +		.hw_rev = ATH11K_HW_WCN6750_HW10,
> +		.fw = {
> +			.dir = "WCN6750/hw1.0",
> +			.board_size = 256 * 1024,
> +			.cal_offset = 128 * 1024,
> +		},
> +		.max_radios = 1,
> +		.bdf_addr = 0x4B0C0000,
> +		.ring_mask = &ath11k_hw_ring_mask_qca6390,
> +		.internal_sleep_clock = false,
> +		.qmi_service_ins_id = ATH11K_QMI_WLFW_SERVICE_INS_ID_V01_WCN6750,
> +		.host_ce_config = ath11k_host_ce_config_qca6390,
> +		.ce_count = 9,
> +		.target_ce_config = ath11k_target_ce_config_wlan_qca6390,
> +		.target_ce_count = 9,
> +		.svc_to_ce_map = ath11k_target_service_to_ce_map_wlan_qca6390,
> +		.svc_to_ce_map_len = 14,
> +		.rfkill_pin = 0,
> +		.rfkill_cfg = 0,
> +		.rfkill_on_level = 0,
> +		.single_pdev_only = true,
> +		.rxdma1_enable = false,
> +		.num_rxmda_per_pdev = 1,
> +		.rx_mac_buf_ring = true,
> +		.vdev_start_delay = true,
> +		.htt_peer_map_v2 = false,
> +
> +		.spectral = {
> +			.fft_sz = 0,
> +			.fft_pad_sz = 0,
> +			.summary_pad_sz = 0,
> +			.fft_hdr_len = 0,
> +			.max_fft_bins = 0,
> +		},
> +
> +		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
> +					BIT(NL80211_IFTYPE_AP),
> +		.supports_monitor = false,
> +		.supports_shadow_regs = true,
> +		.idle_ps = true,
> +		.supports_sta_ps = true,
> +		.cold_boot_calib = false,
> +		.fw_mem_mode = 0,
> +		.num_vdevs = 16 + 1,
> +		.num_peers = 512,
> +		.supports_suspend = false,
> +		.supports_regdb = true,
> +		.fix_l1ss = false,
> +		.credit_flow = true,
> +		.max_tx_ring = DP_TCL_NUM_RING_MAX_QCA6390,
> +		.hal_params = &ath11k_hw_hal_params_qca6390,
> +		.supports_dynamic_smps_6ghz = false,
> +		.alloc_cacheable_memory = false,
> +		.supports_rssi_stats = true,
> +		.fw_wmi_diag_event = false,
> +		.current_cc_support = true,
> +		.dbr_debug_support = false,
> +		.global_reset = false,
> +	},

In the pending branch I added:

+               .bios_sar_capa = NULL,

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
