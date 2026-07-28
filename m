Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E328C54F4C
	for <ath11k@archiver.kernel.org>; Tue, 28 Jul 2026 05:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+odnqadZBL3FcgD3fTy4z7A88GEP8qiW9be37JO80U=; b=tNQPPwfdhvJkDJHekHkNlJc44I
	x4ojbtJopxa1i2aH0rvyZxFXOE6uRK4aw0DF8L6ml/weQDGKx2Gi1q345khVN74SesC2WrG8YvfAU
	yFb5OWtHk8Vu2gUHXFIhvC8VRCfreNGvWT6Zk6RdKgL6dovAx56kZWQuc3n9ub8NDt/YkjW1w4/du
	qBqpB+vxLilGFwnqGaOYbf5ZjPW0FlZOiDrn6o+U1e9wOPJes3nerfxPMuedTLBJdsEe4L8e47Wtl
	9DDHlQClYuPJL9TiKfpAGjDFCIsO2CSgwmr97sYQUrlSo2el7SJbF4FgP8tBGxV4AN2rkKpcifgQx
	fT2aLG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaoM-00000004V3F-0Ujn;
	Tue, 28 Jul 2026 05:57:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaoI-00000004V2N-30iL
	for ath11k@lists.infradead.org;
	Tue, 28 Jul 2026 05:57:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S3adEh1527550
	for <ath11k@lists.infradead.org>; Tue, 28 Jul 2026 05:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+odnqadZBL3FcgD3fTy4z7A88GEP8qiW9be37JO80U=; b=M2J7ZNOjbhORguU/
	/IABY3powGCGKcXMlgHwuH63ep/j4C8mL2b+lpeUUI1LO8I+SZdfZsOu3P0njWrG
	QbJvEeCcTi1IWGD1J3GFFwwLl9HEOIq7oEL9vaxDXW5Pex0+NCnRDZW0zoOlQp35
	fMwrPLQ9QDBsWk8haEGr6eXHN26qqXJwfz4cxNWTt+EUmMv1pcwuKMzns2K5033P
	EmGkKkBt+E+oFb98OLgHqIdOuwyZSVi4DkmBqmeF8/pG+vzyxntgW9J51xP9HG8N
	w5hfT2C6Kx0ewwDNBzSMPAHV5DRyqUTT7an1zX8k8tZeTwtqrxbi6HPROoHL09WF
	9An0Aw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8am99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 28 Jul 2026 05:57:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso50762385ad.0
        for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785218220; x=1785823020; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+odnqadZBL3FcgD3fTy4z7A88GEP8qiW9be37JO80U=;
        b=HLK8aG6BAMJIKQklETb85uFPKzf8Ql8MkxBLGe8l/t3l9YK3mcqJ6DHq8cfgRRUB0k
         fMB/wxCDGcNAIvKGg9ZD6J+PoG+LUvOxn0OmzHYakWl5hFga/tzkdSyn1iWxdy2vmzId
         uTzCnZALmNtsaKvg8zONPh3sKrBISo79WGTz2Ys0rFRx4qXi+W+XdT2bjYtjXcXVuIPM
         jWAqW5PahDRuGfH9oVddNr82EhDaGYVoG1HLq5dNvrWrmTA6xVZMDZrOgxhLK/sRsMeh
         D/nP9jkI2Stu6OtQlaa00B1zrv9nKscFh9R3l1vmez3XFoPy+YePpsnlvWWJXxIerkHU
         mXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218220; x=1785823020;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+odnqadZBL3FcgD3fTy4z7A88GEP8qiW9be37JO80U=;
        b=pNXDN6rmN59yhnRCNSJ8XsXbfIii9Ckz00m8RBfTCBweZt50AUeqDcXri6SnaSm0U+
         wQdj2/EM8Nzc0rTdhv6AIGIWbQ4d3+qaojon/MczH3fmi0uc37OTTfIDw1KxnVBFf91q
         PyFfJAWZehKld5IcrMOeEyXw9+heNNHujcn+CnyqPZVScq1SFC8RH5FGCVY4rTUNdRDH
         yDE8Vxyi18dmUcaFp8Rxc3kFXjpAukGfW0wUNV5fjSI0iz1JKRFsBXJ6FYQ/BBqTnbEL
         Me9bClNfYGAJ2kxFhdNnOYfVIe3oD5wJGyXMj/n+S/h/0bxooLzngCW9E+TOK2b5l3QC
         2hCw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7uo9DoDKVrxnpv2zBoJrOXM9/CGz8i/6pqchV/dkv2f1DqKZmipo+tgwjRrAGEHbrLvtDiyY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7zI+dE8M8Nys7GTUR8//cFe4pRL0tYPk+ZCxiInoN0ZStW0ei
	Xr9Qqr7Ze4J1a72YtKv37fSVOblYF2++XdC7N99JEF9h3iKFqNh+9AdnE6DI+KO8XwlPWlHeCtp
	mRP3hPs5NA9K7ePrGgs4qA5p8Fh5Z/1eVomDnc/YurNqZs0d//zPn3gvVSQS7aOGt
