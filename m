Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DC4C3DA6F
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcwn8PyT5lZm7eFZRZlcYSZ810wOjVTb/u5NR69eXsg=; b=ZJ88yxio1PbRBQ
	fE9a1GT3K2lYfx3kFLxrBeHkgTxVfhc65tsDqkyuITIKKm0w6z26eOwZJLsm1AqfzpPcgAN2EOeQ6
	t+E1rhLDcwhj6CNvJpPuj/ns3BuYFGWvRbYXc3qOl5UaJnr5OJnmD6edJiqFSNCebI6fJ2lukcl2z
	aiwamV7k4qWpWmw4BGMSCTLdYOXGhqbBnqouwfO8O2zo5iQ5wHEyukiEtHsGO1k0ZfDKbsRwvYOSY
	h9O9SXFHuzjc3EuuA1zaVhbkEaTaEYwmFP4I35NhiEA9g/vZLeisELwbRhkB275CZ02gGkBv9Ba5G
	KoBjMxg8hkwC8jX9AOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZCHp-003N4q-0E;
	Thu, 24 Aug 2023 15:30:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZCHk-003N4P-2e
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 15:30:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OEWkv1006960;
	Thu, 24 Aug 2023 15:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=v1ftzoKOgQHzAHqnOzcWmrhBWZ3pDMZ0yLpmUn8k44w=;
 b=lH5WrAtMHCaHqnD2C2HKbTkBgMeAknaZNfu07+axeIO2GaVVif64TDXA+iVYSkwugN9V
 a1xxYf4wfOjlqgzaouJdx301pEldQMIGCcwyBxBxAk3skFg5nGfv2Axqhz23wWEntrIB
 QBl1b2SPQGwHQQMu6vMoIMX+WpjxFrHGpNT2kSfm0GobPYP1M5y9HkL4kDrJ2nEPWqW8
 JirlEIhW2hUOqmnpPI8tnQchIE20yVot6VMZb4iC9RqgvlyBPprNlOuZeldFoIv/3d2L
 SLu9RS0PYvXuWxnaviU9XefBxrNIgMa3JemwXWhA2MsZFAVY9tADcmSd5rG0uwVThP3f Tw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sp1k9hf6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 15:30:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37OFU8M7025989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 15:30:08 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 24 Aug
 2023 08:30:08 -0700
Message-ID: <3aded344-1ba0-405d-9541-aefc293f4ba2@quicinc.com>
Date: Thu, 24 Aug 2023 08:30:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] wifi: ath11k: drop redundant check in
 ath11k_dp_rx_mon_dest_process()
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, Tom Rix <trix@redhat.com>,
        <linux-wireless@vger.kernel.org>, <lvc-project@linuxtesting.org>,
        <ath11k@lists.infradead.org>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230824075121.121144-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1E6o_mfAXAnz5nO1IR0D_vRrdXeLpQEu
X-Proofpoint-ORIG-GUID: 1E6o_mfAXAnz5nO1IR0D_vRrdXeLpQEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_12,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=420
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2308240130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_083014_073776_CF267FAB 
X-CRM114-Status: GOOD (  17.98  )
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

On 8/24/2023 12:50 AM, Dmitry Antipov wrote:
> In 'ath11k_dp_rx_mon_dest_process()', 'mon_dst_srng' points to
> a member of 'srng_list', which is a fixed-size array inside
> 'struct ath11k_hal'. This way, if 'ring_id' is valid (i. e.
> between 0 and HAL_SRNG_RING_ID_MAX - 1 inclusive), 'mon_dst_srng'
> can't be NULL and so relevant check may be dropped.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/dp_rx.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 1e488eed282b..3f315547878a 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -5097,13 +5097,6 @@ static void ath11k_dp_rx_mon_dest_process(struct ath11k *ar, int mac_id,
>   
>   	mon_dst_srng = &ar->ab->hal.srng_list[ring_id];
>   
> -	if (!mon_dst_srng) {
> -		ath11k_warn(ar->ab,
> -			    "HAL Monitor Destination Ring Init Failed -- %p",
> -			    mon_dst_srng);
> -		return;
> -	}
> -
>   	spin_lock_bh(&pmon->mon_lock);
>   
>   	ath11k_hal_srng_access_begin(ar->ab, mon_dst_srng);


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
