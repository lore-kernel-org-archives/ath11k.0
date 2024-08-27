Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CAAC54731
	for <ath11k@archiver.kernel.org>; Tue, 27 Aug 2024 18:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2b2DewcXT6KbuAgMJahq33ZA3zaeLm/CBIEw0g+cGE=; b=GDrxgxEKtDV/lU1WI6C5Tl8aTe
	f2KDLaL6aI0cS4cvNX7VD/c9XUiEdNTajvUlha9/Kv8QPjr7c9NL93wO8WoQ8mHq5blXBcvIe4WJW
	EpYNoz8gekvSl0Sb+gzeOwtImWv0WMrypf94f+/QDzH5IO0YLs+WY7ysY8i98dL3jvB32ZHaMFXLS
	jkTqMKjZAgwi17FOeG6lscokCEZXEHqyvXLf9GjUtcd7IBcmhvdGC7sB9XXqV7fcpOSj4R+A9tBIc
	rbX2ULoUv/QJoGvyrJO9kxV67S1It1z/cpj7UVZTugmtJlj2X0LQcsMVhtS/A6+8eWNzpOiFschJj
	IP763SwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj132-0000000CW2z-40TL;
	Tue, 27 Aug 2024 18:36:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj12w-0000000CW1j-3asb
	for ath11k@lists.infradead.org;
	Tue, 27 Aug 2024 18:36:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RHE68i023225;
	Tue, 27 Aug 2024 18:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2b2DewcXT6KbuAgMJahq33ZA3zaeLm/CBIEw0g+cGE=; b=fBCJXikb2MJbe4vT
	Z4KmMXSwb34xxIPsLE5Jm8LchOzLtcmFcs7b7zhambbEchYJ9hn+80rs9mkdi9Lm
	quS/96pYC2NlYYyNmjlXt/bFHDOpyltfx0zFD06bSufRPmuO/nq9QYwHH6m/7hQy
	JSjopGAI7zoBh1iCqcDMNMRORsQhzQi//VnCG7Ee6bQ4a9zx/O6q8vWavRwUa+ci
	fFAUVkkyaM1YiTpBGqBXuc005XkHxBZzyExc9yFDNrIcvMOv1PodTVMSnN3YL1/N
	ucInuT7Zj+tDdiagoMYcZnudRmzJleIwIYkfa0u67/T0KYL/U6pMazjPSnEZ0PZJ
	wEJ+7Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41798100pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 18:36:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RIa1De028252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 18:36:01 GMT
Received: from [10.111.180.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 11:36:00 -0700
Message-ID: <659cce3b-f92f-4d2d-bc9e-d2247addb0b4@quicinc.com>
Date: Tue, 27 Aug 2024 11:35:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Fix double free issue during SRNG deinit
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
References: <20240826053326.8878-1-quic_bpothuno@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240826053326.8878-1-quic_bpothuno@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ntuA0-O1BmUZa2K606GPTKO8cYb2gtBe
X-Proofpoint-ORIG-GUID: ntuA0-O1BmUZa2K606GPTKO8cYb2gtBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=822 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_113602_935766_95A8E2D6 
X-CRM114-Status: GOOD (  16.81  )
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

On 8/25/2024 10:33 PM, Balaji Pothunoori wrote:
> From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> Currently struct ath11k_hal::srng_config pointer is not assigned
> to NULL after freeing the memory in ath11k_hal_srng_deinit().
> This could lead to double free issue in a scenario where
> ath11k_hal_srng_deinit() is invoked back to back.
> 
> In the current code, although the chances are very low, the above
> said scenario could happen when hardware recovery has failed and
> then there is another FW assert where ath11k_hal_srng_deinit() is
> invoked once again as part of recovery.
> 
> Fix this by assigning the struct ath11k_hal::srng_config pointer
> to NULL after freeing the memory.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
> Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
> Resending the original patch as standalone patch:
> https://patchwork.kernel.org/project/linux-wireless/patch/20230417054145.12359-2-quic_mpubbise@quicinc.com/
> 
>  drivers/net/wireless/ath/ath11k/hal.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index f02599bd1c36..61f4b6dd5380 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1351,6 +1351,7 @@ void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>  	ath11k_hal_free_cont_rdp(ab);
>  	ath11k_hal_free_cont_wrp(ab);
>  	kfree(hal->srng_config);
> +	hal->srng_config = NULL;
>  }
>  EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>  
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


