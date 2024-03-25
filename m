Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC26C54E64
	for <ath11k@archiver.kernel.org>; Mon, 25 Mar 2024 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8fJKt2PfZbD8m5wpPDbobU5+s4FJFPVQhJJ0P7MOSY=; b=eMxa/ca4G+zQTbtZc02RVFliwa
	1ibV1aS1g8nkCgd6lZeRL/aYkr4Ogh4iQI3KkUHgeYW/dZ2gBZgd71fj81byUlprcAp4Bb5LRd3Ce
	rukBguhOHbSbPnoAzkohLlOr4+XrYtQT8U4rwfvNFwfDxIrwIca9r8I3XZ+EFsPUjxfYV0VjP5cYf
	u766PP4k5DPCQhcs9vgqbR1btMzjHsNmK+b/QVl122zSkyys23EN3TD+cEzO2RYTzrAdl/MjzQkBJ
	5JmNtckm0NHzhRvyN4sUwcIcKg7HN+zHo8Wo9BbbdBi81djnu7mPvCjrnDYAQjfoLzmnPDvXfvP+m
	a/BRI4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rolSU-00000000Gvx-14E1;
	Mon, 25 Mar 2024 14:37:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rolSJ-00000000Gpe-06CV;
	Mon, 25 Mar 2024 14:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BDCDBCE0EE1;
	Mon, 25 Mar 2024 14:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6A9C433F1;
	Mon, 25 Mar 2024 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711377460;
	bh=onRjf8TNnnxKbpEukinv+PxWlrvYWsRWXbj+9065TiI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OIy8Tezfr7vjlKApvzlLdl9x/9IAlZTNi8IbuxVJJEIJDM307bxfAiiFX03rew6jx
	 5Qswry5F75Fkkz1oKNVdx4J2nbKtY4XcShVEcus9lZnicasyTyxnfXw9OI92byUPdZ
	 kF0v2NCysr612g9LLir9A5zKBt51QEg9oZBDQV3hlMP3viCQA5GXhU75VPpoJujI6S
	 ESpukxkN8anYl87WTYPp7yTQePkGw88A8zuZA2dhop/fBxEb/tLaLkpIcqgKOPSJ1p
	 qZFwIUqUMbwmdHYUDAkyEqIu2ia7miGLkZf/y3aVsHiaR1Q5ccUEw5j2up2g+mHEJ3
	 DRt81EfjvJCzQ==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcel Holtmann <marcel@holtmann.org>,  Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>,  "David S . Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Konrad
 Dybcio <konrad.dybcio@linaro.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Bjorn Helgaas
 <bhelgaas@google.com>,  Saravana Kannan <saravanak@google.com>,  Geert
 Uytterhoeven <geert+renesas@glider.be>,  Arnd Bergmann <arnd@arndb.de>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Marek Szyprowski
 <m.szyprowski@samsung.com>,  Alex Elder <elder@linaro.org>,  Srini
 Kandagatla <srinivas.kandagatla@linaro.org>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Abel Vesa <abel.vesa@linaro.org>,
  Manivannan Sadhasivam <mani@kernel.org>,  Lukas Wunner <lukas@wunner.de>,
  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  linux-bluetooth@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-wireless@vger.kernel.org,  linux-arm-msm@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-pci@vger.kernel.org,
  linux-pm@vger.kernel.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,
    ath11k@lists.infradead.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v6 04/16] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
References: <20240325131624.26023-1-brgl@bgdev.pl>
	<20240325131624.26023-5-brgl@bgdev.pl> <87r0fy8lde.fsf@kernel.org>
	<CAMRc=Mc2Tc8oHr5NVo=aHAADkJtGCDAVvJs+7V-19m2zGi-vbw@mail.gmail.com>
Date: Mon, 25 Mar 2024 16:37:29 +0200
In-Reply-To: <CAMRc=Mc2Tc8oHr5NVo=aHAADkJtGCDAVvJs+7V-19m2zGi-vbw@mail.gmail.com>
	(Bartosz Golaszewski's message of "Mon, 25 Mar 2024 15:09:12 +0100")
Message-ID: <87frwe8jiu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_073743_904611_57DA7EF1 
X-CRM114-Status: GOOD (  17.04  )
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

> On Mon, Mar 25, 2024 at 2:57=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wro=
te:
>
>>
>> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>>
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > Add a PCI compatible for the ATH11K module on QCA6390 and describe the
>> > power inputs from the PMU that it consumes.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> [...]
>>
>> > +allOf:
>> > +  - if:
>> > +      properties:
>> > +        compatible:
>> > +          contains:
>> > +            const: pci17cb,1101
>> > +    then:
>> > +      required:
>> > +        - vddrfacmn-supply
>> > +        - vddaon-supply
>> > +        - vddwlcx-supply
>> > +        - vddwlmx-supply
>> > +        - vddrfa0p8-supply
>> > +        - vddrfa1p2-supply
>> > +        - vddrfa1p7-supply
>> > +        - vddpcie0p9-supply
>> > +        - vddpcie1p8-supply
>>
>> I don't know DT well enough to know what the "required:" above means,
>> but does this take into account that there are normal "plug&play" type
>> of QCA6390 boards as well which don't need any DT settings?
>
> Do they require a DT node though for some reason?

You can attach the device to any PCI slot, connect the WLAN antenna and
it just works without DT nodes. I'm trying to make sure here that basic
setup still works.

Adding also Johan and ath11k list. For example, I don't know what's the
plan with Lenovo X13s, will it use this framework? I guess in theory we
could have devices which use qcom,ath11k-calibration-variant from DT but
not any of these supply properties?

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

