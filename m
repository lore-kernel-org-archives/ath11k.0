Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D861C3DA6E
	for <ath11k@archiver.kernel.org>; Wed, 20 Dec 2023 12:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DP0zvxoQ566YYbRy4QMCmGwXsJhdmh/xrNsxiUti8ko=; b=Mgv/SNwdDEvFHco8nRAfoR/84h
	hZH3QGSMnrh4EmwU5Gbw4nqTX2d13TCkhQgetXu5k9bULbtdaANggNVCVc4hglW8H6ZPytR7bW4Nr
	Y9guhDwDXX4oar4ZDFXXpsOARBkXHL7PDfL34kaqT9qxHCR6T1zY7968k3Hy+gr8Gr+zaledokSbH
	yh4cyLiGFlXxT5cq5OckrPMcFSO7J6s+h6/3Aj4SONNxisu+RXq+nXSfZYfPdwAvWvsyT2uQiNXtv
	gkh+WOqWlQZphDAusK84I9DvrP6znKgYz7pBjvz0tKGOseFc53Visg3CBRz4zNEqFGCcrlvrcld0V
	8H8esDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvuJ-00HOoT-0m;
	Wed, 20 Dec 2023 12:42:39 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvuE-00HOmU-3B
	for ath11k@lists.infradead.org;
	Wed, 20 Dec 2023 12:42:38 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58a7d13b00bso3772124eaf.1
        for <ath11k@lists.infradead.org>; Wed, 20 Dec 2023 04:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703076154; x=1703680954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DP0zvxoQ566YYbRy4QMCmGwXsJhdmh/xrNsxiUti8ko=;
        b=RipWlW0XYd2xIpGP4W2kPlBFXfsjFutK+JuoFeQpLnKkhCvKbEyh0v1cnRggdlEJzA
         x1mMmWeRRfEFhmuAzUNJKeWzQ5dXHH/g7G65egDy6Y9z9r/bAsFxzVYidpx6QQXAdXxr
         MccY1PYqM3hAQPCjb/K1a2Gjoi+uPgjLcq01778KlV3X4fBDtC3cR0y/6OKZXaiYdrHX
         EvWq5recUYDtgxsSjz/+674gyoyG6Fp5xzVpF/3/7x8k9oXQC9Ue4hA3AgLixdt4XAtD
         eUzyLK5cKBX64MaYdCFk1UTKHxtBYESpFLJnEW2FflTxEGdGfxsw6W8N8oRaEBu4SVyG
         vxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703076154; x=1703680954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DP0zvxoQ566YYbRy4QMCmGwXsJhdmh/xrNsxiUti8ko=;
        b=VXF8Kmeq7l6Tg43wWzH1VQvnm5zu1BnqYqMVfTpzYfHPhZXJi838nqPlRsibnQFr/h
         0Pv/Pe7Ye/55L47G1zp68LbrS1jfpTwiL4/ye9QgqWEDQ0sKRrvs8MIxSy3kC35R9Mlc
         yjoc+XJxUn4MIYcSde//sj4uGHUdNSui6e9f1HnGOy22HJk94nrr2BWvkJSt3Ynm/lwj
         Bk7ypO3aY9LTTFKc6iFfCdXFxJG5ZxYFQudCp2s4kNE9xAKnIioQ7B1mXrpd+MZt3gvR
         OVIX9Z14hJV6u0LkSSEMSWe/2GV9lhZdc78220aojgeGFgLLkICIWykFLlfa2/yIR3CK
         JrZQ==
X-Gm-Message-State: AOJu0YxvuyH+KkGEUCvFkf2nadhx5lP8QUie4mUzi6rQcBrHIQMkkjQA
	9ZwY7Svv5YHb9A+D/KMMHu4=
X-Google-Smtp-Source: AGHT+IHzTGl5VPicMbIcW+KWYWcb9kp9FFuc5dvpUMJEUN4ACyswLyDhbRQEnmvJDbC5cudUkzkuVg==
X-Received: by 2002:a4a:98ea:0:b0:590:f5fc:df58 with SMTP id b39-20020a4a98ea000000b00590f5fcdf58mr9555540ooj.17.1703076153712;
        Wed, 20 Dec 2023 04:42:33 -0800 (PST)
Received: from [10.175.247.41] ([50.222.209.222])
        by smtp.gmail.com with ESMTPSA id j12-20020a4aab4c000000b00591994c94f6sm2173700oon.24.2023.12.20.04.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 04:42:33 -0800 (PST)
Message-ID: <6122eb4e-66f5-4772-b211-8fc69ac88ebe@gmail.com>
Date: Wed, 20 Dec 2023 04:42:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ath11k warnings, and eventual phy going away requiring reboot
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org
References: <ab00ff77-23de-43a1-9eb9-6ac036ab80e3@gmail.com>
 <87edfiqcdi.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87edfiqcdi.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_044235_044048_BA002DD5 
X-CRM114-Status: GOOD (  16.26  )
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

On 12/19/23 10:24 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>> I noticed this after one of our devices dropped offline. The device
>> had roamed 7 minutes prior so I doubt that had anything to do with it.
>> But then we get this, and then tons of warnings. I'm happy to provide
>> full stack traces but its quite a few, not sure which ones are
>> relevant or not. After all the warnings IWD got an RTNL del link event
>> and was unable to recover from that. It seems after that ath11k tried
>> to power back on but failed.
>>
>> This is a stock 6.2 ubuntu kernel, WCN6855:
> BTW I don't know how it's nowadays, but back in the day Ubuntu heavily
> modified ath11k. And we can't support distro kernels anyway as we don't
> know what they have changed in the kernel.

Ok. I understand where your coming from, but at the same time Ubuntu is 
the largest linux distribution so it seems like these type of reports 
wouldn't be uncommon. OTOH maybe users just go directly to Ubuntu. 
Anyways, this is a list of patches isn't huge according to the changelog 
(for 6.2):

      - wifi: ath11k: fix registration of 6Ghz-only phy without the full 
channel
      - wifi: ath11k: add support default regdb while searching 
board-2.bin for
      - wifi: ath11k: fix memory leak in WMI firmware stats
      - wifi: ath11k: Add missing check for ioremap
      - wifi: ath11k: Ignore frags from uninitialized peer in dp.
      - wifi: ath11k: Fix SKB corruption in REO destination ring
      - wifi: ath11k: reduce the MHI timeout to 20s
      - wifi: ath11k: Use platform_get_irq() to get the interrupt
      - wifi: ath11k: fix SAC bug on peer addition with sta band migration
      - wifi: ath11k: fix deinitialization of firmware resources
      - wifi: ath11k: fix writing to unintended memory region
      - wifi: ath11k: Fix memory leak in ath11k_peer_rx_frag_setup
      - wifi: ath11k: fix monitor mode bringup crash
      - wifi: ath11k: debugfs: fix to work with multiple PCI devices
      - wifi: ath11k: allow system suspend to survive ath11k

I see the dilemma of not wanting to waste time debugging when there are 
unknown changes applied. I was hoping someone would recognize the 
behavior and could suggest a patch/kernel/firmware to try, I do see some 
recent patches related to firmware powering down which seems related. I 
also will try the latest firmware that was just released.

Thanks,
James


