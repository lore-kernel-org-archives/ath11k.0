Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D93C4450A
	for <ath11k@archiver.kernel.org>; Wed, 15 Jul 2026 03:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59dtjn3uigWcqD04FKFVloeTaBJk83JWYja0Nk1JPpA=; b=pkenysGvl+BZWNQuOki2Mtx1zs
	pxL5ozRw5EjJjcSRxlPG8wJVjRFwUrp5oXzMuTgeoYqb2IuaXRdjvBVWtrC2xWoJCvOxN5DGEmOJz
	IQBXMP17AqX5/plvf6SGwKUYNFQ7Hc6tybjlu53C1LR8dEYKJMttdPTGScmuZI8brSz1EoVH6aoHG
	cMjpi9rZbVDOBH1W5SkaBd8gDaHUl1bGvXdebGR0n/4iUiLamM6QMXbrMvA7TLO1wZXaWaNMj0vKU
	UhwwNs78yOPqXH8hK0DAMi4Jdg56uIO5WdoOO95MHu4ocC8oXZo1w/ZX+uwFZ1m/pdTyxQCo0OQ1R
	9+4Czgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjq6K-0000000DfkM-3Xuq;
	Wed, 15 Jul 2026 03:16:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjq6I-0000000Dfjq-1A8h
	for ath11k@lists.infradead.org;
	Wed, 15 Jul 2026 03:15:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IYZT2143875
	for <ath11k@lists.infradead.org>; Wed, 15 Jul 2026 03:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59dtjn3uigWcqD04FKFVloeTaBJk83JWYja0Nk1JPpA=; b=Y97+WZNoYirbt+yU
	Dmgjh2qwKrggfixGQGRCQckh72F2BOR2Vi4k1BOBouCPewvPKol8pC9w4/VRnn0a
	MW5WCUFtcat8PwimEgRCLW1HstzdZBFPlSO7CsJ/gGGLggpxMGbsw4Q2qxuu0dMs
	6SB5QDKI1O4qNscZuEBIXwq7E0X71GlKOia3G7ukIXKyAJI+ZczCVjZO5oh/bogf
	/L/VTfEKteCs4eMZUnhy/yJVURbGhRWl9mlKv/R4Rp3/K1jNCwlQp0A+dAcrUFys
	xw7gF5IMk+Bq6qAFsXM/E5UE6S6cXY3uW14zNkDhrZEwI8T68OIz9Az36v8yc8bZ
	I+5SiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq31kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 15 Jul 2026 03:15:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so292367a91.1
        for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 20:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784085356; x=1784690156; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=59dtjn3uigWcqD04FKFVloeTaBJk83JWYja0Nk1JPpA=;
        b=cGRz6mr6Mz2qJ4Ei67Zh/T7tRXA77t23ttGcL/7lwH8v5irPDl8bxm16r2B2O9tMQP
         nIfZLjT1z3x3WVxrmlO/R4lWKXL+UexCowtXOG9osJQJH60lezLqkWCDPBkHYrbK9sPL
         H3upyizzkCOir0bWluQch9Wl0cxJWsavhdxEIaZp2mmenWf3PeYWPjSyGQlFwiJE/9qa
         A1vqrR4j2QUnVDYg0ApjkO6Z5eMcydhBNgo13y4eXZs119ksbwO4fzy1ROzQws2oduDg
         AvNgZkt0uI+3l12jj+Ri/6IXcz/ETxqmB26O1kfE5eUQiZdYbkbxkaJrMutJ/tRnk0WS
         +7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784085356; x=1784690156;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59dtjn3uigWcqD04FKFVloeTaBJk83JWYja0Nk1JPpA=;
        b=Wl+ifr5j+9qP9H9Env0S3tSFqFJwonasDaeERZOa22sk3nsg8al4UpKbTia8nzKM8h
         FzctW2tcqlnuZMHLLazhEHO+2HsRMs5CE6fhuhTsQqbyc9wLrk6UpPub0/+wK0LO1kZ9
         8eZcDv/iVIPVpiaASQdFuj42DA5MyGB6lOdmK1kux+EANCI7fyIw1vN2v9V9nZBaMINr
         qmevCSH73MZl4zw4RoCBSknVmvWFOZdbec1J+YPW/HMqa8qSPpMr33tqz8YaiYjk5mwP
         tKSMAlO+TdH+u97bAduTyl8ETu7s8mVes0TDbncEy4z8h4AY/HwjqMpM1k7lfA1g8zFO
         NGkw==
