Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BABFC3DA59
	for <ath11k@archiver.kernel.org>; Mon, 22 Jul 2024 19:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6s3wWqOZtpEVgXLSBWbU5EfnxGRL76gFc48fTCghN8=; b=IfXPlNdMAxBhMQ9uzTcGl9sXB2
	oXunuALr5PBNkQha9DONPXk3zXngWE9YwXGuA1giYfqRTNehePVJJ1eTMe6fXMKrx71oZtEvbsx0S
	hRHIqAt8uo6GIqc0ZLUvGe8hS48ZwiBV/k2qwtJ2UgR9a/FOcCD7SmQOU7ACDKrvigNDr4nEaD5OZ
	nNdrCX6klvAUNNU9oF4aWDCtpwFZ/T5AvfJq0r6vBXOpGIn3GltWawxNK22dZd3TK/jad9zXawl5C
	h2r4E3+SNiSZE+CYbgy9+6FRJl8hqIuOxX0YNz7HSgRlz3OZy9Va3aEFOiFKjf/3p0bnjT/Zj9Aui
	PEp43VLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVyhg-0000000AODX-3hRj;
	Mon, 22 Jul 2024 19:28:12 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVyhd-0000000AOCz-2oZg
	for ath11k@lists.infradead.org;
	Mon, 22 Jul 2024 19:28:11 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-79f190d8ebfso315403085a.3
        for <ath11k@lists.infradead.org>; Mon, 22 Jul 2024 12:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721676488; x=1722281288; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C6s3wWqOZtpEVgXLSBWbU5EfnxGRL76gFc48fTCghN8=;
        b=NGTGgyPQ399I1mV6OXTnIftcuftjsejpFqYSV5VwAQMFsYSvQQSNc9DD7BPOBfXlca
         deVRFQa1resPyRlu4iCgIhu+2maP4BugLlEENrOJ0p7V5f6zHI1WHO/0gCuuVaaL8XeF
         b0vrhQfA5WmOM9R4FbMlxBiNizRJ8J9OM38Ckj1QXpPx1RrO7hMzjRthiU/XhvvQBvOu
         7ck4Tsy4JdWfqL0WuNW24QmabvKGZp6YSKSALEcf4RQshZgIS1Q12CkHskhD6AeLGKVV
         WpmedYR5l/QE5siwQPFvGGubv4QDx7n8gLtIJ1zqIh92Rp0Bb/XXH1CXCH0lb9KnwAIu
         2FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721676488; x=1722281288;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6s3wWqOZtpEVgXLSBWbU5EfnxGRL76gFc48fTCghN8=;
        b=ae2yS/hvVm9T2dbUL9w50y4CiClFgwdxO9q80VGHcB0Ojq89Rb8w8US8bz8U7ohXm6
         WdrLM9j78YvcL8o6lcU+VpO3aXFsrqlsHQRrlm3GUv84L7oW1svqIdJ5Yz/Sx656eUCv
         N+7wHQRmgBBCVPBYPz1vygcPNugvs8fa1SShKq1ynLgZvj66bu0d0evyp1MMz/N4b8hg
         Raago1cZ+pANtSNL3uwQEhBvvDDBa0BWWt5SjQf5lir82OA5PCpnuvn7bsBl4pD+bnMX
         CIj8cK3dlF637NDQHbmTY9pG1Vmvw2nzX0Hh3nAPwS22M4CBfzUytPA4goZviGBL4o0h
         YGug==
X-Gm-Message-State: AOJu0YyNMl3FODpvORJVeLc21fF6QMsqxw+fEGsFxW3ukMN94albPsC/
	IAWbPkyu5HIvH24JZtoKzYO9j7OlmrU1Fi/tCZcr9rnV8EKukZvm
X-Google-Smtp-Source: AGHT+IE+REJU4tj3eLbpjGs3VEZ0vY6/I1jdPxro3tXhs+eIRy20XIs8wb1+p/Ae2UTgcj9WwHIQEw==
X-Received: by 2002:a05:620a:40c2:b0:79f:181e:3c58 with SMTP id af79cd13be357-7a1a1343fe9mr1095159585a.42.1721676487838;
        Mon, 22 Jul 2024 12:28:07 -0700 (PDT)
