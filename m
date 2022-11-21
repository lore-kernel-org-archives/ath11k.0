Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0743CC433FE
	for <ath11k@archiver.kernel.org>; Mon, 21 Nov 2022 16:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqhX5ODuHDSzSdPpE3EMZZgnzVkl9slTsy4qbVzYLUI=; b=kQDZsa47kDf0GC
	WYrP8CKh76EO2/4ZFXk4ayblyaml2x9E+mKvyLr1m0d5nU5pkQzLlXt8Su/80o3VQ+uLX8XmJAt0c
	9GPVGU5gL7JdqQAEtcVetrYMQhioXxazsb0qKr6mqp0dYfJ9kTQwX2DglpeaXlPMlVQw30fxIlaUp
	uLHmc+F1frogAqQSN1kRXZ70J0ymq2i+pJH/N3B4YwERLjkA0RPgL9sEfLmT08Ewybrf0dYoBuqH+
	Ogi/INRF3lg9sKD8zjDjV8UJY8m6n2RfJBldod/D+BTI+iUy8qgKJndLwA1dNwVOJtkzYIcG/NJtV
	JYeTBaupTxY4eKcrjAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9TC-00FeA7-GH; Mon, 21 Nov 2022 16:16:30 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9TA-00Fdyo-2W
	for ath11k@lists.infradead.org; Mon, 21 Nov 2022 16:16:29 +0000
Received: by mail-lj1-x22b.google.com with SMTP id a15so15031665ljb.7
        for <ath11k@lists.infradead.org>; Mon, 21 Nov 2022 08:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XF2VItxzhqzI0eYLXZvSQqAxAWYTmXjWXerxn0eM3F8=;
        b=x8mRvr6w+0VV6ZuQ5XTFwNOiT8csc009G70yCaFBFOu+ZWSyRi+h/P9deDC8y1ws0T
         LV7d/x6uMfmbr2keRfBBEMuEUWmlbt+VBucHdPFd8CPeenDOoEFuIv3t5XaUcaHz7OXr
         sSow1zgz/6k2JCcXfjOlExLdB3sDgEYe+7MJSs8VxMWW2jDzeXOOGwdCVUTNhYI4K3Im
         hqTnYyfKvZZMGrA1rkbA6ahoWSqL9JxMSfkYrkSn6ggRZKVeZ5E2s87INuHKJDYlTzXO
         J6s7uRXhh1qRaXYAlw8C3mpywBkp031u2FM9g4roB8q648p7yyjj9HfNvDaubYg2XUDp
         useg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XF2VItxzhqzI0eYLXZvSQqAxAWYTmXjWXerxn0eM3F8=;
        b=aVsXcNotVgsNIzcXNJ+9p3QbWGh8E8AraQk1JyQRcZNvOcIK63WDPEMuSfABHAVL1L
         OCT3Hm/NkjCs3xadB6RHbLihublx0UZxb8QPXGUy0/Myv8+nANeTW9B7V/LlIBCALQxg
         jDb5IvNWMhOlhMX1AYQB8Vqey/rTIEqgux586j+szwHrgXsP3qm64Onm5raGKyGfLhuE
         LoSFWAyyeBz4y6fxp/FbNFH0+xW9vdXW3ZITheqXEV0V6KZoQnqm48Udg2WNctjD9gOz
         OjK0XRtai1srT08sDfJ77eSoqqV1RMUm+C5VTEqblJvR1ZrENK+9ZoJaBOY4NMexQXJy
         5K7A==
X-Gm-Message-State: ANoB5pk31xlnlCRymj6BRpo4808Jj8tjm2BU7vFHCmgvrbEc1QDc1Ll9
	XYqx615q7nixWuniXBgzrWVmIBk0iBgygEJ6
X-Google-Smtp-Source: AA0mqf5wyN6rdDEdVwv/vIKQyF9VXJuyANOxFWJYKqvMbBR5p5tmqCkTr63wn9v3+Eq1zD2JnkU/tw==
X-Received: by 2002:a2e:bd8a:0:b0:277:b4e:6286 with SMTP id o10-20020a2ebd8a000000b002770b4e6286mr1324811ljq.279.1669047385054;
        Mon, 21 Nov 2022 08:16:25 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id v16-20020a197410000000b004a03fd4476esm2081172lfe.287.2022.11.21.08.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 08:16:24 -0800 (PST)
Message-ID: <015c1177-69c5-8b0c-3362-6f90d6420cd9@linaro.org>
Date: Mon, 21 Nov 2022 17:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: WCN6885 crashes on Xperia 1 IV
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <34956280-4716-d24e-1b2e-01be3366b605@linaro.org>
 <87o7t08etw.fsf@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <87o7t08etw.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_081628_145197_2781665D 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 21.11.2022 17:14, Kalle Valo wrote:
> Konrad Dybcio <konrad.dybcio@linaro.org> writes:
> 
>> Hi Kalle, Dmitry
>>
>> I recently got Wi-Fi to work on my SM8450 Sony Xperia 1 IV (with the
>> help of Dmitry), but I can only get it to function using very old CrOS
>> firmware [1]. Linux-next fw breaks for me in the same way that it did
>> for Dmitry here [2]. There is however also the fw shipped with the
>> phone (not sure how redistributable it is, you can extract it from the
>> OTA [3] update by running simg2img from android-tools and mounting it.
>> You will find it in image/):
>>
>> - amss20.bin (renamed to amss.bin)
>> - m3.bin
>> - board.e[0-9af] (Dmitry gave me a hint that I should choose board.e8d
>> based on the reported board_id; renamed to board.bin)
>> - regdb.bin
>>
>> Using this set of firmwares I get a veeery long and unpleasant set of
>> crashes [4].
>>
>> Any ideas where to start tackling this?
> 
> So if I'm understanding correctly, you are using ath11k firmware but the
> board file from the somewhere else? That won't work, the ath11k firmware
> has it's own board file format so you cannot take a board file from
> another driver.
No, the combinations I tried are:

- ath11k fw (doesn't work, see the bugzilla link)
- Android-bundled fw (doesn't work, see [4])
- CrOS fw (works)

where "fw" means "the full set of all firmware files (amss.bin/board[-2].bin/m3.bin) from that source"

Konrad
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