X-Forwarded-Encrypted: i=1; AHgh+RpHxOmBPwo+E5S02+rZpM8ClrgGWRGzgG3AtPak3nuBh9M4VAHDIzdgEKXVCrlewJEGrEQYLlg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbsq0cnb2/BDvEumgyA0vH/ngV5gwEA2rVDy3RElSjOOcJf8wO
	SnHnjVwVB6O1pIVA5BVg1jOFnBoBtGKdHNhRF5WBoNe0Y14pZ9v8EPvhjggDoZm0gzWKgy3/sMm
	rRtVqwJqCSBb/CUTNkLlHNGvS9C/2cnjg/9HzYyDmvY+P3tV8UHdZb83A2JgsHum3
X-Gm-Gg: AfdE7ck4HZnbDOK2UoZGkzMwTGxX0icA0B1iU8ZTplORaEi2q/fVlKqb0RVWH7B1Qjg
	1WZP14AJmDnSl4cL7uA+S/q8I6QUEkImEvpdOqDZ2kyg21O1s2vKToBT4JOydTGs75ilIYwfbbU
	1gYn51dYgVNV5zjl6y7PSCDIjGVy3dkFsIiy1o5q4Dx/e1p5rC9ckQ8/j1KznK6+M+Adkpq6bw5
	m1St4wkaG+nYj+x92JsBC/OjQRTjnOa3PAxp8aDK8dd1cLfXEGrpcUl5TXsHEol23pI82t2Jf2T
	N9gNXPNS1ZGZkfC+/ZTHqEzHjPL4bKzKJCu+Q6uEV8NTCEqaI2M1jNnfgc/J9sut5Bfys00yBMo
	A7fCr3nz76Ski7dn5/8Afzlz0SR4m+Hbhy05KXzB86/6Lvll1a1FCh+bPe9/4CF5GTKNhCeXgkj
	pSs5Y66s4=
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr11421807a91.9.1784085355771;
        Tue, 14 Jul 2026 20:15:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr11421788a91.9.1784085355202;
        Tue, 14 Jul 2026 20:15:55 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a86esm2287488a91.16.2026.07.14.20.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 20:15:54 -0700 (PDT)
Message-ID: <3c67115f-5aea-402a-987b-c3092e0c3386@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:15:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <e94de910-0a15-4b82-b006-03da98305e9b@oss.qualcomm.com>
 <20260713105912.20095-1-zhaojinming@uniontech.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713105912.20095-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a56fb6c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=iHwBjlyiAAAA:8 a=EOvvyNets2oEhnj6SMYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-GUID: JaWm9pwkMk92XngGGR2_biPr4cm9d8L4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyOCBTYWx0ZWRfX4TOUCci+ijsj
 EUHmf+p4/sQ+l/dRrnXKKNijyc9YSlgFHXuFKhHzuWIcdNxtMxKzPmSzBXnLgPHZzQDJbuFDF9H
 Cm7XJCXa5kOZr+hYWDbl4SRg6Bq0pGl6jSFZCAI3/LEK3aV8Vs42Gs2j7bWZVMX7jNUPFuyeM86
 GratqBXOemwQ/+wUulWA3/mP40stvyplq/eny7r9HKncNzN83e2qHeGAkTzsCufsN16uqsnBUnP
 QwDHP7PoDvp9wNwQzeKJSm5pOemjgwr0gnGlCDKc0bEO2zYqCZ035/2W0Iv+eP1nG5wZaNat1Bz
 n0vIJSMyhATVTf3YXrPAU7lhck0Ft1Oh9Ygoj58+qcB8odOpvD1Wtjsuq4V2wdzfgUAHvFh4SY/
 aangvsLUhjGeahwk9wrKjslMfTJcVwHNZqOlMHkj/nJQ6lhQSfy8PHl3Jg2DB4qVCZzieYDYTqn
 No+H1VgLdCfJxRKaGlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyOCBTYWx0ZWRfX2GSnjtQi/MBd
 nviCkXCm7GlOT/LyHdoL0Haxafnfc+0earhis9o7H3JUOzyZdiTNXgLxzz6A85hoWXOcR8quG1c
 hQHiYC8uUohABTJfgtS4wq2JrX4IUY4=
X-Proofpoint-ORIG-GUID: JaWm9pwkMk92XngGGR2_biPr4cm9d8L4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_201558_387194_26E1272F 
X-CRM114-Status: GOOD (  34.26  )
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



On 7/13/2026 6:59 PM, ZhaoJinming wrote:
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
> Changes in v2:
> - Move `irq_grp` declaration from for-loop body to function scope to fix
>   compile error in err_request_irq error path.
> - Set ret = -ENOMEM before goto err_request_irq on alloc_netdev_dummy()
>   failure to avoid returning uninitialized value.
> - When ath11k_ahb_config_ext_irq() fails, unwind the already-registered
>   CE IRQs via a shared err_ce_irq cleanup path to avoid leaking them.
> 
>  drivers/net/wireless/ath/ath11k/ahb.c | 48 ++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index f566d699d074..11bafbd94aff 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -524,20 +524,24 @@ static irqreturn_t ath11k_ahb_ext_interrupt_handler(int irq, void *arg)
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
> +		irq_grp = &ab->ext_irq_grp[i];
>  		u32 num_irq = 0;

