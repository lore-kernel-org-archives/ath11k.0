Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B1DCD4F41
	for <ath11k@archiver.kernel.org>; Fri, 22 Sep 2023 09:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/RTOzkmGv2MxhB8xxF/qDhaLtxNNImXYDYA/8QiZT8=; b=NryjH7wPQ6m+G3
	BWfZBCFay1JipAHDWodKoOh8093N3ceOjtezj2LRBxbH0KEjxxCy/V5JGgLR8goxzUpnPDV03HbE4
	GbaZOrt+mZ2KfIRnRsMH/6O5LsMwHKUCt2SNm+quQWHPPPoYI0Qk4RpSAcA0vOLzUEbyOCKlZNyzU
	CHCzRRS8i6Q05avqQmJvFeL0xs2oQUbnaGfy7aphLOmlphcM3Y73Plrr0GOLsMKq2OT04p9fbO+II
	GaDWYEDRvpCeL2Yj/sCpWTwThH4v0KJuawnUndP9KA/1Z/+F0hKAf4xVHNm7JgVNLIJIKMczkAuyw
	FiDkF+Incilkn7PMQBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcWY-008aTS-1q;
	Fri, 22 Sep 2023 09:32:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcWW-008aSt-1G
	for ath11k@lists.infradead.org;
	Fri, 22 Sep 2023 09:32:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38M91nBB027510;
	Fri, 22 Sep 2023 09:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=BpNWDr/p+sNssrpqDRn01GQk5e3gdOKA+k3ursFJFyA=;
 b=gAth5Ax9syYsvsyxQ4I5O6RLRJ9V4ap6DqcEEe1DGv5meP8rIFDbQBciAALGBtB3g9uj
 wGpLLxUC2OhZ/rqLhQYwKSlyPAqdI70yB1ixHVHM7gKuoJQManUXikY6ZTJi+s3hYuzS
 vlQjD3/EdDcXmQ+Qil6RmEyDvKILZpj6ncGmBZxvaSwzNPHwNFtwbRI5YuA/5ysUIPn8
 lckaX7/nSMngjY43Tlnvsp+wA2OTGD1c5bj0YuUNkBeuA0DGmf9skqUvbxOsNBwWTwgc
 izX1MBuKhqFcYOeLSa7wPSBQuUDLPAYIbbBWV/VQ4ki492ZSxCaUXiz/8EJJpi69Os6G lg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u0hhfqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:32:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38M9WQCj022184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:32:26 GMT
Received: from [10.216.13.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 02:32:23 -0700
Message-ID: <fb1eae37-ebe1-4fbd-ab00-6529214b3895@quicinc.com>
Date: Fri, 22 Sep 2023 15:02:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/13] wifi: ath11k: update regulatory rules when
 interface added
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-5-quic_wgong@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20230920082349.29111-5-quic_wgong@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zb5AT49d7JW4Tg-tREqZlGlALOnoBe7B
X-Proofpoint-GUID: Zb5AT49d7JW4Tg-tREqZlGlALOnoBe7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_023232_541480_C5A26913 
X-CRM114-Status: GOOD (  23.22  )
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

On 9/20/23 13:53, Wen Gong wrote:
> There are two power types for 6 GHz regulatory, one is AP, another
> is client.
> 
> When wlan boot up, WMI_REG_CHAN_LIST_CC_EXT_EVENTID is sent from
> firmware at an early stage, the interface mode is not decided at
> this point, then ath11k select reg rules of AP type as default.
> 
> After interface is created, it is exactly decided the interface
> type such as AP/mesh point/station. Then ath11k need to update
> reg rules to the exact power type matched to the interface type.
> 
> The client power type is used for station interface, and AP power
> type is used for AP/mesh point interface.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 14 ++++++++++++++
>   drivers/net/wireless/ath/ath11k/mac.h |  2 +-
>   2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index c071bf5841af..0512c8b0661c 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -6714,6 +6714,12 @@ static int ath11k_mac_vdev_delete(struct ath11k *ar, struct ath11k_vif *arvif)
>   	return ret;
>   }
>   
> +bool ath11k_mac_supports_6ghz_cc_ext(struct ath11k *ar)
> +{
> +	return (test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT,
> +			 ar->ab->wmi_ab.svc_map)) && ar->supports_6ghz;
> +}
> +
Primarily we are checking whether WMI service is advertised or not, so 
better place to keep this function would be in wmi.c?



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
