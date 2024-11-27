Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF371D6ACE9
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 15:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHYAX+xAbeW/GuhoTfgzvsc/2BcrL6l2T6Lxp5gCdD4=; b=DtIhANJxp1x6YHQtOvHqbzFx12
	gkcjtxdpR+DiEM3s+10NoHLizRoZkBdt1z6OWbVxW2HFcVmDjz4IVP4V0+JKKJvqWBxTFvzJKriFR
	jechaDrUClgdB+bf7lP1CZH4auKI277BSnfyDsKih3bGakS4V1j+JlcnIa/jxF0lZSFvewM/0uz4s
	sytdSQE30+r6a1GIv95ZGFUp06UQ0oizO8k9pVaTBe36iXwvcUYH1V1vKWXKg7d0lJXLL/cIiGcNY
	eXLk9ItdK7FDrKU6aI7io1Yl2LfyQZeyDxL6R349WociWJZR5RuNDZ1wWEIvf0Wzr696YhBKmvLNx
	HjZH9VvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJtJ-0000000DV07-2ROB;
	Wed, 27 Nov 2024 15:23:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJsu-0000000DUvm-3ZX1
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 15:23:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARAgRUA018284;
	Wed, 27 Nov 2024 15:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHYAX+xAbeW/GuhoTfgzvsc/2BcrL6l2T6Lxp5gCdD4=; b=lKN3ZFe/eg6DG5DI
	2+mKeRd93up7hbmsVhcnP1Wb6HNVPZKNYM87ygdg6Eab0JPfTY90dReEfS+AwUAs
	5gzRn4tnO3shxYsatcoK2Jr3kODo/5ZOgWNXwMMp1eF5mxFY/cZ9u7vndeIF+f0i
	AieDO708Xr1krHPCWy1wN/9R+nd3i/jNv9cdi3u0qbePB5iA7QUTWM1JZd+sjZmn
	M+4V40g366VX7RFhi7ttz45kYe+dBKus5sbY29PbNXW06ZkD8h1ERr8y+GPajS83
	/XKnPnzjyNzs+XybImuP5h0+ZGtI+L/uF6YqOZ0uNzsIG8wFBZ2XcziPTCzVIXC/
	xYnauw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4361wcgtdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 15:23:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARFNEXs017002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 15:23:14 GMT
Received: from [10.216.34.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 07:23:11 -0800
Message-ID: <f0077f4f-922d-56b1-a5b7-bb01e4462e87@quicinc.com>
Date: Wed, 27 Nov 2024 20:53:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5] wifi: ath11k: Fix NULL pointer check in
 ath11k_ce_rx_post_pipe()
Content-Language: en-US
To: Baichuan Qi <zghbqbc@gmail.com>, <markus.elfring@web.de>
CC: <ath11k@lists.infradead.org>, <jjohnson@kernel.org>, <kvalo@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>
References: <30b208e0-55a2-400f-9638-1765e7ed3bfa@web.de>
 <20241127143804.30075-1-zghbqbc@gmail.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20241127143804.30075-1-zghbqbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ISkNkP16tpVYkKOeT4Yi-iLlLqHFkxZS
X-Proofpoint-ORIG-GUID: ISkNkP16tpVYkKOeT4Yi-iLlLqHFkxZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1011 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_072320_904450_BB0ACBB0 
X-CRM114-Status: GOOD (  24.18  )
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



On 11/27/2024 8:08 PM, Baichuan Qi wrote:
> Current implementation of `ath11k_ce_rx_post_pipe()` checks for
> NON-NULL of either `dest_ring` or `status_ring` using an OR (||).
> Both rings, especially `dest_ring`, should be ensured to be
> NON-NULL in this function.
> 
> If only one of the rings is valid, such as `dest_ring` is NULL
> and `status_ring` is NON-NULL, the OR (||) check would not stop
> `ath11k_ce_rx_post_pipe()`, the subsequent call to
> `ath11k_ce_rx_buf_enqueue_pipe()` will access the NULL pointer,
> resulting in a driver crash.
> 
> Fix the NON-NULL check by changing the OR (||) to AND (&&),
> and return an error code `-EIO` to indicate
> `ath11k_ce_rx_post_pipe()` is stopped with an NULL pointer
> error, ensuring that the function only proceeds when both
> `dest_ring` and `status_ring` are NON-NULL.
> 
> Link: https://lore.kernel.org/ath11k/a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")

This does not really fix any real issue. Please check ath11k_ce_alloc_pipe()
where initialization would fail if anyone of pipe->dest_ring and
pipe->status_ring allocation fails for ce pipe used for Rx.

> Signed-off-by: Baichuan Qi <zghbqbc@gmail.com>
> ---
> V4 -> V5: add err code in NULL check
> V3 -> V4: reorder describe info
> V2 -> V3: add Link URL to mailing list archives
> V1 -> V2: rewrite commit message and fix tag
> 
>   drivers/net/wireless/ath/ath11k/ce.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
> index e66e86bdec20..223dab928453 100644
> --- a/drivers/net/wireless/ath/ath11k/ce.c
> +++ b/drivers/net/wireless/ath/ath11k/ce.c
> @@ -324,8 +324,10 @@ static int ath11k_ce_rx_post_pipe(struct ath11k_ce_pipe *pipe)
>   	dma_addr_t paddr;
>   	int ret = 0;
>   
> -	if (!(pipe->dest_ring || pipe->status_ring))
> -		return 0;
> +	if (!(pipe->dest_ring && pipe->status_ring)) {
> +		ret = -EIO;
> +		return ret;
> +	}

This will always fail as the caller loops through all the supported ce pipes
and ce pipes used for Tx will not have either dest_ring or status_ring.
Please ensure the patch is tested properly.

So NAK

Vasanth

