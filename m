Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E1BC4706C
	for <ath11k@archiver.kernel.org>; Fri, 12 Jan 2024 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7g4YqR/zubrO9qNwlFhZX3vRqYIObUAIcfTlTohn9o=; b=iG6JAdENCJJYd59NxKOCCZ+/GY
	fAEXMbPYIZbYixL+XVKiVpVsMUGljpRAh0VgvNoJr/7E8ik+9TsE7Z6oOKz49sGu5DtT5oLWsUL9X
	0FB46Frz9SqI+YU8mMwPHZgUUJXQMuewxjFm88bhRBqZihaw7E6aaoopEYciAltfHgiAgLoAd+2av
	UDbE8SxZWcWDGd6gEffeZV3lhYkEKKKOMeinDbIkv2mkrkkqEc4zcBQbeyMoz7A92x+2/FOitiCHG
	80i82BnBhA8PLoV2+qG4SwXGFxDsty/Xiz6kD/9JywHGS0lRULfmA42fkRqi+JoFYzTYUVGVsB0ga
	2WvoT6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGwL-002r3F-2L;
	Fri, 12 Jan 2024 12:47:13 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGwJ-002r2b-0u
	for ath11k@lists.infradead.org;
	Fri, 12 Jan 2024 12:47:13 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-680496bc3aaso34812986d6.0
        for <ath11k@lists.infradead.org>; Fri, 12 Jan 2024 04:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705063627; x=1705668427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7g4YqR/zubrO9qNwlFhZX3vRqYIObUAIcfTlTohn9o=;
        b=c9Kzhiu3YohqFFf4p/brx/P2v0QCLghLiW0nUnTFdxpoqJFIZyjxEQpLx7taD4l9bL
         +3AIdubdGrMhao9B+k7KAs/k63UZwHyzan2sydyh5ZbZeWeNZO5L7zdq/JLezSDC3q5a
         RuvqlLeUvoQ8V7JYPlFPJk15H0R38FNOSkYoIuP77XRaxvXsgV/lxLbD8NwhRKGd6ibY
         /8afP40krW0WjlljLutrD2jXykMZ8RDiZNzdbrmqVsraobC8yGBadQO8C06TL80ksU54
         kK2Wvw6/BVjbU7NlG42UFqHDOl51+EJ5w1zZ8dGaihPbQiRgUePuLJ+ZIvzEwiaeeI9X
         2BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705063627; x=1705668427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7g4YqR/zubrO9qNwlFhZX3vRqYIObUAIcfTlTohn9o=;
        b=CV1fXyCgm6RENEIfR9Pod+r5c9+PBT+M92E7RPMzafdHgC/4eH9Mug2Trd7hrEopRS
         HO8zgUyEym0216deAc6cn0om2PVa4hsBhFVzegPzdYCQkKoiNn8Y1ByMYzSGW6tMC4Kl
         AlEw8Y9JQznyR47//dzgVCwYrjOhnhhS9tc4+qtXn7hBqyxL2AEg0Tnbqz5VwsV380zD
         cZ6JrS4llrHrKPVLaqscCfHazlgz9M/TTOuhpCs44AUaWOwrBJSpE8JKwDRwLHMmbARs
         S78quVg+PPEDN3bmDSa6C2X/TFkM/xJaHnuiQULttllUR9Ui/CE5WIZ7cybntDLsmZjt
         bl3Q==
X-Gm-Message-State: AOJu0Ywu+72D17+rzjNGpi+rMM4a6FXapPBBNC7R9AuzyUcqJIkiay2Y
	a1+qOL4Qicr/c2gl3b4sz/Y=
X-Google-Smtp-Source: AGHT+IHWE64FifTd2MSsza7siBMGznvOgRD4Gjciqy6we/h3XrIgnNa6dLIcQUbiyPjFJRgJ4CvkLA==
X-Received: by 2002:a05:6214:29c3:b0:681:1977:c048 with SMTP id gh3-20020a05621429c300b006811977c048mr844699qvb.58.1705063627336;
        Fri, 12 Jan 2024 04:47:07 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id ei19-20020ad45a13000000b006805bd3058asm1018606qvb.75.2024.01.12.04.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 04:47:06 -0800 (PST)
Message-ID: <4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
Date: Fri, 12 Jan 2024 04:47:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <8734v5zhol.fsf@kernel.org> <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
 <87r0ipcn7j.fsf@kernel.org> <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
 <26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
 <87mstccmk6.fsf@kernel.org> <df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
 <8734v4auc4.fsf@kernel.org> <e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
 <285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_044711_324570_F841A59D 
X-CRM114-Status: GOOD (  24.39  )
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

Hi,

