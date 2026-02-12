Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF288EE368C
	for <ath11k@archiver.kernel.org>; Thu, 12 Feb 2026 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Td8TkWhaFGm2U4+qFTUwHeU05QZK/KaVCrS+oH4rQ4Y=; b=2KjHHSM+kyfhXN7o4JVfKUUjQZ
	9/GNhu+QINPV3F+yJhMMjV+e2TA1yGhJvopxGCvIABMdwwgae0e3sPqzDl7ESpndSQVE95l5mxlWH
	90AWj0lGHoO/IxHj4i1kLuXgQBKvvi2FyNbIC/EEgc5XRpbttGFMOWXJFVfwupe9H7+DTEkBIc9go
	8voEF2av6tBFaK0OytpNJccU2p5UyoOlAbb5yralPIYKvPw1G91Ls6H59YG8nx6UkWCtY8NQlfjWd
	czdEd+2tMttKRaeRFV+BcpbJ9nn/hDeSvYCOk+t74Le0H30YfgPFDitqsiC1c7wfM//wqa8iHPQFW
	XFUoQs+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYCE-00000002EkC-1vS1;
	Thu, 12 Feb 2026 15:01:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYCC-00000002Ejc-1ryu
	for ath11k@lists.infradead.org;
	Thu, 12 Feb 2026 15:01:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRkrf588823
	for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 15:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td8TkWhaFGm2U4+qFTUwHeU05QZK/KaVCrS+oH4rQ4Y=; b=YVH+lzwCwaaTjQUD
	pgCzHVxmFw0NmNAqwG5GeoX5m3rr0pvjBdYdxZia4OXbTQFTOX1dMiOIhW3JUxYt
	uAP/F7shw6cHXBEqVuz9XLlq/FPTbNGJzoxGiw4o0u+NXkf0jnzU9kqJTuqbDTZh
	DrRv7HmOhsY9wuIYZORwy7XbMEaLSIWQB4H+6HA1o8VK939EAgttKlkvNC9W8Dca
	TgpRHmHmzYln7VoqA9oW+SOdJrr/l6/IZhdvPcXM98QFJSiWvFx+qHY4ifFPNr2S
	WdPkatyhMLP92Fv9Slx5A2f+9gMP37yx/i0eBeqfVFqxnf9TGrhOYsGHxCRYhtER
	DLI9MQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snjmph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 15:01:31 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d18998e3b6so4295219a34.0
        for <ath11k@lists.infradead.org>; Thu, 12 Feb 2026 07:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770908490; x=1771513290; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Td8TkWhaFGm2U4+qFTUwHeU05QZK/KaVCrS+oH4rQ4Y=;
        b=GsWfI2mwKAf5zYO0GLxRNa7orRnzZ7oDIK2WTeR1U4aKx41NThPQb423ts1tkb9Jdn
         QUsBPsb5yZ7aeG+87dC7cPgixzy+xFb6OMmURFtggjqb7bYf0mi5wOVvZxVl7RLLTlmd
         Asr/u+F20RyM5R1RcCefPkX8az5D6AuKtykRc5CPf6E/3kHbtO0mnmN6aYTxlyHSt2wQ
         o4FxyEXG4skzCaiiySQY1HQpkyt2Gbr/GAod1c7Jh2qKzAkVqEcOYdKNdSrWR+9nrYY9
         jY8yfrH6q7d3ZpbajPu6/toe0GeoI/ZIWDo2LT3cJW2i5oRSOmbi9S9YpuBH/LQ/u1iZ
         CqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908490; x=1771513290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td8TkWhaFGm2U4+qFTUwHeU05QZK/KaVCrS+oH4rQ4Y=;
        b=pg2wRaTQHuneM1I410R2YFrFf0fbX+ZKmEsAlV/IWn4PSaGVem/MHqByOGrDMb0Zip
         f1Vzvs78Z80xgUoDvicM0bKjxIKNXDpErda5BLGrD6ENWId3+2WkPgZYbizjaCTG6El0
         QUMY2jKfdJGP7XlJcPhF3E8GhFC950xkPxR2u0r0Qa/Yf7nhTIcKN3wqJgyvggetLPqh
         CMUjq6bq1Ma+aYtR+bkuuVgIf02gM3CaK/NHJ6jbSRVbBYSN/1Z85udilwf0ok/yXfMw
         2q2NqLNGJzCcFzZy4n7OexYFhGvkPE/OID0nJX1QCKcO7oOR6Hx54++YesLj8wuygitj
         nKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX4YfVwoTe5sVd7LpzvKHH+DUSVo22NJvbkIOgAvdBwwZe8i7eTr7hUWZdzhHb4TuZmCaVfyI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuHM3N8Po2WYIzaWXO68CU8SYNdM5zDG7ivwFvL2UmXz/JidiS
	0VZkF9NEYp1xLu+QMaQmOvrJbHYOikbI1mYXLh7Hw8/Nrrdgdu5ZiYSpwQ6fIuvlmNslqedP3/L
	Jaqv+yyIlwkLoVILad3S6S8SWk9psXh4mvxCB0sigeKemLm9cA4R7wLYX1YI6ckVP
