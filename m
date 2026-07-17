Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE30C4450F
	for <ath11k@archiver.kernel.org>; Fri, 17 Jul 2026 03:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2XQqwVkMap4lirEXwZf+U9qWwV6X1eZsLJriPQiJ0o=; b=lOXYqpitLx/58w8QCGA53ssudq
	2vnqwjhdlAQqvO0uRkQx6sWJOowGQKmYMbpPh7jD7ccBDpOAJ4YPn81KFlnVKXfwBW55DHexGLuNa
	GsTpny8Ln+Ia9rOUvT+Kgk0AZ10+wqZjiSca+HtGwfX4noSWlCg8F1zJEt3uPEiSnkMFktkl/g6jQ
	cakCccknyJPwzyAc1YslTuTbiy+gWc0CcA/ZJQoUuLmQdzdmpLnjQmt7rkNtd2Nmv9CfvSucXnJtj
	hi18S2pVma+2P5KqkL2VoFmyzJki7oXu7rhFjXQZEJCRyqLsWOxlb6eZCi+YgDq6ZqgqkvbTq47Sr
	s7AiLSAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZYN-000000014KE-3YiB;
	Fri, 17 Jul 2026 03:47:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZYK-000000014JX-2RRA
	for ath11k@lists.infradead.org;
	Fri, 17 Jul 2026 03:47:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33tpR338240
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 03:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s2XQqwVkMap4lirEXwZf+U9qWwV6X1eZsLJriPQiJ0o=; b=djgK6yiPQtG5YWDJ
	7AZ1h1D/gAz7IT1hoYSv3cVabVEFky7nTtGAoJZhvdMAmcJmN1vUgRRDc60M8Ywv
	iEGtBByIFvXPhio1mib8ngDG+FZkEetl0gucZLcbX2aYAvgu7MAYaLeoNDMu271x
	hokmtYfnzKmQGIUpwoiEXGdeMXhN15xI5HYgc6ghFSweEHgVwGxBZ3g7s3rgQ5RR
	/vupyzijXc77xii9QMfsQ/VWONduAjtWb3fdqMg1anqsuT2d28eyLns0dbGYtfEf
	HM8+LkbpZcaNQWe1GUBhXs6RxFCFBvzExttTIJP0/ML6vMVxtHTNaEG9jLjwcWYV
	TbAIKQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1weaeh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 17 Jul 2026 03:47:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso1046083b3a.1
        for <ath11k@lists.infradead.org>; Thu, 16 Jul 2026 20:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784260075; x=1784864875; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2XQqwVkMap4lirEXwZf+U9qWwV6X1eZsLJriPQiJ0o=;
        b=XOKE0CPbh/pltT63RD78SRp6QJms8OgKS/IyS0zKZEJ5srTBAyxVdDontrrW0Uvyj3
         p7Acq3veohPAF6naK1F4CL19ZnfW+56bjmMj6yYK3fuAOU/Hc0eLEE1vER4XB9X235dv
         YH6bjF7r1gVitnpbo8qGalqgsAUAIjr5O9Db7Tn1hYl8BwFOtMmvK53IIHFd3TYH71WQ
         ba24TSWoDdFTmxa8IDrwxHUrsXCClFxTeDmppfK0+/v4f4cyjt4ZZpfbwgqg4k9nTP6a
         SstdONnN/Bqy4dTryr4viu2/aVLO/bjzWeGuJjiAA2ftKNnzsVRIp+XldphqqucGFJAA
         qP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260075; x=1784864875;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2XQqwVkMap4lirEXwZf+U9qWwV6X1eZsLJriPQiJ0o=;
        b=NvWVLYM3Ipn6LWoCbuPB/wDBGXGBkiVQjnwKQSJ4Z4bwDtbAQhtBdPpvDczjB/NRiO
         BdfLhKyYBKMd/srGxVLwVAh8jYZU36SesAYNLL31GOBLzuHl8P98qLTfIXuPCJPbit7W
         tbqPU5paQHBbcf7E1df2UpBRckBHzdpz5SctL3mhJnlJkzTBkygpYWr7zavLCGOXI2Bk
         woM0kbw+rb/yqndN3Tb42i4ummRLCH1PiL8o82n3Va9J20SWmrL69yP0zKs3gM60Fxwb
         OZ3PSE/wK8x6BuvhmaT8181QqtycVo2HiHyeN8FTnMJcvJtMceylZMNGdpqYLH2JChWR
         vMrw==
