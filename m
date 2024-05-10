Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB90C25B10
	for <ath11k@archiver.kernel.org>; Fri, 10 May 2024 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iIlXXeFM7yBqzEBZlBlI1pxa1tOOAauSQu/IN4LvIo=; b=jjNt1b8xspMlH8ygd+c6TBX537
	Z/2axxSNQHdEZ1KbfUkWGKmyq1nA20FQA5Ft2BVO2ozo65F1zyr1YfXc4YcJMLMUOhNOM+jisiANq
	t855dUKv+MOgG3IMzs08exe5+GMfNuhqN4k38wxULVcouWB5wR7a+8y+qXM3dsU5op2w6sSqZy9YU
	s9InxjNcg0wiHoHJAMSUxXifIPkqJK0OKR9zlKTOIW45x/GrRBkDQR1AngLyJJYdZLXum5VU6fsg/
	ghMTwv39g2XgQoXB+xMVP2fwnY7fQsea4BsCmjxazMzEpR90E2Hs9ZaMRK9O/WQ2lEWRoDvyHS5L4
	I0Hr5cIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QGw-00000005OPp-0uDL;
	Fri, 10 May 2024 13:26:50 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QGs-00000005OOL-10zo
	for ath11k@lists.infradead.org;
	Fri, 10 May 2024 13:26:48 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a59a64db066so526517066b.3
        for <ath11k@lists.infradead.org>; Fri, 10 May 2024 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1715347603; x=1715952403; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iIlXXeFM7yBqzEBZlBlI1pxa1tOOAauSQu/IN4LvIo=;
        b=ZULzOOEVIoe4VU7nGGFcoVdilSOXCXUVkqPZCQqip05i+Q6RZ6FIFb/sBkBzT2zbHP
         4ECq0Fyu3scQZ3iwCTrbsH0P74LaPifRFqk/a3oOVEP4+Ks5NRYESYOD/2HCNFPjxyjC
         qTdYO9X1+P/Od6n3my1WBBXUoSqat8QcZslIxclaUoyP8ll/EyM4NWHG3WPrHSXGh2g5
         4IY6NlkDrxB+oSq+JK9OHgnPa2HNRrGYp7Eu8q1qdWvI9gQkTjQKqJ4sHqPLNPH/qk+G
         Xvxyd639HzWjy4u63mYtH/mywjBL08nsiKHEnqN3ctU9b5IY1wYjlfYUBtYOqpwVS4Z5
         tjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715347603; x=1715952403;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0iIlXXeFM7yBqzEBZlBlI1pxa1tOOAauSQu/IN4LvIo=;
        b=YEjAkan7KTcpKoVMj7j5QIG9TVwtalJWuAsGo9HVORkulin2JQ+twKDud0rzUnZtct
         MJrpl5/eG+EIzlEMm2XpFrJIBgxwyv5/TaAUEO9bLBaePlP9Xiqn/1F+OkcJEQ5/ukEH
         uZLCGcVQRamiTTm9o1atIKdyQdin1NAi+ukuRbqa0pyVtLIyPHSZsHkbLMMbD+Y6kAHi
         0+9TlMsPjdvh8rIGvtApUDZdJBvNCHpJ5auPy+qRlgiirqNAaRntARD8F/dkuAcJss/C
         9JpbQFfr1P07ubDrCTyTWRCPd6JTaEvXENIcV59yyitQgcv8QtiP7418B0X01cW4H5Ap
         wgFQ==
X-Gm-Message-State: AOJu0YxgzcYYwq8O5/4Zg7komb+Tfhtgb0cQYiQtV5WPgF28asrWjDOg
	E48AdbpaGMmyZJxU+KNuRYEO1vF+S6XZl2FYw9D82Yq3lCorzvH0yX81sywOhLttpZizJXr2hoz
	p
X-Google-Smtp-Source: AGHT+IGTi4pxk95vdybc0kHmR4dKJTKOp0Y7wf8e3ELehw3lkLTRS1ItaNDJRp+5wnTDxpAHk3wDmg==
X-Received: by 2002:a17:906:3183:b0:a59:b784:ced4 with SMTP id a640c23a62f3a-a5a2d67873fmr189388166b.75.1715347603450;
        Fri, 10 May 2024 06:26:43 -0700 (PDT)
