Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D530FC43458
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 05:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxXYALwNR63jw/rFRq7RT7Vad3vt++2jtWUcBG0sDDI=; b=NNhHPuFXGb+UpTctemrA8tMWaO
	yXD4Anhbq1j2jpNvqSwzoOtHPTwyNHCe9r9Y1jEwwXo/y3QYQUFqE8R2OvUU2J4GKQjkVLNovyvDX
	R5P6rnFZB+d64xQV7PgawJqdwPbzt5mDwPMhHoU5/gQCOTbAHDQKiibN3a/6oBDZ/9fWIXFs2Cl2A
	3EvIiWfz+5RUZrqSDK65GO7D4mGsGXUocpjnVW00li+u0VlpVaG5c7Nyezf2mFhYxJ0o6SUA+Knjv
	6h6oeQLZ3sqxUAtjz58VCfnOQAChytQrPjKq6Y3KOTHG0ClzgCDDOH42V6KSKtYQwpASWTHFHBXCt
	lc0Oti2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9I3-000000089we-1yep;
	Mon, 13 Jul 2026 05:33:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9I1-000000089w1-091D
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 05:33:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3A1S7039765
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 05:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxXYALwNR63jw/rFRq7RT7Vad3vt++2jtWUcBG0sDDI=; b=YEbxjzeV1FFvLJNr
	iUlmjBq69Hpsn/I7ADVsBzI1/LRcn6O99wTD0IRYqII7V1au3FSwx8KAJJQOl3eY
	MAfJ1deyuLODXoVNRRU/XZ5F43y3w3em7OSURasBmK8v66gpiC7k264V3qtHZUNP
	svrwMISMRVs536+JuB4dVMI7td8pnB+X/pUinuB9aqtVsNxAjm6vbxoY1jh5mDIT
	ljwzhKOCjA11WRE8y24YENrUkgk/xCSDFIeUipCmw+I7IL8URYhRrpDPQjYebfmb
	nl8q4fAkhEo/Z4iQFPY9pLECNNyMY7/cOxJLafReBFt3xGDm+L+jCwGhZkkM5M6A
	fvSRWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf484cmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 05:33:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cedd915291so639655ad.0
        for <ath11k@lists.infradead.org>; Sun, 12 Jul 2026 22:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783920791; x=1784525591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxXYALwNR63jw/rFRq7RT7Vad3vt++2jtWUcBG0sDDI=;
        b=EBh7xVy9tjHcqnjkB89Xk+sgJRTCzxz/BFUf1NxIwLCs+VUL2g4gYqvyeLWTypNPPl
         fET+rMTzuBBKC+gZ+O+5DWO57Ea5ilLY/lOO/655wwAhkirGC952fqR8OmDhkT+YKrhQ
         mKBFZ3YzjGketHRmlT4NNcyf6Zjhh6gpK/GiJejtKUjoKZDaFlu1/bhUQGnnOWiKrE5Q
         tquqr/Wr+fFiwVc1OlzBgL3EDs+SQHBN21AQnMqYGlv6eW75xkyK0KVxtx3UGt9X35D+
         aJyDbukPRC1GX+lNq04meIMfTShjZwUM2HiX9j2/dcE888QGcvrU+E6PJf1GnYF5EcC4
         DScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783920791; x=1784525591;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxXYALwNR63jw/rFRq7RT7Vad3vt++2jtWUcBG0sDDI=;
        b=UOvnrz1pimlP4zbmgofz7F3Rc3WV1Aejqtp6yhFa7nKS15e7e2wfgNKyop9w1lXUjS
         h7Je7wsOBCniQkQx3Tc+DTx/ScN/PVaMW6rPxD6+gjcXxpjO4rjIn9k7wqSPTeMDVsHT
         VlcGrfGlTq+XBKEsXUvJ5YtWNCkzD76NBmAQwjQ9f+DwshRTHoVhGUSB/S79T7dFWO/h
         tWIOiu2U96n6GsvUtPmaiEubVcUJfdCRrzSkRUiCCmeYBZVXSSeSOm4fOkjeujMUYcpY
         Va50EZgnBQpY+X4thehQQlfS5FadcJRc6Z2mW5ROCt7uEFgAr2mm0DIC47mNLi2xR49C
         GF8w==
X-Forwarded-Encrypted: i=1; AHgh+RrHC/rcDCBe5Yutllx1c6TvqSUm3BAzq3dIdelMUIFLOoN4bvTanIgYwhWb++gmhylr53lElxY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRMnHO7KJvJzy8URxucu8Kua2YKN32D/VR3SN5B3eWYLMM0oG0
	P4qchAslI1qncXo/fqO2pEJMm/fvv4qjsBUV4zzY5ZX9mrjcei+r2UgGiZ0OA8SiDxG3gFMe7Up
	0Mm6XLI/QkGvctzVvosUbPQUwYZiEP7oZ9nE8hnoSELE5cpIZbnMfQOZRfpxa12in
X-Gm-Gg: AfdE7cmZnL2XNERA7VE0l1FFJrsmzChw/Ynv4sFGzlMyY/IV0k0I57wcUm6vMJwk1yQ
	DPD+h2TOVKDgVdKQoesCa3/U15EdKcD6wMqBytaevkm7WMxw0uyw/hZ9Ipk28IHFz/j3zi43wwL
	E/jEFyOmVUjwY3hTgpuBBhZ2ewBsqy5E29l5qgQIg1QS197HcvGGlvBZKepG5V94Q3v5YSx47H2
	21Ev0qk5+MRXjUVOZxQw/T+fjrrBxbqOixmYLQg27KDacUGpf1CYhzHgmgycgxkdDzeSyhxFjK1
	tBhhACopSP/4wmEPtABfY5miTVhxdvOP7Bdmwb+/DI8mPsAzKHSiA5kEWHW3L9Oijp8zBNq7xqj
	uYs2ZvVP9NTzNdnwAWYGpsj7bd8yzG60zZyGdj96pFua4Vv2PGfGB44vAAe4Q0inBVdzfKPdDp8
	VHYGw7Gwc=
