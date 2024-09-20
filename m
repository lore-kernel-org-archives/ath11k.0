Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE0CF58D4
	for <ath11k@archiver.kernel.org>; Fri, 20 Sep 2024 06:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jm++1wuc71B/T2jWb5Fdgn/TpZ0XkahTOAAPZlHXgMU=; b=cbbcVI3TttsNXLPBmYj3rzR1+o
	9u1NcqPZUPIwFIUyz1kN35Ij5+ynPH+/STPGYB6UrqzELaXjWrfSOolWf5UOjguAolvbmDMWx7eSJ
	08mDThVaiQrEApAd1HY2HozeJfdUJ/+/gzy9k24981/B9R+HtTwdrXjs68pQoStl48EhzAEenMKwM
	/HHVVHXEWYh5o+ft4f3dy4VPE/gULZRjW4QidMfMpDscs8XDS+mVwxRd3RloQw8K408VInNp3jODJ
	MWPQcpn56kb5dgNJlwvj+qIaDt/hYR/OznPJ7OCkKUDTS+/Awzxi7MGfEbKamqXUgI4gJOxzAogWZ
	VkLIuVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srX2A-0000000BX5z-2fRX;
	Fri, 20 Sep 2024 06:22:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srX27-0000000BX5Y-1Wou
	for ath11k@lists.infradead.org;
	Fri, 20 Sep 2024 06:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C01F5C5CB5;
	Fri, 20 Sep 2024 06:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36798C4CEC3;
	Fri, 20 Sep 2024 06:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726813341;
	bh=+jAirL1/oeAkkDpgdQtrPbO8kpNl79De0V9vN6W6MbM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=b5fVjqgBli9C8jpCq2u03zWPjW/REQgQXeNkVT/QXCSqO2Ith8qnm+/Zz9eKOyAfC
	 4a42udKV8uWCIrB4IRBUO/3qJDMSnadIqgDKZk/BF21eZCoA2jiZNAnvBava0QydWJ
	 3LRcNz/Z0siGhNYFQibbhDnUzJaly8rsGt4GeI7ar+DeGupHMJqCm+vjAw7aJxlWc2
	 AeaM+Q0N06b5lOFgN8yZRLeLLSEBH22mwbNEXTUVthgBgPRtEvzVzBb+Z5u/33PO1+
	 6/jjt+FxTJC/bIfMUBVKAwFZ1zmxGLyctrX3gcg1xRZcAKClsE07C7lf0jH7YRRsmV
	 8U7i25yy2cBIA==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>,  "David S . Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  ath11k@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the
 inputs of the ath11k on WCN6855
References: <20240814082301.8091-1-brgl@bgdev.pl>
	<83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
	<87msk49j8m.fsf@kernel.org>
	<CAMRc=McEWWm8N++4a5LMCAa0GWsQdi0KuSpj3ZuS_he=H0LP+w@mail.gmail.com>
Date: Fri, 20 Sep 2024 09:22:16 +0300
In-Reply-To: <CAMRc=McEWWm8N++4a5LMCAa0GWsQdi0KuSpj3ZuS_he=H0LP+w@mail.gmail.com>
	(Bartosz Golaszewski's message of "Thu, 19 Sep 2024 03:59:17 -0500")
Message-ID: <87ed5ec09z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_232223_561348_61E1B10E 
X-CRM114-Status: GOOD (  21.91  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> On Thu, 19 Sep 2024 09:48:41 +0200, Kalle Valo <kvalo@kernel.org> said:
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
>>
>
> No, silent NAKing and needless stalling is what you're doing. I responded to
> your last email with extensive clarifications. You're being told by the
> experts on the subject matter (Krzysztof and Conor) that the change is correct.
>
> The change has no functional impact on the driver code.

Until now it was possible to use qcom,ath11k-calibration-variant DT
property with M.2 devices. If your patch is applied that's not possible
anymore.

> It's also in line with commit 71839a929d9e ("dt-bindings: net:
> wireless: qcom,ath11k: describe the ath11k on QCA6390") under which we
> had literally the same discussion and that you ended up picking up
> after all.

I don't care about QCA6390 as it's not really used anywhere anymore. I
picked up 71839a929d9e, even though I considered it to be wrong, so that
your pwrseq subsystem is not delayed. But WCN6855 is a different matter
as it's more widely used.

> Arnd: I've added you here to bring this to your attention because it's somewhat
> related to what we discussed yesterday. It's a change that is very much
> SoC-specific, that has trouble getting upstream due to the driver's maintainer
> unwilingness to accept it. Is this a case where a change to DT bindings should
> go through the SoC rather than the driver tree?

Like I have said, I'm happy to take the patch if the supplies are
optional. Why can't we do that?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

