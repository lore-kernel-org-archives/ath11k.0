Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D024C3DA64
	for <ath11k@archiver.kernel.org>; Tue,  6 Aug 2024 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvvDVASg/0q/Cq3qOgamxdXOSxn6nAzGZHMcTBZzwzg=; b=XzQ1Rz1Mzzr+nuC4L8wxozvMTw
	2akMdrgrKS8q5ZE1Ao7WFzG6KCcoDfEkMhw8Nh2StjMvu2/OEzJi95BGtz6vdmTnFj59IW+EFwe+y
	n0RRFLwY2sdaX2NKYH/+5Dx4DZhEjBMZGp+tktbhuUyEROUdU1vphxKsHi75nGODXeMACzkZClRKU
	ORPh1PH6h0o9x6MrCNCvKIutUvD7pB93gNfHgu9pVowTEGyGKIH9G6F7cJCgAYYvNKHbXY4zjOAE8
	dLue/HaRyU6qhYsRZcPrpNeoZFEYpCqZfbwAXKkUS0Zw/LZc+DuHu2Y+Hz4Pvk1QGEq3srgbytHg2
	d1UDr9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEvQ-00000000pz2-2jvh;
	Tue, 06 Aug 2024 07:48:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEvN-00000000pyF-36N6
	for ath11k@lists.infradead.org;
	Tue, 06 Aug 2024 07:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0CB64CE0B2E;
	Tue,  6 Aug 2024 07:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E777C32786;
	Tue,  6 Aug 2024 07:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722930483;
	bh=1wCvb7Ty0PMbbRUTsNPREmzlyJkTiNLHPiiOiYmJ0e4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=UIc1fxWYeE3WRm1AuMFVKhGwfZJRBMbdVClAlpyORtAvjQDGjoi8Kv4feoXH/sEx2
	 xTA+JaImWXem+BtgocM5gNwNOWc7dn5WLMv2GN3HltoE/OkU9E4pXEb8DCGoZd/G9L
	 O3J1KEdw8CnOjs4XtP52PvI4U/etl87NF/BeDIE5cwGchU23He0j3yROk1PTsFjlxx
	 7OgxQfCMvFPMLfTuvMfIi5zKwY+evEYpM+/jG+/77fJ/G37KJ/PZko8lqYXh1W4cEX
	 AkZd81zyyHcN3/+lInBkkmKM+zzZ3ycF3LOQp+McaAV44aXnrMXKr4WMe/nti4cEg6
	 +4/2d0O1diWTg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: ath11k: support HTT extended receive rate debug
 stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230613071212.22180-1-quic_karm@quicinc.com>
References: <20230613071212.22180-1-quic_karm@quicinc.com>
To: Karthik M <quic_karm@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthik M <quic_karm@quicinc.com>,
 Sathishkumar Muruganandam <quic_murugana@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172293048067.3540390.7860114421698371244.kvalo@kernel.org>
Date: Tue,  6 Aug 2024 07:48:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_004806_164742_C4663BD9 
X-CRM114-Status: UNSURE (   4.78  )
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

Karthik M <quic_karm@quicinc.com> wrote:

> ATH11K_DBG_HTT_EXT_STATS_PDEV_RX_RATE_EXT  =  30
> 
> HTT stats, HTT_RX_PDEV_RATE_EXT_STATS has the rx stats info of
> the extended 80MHz, mainly 80+80 and 160MHz modes.
> 
> Usage:
> echo 30 > /sys/kernel/debug/ieee80211/phyx/ath11k/htt_stats_type
> cat /sys/kernel/debug/ieee80211/phyx/ath11k/htt_stats
> 
> HTT_RX_PDEV_RATE_EXT_STATS_TLV:
> rssi_mcast = -70
> rssi_mgmt = 6
> rssi_chain_ext[0] =  0:128, 1:128, 2:128, 3:128,
> rssi_chain_ext[1] =  0:128, 1:128, 2:128, 3:128,
> rssi_chain_ext[2] =  0:128, 1:128, 2:128, 3:128,
> rssi_chain_ext[3] =  0:128, 1:128, 2:128, 3:128,
> rssi_chain_ext[4] =  0:128, 1:128, 2:128, 3:128,
> rssi_chain_ext[5] =  0:128, 1:128, 2:128, 3:128,
> rssi_chain_ext[6] =  0:128, 1:128, 2:128, 3:128,
> rssi_chain_ext[7] =  0:128, 1:128, 2:128, 3:128,
> 
> rx_per_chain_rssi_ext_in_dbm[0] =  0:0, 1:0, 2:0, 3:0,
> rx_per_chain_rssi_ext_in_dbm[1] =  0:0, 1:0, 2:0, 3:0,
> rx_per_chain_rssi_ext_in_dbm[2] =  0:0, 1:0, 2:0, 3:0,
> rx_per_chain_rssi_ext_in_dbm[3] =  0:0, 1:0, 2:0, 3:0,
> rx_per_chain_rssi_ext_in_dbm[4] =  0:-128, 1:-128, 2:-128, 3:-128,
> rx_per_chain_rssi_ext_in_dbm[5] =  0:-128, 1:-128, 2:-128, 3:-128,
> rx_per_chain_rssi_ext_in_dbm[6] =  0:-128, 1:-128, 2:-128, 3:-128,
> rx_per_chain_rssi_ext_in_dbm[7] =  0:-128, 1:-128, 2:-128, 3:-128,
> rx_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> rx_stbc_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> rx_gi_ext[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> rx_gi_ext[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> rx_gi_ext[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> rx_gi_ext[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> ul_ofdma_rx_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> ul_ofdma_rx_gi_ext[0] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> ul_ofdma_rx_gi_ext[1] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> ul_ofdma_rx_gi_ext[2] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> ul_ofdma_rx_gi_ext[3] =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> rx_11ax_su_txbf_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> rx_11ax_mu_txbf_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> rx_11ax_dl_ofdma_mcs_ext =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0,
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-01184-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> Signed-off-by: Karthik M <quic_karm@quicinc.com>

Dropping this, please rebase if still needed.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230613071212.22180-1-quic_karm@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


