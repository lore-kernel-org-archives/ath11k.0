Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D637CC46CD2
	for <ath11k@archiver.kernel.org>; Tue, 30 Jan 2024 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1A7lAno5x9C29tGnNasR6WfLx0tGgZFi6+7h8bi5BQ=; b=Ckt2BAtvLIVjZ9e5G0ngfayVlB
	ibSThSHu++yWqqdAnzIAawrSHELqgLIkroClh5N1pbgFPyS1+9aGrjERJ8tutG7gAzCiIh24y+PWq
	9cv8t1/EnwdHTYel6/VinXOUO/cVrIJs1aKJTxGTwFTC8o/N6UYQyrH6tThz/zxbEjojhXhgTvjsx
	l1te6a1uE5OeVb/DzAZ3pZttXxfr6l6i9QLc9uY2Cn55EV0Me9zJCD08CwasyqE3KQQDWekwYsbEd
	KtJg2v5IOFHtB0lZGlLhheiwJaK5iFW+m2SKe/ypOHtjV/ZNEtCBldI39oSLxpWIo2eDKu1iRFtn4
	mGhRDVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnWr-0000000GjIL-1LAE;
	Tue, 30 Jan 2024 12:47:53 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUnWp-0000000GjHW-1HuJ
	for ath11k@lists.infradead.org;
	Tue, 30 Jan 2024 12:47:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so2195595a12.1
        for <ath11k@lists.infradead.org>; Tue, 30 Jan 2024 04:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706618869; x=1707223669; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r1A7lAno5x9C29tGnNasR6WfLx0tGgZFi6+7h8bi5BQ=;
        b=JSoh1cJCjIT5r54mk1aXjMBXAT6vLXzTBHskjvk7ErjoYZYcJ7U5AbcSNMqGzaKptQ
         zApcTD+ubX4CAsOHLb9bXw7RE5TbtvQRjosshGFKwTjf+k5h5dTv1YWkOxqFissRbjMb
         XJS+pTkUE2ROXzPBpjokqWSD5rpM9y191ul72bVIBKlXlmTOPuny1HzhQ50MH2QP7HBt
         m/JHBjCdqkFkF9wVT9Mdb3t87I7YFnvoNr+LTqaLnh7oub/WTdNwogT8GaT40ngjRbC1
         Jq04MBY5KcHx8VJ5uQ3OFFbqg1pdBg9LjLZQ/SLM8PxxLa6G35H4Bm8QKN34Hy0inWhX
         jJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706618869; x=1707223669;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1A7lAno5x9C29tGnNasR6WfLx0tGgZFi6+7h8bi5BQ=;
        b=j4M4ZOxe2/BRwtHQ6eeTTVP1OoVdmRkpByPrXd5NAPK8/Un6q2FzWSLR5jNcGPRk/o
         P50eEkJSss70IMVZynAcL2gGG+0wT/yQGqmzgNUqmc8Kp3wcl/EZY8PwthbGlPrKEf23
         gW8/DB8teB5IDCbptG8B5AAszOgcEcZEIaOpzgzsoqtLkFL/RdIleKv1OSvRkpl0bPeN
         rGpHwyoviJrFfKwdpGioA54ZDcrOiEiumMhMSpu6ax5s2FAYw2eooeDy7xY8VXLymg4h
         kt/bECWukpmAVd4T8K0TsZib8qoeYHDj530A3w6wYURUcj22N8BiiWwT/+TA4xfOyLtQ
         Pq9Q==
X-Gm-Message-State: AOJu0Yx4VHVOZOKSDaQPnyXApBYBx0QciuQXrANUZ/7z5pkbxSebQ5s6
	IeCW9y/u7dT2Edv07co4kWVO+UfAMuaZpLxamNEfN9VgLfM7Lign
X-Google-Smtp-Source: AGHT+IGjmtBVR3GPrHrPAln3egIkNUUaeyzoNHquZBybeWZzhsqy5DN4P34ArZ3nEEbv+mORdz0ciQ==
X-Received: by 2002:a05:6a20:4f1e:b0:19b:e91c:1a42 with SMTP id gi30-20020a056a204f1e00b0019be91c1a42mr4463748pzb.55.1706618869413;
        Tue, 30 Jan 2024 04:47:49 -0800 (PST)
Received: from [192.168.254.83] ([50.39.172.77])
        by smtp.gmail.com with ESMTPSA id j12-20020a17090a31cc00b002868abc0e6dsm11374081pjf.11.2024.01.30.04.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 04:47:48 -0800 (PST)
