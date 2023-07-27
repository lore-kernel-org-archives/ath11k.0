Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A9DC0015E
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIXWf5pqXBN4pF1PRnn21PP8pjeWDY4mHWRhXrTAbS8=; b=LkCrLkxKXLBooo
	2cKNW1hiSJd4pRIit+v133oAl8PHuWa2ZLdtQeztWrdeJUq7PihEJLuilB+9Z0/Y/0PNzNuN8iUP/
	Lg+aEQ19XMoBptUOHrveVRkjCk/C/O6+9sWrETyRzyWsOZ9ffDeBW2jIPYtnLsC7cjlRLPAbzPFjo
	qu0gsCW9tmS7TZb4hC0ZXDs3gTYmMWjik+UodmzV2GlUu5Ll70dhGGYOaFJjdyE3JUwaKHhSijIfl
	ZHuKlidX12w1IAyeTIdHQoKUVLCnDfR50gfKSBBVLHL26zFJUbp+klApqacQxmdq+qMKFiqJEkCGj
	sgDnCyg/tfJKKk8f//aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5El-0000lM-2k;
	Thu, 27 Jul 2023 17:57:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5Eb-0000WF-0E
	for ath11k@bombadil.infradead.org;
	Thu, 27 Jul 2023 17:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WB28qqUYvyseSWD/r/j4+D+ItZWixPmzGHBsazWIPyA=; b=FakDhjToeFYMFrQZvFYS1mmQoe
	wTwxzPHzhzzypUFaHEAcRtD/fZ7eNtpLiANB9joHgf2R8U5yQLAoSFrzSPtStLpOB0dzqduD5yGD9
	5H1EvVuzg1pfCVITh6zOkdn6YrBTOEGJCHiDb/QXym6V6UTmkmYCvdHXHlCYWy7ZPcVXiDTgMb2F9
	6lIXhNcZXwYzubtvSF3fyJOuLyECK3IGnoX8hzwc794+TIwdqzwJvYK9N+yFQZ/ap/K+QOBVs14j1
	uZPjpWQHymfZkz+MrmDGQc61wZD6Ym+0p1vCrIn+u1OhQNgQMXWFQSs92oxUF3d0n2JoY10DDIUi9
	c8cRGC5Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP49G-007B0x-0b
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 16:47:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36RDkJRP008071;
	Thu, 27 Jul 2023 16:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WB28qqUYvyseSWD/r/j4+D+ItZWixPmzGHBsazWIPyA=;
 b=IUW7GFZVOiHOHNTTb6IvgWd/OEryD+D1NLucbHlhwhk7OECar+an4Zu9Nmk92uqTultZ
 u52jjWkv9rNJDRtd9QVtArx4OEMDTSDwuW/0M2Jm7XXD43zS9H9BQoh/a6iidXpam1Ga
 /8qEIYjNoBxt8wzE80LwrD1T0XfSjaYK4sU0sVFsoFIzEizIY7YuwAFVtGmHonc0t0Bd
 N4DYN/Vzx9TaTJ21LqsxJpJrqrm0vCOvU5+35VXXdpwrdR+m8Lv9QbM8y6hYB8TP0pSV
 Q64iGuiroOSTPRBdobWyyf46ETvGLjnEuKWr0x/LWMPxRM+UivsHBvQ2dBbk4C/SGWCW 6Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3krn9eth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 16:47:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36RGlMqN022812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 16:47:23 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 09:47:21 -0700
Message-ID: <d86d8f47-dbb2-1da6-794a-c020c317b4b5@quicinc.com>
Date: Thu, 27 Jul 2023 09:47:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230727100430.3603551-1-kvalo@kernel.org>
 <20230727100430.3603551-3-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230727100430.3603551-3-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JoQrgzWxSJuMopEaBaBWAcPav_TeIEeU
X-Proofpoint-GUID: JoQrgzWxSJuMopEaBaBWAcPav_TeIEeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 adultscore=0 suspectscore=0 mlxlogscore=921 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_174734_860086_DBED5108 
X-CRM114-Status: GOOD (  29.91  )
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

On 7/27/2023 3:04 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Simple refactoring to make it easier to add firmware-2.bin support in the
> following patch.
> 
> Earlier ath11k_qmi_m3_load() supported changing m3.bin contents while ath11k is
> running. But that's not going to actually work, m3.bin is supposed to the be

nit: s/to the be/to be the/

> same during the lifetime of ath11k, for example we don't support changing the
> firmware capabilities on the fly. Due to this ath11k requests m3.bin firmware
> file first and only then checks m3_mem->vaddr, so we are basically requesting
> the firmware file even if it's not needed. Reverse the code so that m3_mem
> buffer is checked first, and only if it doesn't exist, then m3.bin is requested
> from user space.
> 
> Checking for m3_mem->size is redundant when m3_mem->vaddr is NULL, we would
> not be able to use the buffer in that case. So remove the check for size.
> 
> Simplify the exit handling and use 'goto out'.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath11k/qmi.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index d4eaf7d2ba84..9b13628fa3c7 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -2506,6 +2506,10 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
>   	char path[100];
>   	int ret;
>   
> +	if (m3_mem->vaddr)
> +		/* m3 firmware buffer is already available in the DMA buffer */
> +		return 0;
> +
>   	fw = ath11k_core_firmware_request(ab, ATH11K_M3_FILE);
>   	if (IS_ERR(fw)) {
>   		ret = PTR_ERR(fw);
> @@ -2515,25 +2519,25 @@ static int ath11k_qmi_m3_load(struct ath11k_base *ab)
>   		return ret;
>   	}
>   
> -	if (m3_mem->vaddr || m3_mem->size)
> -		goto skip_m3_alloc;
> -
>   	m3_mem->vaddr = dma_alloc_coherent(ab->dev,
>   					   fw->size, &m3_mem->paddr,
>   					   GFP_KERNEL);
>   	if (!m3_mem->vaddr) {
>   		ath11k_err(ab, "failed to allocate memory for M3 with size %zu\n",
>   			   fw->size);
> -		release_firmware(fw);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto out;
>   	}
>   
> -skip_m3_alloc:
>   	memcpy(m3_mem->vaddr, fw->data, fw->size);
>   	m3_mem->size = fw->size;
> +
> +	ret = 0;
> +
> +out:
>   	release_firmware(fw);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static void ath11k_qmi_m3_free(struct ath11k_base *ab)


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
