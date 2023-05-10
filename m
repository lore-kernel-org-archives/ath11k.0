Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF033C7EE22
	for <ath11k@archiver.kernel.org>; Wed, 10 May 2023 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWGSfaACW5aknHvd5AL+9Seig8IOBnVPUviRpez9UZ4=; b=WpCDs6fnU8NYB8
	DF/x+Z8K6G74R/JY2lzvbM/Hva9oOi7MeWMfV9jI2Q4PsilYjMFOIDC2Zp7rDKv0xCAvb9i96ca6i
	IWLiNF8GrhRKyFR0K/HUSKrJqunFXTeuOSX+8Z7xl/Q2R5HowZOYem8qKgvh95yPGn9w1XxBfO32B
	dk3Sgx+Uc5ZZjUbZaDVmwAuvAKHnjcUozO21U8z87sSIlqQpyR5p+EkysbJhfJPAio2+zsSENbdHg
	m0dX4pcNQT7wh1MoTktTAByxPGyRBfHvPL7G3OggtZkHF7oZD5zc3wwMGvb7ZSd5CN2ZTKS4n+GNI
	51ou8gSzUHgz5tqo/YPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwgha-005ieU-0r;
	Wed, 10 May 2023 10:05:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwghX-005idQ-0h
	for ath11k@lists.infradead.org;
	Wed, 10 May 2023 10:05:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A9DPZm005408;
	Wed, 10 May 2023 10:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kv8MWVu60Lknq1EU2YKGBd4G7B8gOFMpvJZU5/lJV4o=;
 b=TJZz4oaV2n1q90GsewZYQ1dafPF5bOWeTbmLla3kfmtp0PFI7t2Fesyq78C/x390exqD
 IJd5gOlVFV5xKVqxsh3Mh9SS2ha/N8TrTR3T8gpYbwj/mqg8s6lEMF1XRn7WhGu6Olyb
 O1OFhXiFngiOmaw1j5atjjOnMy3uv3dFYa4HTi5gBU3tCayZXa6xWa7Gi1sY2ad6xKfv
 vbS2TgV8U45U11ckwWwkilb1CQmF1clfbVkvW52lGugeqPDN5C6F5F80jqst2B3j0ocG
 Ez/QxXiBwTLFJfQHYGtMC95AR6zDRrmFXkpxC2s6aarwOl2deJTQeCovcgArP+RRCmyu jA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfuna1e0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 10:05:35 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AA5Y5Y028253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 10:05:34 GMT
Received: from [10.201.192.62] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 03:05:33 -0700
Message-ID: <a409ded2-f6e5-bc74-3fdb-231a92d9bde5@quicinc.com>
Date: Wed, 10 May 2023 15:35:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] ath11k: Relocate the func
 ath11k_mac_bitrate_mask_num_ht_rates() and change hweight16 to hweight8
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230504092033.3542456-2-quic_mkenna@quicinc.com>
Content-Language: en-US
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
In-Reply-To: <20230504092033.3542456-2-quic_mkenna@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4cbLziBOcoqGqutvn0aq68RFU3oV7RCJ
X-Proofpoint-GUID: 4cbLziBOcoqGqutvn0aq68RFU3oV7RCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=666 mlxscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_030539_279828_445E44DC 
X-CRM114-Status: GOOD (  22.13  )
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

Hi,

Ignore this patchset, I have sent the v2 version of this patchset by 
rebasing it on latest TOT.

> Relocate the function ath11k_mac_bitrate_mask_num_ht_rates() definition
> to call this function from other functions which helps to avoid the
> compilation error (function not defined).
>
> ht_mcs[] is 1 byte array and it is enough to use hweight8() instead
> of hweight16(). Hence, fixed the same.
>
> Tested on: Compile tested only.
>
> Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 30 +++++++++++++--------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 05920ad413c5..eb46d06272de 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -1,7 +1,7 @@
>   // SPDX-License-Identifier: BSD-3-Clause-Clear
>   /*
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #include <net/mac80211.h>
> @@ -4159,6 +4159,20 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>   	return ret;
>   }
>   
> +static int
> +ath11k_mac_bitrate_mask_num_ht_rates(struct ath11k *ar,
> +				     enum nl80211_band band,
> +				     const struct cfg80211_bitrate_mask *mask)
> +{
> +	int num_rates = 0;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++)
> +		num_rates += hweight8(mask->control[band].ht_mcs[i]);
> +
> +	return num_rates;
> +}
> +
>   static int
>   ath11k_mac_bitrate_mask_num_vht_rates(struct ath11k *ar,
>   				      enum nl80211_band band,
> @@ -7542,20 +7556,6 @@ static void ath11k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
>   	ath11k_mac_flush_tx_complete(ar);
>   }
>   
> -static int
> -ath11k_mac_bitrate_mask_num_ht_rates(struct ath11k *ar,
> -				     enum nl80211_band band,
> -				     const struct cfg80211_bitrate_mask *mask)
> -{
> -	int num_rates = 0;
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(mask->control[band].ht_mcs); i++)
> -		num_rates += hweight16(mask->control[band].ht_mcs[i]);
> -
> -	return num_rates;
> -}
> -
>   static bool
>   ath11k_mac_has_single_legacy_rate(struct ath11k *ar,
>   				  enum nl80211_band band,

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
