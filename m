Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736A0C001B0
	for <ath11k@archiver.kernel.org>; Wed, 26 Jul 2023 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIYO/N6g2fpFTrwBM8NSQupbvS8ZlIUNnPq0qpjQzfs=; b=OswTUQ18N+Ag9r
	1ITHVgezTuX8aJX6xjEC2+TZLEE39gje9iIzUOvnyfvv17GUo7p5vLuE8f9cZDSMZi/R+2OYPQc8Y
	cLnWxwHblaQt+G68Y/Zys9wnrSzAqQYAC5BUKBB12W2XFOmsnXqzBz5/xMkb5zSOnuAZE0KV8JApm
	9drN8FCefXtwXE4qTuAEMnlmAQtc8e1LR9fkYz76oEtWu//roGL8ky0ixgwqrb3uzvzl71FUAl/Ww
	I8+hhT+igHSXi9nrFPqqYp6B8km1wbIdabaSvlIv/h9gNOno8b0dbH8tVX0uIPHlJN1O5NjoyYPGr
	4/XMB288nx/cJLpmwYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhnO-00B50L-2D;
	Wed, 26 Jul 2023 16:55:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhnL-00B4qb-2B
	for ath11k@lists.infradead.org;
	Wed, 26 Jul 2023 16:55:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q56txr011163;
	Wed, 26 Jul 2023 16:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sxH4P/VNokBhM4oPtyHzEtjm3EFIf0Jgyt4HiDCo988=;
 b=GSweYayRzOcNORVKaqRfArjWt0WsYFpdr1vmtwtxvP6JEPssF3satcO9XKC+v3b03XpE
 ikzkIu/PVwUdp0/0A0VMlsnBZkWcO3fLKBPMSehEra0sGNjhWvTIzSAd0AB/wC7SKH7F
 dL+2AcUzZWGg4Yt2maG+V0uzTeicX5WOfHAUYccw4b/ad7+c280P5Vt2KuWGBkY3fQ2Z
 Ashqe34Yl51+JX9vV2LOyig6qJgzgTpXnpwjnpIJaB/Bbl2+A1JWWQ52VhSY8hfdF9QI
 vRyLVIP+BaGFUB9hjo5Phj9N5wFoGdBQnYQbvRdimTBMlgYsSqar8fJfpVvnEUv88TnT Lg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2ufm9he2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 16:55:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36QGtLqK014635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 16:55:21 GMT
Received: from [10.48.245.247] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 09:54:47 -0700
Message-ID: <8fe1a927-14da-445c-4c48-e3f4b4c324d4@quicinc.com>
Date: Wed, 26 Jul 2023 09:54:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix band selection for ppdu received in
 channel 177 of 5 GHz
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230726044624.20507-1-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230726044624.20507-1-quic_adisi@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7Z0T54WVTj6A6_EwugDl-7BDvkhyJ3R3
X-Proofpoint-ORIG-GUID: 7Z0T54WVTj6A6_EwugDl-7BDvkhyJ3R3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_07,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307260150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_095527_849168_161A1835 
X-CRM114-Status: GOOD (  19.88  )
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

On 7/25/2023 9:46 PM, Aditya Kumar Singh wrote:
> 5 GHz band channel 177 support was added with the commit
> "wifi: ath11k: add channel 177 into 5 GHz channel list". However,

I'd use the same syntax here as in the Fixes tag:
e5e94d10c856 ("wifi: ath11k: add channel 177 into 5 GHz channel list")

> during processing for the received ppdu in ath11k_dp_rx_h_ppdu(), channel
> number is checked only till 173. This leads to driver code checking for
> channel and then fetching the band from it which is extra effort since
> firmware has already given the channel number in the meta deta.

nit: s/meta deta/metadata/

> 
> Fix this issue by checking the channel number till 177 since we support
> it now.
> 
> Found via code review. Compile tested only.
> 
> Fixes: e5e94d10c856 ("wifi: ath11k: add channel 177 into 5 GHz channel list")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 5c76664ba0dd..1e488eed282b 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2408,7 +2408,7 @@ static void ath11k_dp_rx_h_ppdu(struct ath11k *ar, struct hal_rx_desc *rx_desc,
>   		rx_status->freq = center_freq;
>   	} else if (channel_num >= 1 && channel_num <= 14) {
>   		rx_status->band = NL80211_BAND_2GHZ;
> -	} else if (channel_num >= 36 && channel_num <= 173) {
> +	} else if (channel_num >= 36 && channel_num <= 177) {
>   		rx_status->band = NL80211_BAND_5GHZ;
>   	} else {
>   		spin_lock_bh(&ar->data_lock);


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
