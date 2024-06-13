Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88005C27C4F
	for <ath11k@archiver.kernel.org>; Thu, 13 Jun 2024 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGp5SUbhfiYEXAvDC6yfHjc6QfvFVYKkhcb4+jdxCaE=; b=EqmSN1aFb8Pm6AKGbSMut+1csS
	HS639xEMQPlENr+jBNJxINt3lKd61mP2848Qn/9f7Lc2sT55j6gCPx6Ab+zHbQBBlcCKV3ZgebPo0
	jjzarUjhjpSKJc9Fi39zhlp3EDCN6nnrBibOJy1aHQCZCBdgEXxney1cwrmnfXwXgMBkmXVJczn6R
	LI6orYKOmyl2iq+kctCSwvn6Ky7V1peYU/saEOCbf4jWmp1jcrG6LKynXWrH1Sl2oSl1/VaVtjn1M
	BwjfRe+XXTYYIjwZrG8rmV9Eow070muNYdBHEFIush3saxmC5SCKDzt/3hH/RWKZqJlTEdbfY9dEf
	67AZeKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHj5a-0000000GP42-0wSD;
	Thu, 13 Jun 2024 11:57:58 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHj5W-0000000GP2C-1w3n
	for ath11k@lists.infradead.org;
	Thu, 13 Jun 2024 11:57:55 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-795fb13b256so167409285a.0
        for <ath11k@lists.infradead.org>; Thu, 13 Jun 2024 04:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718279871; x=1718884671; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGp5SUbhfiYEXAvDC6yfHjc6QfvFVYKkhcb4+jdxCaE=;
        b=OnaGesVOMVQNB0HZ28JoM1VpOb/DKCDZzz7j1MpTdhK2lipnYkwIC7o6FefSNsyiiY
         ZavCYc7NtLGOlPg3oTcWO8AhLO6b8y2TYWY11vDbG43t10W+5PndP1ZUV62bwzSLdWrS
         VD4IdX0KWG6c72kU+pgTE7YKcUn9IsFjfZjti5ZW2Kacov2gQcPRzHuG4K2fGYZ5iN0W
         GfEtmnShi/0jyq/F30+BKDCNm/Rf5RCaxqpCtkutfg2+kt0ms7zGo0MJH1yDRWaqmFrx
         31J6vVN3RJJ2SiccQmbOfO70GbOdco9OtgMoasu7aEcffe1hQB+xZHJrC8FlgCsoA0z7
         4H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718279871; x=1718884671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGp5SUbhfiYEXAvDC6yfHjc6QfvFVYKkhcb4+jdxCaE=;
        b=BzYjpJ38/3yJBdlObkT5N1FcLm/wtZ1iuICkAucVXsax41ufwmV+93wSkw0cXQVSue
         vORzaS40OrWvJTaQbnQJrNAdNvue7ytonTXOGueS29mj/bngOyRZN1cPjlteRH7/IRC2
         bWZusPuuc2r5ciu18d0qhShC9skA4P36ujEz3Fhg3iay5LyjrbyGP3jJjETTabYElwOs
         4sAbPVGqHcYuW0qaHFb21D1bDe5M0eK9oey+gY10qgXbnVZ1dcuVla9Jcj95TP86VO3a
         +zBiIJUqUlt7pStG/atlqBkoIycR7nsRw9AnNWcvw1CEvDU2aF9dVEO5MaI6tVWi5r8V
         JMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRsvWtUJ9X9fWEEw2D+2y5op3vTKduHhnFO5TROumK1QLqrSIm3qHUKcbqMYaCwXBtJ6I+DyTn4w6HzWnVyoy8+ewNUtXwqUMrPg==
X-Gm-Message-State: AOJu0YxCIEZPY0Jeltrrok+urK/b9DqnSv06dZPn4xV/pXJW46fgmGIR
	fxevhIKjfWlLG96xXIs03IMUGpmf/b7lPWrvw+QyIJ5vPym1jwGF
X-Google-Smtp-Source: AGHT+IFKOj3pRPTDrZ715JOcNvFxzBff9igcRI1OezZ3h97UPywKbb9UA4fsdhQc92qUJzERVTrNDQ==
X-Received: by 2002:a05:620a:4005:b0:795:5711:a212 with SMTP id af79cd13be357-79810109f03mr331143985a.23.1718279870992;
        Thu, 13 Jun 2024 04:57:50 -0700 (PDT)
Received: from [10.102.4.150] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc068sm45834885a.34.2024.06.13.04.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 04:57:50 -0700 (PDT)
Message-ID: <4bdf84bf-0d6f-4391-a529-134ccde53aae@gmail.com>
Date: Thu, 13 Jun 2024 04:57:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix ack signal strength calculation
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20240611022550.59078-1-quic_lingbok@quicinc.com>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20240611022550.59078-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_045754_525432_98C2C806 
X-CRM114-Status: GOOD (  24.64  )
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

