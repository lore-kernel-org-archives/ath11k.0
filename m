Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE87CF58E9
	for <ath11k@archiver.kernel.org>; Fri, 20 Sep 2024 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRbjQAo5tiCbLgDd42XDT9pptGlsd4CX0PrR8LcCUGw=; b=A3qKgtrVqsr1toTV9mXj4ekte3
	kRHeUJwYKqafnL3X31gBRczfYedqXXdbmeofWPjB1zT0A2k0hBAYouzlkchGgOUU0FBn92t+4FuJQ
	SEpb2gzDrQOAaVEU2JXJuph2tnXOJQk1LH0YWRK+XdMrosF6wH8+UM+ybWfRV1vj5QvRbxpNbIl8r
	fSVonoci38faQPhwAIhkTfUEzQCOlIvgus3qNIsSkPDLMtNyN8fGyv8lo2kED8dgYMZNxTb1gih/O
	iDwcqIS17HMayAqeIe2/Q3cEhklZuvo37mDLHCYF+A6eyVP2bH/L5T9sYvoq1MKW85VuQnJSLtYF4
	WadBYSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ8I-0000000Bn7E-1Nle;
	Fri, 20 Sep 2024 08:36:54 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYu3-0000000Bk36-26dP
	for ath11k@lists.infradead.org;
	Fri, 20 Sep 2024 08:22:12 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f75d044201so17809771fa.0
        for <ath11k@lists.infradead.org>; Fri, 20 Sep 2024 01:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726820529; x=1727425329; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRbjQAo5tiCbLgDd42XDT9pptGlsd4CX0PrR8LcCUGw=;
        b=0GmszKmBLEkufZ1BiIh61lDs1nH3bThpiLmzDm0ScLYYKd9HBjgNVrw0osg/MA5Yfc
         NS9NQEo0U28tbX4md7V4rJtuiIgLK0su6o3ovxUHTtU7RwHUSjf+4q3C4hEilk5katmG
         oRnRfLDPT5evGO96NMYyc6mr8h8Lirk9fGfXpPUSppPj7ls/sIf3UzWHC5tH5ScbzANX
         BDHbYYnuLTG1fkbKDyM88L3H+RXEEu3jHBsxPqRuNzXNwE8XH7YKKtQ9oV1XYC0XOCKt
         8NXu7XnAvH4WvlANHqL6KTmh1oSsPm90/GtuLWZW1XKjq155VPOvKeL1xfjXs8KPph8F
         O9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726820529; x=1727425329;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRbjQAo5tiCbLgDd42XDT9pptGlsd4CX0PrR8LcCUGw=;
        b=ED1unxVcgnPmY4OEleDhbzefthJX25+9FnPYPkuVo13hpQCvn7WUbXsECSAUyl7FSm
         DdseJzLE6xZn/0rp1WiFwZ009wfHkAlZjKE2mvlWSZLEO3WD/oZQoqrDlYOaow0nYEOG
         Zg3vxncyeo3bWsWMi9DUkt3qJuFP7Cn+9A8fu1IQQy1bJVQaY+kt2ST6+JMQzwHF282F
         IMcZqIuEMJeguUrnaFgoBzsN2TEmEG5wliIUws5+5KnUwJFrRXijZJMlmPO4wATb+XWe
         wMNxsrZti6OfAfcokbr6KeEYBdZWj9VViJ3S8y0PmcZhQdAVm2RxDiNtLkZ11uE31WzQ
         snKw==
X-Forwarded-Encrypted: i=1; AJvYcCX3lJ+1YKlcOSgdLeYQyuV5Eahr65/NfnXwAmm83zV5rsOkMfd2yBtjVtrfhoYzE3ToRBBLdaQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaEJz5WWrG7Rqh4DvCJ5ODzLToZGziERWFMOEcVFaYJlhvX6Z0
	XeIC0CcLNybOBjrOpaW+fBQuAMbuA1U+hav6hfjDDsnFTqeFiI9wxJ+u6wzWMTbuGZZZdpCG5zE
	U1CRWVFCe0uEoRFyIHnnYg14rA/OzD42XLooKOQ==
