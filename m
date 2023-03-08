Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6B7C64EC4
	for <ath11k@archiver.kernel.org>; Wed,  8 Mar 2023 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/S3qstTzjV2Us6ZHxcyerV6oinVb7ysOSbQO1vqFow=; b=elzLNKc4Uq97dC
	1ah2Q5n9hUjD8m7fJOmf2dqutDjTcdTfiH1oekE2K8A7ZGnVCylDn8O8Eg0w8HYQkDPFAu4aTz4M5
	4Dd4UplHFtOReZlG6/i4RlYvmEHsI1ZHer+jF8s9sg57dIAagZtmPqWlL9QLiocMip2vCzpFBfi5J
	NSMDQ/0IAs4OLIJe2Rj4zRpqZk2bXJv/0VN2M92PH3nRQbiiwew4tmfrtu/YwD8UejU5CXhNAaTN+
	whfkb0coJSlQI6ofBiiqNYVTzgEanfXlrrTB+oOKYhtCoeZA3j+onHQIsGe9he0GKGpv9Y6XojuEZ
	c9xemTS9lhOMVygA7FXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyE7-006Jjf-2G; Wed, 08 Mar 2023 18:09:23 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyE4-006Jhh-2A
	for ath11k@lists.infradead.org; Wed, 08 Mar 2023 18:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XA1x4uHVuNlFCbntS4g34jb7QqqTzglZ8EyZUBaakfo=; b=CFVssRZFJbThJcyYmLxitnEnFr
	4zlejIuKaKJDoj7zV8GUHmCLF/9DfTzs9nfXNyv3ExTXzdra5u7af+Y8Z7ymcWzodZr+VyMT2/Zsv
	XEAQkN3VLhT2b3gORw18F6BpkWyzUOFUPEh3uckoWpbIvIMPfDX9z7zlkKwoj0IVLsdY=;
Received: from p54ae9730.dip0.t-ipconnect.de ([84.174.151.48] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pZyDx-00Fxwf-O9; Wed, 08 Mar 2023 19:09:13 +0100
Message-ID: <380e302d-a444-e243-f868-aa3e1efdcb73@nbd.name>
Date: Wed, 8 Mar 2023 19:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] wifi: ath11k: fix null ptr dereference when tx
 offload is enabled
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20230308174703.12270-1-quic_pradeepc@quicinc.com>
 <20230308174703.12270-2-quic_pradeepc@quicinc.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20230308174703.12270-2-quic_pradeepc@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_100920_220183_5E8235A5 
X-CRM114-Status: GOOD (  14.72  )
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

On 08.03.23 18:47, Pradeep Kumar Chitrapu wrote:
> When tx offload is enabled, info->band from skb cb is 0. This
> causes null pointer access at mac80211 when sband is accessed.
> 
> In offload case, ndo_hard_start will bypass mac80211 tx and no
> function will set info->band in skb cb to correct value.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/dp_tx.c | 26 ++++++++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> index 8afbba236935..0f3a32434970 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> @@ -354,8 +364,10 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
>   			info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
>   		}
>   	}
> -
> -	ieee80211_tx_status(ar->hw, msdu);
> +	if (flags & ATH11K_SKB_HW_80211_ENCAP)
> +		ieee80211_tx_status_8023(ar->hw, vif, msdu);
> +	else
> +		ieee80211_tx_status(ar->hw, msdu);
>   }
>   
>   static void
> @@ -610,7 +627,10 @@ static void ath11k_dp_tx_complete_msdu(struct ath11k *ar,
>   
>   	spin_unlock_bh(&ab->base_lock);
>   
> -	ieee80211_tx_status_ext(ar->hw, &status);
> +	if (flags & ATH11K_SKB_HW_80211_ENCAP)
> +		ieee80211_tx_status_8023(ar->hw, vif, msdu);
> +	else
> +		ieee80211_tx_status_ext(ar->hw, &status);
>   }
>   
>   static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
I think using ieee80211_tx_status_8023 is a bad idea. It is simply a 
wrapper around ieee80211_tx_status_ext which looks up the sta based on 
the MSDU DA. This means it is incompatible with 4-address mode.
If you can have a sta pointer available, it is much better to just use 
ieee80211_tx_status_ext unconditionally.

In fact, I think we should simply remove ieee80211_tx_status_8023.

- Felix

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