X-Gm-Gg: AR+sD11lkEUza9N08TFu629+rUfJyOGWFtVtHW0qi3YRgnAGCLW3Hg6mrTlSMBXuG3T
	MnN7O08Nw2M2SNr5T1z3FID2hKggkQqUaBE6Kt6z10FQUdaySZ+Ue4UfXOe0+eUEFox46JwzN3J
	aoA5BNNY+YIniNY/up/nQdxoXb2pl8feRqqTndE2bRuCiUmcREgBfrabY2n72uAteCHVVf/KRuL
	TDlbtaLwttNjstLhCZxHs05yk2Q1hxnatM0/fGF/ev942szWP4Vc30+KBdpHGRx4heH3EOqyi8V
	hmE3rY2qBy9sx+zp6NjolLx1eSww+WExBQ1tDgJMyTHkFdF6O9VbVtLDbymfPAbvTkn7b5XwQSg
	fwmGpWRJ6Gzb+Np/yP5lhLpA1+MeFG4LObEvnsjpXgCOaZCYcMkGTRXo0q1sIL2ypxf3w70Uo2Q
	==
X-Received: by 2002:a17:903:2a88:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2d015b145bcmr11801125ad.2.1785218219810;
        Mon, 27 Jul 2026 22:56:59 -0700 (PDT)
X-Received: by 2002:a17:903:2a88:b0:2c9:ae0b:61e3 with SMTP id d9443c01a7336-2d015b145bcmr11800865ad.2.1785218219347;
        Mon, 27 Jul 2026 22:56:59 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc347sm45843315ad.40.2026.07.27.22.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 22:56:59 -0700 (PDT)
Message-ID: <1e19adf8-d3cd-47c8-a986-05faae7af3c5@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 13:56:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260728031335.3818736-1-zhaojinming@uniontech.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260728031335.3818736-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA1MiBTYWx0ZWRfX5+RnAB2I0PNL
 D4etx+b9kLeEYnGv7tMrvsmdk35dFWK4axUz0xPvZf1YCZtb0BPEUnNUIgv41Zsr+vPpGc+/VqK
 tK1FSrUOrsz3SW0dAxl73BAqYx2DavWCEGsRLlwEb6Sja0+5aJA9Wf02qtV1fzrf/8s1pa+O841
 mXJA+t7V6gqviQxbgQI0+knJ92eyd2O5QCfMwa5Koew1FeAbXaRMjQY/byq/0s6y7AvQJvSByCi
 VvRJX77yIPZ8Wc7TADMzBnT0iwCvnweMa/HaEyvIIXz/QWJ/nbJYEJPU7SoVIgFhakX3LC6/vNa
 u8XsS3LmuCbCkbqn0dIl/oRTfL8HgQTtuB9NA67rpZRl/0kFVEpzAwA2R1p8mYWs6tFXmKmh/Ws
 OsfMqFkYFS0+n+RbCxfX1ucGHTCyrYGrhOi6o8Iy+1oih0t3MO/Ni1xCmpbLUfEvS2aUwrejr9n
 eHWKnW3cc+s8Tl8Lsbw==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a6844ac cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iHwBjlyiAAAA:8 a=X7nvTDC9Kz5FJV0lFOkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-ORIG-GUID: dnxDgWe5MZITdVdUHaEy4-ti-2rJDbPj