X-Google-Smtp-Source: AGHT+IFm0zWqedV49xnMK6e6g1fUxzAO4Bw9XOqBWqSyqcT4SimXa5HqQvffKU2Tm6zoS6jYevpiv7/STJpuqEJ9slU=
X-Received: by 2002:a2e:a58b:0:b0:2f3:aac3:c2a5 with SMTP id
 38308e7fff4ca-2f7cb36458amr7593931fa.17.1726820529151; Fri, 20 Sep 2024
 01:22:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Sep 2024 03:22:08 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <87a5g2bz6j.fsf@kernel.org>
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
 <87msk49j8m.fsf@kernel.org> <ed6aceb6-4954-43ad-b631-6c6fda209411@kernel.org> <87a5g2bz6j.fsf@kernel.org>
Date: Fri, 20 Sep 2024 03:22:07 -0500
Message-ID: <CAMRc=MeLick_+Czy5MhkX=SxVvR4WCmUZ8CQ5hQBVTe2fscCPg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Kalle Valo <kvalo@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_012211_572864_9EF045F8 
X-CRM114-Status: GOOD (  25.62  )
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

On Fri, 20 Sep 2024 08:45:56 +0200, Kalle Valo <kvalo@kernel.org> said:
> Krzysztof Kozlowski <krzk@kernel.org> writes:
>
>> On 19/09/2024 09:48, Kalle Valo wrote:
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
>>
>> You did not provide any relevant argument to this case. Your concerns
>> described quite different case and are no applicable to DT based platforms.
>
> Ok, I'll try to explain my concerns one more time. I'll try to be
> thorough so will be a longer mail.
>
> In ath11k we have board files, it's basically board/product specific
> calibration data which is combined with the calibration data from chip's
> OTP. Choosing the correct board file is essential as otherwise the
> performance can be bad or the device doesn't work at all.
>
> The board files are stored in board-2.bin file in /lib/firmware. ath11k
> chooses the correct board file based on the information provided by the
> ath11k firmware and then transfers the board file to firmware. From
> board-2.bin the correct board file is search based on strings like this:
>
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e0ca,qmi-chip-id=2,qmi-board-id=255
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e0ca,qmi-chip-id=2,qmi-board-id=255,variant=HO_BNM
>
> But the firmware does not always provide unique enough information for
> choosing the correct board file and that's why we added the variant
> property (the second example above). This variant property gives us the
> means to name the board files uniquely and not have any conflicts. In
> x86 systems we retrieve it from SMBIOS and in DT systems using
> qcom,ath11k-calibration-variant property.
>

No issues here.

> If WCN6855 supplies are marked as required, it means that we cannot use
> qcom,ath11k-calibration-variant DT property anymore with WCN6855 M.2
> boards. So if we have devices which don't provide unique information
> then for those devices it's impossible to automatically to choose the
> correct board file.
>

What you're really trying to say is: we cannot use the following snippet of
DTS anymore:

	&pcie4_port0 {
		wifi@0 {
			compatible = "pci17cb,1103";
			reg = <0x10000 0x0 0x0 0x0 0x0>;

			qcom,ath11k-calibration-variant = "LE_X13S";
		};
	};

First: it's not true. We are not allowed to break existing device-tree sources
and a change to the schema has no power to do so anyway. You will however no
longer be able to upstream just this as it will not pass make dtbs_check
anymore.

Second: this bit is incomplete even if the WCN6855 package is on a detachable
M.2 card. When a DT property is defined as optional in schema, it doesn't
mean: "the driver will work fine without it". It means: "the *hardware* does
not actually need it to function". That's a huge difference. DTS is not a
configuration file for your convenience.

> So based on this, to me the correct solution here is to make the
> supplies optional so that qcom,ath11k-calibration-variant DT property
> can continue to be used with WCN6855 M.2 boards.
>

No, this is the convenient solution. The *correct* solution is to say how the
ath11k inside the WCN6855 package is really supplied. The dt-bindings should
define the correct representation, not the convenient one.

Let me give you an analogy: we don't really need to have always-on, fixed
regulators in DTS. The drivers don't really need them. We do it for
completeness of the HW description.

Bartosz

