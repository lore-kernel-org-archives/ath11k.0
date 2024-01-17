Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C7C47258
	for <ath11k@archiver.kernel.org>; Wed, 17 Jan 2024 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ayacpk0mYFVAI8Zmor+mj51uWH17gR3u7QFZfKXaCao=; b=gZ5SX+7nwp1p/ehn3Yd1eU0EEz
	hWDAgAl+w6ov6I+49OpXs3GFn0HXrre/n9rCKwvjFAKP2QrjafJ+V/1GCjnjeW6+YRWIfWdva230r
	RzhwnX8lJPc/STb0RlO8pa68cLNoLejdPQzVbNGY64vkJhnOix1xppROChlX3w0Xcf2mz/hwQYjQr
	Y9MGZ7gefFR30ng772ppsGcrzee6WfhFaLpDPypCMjKLRdN2cgau47DRF/2ZgcIlvq2D05Tp8UBl7
	ZWMgpEHwpo+l4lZdM0GfFoTFwdEDdIBX7OcIXedyz7uTPWAYpRIKuOxi0a2gdiUB6kfjXN/bcJtlf
	sbfGawbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5qN-00GQTh-2j;
	Wed, 17 Jan 2024 13:20:36 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ5qJ-00GQNX-2r
	for ath11k@lists.infradead.org;
	Wed, 17 Jan 2024 13:20:33 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-68174626bb9so10712496d6.3
        for <ath11k@lists.infradead.org>; Wed, 17 Jan 2024 05:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705497626; x=1706102426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ayacpk0mYFVAI8Zmor+mj51uWH17gR3u7QFZfKXaCao=;
        b=bnJ3pyvcaAbML+4ErGg5MxWy1f4mrS01qjYpZVd1J+fyiiCSqvVPe7oO8PtcVjbAU5
         xjmZP8viM0nR3WpEoApV+XfagWl+k3LoNUQ0xTmy38RU8hWUgQhGvSpoHPthsMa8JODX
         gVhLUFZOcYhIp7oEMxBjWrXGqzgRhFyWV5b9iy4P6xg4Bd+vo7/LC63/VppeANw8zPs/
         tF93tebQsznQZwqpZwCSnIemysKnLdMi9R0RwvL6McNQCvI79GqTUjfWknXjNS0Ee+ak
         eMsSGCxDcHJ6I7QOH0MjJIl96kc1/EodIhP5oTCA/L4RG12NjtetoZTPvW9ZETWLzx+z
         K9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705497626; x=1706102426;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayacpk0mYFVAI8Zmor+mj51uWH17gR3u7QFZfKXaCao=;
        b=Y15H8LmqaKLSMEdGscR5Xrpt0nTsv+QfO9KUYRvWXTjRSrYYvhMORa/jnWPyZ/582S
         VmYVZtSl0xVKBLYuN84Z3GJ4emxTKmBbWU8DGT7l7saig3HAR43DFV0Lec4mKhMLkfo4
         LJM8l7HbkSIi6gwZV83xOIQWz/RRovLiyRP/qaXbeEYp7+5NCLxBc1FimSS5xM2C6a1E
         FIIqPbQAC6CpwyQTkVuHcJVimmD+7dved+Eetbk7K98WNV7hsop6VRJwlpjALfhr//ow
         OpcBRkyWlQUwnIAXIWwcNpGEeV16O0zIpbcNVLRMY+dYdidoNqG1iSs8qb2tea/YrEF0
         24Bw==
X-Gm-Message-State: AOJu0Yy7vGPDaTuM2siMXfC1Ro6mKP1jT971eoCHP/v/mJghaFlSTDxa
	KA6jfwONaPZ8bXGqY9zd8zo=
X-Google-Smtp-Source: AGHT+IEaJK5Q6fRGT5r0up1X7hjzPl1BKX4+mHAJ/6UQ4kh4T+61U6WyhpQLyAEDalAyUPCYfKmy1g==
X-Received: by 2002:a05:6214:230f:b0:681:2640:3c17 with SMTP id gc15-20020a056214230f00b0068126403c17mr12740581qvb.55.1705497626436;
        Wed, 17 Jan 2024 05:20:26 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id ee14-20020a0562140a4e00b0067f64c06bcesm4979071qvb.102.2024.01.17.05.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 05:20:25 -0800 (PST)
Message-ID: <cdec259a-b779-4856-8585-f285179e3671@gmail.com>
Date: Wed, 17 Jan 2024 05:20:24 -0800
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
 <4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
 <3d22a730-aee5-4f2a-9ddc-b4b5bd4d62fe@quicinc.com>
 <ee0280fd-032c-4f45-a3f9-50d96d8bed6d@gmail.com>
 <16cfd010-b62d-4385-92d1-002820a8db38@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <16cfd010-b62d-4385-92d1-002820a8db38@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_052032_141876_72ADD092 
X-CRM114-Status: GOOD (  17.63  )
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

<snip>

