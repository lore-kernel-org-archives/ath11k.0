Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ECAC54E67
	for <ath11k@archiver.kernel.org>; Tue, 26 Mar 2024 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ArbNmKuqj8b0RVHUypMVZ5PR/HlIUsl2kb5KhMcHUo=; b=SAdIm5ohYZWDYJ8m0jmoUCE/5I
	NXVI18XemMnySr2IZq5rZXQsKS+Hr4axmORBbRSR3WJ2SwGJJtq3HZzl0ZZCKi+59NKGBTuHQIg9P
	yltKVpBIDrEAH7BzSuG7KYilz+Wp+Fq1ooDFlm52MqQTUW7J8SpSr61u+R/6JehBC78k94YiwDkeJ
	oy3AVugoJzx5oiJ7NphTu6TFks+gzS8G1SCU0JfVWkvUZZz69nsWMBuG8r3KquPr7v+yzrQyzMuwr
	16XIkBD3Ltk0pPlNJZ4FO3XLgMhUCL2bMIsXdBSnMzhbkjEnER+nOGOcpYWfqufJQU7K651+SN5a4
	9fpMsuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8U4-000000055lS-21R0;
	Tue, 26 Mar 2024 15:13:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8U3-000000055l4-12aT;
	Tue, 26 Mar 2024 15:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/ArbNmKuqj8b0RVHUypMVZ5PR/HlIUsl2kb5KhMcHUo=; b=l2AV2wQP3MCmMVG+TfOBHxw9xt
	lTNanz77NtXlI9sFN9aFmv/rv2OniSx6fIb2sytQMx0h53/nF0gcGtBbm3Smjq/eyK3GvypvOO5HZ
	3Kis+3ZpTWlJu4/qaSAFS8tu6kBH7/GuHqW3tkG5VOqFLtS066Oq0h8B6dtPoE1QXvcFeB7u8uUm6
	vMbJmuzb8Ee7UC2M85HvRi0kVT/Dw1azmg6hJo8qaLqKPIAUubk6pMW3WL4SxuyFM/TuBZdzM3iWQ
	67SN2tuiuf5Ev3gy6jVzc8yUAHdUIeRRLnj9lq3UPXhmZlFclxn0fHvPBpfcJiNVAzSXb7vKW6Jfh
	tSP2OBZw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8Ty-0000000HGGK-0uOw;
	Tue, 26 Mar 2024 15:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AFDDBCE1AE9;
	Tue, 26 Mar 2024 15:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B32C433C7;
	Tue, 26 Mar 2024 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711465968;
	bh=ikOFR/1UVd3fugnFnAzk4C55A/EtnmPKtVt0ZnsoBy4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OnsBfmYQ3kUcVfwdwLlABczD8xqZdTvhAxEk92k45DN6zQl3R3V8BxEPB52RsIOJU
	 stjQT1G1rdii90U9qXs98IyMNHaaDTCEQRCjheQiJfv7GsfcP7WTfAP4YJC9bTC3E2
	 U4oFUkXDi460w83MY86vMBZHhUlFJ0pfP1iQycDWwr8EXMRByqPpmCcdVUZhE/Einj
	 E6YlO5SgsJNklcUdUcS8LDVPeYonQPsEUDpnoUl37oHfn/onPcn2ao3QZ3HiUzlsRv
	 MzSCIzTfANfgo2cPdqYHxv5qhQzfesdvGwwYarZJxx3Kfgylj7B1kLIkeyxpS7QNck
	 r6RdCdboYcXKQ==
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
 <bartosz.golaszewski@linaro.org>,  ath11k@lists.infradead.org,  Johan
 Hovold <johan@kernel.org>
Subject: Re: [PATCH v6 04/16] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
References: <20240325131624.26023-1-brgl@bgdev.pl>
	<20240325131624.26023-5-brgl@bgdev.pl> <87r0fy8lde.fsf@kernel.org>
	<CAMRc=Mc2Tc8oHr5NVo=aHAADkJtGCDAVvJs+7V-19m2zGi-vbw@mail.gmail.com>
	<87frwe8jiu.fsf@kernel.org>
	<CAMRc=MdCv+vTMZML-wzRQqZZavquV3DABYM4KYw-HwqS47sTyw@mail.gmail.com>
Date: Tue, 26 Mar 2024 17:12:40 +0200
In-Reply-To: <CAMRc=MdCv+vTMZML-wzRQqZZavquV3DABYM4KYw-HwqS47sTyw@mail.gmail.com>
	(Bartosz Golaszewski's message of "Mon, 25 Mar 2024 17:23:35 +0100")
Message-ID: <874jct10yf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_151258_885407_532E77EE 
X-CRM114-Status: GOOD (  17.23  )
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

>> >> I don't know DT well enough to know what the "required:" above means,
>> >> but does this take into account that there are normal "plug&play" type
>> >> of QCA6390 boards as well which don't need any DT settings?
>> >
>> > Do they require a DT node though for some reason?
>>
>> You can attach the device to any PCI slot, connect the WLAN antenna and
>> it just works without DT nodes. I'm trying to make sure here that basic
>> setup still works.
>>
>
> Sure, definitely. I there's no DT node, then the binding doesn't apply
> and the driver (the platform part of it) will not probe.
>
>> Adding also Johan and ath11k list. For example, I don't know what's the
>> plan with Lenovo X13s, will it use this framework? I guess in theory we
>> could have devices which use qcom,ath11k-calibration-variant from DT but
>> not any of these supply properties?
>>
>
> Good point. I will receive the X13s in a month from now. I do plan on
> upstreaming correct support for WLAN and BT for it as well.
>
> I guess we can always relax the requirements once a valid use-case appears?

I think we have such cases already now:

$ git grep ath11k-calibration-variant -- arch
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:     qcom,ath11k-calibration-variant = "Fairphone_5";
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:                     qcom,ath11k-calibration-variant = "LE_X13S";

But please do check that. I'm no DT expert :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