X-Received: by 2002:a17:903:1aeb:b0:2c9:97a8:aff5 with SMTP id d9443c01a7336-2ce9f4d41acmr85571505ad.46.1783920791602;
        Sun, 12 Jul 2026 22:33:11 -0700 (PDT)
X-Received: by 2002:a17:903:1aeb:b0:2c9:97a8:aff5 with SMTP id d9443c01a7336-2ce9f4d41acmr85571215ad.46.1783920791126;
        Sun, 12 Jul 2026 22:33:11 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm94046615ad.37.2026.07.12.22.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:33:10 -0700 (PDT)
Message-ID: <e94de910-0a15-4b82-b006-03da98305e9b@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:33:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix resource leak on error in ext IRQ setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260622025659.1235658-1-zhaojinming@uniontech.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260622025659.1235658-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1NSBTYWx0ZWRfX14w+vnMjSbjQ
 f3UzXAO7uUmZaRM5VKB2+OYLkxHsfs4YnWEb1yU9TFqo429PW1UY/9n7WIohzw20hiUhXlIEgRg
 ytpYgBJQrMum3BX21ZUzzJOpQ+w+uE0=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a547898 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=iHwBjlyiAAAA:8 a=7ikIpeOslSXNon0WtTsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1NSBTYWx0ZWRfX9RMaSA0zOd/y
 1t8tl2c3gSXwhqvn62OrZ3jtOXabavknnlvRteoDspkwpnWz9Og2MYW6Z6X76LN8InG/eml5/Ch
 oLXpqXtRHnFUweknMLRNM9MvVU3gutlbhVNUGNE5MlOU8N0PVb/2QaI7RlMHsm10Bq7cFCc2xlM
 GCgZvtoKfd7s35gaU7aMsEx20jhrsQiX8YF1h27/t4o9iV24t0GOE2oNe9oQQUV1nqW2kB4BbVd
 tIijJGO1x7e3/ntx0p/pMXbuFIiKZSBJiqVc519kF15Qu++zh8AROMu/1U+Q6/J68+B0C/j7NS8
 WdT6KzZRpU+xzr0FG/h0LFxSLos5CEWiylGYlL9Kuu/SpuxCHDmhtd5DRcWhnGbtsCdX7oUnmbT
 VOrKN0IsYM54fyeXTHyQg05J1v68X0NBCsMXfh7kOfsJ0b6coom3o01ejLSyxAQzVlYElQi9Flk
 TxhPon1kPCkUQ6Nop7Q==
X-Proofpoint-GUID: _aH9lC8E31o1m4iYfbV85aw_2H4TzLgz
X-Proofpoint-ORIG-GUID: _aH9lC8E31o1m4iYfbV85aw_2H4TzLgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_223313_083322_E8DC126A 
X-CRM114-Status: GOOD (  25.20  )
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



On 6/22/2026 10:56 AM, ZhaoJinming wrote:
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
>  drivers/net/wireless/ath/ath11k/ahb.c | 30 ++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index f566d699d074..041c0fefe8c8 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -536,8 +536,10 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>  		irq_grp->grp_id = i;
>  
>  		irq_grp->napi_ndev = alloc_netdev_dummy(0);
> -		if (!irq_grp->napi_ndev)
> -			return -ENOMEM;
> +		if (!irq_grp->napi_ndev) {
> +			irq_grp->num_irq = 0;
> +			goto err_request_irq;
> +		}
>  
>  		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
>  			       ath11k_ahb_ext_grp_napi_poll);
> @@ -600,11 +602,25 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>  			if (ret) {
>  				ath11k_err(ab, "failed request_irq for %d\n",
>  					   irq);
> +				irq_grp->num_irq = j;
> +				goto err_request_irq;
>  			}
>  		}
>  	}
>  
>  	return 0;
> +
> +err_request_irq:
> +	for ( ; i >= 0; i--) {
> +		irq_grp = &ab->ext_irq_grp[i];

this does not compile since irq_grp is a local variable defined inside the for loop above.

> +		for (j = irq_grp->num_irq - 1; j >= 0; j--)
> +			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
> +		if (irq_grp->napi_ndev) {
> +			netif_napi_del(&irq_grp->napi);
> +			free_netdev(irq_grp->napi_ndev);
> +		}
> +	}
> +	return ret;
>  }
>  
>  static int ath11k_ahb_config_irq(struct ath11k_base *ab)
> @@ -629,8 +645,16 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
>  		ret = request_irq(irq, ath11k_ahb_ce_interrupt_handler,
>  				  IRQF_TRIGGER_RISING, irq_name[irq_idx],
>  				  ce_pipe);
> -		if (ret)
> +		if (ret) {
> +			ath11k_err(ab, "failed request_irq for %d\n", irq);
> +			for (i--; i >= 0; i--) {
> +				if (ath11k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
> +					continue;
> +				free_irq(ab->irq_num[ATH11K_IRQ_CE0_OFFSET + i],
> +					 &ab->ce.ce_pipe[i]);
> +			}
>  			return ret;
> +		}
>  
>  		ab->irq_num[irq_idx] = irq;
>  	}


