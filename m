Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87DCCDB483
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77gkFpkgsFIFa1O3RI8RLqGm334ri/zgxTAcIkRtdPA=; b=LnMc4yrgKOXbZ0
	EYyEUczkE4cJQuNQvxj7OrIkSl0QhvEMPpWs6tFy6bsC5VuOY37R8LhAcUDQV6Yot1rJXNi7P7ulZ
	vRt9hGHLMnbDTG2naub1y0ggWcp8Iajrf80/CVclbWCbBr15RTBpCtlSJQ3FQuHlbDDE3SalnL4L2
	uE0qWz3A1+8RUSARiijgR+HpMNwTM/0ltFwp+Kqeo0vt/4C0O328tuPNJ42hhlGkeP+E7zLxczXxX
	J/yLBIHmEsRdsih5a6zQ55rH4zOVKQ313jvSLLCAgO/j4eO9DpOoS9EuUdikn0BLMHsndIxwKAYQy
	jFedssv9IA8pjyYcW6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUa8-0009sZ-1C;
	Thu, 19 Oct 2023 15:05:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUa6-0009rT-0m
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:05:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JBTTpm015458;
	Thu, 19 Oct 2023 15:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qanLP9cmLj+5RCqf6a5RUipKVc/ue5qlpWjav39spJI=;
 b=N55h2sDaxlOTr5cqyrZiCojGMyOT9NR8bSHs2F/gOzJ89WNMIKTr60vipNiPCo/+3Sns
 s9GKmNGFGb/DYAaUt51KrBwTsRDOmqq9aI588puJePZ50WEq/k/OSQRhtSUQvdaVLgbU
 gKP4qqzDrkaKFm7yAimUjb6A24J3vn3W3VAd/2CV+0vahAV8+ThzHw2QjQos7XCyFtHe
 WoQsyi+0ix57YBvgsGD7uVVlOsc0OPZuI5GcFh50kThYUBmFCxPzQ4az5BbvH8dFKzTJ
 a6se8ExXuw+V/Rqktd42HFEhGYI7WQgpkaL078xfrcxGyPb+KWMq8Vp/rR2lRG2yGep0 qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu14crsrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:04:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JF4ujJ005265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:04:56 GMT
Received: from [10.48.241.70] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 08:04:56 -0700
Message-ID: <4233c8af-5911-40bf-b5ba-dd0a63863a45@quicinc.com>
Date: Thu, 19 Oct 2023 08:04:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: fix temperature event locking
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20231019104211.13769-1-johan+linaro@kernel.org>
 <20231019104211.13769-2-johan+linaro@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231019104211.13769-2-johan+linaro@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LLFEGCv0SJ0xik2fPzfmGJ9UzfpCfQCs
X-Proofpoint-ORIG-GUID: LLFEGCv0SJ0xik2fPzfmGJ9UzfpCfQCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_14,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=703 clxscore=1011 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_080502_399330_58F5485A 
X-CRM114-Status: GOOD (  20.29  )
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

On 10/19/2023 3:42 AM, Johan Hovold wrote:
> The ath11k active pdevs are protected by RCU but the temperature event
> handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
> read-side critical section as reported by RCU lockdep:

How do I enable this? Just enable CONFIG_PROVE_RCU?
Of course I'd also need to exercise the code path...

> 
> 	=============================
> 	WARNING: suspicious RCU usage
> 	6.6.0-rc6 #7 Not tainted
> 	-----------------------------
> 	drivers/net/wireless/ath/ath11k/mac.c:638 suspicious rcu_dereference_check() usage!
> 
> 	other info that might help us debug this:
> 
> 	rcu_scheduler_active = 2, debug_locks = 1
> 	no locks held by swapper/0/0.
> 	...
> 	Call trace:
> 	...
> 	 lockdep_rcu_suspicious+0x16c/0x22c
> 	 ath11k_mac_get_ar_by_pdev_id+0x194/0x1b0 [ath11k]
> 	 ath11k_wmi_tlv_op_rx+0xa84/0x2c1c [ath11k]
> 	 ath11k_htc_rx_completion_handler+0x388/0x510 [ath11k]
> 
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
> 
> Fixes: a41d10348b01 ("ath11k: add thermal sensor device support")
> Cc: stable@vger.kernel.org      # 5.7
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
> index 23ad6825e5be..980ff588325d 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -8383,6 +8383,8 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
>   	ath11k_dbg(ab, ATH11K_DBG_WMI, "event pdev temperature ev temp %d pdev_id %d\n",
>   		   ev->temp, ev->pdev_id);
>   
> +	rcu_read_lock();
> +
>   	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
>   	if (!ar) {
>   		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev->pdev_id);

aren't you missing an unlock() in this error path?

perhaps have a goto cleanup that does both the unlock() and the kfree()?

> @@ -8392,6 +8394,8 @@ ath11k_wmi_pdev_temperature_event(struct ath11k_base *ab,
>   
>   	ath11k_thermal_event_temperature(ar, ev->temp);
>   
> +	rcu_read_unlock();
> +
>   	kfree(tb);
>   }
>   


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
