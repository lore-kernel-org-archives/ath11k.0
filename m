Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57F0C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qholcl4vTuarhGXHoLJbL1nGyNZ5u3Lwy4788FltX8c=; b=IDyjCnXApnMVRncvZ75fp43NZZ
	hltp3bWULTFOHF0ghWrALzdAZGrt9pwKc4nSoSQ5ctBOhv9/mrz7fZ2kUMUZblN11SfETQIRNzEB3
	Tx+RbCttB/72CRL5h9qocGK8OZtXSpmjwpJsyOkxpHqAPZilOoPkkftNeyZhvmVWTMHuICO4Xq7z+
	dyZUvIbwOgA/YjiF2uBbL5Rqpb1UUQg7KvkCzM1b25Kv6MT2shdqy2LGR0suuZmkpHvwrP8Tg5U+b
	UIqUeh7gd42ND/4secrDZx9ftbyhs5PH5zLu8nZNX0zkbeuTKrrp86B3SRFC2AVy9l9P9G+0pEP2j
	OQ6dBRWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNvGy-000CLT-0m;
	Thu, 11 Jan 2024 13:39:04 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNvGt-000CJN-2t
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 13:39:02 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4279b73b5feso34194581cf.3
        for <ath11k@lists.infradead.org>; Thu, 11 Jan 2024 05:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704980332; x=1705585132; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qholcl4vTuarhGXHoLJbL1nGyNZ5u3Lwy4788FltX8c=;
        b=aDDSfPjeGDtPgt/c0Ow56JXVF0D8bQPDBHrWcJNHYbEKV4HI7R0r3nimVBydb8c8pu
         zQ7prTk4pqC1foJSbE/ZTO8pqfrZCJz3et7xIj0o+Oot5hVNEGcaQsxBJLP1ArjcmXfN
         2B6GVEfHPUx6AA6eTTw58Sd2DlnFo6hcfIeI1qEOPcujVlI9Ql7BdqndhE8aR74PRICI
         8glkmUfaBIIK7LwAM+2+brXk5RZMv+/khfGOno+x9MS9Jen5wHo8EwzfBq+0wkHYYLfu
         xbaQ97Jf/rt2SwCPrsNVhG4X/1HHyZZUpeDs4ScvKqUcNQmkhzWymX6BIoHSPgUywnSA
         U0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704980332; x=1705585132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qholcl4vTuarhGXHoLJbL1nGyNZ5u3Lwy4788FltX8c=;
        b=OQ9vBJBKIjZSqRC+9kjWkpqHF0Efuq3hbnEp58bzKC0N/5R3ISFXnzvzGDa7SUMlxK
         XwdwmRrBfQba/uf19abAu4nxIxnH2IgFOjGr0O5MUVTWmO3JhDeblnVzaMBYgunMVBxT
         QFyyNK5wrbu0/maaldBj3NqfkRprAZTt27aQ0Ur8Mur33fzDZO0MMQqsTtTCguXiNA6z
         Jm1Ynj7c0B1Vk3frGYliVtNMdAZTknDpRC0c2ptBwlzAOrDJiKvoXU1WBy5D9YnpqS1x
         NY1dEZGUT0h8lPVcNzPDvhtx6VbHcUDkQC3dnIV+8FUr0WEMWqV8wAgTrLTJsfGahzZI
         2NOg==
X-Gm-Message-State: AOJu0Yyc20yfq+B1RarZEAHN4rWqM9jzt7LsIGzwXODk58rwA+2NTgIt
	bjhHMe0PKq2xRkxnk950BCjNi55Uvak=
X-Google-Smtp-Source: AGHT+IFWartU9uhnCflOnfggaMnnGu/nXobBrdUEhsvWG6RL3MWsrJWLDYiu5zK/l7vf/9HaCrCj6Q==
X-Received: by 2002:ac8:5ad0:0:b0:429:c5d8:3f0c with SMTP id d16-20020ac85ad0000000b00429c5d83f0cmr797463qtd.93.1704980332546;
        Thu, 11 Jan 2024 05:38:52 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id w18-20020a05622a135200b00427e3f2ff25sm426379qtk.78.2024.01.11.05.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 05:38:52 -0800 (PST)
