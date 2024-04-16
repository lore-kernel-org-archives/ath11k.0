Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A91CC4345F
	for <ath11k@archiver.kernel.org>; Tue, 16 Apr 2024 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbLGwITuEtblOKj7PN81xTUn9EbuXq4z1YxI7bfyEy0=; b=ApS0OWCCGjM8nmUkOCEV5hTKyz
	Nx18QdVxYjgVliV2l+BLO8bg/jfgjOX491xxWbpHoQ5wZWQWZC4zxrp32W0dJSsrbOKZabnaaic+U
	v2jZf8uaCIX2deJkwzP9HZ3Vjmuw4NzgA0ec724GT50nPOs7Twy1q+ZB18bcrnUxkwJ/MB85gT1GI
	sInj1pQwlshpn1lcUZbpnkQqeHkIWAQuREAHTSNMgx+3SSN3qKECdRh4bMwf35X21MGzTHPb3u+X7
	sWIsF9JYe+s7zfPwNFQ7QMw43aM7DElfMrxlvaNUkSbl1TUNmI91Mnk9ALl1N0y4cpbavd2yrM/R/
	tFs91s1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwiGd-0000000CBji-1qZ1;
	Tue, 16 Apr 2024 12:50:31 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwiGZ-0000000CBj9-3af9
	for ath11k@lists.infradead.org;
	Tue, 16 Apr 2024 12:50:29 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-78ee82e7062so140993785a.3
        for <ath11k@lists.infradead.org>; Tue, 16 Apr 2024 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713271825; x=1713876625; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbLGwITuEtblOKj7PN81xTUn9EbuXq4z1YxI7bfyEy0=;
        b=VvXRWngzEXXtXGrZMls2YrLPe1UJhu7T6xJtMM7nPo+IYv5W6pRl0jJhwn/TUN5rWw
         fBHtmVoZJfx1HyTiL2BnhFiqsEbyOfoa3Ssp2inmDyHP9wsM3zM3u2RRnZYnTQZksoC+
         n/FDOjl0WzlgO+b9YFp8NhgApX6IFmL2SpiEBcT+olgwKOXUckoTjdwohoMcvUzRXXFY
         xBUHpV2/GSASQ+nLwvUCH9a8wU7zYeL9Qvl6xXveMMgb8k8PxoTaeKL69IY8DwkjJk5M
         eY/eZ54G1yyI+0J0OP9nccKDHsGFxYVVVwkGzR6dfQNbzHgYlc49dO4BPrNf3drSfkU7
         YAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713271825; x=1713876625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbLGwITuEtblOKj7PN81xTUn9EbuXq4z1YxI7bfyEy0=;
        b=s97MEQYjL/z170JlrYPXEmKEilTfm/Bs4kPse3JuEt1XHqYrw2HBds3Uiqxu9xr2pL
         XDXRwUUadT2wbmrLVTPOfp2qUbfSTMIqoPkGcfK8k/+EYfoQr+TRh1EMN3ZvH3fJsROR
         GWgeXWKN91rCEFgyVntUyFau/KFWSCuTGmdO4F9gUyyDOm1D+ADtA4OcJ41eCo4tgTw5
         hZ+7VI3i5q7BhVUY9Uf7AdTgqsKRhYy0dARz8aoUck2ubWGa2XarnZT1GF9w5rbI7nl+
         8D91s+u8cdagUYJ0ga6Fn1CWXGjDxwJ+WaM08wGZBjNP8ylfrcBgZSEG3lhA1C3tg6EG
         2ohQ==
X-Gm-Message-State: AOJu0Yxp5haIPVml/KX/cTu1nmB015pEsd9jtpQTa+bghmG2K9T3JDQ0
	DizSmTs1xqzzXG8C+hnGOWVcIAw9fhzG/NjT6/mjXhDhmN65NZ60
X-Google-Smtp-Source: AGHT+IFJKKC9Ww9D6e212WG1c66Tea5jJjCW/EvP9ATviThjFFhz9pX7/bogm/nLARbPSo9CVHaCRw==
X-Received: by 2002:a05:620a:1a04:b0:78d:777e:bc11 with SMTP id bk4-20020a05620a1a0400b0078d777ebc11mr16867267qkb.38.1713271824600;
        Tue, 16 Apr 2024 05:50:24 -0700 (PDT)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id bk37-20020a05620a1a2500b0078d6b2b6fdbsm7458352qkb.133.2024.04.16.05.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 05:50:24 -0700 (PDT)
Message-ID: <d9788e11-b804-42a1-8074-3646e01d8d4d@gmail.com>
Date: Tue, 16 Apr 2024 05:50:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k failed to enqueue rx buf: -28
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com>
 <216b223b-e871-42d4-8e53-59dd64efe4b9@quicinc.com>
 <6e8fe8cf-315c-47bb-b8db-5b17f7323109@quicinc.com>
 <347dce6b-94c6-4aa3-89ef-25525b4e72db@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <347dce6b-94c6-4aa3-89ef-25525b4e72db@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_055027_923222_F841DE69 
X-CRM114-Status: GOOD (  14.83  )
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


On 4/11/24 1:00 AM, Baochen Qiang wrote:
>
>
> On 4/1/2024 11:30 AM, Baochen Qiang wrote:
>>
>>
>> On 3/30/2024 2:39 AM, Jeff Johnson wrote:
>>> On 3/27/2024 9:25 AM, James Prestwood wrote:
>>>> Hi,
>>>>
>>>> This error was brought to my attention in the kernel logs and I'm
>>>> wondering if it is of any concern:
>>>>
>>>> kernel: ath11k_pci 0000:03:00.0: failed to enqueue rx buf: -28
>>>>
>>>> It seems to happen every few minutes or so. I don't notice any bad
>>>> behavior associated with it per-se, but maybe its an issue of some
>>>> buffer needing to be increased in size? Does this mean a frame is 
>>>> being
>>>> dropped due to no room to receive it?
>>>>
>>>> Hardware we are running is:
>>>>
>>>> [    4.610399] ath11k_pci 0000:03:00.0: wcn6855 hw2.1
>>>> [    5.777030] ath11k_pci 0000:03:00.0: chip_id 0x12 chip_family 0xb
>>>> board_id 0xff soc_id 0x400c1211
>>>> [    5.777039] ath11k_pci 0000:03:00.0: fw_version 0x1109996e
>>>> fw_build_timestamp 2023-12-19 11:11 fw_build_id
>>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.36
>>>>
>>>> Thanks,
>>>>
>>>> James
> Hi James, I was not able to reproduce this issue so wondering if you 
> could help reproduce and collect logs for debug. If OK please first 
> merge the debug patch which is available in patchwork:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20240411074812.86700-1-quic_bqiang@quicinc.com/ 
>
>
> Please also enable full ath11k log:
>     modprobe ath11k debug_mask=0xffffffff
>     modprobe ath11k_pci
>
> Once enabled you should see lots of ath11k logs.
Thank you for looking at this. I'll get these changes in to test but it 
may take me some time.
>
>>>>
>>>>
>>>
>>> + ath11k list to get more specific eyes on this issue
>>> + bcc to internal list as well
>>>
>> I will look into this.
>>>