declaration after statement. better to have num_irq declaration at the beginning of the
for loop.

>  
>  		irq_grp->ab = ab;
>  		irq_grp->grp_id = i;
>  
>  		irq_grp->napi_ndev = alloc_netdev_dummy(0);
> -		if (!irq_grp->napi_ndev)
> -			return -ENOMEM;
> +		if (!irq_grp->napi_ndev) {
> +			ret = -ENOMEM;
> +			irq_grp->num_irq = 0;

the ath12k_base is allocated by kzalloc, so the ext_irq_grp array, as a member of
ath12k_base, is already zero'ed, hence this re-initialization is redundant. But I am OK
with it since it improves code readability.

> +			goto err_request_irq;
> +		}
>  
>  		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>  			       ath11k_ahb_ext_grp_napi_poll);
> @@ -600,11 +604,25 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>  			if (ret) {
>  				ath11k_err(ab, "failed request_irq for %d\n",
>  					   irq);
> +				irq_grp->num_irq = j;

with this forcing to the number of successful irq request ...

> +				goto err_request_irq;
>  			}
>  		}
>  	}
>  
>  	return 0;
> +
> +err_request_irq:
> +	for ( ; i >= 0; i--) {

then with the index starting from the failed loop ...

> +		irq_grp = &ab->ext_irq_grp[i];
> +		for (j = irq_grp->num_irq - 1; j >= 0; j--)
> +			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
> +		if (irq_grp->napi_ndev) {

and with the guard ...

> +			netif_napi_del(&irq_grp->napi);
> +			free_netdev(irq_grp->napi_ndev);
> +		}
> +	}

at the cost of above three, the centralized err handling is working. Yeah this simplifies
the code, but makes it hard to understand.

what about:

1. refactor the existing ath11k_ahb_free_ext_irq():

ath11k_ahb_free_ext_irq_grp()
{
	for (j = 0; j < irq_grp->num_irq; j++)
		free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);

	netif_napi_del(&irq_grp->napi);
	free_netdev(irq_grp->napi_ndev);
}

then we can have

ath11k_ahb_free_ext_irq()
{
	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++)
		ath11k_ahb_free_ext_irq_grp(irq_grp)
}

and the complete err handling of ext irq can be

ath11k_ahb_config_ext_irq()
{
	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {

		irq_grp->napi_ndev = alloc_netdev_dummy(0);
		if (!irq_grp->napi_ndev) {
			ret = -ENOMEM;
			irq_grp->num_irq = 0;
			goto err_request_irq;
		}

		...

		for (j = 0; j < num_irq; j++) {
			ret = request_irq();
			if (ret) {
				irq_grp->num_irq = j;
				ath11k_ahb_free_ext_irq_grp(irq_grp);
				goto err_request_irq;
			}
		}

		irq_grp->num_irq = num_irq;
	}

err_request_irq:
	for ( i--; i >= 0; i--) {
		irq_grp = &ab->ext_irq_grp[i];
		ath11k_ahb_free_ext_irq_grp(irq_grp);
	}

	return ret;
}
	
> +	return ret;
>  }
>  
>  static int ath11k_ahb_config_irq(struct ath11k_base *ab)
> @@ -629,15 +647,30 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
>  		ret = request_irq(irq, ath11k_ahb_ce_interrupt_handler,
>  				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
>  				  ce_pipe);
> -		if (ret)
> -			return ret;
> +		if (ret) {
> +			ath11k_err(ab, "failed request_irq for %d\n", irq);
> +			goto err_ce_irq;
> +		}
>  
>  		ab->irq_num[irq_idx] = irq;
>  	}
>  
>  	/* Configure external interrupts */
>  	ret = ath11k_ahb_config_ext_irq(ab);
> +	if (ret) {
> +		ath11k_err(ab, "failed to configure ext irq: %d\n", ret);
> +		goto err_ce_irq;
> +	}
> +
> +	return 0;
>  
> +err_ce_irq:
> +	for (i--; i >= 0; i--) {
> +		if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
> +			continue;
> +		free_irq(ab->irq_num[ATH11K_IRQ_CE0_OFFSET + i],
> +			 &ab->ce.ce_pipe[i]);
> +	}

this is also a duplication of the CE part of ath11k_ahb_free_irq(), consider refactoring
the exsiting helper and reuse it.

>  	return ret;
>  }
>  


