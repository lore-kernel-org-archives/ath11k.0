Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F73CF9C6C
	for <ath11k@archiver.kernel.org>; Wed, 25 Sep 2024 05:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIHLUCF5GbTK+LAoYFpxxEspv5CENfgSykostbPcuBA=; b=sMfhcrIwssxnr13BsVlH0pUMdd
	y/hNSBfOAhCr8zWmJHPR9pHZK2L9CsbaBC/UrQTze87utDrxm67K5YEhbAFgrBhkjhLJZjMA0uaq4
	zWr4NSyTS3npFjXGcL7Qi+RpeOCeqKGnU9zul9oYhXtUZveQclNKSjVkOUg9ZdFR0fbNzHcKR0S5k
	yuf5DjmEd2lTuVq6g7adjE1bgbgXFyr+YOYE0pPVyfewFAO3sbxhEKlgMtR0Rf+7iZ234clN8S7Yl
	4l4vAV4AT5zY+aHZnCsbJYpEfFgVEw5KrWkKkffrgiuTIHjWwe+A4Gw4DNyqYLlAMcPw5tvb8VMVm
	6WUJKUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stL35-000000047k8-0dDI;
	Wed, 25 Sep 2024 05:58:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stL32-000000047jX-1Kz0
	for ath11k@lists.infradead.org;
	Wed, 25 Sep 2024 05:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48432A43B4D;
	Wed, 25 Sep 2024 05:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCE1C4CEC3;
	Wed, 25 Sep 2024 05:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727243927;
	bh=R5iO86c9PhBZIXFBuzoB9GO9RtZOAFqW+RKHK3yqFEo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=A80vH/kQJWCU74aJSDRYFOgMTTr0Tb2L6qd6VlJYJBMVXVKTJSX0NPs9v+ea7Co3N
	 ROIFLvbErHcLPFiZbJWtXsVLAtXddNffbHXIW09pixr/Rz9MBm3YvZlwlIp5meNny4
	 x8R0OYaCGkfh+X7BeacihYg7vH+0phu+Ee2RKC21brT0AUYc9bHVFcak2KgWs1hcxh
	 KNKPWgJmT7SUafBDF8Op5n9ysqiWsTK31SfFmSI7e/xmfe/FY9i83/X1LL4j/cKidG
	 YqxbA98sGTKr1A87g8/gTw+oRP8bLKyT6fHRsAgvZgoiVr/S5GHZ5ACKnueveP6iwL
	 BuE/THconEoig==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,  "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  ath11k@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the
 inputs of the ath11k on WCN6855
References: <20240814082301.8091-1-brgl@bgdev.pl>
	<83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
	<87msk49j8m.fsf@kernel.org>
	<ed6aceb6-4954-43ad-b631-6c6fda209411@kernel.org>
	<87a5g2bz6j.fsf@kernel.org>
	<3ba2ce52-4da3-4066-baf0-5bab1a9f872a@kernel.org>
Date: Wed, 25 Sep 2024 08:58:41 +0300
In-Reply-To: <3ba2ce52-4da3-4066-baf0-5bab1a9f872a@kernel.org> (Krzysztof
	Kozlowski's message of "Tue, 24 Sep 2024 10:04:59 +0200")
Message-ID: <87zfnw8eb2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_225848_518221_E3CF2D37 
X-CRM114-Status: GOOD (  24.54  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 20/09/2024 08:45, Kalle Valo wrote:
>
>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>> 
>>> On 19/09/2024 09:48, Kalle Valo wrote:
>>>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>>>>
>>>>> On 14/08/2024 10:23, Bartosz Golaszewski wrote:
>>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>
>>>>>> Describe the inputs from the PMU of the ath11k module on WCN6855.
>>>>>>
>>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>> ---
>>>>>> v1 -> v2:
>>>>>> - update the example
>>>>>
>>>>> I don't understand why this patch is no being picked up. The code
>>>>> correct represents the piece of hardware. The supplies should be
>>>>> required, because this one particular device - the one described in this
>>>>> binding - cannot work without them.
>>>>
>>>> I have already explained the situation. With supplies changed to
>>>> optional I'm happy take the patch.
>>>
>>> You did not provide any relevant argument to this case. Your concerns
>>> described quite different case and are no applicable to DT based platforms.
>> 
>> Ok, I'll try to explain my concerns one more time. I'll try to be
>> thorough so will be a longer mail.
>> 
>> In ath11k we have board files, it's basically board/product specific
>> calibration data which is combined with the calibration data from chip's
>> OTP. Choosing the correct board file is essential as otherwise the
>> performance can be bad or the device doesn't work at all.
>> 
>> The board files are stored in board-2.bin file in /lib/firmware. ath11k
>> chooses the correct board file based on the information provided by the
>> ath11k firmware and then transfers the board file to firmware. From
>> board-2.bin the correct board file is search based on strings like this:
>> 
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e0ca,qmi-chip-id=2,qmi-board-id=255
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e0ca,qmi-chip-id=2,qmi-board-id=255,variant=HO_BNM
>> 
>> But the firmware does not always provide unique enough information for
>> choosing the correct board file and that's why we added the variant
>> property (the second example above). This variant property gives us the
>> means to name the board files uniquely and not have any conflicts. In
>> x86 systems we retrieve it from SMBIOS and in DT systems using
>> qcom,ath11k-calibration-variant property.
>> 
>> If WCN6855 supplies are marked as required, it means that we cannot use
>> qcom,ath11k-calibration-variant DT property anymore with WCN6855 M.2
>> boards. So if we have devices which don't provide unique information
>
> No, it does not mean that.
>
>> then for those devices it's impossible to automatically to choose the
>> correct board file.
>
> Anyway, only this device must be fully described, because you cannot
> have pci17cb,1103 without these supplies. It's just electrically not
> possible, according to our investigation.

Yeah, you have been telling that all along. But on the contrary I have
WCN6855 (pci17cb,1103) M.2 board which I installed to my NUC and they
haven't needed any supplies (unless BIOS does something automatically).
Also I have QCA6390 and WCN7850 M.2 boards, both which you claim needs
the supplies, and they just work out-of-box as well. So I have a hard
time trusting your spec and believing it's the ultimate authority. To me
if reality and spec doesn't match, reality wins.

>> So based on this, to me the correct solution here is to make the
>> supplies optional so that qcom,ath11k-calibration-variant DT property
>> can continue to be used with WCN6855 M.2 boards.
>
> WCN6855 can still do whatever they want. They are not restricted, not
> limited. pci17cb,1103 must provide suppplies, because pci17cb,1103
> cannot work without them.

Claiming that WCN6885 can still do whatever they want is confusing to me
because WCN6855 is pci17cb,1103, there are no other ids. See
ath11k/pci.c:

#define WCN6855_DEVICE_ID		0x1103

{ PCI_VDEVICE(QCOM, WCN6855_DEVICE_ID) },

But this discussion is going circles and honestly is waste of time. I
don't think the patch is right but I'll apply it anyway, let's deal with
the problems if/when they come up.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