X-Forwarded-Encrypted: i=1; AHgh+RrQ447L16oQAYVY9VmBHOzUBl+NZdDXN3BecosrhOpUGOYRQBPpk+3CU3VziQiQ+eT+BTIzFC0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzN1AxuGsiahNvJdxcwBmy3w9ccBIZ1Z6hll6Kgj2AVO9yIhRvS
	FxJr+Ki4zAaB5bI+YjwIq7+RWOkssE6ip3b+LrxuzT30ABbYtmeD9UFQKWb8K7dDKmtr/qNSpMx
	fO9hxKLhLir/d/jMf4NgMu7DvW4oCeHLt/Q+vmKReqnoFYNwI2fHFgY14HO+5m62Y
X-Gm-Gg: AfdE7cm9Qcdt2AX1jVf7AwJhP7q/pyIOeHH4mZ8726fwBH95u6a+/SjxPBvY5yR8qPo
	a1YpPx1w4o9WAGUiHQyI1ZB8xa6BoSskoQyy3i1LuVnGrq4HqYm2JYXL+s8MFKiBrEX3SZBv1gJ
	xViDbzu8oa+oGwhPRLVUoJZnKEGD57w3guRVOZjoWjQejSQJD5nzzE1FH8ZBBKuMgyh3+ZCUt67
	MO4s20ksVhoiHyiCUf5SjbpKozTVh7KfWN2UHjSE5IbG8+lpUF12u6QV/H4fle0W7OcjrpZNGWc
	UJFIDTC4kr1pWS74rnfU3jnd5hIFcPcbk4jypDw/bl2BDpfctG+9Phqv2xX1l/3iMW5IXTGbun7
	R20UWSDvPtorgPjKpnuU1JZrs6FfUGibUkJ2kCnN/AsC7zsZnzfvO3cKspymkYWQ6eM4oYC94
X-Received: by 2002:a05:6a00:1915:b0:842:4982:82f with SMTP id d2e1a72fcca58-84c28544a68mr850976b3a.2.1784260075185;
        Thu, 16 Jul 2026 20:47:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1915:b0:842:4982:82f with SMTP id d2e1a72fcca58-84c28544a68mr850946b3a.2.1784260074506;
        Thu, 16 Jul 2026 20:47:54 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af331e0sm154512b3a.28.2026.07.16.20.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:47:53 -0700 (PDT)
Message-ID: <181b5ee0-f002-4f5e-93ff-49b6aa0a6e61@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:47:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <3c67115f-5aea-402a-987b-c3092e0c3386@oss.qualcomm.com>
 <20260716114611.2042584-1-zhaojinming@uniontech.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716114611.2042584-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX9+YjiSLHak5y
 cPZ7WCAf8bqy+tfrs3uP1iUwBIq63elZae2jeIqJwFCyq26mLNCMgVMgz0dLS6doFqPGZyO6HO6
 qHdswD+uunWtM3JsFXF9vIIt5X9DT8tKqtisNuOcl8sdPXhvC598ufjpTmhlUxmpHfCk8JdF8S2
 UNA0pJ+F0N4OzEnnsOJ404tW3lf6OnSxcKxKoAl/zt/LdC6Nbj+tcH6dsCxHD1Ybo3s+pz4WR2T
 CarAuOUWyJ770+eKiPIwnwnyfyienQwERGuswuMUQJwfxrU5I3/jvhP/1lCyCs0wQ2Ezehcy/Ck
 rNx2hqQpdj23edUAfgyhaFPhC1f+Q8spRgwADa6bLTcTMTECJgEJyWUqQiz2LvoBjYkre+dSyOf
 bUOCdvka2c1cuQOL9lngxRMMd+EwiGvC8ldmTGi9whJtBJQfsVpxRJxws8lwWfnqmie9PGM/p7U
 iXvmVs0k41qWFGkZI3Q==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a59a5ec cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=iHwBjlyiAAAA:8 a=EUspDBNiAAAA:8 a=jIKljzOPe1CI3Q5AW5wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfXzjGGT0LuIegE
 GRqORx5OgkpkZej6cu9nbhEJ4ORtyjvBnTBAhwY2oPBfDBQmQ6RzcRKZoR2F8L9W4ofhR5CUBkX
 KhiN2xDtQW9KtzQkoeVluO9BNqrudTk=
