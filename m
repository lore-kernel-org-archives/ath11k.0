Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22579C3ABC3
	for <ath11k@archiver.kernel.org>; Mon, 12 May 2025 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpCvUiqf8jOdYl4KjuVl92Qfn2CkC3EQ2l1CIP7TNl4=; b=dkGUcPNWN56Cth2+ypyHn6TNZ6
	MloCJzEAVd93z5lWOBMOIlNgaUMGovYUTayvSocNcaakJM5idUE/OqJTGcZBwMI9bPOiTg/YPW6la
	tqScVO0lTVvWoAfRX0fc+ElZbYUqcFXDlQ9h90/J+eWGGBqveKnwxpS00TN40KGykpLfIClrH6bc8
	X3WSFs/ZSN78mR0huPuO5H+OkkxwKhktjlkOU0om2wz62yidkJ1/j49FC+2fjUuAFKBYxRme5ksxQ
	HtUgrY/5qCFsImmVTUbuC3d/ibWXAbPBv0eMx2Hf53thWLFrCcakQMRmsv6/SbUo1VIY9050AML4D
	3pZ8JBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENUY-00000008cIY-2ZDQ;
	Mon, 12 May 2025 07:22:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uENUV-00000008cI9-1dwn
	for ath11k@lists.infradead.org;
	Mon, 12 May 2025 07:22:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C7HKFw022858;
	Mon, 12 May 2025 07:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XpCvUiqf8jOdYl4KjuVl92Qfn2CkC3EQ2l1CIP7TNl4=; b=nU1l9n9jseu2bKMU
	ktmtR2wXSk2nZBEsBpUfbp4vn5Qf4tB4sGg5qn/89P7hcK3N2Np4lqRE/T3L4wmn
	+IdUEgAJiIWspahfQ8Z/0dnCzpZhqvdNc6N3XKgfhkvwiiJU8pt3i6xANAMK0lh/
	coU9RBlz8dsW4JDTatKZfNJU6NNebSZAejdYTAQOrfautcHqNcE0sDam4Mq96PXW
	iVEtIc9wETHlbPm9li9Q3yDkQ8F05EpkVC94J9GYZY7cWDS3xua3fzMQ6HfsjNWD
	ImCcDN3VQYKAKeDrnIY8j7DMm+MvOvfwQqYnOuU6pnxQ/rkHku5HZM9g8ZizQI/F
	0ff3og==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfeg0qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 07:22:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C7MEuV032262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 07:22:14 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 May
 2025 00:22:12 -0700
Message-ID: <5e1d18b4-ed65-41df-b465-de172cd8c340@quicinc.com>
Date: Mon, 12 May 2025 15:22:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: support DBS and DFS compatibility
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>, <kvalo@kernel.org>
CC: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, Mihai Moldovan <ionic@ionic.de>
References: <20241127022742.4016870-1-quic_yuzha@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20241127022742.4016870-1-quic_yuzha@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA3NyBTYWx0ZWRfXyTV/tbLMzOex
 ixMjZsnQsHvd5VNbMuIyezYD1HNSCD7CS2ptNABrSir2GzWQt5cR7bRas2bbs3W4B6HxmCXEo/c
 HXMoglG05rlaCWN1/EqLyXrPYM6w3oA03ASdOuytxdpCf4FEoqAr5fnz0WreUULt5jPAkCeNp7u
 i8ut9hvTKrXJlzj9H1tJNUc+aazwfVtRERe8bN0GnpHq2jYJRDKUdgbw6VPj58b8BQjKvNUZf7U
 g0z07NM3rAcUT3gpBbBwU6ijDkYYIxZwTeZk7zDwpc4OAxRGYvSpObi+Ft1vRfefUZSJFKv4w+W
 3fPe2bfI/r55tJvAH1UKZMhzcSc4kZs4LT2ldC0xCKDcQcQbN6eG68LXSnNAwaBSiU+/jKv5po7
 V67RAnSjXgwXWunhu94I32XZBtRjpEDw0GVYY9RxdfXnxuXwXKppIxm76H4B2ZRuIlDVcq8G
X-Proofpoint-ORIG-GUID: rfW0OvIJWFT5j_jXo2PIu4U-BhOZcdjl
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=6821a1a8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=bC-a23v3AAAA:8
 a=COk6AnOGAAAA:8 a=wEeEAfWtOIlYbqs6mrQA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rfW0OvIJWFT5j_jXo2PIu4U-BhOZcdjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_02,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_002223_559847_CB961BD3 
X-CRM114-Status: GOOD (  20.01  )
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



