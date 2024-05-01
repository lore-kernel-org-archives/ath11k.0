Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7346FC4345F
	for <ath11k@archiver.kernel.org>; Wed,  1 May 2024 16:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ec4/pRdCc3AjS+q+CimTNZ6GJ4xqHg3tVlcEEpinlVc=; b=v4aN67IK8yU6yQ0teu0US/gohj
	S/i8wWKIOlsMC2gd1tMqDXygn4sdZ2VBfmMuCR8Ro2lV55DT0agRfR38MOI2kC8tV6RTC/jRx37cg
	d/hUd4/1IcwUtMliSpxOd/+56AGnxcufBFL6QMx7edlx40EOz2oqhHOLIHra+yLDYp+7vIj/o3/oP
	ED2BxH1r3hoMCJGz2KZtPqHdOaSZ4OLUu4ChWR8DYaWDRi12KnJqrrC6MEOUwjMXiL+qp6VSTSOVo
	JJCFkEkFnaEmN2a/DbHm1TncQ+o2OLY1Ey+tenTzZT29ULD4Mo/MOItslskrj/WmJF6tnZhgmcUwu
	FTD3tccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DEl-0000000AEL1-0QX2;
	Wed, 01 May 2024 16:55:19 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DEh-0000000AEK9-3HBZ
	for ath11k@lists.infradead.org;
	Wed, 01 May 2024 16:55:17 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c844b6edbbso4225294b6e.1
        for <ath11k@lists.infradead.org>; Wed, 01 May 2024 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714582512; x=1715187312; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec4/pRdCc3AjS+q+CimTNZ6GJ4xqHg3tVlcEEpinlVc=;
        b=GtI/WAS1mvu0nnuO98Q1qEzCoT74hnPYRuBrFbzPsjDfEdKmkd6fNcGpuJBoBeGbRt
         G/7cb9QA2GfhqHEsKpq3KKb8EA8UNHXbYWdp8SI8gtQngcJG+bD0uR2/J/BjiAkdtg6w
         qqdyGRwsha8tzc4hzvwPvDXb2zxTNKHEMBdJZ1vcLXHzpGW3EzmrauGPfyiMo6c+R2Ms
         O91wntHoWOBU+WKSE2T4oemVi1TrEm8jgSpUTpV2RYAVP03zNdmFc6RlieLLNghp91XO
         7NZZ80OkVdHG5yr+/3tE5MXY6oqIbEmlCZ4z4dXrAYUzSJyX+8XsfwhRw+1njVw3brfx
         VnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714582512; x=1715187312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ec4/pRdCc3AjS+q+CimTNZ6GJ4xqHg3tVlcEEpinlVc=;
        b=ab9fMcK+gkZ1lXdQoVm3Zds84Z4sNds9buHYAG+ZdSOvar4btHDr7z3Qgy3nICtbJ8
         3t44DLpLMHA6/bFQ9FHtGCMlFKtApgx1+QVH4nW2vdO++RbhDFMBd1ZQU9MgpDshX/qk
         iKmKPaUTZAvfd+5fywpz6hqaQQivXEzGOPC/L7cfKCafRt+1jrXYoZjyvScD0C3hKEDV
         f0TGj8rmXWun8rRIJV/RMVlky9Xp238RZdc1HnX5O6JZMGuVYjaGpWnRxSguExbXSIpX
         pJKNOkbZCftlUyWGLYeFrVKQBNQj21c+xsD8BxMKMbWeNmY4k3vPsiZmTsdsgKKrjcX0
         h4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUrV6rsPbLXHDh1+oI7KaJIRxk4SAVoLpQ8ygXsl33d3epQ9j0V4t2NEhj1gU8HW8FBCqbA7R8H1KUVYp/ZjVrttuS6Th2KN2lgew==
X-Gm-Message-State: AOJu0Yydcfo8iDiBbZoc2qbmqq/rMMIok0mHTlke2DzbowrbN7AnTJ3w
	pxaQGUC68NxoFOt45zkwQozdI1Dir/3wBkPSzLiCEc3f2NidxBXluU+cCElW
X-Google-Smtp-Source: AGHT+IF5sGCr+6OKVRAEX0KZ/AHP9d7gkTzcFk5ZwZW3/HwE/UOgc6fWvwpyDR/BdUf+IRQXRh8oBA==
X-Received: by 2002:aca:120c:0:b0:3c7:2a72:34bd with SMTP id 12-20020aca120c000000b003c72a7234bdmr3163499ois.30.1714582512145;
        Wed, 01 May 2024 09:55:12 -0700 (PDT)
Received: from [192.168.0.189] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id ct3-20020a056808360300b003c5db0dabb7sm3995600oib.40.2024.05.01.09.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 09:55:11 -0700 (PDT)
Message-ID: <22b0713e-49f2-482a-b145-e460b5632a7c@lwfinger.net>
Date: Wed, 1 May 2024 11:55:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix remapped ce accessing issue on 64bit OS
To: Ziyang Huang <hzyitc@outlook.com>, kvalo@kernel.org
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB55563B3A689D54D18179E5B4C9192@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <TYZPR01MB55563B3A689D54D18179E5B4C9192@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_095515_965127_065626A3 
X-CRM114-Status: GOOD (  20.71  )
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

On 5/1/24 11:14 AM, Ziyang Huang wrote:
> On 64bit OS, when ab->mem_ce is lower than or 4G far away from ab->mem,
> u32 is not enough to store the offsets, which makes ath11k_ahb_read32()
> and ath11k_ahb_write32() access incorrect address and causes Data Abort
> Exception.
> 
> Let's use the high bits of offsets to decide where to access, which is
> similar as ath11k_pci_get_window_start() done. In the future, we can merge
> these functions for unified regs accessing.
> 
> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> ---
>   drivers/net/wireless/ath/ath11k/ahb.c | 34 ++++++++++++++++++++-------
>   drivers/net/wireless/ath/ath11k/hal.c | 17 +++++---------
>   drivers/net/wireless/ath/ath11k/hw.c  | 14 +++++------
>   drivers/net/wireless/ath/ath11k/hw.h  |  7 +++++-
>   4 files changed, 45 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index 7c0a23517949..9e59b4de93a9 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -198,12 +198,30 @@ static const struct ath11k_pci_ops ath11k_ahb_pci_ops_wcn6750 = {
>   
>   static inline u32 ath11k_ahb_read32(struct ath11k_base *ab, u32 offset)
>   {
> -	return ioread32(ab->mem + offset);
> +	switch (offset & ATH11K_REG_TYPE_MASK) {
> +	case ATH11K_REG_TYPE_NORMAL:
> +		return ioread32(ab->mem + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
> +	case ATH11K_REG_TYPE_CE:
> +		return ioread32(ab->mem_ce + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
> +	default:
> +		BUG();

Do you really want to crash the system here? A dev_warn() or something similar 
would log the situation. I suspect this case is never taken, but a system crash 
is not a good response if it is.

> +		return 0;
> +	}
>   }
>   
>   static inline void ath11k_ahb_write32(struct ath11k_base *ab, u32 offset, u32 value)
>   {
> -	iowrite32(value, ab->mem + offset);
> +	switch (offset & ATH11K_REG_TYPE_MASK) {
> +	case ATH11K_REG_TYPE_NORMAL:
> +		iowrite32(value, ab->mem + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
> +		break;
> +	case ATH11K_REG_TYPE_CE:
> +		iowrite32(value, ab->mem_ce + FIELD_GET(ATH11K_REG_OFFSET_MASK, offset));
> +		break;
> +	default:
> +		BUG();

Ditto.

Larry


