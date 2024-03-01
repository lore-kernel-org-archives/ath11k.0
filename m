Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FDBC5478C
	for <ath11k@archiver.kernel.org>; Fri,  1 Mar 2024 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9oSbjYVwwJViyUns6YHVbiAEOcSyvonOUoUVWmngIM=; b=cPVRU9UUOAKiY5kZjEsq1pZvdJ
	ndraZS3yAic8zNESoVLBkbfqNfa6ZrZdDZGJPOu9iwwuPjgKjk47i3Y7dwcROj2BbOjD8Ui0OYE3e
	6EepDTZuT6KWfT+1qf69UmoY2YB3lbovtR1wWOtiQ7029CUhMbFviDgWx5HjIVhamnl8RgkeuZoZs
	UU3C/7HjOZt485zSvp3QU2HfaXE8jkceyX5GnGaNkCjeI1uCsgGllVd5E3eHMwwheyzo6OxhxiuvI
	3XH29hGi6yFMaTWqmVUznRQelKQu8MpaSRYRrVWWeR94cD7SDKS4lV19WDpPo4WTaf8Rjpoc/w7JM
	jlqVNJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5Yh-000000013FJ-3mUF;
	Fri, 01 Mar 2024 16:16:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5Yf-000000013Ei-1wCz
	for ath11k@lists.infradead.org;
	Fri, 01 Mar 2024 16:16:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 421B1LP3023563;
	Fri, 1 Mar 2024 16:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=P9oSbjYVwwJViyUns6YHVbiAEOcSyvonOUoUVWmngIM=; b=bG
	5ygqzjSrP3tQctJO7k8jkDe/SqI7BGpb7WxC3jv5dLahF1+RR6UPuK6u/nS3E0t5
	3n71gKIOjfvMvSAJupo3VXM0b4oXBeGA0s9vBJu0I7mLzTPL3SmqFM/5oge1CxBF
	aKpKBPRYbomP95MIbUG+6YNDQS0jPTu4i9ux//rNmOD6xUgqqMksumWGqSklYXEE
	xHb4CH1ogq1jTJs+Og4JkeYfqcTLiIKJTrwQAw4D0BwsI16xSO7rdzN1/LxjpRWR
	L06nDaXuxgG7KA0n53DJMaIrEcES+tcw7KGML5GkihwbvpNoovUYIXnkhBJvKvvy
	mP0URZ2X5raYPFyrmVdw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk9mf1cvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 16:16:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421GGHa7015847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Mar 2024 16:16:17 GMT
Received: from [10.110.42.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 08:16:17 -0800
Message-ID: <6bdcffce-e657-4990-bd60-5dd67abbb9c9@quicinc.com>
Date: Fri, 1 Mar 2024 08:16:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: adjust a comment to reflect reality
Content-Language: en-US
To: Kevin Lo <kevlo@kevlo.org>, <ath11k@lists.infradead.org>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
References: <Zd1Muyd8mtA1Hih7@ns.kevlo.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <Zd1Muyd8mtA1Hih7@ns.kevlo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H6N7GW0bgFRtuYB6wISkgmCb7NRoJ7Et
X-Proofpoint-GUID: H6N7GW0bgFRtuYB6wISkgmCb7NRoJ7Et
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_17,2024-03-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=896 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403010135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_081625_676875_61360A10 
X-CRM114-Status: GOOD (  12.19  )
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

On 2/26/2024 6:45 PM, Kevin Lo wrote:
> In ath11k_mhi_set_mhictrl_reset(), I observed on QCA6390/QCN9074/WCN6855,
> MHISTATUS has SYSERR bit always been set after SOC_GLOBAL_RESET.
> 
> Signed-off-by: Kevin Lo <kevlo@kevlo.org>
> ---
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index 3de7fa6f88d0..1198e80d9dff 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -158,8 +158,8 @@ void ath11k_mhi_set_mhictrl_reset(struct ath11k_base *ab)
>  
>  	ath11k_dbg(ab, ATH11K_DBG_PCI, "mhistatus 0x%x\n", val);
>  
> -	/* Observed on QCA6390 that after SOC_GLOBAL_RESET, MHISTATUS
> -	 * has SYSERR bit set and thus need to set MHICTRL_RESET
> +	/* After SOC_GLOBAL_RESET, MHISTATUS has SYSERR bit
> +	 * always been set and thus need to set MHICTRL_RESET
>  	 * to clear SYSERR.
>  	 */
>  	ath11k_pcic_write32(ab, MHICTRL, MHICTRL_RESET_MASK);

Unless you've verified this is always true for every supported chipset
I'd rather more accurately say something like:
After SOC_GLOBAL_RESET, MHISTATUS may still have SYSERR bit set and thus...