Message-ID: <e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
Date: Thu, 11 Jan 2024 05:38:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <8734v5zhol.fsf@kernel.org> <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
 <87r0ipcn7j.fsf@kernel.org> <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
 <26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
 <87mstccmk6.fsf@kernel.org> <df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
 <8734v4auc4.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <8734v4auc4.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_053859_932456_C1C9AC06 
X-CRM114-Status: GOOD (  14.19  )
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


On 1/11/24 5:11 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>> Hi Kalle, Baochen,
>>
>> On 1/11/24 12:16 AM, Kalle Valo wrote:
>>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>>>
>>>> On 1/10/2024 10:55 PM, James Prestwood wrote:
>>>>> Hi Kalle,
>>>>> On 1/10/24 5:49 AM, Kalle Valo wrote:
>>>>>> James Prestwood <prestwoj@gmail.com> writes:
>>>>>>
>>>>>>>> But I have also no idea what is causing this, I guess we are doing
>>>>>>>> something wrong with the PCI communication? That reminds me, you could
>>>>>>>> try this in case that helps:
>>>>>>>>
>>>>>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/
>>>>>>> Heh, I saw this pop up a day after I sent this and was wondering. Is
>>>>>>> this something I'd need on the host kernel, guest, or both?
>>>>>> On the guest where ath11k is running. I'm not optimistic that this would
>>>>>> solve your issue, I suspect there can be also other bugs, but good to
>>>>>> know if the patch changes anything.
>>>>> Looks the same here, didn't seem to change anything based on the
>>>>> kernel logs.
>>>>>
>>>> Could you try this?
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath11k/pci.c?id=39564b475ac5a589e6c22c43a08cbd283c295d2c
>>> This reminds me, I assumed James was testing with ath.git master branch
>>> (which has that commit) but I never checked that. So for testing please
>>> always use the master branch to get the latest and greatest ath11k:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
>>>
>>> There's a quite long delay from ath.git to official releases.
>> Good to know, and I was not in fact using that branch. Rebuilt from
>> ath.git/master but still roughly the same behavior. There does appear
>> to be more output now though, specifically a firmware crash:
>>
>> [    2.281721] ath11k_pci 0000:00:06.0: failed to receive control
>> response completion, polling..
>> [    2.282101] ip (65) used greatest stack depth: 12464 bytes left
>> [    3.306039] ath11k_pci 0000:00:06.0: Service connect timeout
>> [    3.307588] ath11k_pci 0000:00:06.0: failed to connect to HTT: -110
>> [    3.309286] ath11k_pci 0000:00:06.0: failed to start core: -110
>> [    3.519637] ath11k_pci 0000:00:06.0: firmware crashed: MHI_CB_EE_RDDM
>> [    3.519678] ath11k_pci 0000:00:06.0: ignore reset dev flags 0x4000
>> [    3.627087] ath11k_pci 0000:00:06.0: firmware crashed: MHI_CB_EE_RDDM
>> [    3.627129] ath11k_pci 0000:00:06.0: ignore reset dev flags 0x4000
>> [   13.802105] ath11k_pci 0000:00:06.0: failed to wait wlan mode
>> request (mode 4): -110
>> [   13.802175] ath11k_pci 0000:00:06.0: qmi failed to send wlan mode
>> off: -110
> Ok, that's progress now. Can you try next try the iommu patch[1] we
> talked about earlier? It's already in master-pending branch (along with
> other pending patches) so you can use that branch if you want.
>
> [1] https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/

Same result unfortunately, tried both with just [1] applied to ath.git 
and at HEAD of master-pending.

Thanks,

James