Received: from localhost (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7d2bsm183791166b.120.2024.05.10.06.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 06:26:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 May 2024 15:26:42 +0200
Message-Id: <D15ZZ5V3YU6Z.10FO9XK11WXFB@fairphone.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <regressions@lists.linux.dev>
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Carl Huang" <quic_cjhuang@quicinc.com>, "Kalle Valo" <kvalo@kernel.org>
X-Mailer: aerc 0.17.0
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
 <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
 <D15TIIDIIESY.D1EKKJLZINMA@fairphone.com> <87jzk2km0g.fsf@kernel.org>
 <93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com>
 <4d60ccf3-455d-4189-9100-d35488b00236@quicinc.com>
In-Reply-To: <4d60ccf3-455d-4189-9100-d35488b00236@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_062646_310440_E720BBA3 
X-CRM114-Status: GOOD (  22.51  )
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

On Fri May 10, 2024 at 3:04 PM CEST, Carl Huang wrote:

<snip>

> > Kalle, looks we're not able to fix it before Sunday as I don't have=20
> > WCN6750 setup to verify the fix. The fix could be to define a dedicated=
=20
> > function ath11k_init_wmi_config_wcn6750() for WCN6750. I'll send the=20
> > patch out so others like Luca can have a try.
> >=20
> Sorry, I have problem to run "git send-email" as it prompts "5.7.60=20
> SMTP; Client does not have permissions to send as this sender".
>
> The patch looks like:
>
>  From 19bb7f1377a5e3c5d42ab2bedbaf9e976c1068b4 Mon Sep 17 00:00:00 2001
> From: Carl Huang <quic_cjhuang@quicinc.com>
> Date: Fri, 10 May 2024 19:40:37 +0800
> Subject: [PATCH] wifi:ath11k: fix WCN6750 firmware crash
>
> WCN6750 firmware crashed because of vdev_number changed to 3 from 4
> in commit f019f4dff2e4("wifi: ath11k: support 2 station interfaces").
>
> Fix it by defining a separate function ath11k_init_wmi_config_wcn6750()
> for WCN6750 to initialize its' specific parameters.
>
> Fixes: f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces")
> Tested-on: WCN6855 hw2.0 PCI=20
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>

This seems to work fine also.

Tested-on: wcn6750 hw1.0 AHB WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1

Regards
Luca

> ---
>   drivers/net/wireless/ath/ath11k/hw.c | 49 +++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/hw.c=20
> b/drivers/net/wireless/ath/ath11k/hw.c
> index caa6dc12a790..df8822ac3be1 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.c
> +++ b/drivers/net/wireless/ath/ath11k/hw.c
> @@ -102,6 +102,53 @@ static void ath11k_init_wmi_config_qca6390(struct=20
> ath11k_base *ab,
>   	config->flag1 |=3D WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
>   }
>
> +static void ath11k_init_wmi_config_wcn6750(struct ath11k_base *ab,
> +					   struct target_resource_config *config)
> +{
> +	config->num_vdevs =3D 4;
> +	config->num_peers =3D 16;
> +	config->num_tids =3D 32;
> +
> +	config->num_offload_peers =3D 3;
> +	config->num_offload_reorder_buffs =3D 3;
> +	config->num_peer_keys =3D TARGET_NUM_PEER_KEYS;
> +	config->ast_skid_limit =3D TARGET_AST_SKID_LIMIT;
> +	config->tx_chain_mask =3D (1 << ab->target_caps.num_rf_chains) - 1;
> +	config->rx_chain_mask =3D (1 << ab->target_caps.num_rf_chains) - 1;
> +	config->rx_timeout_pri[0] =3D TARGET_RX_TIMEOUT_LO_PRI;
> +	config->rx_timeout_pri[1] =3D TARGET_RX_TIMEOUT_LO_PRI;
> +	config->rx_timeout_pri[2] =3D TARGET_RX_TIMEOUT_LO_PRI;
> +	config->rx_timeout_pri[3] =3D TARGET_RX_TIMEOUT_HI_PRI;
> +	config->rx_decap_mode =3D TARGET_DECAP_MODE_NATIVE_WIFI;
> +	config->scan_max_pending_req =3D TARGET_SCAN_MAX_PENDING_REQS;
> +	config->bmiss_offload_max_vdev =3D TARGET_BMISS_OFFLOAD_MAX_VDEV;
> +	config->roam_offload_max_vdev =3D TARGET_ROAM_OFFLOAD_MAX_VDEV;
> +	config->roam_offload_max_ap_profiles =3D=20
> TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
> +	config->num_mcast_groups =3D 0;
> +	config->num_mcast_table_elems =3D 0;
> +	config->mcast2ucast_mode =3D 0;
> +	config->tx_dbg_log_size =3D TARGET_TX_DBG_LOG_SIZE;
> +	config->num_wds_entries =3D 0;
> +	config->dma_burst_size =3D 0;
> +	config->rx_skip_defrag_timeout_dup_detection_check =3D 0;
> +	config->vow_config =3D TARGET_VOW_CONFIG;
> +	config->gtk_offload_max_vdev =3D 2;
> +	config->num_msdu_desc =3D 0x400;
> +	config->beacon_tx_offload_max_vdev =3D 2;
> +	config->rx_batchmode =3D TARGET_RX_BATCHMODE;
> +
> +	config->peer_map_unmap_v2_support =3D 0;
> +	config->use_pdev_id =3D 1;
> +	config->max_frag_entries =3D 0xa;
> +	config->num_tdls_vdevs =3D 0x1;
> +	config->num_tdls_conn_table_entries =3D 8;
> +	config->beacon_tx_offload_max_vdev =3D 0x2;
> +	config->num_multicast_filter_entries =3D 0x20;
> +	config->num_wow_filters =3D 0x16;
> +	config->num_keep_alive_pattern =3D 0;
> +	config->flag1 |=3D WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
> +}
> +
>   static void ath11k_hw_ipq8074_reo_setup(struct ath11k_base *ab)
>   {
>   	u32 reo_base =3D HAL_SEQ_WCSS_UMAC_REO_REG;
> @@ -1102,7 +1149,7 @@ const struct ath11k_hw_ops wcn6855_ops =3D {
>
>   const struct ath11k_hw_ops wcn6750_ops =3D {
>   	.get_hw_mac_from_pdev_id =3D ath11k_hw_ipq8074_mac_from_pdev_id,
> -	.wmi_init_config =3D ath11k_init_wmi_config_qca6390,
> +	.wmi_init_config =3D ath11k_init_wmi_config_wcn6750,
>   	.mac_id_to_pdev_id =3D ath11k_hw_mac_id_to_pdev_id_qca6390,
>   	.mac_id_to_srng_id =3D ath11k_hw_mac_id_to_srng_id_qca6390,
>   	.tx_mesh_enable =3D ath11k_hw_qcn9074_tx_mesh_enable,


