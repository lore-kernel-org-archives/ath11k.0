Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C7CF58E5
	for <ath11k@archiver.kernel.org>; Fri, 20 Sep 2024 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8gaXS3CKvy6upathpVQhGzsGg8TbragSm/BWYuq5gs=; b=VMTwzBHWchbLFzX31SIPlThvz3
	98w5Kn8S23nXfvoPk1cjunO8lRSY79xx2HkBpRZDoCuV62IcJhODXkxWxiOD4hFbhMpko7TS/c3uT
	ExIIo7sC9SgnMJV1Skcaz5xklvvNcOySrNGNBXhcHAHCbnH7ICjkYVqb5vIS4lKAbdcN6anozNR+x
	eGy9gCwob+AIsjm09DfMGlYlOl4BQdv3WMoNAXCNQGVwgnqraUGjhdzIn/2yduooACEA92z48G/+Y
	JEDuGhrEq5gpYL/AUZF98f3sDr5+4L5KjvMDk6L1FzLkdya1hLIQor77J5LWgHi7a53yIe1JwyAFN
	NrjyyXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYXT-0000000Bg5h-3I4K;
	Fri, 20 Sep 2024 07:58:51 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYXQ-0000000Bg50-2Uct
	for ath11k@lists.infradead.org;
	Fri, 20 Sep 2024 07:58:50 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5365c060f47so2273422e87.2
        for <ath11k@lists.infradead.org>; Fri, 20 Sep 2024 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726819126; x=1727423926; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8gaXS3CKvy6upathpVQhGzsGg8TbragSm/BWYuq5gs=;
        b=yeUb5UvbAWuyPIE6i46omx8eJgGoMH/Nf+z4PMNze+5DSnEI2jwlLQnvgo/eHykU/j
         Xi7LQgGEiBYZKxoPjJyhgUt8oDnmqg8PUTZJoicdlNfJKPPFjd8bst+SKYhT86R7QnGl
         aUDLWDlvIXbOfoGpqqT5P0MdHFAl/FcnY6f/lQtogyaRXez3v9VwgjX52e0PImREuot3
         /6EaHg35BcdCER2ZJdk5aQli7T/JKyybkLZ6kNFeXWXqH8pAtIP8hbwknpbdVwVPd/8C
         kmnwh4yLKtbugj/6MpQdMSAk/RKajHAd07lBYFcDDVemDfFoDBfPmoAMImigTefBkhy5
         7Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726819126; x=1727423926;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8gaXS3CKvy6upathpVQhGzsGg8TbragSm/BWYuq5gs=;
        b=catIcKimxmScqVHnHZakj5c4GAQeZ+GlzpCZ02kopVNNvsa0ufta0cABWWzjT0emeV
         tw+5DMzjasrSv6p520jscKwBu6O6J5Y0UDpVnQQo4KKUhSD8WA95bSxydKNHEUn7pjzQ
         h/hp6y+piEgeb3ES5tRUiLIozJTKlhfw1MhLazPSBXrtyoFKadhwwizC+X7BhBU+i7gA
         3wFmHfZdq7RXkoc401qfPB88jlqOGYr/Oy3yvd7asuYSkwm+ZUhrtfPSD5WblypQgr6s
         yQP3i5cwMjjSo3OAptxiZdMEo7mqOGcSIYTzbFevz6UlYZr4x0QVAg+RXzHN/p4PDirA
         dLkw==
X-Forwarded-Encrypted: i=1; AJvYcCVrv2Ic9w/xmaD9/ucT6+N1/USV3oc0F8EEg5F9IL3xPAJSe/IV82U8aehx1XeZ2ZIP5h3JCnE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQw+Lfnd27lUsF3yC5JtFpGApYc69B7dZ+AptqVnJsviXmWKxa
	PUqdb5vC2kQQoHOwPS7o8qzBdi2+hS/+uxyjaf2kLeoHR5bjQ/Kpzfksa87KmVHBRGl9HSQ+Sr9
	CbRNApeboQF3vmd+vAtv6KPNPuyy3wpnYBh9uaQ==
