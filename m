Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC24AC43334
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqRqtOtjn67WHj3CoBTRdQB/vFEmABZF0L2EI4SFoXY=; b=WlHqGNkrqhwaj7
	Ybp2DyIjcb+xkihDnvVDGe4O7ow3tZPG7Ekv5qFREltPG/kxuRr4IMfX33wgaZw1wSp+q5Edcid9m
	Ngivf83ygCscu8KVi1a5IYhnJRJDQ66RcyztZXNyTEH527Ia2nQ9JOwCnZzcT+BHxuIpS4sBgHnll
	AEP9vvy+G+fGahS6mh6PiRXCBvPvlPBgBrA3/VnbxlciJnqRAscGkTlivF7JAYIaHGsBTjXUmHoyf
	KB2iy+ZCBpucpaKCPicH+YN/WPYnYsuRJY/QSbfUWpxt4grf+yOLy6jPl99kQA9lOZADw0gXVtBsQ
	EA3w84ofppcuivBisc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx3U8-006mgf-U5; Fri, 03 Jun 2022 09:20:48 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx3U6-006mf7-PZ
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 09:20:48 +0000
Received: by mail-lf1-x136.google.com with SMTP id u23so11710675lfc.1
        for <ath11k@lists.infradead.org>; Fri, 03 Jun 2022 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q81VR14BIP9GfmxTYJYJxK1mX6xz2wnE8rYOFZm+uv4=;
        b=c03It1KYwWX5O8YCYX68eQc0UmzH3+vqIYN1fT5kWDX6Bi16U2Rm7MBtBomAS8QshJ
         Bb1L27JUrjecSrIlIa5TXciHYYQPdB+13nhWZqg21elyDkOqMmk7LlFvswKTGH60Zwoc
         CUJjSdv620C4NlEBOmE8zXR+P0+ypAMMVv3pkZ1lbHB8zUotd3cfooOlTFur0f6SiPH9
         bu3j8L61IxeNc6lh9rfRBzeo6W0zmzUkcdu/8bpf+0MV3VS044HU6hvvPDOsqu7YWQwk
         sqE9DE/BDL9i1yy5EQe6yytMpa+GYcDn7u5fKGB44PffGgW0gvI8b8KxAjiG90tAkmPO
         YV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q81VR14BIP9GfmxTYJYJxK1mX6xz2wnE8rYOFZm+uv4=;
        b=ygCbutPaaqdoVlQNz+vWFJEzcKn9nO131yxIHbPnJPFc8h2a5XdcLjKvodt5mVQzDr
         H202IkYtNUAGh1zEL46FhWjtCR4o1bYkZhauZudcMsz/SI4m3FyeTFbrvnjnESAOTyY2
         yDuET1svAHDOdzjx6LGT08zTYdYb4MSw0VTo9DyIAJ8aZBI7QY+0kKas1RiTmbq0X69K
         k/wZBvSHI5emEa7/1vtWyPhrkpeb5jpnLd7iHKxMY08CbbXbauDirhLNthLhAnbADPlF
         7mIriy9ffLtTZpRSVxiA8BiExLtR0wxKv5LmxLRfLxBspG5sIwwRYSP4wHBXKvAfBw/8
         tQEg==
X-Gm-Message-State: AOAM532b2VKavAugXVvEdkuc0Mxyc5B/N8VorbGTdIS+fcWI83o9Egon
	tg0I7MAm19ItHShgxY4ccu7tzQ==
X-Google-Smtp-Source: ABdhPJzcv+QrxPA7YW17/uOJGXVDVDiFyJR6tInx2r+jfJqOHvon5EdGgKSMONr0+AEJ6OvMF+ctqw==
X-Received: by 2002:a05:6512:3e0c:b0:479:1d59:3e52 with SMTP id i12-20020a0565123e0c00b004791d593e52mr575574lfv.646.1654248039518;
        Fri, 03 Jun 2022 02:20:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512399500b004790506cf98sm1449046lfu.303.2022.06.03.02.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:20:39 -0700 (PDT)
Message-ID: <229e7e0d-4d2e-14ad-6eee-01b53541c8a8@linaro.org>
Date: Fri, 3 Jun 2022 12:20:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: WCN6855 issues with latest linux-firmware
Content-Language: en-GB
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <CAA8EJpoHKUSx3Aq+fB-4s0ZpZXfvp8p-==hO12hxsrxE46YfCw@mail.gmail.com>
 <87zgium9dw.fsf@kernel.org> <f77c78c4-2dee-3798-4a8a-c42abc0e1c6f@linaro.org>
 <87v8tim7zf.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87v8tim7zf.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_022046_930187_ECF87B5B 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 03/06/2022 12:06, Kalle Valo wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
>> Hi Kalle,
>>
>> On 03/06/2022 11:36, Kalle Valo wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>>
>>>> I have tested the latest firmware from linux-firmware and it still
>>>> fails to send the bdf file request:
>>>>
>>>> [    3.740702] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb
>>>> board_id 0xa7 soc_id 0x400c0210
>>>> [    3.752952] ath11k_pci 0000:01:00.0: fw_version 0x11090c35
>>>> fw_build_timestamp 2022-04-18 20:23 fw_build_id
>>>> QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
>>>> [    3.760674] ath11k_pci 0000:01:00.0: failed to fetch board data for
>>>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=167
>>>> from ath11k/WCN6855/hw2.1/board-2.bin
>>>> [....]
>>>> [   13.843957] ath11k_pci 0000:01:00.0: failed to wait board file
>>>> download request: -110
>>>
>>> Yeah, I have a bunch of missing board files but I haven't been able to
>>> start searching for them yet. This will take time, sorry.
>>
>> I might be mistaken, but for me it looks like the problem is not in
>> the missing board file. I have added local board.bin.
> 
> That's expected, board files from other drivers are unsupported. You
> need an ath11k specific board file.

I'm using the bdf (board.eNN) that came from Qualcomm with the board.

If you wish, I can try using any particular individual bdf from 
board-2.bin to check if the issue is in my bdf file format or on the 
firmware side.

> If you use something outside of my repositories (ath.git &
> ath11k-firmware) please mention that clearly as that's unsupported. I
> try to make sure that everything in my repos is backwards compatible,
> but I cannot guarantee that for out of tree releases.

Please excuse me if I was not correctly describing the origin.

-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
