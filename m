Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7070AC433F5
	for <ath11k@archiver.kernel.org>; Tue,  3 May 2022 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1GFR/bBsPBfYXRefTJ4MdiYiQJ0jPGn8Snrt+DQlo0=; b=tr3ULQKy0DTD38
	xPHrENA3HP6v9a7A82y2sI7zAlLSIBqYG1dKqhklTzNnJ6IBVBUP6ZMh8y/2NLExuBx37bHbA6eDm
	2LZOA9xu8KBEnqzqMXy40ilepjTG2woeS9b1bHkd0vY9gxSz9pI1KrYOLFncyv2UdicNL1W8LoIYu
	9vDDWLX4MtOPscePqMx3vwJb93OKz+iRNxcsV5Q87bq9JNeU+/b8taBFRyvYSjL44nbpj5/5bvC9X
	E3f6w9/AWVHHuqESIzPIIygcvEV0lY88kptLifDCDrETMyi8HAMmfqx6ve8lrZWyUHL2Y6+LscdTa
	raOkV+6XN6OX9SsIuG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nluHt-006Rpg-9q; Tue, 03 May 2022 15:18:05 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nluHq-006RoZ-DQ
 for ath11k@lists.infradead.org; Tue, 03 May 2022 15:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651591082; x=1683127082;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BLQzsQAQEulbk5ygn5S9q0gNQ6kr1O2cVXrga4s4po8=;
 b=UYBWFIU1J1uHDUw14KeO6dXRP+sQEN2MU+M7b37fkzL1YbWJ6UEz/kme
 RbuZjbe3ERaXCV0+zBZouHvgPrCIjqWHaRWx20oPBWK3r9v7jgYv8PYPQ
 fd0TL7MG4+SSyXNISVRGbE+e5FKiCNiaPZ/nMfEjF4h2MK72GSS/M780M 4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 May 2022 08:17:57 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 08:17:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 08:17:57 -0700
Received: from [10.110.89.220] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 08:17:56 -0700
Message-ID: <f2f27831-03eb-3788-5855-649c0f33c785@quicinc.com>
Date: Tue, 3 May 2022 08:17:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] ath11k: mac: fix too long line
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220503060415.24499-1-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220503060415.24499-1-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_081802_771435_965D325D 
X-CRM114-Status: GOOD (  14.01  )
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

On 5/2/2022 11:04 PM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> checkpatch warns:
> 
> drivers/net/wireless/ath/ath11k/mac.c:7760: line length of 91 exceeds 90 columns
> 
> This was introduced by commit 046d2e7c50e3 ("mac80211: prepare sta handling for
> MLO support").
> 
> Compile tested only.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index c76cac5d6849..32fb0142124d 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7735,6 +7735,7 @@ ath11k_mac_validate_vht_he_fixed_rate_settings(struct ath11k *ar, enum nl80211_b
>   	bool he_fixed_rate = false, vht_fixed_rate = false;
>   	struct ath11k_peer *peer, *tmp;
>   	const u16 *vht_mcs_mask, *he_mcs_mask;
> +	struct ieee80211_link_sta *deflink;
>   	u8 vht_nss, he_nss;
>   	bool ret = true;
>   
> @@ -7757,13 +7758,16 @@ ath11k_mac_validate_vht_he_fixed_rate_settings(struct ath11k *ar, enum nl80211_b
>   	spin_lock_bh(&ar->ab->base_lock);
>   	list_for_each_entry_safe(peer, tmp, &ar->ab->peers, list) {
>   		if (peer->sta) {
> -			if (vht_fixed_rate && (!peer->sta->deflink.vht_cap.vht_supported ||
> -					       peer->sta->deflink.rx_nss < vht_nss)) {
> +			deflink = &peer->sta->deflink;


is there a reason to not declare deflink here?
then its scope of definition would equal the scope of usage


> +
> +			if (vht_fixed_rate && (!deflink->vht_cap.vht_supported ||
> +					       deflink->rx_nss < vht_nss)) {
>   				ret = false;
>   				goto out;
>   			}
> -			if (he_fixed_rate && (!peer->sta->deflink.he_cap.has_he ||
> -					      peer->sta->deflink.rx_nss < he_nss)) {
> +
> +			if (he_fixed_rate && (!deflink->he_cap.has_he ||
> +					      deflink->rx_nss < he_nss)) {
>   				ret = false;
>   				goto out;
>   			}
> 
> base-commit: f39af96d352dd4f36a4a43601ea90561e17e5ca6


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