X-Google-Smtp-Source: AGHT+IFWhG3CUQa9G9CqIMZPY+ykvt6XfSEiCGRn8+DLsrcQfk28XzMJQ1zmPWWX6CXejRPycjDQwRCnYNST7lawdRc=
X-Received: by 2002:a05:6512:12cc:b0:52f:368:5018 with SMTP id
 2adb3069b0e04-536ac32e5d5mr1155885e87.43.1726819126421; Fri, 20 Sep 2024
 00:58:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Sep 2024 00:58:45 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <87ed5ec09z.fsf@kernel.org>
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
 <87msk49j8m.fsf@kernel.org> <CAMRc=McEWWm8N++4a5LMCAa0GWsQdi0KuSpj3ZuS_he=H0LP+w@mail.gmail.com>
 <87ed5ec09z.fsf@kernel.org>
Date: Fri, 20 Sep 2024 00:58:45 -0700
Message-ID: <CAMRc=MdyHx72o=6Kf0AM69tQBLjuvRVepN0UNjt+Kf4LX3PaMA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Kalle Valo <kvalo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_005848_864963_86FC8E7F 
X-CRM114-Status: GOOD (  25.37  )
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

On Fri, 20 Sep 2024 08:22:16 +0200, Kalle Valo <kvalo@kernel.org> said:
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
>> On Thu, 19 Sep 2024 09:48:41 +0200, Kalle Valo <kvalo@kernel.org> said:
>>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>>>
>>>> On 14/08/2024 10:23, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> Describe the inputs from the PMU of the ath11k module on WCN6855.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---
>>>>> v1 -> v2:
>>>>> - update the example
>>>>
>>>> I don't understand why this patch is no being picked up. The code
>>>> correct represents the piece of hardware. The supplies should be
>>>> required, because this one particular device - the one described in this
>>>> binding - cannot work without them.
>>>
>>> I have already explained the situation. With supplies changed to
>>> optional I'm happy take the patch.
>>>
>>
>> No, silent NAKing and needless stalling is what you're doing. I responded to
>> your last email with extensive clarifications. You're being told by the
>> experts on the subject matter (Krzysztof and Conor) that the change is correct.
>>
>> The change has no functional impact on the driver code.
>
> Until now it was possible to use qcom,ath11k-calibration-variant DT
> property with M.2 devices. If your patch is applied that's not possible
> anymore.
>

This is incorrect, why do you keep repeating it? What will be impossible is
upstreaming DT sources which don't take these supplies - which is what we want.


>> It's also in line with commit 71839a929d9e ("dt-bindings: net:
>> wireless: qcom,ath11k: describe the ath11k on QCA6390") under which we
>> had literally the same discussion and that you ended up picking up
>> after all.
>
> I don't care about QCA6390 as it's not really used anywhere anymore. I
> picked up 71839a929d9e, even though I considered it to be wrong, so that
> your pwrseq subsystem is not delayed. But WCN6855 is a different matter
> as it's more widely used.
>

In upstream sources, it's only used in X13s and I added a node for it to
sc8280xp-crd but that's not upstream yet. Am I missing anything? As I said
several times: for out-of-tree DTS, this change does *not* matter.

>> Arnd: I've added you here to bring this to your attention because it's somewhat
>> related to what we discussed yesterday. It's a change that is very much
>> SoC-specific, that has trouble getting upstream due to the driver's maintainer
>> unwilingness to accept it. Is this a case where a change to DT bindings should
>> go through the SoC rather than the driver tree?
>
> Like I have said, I'm happy to take the patch if the supplies are
> optional. Why can't we do that?
>

Because this patch reflects the reality of the chipset. And device-tree is
supposed to model the reality. It's not there to configure your firmware
loader.

Bartosz

