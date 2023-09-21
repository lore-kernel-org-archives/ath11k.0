Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE32E7D0A7
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmd2DnoetY3jqDtZQQi9b2TORkunfgSqheZFMQ5tND0=; b=ESAju13tuS8tqB
	2tQJmEU7NxyBBt97pmy4OUdJtjBAKFjh6ZoApdfAz4PpWdyNGcQxJVDif9azRvDWFhW6NuBe09BQK
	JNgLngIOCaBgIIZfeSbqPR4Uj4MFXJGoWHncpX97mJVQCLZWNmSoG9FPQ0QEw3vr4J/n3RrkIpm06
	rTbrfcoRYlt1DwJbTGcf7VMpP6RueNAJursOWcGto5vSzL/uSxpJb2on9IM+iZUc5ctrYNTZeVddI
	FDbL+UimcyFew4X65Ee9j/BqoeA2PeUqvRxCozpTSCedF4xrPMz+buZ3+s4zR7iD9jx38oFIxbSOE
	p3ujMDRcDwzhL3LJib4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQ25-0073bv-1h;
	Thu, 21 Sep 2023 20:12:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjQ22-0073am-2l
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:12:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LIJ4X3028859;
	Thu, 21 Sep 2023 20:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=l/0k/R0/QbbjLu2Z/8S0f4OQHRTRc+S7t/L+2Bxf7Wo=;
 b=ZR3Wo24mOMdyBvFK/MA8HWKWwKjZmLV4PJDwpcVsNTYF1jf2lvUP7TifqM8DGM/m/tJ3
 v5ybTIhXi24xw7gagM9yDbm78Q/layU2oRPqP/2ueYlCCjjVNBHOLs0dy8Sae9Hmo1Fc
 7HbBdKUzgp0PS0xscL801wSeIfsUpFfAAoNiYOQTgngKIp5nReQkYpWElN/sKu4bNB10
 E3NiMTvKiqjglHcFsi4t6Zn+DwMw9mVdf4t7ZDX36433qEHmNalla/SW5F13PG81lq5q
 ceqFaZKLvO6oU57p1qgpGdlo0fC532lbfYheDzuHCKDZxzpQQb9pkT4hzjbq+ezrdwoi wA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u0hg7c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:12:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LKBnav019951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:11:49 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:11:49 -0700
Message-ID: <13152047-9109-449f-b4f4-55fb7f4bb3ac@quicinc.com>
Date: Thu, 21 Sep 2023 13:11:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/13] wifi: ath11k: fill parameters for vdev set tpc
 power WMI command
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-10-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-10-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pUwk0TvleU8jPuecLXh0ol-tRJ34pn9Z
X-Proofpoint-GUID: pUwk0TvleU8jPuecLXh0ol-tRJ34pn9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=978 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_131215_016218_25D7BF45 
X-CRM114-Status: GOOD (  22.14  )
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
> Prepare the parameters which is needed for WMI command WMI_VDEV_SET_TPC_POWER_CMDID.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 277 ++++++++++++++++++++++++++
>   drivers/net/wireless/ath/ath11k/mac.h |   3 +
>   2 files changed, 280 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index bfb900d98347..f05d66913abd 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -7661,6 +7661,283 @@ static u8 ath11k_mac_get_num_pwr_levels(struct cfg80211_chan_def *chan_def)
>   	}
>   }
>   
> +static u16 ath11k_mac_get_6ghz_start_frequency(struct cfg80211_chan_def *chan_def)
> +{
> +	u16 diff_seq;
> +
> +	/* It is to get the lowest channel number's center frequency of the chan.
> +	 * For example,
> +	 * bandwidth=40 MHz, center frequency is 5965, lowest channel is 1
> +	 * with center frequency 5955, its diff is 5965 - 5955 = 10.
> +	 * bandwidth=80 MHz, center frequency is 5985, lowest channel is 1
> +	 * with center frequency 5955, its diff is 5985 - 5955 = 30.
> +	 * bandwidth=160 MHz, center frequency is 6025, lowest channel is 1
> +	 * with center frequency 5955, its diff is 6025 - 5955 = 70.
> +	 */
> +	switch (chan_def->width) {
> +	case NL80211_CHAN_WIDTH_160:
> +		diff_seq = 70;
> +		break;
> +	case NL80211_CHAN_WIDTH_80:
> +	case NL80211_CHAN_WIDTH_80P80:
> +		diff_seq = 30;
> +		break;
> +	case NL80211_CHAN_WIDTH_40:
> +		diff_seq = 10;
> +		break;
> +	default:
> +		diff_seq = 0;
> +	}
> +
> +	return chan_def->center_freq1 - diff_seq;
> +}
> +
> +static u16 ath11k_mac_get_seg_freq(struct cfg80211_chan_def *chan_def,
> +				   u16 start_seq, u8 seq)
> +{
> +	u16 seg_seq;
> +
> +	/* It is to get the center frequency of the specific bandwidth.
> +	 * start_seq means the lowest channel number's center frequency.
> +	 * seq 0/1/2/3 means 20 MHz/40 MHz/80 MHz/160 MHz&80P80.
> +	 * For example,
> +	 * lowest channel is 1, its center frequency 5955,
> +	 * center frequency is 5955 when bandwidth=20 MHz, its diff is 5955 - 5955 = 0.
> +	 * lowest channel is 1, its center frequency 5955,
> +	 * center frequency is 5965 when bandwidth=40 MHz, its diff is 5965 - 5955 = 10.
> +	 * lowest channel is 1, its center frequency 5955,
> +	 * center frequency is 5985 when bandwidth=80 MHz, its diff is 5985 - 5955 = 30.
> +	 * lowest channel is 1, its center frequency 5955,
> +	 * center frequency is 6025 when bandwidth=160 MHz, its diff is 6025 - 5955 = 70.
> +	 */
> +	if (chan_def->width == NL80211_CHAN_WIDTH_80P80 && seq == 3)
> +		return chan_def->center_freq2;
> +
> +	seg_seq = 10 * (BIT(seq) - 1);
> +	return seg_seq + start_seq;
> +}

The above two functions are driver agnostic. Will other drivers need 
this as well, and if so, should these go into core wireless?


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