On 11/27/2024 10:27 AM, Yu Zhang(Yuriy) wrote:
> Now some chips which support 'support_dual_stations' will enable DBS,
> but will disable DFS. Restructure the ath11k_mac_setup_iface_combinations
> function to support DBS and DFS compatibility.
> 
> About 'support_dual_station' feature can refer:
> https://msgid.link/20230714023801.2621802-2-quic_cjhuang@quicinc.com
> 
> Add a ieee80211_iface_combination to support DBS and DFS compatibility,
> one combination can support DFS(same with non dual sta), another
> combination can support DBS. When running different scenarios that will
> use different ieee80211_iface_combination due to mac80211 will go through
> all of possible interface combinations.
> 
> In addition, maximum number of interfaces of these types should be total
> allowed in this group.
> 
> The chips affected are:
> 
>  QCA6390 hw2.0
>  WCN6855 hw2.0
>  WCN6855 hw2.1
> 
> Other chips are not affected.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-00410-QCAHKSWPL_SILICONZ-2
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.1.0.1-01161-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1.
> Tested-by: Mihai Moldovan <ionic@ionic.de>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
> ---
> v2:
>  - Add tested-on IPQ8074 and IPQ6018.
> v3:
>  - Add tested-on QCA6390.  
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 42 +++++++++++++++------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 31ae9b384a29..aa63f5e20f2b 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -9911,12 +9911,17 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
>  	struct ath11k_base *ab = ar->ab;
>  	struct ieee80211_iface_combination *combinations;
>  	struct ieee80211_iface_limit *limits;
> -	int n_limits;
> +	int n_limits, n_combos;
>  	bool p2p;
>  
>  	p2p = ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_P2P_DEVICE);
>  
> -	combinations = kzalloc(sizeof(*combinations), GFP_KERNEL);
> +	if (ab->hw_params.support_dual_stations)
> +		n_combos = 2;
> +	else
> +		n_combos = 1;
> +
> +	combinations = kcalloc(n_combos, sizeof(*combinations), GFP_KERNEL);
>  	if (!combinations)
>  		return -ENOMEM;
>  
> @@ -9931,7 +9936,9 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
>  		return -ENOMEM;
>  	}
>  
> +	limits[0].max = 1;
>  	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
> +	limits[1].max = 16;
>  	limits[1].types |= BIT(NL80211_IFTYPE_AP);
>  	if (IS_ENABLED(CONFIG_MAC80211_MESH) &&
>  	    ab->hw_params.interface_modes & BIT(NL80211_IFTYPE_MESH_POINT))
> @@ -9941,25 +9948,24 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
>  	combinations[0].n_limits = n_limits;
>  	combinations[0].beacon_int_infra_match = true;
>  	combinations[0].beacon_int_min_gcd = 100;
> +	combinations[0].max_interfaces = 16;
> +	combinations[0].num_different_channels = 1;
> +	combinations[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
> +						BIT(NL80211_CHAN_WIDTH_20) |
> +						BIT(NL80211_CHAN_WIDTH_40) |
> +						BIT(NL80211_CHAN_WIDTH_80) |
> +						BIT(NL80211_CHAN_WIDTH_80P80) |
> +						BIT(NL80211_CHAN_WIDTH_160);
>  
>  	if (ab->hw_params.support_dual_stations) {
>  		limits[0].max = 2;
> -		limits[1].max = 1;
> -
> -		combinations[0].max_interfaces = ab->hw_params.num_vdevs;
> -		combinations[0].num_different_channels = 2;
> -	} else {
> -		limits[0].max = 1;
> -		limits[1].max = 16;
>  
> -		combinations[0].max_interfaces = 16;
> -		combinations[0].num_different_channels = 1;
> -		combinations[0].radar_detect_widths = BIT(NL80211_CHAN_WIDTH_20_NOHT) |
> -							BIT(NL80211_CHAN_WIDTH_20) |
> -							BIT(NL80211_CHAN_WIDTH_40) |
> -							BIT(NL80211_CHAN_WIDTH_80) |
> -							BIT(NL80211_CHAN_WIDTH_80P80) |
> -							BIT(NL80211_CHAN_WIDTH_160);
> +		combinations[1].limits = limits;
> +		combinations[1].n_limits = n_limits;
> +		combinations[1].beacon_int_infra_match = true;
> +		combinations[1].beacon_int_min_gcd = 100;
> +		combinations[1].max_interfaces = ab->hw_params.num_vdevs;
> +		combinations[1].num_different_channels = 2;
>  	}
>  
>  	if (p2p) {
> @@ -9970,7 +9976,7 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
>  	}
>  
>  	ar->hw->wiphy->iface_combinations = combinations;
> -	ar->hw->wiphy->n_iface_combinations = 1;
> +	ar->hw->wiphy->n_iface_combinations = n_combos;
>  
>  	return 0;
>  }

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>