Hi Lingbo,

On 6/10/24 7:25 PM, Lingbo Kong wrote:
> Currently, the calculation of ack signal strength is incorrect.
>
> This is because before calculating the ack signal strength, ath11k need
> to determine whether the hardware and firmware support db2dbm. If the
> hardware and firmware support db2dbm, do not need to add noise floor,
> otherwise, need to add noise floor.

This oatch got me checking on some devices we have running ath11k 
(WCN6855). I don't see any "ack signal" property but I noticed the 
signal avg does not seem correct:

signal:      -55 [-62, -56] dBm
signal avg:    105 dBm

Every other device besides ath11k has a signal avg close to or equal to 
the signal. Do you think there is also an issue with this property? not 
just the ack signal?

Thanks,

James

>
> Besides, the value of ack_rssi passed by firmware to ath11k should be a
> signed number, so change its type to s8.
>
> After that, "iw wlan0 station dump" show the correct ack signal strength.
>
> Such as:
> root@CDCCSTEX0799733-LIN:~# iw wlp88s0 station dump
> Station 00:03:7f:12:df:df (on wlp88s0)
>          inactive time:  75 ms
>          rx bytes:       11599
>          rx packets:     99
>          tx bytes:       9029
>          tx packets:     81
>          tx retries:     4
>          tx failed:      0
>          rx drop misc:   2
>          signal:         -16 dBm
>          signal avg:     -24 dBm
>          tx bitrate:     1560.0 MBit/s VHT-MCS 9 80MHz VHT-NSS 4
>          tx duration:    9230 us
>          rx bitrate:     1560.0 MBit/s VHT-MCS 9 80MHz VHT-NSS 4
>          rx duration:    7201 us
>          last ack signal:-23 dBm
>          avg ack signal: -22 dBm
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/dp_tx.c  | 16 ++++++++++++----
>   drivers/net/wireless/ath/ath11k/dp_tx.h  |  4 ++--
>   drivers/net/wireless/ath/ath11k/hal_tx.h |  4 ++--
>   3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index 21819b741701..8522c67baabf 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -353,8 +353,12 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
>   	if (ts->acked) {
>   		if (!(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
>   			info->flags |= IEEE80211_TX_STAT_ACK;
> -			info->status.ack_signal = ATH11K_DEFAULT_NOISE_FLOOR +
> -						  ts->ack_rssi;
> +			info->status.ack_signal = ts->ack_rssi;
> +
> +			if (!test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
> +				      ab->wmi_ab.svc_map))
> +				info->status.ack_signal += ATH11K_DEFAULT_NOISE_FLOOR;
> +
>   			info->status.flags |=
>   				IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
>   		} else {
> @@ -584,8 +588,12 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
>   	if (ts->status == HAL_WBM_TQM_REL_REASON_FRAME_ACKED &&
>   	    !(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
>   		info->flags |= IEEE80211_TX_STAT_ACK;
> -		info->status.ack_signal = ATH11K_DEFAULT_NOISE_FLOOR +
> -					  ts->ack_rssi;
> +		info->status.ack_signal = ts->ack_rssi;
> +
> +		if (!test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
> +			      ab->wmi_ab.svc_map))
> +			info->status.ack_signal += ATH11K_DEFAULT_NOISE_FLOOR;
> +
>   		info->status.flags |= IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
>   	}
>   
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
> index 61be2265e09f..795fe3b8fa0d 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.h
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
> @@ -1,7 +1,7 @@
>   /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021, 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021, 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef ATH11K_DP_TX_H
> @@ -13,7 +13,7 @@
>   struct ath11k_dp_htt_wbm_tx_status {
>   	u32 msdu_id;
>   	bool acked;
> -	int ack_rssi;
> +	s8 ack_rssi;
>   	u16 peer_id;
>   };
>   
> diff --git a/drivers/net/wireless/ath/ath11k/hal_tx.h b/drivers/net/wireless/ath/ath11k/hal_tx.h
> index c5e88364afe5..46d17abd808b 100644
> --- a/drivers/net/wireless/ath/ath11k/hal_tx.h
> +++ b/drivers/net/wireless/ath/ath11k/hal_tx.h
> @@ -1,7 +1,7 @@
>   /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef ATH11K_HAL_TX_H
> @@ -54,7 +54,7 @@ struct hal_tx_info {
>   struct hal_tx_status {
>   	enum hal_wbm_rel_src_module buf_rel_source;
>   	enum hal_wbm_tqm_rel_reason status;
> -	u8 ack_rssi;
> +	s8 ack_rssi;
>   	u32 flags; /* %HAL_TX_STATUS_FLAGS_ */
>   	u32 ppdu_id;
>   	u8 try_cnt;
>
> base-commit: a116bf2be795eb1db75fa6a48aa85c397be001a6

