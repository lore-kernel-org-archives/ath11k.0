Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1B0CD37AC
	for <ath11k@archiver.kernel.org>; Fri, 15 May 2026 02:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrr4c6ZRkiE76n5t5mFlOMtG559/xFzAWj0L7OxzRTc=; b=uo2MunS7rwLpARfCybaKRCs4z1
	xJZ5WizDT7oi5xioHacdY9G431gA2Ghfh0uzfcgLsNEbVrZggnZWRU+jZHJI3pO0kF8riyXaNWbYs
	W2lyhZ67drCGxAL36pToxS7gH8SgdyCkl08lXidYhh6pmZFsW8WVGw/lkZGNWMF1xwX52eW/o5X8a
	OYppcur2HcrABc3vci8+UJvZfcDHaAPYAUPxINJ7+iGyBai/WTXzTYhAaQOTEFoMHIm5RgFQShO4N
	j/6TJTYSGIg167dz0E4NaFVUf9fJjn9ObDBoDvIEki5VzEagqzS0mbbNsbXwNlTbTKyuhb3scYKlG
	zaG0KC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiJV-000000077SZ-2z46;
	Fri, 15 May 2026 02:30:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNiJS-000000077S5-3GTl
	for ath11k@lists.infradead.org;
	Fri, 15 May 2026 02:30:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpO7d4008229
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 02:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrr4c6ZRkiE76n5t5mFlOMtG559/xFzAWj0L7OxzRTc=; b=D1q/oIgW5blnd2+r
	W4kHlLSYTjCweKYIHSqm6lDqJBeETo0rqj9HXvp3En3ovgASv8YzGXZ+sN4bZUV9
	vVz9ceSw3eNuI3F2TlvhTM5KHYLfYPQ4bssaxcg/3M/g53+nuHfUWhAT5Okn4Vlg
	FzonblfjtTmKeuAd+dSrGwl4VoQjTIXQxSpHvrQJlmOYw/R6LIeKSSzlaGlJNG5h
	0oDF9SFCojkBbmSFI51UhNyDM0Ha+tBg6BulxRR/PvAlsrGaQdu3Qd314IqHXHSw
	WVohzoKhkLGXJBq+kaRs11JeFV6L1oLPR0hDG4iXG1KRXOLRvu1U+gjTUHzq4QTb
	Xy2IBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ss6vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 May 2026 02:30:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-369166fe5e3so2180357a91.3
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 19:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778812204; x=1779417004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rrr4c6ZRkiE76n5t5mFlOMtG559/xFzAWj0L7OxzRTc=;
        b=jviryodqckjxyh30xc0PejmqtLM96W+Cl3Pp1IWvt7uhY8tgKlJvEBuirMc9FaNmDc
         eEQ6tpqNjTf1jVHOauAa8eO7PJAuaPqRLwyLPqPi0/iEC4yrPkfLhY2SfxYjV/XjomN8
         MoDK9r0n7+djfNFs/lmGGjWJcOapwo+19BcBcnNp2GgYefWQjWimqseM+xle7rJf9CZd
         pwwhubDcmrGnk/OKwwNhtOFrLQ9V3IKxsuesi4MIONwLLiP6M2lgWRSMvVAUWjkaV/jP
         R+HJEwZJZSsFOx8qoh55SrJs1ty3cETLd5LSGlHLkbkMAfoHZr69sYFUCsW0IzzfGUlA
         Oo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778812204; x=1779417004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrr4c6ZRkiE76n5t5mFlOMtG559/xFzAWj0L7OxzRTc=;
        b=iluhBYuhjHJ8fAn7ButsJWkgye4wlVUEhHtbdUtKuJUnz92NDq01Z1D8cdNdo0F1Mf
         hT3lrXwKtiLb11u6lcPd/gd7j9AU6NiHpHl7z5JTTfBfvs5zNWCbB7ZZME20GUmhB0eV
         qA+x4P3S/Az44a0Hj6dl9AJXbjUsh0Tya2yvCoTocwpKz/2ejWEAOFs0T5EWXgZbx+2U
         s7Jnbnx6nDimpo79OCEkXGbOPdgs4VjvXQr3aWdZI05h1OMMTagr6fimeR6FvOMLzFdx
         LO4snB+xDHdck2BMdhvLFQxnI8l2tTueVGgYPcKzFrh0apxwMOizNt18C8AFwqXaSqgk
         1Ybg==