X-Proofpoint-ORIG-GUID: GTOJQ8F5UmCX_JC3ObchMVOM_DOElKUv
X-Proofpoint-GUID: GTOJQ8F5UmCX_JC3ObchMVOM_DOElKUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_204756_650812_BEDD4FC4 
X-CRM114-Status: GOOD (  33.67  )
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



On 7/16/2026 7:46 PM, ZhaoJinming wrote:
> In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
> returns the error immediately without freeing the CE IRQs that were
> successfully registered in previous loop iterations. The probe error
> path does not call ath11k_ahb_free_irq() either, so the previously
> registered CE IRQ handlers remain attached to the interrupt lines and
> are never released.
> 
> In ath11k_ahb_config_ext_irq(), when an external request_irq() fails,
> the error is only logged and the loop continues. The function then
> returns 0 indicating success, leaving the device in a partially
> configured state where some external IRQs are not registered. This
> causes enable_irq()/disable_irq()/free_irq() to be called on
> unregistered IRQs during runtime and remove/shutdown, triggering
> WARN_ON(!desc->action), and missing interrupt handlers lead to data
> loss.
> 
> Additionally, if alloc_netdev_dummy() fails for a later IRQ group, the
> function returns -ENOMEM without freeing the ext IRQs and napi_ndev
> that were successfully set up for earlier groups.
> 
> Fix all three issues: propagate the error up to the caller and unwind
> all successfully registered IRQs and allocated resources on failure.
> 
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
> ---
> 
> Changes in v3:
> - Extract ath11k_ahb_free_ext_irq_grp() to handle per-group ext IRQ
>   cleanup and refactor ath11k_ahb_free_ext_irq() to use it. Add a NULL
>   check for napi_ndev to avoid potential NULL pointer dereference since
>   free_netdev() does not guard against NULL input.
> - On request_irq() failure in ath11k_ahb_config_ext_irq(), immediately
>   clean up the current group via ath11k_ahb_free_ext_irq_grp() before
>   jumping to the error label to unwind earlier groups.
> - Move u32 num_irq declaration before the irq_grp assignment to follow
>   declaration-before-statement ordering.
> - Extract ath11k_ahb_free_ce_irqs() to handle partial/full CE IRQ cleanup
>   and refactor ath11k_ahb_free_irq() to use it, replacing the duplicated
>   err_ce_irq cleanup loop in ath11k_ahb_config_irq().
> 
> Changes in v2:
> - Move `irq_grp` declaration from for-loop body to function scope to fix
>   compile error in err_request_irq error path.
> - Set ret = -ENOMEM before goto err_request_irq on alloc_netdev_dummy()
>   failure to avoid returning uninitialized value.
> - When ath11k_ahb_config_ext_irq() fails, unwind the already-registered
>   CE IRQs via a shared err_ce_irq cleanup path to avoid leaking them.
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index f566d699d074..1a9408138d81 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -431,36 +431,47 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
>  	ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id;
>  }
>  
> -static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
> +static void ath11k_ahb_free_ext_irq_grp(struct ath11k_base *ab,
> +				      struct ath11k_ext_irq_grp *irq_grp)
>  {
> -	int i, j;
> +	int j;
>  
> -	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
> -		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
> +	for (j = 0; j < irq_grp->num_irq; j++)
> +		free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
>  
> -		for (j = 0; j < irq_grp->num_irq; j++)
> -			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
> +	if (!irq_grp->napi_ndev)
> +		return;


irq_grp->napi_ndev can not be NULL in exsiting code, hence this is not reachable. A silent
guard against a state that cannot happen has real downsides, regardless of what it's guarding:

- It documents a code path that doesn't exist. The next person to touch this will assume
the guarded condition is reachable and may build further logic on that false premise,
spreading a phantom case through the code.
- It discourages proving the invariant. The check silently substitutes for the reasoning
"can this actually occur here?" — the exact analysis a reader should do — which invites
less rigorous code over time.
- It hides bugs and delays them. If the invariant is ever broken by a future change, the
silent early return swallows it instead of failing where the root cause is. What should be
an immediate, on-the-spot failure becomes a displaced, delayed symptom that looks
unrelated to its cause and is far harder to debug. If a "can't happen" condition is
genuinely worth asserting, the right tool is a loud warning — never a quiet return that
masks it.

So I'd drop the guard.

>  
> -		netif_napi_del(&irq_grp->napi);
> -		free_netdev(irq_grp->napi_ndev);
> -	}
> +	netif_napi_del(&irq_grp->napi);
> +	free_netdev(irq_grp->napi_ndev);
>  }
>  
> -static void ath11k_ahb_free_irq(struct ath11k_base *ab)
> +static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
>  {
> -	int irq_idx;
>  	int i;
>  
> -	if (ab->hw_params.hybrid_bus_type)
> -		return ath11k_pcic_free_irq(ab);
> +	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++)
> +		ath11k_ahb_free_ext_irq_grp(ab, &ab->ext_irq_grp[i]);
> +}
>  
> -	for (i = 0; i < ab->hw_params.ce_count; i++) {
> +static void ath11k_ahb_free_ce_irqs(struct ath11k_base *ab, int max_idx)
> +{
> +	int irq_idx, i;
> +
> +	for (i = 0; i < max_idx; i++) {
>  		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
>  			continue;
>  		irq_idx = ATH11K_IRQ_CE0_OFFSET + i;
>  		free_irq(ab->irq_num[irq_idx], &ab->ce.ce_pipe[i]);
>  	}
> +}
> +
> +static void ath11k_ahb_free_irq(struct ath11k_base *ab)
> +{
> +	if (ab->hw_params.hybrid_bus_type)
> +		return ath11k_pcic_free_irq(ab);
>  
> +	ath11k_ahb_free_ce_irqs(ab, ab->hw_params.ce_count);
>  	ath11k_ahb_free_ext_irq(ab);
>  }
>  
> @@ -524,20 +535,25 @@ static irqreturn_t ath11k_ahb_ext_interrupt_handler(int irq, void *arg)
>  static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>  {
>  	struct ath11k_hw_params *hw = &ab->hw_params;
> +	struct ath11k_ext_irq_grp *irq_grp;
>  	int i, j;
>  	int irq;
>  	int ret;
>  
>  	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
> -		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
>  		u32 num_irq = 0;
>  
> +		irq_grp = &ab->ext_irq_grp[i];
> +
>  		irq_grp->ab = ab;
>  		irq_grp->grp_id = i;
>  
>  		irq_grp->napi_ndev = alloc_netdev_dummy(0);
> -		if (!irq_grp->napi_ndev)
> -			return -ENOMEM;
> +		if (!irq_grp->napi_ndev) {
> +			ret = -ENOMEM;
> +			irq_grp->num_irq = 0;
> +			goto err_request_irq;
> +		}
>  
>  		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>  			       ath11k_ahb_ext_grp_napi_poll);
> @@ -585,9 +601,7 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>  				}
>  			}
>  		}
> -		irq_grp->num_irq = num_irq;
> -
> -		for (j = 0; j < irq_grp->num_irq; j++) {
> +		for (j = 0; j < num_irq; j++) {
>  			int irq_idx = irq_grp->irqs[j];
>  
>  			irq = platform_get_irq_byname(ab->pdev,
> @@ -600,11 +614,23 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>  			if (ret) {
>  				ath11k_err(ab, "failed request_irq for %d\n",
>  					   irq);
> +				irq_grp->num_irq = j;
> +				ath11k_ahb_free_ext_irq_grp(ab, irq_grp);
> +				goto err_request_irq;
>  			}
>  		}
> +
> +		irq_grp->num_irq = num_irq;
>  	}
>  
>  	return 0;
> +
> +err_request_irq:
> +	for (i--; i >= 0; i--) {
> +		irq_grp = &ab->ext_irq_grp[i];
> +		ath11k_ahb_free_ext_irq_grp(ab, irq_grp);
> +	}
> +	return ret;
>  }
>  
>  static int ath11k_ahb_config_irq(struct ath11k_base *ab)
> @@ -629,16 +655,24 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
>  		ret = request_irq(irq, ath11k_ahb_ce_interrupt_handler,
>  				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
>  				  ce_pipe);
> -		if (ret)
> +		if (ret) {
> +			ath11k_err(ab, "failed request_irq for %d\n", irq);
> +			ath11k_ahb_free_ce_irqs(ab, i);
>  			return ret;
> +		}
>  
>  		ab->irq_num[irq_idx] = irq;
>  	}
>  
>  	/* Configure external interrupts */
>  	ret = ath11k_ahb_config_ext_irq(ab);
> +	if (ret) {
> +		ath11k_err(ab, "failed to configure ext irq: %d\n", ret);
> +		ath11k_ahb_free_ce_irqs(ab, ab->hw_params.ce_count);
> +		return ret;
> +	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int ath11k_ahb_map_service_to_pipe(struct ath11k_base *ab, u16 service_id,

others look good to me. Hence with the sanity guard removed:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


