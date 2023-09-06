Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C3AEE14A5
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsfCGxT3Jxdl3mPLhZGwgD28uRAVqjIg8PymVyUceaM=; b=HAP8oBl+Mf1zyZ
	W5fl0E3k9kYmpJHvSw7Bgmb0uQD9rT5sRk88v+WUn/5fDSRrxhxO/GihsH4qTm/+FYv/SfgyAbJ71
	gXJYqot7vtsZV69W3eySdbzNG6G1Dspe+0cUYdHqAkhOLP4N4H7pcHmJWfRIs1GJEXvI4k76kB9nE
	qTM/LNmmLDARP+KdibDgL69OwyQRyMgq1KaBZK1gS0vUd+GSyK3MIugMCk9nycvimZk9L0oyV1Jxh
	mBEm8m7DKTz1xPYuT6dU/1SlYP1KBOSlyBbPYNB/njatJYkU2MFC9OYI2gk2HpcGOcAWTUtsIkMbv
	5ICIYwdZB5erTPd63qPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdvPQ-00AWt9-0t;
	Wed, 06 Sep 2023 16:29:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdvPM-00AWrl-2J
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 16:29:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386EfZ6f030020;
	Wed, 6 Sep 2023 16:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/QuYDb4WZqLH0LbzObSwSiBNYxHo6RIhSFOqhSJ6hxY=;
 b=omtw91nIIJCm3R66uDsusTUvSOKfPqk6aEmJmla9UM80D7MzZXS+zcX21SmZj/U3Lw9/
 hwyx5Bfp48HHlLJv6Y2rTY+2a+38Pr1RoMeukziXF10vPsdFVaZ99CqXUQt0WxEHoyj4
 jHwA88/z61g+7W2xPDU1iELs4lOnFPAguYwI2NlhPZoXj4VjAXg6BWN/sRIvD5woXrFD
 yifWcQy5wQZN3d06hJEZufgbCHD+1h32A5TIzJx/vjgW8i7EBUgl59veMCAti6a+gZtH
 SnYsiEKtqF8t5kjXuu3vKP0tbRiCGoOXbcdKyU77h9GESCRKw/kQc0g+tLyq6Zm2Esm1 vg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxpt016g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 16:29:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 386GTRs6004408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 16:29:27 GMT
Received: from [10.111.180.119] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 6 Sep
 2023 09:29:26 -0700
Message-ID: <1bc2ee72-be09-4787-964d-908c85e4b6fd@quicinc.com>
Date: Wed, 6 Sep 2023 09:29:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: drop NULL pointer check in
 ath11k_update_per_peer_tx_stats()
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>,
        <lvc-project@linuxtesting.org>, <ath11k@lists.infradead.org>
References: <20230906093704.14001-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230906093704.14001-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: w-khF0DznUQPgbCQstRrElgS62-MeVex
X-Proofpoint-GUID: w-khF0DznUQPgbCQstRrElgS62-MeVex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0 mlxlogscore=790
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_092936_766485_B13AF423 
X-CRM114-Status: GOOD (  17.32  )
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

On 9/6/2023 2:36 AM, Dmitry Antipov wrote:
> Since 'user_stats' is a fixed-size array of 'struct htt_ppdu_user_stats'
> in 'struct htt_ppdu_stats', any of its member can't be NULL and so
> relevant check may be dropped.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/dp_rx.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 62bc98852f0f..146201d8dba2 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1388,9 +1388,6 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
>   	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
>   	bool is_ampdu = false;
>   
> -	if (!usr_stats)
> -		return;
> -
>   	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
>   		return;
>   


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