Message-ID: <1dafe0e5-292b-4764-86c7-cc1757aeb3b6@gmail.com>
Date: Tue, 30 Jan 2024 04:47:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k multicast action frame RX
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org
References: <dcdbd757-ad6e-4fe0-a0c1-fe328431b73b@locusrobotics.com>
 <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
 <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
Cc: James Prestwood <prestwoj@gmail.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_044751_371428_2C42E0B5 
X-CRM114-Status: GOOD (  24.68  )
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

On 1/29/24 11:00 PM, Baochen Qiang wrote:
>
>
> On 1/27/2024 3:18 AM, James Prestwood wrote:
>> On 1/24/24 5:06 AM, James Prestwood wrote:
>>
>>> Hi,
>>>
>>> I recently added support to ath10k, for the QCA6174, to receive 
>>> multicast action frames in order to support DPP. I'm trying to do 
>>> this for the ath11k QCNFA765/WCN6855. I took the same approach as 
>>> ath10k which was actually quite simple but I'm unable to see any 
>>> multicast frames coming over even when I enable RX/DATA debugging.
>>>
>>> What I've done so far is:
>>>
>>>  - Add FIF_MCAST_ACTION to the supported filters list
>>>
>>>  - Created/started a monitor vdev from within 
>>> ath11k_mac_op_configure_filter()
>>>
>>>     ath11k_mac_monitor_vdev_create(ar);
>>>
>>>     ath11k_mac_monitor_start(ar);
>>>
>>> - Also tried adding
>>>
>>>     ath11k_mac_config_mon_status_default(ar, true);
>>>
>>> I can successfully create/start the monitor vdev. I see now as I'm 
>>> writing this email that my specific hardware does not support 
>>> monitor mode outright... Is this a dead end or is there hope with 
>>> purely driver changes? or is it some filtering at the firmware level 
>>> preventing this?
>>
>> I was able to finally see my broadcast frame after some additional 
>> testing. It seems the driver/firmware/something gets a bit hung up 
>> when I attempt to put it in monitor mode. It will start printing 
>> these messages for about a minute:
>>
>> [   51.093034] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id 
>> a1a2 != status ppdu_id a1a1 dest_mon_not_reaped = 650 dest_mon_stuck 
>> = 12
>> [   51.094461] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id 
>> a1a3 != status ppdu_id a1a2 dest_mon_not_reaped = 651 dest_mon_stuck 
>> = 12
>> [   51.096281] ath11k_pci 0000:00:06.0: data dest_rx: new ppdu_id 
>> a1a5 != status ppdu_id a1a3 dest_mon_not_reaped = 652 dest_mon_stuck 
>> = 12
>>
>> In most cases these ppdu ID's are a one-off from the expected ID 
>> which seemed weird to me. But if I let it sit long enough I all of a 
>> sudden get a ton of "data rx" messages, which is what I would expect 
>> if I enabled a monitor vdev. Once this flurry starts I see the action 
>> frame from my other client, sometimes at least. The firmware 
>> generally crashes after a while so I've still got a ways to go but it 
>> seems within the realm of possibility that this device could receive 
>> broadcast action frames?
>>
>> Hoping for some breadcrumbs to follow here...
>>
> Hi James, as you already mentioned, ath11k/WCN6855 doesn't support 
> monitor mode yet. I don't know why you are testing multicast action 
> frame with monitor mode. So if monitor mode is not a must, could you 
> test this with STATION mode? We would look into this if any issue found.

As you may have guessed I don't _really_ know what I'm doing. When I got 
this working with ath10k I saw monitor device was being used in order to 
receive probes, and did the same for multicast action frames and it 
"just worked". The frames themselves were still being received on the 
station device. I attempted to mimic the changes with ath11k.

The end goal here is just that, be able to receive multicast action 
frames on the station device which currently does not work. I'm only 
seeing unicast frames when i enable RX debugging. The driver support for 
multicast action RX in the kernel for this is basically zero. An 
extended feature flag was added by Jouni when he added support to ath9k, 
I added limited ath10k support for a variant I tested, and I'd like to 
do the same for ath11k as we are transitioning to the WCN6855.

And help is much appreciated, and I'm happy to put in the work its just 
a steep learning curve coupled with the fact that any FW level 
communication is proprietary. I really just need a nudge in the right 
direction.

Thanks,

James

>
>> Thanks,
>>
>> James
>>
>>>
>>> Thanks,
>>>
>>> James
>>>
>>>
>

