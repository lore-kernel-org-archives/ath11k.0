Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB29C433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 03:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ye9+s7Lk6/DmP0NBr4DU0ImIMXJPOxs+TQREHtDaVs0=; b=Y9XEhhwnt4VNJL
	cVw2xLnTQRWdtSSjX8hPzrfbYybNxZiXJfVFI69rwdc92GZdz1s+CAuEjQacDjN9c3fzJycdHgQuX
	4kYzV3TPtXKPjYF4ykz6QCUkzqHZf8Tsn1+aqonGW80cX7z22Nx79UoevmkDrGPGrytnkhgHXqLb9
	pRF7ACfEJ9tj2rOKg3vkuYRoMrqsq95YN5v6lBvuKv8WWmTtvPwkYPbeprk1MR4NvXRHIHYNuLgMA
	Wkyg5p39PTePxy3bllAhpF/bPqafAea4aHXJ4wsSZCKMs1goYkV7w/cSzbkAZVHo9SD0XAa8Y1zKG
	lIjshLm3NyCsze5G0Smg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzs5i-0094Rr-Bm; Wed, 22 Dec 2021 03:14:58 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzs5f-0094RE-C4
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 03:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640142895; x=1671678895;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=snM2GZEahT2hkkApPvUMvlBgcJtGVMpHQbtRv6xFj/Y=;
 b=jplmGa2VBv3heNG/jYj4szOYNYITANplVIWhUbFN+u6HXw7L5QXU4SEl
 BQTs4hlwOwgDdhSq2pYVy760DL7ANDgCMSqNXAqWj3StKMN3HYYsJW7gI
 ITyXroDEXCwQ8mM5+0LCyLt44p2DWJrfY8K2khOYtUXXSLWDvPSbOhBDV k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Dec 2021 19:14:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 19:14:54 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 21 Dec 2021 19:14:54 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 21 Dec
 2021 19:14:53 -0800
Message-ID: <eaf4400c-a286-768f-a6e3-7670e7fbbd3a@quicinc.com>
Date: Wed, 22 Dec 2021 11:14:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ath10k: fix memory overwrite of the WoWLAN wakeup packet
 pattern
Content-Language: en-US
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20211222031020.25382-1-quic_wgong@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20211222031020.25382-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_191455_481425_72AD7288 
X-CRM114-Status: GOOD (  15.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

please ignore this, I will send to ath10k group because this is ath10k 
patch.

On 12/22/2021 11:10 AM, Wen Gong wrote:
> In function ath10k_wow_convert_8023_to_80211(), it will do memcpy for
> the new->pattern, and currently the new->pattern and new->mask is same
> with the old, then the memcpy of new->pattern will also overwrite the
> old->pattern, because the header format of new->pattern is 802.11,
> its length is larger than the old->pattern which is 802.3. Then the
> operation of "Copy frame body" will copy a mistake value because the
> body memory has been overwrite when memcpy the new->pattern.
>
> Assign another empty value to new_pattern to avoid the overwrite issue.
>
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
>
> Fixes: fa3440fa2fa1 ("ath10k: convert wow pattern from 802.3 to 802.11")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath10k/wow.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
> index 7d65c115669f..20b9aa8ddf7d 100644
> --- a/drivers/net/wireless/ath/ath10k/wow.c
> +++ b/drivers/net/wireless/ath/ath10k/wow.c
> @@ -337,14 +337,15 @@ static int ath10k_vif_wow_set_wakeups(struct ath10k_vif *arvif,
>   			if (patterns[i].mask[j / 8] & BIT(j % 8))
>   				bitmask[j] = 0xff;
>   		old_pattern.mask = bitmask;
> -		new_pattern = old_pattern;
>   
>   		if (ar->wmi.rx_decap_mode == ATH10K_HW_TXRX_NATIVE_WIFI) {
> -			if (patterns[i].pkt_offset < ETH_HLEN)
> +			if (patterns[i].pkt_offset < ETH_HLEN) {
>   				ath10k_wow_convert_8023_to_80211(&new_pattern,
>   								 &old_pattern);
> -			else
> +			} else {
> +				new_pattern = old_pattern;
>   				new_pattern.pkt_offset += WOW_HDR_LEN - ETH_HLEN;
> +			}
>   		}
>   
>   		if (WARN_ON(new_pattern.pattern_len > WOW_MAX_PATTERN_SIZE))
>
> base-commit: 6629123e6a8ba405d270fd9cd70dc1ccb65e25de

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