On 1/11/24 6:04 PM, Baochen Qiang wrote:
>
>
> On 1/11/2024 9:38 PM, James Prestwood wrote:
>>
>> On 1/11/24 5:11 AM, Kalle Valo wrote:
>>> James Prestwood <prestwoj@gmail.com> writes:
>>>
>>>> Hi Kalle, Baochen,
>>>>
>>>> On 1/11/24 12:16 AM, Kalle Valo wrote:
>>>>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>>>>>
>>>>>> On 1/10/2024 10:55 PM, James Prestwood wrote:
>>>>>>> Hi Kalle,
>>>>>>> On 1/10/24 5:49 AM, Kalle Valo wrote:
>>>>>>>> James Prestwood <prestwoj@gmail.com> writes:
>>>>>>>>
>>>>>>>>>> But I have also no idea what is causing this, I guess we are 
>>>>>>>>>> doing
>>>>>>>>>> something wrong with the PCI communication? That reminds me, 
>>>>>>>>>> you could
>>>>>>>>>> try this in case that helps:
>>>>>>>>>>
>>>>>>>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/ 
>>>>>>>>>>
>>>>>>>>> Heh, I saw this pop up a day after I sent this and was 
>>>>>>>>> wondering. Is
>>>>>>>>> this something I'd need on the host kernel, guest, or both?
>>>>>>>> On the guest where ath11k is running. I'm not optimistic that 
>>>>>>>> this would
>>>>>>>> solve your issue, I suspect there can be also other bugs, but 
>>>>>>>> good to
>>>>>>>> know if the patch changes anything.
>>>>>>> Looks the same here, didn't seem to change anything based on the
>>>>>>> kernel logs.
>>>>>>>
>>>>>> Could you try this?
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath11k/pci.c?id=39564b475ac5a589e6c22c43a08cbd283c295d2c 
>>>>>>
>>>>> This reminds me, I assumed James was testing with ath.git master 
>>>>> branch
>>>>> (which has that commit) but I never checked that. So for testing 
>>>>> please
>>>>> always use the master branch to get the latest and greatest ath11k:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
>>>>>
>>>>> There's a quite long delay from ath.git to official releases.
>>>> Good to know, and I was not in fact using that branch. Rebuilt from
>>>> ath.git/master but still roughly the same behavior. There does appear
>>>> to be more output now though, specifically a firmware crash:
>>>>
>>>> [    2.281721] ath11k_pci 0000:00:06.0: failed to receive control
>>>> response completion, polling..
>>>> [    2.282101] ip (65) used greatest stack depth: 12464 bytes left
>>>> [    3.306039] ath11k_pci 0000:00:06.0: Service connect timeout
>>>> [    3.307588] ath11k_pci 0000:00:06.0: failed to connect to HTT: -110
>>>> [    3.309286] ath11k_pci 0000:00:06.0: failed to start core: -110
>>>> [    3.519637] ath11k_pci 0000:00:06.0: firmware crashed: 
>>>> MHI_CB_EE_RDDM
>>>> [    3.519678] ath11k_pci 0000:00:06.0: ignore reset dev flags 0x4000
>>>> [    3.627087] ath11k_pci 0000:00:06.0: firmware crashed: 
>>>> MHI_CB_EE_RDDM
>>>> [    3.627129] ath11k_pci 0000:00:06.0: ignore reset dev flags 0x4000
>>>> [   13.802105] ath11k_pci 0000:00:06.0: failed to wait wlan mode
>>>> request (mode 4): -110
>>>> [   13.802175] ath11k_pci 0000:00:06.0: qmi failed to send wlan mode
>>>> off: -110
>>> Ok, that's progress now. Can you try next try the iommu patch[1] we
>>> talked about earlier? It's already in master-pending branch (along with
>>> other pending patches) so you can use that branch if you want.
>>>
>>> [1] 
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/
>>
>> Same result unfortunately, tried both with just [1] applied to 
>> ath.git and at HEAD of master-pending.
>>
>> Thanks,
>>
>> James
> Strange that still fails. Are you now seeing this error in your host 
> or your Qemu? or both?
> Could you share your test steps? And if you can share please be as 
> detailed as possible since I'm not familiar with passing WLAN hardware 
> to a VM using vfio-pci.

Just in Qemu, the hardware works fine on my host machine.

I basically follow this guide to set it up, its written in the context 
of GPUs/libvirt but the host setup is exactly the same. By no means do 
you need to read it all, once you set the vfio-pci.ids and see your 
unclaimed adapter you can stop:

https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF

In short you should be able to set the following host kernel options and 
reboot (assuming your motherboard/hardware is compatible):

intel_iommu=on iommu=pt vfio-pci.ids=17cb:1103

Obviously change the device/vendor IDs to whatever ath11k hw you have. 
Once the host is rebooted you should see your wlan adapter as UNCLAIMED, 
showing the driver in use as vfio-pci. If not, its likely your 
motherboard just isn't compatible, the device has to be in its own IOMMU 
group (you could try switching PCI ports if this is the case).

I then build a "kvm_guest.config" kernel with the driver/firmware for 
ath11k and boot into that with the following Qemu options:

-enable-kvm -device -vfio-pci,host=<PCI address>

If it seems easier you could also utilize IWD's test-runner which 
handles launching the Qemu kernel automatically, detecting any 
vfio-devices and passes them through and mounts some useful host folders 
into the VM. Its actually a very good general purpose tool for kernel 
testing, not just for IWD:

https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/doc/test-runner.txt

Once set up you can just run test-runner with a few flags and you'll 
boot into a shell:

./tools/test-runner -k <kernel-image> --hw --start /bin/bash

Please reach out if you have questions, thanks for looking into this.


