Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39F9CF58D5
	for <ath11k@archiver.kernel.org>; Fri, 20 Sep 2024 06:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYI0QfKTkhv5vVjAaol8Z4bFNMzAuIX2s2yrr5E+CSE=; b=axlQm4+UW6xHhQTT2IKmRzyUZY
	M2hD7HYZJBp3A8+J+G+mZYPcLM4RPRDWMsFUwboAT81HVAiKJYDUk7tJXmgqnBmbIkyjgiNX0BJsk
	Y/aI+2MBmirpwtEi5q9BkW65HfGJtbFGLG04FSU2aIlsmKt75Dx876WfwMeArjNT48lsutnRj15bQ
	im5U5NZ7ak6TeRWy/0eTLpFSYTz0vsvVD3xtADvnFKzHHcR0r/igLSmBzVNwEqZJdQb2bMP339Afy
	CDlWVm+O9nNigmdaSUlb0NW7virjAj4Oe68j74gpsepgQSRt4plP+ZxL9EOLOQ9HRn9HEQm/Hv5Ti
	Ua7gGN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srXP7-0000000BZNF-15gb;
	Fri, 20 Sep 2024 06:46:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srXP1-0000000BZMS-0VP4
	for ath11k@lists.infradead.org;
	Fri, 20 Sep 2024 06:46:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0573BA44196;
	Fri, 20 Sep 2024 06:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22086C4CEC3;
	Fri, 20 Sep 2024 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726814761;
	bh=apoiTdulUgf1Pl+6yC/F2xPSZOBOVYh4QJeaPl07Enw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=txVSHtHWAOcsqSlJ41k9P8WYFLd56Z7Nyfv4Wo4jLHODXkLcZKMSFSQq60z6YuqnL
	 yLAYbsJBkz/rcIThUmchQr7C/xzmgTWA91csEKbrOovBWmBX0WV7tr9E6dM1B49zm3
	 Qojk8vJqpv5pEXTbYZZzcYgEdJMfo/QFfrB32/oofPBNTg4uuErfjZAiPYZGI9hVzG
	 qIZRnUfwKOQBmAisGoaBEiYwkInUNZardAmfsLZ5u+sX4YFH4Zh4AHJmeaZf/sIXPI
	 fgiAqfaz85hyK0lX5fo+YjoMGm1Sk/qxby17zdYrc1X0fdutV4Mp0GY37V1JjkKF0f
	 dZxnyHwDiXYOA==
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
 <bartosz.golaszewski@linaro.org>,
    Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the
 inputs of the ath11k on WCN6855
References: <20240814082301.8091-1-brgl@bgdev.pl>
	<83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
	<87msk49j8m.fsf@kernel.org>
	<ed6aceb6-4954-43ad-b631-6c6fda209411@kernel.org>
Date: Fri, 20 Sep 2024 09:45:56 +0300
In-Reply-To: <ed6aceb6-4954-43ad-b631-6c6fda209411@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 19 Sep 2024 12:00:53 +0200")
Message-ID: <87a5g2bz6j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_234603_310397_FF43090E 
X-CRM114-Status: GOOD (  17.74  )
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

> On 19/09/2024 09:48, Kalle Valo wrote:
>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>> 
>>> On 14/08/2024 10:23, Bartosz Golaszewski wrote:
>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>> Describe the inputs from the PMU of the ath11k module on WCN6855.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>> ---
>>>> v1 -> v2:
>>>> - update the example
>>>
>>> I don't understand why this patch is no being picked up. The code
>>> correct represents the piece of hardware. The supplies should be
>>> required, because this one particular device - the one described in this
>>> binding - cannot work without them.
>> 
>> I have already explained the situation. With supplies changed to
>> optional I'm happy take the patch.
>
> You did not provide any relevant argument to this case. Your concerns
> described quite different case and are no applicable to DT based platforms.

Ok, I'll try to explain my concerns one more time. I'll try to be
thorough so will be a longer mail.

In ath11k we have board files, it's basically board/product specific
calibration data which is combined with the calibration data from chip's
OTP. Choosing the correct board file is essential as otherwise the
performance can be bad or the device doesn't work at all.

The board files are stored in board-2.bin file in /lib/firmware. ath11k
chooses the correct board file based on the information provided by the
ath11k firmware and then transfers the board file to firmware. From
board-2.bin the correct board file is search based on strings like this:

bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e0ca,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e0ca,qmi-chip-id=2,qmi-board-id=255,variant=HO_BNM

But the firmware does not always provide unique enough information for
choosing the correct board file and that's why we added the variant
property (the second example above). This variant property gives us the
means to name the board files uniquely and not have any conflicts. In
x86 systems we retrieve it from SMBIOS and in DT systems using
qcom,ath11k-calibration-variant property.

If WCN6855 supplies are marked as required, it means that we cannot use
qcom,ath11k-calibration-variant DT property anymore with WCN6855 M.2
boards. So if we have devices which don't provide unique information
then for those devices it's impossible to automatically to choose the
correct board file.

So based on this, to me the correct solution here is to make the
supplies optional so that qcom,ath11k-calibration-variant DT property
can continue to be used with WCN6855 M.2 boards.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