X-Forwarded-Encrypted: i=1; AFNElJ+lNJ/CqFgNgk2D7veJXeEJLXb+2WN2Kss54YdLE67sg000OPr5kv6WO7oNsXTcVFAMPsJkfrs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+OOeiOudXScz1qzH7mKhg8uuxTR7h0Jktrt54NxC4zT+E/ERm
	qLACgRTp41eXwjy/FqU3hTuXzNGOBy/o5Xrvy1SjoDPjVmcoWY30Sh5WAaowDTCfcKVA1TS0M5Z
	wuxQ0ZguZC9Pl0VfXvnHgnKscU2zK4n/u/59FunAAr/IFdp419zcyqFIZgdquj9vS
X-Gm-Gg: Acq92OHtYHin7vTFaN1hfauoZJelSmC5tUk7pc0GUYnxy9epGbZSkhWGDr4JWUBh2Ft
	E9Iq341loLDa7CdJnp5WlmYNamgrdgfJDRjLyIpvg/IowAa55ONvvgbK52EwGuE/glht7MY4//g
	bGZvjf15UNQ4GuMdzTTQ6hHJ9SaQU9MF7LKU4wSA9EgcXuP48HcA6pAiymwECjv7s5hG8SAuljl
	PCNKpMbCNU1P1NHx+x150loRqWoB57onnUifMd4bl9bdGuBZZaXJ/W7s/TGTo0IT2BCiuC8wyPg
	XUuz6qfgqHuCWQ1a5VaySslOcV1VAJSVKyMER58wJd6vOJLWljRiIq1YS2tdqc5gahWO9HZ904K
	H9hBCyIE+vp1QRjC16dAXD4UCLgF8TIRZ1P/u3gL5kbFHqIt3ewnMixcWQtUBWZo6KtEN
X-Received: by 2002:a17:90b:57ee:b0:368:147b:536a with SMTP id 98e67ed59e1d1-36951b97c8cmr1913554a91.14.1778812204328;
        Thu, 14 May 2026 19:30:04 -0700 (PDT)
X-Received: by 2002:a17:90b:57ee:b0:368:147b:536a with SMTP id 98e67ed59e1d1-36951b97c8cmr1913510a91.14.1778812203805;
        Thu, 14 May 2026 19:30:03 -0700 (PDT)