X-Proofpoint-GUID: dnxDgWe5MZITdVdUHaEy4-ti-2rJDbPj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA1MiBTYWx0ZWRfX6bEz9+1AU9iU
 k2BDtXhwBlkz1Fo8AhDxpRFuJn+jnj3FjmWcfZ1zFt4RjbI8YA/YTj3C4DqpPmpK2TF680HhGIb
 YF2idwI18DwhzDH6S2yExWB+FI43i38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_225702_881727_154D18EE 
X-CRM114-Status: GOOD (  35.69  )
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



On 7/28/2026 11:13 AM, ZhaoJinming wrote:
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
> Also move ab->irq_num[irq_idx] assignment after request_irq() succeeds
> in the ext IRQ path to match the CE IRQ path and avoid storing a stale
> IRQ number on failure.
> 
> Link: https://lore.kernel.org/all/b6903572-52cc-4c41-b9cf-5845e387c176@oss.qualcomm.com/

this is not the right way to track old versions. If want to do that the right place is in
the changelog.

Note if you use b4 tool this tracking burden can be done automatically.

> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
> ---
> 
> Changes in v7:
> - Resend in a new thread. No content changes from v6.

I mean here.

> 
> Changes in v6:
> - Move ab->irq_num[irq_idx] = irq after request_irq() succeeds in the
>   ext IRQ path to match the CE IRQ logic and avoid storing a stale IRQ
>   number on failure.
> 
> Changes in v5:
> - Resend as a fresh thread. No content changes from v4.
> 
> Changes in v4:
> - Drop the napi_ndev NULL guard in ath11k_ahb_free_ext_irq_grp() as it
>   is unreachable in all existing call paths. A silent guard against an
>   impossible condition hides bugs instead of exposing them.
> 
> Changes in v3:
> - Extract ath11k_ahb_free_ext_irq_grp() to handle per-group ext IRQ
>   cleanup and refactor ath11k_ahb_free_ext_irq() to use it.
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
> index 1e1dea485760..ec5bf5c9fd79 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -431,36 +431,44 @@ static void ath11k_ahb_init_qmi_ce_config(struct ath11k_base *ab)
>  	ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id;
>  }
>  
> -static void ath11k_ahb_free_ext_irq(struct ath11k_base *ab)
> +static void ath11k_ahb_free_ext_irq_grp(struct ath11k_base *ab,
> +					struct ath11k_ext_irq_grp *irq_grp)
>  {
> -	int i, j;
> -
> -	for (i = 0; i < ATH11K_EXT_IRQ_GRP_NUM_MAX; i++) {
> -		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
> +	int j;
>  
> -		for (j = 0; j < irq_grp->num_irq; j++)
> -			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
> +	for (j = 0; j < irq_grp->num_irq; j++)
> +		free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
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
> @@ -524,20 +532,25 @@ static irqreturn_t ath11k_ahb_ext_interrupt_handler(int irq, void *arg)
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
> @@ -585,14 +598,11 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
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
>  						      irq_name[irq_idx]);
> -			ab->irq_num[irq_idx] = irq;
>  			irq_set_status_flags(irq, IRQ_NOAUTOEN | IRQ_DISABLE_UNLAZY);
>  			ret = request_irq(irq, ath11k_ahb_ext_interrupt_handler,
>  					  IRQF_TRIGGER_RISING,
> @@ -600,11 +610,24 @@ static int ath11k_ahb_config_ext_irq(struct ath11k_base *ab)
>  			if (ret) {
>  				ath11k_err(ab, "failed request_irq for %d\n",
>  					   irq);
> +				irq_grp->num_irq = j;
> +				ath11k_ahb_free_ext_irq_grp(ab, irq_grp);
> +				goto err_request_irq;
>  			}
> +			ab->irq_num[irq_idx] = irq;
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
> @@ -629,16 +652,24 @@ static int ath11k_ahb_config_irq(struct ath11k_base *ab)
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


