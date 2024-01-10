Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D338FC4707C
	for <ath11k@archiver.kernel.org>; Wed, 10 Jan 2024 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6s/DjyGGlYA04VcYhLlf5rs2XIHUh5tvTkRQGkhtStw=; b=lLUFBHC/Ph/L5KfLZBKofZ31mU
	ffq943dVWeFDLOBH7ICKs1yOg/GauAlJt6MtFzW44TeU9z4KEcCeCNtR/xGkdDIKjGtvmjtr9U2/m
	A8tnGsm97m5xyYHX9lp3ienQNViEEUI7qULGyO/5C0NdYdNUNR8WpmYTnH0iOpNv00sy6N8oH3j2r
	LFXCXRdjbhdyLLuqhWCmH7tqnfqJ1Oe/m1wrFrEkYMjiQQMhVHdr+rFlXBsTzwHlWxftmEQxJGZUB
	9qVwymxvEv73a6sIpQQkX/21FMUmW7DRRyA0x2sHr6mw78mgeCCgEF502RRWQJ/1KMKyV7IgF1xX1
	83fnoV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZzR-00CQyF-2p;
	Wed, 10 Jan 2024 14:55:33 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZzO-00CQx0-2w
	for ath11k@lists.infradead.org;
	Wed, 10 Jan 2024 14:55:32 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dbed0710c74so3343106276.1
        for <ath11k@lists.infradead.org>; Wed, 10 Jan 2024 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704898526; x=1705503326; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6s/DjyGGlYA04VcYhLlf5rs2XIHUh5tvTkRQGkhtStw=;
        b=SElA0od4skS0TS8P95HZ6DgrSaMda9Xt8U63PI0oAJgX1dbM5UhnUK39WvuoNCVdkD
         mSH6azq7fADEp6jT8LIhdKzsjh8tbl5B4l6piOE29dlTb3lxNvsjcsB2OAkQZMWXZJzO
         d5j28/lpOqM06LFxbSgbcSTk8ElrZOjqrnozz06ERY80t6l22SeE0eL78rtSL0WdNvDk
         jNgRlDR5SxZgB3EwJBPpajhOJZV5G2pKSyLXeVG6wjMW7MN/OG4aa32gWvq0stsf5fUC
         7/4aJT8mXTryBcDn7ChCkOxC7cko8Pxn4/COGn0NYsUxprjwJNkrQSsrQXEtHK2muwOC
         tzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898526; x=1705503326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6s/DjyGGlYA04VcYhLlf5rs2XIHUh5tvTkRQGkhtStw=;
        b=XntPB5n9l/Gcjf3vjRr6WQydOrAeThbakKUxLeCM16i0K1dtVMnB653E7WqG9s3Vyx
         95mFMUoNTfqPB6T10o9jbm1D+BE2exk8fFqCvggtVUcs0O8K4LZnAZNItyMqcW0yGokj
         eg70AXAAlbrQl6SHgRzUJ2oMyXnUpPuLwCdQQKOHRonhOsfnNBvRK8SKS0awBTa0fGKy
         ot3NlKAJz3hjPnplmBBSdRDXg0iooRQKXLEbxVB7KBbWlMniUECc2mo4/nrZYZT/mBH6
         stdtBQyOv/5v579ahMA4/j8gPS4Ix3nSnl0ApXlrNrQnxXaMs/+8YMqY6GC9avQEGWxA
         cOWQ==
X-Gm-Message-State: AOJu0YwYnEx5Mo741Z6rSmnVrm8431HR0OeX8z1YVwSkXNVrtJjkoVE2
	zPnhfT8omzdia4unIa60aCg=
X-Google-Smtp-Source: AGHT+IFSA6hpG4OYNoXISy+6NXPM9czRtads/xSkt7aYl95uddlxeYmpUxwoyzIzFIz2F8OAqVGjcQ==
X-Received: by 2002:a05:6902:1023:b0:dbd:bf0d:d97f with SMTP id x3-20020a056902102300b00dbdbf0dd97fmr845117ybt.126.1704898526128;
        Wed, 10 Jan 2024 06:55:26 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id ge8-20020a05622a5c8800b00429bd898838sm53212qtb.47.2024.01.10.06.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 06:55:25 -0800 (PST)
Message-ID: <356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
Date: Wed, 10 Jan 2024 06:55:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <8734v5zhol.fsf@kernel.org> <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
 <87r0ipcn7j.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87r0ipcn7j.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_065530_951596_C6FA6A0E 
X-CRM114-Status: GOOD (  10.77  )
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

On 1/10/24 5:49 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>>> But I have also no idea what is causing this, I guess we are doing
>>> something wrong with the PCI communication? That reminds me, you could
>>> try this in case that helps:
>>>
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/
>> Heh, I saw this pop up a day after I sent this and was wondering. Is
>> this something I'd need on the host kernel, guest, or both?
> On the guest where ath11k is running. I'm not optimistic that this would
> solve your issue, I suspect there can be also other bugs, but good to
> know if the patch changes anything.

Looks the same here, didn't seem to change anything based on the kernel 
logs.

Thanks,

James


