Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD68C6FA8F
	for <ath11k@archiver.kernel.org>; Thu, 24 Aug 2023 17:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0lsclbEkZAEsFJAPTJ94cQoi/y59vaZT/Dsc+YkfNA=; b=me0Oh9dJGjoyQ2
	phphUpGahklA9S4BNvsrYDpFgbF/LkH1o3POj55le4n9SpwQRdII4j9XqPXIbZMZZEphQ2YtxAwJu
	26rJfLmcZaDkWSviwFuQiMASenuTtfHv3a0oyoQOpjbgMuvxxbQUZ1vXz0RYvzUhv4n3TFFQYsyfs
	6N55guQqDmEO1mqpJxgzJdpCO731nAT2NcDmr+GtvpSDYdaPo+fctQhX5PCGLwpiutw5H/3C37+gI
	3OhJ27oXUD6hehdCVc8kWx92sh+63OmCzjersVxmCyaTqpKop2wLPSegJ4N4k2LzGIUBfNhq83Zbo
	H+dcQMiho3p0UY9IAxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEXl-003YdF-0y;
	Thu, 24 Aug 2023 17:54:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEXj-003Ycs-0f
	for ath11k@lists.infradead.org;
	Thu, 24 Aug 2023 17:54:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OEZH1m002147;
	Thu, 24 Aug 2023 17:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=axJ9BPmx8wV0N98OsonZlC+Fs4E3KvTFeWp45IGIo90=;
 b=K5ilHratgik+RZiYvwLom7h7I4TXxhIkhlAbUsCZTWV1GANsV4DXJ3O2LXl/QLO9X+75
 BCAGqv3hFaI/is0nVR3wgLs2b0LLlRtyqmWu7OTfLugiU5C8tbM33OBM/7k5s6vXu1PN
 7Gg0kBmLSI8m4Zr7PzziVJi1dKCsUzfxt2trwqd5AAfu9nNQBEIgaUm/bMajr1m3p2TQ
 NgRsqjk3Fp5T7NEkos9f4cQ9V+UEAHwNeDqXLLtjgg7MvzvfFJ4vv5JDxDh67UcULKBn
 fFAYG+gGC7NcV02RII3gMDREoXS6g2eTjjM5RY8fqj0cQU3IOSrnXZXoTedKd//VY1n2 xA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3snkumuc1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 17:54:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37OHsjvc005720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 17:54:45 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 24 Aug
 2023 10:54:35 -0700
Message-ID: <5354cefc-f3d5-44c5-a886-bcdf91ffc2a7@quicinc.com>
Date: Thu, 24 Aug 2023 10:54:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] wifi: ath11k: remove unused members of 'struct
 ath11k_base'
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, Tom Rix <trix@redhat.com>,
        <linux-wireless@vger.kernel.org>, <lvc-project@linuxtesting.org>,
        <ath11k@lists.infradead.org>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
 <20230824075121.121144-2-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230824075121.121144-2-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LJNhENoLPhMEVUuKRKyoY2ZRKRwGQPQ6
X-Proofpoint-ORIG-GUID: LJNhENoLPhMEVUuKRKyoY2ZRKRwGQPQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_14,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=813
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308240153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_105451_359052_1852C31B 
X-CRM114-Status: GOOD (  15.10  )
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
> Remove set but otherwise unused 'wlan_init_status' and
> 'wmi_ready' members of 'struct ath11k_base', adjust
> 'ath11k_wmi_tlv_rdy_parse()' accordingly.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/core.h | 2 --
>   drivers/net/wireless/ath/ath11k/wmi.c  | 2 --
>   2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index b04447762483..650972f9d146 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -901,8 +901,6 @@ struct ath11k_base {
>   	struct list_head peers;
>   	wait_queue_head_t peer_mapping_wq;
>   	u8 mac_addr[ETH_ALEN];
> -	bool wmi_ready;
> -	u32 wlan_init_status;
>   	int irq_num[ATH11K_IRQ_NUM_MAX];
>   	struct ath11k_ext_irq_grp ext_irq_grp[ATH11K_EXT_IRQ_GRP_NUM_MAX];
>   	struct ath11k_targ_cap target_caps;
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 23ad6825e5be..a5cf97368a14 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -7222,14 +7222,12 @@ static int ath11k_wmi_tlv_rdy_parse(struct ath11k_base *ab, u16 tag, u16 len,
>   		memset(&fixed_param, 0, sizeof(fixed_param));
>   		memcpy(&fixed_param, (struct wmi_ready_event *)ptr,
>   		       min_t(u16, sizeof(fixed_param), len));
> -		ab->wlan_init_status = fixed_param.ready_event_min.status;
>   		rdy_parse->num_extra_mac_addr =
>   			fixed_param.ready_event_min.num_extra_mac_addr;
>   
>   		ether_addr_copy(ab->mac_addr,
>   				fixed_param.ready_event_min.mac_addr.addr);
>   		ab->pktlog_defs_checksum = fixed_param.pktlog_defs_checksum;
> -		ab->wmi_ready = true;
>   		break;
>   	case WMI_TAG_ARRAY_FIXED_STRUCT:
>   		addr_list = (struct wmi_mac_addr *)ptr;


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
