Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D7DC47258
	for <ath11k@archiver.kernel.org>; Wed, 17 Jan 2024 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyL6nwgFST/GdpkNqZbwJv1exFvxTHY2yvfVF6D4mpI=; b=pe36pE/1YTxUlkCCP4RZt7liEv
	oPUBQH53CSNJTGWMDEfmZ0mnS7CZ8mRxokpHUh/5MewAkLFf/ZuUE6Dpc78fmKADcZv22CSz0suD3
	Pt5NTax2ZqwGHLYzWjW/e49JhtxyzgkhMZJ0Ayo/AS1MxsjUpZXbskc0lYOeBhw87VgJYN+9rlgWm
	p9IFB5ArCUn3T3Q0+Km3uT183WoUiNz8dA4a+jkTx3Mn/cYgt0SyUsk+kB1peFkKbb2RRzgUn7aH0
	/lhOT+d+ajKYqPfnqFurahbqiOI4T9WnyyCzPONM6CTbRDTBH+8UDb5wJ732g3cYcLYfGcU6fN5Vb
	FMmFyk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6rS-00H647-0b;
	Wed, 17 Jan 2024 14:25:46 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6rO-00H61R-1v
	for ath11k@lists.infradead.org;
	Wed, 17 Jan 2024 14:25:43 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-429fc7a1eacso18297521cf.2
        for <ath11k@lists.infradead.org>; Wed, 17 Jan 2024 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705501541; x=1706106341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyL6nwgFST/GdpkNqZbwJv1exFvxTHY2yvfVF6D4mpI=;
        b=LucJSmeJfq7Dhb8Tq/6KFopMsfjxPknGD3gnkCzYo7x2Kd/UhHywFqhckZcOjVna41
         dD4gFWXK6P1bauGFGzANsBkenxClChYsRb79xK30iVceeht+7ICD+1YAE40XehXngJ0B
         j3CYGXWM3KjbxoNcLkuEvlLa/arEMZ+FmkTGcG8qZI98zgq0skho37dOeRRh/xvzaMde
         K86UrqPu+Nr5wYH0OcOGltqPRdiG0+3C03gMFLhd4NVYEjzjjzBEfTXqfoyxo78W1Xce
         psYF+E2SlGfCcuUZCoXHZHa1hxli3q3Of6tMXNn+I+kf+njYjC4BOBhpfe1Nq/uS1ZqO
         ZYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705501541; x=1706106341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyL6nwgFST/GdpkNqZbwJv1exFvxTHY2yvfVF6D4mpI=;
        b=irJDQ0n6lbp1/15J69ZUDaljzQMf+ZC/XE3oPYR+Q7X0wSWTJisaJLv6QnvPUpSKOo
         Lt5H1atIHskB2yJHLYP85Gb4vz8zAO5JUxWftmvUTI+Rqk9aWsaCojOtRfydxGGEvrmk
         1tvVTQTkzddZruyMsZDIp/mDMOHiNK210tM1aM85vzYjxzcYCsqsacK5fXSxDRRCr0U3
         Pb5VFr8bvgCk9NA03hDnPjQj1dY4SK5Ej0TA5q7iedGOXzsdJLuCWRHqHOjCOZ7nhnH/
         sYlQPda1sAXPC27Z46ofiPewZmicwc/yZLU0cpiAL78zKx5hxCGxGr6UaXCICVvkqDK4
         tFwg==
X-Gm-Message-State: AOJu0YykkRXu2nx+SpfxIOH7El1mlQENKvRCmemGmNfZMHQTfbYuZ0Xs
	STVwsj4vmBzQkmLHd2byBk/e1ktl2WY=
X-Google-Smtp-Source: AGHT+IGqJFcigCL28SyONVViKR9Iw5RQiobdzsuoxQtEf+OBYzsWxzlGiHBh7mk2o83QzDaEQtwwWw==
X-Received: by 2002:a05:6214:d88:b0:681:6457:400c with SMTP id e8-20020a0562140d8800b006816457400cmr4807046qve.59.1705501541309;
        Wed, 17 Jan 2024 06:25:41 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id e13-20020a0cd64d000000b00680b1090832sm4963533qvj.146.2024.01.17.06.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 06:25:40 -0800 (PST)
Message-ID: <6fc593ee-0b4f-4116-a30a-94ba375bba4f@gmail.com>
Date: Wed, 17 Jan 2024 06:25:38 -0800
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
 <8734v4auc4.fsf@kernel.org> <e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
 <285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
 <4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
 <3d22a730-aee5-4f2a-9ddc-b4b5bd4d62fe@quicinc.com>
 <ee0280fd-032c-4f45-a3f9-50d96d8bed6d@gmail.com>
 <16cfd010-b62d-4385-92d1-002820a8db38@quicinc.com>
 <cdec259a-b779-4856-8585-f285179e3671@gmail.com> <87cyu05b4j.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87cyu05b4j.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_062542_656432_4DE65E18 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Hi Kalle,

On 1/17/24 5:43 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>>>> I don't see anything in the dmesg logs, or in lspci etc.
>>>>
>>> fee00578 is the physical MSI vector so I got it using lspci in host, see
>>> ...
>>>          Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit-
>>>                  Address: fee00578  Data: 0000
>>>                  Masking: fffffffe  Pending: 00000000
>>> ...
>> Mine looks like this:
>>
>> ...
>>
>>      Capabilities: [50] MSI: Enable- Count=1/32 Maskable+ 64bit-
>>          Address: 00000000  Data: 0000
>>          Masking: 00000000  Pending: 00000000
> And that lspci output is from the host (not the guest)?

Yes, that is on the host. On the guest I have:

Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit-
         Address: fee01004  Data: 0028
         Masking: fffffffe  Pending: 00000000

And I just tried those values, i.e:

-       ath11k_dbg(ab, ATH11K_DBG_PCI, "msi base data is %d\n", 
ab->pci.msi.ep_base_data);
+        ab->pci.msi.addr_hi = 0;
+        ab->pci.msi.addr_lo = 0xfee01004;
+        ath11k_dbg(ab, ATH11K_DBG_PCI, "msi addr hi 0x%x lo 0x%x base 
data is %d\n",
+                   ab->pci.msi.addr_hi,
+                   ab->pci.msi.addr_lo,
+                   ab->pci.msi.ep_base_data);

Though wasn't sure for "Data"/ep_base_data since the kernel uses a u32 
but lspci appears to show a 16 bit value. I tried:

+       ab_pci->ab->pci.msi.ep_base_data = 0;
+       ab_pci->ab->pci.msi.ep_base_data = 0x0028;
+       ab_pci->ab->pci.msi.ep_base_data = 0x0028000;

(maybe thats entirely the wrong change)

>

