Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716F5E7D0A2
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5eUKM3a8G0tYacynNPQs/aCxbv8yQxyfq5oebZYWGM=; b=kuisVW9Uhn6nVh
	TLFzcGhqiPqTOvbAd1cEQc8woH5YdhUzsfOjLWe/ADh4/WEf3c+0FnuGOubdxpVuCT9/MzUiyorWt
	na2tloclEuV97JQistSoD0w+DB+rAuwUNptppGdDiwL0GyiagyVURzNP6hwuT+LjVV1SMnQ5u6VoH
	JzUSoE+ySqK5whQcr+lV43b8rTYKolh8JjvSVsRfHTmSA3d4iIpg0ziNMHz/kqu+ZkNQmYseuj5Za
	BWx4fUvZE5Mr38vQT3Z5tDFFXotpYVmuNE4H1IYPbX83DlWNyMj6GyyWerldhGCJ6H2yIA+1DOT9k
	FZdawO9fBFFldGuAYzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQSj-0076nl-0G;
	Thu, 21 Sep 2023 20:39:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQSg-0076nK-1s
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:39:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LKMFsG016370;
	Thu, 21 Sep 2023 20:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bCU/h1Q623nXoDo+D6ye+r+j7q1KuIajFUJw0U1YRrg=;
 b=S/3ZMTIE7hI37rS0UZDVxs8SQWQ0nUYCWf7Z919a77Ra+HtXElSW8Widyj7DAzuK9gji
 cmt4P2Q0aaqVBbmNS4QlgIMN1I3kPJOyJh2MI6cIttyTI7v/pTWoet7V+yOqFDux3nZh
 XRG/75a2MdVRTJ/yJYZ1iJF8aEFfpbzHd7JQAInvX3NVEBZ2+KTFPD7LnOZ2jZuiaM0k
 g//ZQn9oHTXjaiOsO32Buz3AScWmMs7LVBOBEZNCZfUM+RsWxQuWNoWlCW5sfvUuXdA4
 rLHP02oCCcsxY9kcfg6Key4TiFXABeJe3CXKrV7D37pa8Mgo8wra+Ld7R4mzpnLYWdTf BQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8txpg8qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:39:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LKdg09020488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:39:42 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:39:42 -0700
Message-ID: <734f2969-4846-4e9b-97f3-00f9891e6922@quicinc.com>
Date: Thu, 21 Sep 2023 13:39:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/13] wifi: ath11k: discard BSS_CHANGED_TXPOWER when
 EXT_TPC_REG_SUPPORT for 6 GHz
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-12-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-12-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0nFg6BsyKewkGEz8c9gpH5bg7OLAu-Xk
X-Proofpoint-GUID: 0nFg6BsyKewkGEz8c9gpH5bg7OLAu-Xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_133946_743615_80F78645 
X-CRM114-Status: GOOD (  28.28  )
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

On 9/20/2023 1:23 AM, Wen Gong wrote:
> When station is connected to a 6 GHz AP, it has 2 way to configure

s/way/ways/

> the power limit to firmware. The first way is to send 2 wmi command

s/wmi command/WMI commands/

> WMI_PDEV_PARAM_TXPOWER_LIMIT2G/WMI_PDEV_PARAM_TXPOWER_LIMIT5G to
> firmware, the second way is to send WMI_VDEV_SET_TPC_POWER_CMDID to
> firmware which include more parameters for power control.

Why would LIMIT2G/LIMIT5G be used for 6 GHz AP?

> 
> When firmware support SERVICE_EXT_TPC_REG, it means firmware support
> the second way for WMI_VDEV_SET_TPC_POWER_CMDID, then ath11k discard
> BSS_CHANGED_TXPOWER flag from mac80211 which is used to the first way
> for 6 GHz band in this patch and select the second way in the subsequent
> patch.

So if i bisect at this patch and if firmware supports 
SERVICE_EXT_TPC_REG, then there will not be any power limits sent to 
firmware?

Ideally all patches in a series should be able to be bisected without 
introducing regressive behavior.

Does it make sense to squash patches 11 and 13 so that there is no 
regression? Patch 12 would then come before the squashed patch.

> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index f05d66913abd..a8ae281d2635 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3396,6 +3396,18 @@ static int ath11k_mac_config_obss_pd(struct ath11k *ar,
>   	return 0;
>   }
>   
> +static bool ath11k_mac_supports_station_tpc(struct ath11k *ar,
> +					    struct ath11k_vif *arvif,
> +					    const struct cfg80211_chan_def *chandef)
> +{
> +	return ath11k_mac_supports_6ghz_cc_ext(ar) &&
> +		test_bit(WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT, ar->ab->wmi_ab.svc_map) &&
> +		arvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +		arvif->vdev_subtype == WMI_VDEV_SUBTYPE_NONE &&
> +		chandef->chan &&
> +		chandef->chan->band == NL80211_BAND_6GHZ;
> +}
> +
>   static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>   					   struct ieee80211_vif *vif,
>   					   struct ieee80211_bss_conf *info,
> @@ -3595,9 +3607,13 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>   	if (changed & BSS_CHANGED_TXPOWER) {
>   		ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "vdev_id %i txpower %d\n",
>   			   arvif->vdev_id, info->txpower);
> -
> -		arvif->txpower = info->txpower;
> -		ath11k_mac_txpower_recalc(ar);
> +		if (ath11k_mac_supports_station_tpc(ar, arvif, &info->chandef)) {
> +			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
> +				   "discard tx power, change to set TPC power\n");
> +		} else {
> +			arvif->txpower = info->txpower;
> +			ath11k_mac_txpower_recalc(ar);
> +		}
>   	}
>   
>   	if (changed & BSS_CHANGED_PS &&


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
