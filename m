Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE4CC4332F
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fV7r/ZqO32l5IBN8d1WERrTI/m9lyC3sznF/+CiFCs=; b=Ff27HkHBvYQacF
	WO5ZEeyo8i7iL/8bIf0OgGy1tC0upa+WBX7dnO6ZPYfKz0ozS+qycC/cEVjP7hHUVs5qBgcOQudn5
	n5MTrMQIYTsPfCVJy/DlVT/e9+v3DL/6/Q/s3dojOubkhS77Ohbt0cv12YTVZbACg4ngscyuglo2k
	GHyu6owg5oRHhZhwrusiCGLoTCM8VA2Zt6LLIuf/0RYTPPUhzBI3P0hmB6EknEc/eJU6acTUQ3wD6
	SDQ52UXTrS2VSRU3Z7+Jj1dH/x21uuoDZa9Xi/MLAWm0gR7R+PQDIKH0WA0NALiDjC5ZSsaOwm/dG
	USIVZwq5QTTyVTW61VYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noT0G-003Auy-F6; Tue, 10 May 2022 16:46:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSzK-003ATB-RF
 for ath11k@lists.infradead.org; Tue, 10 May 2022 16:45:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25D7EB81DA5;
 Tue, 10 May 2022 16:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016EEC385C2;
 Tue, 10 May 2022 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652201127;
 bh=Xau5U8O+mJZo3//0D1VJHnUYN7QvrdNMl75LqPlFn5c=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=cFK4020jT2kUBuLwkDHIWnk/ahHc6Jl3+y9R2BJdWMsCCmbTd916uaam4OQil5KFA
 0QU+A24YeIWRBiOUolw3PlLd+T+zRY/i/YQNM/F7WJNmwJrRXmzORq98CgCadxwt4N
 LM1OPmhA6ffu7ktF6k4OsA2QmZMLVSDiMGkWjqZmc7uOlvcLE+8rZzShAExoTgN0Hb
 k9sV8xqAfHTQHgSaElCW1CQEtvAyeDk+3P3a2oE/CCoLwBqNVko1EsiED5iINA+kAb
 teHozMUwyLBWFmn2Xkfy+iAA6Z0dedzlRUwr+HpqsZgbojF+hrNfLTX+lJHilVv9tw
 fmSYVxTQ7DI3g==
From: Kalle Valo <kvalo@kernel.org>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: update missing mumimo and ofdma stats
References: <1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com>
Date: Tue, 10 May 2022 19:45:22 +0300
In-Reply-To: <1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com>
 (Sriram R.'s message of "Tue, 10 May 2022 08:40:36 +0530")
Message-ID: <87mtfp72vx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_094531_261451_502D4F63 
X-CRM114-Status: GOOD (  14.81  )
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

Sriram R <quic_srirrama@quicinc.com> writes:

> Update the missing MU-MIMO/OFDMA info in PDEV RX,
> trigger and schedule stats. i.e HTT stats type 10, 12 and 17
> respectively.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4-01209-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>

[...]

> @@ -734,6 +738,21 @@ struct htt_tx_pdev_mu_mimo_sch_stats_tlv {
>  	u32 ac_mu_mimo_sch_nusers[HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS];
>  	u32 ax_mu_mimo_sch_nusers[HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS];
>  	u32 ax_ofdma_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
> +	u32 ax_ul_ofdma_basic_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
> +	u32 ax_ul_ofdma_bsr_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
> +	u32 ax_ul_ofdma_bar_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
> +	u32 ax_ul_ofdma_brp_sch_nusers[HTT_TX_PDEV_STATS_NUM_OFDMA_USER_STATS];
> +	/* UL MUMIMO */
> +	/* ax_ul_mumimo_basic_sch_nusers[i] is the number of basic triggers sent
> +	 * for (i+1) users
> +	 */
> +	u32 ax_ul_mumimo_basic_sch_nusers[HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS];
> +	/* ax_ul_mumimo_brp_sch_nusers[i] is the number of brp triggers sent
> +	 * for (i+1) users
> +	 */
> +	u32 ax_ul_mumimo_brp_sch_nusers[HTT_TX_PDEV_STATS_NUM_UL_MUMIMO_USER_STATS];
> +	u32 ac_mu_mimo_sch_posted_per_grp_sz[HTT_TX_PDEV_STATS_NUM_AC_MUMIMO_USER_STATS];
> +	u32 ax_mu_mimo_sch_posted_per_grp_sz[HTT_TX_PDEV_STATS_NUM_AX_MUMIMO_USER_STATS];
>  };

In the pending branch I added some newlines to make this more readable.

> @@ -1297,6 +1316,8 @@ struct htt_tx_pdev_rate_stats_tlv {
>  #define HTT_RX_PDEV_STATS_NUM_PREAMBLE_TYPES       HTT_STATS_PREAM_COUNT
>  #define HTT_RX_PDEV_MAX_OFDMA_NUM_USER             8
>  #define HTT_RX_PDEV_STATS_RXEVM_MAX_PILOTS_PER_NSS 16
> +#define HTT_RX_PDEV_STATS_NUM_RU_SIZE_COUNTERS     6
> +#define HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER          8
>  
>  struct htt_rx_pdev_rate_stats_tlv {
>  	u32 mac_id__word;
> @@ -1375,6 +1396,21 @@ struct htt_rx_pdev_rate_stats_tlv {
>  	u32 per_chain_rssi_pkt_type;
>  	s8 rx_per_chain_rssi_in_dbm[HTT_RX_PDEV_STATS_NUM_SPATIAL_STREAMS]
>  				   [HTT_RX_PDEV_STATS_NUM_BW_COUNTERS];
> +
> +	u32 rx_su_ndpa;
> +	u32 rx_11ax_su_txbf_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
> +	u32 rx_mu_ndpa;
> +	u32 rx_11ax_mu_txbf_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
> +	u32 rx_br_poll;
> +	u32 rx_11ax_dl_ofdma_mcs[HTT_RX_PDEV_STATS_NUM_MCS_COUNTERS];
> +	u32 rx_11ax_dl_ofdma_ru[HTT_RX_PDEV_STATS_NUM_RU_SIZE_COUNTERS];
> +
> +	u32 rx_ulmumimo_non_data_ppdu[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER]; /* ppdu level */
> +	u32 rx_ulmumimo_data_ppdu[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];     /* ppdu level */
> +	u32 rx_ulmumimo_mpdu_ok[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];       /* mpdu level */
> +	u32 rx_ulmumimo_mpdu_fail[HTT_RX_PDEV_MAX_ULMUMIMO_NUM_USER];     /* mpdu level */
> +	u32 rx_ulofdma_non_data_nusers[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
> +	u32 rx_ulofdma_data_nusers[HTT_RX_PDEV_MAX_OFDMA_NUM_USER];
>  };

The comments didn't provide any extra information so I removed them.

There were also new warnings, fixed in the pending branch:

drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:2978: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:2983: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:3051: line length of 95 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:3054: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:3057: line length of 93 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:3060: line length of 96 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:3063: line length of 97 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:3066: line length of 93 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:3069: line length of 91 exceeds 90 columns
drivers/net/wireless/ath/ath11k/debugfs_htt_stats.c:3072: line length of 93 exceeds 90 columns

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