Received: from [192.168.58.30] ([152.57.206.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11cbdesm41328565ad.71.2026.05.14.19.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 19:30:03 -0700 (PDT)
Message-ID: <5cf71052-9797-4dd9-a168-1c4ac73dddb4@oss.qualcomm.com>
Date: Fri, 15 May 2026 07:59:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: clear shared SRNG pointer state on restart
To: kfarnung@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, santiagorr@riseup.net,
        stable@vger.kernel.org
References: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ujwUiiWYcE3ccKBnKpXEJHiaHvrJiiav
X-Proofpoint-GUID: ujwUiiWYcE3ccKBnKpXEJHiaHvrJiiav
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06852d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=YxPPAu78v9FaI4eag4rAcQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=EUspDBNiAAAA:8
 a=yURyTq39TCQ5d30jD7MA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=3w6iy9BqfFbDrj__1GvT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDAyMiBTYWx0ZWRfX6MoeVFEl3XnJ
 AMoxPgQzXOLaCaVTnfEYKhTH486qbukwEjdlknjiv/ZW8GBWv166m74y4/AWJ4K0NtxooP7Ha97
 bnzZR6t8dy3SNEMSSfX8ubCVDUbBc9EL1Q2OlvcdY+XBwuVsEzJq0B28XUz2qlVBCslpMM+DkzT
 d16XZtv230UloIEceSLtjl0b+UoK1ubCQmRFHrq4jAOQ0gdHG3Br/4k6044fOmuPotlzZhZfexK
 iwpE7hr49m4I0GvkKjURm34NPM+CVMqp3yi2rJhqPPxCyCR05BG+Bm/kiHGnuMbD9oy1ZPbZGDf
 sXxHW9tX3eWs/wEUAniQcgTpPVovKsO74pfDQfiXl3A1DYpq7ALQvZwzlUQ+hy9rpHhK6mmbZFy
 B/H5fO82cOG+RuaVz5l9YWjgpvavcDAQRhxsmpAwRzDUb304ux7+jLDIuJM2yQMsZSOskqSgN6m
 YHRGKopQu29Du7U3Urw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_06,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_193006_949371_20889B09 
X-CRM114-Status: GOOD (  26.11  )
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

On 5/14/2026 10:22 AM, Kyle Farnung via B4 Relay wrote:
> From: Kyle Farnung <kfarnung@gmail.com>
> 
> LMAC rings reuse the shared rdp/wrp pointer buffers without going
> through the normal SRNG hw-init path that zeros non-LMAC ring
> pointers. After restart, ath11k_hal_srng_clear() can therefore hand
> stale hp/tp state from the previous firmware instance back to the new
> one.
> 
> Clear the shared pointer buffers while keeping the allocations in
> place so restart still avoids reallocating SRNG DMA memory, but starts
> with fresh ring-pointer state.
> 
> Fixes: 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com/
> Signed-off-by: Kyle Farnung <kfarnung@gmail.com>
> ---
> This patch is the result of investigating suspend/resume failures on a
> Lenovo ThinkPad P14s Gen 5 AMD with ath11k.
> 
> I originally proposed extending the existing ath11k PM quirk for this
> platform, but after discussion in [1] and bisection the issue appears to
> be a regression introduced by [2]. There is also a parallel report in [3]
> that appears consistent with the same root cause. This patch keeps the
> intended no-reallocation behavior from that change, but clears the
> preserved shared SRNG pointer state so restart begins from a clean state.
> 
> Testing so far has been limited to local suspend/resume cycling on the
> affected system. The issue was originally reproduced on v7.0.4, and the
> patch was also built and tested on top of ath-current with repeated
> suspend/resume cycles on a Lenovo ThinkPad P14s Gen 5 AMD.
> 
> [1] https://lore.kernel.org/all/CAOPSVF04q6uvVdq8GTRLHBrVMdpt9=o9wVcFMc6f-yhmSBcZqQ@mail.gmail.com/
> [2] 32be3ca4cf78b ("wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again")
> [3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1132343
> ---
>   drivers/net/wireless/ath/ath11k/hal.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index e821e5a62c1c0..0c0aeb803018e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1387,14 +1387,21 @@ EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>   
>   void ath11k_hal_srng_clear(struct ath11k_base *ab)
>   {
> -	/* No need to memset rdp and wrp memory since each individual
> -	 * segment would get cleared in ath11k_hal_srng_src_hw_init()
> -	 * and ath11k_hal_srng_dst_hw_init().
> +	/* Preserve the shared pointer buffers, but clear the previous
> +	 * firmware instance's hp/tp state before handing them back to FW.
> +	 * LMAC rings reuse this shared memory without going through the
> +	 * normal SRNG hw-init path that zeros non-LMAC ring pointers.
>   	 */
>   	memset(ab->hal.srng_list, 0,
>   	       sizeof(ab->hal.srng_list));
>   	memset(ab->hal.shadow_reg_addr, 0,
>   	       sizeof(ab->hal.shadow_reg_addr));
> +	if (ab->hal.rdp.vaddr)
> +		memset(ab->hal.rdp.vaddr, 0,
> +		       sizeof(*ab->hal.rdp.vaddr) * HAL_SRNG_RING_ID_MAX);
> +	if (ab->hal.wrp.vaddr)
> +		memset(ab->hal.wrp.vaddr, 0,
> +		       sizeof(*ab->hal.wrp.vaddr) * HAL_SRNG_NUM_LMAC_RINGS);
>   	ab->hal.avail_blk_resource = 0;
>   	ab->hal.current_blk_index = 0;
>   	ab->hal.num_shadow_reg_configured = 0;
> 
> ---
> base-commit: 54a5b38e4396530e5b2f12b54d3844e860ab6784
> change-id: 20260513-kfarnung-ath11k-srng-clear-pointer-state-91d8ab07e5e2
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

