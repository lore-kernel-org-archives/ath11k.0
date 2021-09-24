Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9761BC433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 14:35:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1AA6124C
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 14:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D1AA6124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2m5WVzt0SabFd4Q6dBr8zgwGcpjWLvat5pziF1eKX7M=; b=s9MRDpK9imvLUr
	UkJH+49UW4sHaM3HIU6B8kGC2MOP9gvDyTZUTx3fjuMQHUwv5jQh6A71lCXJKsUOgh1CFGW3LNo1C
	wmBf4hfpd22aXV/ZH0G+jPtI9fZ5ZRq7BfPTuLlwi0T5KAnuYWTJnOULi/XNyL7iZx0Qwb5HYJCIX
	qLFmf86bBRqlbshPeniLhGnt6xVXf7vGA1ILDrps2DXKC2+eRD52EPIHiOb64BZ+ox2zhQz4MYF0M
	iT4XN2QElso3gUdHbALYTBHLhXxOOdzV0uvBowIFTs6VKb68KPGmfTbuScZ6utSlggbnFRtbuEYiY
	wd+L7LY4yh6lj4+oiWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTmIQ-00EqtI-Fl; Fri, 24 Sep 2021 14:35:26 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTmIM-00Eqsi-3W
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 14:35:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632494123; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=2VNIZefseQM+LWjqbdsB2hrCthMpgbRSBdCkmDgmon0=;
 b=ikrue2Yty5g9GpS0o/qQ2mkEvt8w4V+JuegjV+KnojXiTRgxzSzNJsoYRxVo1hb7olZVT6Ix
 2Bf1yd/XxaVQomXN8XJOoSdLlZJfXphc0lgDRturBskvASf1yGyEvjlltixJAvYNW54qjG42
 FNSxQBhQI6KoKOPuWWGscJtQedU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 614de222648642cc1c810047 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 14:35:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5CBA6C43619; Fri, 24 Sep 2021 14:35:14 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D4B3C4338F;
 Fri, 24 Sep 2021 14:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3D4B3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>
Subject: Re: [PATCH 1/4] ath11k: Refactor spectral FFT bin size
References: <20210721180809.90960-1-jouni@codeaurora.org>
 <20210721180809.90960-2-jouni@codeaurora.org>
Date: Fri, 24 Sep 2021 17:35:07 +0300
In-Reply-To: <20210721180809.90960-2-jouni@codeaurora.org> (Jouni Malinen's
 message of "Wed, 21 Jul 2021 21:08:06 +0300")
Message-ID: <87ee9erqhw.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_073523_495290_3A6FE718 
X-CRM114-Status: GOOD (  20.82  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Karthikeyan Periyasamy <periyasa@codeaurora.org>
>
> In IPQ8074, actual FFT bin size is two bytes but hardware reports it
> with extra pad size of two bytes for each FFT bin. So finally each FFT
> bin advertise as four bytes size in the collected data. This FFT pad is
> not advertised in IPQ6018 platform. To accommodate this different
> behavior across the platforms, introduce the hw param fft_pad_sz and use
> it in spectral process. Also group all the spectral params under the new
> structure in hw param structure for scalable in future.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.4.0.1-00330-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.c     | 27 +++++++++++++++-------
>  drivers/net/wireless/ath/ath11k/hw.h       |  6 ++++-
>  drivers/net/wireless/ath/ath11k/spectral.c | 13 +++++------
>  3 files changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 3179495cb3c9..2a81a544b6a9 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -59,8 +59,13 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.vdev_start_delay = false,
>  		.htt_peer_map_v2 = true,
>  		.tcl_0_only = false,
> -		.spectral_fft_sz = 2,
> -
> +		.spectral = {
> +			.fft_sz = 2,
> +			/* HW bug, expected BIN size is 2 bytes but HW report as 4 bytes.
> +			 * so added pad size as 2 bytes to compensate the BIN size
> +			 */
> +			.fft_pad_sz = 2,
> +		},
>  		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>  					BIT(NL80211_IFTYPE_AP) |
>  					BIT(NL80211_IFTYPE_MESH_POINT),
> @@ -101,8 +106,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.vdev_start_delay = false,
>  		.htt_peer_map_v2 = true,
>  		.tcl_0_only = false,
> -		.spectral_fft_sz = 4,
> -
> +		.spectral = {
> +			.fft_sz = 4,
> +			.fft_pad_sz = 0,
> +		},
>  		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>  					BIT(NL80211_IFTYPE_AP) |
>  					BIT(NL80211_IFTYPE_MESH_POINT),
> @@ -143,8 +150,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.vdev_start_delay = true,
>  		.htt_peer_map_v2 = false,
>  		.tcl_0_only = true,
> -		.spectral_fft_sz = 0,
> -
> +		.spectral = {
> +			.fft_sz = 0,
> +			.fft_pad_sz = 0,
> +		},
>  		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>  					BIT(NL80211_IFTYPE_AP),
>  		.supports_monitor = false,
> @@ -223,8 +232,10 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.vdev_start_delay = true,
>  		.htt_peer_map_v2 = false,
>  		.tcl_0_only = true,
> -		.spectral_fft_sz = 0,
> -
> +		.spectral = {
> +			.fft_sz = 0,
> +			.fft_pad_sz = 0,
> +		},
>  		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>  					BIT(NL80211_IFTYPE_AP),
>  		.supports_monitor = false,

QCN9074 hw1.0 didn't have an entry. I suspect what happened was that
support for wcn6855 was added between writing the patch and me
committing wcn6855 patches, which confused git.

I changed it so that both qcn9074 and wcn6855 have this:

		.spectral = {
			.fft_sz = 0,
			.fft_pad_sz = 0,
		},

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
