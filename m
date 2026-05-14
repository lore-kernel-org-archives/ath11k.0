Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D9ACD4F25
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPlHXawxs1R9kEavnhYmyNHAkkm5AEaUrclL97PXn8s=; b=ugK+wPpIooUFefNOcG5GeyoNA3
	DaNj6LbFY4NQwOWf2DmvLOQgolV/vNwmfBbKaXu4E/6Ru/joPmPvUCaYwWKTilJ4lv7LxNgko38Jt
	zNtsjy5GOV78PdbtWKS80Y8WnlwgnFa4V3NOSKQTSaFjhUjctBgPdAcffwBawfy1QbO3zjPO+IoIs
	1XTY6avWKBm7Xg2Tct1y5q8Ucwv5LkiLZRGgI2R5/rKv6XeH8gQe3WE4RZw0VBl0eULszGLQyE8b3
	SMV7Kbu7LqaJICXA2W7eGF4tgSOFheON2jZShAuYI/kS+MQJdvZkmQ+30NYPu0iYBZvDcRCivH2et
	Fnh8F5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXnz-00000005sdt-25Eg;
	Thu, 14 May 2026 15:16:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXnt-00000005sbe-22m4
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 15:16:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeSZ23891239
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 15:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPlHXawxs1R9kEavnhYmyNHAkkm5AEaUrclL97PXn8s=; b=ER0twsuI+A0m6XO0
	E7jy7MRvRULwj5LPJZvuvPQEMDozE9LqMkGh6M4hatVZV270ufHKN8XXJ5fmKo3C
	zu+GZNoSXn7YGBLhUQ2lMDYrTbWs/5uRshdzYC0VZqS6E7SEYzr5A10PSNdwdgy/
	3Bltea42BMH6cpzJkjy0NLtCUUVLMEJwVCBolhTKklJE0AYcePx/TcUE4ELq/O5R
	qs8egG8mcrv8Ygl7AOY4eDXM40KXqV9enDvQoRwsRyIX58Z0iY05UxD0Nkb0Bq7Z
	JJiqOE2zbTKZWrEXBuWXuUfrwvIdudEfJV91/siIOyYi+cSxg5D9SAtwdcM8s37X
	Vnfh4w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tvm1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 14 May 2026 15:16:48 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-130aab78a09so8079602c88.0
        for <ath11k@lists.infradead.org>; Thu, 14 May 2026 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778771807; x=1779376607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPlHXawxs1R9kEavnhYmyNHAkkm5AEaUrclL97PXn8s=;
        b=Gyrame5AE5OPvo3fhDWXpUPzvXejKBLnLG+uj9mUY32y+q9jZ1g9pfOmRpMoYt5LSf
         5Or5PPSgzChEvNJ5WZNGpnC7btuxmJjVxQyyPGW1Roejg909SVwo8qIo53/ZdGi4ct0Q
         c5gsIr6COXl6Z5iky0FAwzxNjueXgHmhB0klzs0kDHByhGQSdBZcm9fkO7FkcUC9sM6D
         +F0nmRSV0WBvxJqlN+Nj5AmQTKA9/YqCj93br+OF9khClo3dvOGcrgwZe4TMe6rH8m5n
         fZ1lNuBjopzYNwx8MTnJK0s8HqkIfp1wQizWnlWS0PS6cCBb3oi2nn01FDGwQTzaxG5/
         K8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771807; x=1779376607;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPlHXawxs1R9kEavnhYmyNHAkkm5AEaUrclL97PXn8s=;
        b=Vzq8nzguAoMUEBUe7di95i9pbev/JS8I4ZrQm95Hm8JvN4kGxZvTGrpKG35reIdSp5
         w8+HuoyiGKAwb+Q9OTc8qNAHTEC12dNjYovhxy0sbhuD8ibQaqxDNhY8rA3949EqcFpB
         LQ6sDONjxt0UYiBPMtpulEb2EGyptC3pxA2mCwbovF4VQJw0+KHf9bnQHRdPfy0WuuWh
         TYtq3SooCHfADhfdcn7eIw6u8C874kpker0LQOT//WchAZ8u7M9GmeaK4/2ybSWIZtNE
         mQiTMt0fdcxnAqtg8h4WOzpqWHl6RqT9rKuhHVFGpGpvZWCvboOD5fOXFsS/YnAw9X96
         U69w==
X-Forwarded-Encrypted: i=1; AFNElJ/19ayDVHsPIXgY3GLhoOxW3xfqz3DT8o2aEvBDr1PLEyKUTUriBtSZucr3Lmu9z2GYJOcUgxc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3qyTu8rSH2LuWy4wrHkmbl2bw/dvNSX51lVwBarOIQGSQz61N
	yIUNYgGmR68wIW53NUoCoSNVe7/UH+cQwxkeRcg0jX6PtvvYAdbrQie7VtOvgxznRiGM/SHmHzm
	ouKzELC1zOs9dlLtsuxfVxgChHr/Ptn+Xe6P0kAtdi+EA3WRyYvO7of/bIz7ZGeGM
