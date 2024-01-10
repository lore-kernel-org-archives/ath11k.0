Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD364C4707B
	for <ath11k@archiver.kernel.org>; Wed, 10 Jan 2024 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/iE3zonRrD+7/513nkWlW303P6DfLmdTqqBHWTtojI=; b=ArJDBWU3OMIhUQIzvtL3tWaV1V
	C6kNt8GvtnyaLtcffNI4YzECupwz5KXTSOX5PaAYkdi6eICaIxBA4nyQDcxjcBX+PEo5wr7SjGvsy
	m+xLIJUEyPbwSiLrAEylX+SQ0Pe/fQCJ9i9Ku6mOTddaS32noaOK/kc9T5lJIRkm4vkXMhN/HVjjE
	ciHp14ie1bwc+VmubDJHhRM+MZapo58c5Ur+bJk6kQfev4GTDhG+j6puGARJz8W88ayv6lZzdtBFx
	QlfEW97b5Ssi63zK7Zt/Jf/hC7wwuUnrXSos4F2a8B4mItOyfzLYqJTxUwRt6IZsq54F0u4y/J03w
	UGYC/T+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYGS-00BsHq-1D;
	Wed, 10 Jan 2024 13:05:00 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYGP-00BsF6-2B
	for ath11k@lists.infradead.org;
	Wed, 10 Jan 2024 13:04:59 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7831806c527so364556685a.3
        for <ath11k@lists.infradead.org>; Wed, 10 Jan 2024 05:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704891895; x=1705496695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/iE3zonRrD+7/513nkWlW303P6DfLmdTqqBHWTtojI=;
        b=eqgSjhVq86MeOzrWB0Uj1TcR+JQ19++EQ+qLrmw6ttcB3p8ipZeZTb9P7WrowbVKj9
         5nsnIpCBavqQi8NJpQ/XJyoIYMyyk2NeKiVMZb9dO9cfCRo3jIPKje2ig1reEhXN20v0
         FMi5GEdBMNgJ0Dw0jkC2i+9rODiWAQfD+Oq/hvHd2F9N8X5ue8q+VQEp7aljlTsXMICC
         hwtbpixmMobnwnXMQrNGXgfJfLhn0OWL8e9aGO0623SbFzXcXQCxlwu/LyI9R3Xy+0LG
         QdOf1CdNyiYGLg7RUWcgkwTv5ygL11a1GAkylYSBXDth+M7mb8H3A0thuvrZ2yQj/n2s
         Y+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704891895; x=1705496695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/iE3zonRrD+7/513nkWlW303P6DfLmdTqqBHWTtojI=;
        b=cFUlCRw3HH/JwT3xgbsLqBU8yu3mamNKAr3UgNLLI1LcZikbyNRf4Rs+GGB9bq9RX1
         bCyE3WbrGtFnhfA/FJ6T0ARwG2k7Qh6/l+Zg+i1CQ1mb+EnUfJUCD6ogB4nPWhCIlFyh
         ZG+9LLRUuEgtMewknVrBUAqIbraBiQlnvogur2fjB/+TfGf7ksflsZW+kIi4Tjel80Sc
         HUE5hHoouXnYgWWGCKsmAKTM8xpbw3DSqGtrlOj/cGrMereBz79UvloBBLmZ32NGc43O
         8BV0KzaDneZ9apDIqEHRuxDO8i1KPkCVa53RQ8qF0oDke7fXt2yz176rkppdiZK5qhhV
         jmbA==
X-Gm-Message-State: AOJu0YwJ9Zl7ZbdrwMCojs7alk1AiVAEyilCEGVj58wpGej5Bt1bmXuo
	0NGtyep61YBBMKXOzgEnrh0=
X-Google-Smtp-Source: AGHT+IEhUoaezwc3HlGdpSeYeYVqm1+ENALKEaER1uyKroBqR5tdhBdEvHQYO2hyG4xytfEaaflnjA==
X-Received: by 2002:a05:6214:1307:b0:681:91b:75a4 with SMTP id pn7-20020a056214130700b00681091b75a4mr1341182qvb.125.1704891895310;
        Wed, 10 Jan 2024 05:04:55 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id j4-20020a0cf9c4000000b00680b1090832sm1654280qvo.146.2024.01.10.05.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 05:04:55 -0800 (PST)
Message-ID: <87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
Date: Wed, 10 Jan 2024 05:04:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k and vfio-pci support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
 <8734v5zhol.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <8734v5zhol.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_050457_709961_C38D6E61 
X-CRM114-Status: GOOD (  19.88  )
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

On 1/10/24 1:00 AM, Kalle Valo wrote:
> + ath11k list
>
> James Prestwood <prestwoj@gmail.com> writes:
>
>> For a while now I've been using vfio-pci to pass through wireless
>> hardware to a Qemu VM. This makes testing kernel changes quick and
>> easy compared to swapping the host kernel for reach iterative change.
>> So far I've had very few issues doing this, maybe I've just been
>> lucky... I tried doing this with an ath11k (WCN6855) card and ran into
>> issues with the driver starting up. I'm wondering if its a
>> configuration issue or just a lack of support by ath11k? The card
>> works just fine when I use it on my host machine. Based on the logs it
>> may not even be related to ath11k as wmi-bmof seems to fail first, but
>> I'm not familiar with anything at the PCI level so I've got no idea
>> whats going on.
> There's a bug report about this:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=216055
Yes I saw that, but apparently didn't read past the first comment... I'm 
not seeing any of the DMAR faults but the ath-releated ones look the 
same. Good to know its not just me.
>
> But I have also no idea what is causing this, I guess we are doing
> something wrong with the PCI communication? That reminds me, you could
> try this in case that helps:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/

Heh, I saw this pop up a day after I sent this and was wondering. Is 
this something I'd need on the host kernel, guest, or both?

Thanks,

James