X-Gm-Gg: AZuq6aLv9f4CMpPELkb1PkaP5duF/x2j5mWsG9k8K8uXm/s8Dh1TGFuQP/yjGqqNI+P
	TvMFbjzcRFl0WW9DD1GKBtKuuaMDGYcctLm+XwOGjpCp2CC81O9D1om4GNWuVTp2WlgWCYUGxtN
	3L0vBbghElvkc7/nYtTbe8IU0npkQSIuhu8XkstXDraFQ13YzVhStAdlZ18RvKM/mC9N+A7TRT/
	Gs9XSBFsMZCZS6MwB0NeWTgugk/IQN9HY23MF5EQgNifevMxIbsVRDEEpx/CvnLsrBQ+2HhPsd+
	h81vgq3votQUo6O9PHnX3AXFFNLfKZQB1jNxu918rDefgHoAlVO0UJ71QoiI3391vjpPe9l9IpO
	JS9cvECwJDY3MHNtUBWEdKdMsm4FD92KroC7DTV2bnYO80/k=
X-Received: by 2002:a05:6830:2b25:b0:7cf:d0f6:a1eb with SMTP id 46e09a7af769-7d4b29884b4mr1211341a34.1.1770908485944;
        Thu, 12 Feb 2026 07:01:25 -0800 (PST)
X-Received: by 2002:a05:6830:2b25:b0:7cf:d0f6:a1eb with SMTP id 46e09a7af769-7d4b29884b4mr1211260a34.1.1770908485219;
        Thu, 12 Feb 2026 07:01:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cec9e7asm1834360a12.12.2026.02.12.07.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:01:23 -0800 (PST)
Message-ID: <f028462c-ae31-4fa5-b414-e03d3a73fdf4@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 16:01:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExNSBTYWx0ZWRfXwkbtP2ZQGE4J
 /NRTYpS3hhMg/hpgExPkjrEKW1sVE6hhA1ofjcTVquI31TFJreoFQdqrfLfWx6V0Pk5SGkQ/ofj
 CBNzLf7F5v1+ADW4dlp3KSJ8IcOQ85MZcDyLFwHSR8J8dF4VdpzUHUb2kVzUeYTtojx//bKjhSX
 Dw+m2plt/Ea99pXGOXja/CGzGtuPpvNBoI+5auxZsYGXky4ttZ0nzWtc9KXYAJXl2uGqQntLP9G
 938BypXZNwKul5au6KeyBiw8KpqXTN2dXXiIuzgwNktKnGp+jFbmEAvvlTdNfUvYLulUbCyYXzp
 IUCIWUJUM/KIvlSEH+XylTCPKM6NMbgs4er3WZQRzyA5Oot+9uNCZl/Lj/wbNidAJQbEuZMAw9p
 nbiV//evwEoJ427yBzxO0iZZxz6z89AMcOH+Xx0py0RvZ7NnKCqXEfQsXixUJe8PaE7dTWk5Nyy
 qB6oSYjndhjr4cZScWQ==
X-Proofpoint-ORIG-GUID: VeXoI6-tTobHJfqWnKryWSaT6b3slFt6
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698deb4b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=IsMmzSx_pjv120c435IA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: VeXoI6-tTobHJfqWnKryWSaT6b3slFt6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_070132_499538_A0596BB2 
X-CRM114-Status: GOOD (  20.83  )
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

On 2/12/26 3:52 PM, Bjorn Andersson wrote:
> Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
> ath11k_err() is used to tell the user about the (presumably) temporary
> failure.
> 
> Reduce the log spam by removing the duplicate print and switching to
> dev_err_probe(), in line with how ath12k handles this error.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
>  	}
>  
>  	prproc = rproc_get_by_phandle(rproc_phandle);
> -	if (!prproc) {
> -		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
> -		return -EPROBE_DEFER;
> -	}
> +	if (!prproc)
> +		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");

I'd like to think this doesn't really change the behavior, but I'd rather
see this that in-house print functions..


>  	ab_ahb->tgt_rproc = prproc;
>  
>  	return 0;
> @@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
>  	ath11k_ahb_init_qmi_ce_config(ab);
>  
>  	ret = ath11k_core_get_rproc(ab);
> -	if (ret) {
> -		ath11k_err(ab, "failed to get rproc: %d\n", ret);
> +	if (ret)
>  		goto err_ce_free;
> -	}

If the rproc handle is unavailable at this point, we undo quite a bit of work
in .probe.. would it make sense to move this check way above?

Konrad