X-Gm-Gg: Acq92OFTFlJKgHADTkIf+L1ziqc75PesLbkFW7tvIRUJ/niwrUSTkgI56wUV0kdtwSA
	Jni+AsxAeyQOEtuFoULZMqrkGy1EF9zPXYa5rOnV0ldEfw+NyRsOz3us0HJ45o3/7/1Rzpp0D2s
	8tQVn/dKtFlErlaiQ/KaAUeNw7A3O7cBgnq+ytHqDFla+xuG9iJ1sCHEuPs+O7HXSYWs2aNFks7
	7tfX1XMws4sRZMWYtPZtCGUVbfHLYUdtmV/VqegEqpz6b4EcsF+jMxVPoav3xe5Fffke6itb5yS
	cT/2h/p5OmuLD+iU5tSNfDWcGGTyzWC3la/Cs2dDViWQ/2EcA2+gccJgQHMk3yZAkhbks1rbGTM
	hP4MusOcSwl1pvGl/pjeAPvhWHtHOoT/Km0IUZc/0niiXFCTvn4OD7xoLoxkvyFIAGef/RhBOHa
	8ND3+rww==
X-Received: by 2002:a05:7022:618a:b0:12d:de3f:f3d9 with SMTP id a92af1059eb24-13436ba610dmr4727837c88.35.1778771807080;
        Thu, 14 May 2026 08:16:47 -0700 (PDT)
X-Received: by 2002:a05:7022:618a:b0:12d:de3f:f3d9 with SMTP id a92af1059eb24-13436ba610dmr4727809c88.35.1778771806398;
        Thu, 14 May 2026 08:16:46 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed531esm4920679c88.8.2026.05.14.08.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 08:16:45 -0700 (PDT)
Message-ID: <ddd1601d-2eef-4a52-af16-594223449c8c@oss.qualcomm.com>
Date: Thu, 14 May 2026 08:16:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: clear shared SRNG pointer state on restart
To: kfarnung@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, santiagorr@riseup.net,
        stable@vger.kernel.org
References: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a05e760 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=yURyTq39TCQ5d30jD7MA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=3w6iy9BqfFbDrj__1GvT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE1MyBTYWx0ZWRfX/C3VhCL+CoRW
 VCK6RInaIxXEJBOvq/ooKTDBjBmUUwR5SVkxv/JCJsMWcXzD0JqyK98QrHmcmttDoT2Q8vE+vuu
 7zzCxHdfXsswOLY/wscwf/iodflfFrnSuxzfZ/uX42BA/2WNCh1dDo0zHjG1d4/VfXIMO+mULHp
 LYG5LhoFuoR1yG4VvgU+AuVWAOPX6xktonDp+7Iqq0rh3uLi+sqTFt0Yc6xwBgQkjhJ8TuVMJkA
 eQ0M/LHOOSab8o8wkw5KN3j7lbRZ1ticM/Zfl9z39tGv9FhmcfAR3m9EFU4XyQnV0sndi43Yqom
 4v2DLeyN/iKkNObMD5iTW0QdxKoAeYaA5vmfsEvBrd1LCUnEjPVdOv/YKOBJuBTpodX2dyw41MW
 7bopUDi8W3AsLnVhXzygUQRrIgPR3SYr57xMl4yi4Gq5KCscvwKo/Sjjcsw40sc4Rlk+IT5NRpv
 h7/WOBdTRwX6H4MJ3aw==
X-Proofpoint-ORIG-GUID: C-AQoc1pW8zNKpFVxNx4AseRK2JZaY-S
X-Proofpoint-GUID: C-AQoc1pW8zNKpFVxNx4AseRK2JZaY-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_081649_536676_1BDAFA55 
X-CRM114-Status: GOOD (  28.97  )
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

On 5/13/2026 9:52 PM, Kyle Farnung via B4 Relay wrote:
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

I'm going to change this to a Closes: tag in my pending branch

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
>  drivers/net/wireless/ath/ath11k/hal.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> index e821e5a62c1c0..0c0aeb803018e 100644
> --- a/drivers/net/wireless/ath/ath11k/hal.c
> +++ b/drivers/net/wireless/ath/ath11k/hal.c
> @@ -1387,14 +1387,21 @@ EXPORT_SYMBOL(ath11k_hal_srng_deinit);
>  
>  void ath11k_hal_srng_clear(struct ath11k_base *ab)
>  {
> -	/* No need to memset rdp and wrp memory since each individual
> -	 * segment would get cleared in ath11k_hal_srng_src_hw_init()
> -	 * and ath11k_hal_srng_dst_hw_init().
> +	/* Preserve the shared pointer buffers, but clear the previous

Since you are touching it I'm going to change this from the obsolete
networking block comment style to the universal block comment style with
/* on a line by itself

> +	 * firmware instance's hp/tp state before handing them back to FW.
> +	 * LMAC rings reuse this shared memory without going through the
> +	 * normal SRNG hw-init path that zeros non-LMAC ring pointers.
>  	 */
>  	memset(ab->hal.srng_list, 0,
>  	       sizeof(ab->hal.srng_list));
>  	memset(ab->hal.shadow_reg_addr, 0,
>  	       sizeof(ab->hal.shadow_reg_addr));
> +	if (ab->hal.rdp.vaddr)
> +		memset(ab->hal.rdp.vaddr, 0,
> +		       sizeof(*ab->hal.rdp.vaddr) * HAL_SRNG_RING_ID_MAX);
> +	if (ab->hal.wrp.vaddr)
> +		memset(ab->hal.wrp.vaddr, 0,
> +		       sizeof(*ab->hal.wrp.vaddr) * HAL_SRNG_NUM_LMAC_RINGS);
>  	ab->hal.avail_blk_resource = 0;
>  	ab->hal.current_blk_index = 0;
>  	ab->hal.num_shadow_reg_configured = 0;
> 
> ---
> base-commit: 54a5b38e4396530e5b2f12b54d3844e860ab6784
> change-id: 20260513-kfarnung-ath11k-srng-clear-pointer-state-91d8ab07e5e2
> 
> Best regards,