>>>
>>> While I don't think there is a way for qemu/ath11k to get the real 
>>> MSI vector from host, I will try to read the vfio code to check 
>>> further. Before that, to unblock you, a possible hack is to hard 
>>> code the MSI vector in qemu to the same as in host, on condition 
>>> that the MSI vector doesn't change. In my case, the change looks like
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/pci.c 
>>> b/drivers/net/wireless/ath/ath11k/pci.c
>>> index 09e65c5e55c4..89a9bbe9e4d2 100644
>>> --- a/drivers/net/wireless/ath/ath11k/pci.c
>>> +++ b/drivers/net/wireless/ath/ath11k/pci.c
>>> @@ -459,7 +459,12 @@ static int ath11k_pci_alloc_msi(struct 
>>> ath11k_pci *ab_pci)
>>>                 ab->pci.msi.addr_hi = 0;
>>>         }
>>>
>>> -       ath11k_dbg(ab, ATH11K_DBG_PCI, "msi base data is %d\n", 
>>> ab->pci.msi.ep_base_data);
>>> +       ab->pci.msi.addr_hi = 0;
>>> +       ab->pci.msi.addr_lo = 0xfee00578;
>>> +       ath11k_dbg(ab, ATH11K_DBG_PCI, "msi addr hi 0x%x lo 0x%x 
>>> base data is %d\n",
>>> +                  ab->pci.msi.addr_hi,
>>> +                  ab->pci.msi.addr_lo,
>>> +                  ab->pci.msi.ep_base_data);
>>>
>>>         return 0;
>>>
>>> @@ -487,6 +492,7 @@ static int ath11k_pci_config_msi_data(struct 
>>> ath11k_pci *ab_pci)
>>>         }
>>>
>>>         ab_pci->ab->pci.msi.ep_base_data = msi_desc->msg.data;
>>> +       ab_pci->ab->pci.msi.ep_base_data = 0;
>>>
>>>         ath11k_dbg(ab_pci->ab, ATH11K_DBG_PCI, "after request_irq 
>>> msi_ep_base_data %d\n",
>>>                    ab_pci->ab->pci.msi.ep_base_data);
>>>
>>>
>>> This hack works on my setup.
>>
>> Progress! Thank you. This didn't work for me but its likely because 
>> my host MSI vector is not fee00578. Where did you come up with this 
>> value? 
> It could, and most likely, be different from machine to machine.
>
>> I don't see anything in the dmesg logs, or in lspci etc.
>>
> fee00578 is the physical MSI vector so I got it using lspci in host, see
> ...
>         Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit-
>                 Address: fee00578  Data: 0000
>                 Masking: fffffffe  Pending: 00000000
> ...

Mine looks like this:

...

     Capabilities: [50] MSI: Enable- Count=1/32 Maskable+ 64bit-
         Address: 00000000  Data: 0000
         Masking: 00000000  Pending: 00000000
...

I've adjusted the patch:

diff --git a/drivers/net/wireless/ath/ath11k/pci.c 
b/drivers/net/wireless/ath/ath11k/pci.c
index 09e65c5e55..1cc7115582 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -459,7 +459,12 @@ static int ath11k_pci_alloc_msi(struct ath11k_pci 
*ab_pci)
                 ab->pci.msi.addr_hi = 0;
         }

-       ath11k_dbg(ab, ATH11K_DBG_PCI, "msi base data is %d\n", 
ab->pci.msi.ep_base_data);
+        ab->pci.msi.addr_hi = 0;
+        ab->pci.msi.addr_lo = 0;
+        ath11k_dbg(ab, ATH11K_DBG_PCI, "msi addr hi 0x%x lo 0x%x base 
data is %d\n",
+                   ab->pci.msi.addr_hi,
+                   ab->pci.msi.addr_lo,
+                   ab->pci.msi.ep_base_data);

         return 0;

@@ -487,6 +492,7 @@ static int ath11k_pci_config_msi_data(struct 
ath11k_pci *ab_pci)
         }

         ab_pci->ab->pci.msi.ep_base_data = msi_desc->msg.data;
+       ab_pci->ab->pci.msi.ep_base_data = 0;

         ath11k_dbg(ab_pci->ab, ATH11K_DBG_PCI, "after request_irq 
msi_ep_base_data %d\n",
                    ab_pci->ab->pci.msi.ep_base_data);

But still getting the same errors:

[    3.563057] ath11k_pci 0000:00:06.0: Service connect timeout
[    3.565044] ath11k_pci 0000:00:06.0: failed to connect to HTT: -110
[    3.567031] ath11k_pci 0000:00:06.0: failed to start core: -110
[    3.777514] ath11k_pci 0000:00:06.0: firmware crashed: MHI_CB_EE_RDDM
[    3.777555] ath11k_pci 0000:00:06.0: ignore reset dev flags 0x4000
[    3.885137] ath11k_pci 0000:00:06.0: firmware crashed: MHI_CB_EE_RDDM
[    3.885178] ath11k_pci 0000:00:06.0: ignore reset dev flags 0x4000

I know this isn't a proper fix, so if its something that needs more 
thought than just hard-coded values I understand.

Thanks,

James

>
>> Thanks,
>>
>> James
>>

