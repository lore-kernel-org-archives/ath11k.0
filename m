Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F9FC47DD3
	for <ath11k@archiver.kernel.org>; Fri, 19 Jan 2024 18:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OouLsUncXdro84LkucUunUlvqGOy/RT1zxKH4rfrFVI=; b=cBfzMUEyEWOrn4ddCN6nYKQ47r
	/y0jGa4T4scrx/riF4IpIxeLXwZHmIqiu7tk+l5s9Zoy5UxIWx03OBt/BfGXfMlcbddGRSzoLoWhD
	oz/jqbXtTHn6GwuqiSOYOGU4VF3KtuGbtf+Zlt0SKglG2KvCpL3pJ66O8JIA9OnfQVV2A098JVX44
	X6bJuSJ0ldBoiXrEkMH6cA+2P8jQi4GX5ID53+VPvSVKjvzJo8DACh2h6lJVEhgBdZ1WPfYpkjYNM
	MNKn3tVaDUAkjFMqsZ0eG3OPg+6M+8pDZMrhUGcOhe5DN/2f1sXjrou4+yS8C1qExCFPzSwOexwkv
	jVXFIASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQtHe-006Lsv-35;
	Fri, 19 Jan 2024 18:08:02 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQtHc-006LsR-1j
	for ath11k@lists.infradead.org;
	Fri, 19 Jan 2024 18:08:01 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7bf2ab2c4caso29998239f.3
        for <ath11k@lists.infradead.org>; Fri, 19 Jan 2024 10:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705687673; x=1706292473; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OouLsUncXdro84LkucUunUlvqGOy/RT1zxKH4rfrFVI=;
        b=WAD4A3w1KIBI61pfSn0YB6vvZQxqgLmmSm2BRSCHu4WSMUipjCxJd++7lM451dckI8
         imTyUp8jRSrW05DtiRmrGvFlkjQtmJNtZ2ERa7WZ/8dMH6//kO/1PHltGgoy0i5Ru3ID
         hyTy9AxUK7uUYmgRc06t0B/MG1ErYgSBShrI0svKxJAAzrcG3cvSFgukqZSe8jJ68P1P
         Unr86z1L0MVy92PVa2Fvs1bw8Rh9NM1aaVJfRCJ1mqO5rx8kn5Wa+XIe2w0O46GZGwhn
         /poj9F7+KENffphsQvKomTyr2kpm7kTGON2kL0R2m948eBlyRpNzf+/Pfk2Sj0O1ZIER
         lKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705687673; x=1706292473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OouLsUncXdro84LkucUunUlvqGOy/RT1zxKH4rfrFVI=;
        b=PRzFVXGj1ZGYhHTm6ikBCTTYmcSj/xlNz3FwwWlbEqWBrsmtMHQskdnNzqwzV7XAPi
         P/dPwTfeV677Jb6l83cGoyLngHrlu/JYkoPAM3AZDRT5p9PzPMn81XZos6mIpNyszhkz
         nMnVmS+yscMTpa/fbWKeDdz70P6CNbWHPXnZLVVP5JP6t+tPzgK3GujKVpzbQ37iQmUz
         dVZOEg7ZCC76UbOig6UUKbMmuLVlOUDsDlgZcf6a0LN+NoWh/ptYAa8waxf7+MaYc/De
         m/Vhe5Z6QSnPzH+eql3Bxcaw1q9UwF4AZKgFqjC5nV0Z9Wk85cwMLEkJpRbtwYtauKDp
         MjOQ==
X-Gm-Message-State: AOJu0YzFyYs1StYfX0yE7SlGdrDp3v1XQa6Uapho7xs2MtBu+a+CwNfS
	h2gLUEUo0APjsfOu0Jx+obDM1BuFGqPzAH+b8p8CDoyolPLFLGFM
X-Google-Smtp-Source: AGHT+IEFXRi1LmbdEEQsUtYNN0rpYkaNjeeD5bB3vQeaTSmSWQ/ruYV3YLUoYLuqLWEREmJh9xoxQA==
X-Received: by 2002:a6b:e608:0:b0:7bf:1c0b:db43 with SMTP id g8-20020a6be608000000b007bf1c0bdb43mr84290ioh.38.1705687672876;
        Fri, 19 Jan 2024 10:07:52 -0800 (PST)
Received: from [10.100.20.9] ([50.225.159.98])
        by smtp.gmail.com with ESMTPSA id a6-20020a02ac06000000b0046dfd35b042sm1693277jao.73.2024.01.19.10.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 10:07:52 -0800 (PST)
Message-ID: <26aba780-d175-46ff-9943-c36625e7757a@gmail.com>
Date: Fri, 19 Jan 2024 10:07:50 -0800
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
 <cdec259a-b779-4856-8585-f285179e3671@gmail.com>
 <21e925bc-ee3e-4421-949b-b3839d2abdef@quicinc.com>
 <08457e37-49f4-4c51-998b-e577731c8022@gmail.com> <87o7dh2oky.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87o7dh2oky.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_100800_599865_36C29A9A 
X-CRM114-Status: GOOD (  10.07  )
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

On 1/19/24 9:57 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> writes:
>
>>> Sorry I should have made it clear:
>>> step1: start qemu and load ath11k without changing anything, then
>>> you get those errors;
>>> step2: keep qemu running and ath11k there, don't unload it. Then
>>> check lspci output in host to get the MSI vector.
>>> step3: Back in qemu, hard code MSI vector to the one you get in
>>> step2, then rebuild and reload ath11k.
>> Thank you for the clarification, this worked like a charm!
> Very nice, huge thanks to Baochen for finding the workaround! James, let
> us know how it works for you in the long run. This would definitely help
> automating ath11k testing so I'm very interested about this.

Yes thank you Baochen!

You mean using PCI pass-through? Yes, its immensely useful for testing 
kernel changes. No swapping host kernels/reboots and you can build a 
very minimal kernel, mine takes ~10 min to build initially then 
iterative changes take ~10 seconds.

We have also integrated this into IWD's autotest framework so you can, 
in theory, run tests you normally run using mac80211_hwsim but using 
real hardware (assuming you aren't needing to modify frames). I did at 
one point have a system set up with 4-5 wifi cards and could run python 
tests against them, bring up an AP, connect, etc. It was pretty neat.

Thanks,

James


