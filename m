Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FD4C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6whrmn+g/DFxEN3vjjKCiQLmg4dZXZT9/IAiHb8rGs=; b=wvYZk31D8Aevd6cp8pwAcrhTuX
	1czqa+4/egsymiqu5iuDYR5csbNZ+6NTFOsyZETpNCpwujOImRPtxFqacAaTpCMPjZxzSpPbtNTML
	1OTi+JiVGtLiJijZJMGXHMG5aAOn2Hk8LUtrTs/Oi9iEp6LYxoRBmjgz+HzQ20rR3Y7ztV3xo5de1
	RlxXsoDclergu8/jMqLEyZkZt02Lv0h4WFEbgQhtIAh2jmNbmvCYgdk+mqwyKduzjRaTuBeBNyqwN
	WU8vu3J8NA1kSU+/yttGGwHcebgrcTN3SmNne/0Bts6UnGCqnm+iX1/vmpG8/lDLy0MaZKg7rFASC
	fr+i6wWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuU4-0004Xc-15;
	Thu, 11 Jan 2024 12:48:32 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuU1-0004X7-1D
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 12:48:30 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5e734d6cbe4so44551287b3.3
        for <ath11k@lists.infradead.org>; Thu, 11 Jan 2024 04:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704977307; x=1705582107; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6whrmn+g/DFxEN3vjjKCiQLmg4dZXZT9/IAiHb8rGs=;
        b=LhNPFTIzCJnuR3NeR42Lo6ThHyUYfFK7mcjbAiK76G5u7v3VRv0Wyb2bPHNIlZHW9t
         bSSQAZVk5lV9LT6Lg6M3CHs11Q69YMeRPK49JUI0MxyNJKvzjGVgqoQ0kQAJtvJ0uIPF
         RCuBZGnweqUOCM1eTrsg0CxDb1YFQcBTaShUQ1bqT+gzEnEhwu8Hsb5iLXRcm9V1L1S5
         eVg56adDF92Ypb5JlVBSgNWRKszD0igyLHSPC8iPBkJIHV2HobOBUnwhMWSW4p8DtiP0
         qL1y7+CMBSfKRcgMESY6YZNoN+4KjAHJX1Afp5y8/GthsJiSD9yQAdg9+O6P6WnTyWjn
         zvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704977307; x=1705582107;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6whrmn+g/DFxEN3vjjKCiQLmg4dZXZT9/IAiHb8rGs=;
        b=w37tw6oZgEKiGZczicBjL1RTcDsW0c8e7tBUAb46vQl3HUMfuZGcYCiegzPVu9oNUd
         YMAyDA3FELfbblD1YVXg4ZwyXao+w6orbt3y+5rAIuU6sSq/pGrHGKhpvR+DuRefkSRz
         yzXhJjITN6o8PIhyDoflgGJRgxLt1/GLCbmz8zGOkZTlREueyXWgbkhhNuaiLuY5AJOq
         CPg+bkITH1hkD4OiWOSQHll7J4Z+rhtle18DpOZ+bEoGSURFxrv/UmCNzg0cJxbJfDfy
         fbpwYnfZTKnDE2KGE5E6f/S8cz2v08TiulDIsDHdsQQj0dTUZzfC35f+6dXZ5Sy37di2
         gyHw==
X-Gm-Message-State: AOJu0Yw1FITwShq5yLdIVLgj5W2CoRQSazZUmnmm84mLFryrEr0u3zv6
	8XkQKsdJcnDu0DFNhEJ+rW8=
X-Google-Smtp-Source: AGHT+IGIiiSCnLuz9aK/rkGfErwMC8jvAY1lkl+G/3llyfHBz5E9MjuaSY9IQW3UumTLhKw8ax0yqQ==
X-Received: by 2002:a81:99d2:0:b0:5d7:60ed:6a93 with SMTP id q201-20020a8199d2000000b005d760ed6a93mr510107ywg.54.1704977306991;
        Thu, 11 Jan 2024 04:48:26 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id o24-20020a05620a22d800b007831f8c5aeasm315052qki.55.2024.01.11.04.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 04:48:26 -0800 (PST)
Message-ID: <df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
Date: Thu, 11 Jan 2024 04:48:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <8734v5zhol.fsf@kernel.org> <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
 <87r0ipcn7j.fsf@kernel.org> <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
 <26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
 <87mstccmk6.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87mstccmk6.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_044829_416558_B7F571BB 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Kalle, Baochen,

On 1/11/24 12:16 AM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>> On 1/10/2024 10:55 PM, James Prestwood wrote:
>>> Hi Kalle,
>>> On 1/10/24 5:49 AM, Kalle Valo wrote:
>>>> James Prestwood <prestwoj@gmail.com> writes:
>>>>
>>>>>> But I have also no idea what is causing this, I guess we are doing
>>>>>> something wrong with the PCI communication? That reminds me, you could
>>>>>> try this in case that helps:
>>>>>>
>>>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/
>>>>> Heh, I saw this pop up a day after I sent this and was wondering. Is
>>>>> this something I'd need on the host kernel, guest, or both?
>>>> On the guest where ath11k is running. I'm not optimistic that this would
>>>> solve your issue, I suspect there can be also other bugs, but good to
>>>> know if the patch changes anything.
>>> Looks the same here, didn't seem to change anything based on the
>>> kernel logs.
>>>
>> Could you try this?
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath11k/pci.c?id=39564b475ac5a589e6c22c43a08cbd283c295d2c
> This reminds me, I assumed James was testing with ath.git master branch
> (which has that commit) but I never checked that. So for testing please
> always use the master branch to get the latest and greatest ath11k:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
>
> There's a quite long delay from ath.git to official releases.

Good to know, and I was not in fact using that branch. Rebuilt from 
ath.git/master but still roughly the same behavior. There does appear to 
be more output now though, specifically a firmware crash:

[    2.281721] ath11k_pci 0000:00:06.0: failed to receive control 
response completion, polling..
[    2.282101] ip (65) used greatest stack depth: 12464 bytes left
[    3.306039] ath11k_pci 0000:00:06.0: Service connect timeout
[    3.307588] ath11k_pci 0000:00:06.0: failed to connect to HTT: -110
[    3.309286] ath11k_pci 0000:00:06.0: failed to start core: -110
[    3.519637] ath11k_pci 0000:00:06.0: firmware crashed: MHI_CB_EE_RDDM
[    3.519678] ath11k_pci 0000:00:06.0: ignore reset dev flags 0x4000
[    3.627087] ath11k_pci 0000:00:06.0: firmware crashed: MHI_CB_EE_RDDM
[    3.627129] ath11k_pci 0000:00:06.0: ignore reset dev flags 0x4000
[   13.802105] ath11k_pci 0000:00:06.0: failed to wait wlan mode request 
(mode 4): -110
[   13.802175] ath11k_pci 0000:00:06.0: qmi failed to send wlan mode 
off: -110

Thanks,

James