Received: from [10.100.121.195] ([50.170.153.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a198fba365sm391277085a.28.2024.07.22.12.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 12:28:07 -0700 (PDT)
Message-ID: <70365e83-72c6-476b-bd9a-33f7ea3c8a31@gmail.com>
Date: Mon, 22 Jul 2024 12:28:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k failed to enqueue rx buf: -28
From: James Prestwood <prestwoj@gmail.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com>
 <216b223b-e871-42d4-8e53-59dd64efe4b9@quicinc.com>
 <6e8fe8cf-315c-47bb-b8db-5b17f7323109@quicinc.com>
 <347dce6b-94c6-4aa3-89ef-25525b4e72db@quicinc.com>
 <d9788e11-b804-42a1-8074-3646e01d8d4d@gmail.com>
Content-Language: en-US
In-Reply-To: <d9788e11-b804-42a1-8074-3646e01d8d4d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_122809_737261_7062815E 
X-CRM114-Status: GOOD (  18.12  )
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

Hi Baochen,

On 4/16/24 5:50 AM, James Prestwood wrote:
>
> On 4/11/24 1:00 AM, Baochen Qiang wrote:
>>
>>
>> On 4/1/2024 11:30 AM, Baochen Qiang wrote:
>>>
>>>
>>> On 3/30/2024 2:39 AM, Jeff Johnson wrote:
>>>> On 3/27/2024 9:25 AM, James Prestwood wrote:
>>>>> Hi,
>>>>>
>>>>> This error was brought to my attention in the kernel logs and I'm
>>>>> wondering if it is of any concern:
>>>>>
>>>>> kernel: ath11k_pci 0000:03:00.0: failed to enqueue rx buf: -28
>>>>>
>>>>> It seems to happen every few minutes or so. I don't notice any bad
>>>>> behavior associated with it per-se, but maybe its an issue of some
>>>>> buffer needing to be increased in size? Does this mean a frame is 
>>>>> being
>>>>> dropped due to no room to receive it?
>>>>>
>>>>> Hardware we are running is:
>>>>>
>>>>> [    4.610399] ath11k_pci 0000:03:00.0: wcn6855 hw2.1
>>>>> [    5.777030] ath11k_pci 0000:03:00.0: chip_id 0x12 chip_family 0xb
>>>>> board_id 0xff soc_id 0x400c1211
>>>>> [    5.777039] ath11k_pci 0000:03:00.0: fw_version 0x1109996e
>>>>> fw_build_timestamp 2023-12-19 11:11 fw_build_id
>>>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.36
>>>>>
>>>>> Thanks,
>>>>>
>>>>> James
>> Hi James, I was not able to reproduce this issue so wondering if you 
>> could help reproduce and collect logs for debug. If OK please first 
>> merge the debug patch which is available in patchwork:
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20240411074812.86700-1-quic_bqiang@quicinc.com/ 
>>
>>
>> Please also enable full ath11k log:
>>     modprobe ath11k debug_mask=0xffffffff
>>     modprobe ath11k_pci
>>
>> Once enabled you should see lots of ath11k logs.
> Thank you for looking at this. I'll get these changes in to test but 
> it may take me some time.

I did get these debugging changes onto a client to test but had to 
modify them twice now due to a massive amount of logs associated with a 
few of the prints. The first iteration was using an info print in quite 
a hot path resulting in the logs filling up with:

kernel: ath11k_pci 0000:02:00.0: ath11k_ce_completed_recv_next: pipe 2 
rx_buf_needed 1
kernel: ath11k_pci 0000:02:00.0: ath11k_ce_rx_buf_enqueue_pipe: pipe 2 
rx_buf_needed 0

I then downgraded that to a dbg print, rebuilt, and now I'm seeing tons 
of these:

kernel: ath11k_pci 0000:03:00.0: dst get next entry failed
kernel: ath11k_pci 0000:03:00.0: dst get next entry failed
kernel: ath11k_pci 0000:03:00.0: dst get next entry failed
kernel: ath11k_warn: 367 callbacks suppressed

I have downgraded the "dst get next entry failed" to a debug print as 
well. Just to get a baseline and see if the "failed to enqueue rx buf" 
message is even happening anymore. I may need some more guidance here 
because I don't think I'll be able to enable any kind of debugging 
without the kernel logs filling up immediately. It may be difficult to 
even see the "failed to enqueue rx buf" failure with a debug mask of 
0xffffffff and the changes you suggested.

Is "dst get next entry failed" anything to worry about?

Thanks,

James

>>
>>>>>
>>>>>
>>>>
>>>> + ath11k list to get more specific eyes on this issue
>>>> + bcc to internal list as well
>>>>
>>> I will look into this.
>>>>

