Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E32ED0D79F
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agsEw5izBQb/99jTGL7ePLwAdolllYXCGNbOdq5dUEM=; b=MfoMHiJv9KMIEWZBVqqy324m/z
	FReEqIMc8ahs5/DYippLovPudYy0/w7qUO7eUBtfKBDo5vRoIlE/UNHtRH1xa5Cxo+RRGX5b5LtSL
	4KoZP4byKA8MZKjNmhxnaDrmLr2Tqv7CF2gcXn7dMGJtVjUPVYrlKYW16yCWBxbd/nBTw1mdKnnEE
	pleuwNR0WhVmypCWmI105xYZLuX73R0EtPpZqP1uk419rbJ8vUXUN4HedzJ6oGXtFlADd/sIwBi8J
	AH2usrR1Yx1d8AhEyslkxLdqNF5hNQlHSwa4icaiW7UJkcoqwwOuo8GXa426OnLUGylUuKI43LWz9
	x2eA1Dxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGra-0000000GeiQ-3oqI;
	Fri, 11 Oct 2024 14:43:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGn5-0000000GdDL-1MmA
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 14:38:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 56F685C5614;
	Fri, 11 Oct 2024 14:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323BFC4CECE;
	Fri, 11 Oct 2024 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728657530;
	bh=LzEU21kvQ/WYUwcS587liGJ+TJpJqMynD+RPNGMcEyQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TVqKtJyimpsTwPQWNy0t/CPaza1/QLu78d8KOIzDaeSkWrw1bjEx3023I5JFFVRN7
	 7Q/5yCwLLvi+9sXOKQPl7sEHsweToIi8I8rZLXsNIUwvS2VcassIOsaR3FfdMUaa+w
	 XPbfdnaGG7Jdt20eSR/vgVZMlbWU2eOooUQNnnlznRUFeRlClzVrz0iAidkdO/ZEAB
	 rgm84ADLE5RuoRaZJ1/58BG885nLiNCH4kmNOsE9szmlfRe5biY/UBi9SQb1oV07rf
	 8NGY4be/C4kx5El1+EhIrzVEbo0M4AcNU5RH59eKi3CkIYeUuXISOXeUXXwR59/GNg
	 QVfB8GVhEmArw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jianhua Lu <lujianhua000@gmail.com>,  Bjorn Andersson
 <andersson@kernel.org>,  Konrad Dybcio <konradybcio@kernel.org>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jeff Johnson <jjohnson@kernel.org>,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
References: <20241010072243.10227-1-lujianhua000@gmail.com>
	<20241010072243.10227-2-lujianhua000@gmail.com>
	<pbsooimr6l65hgyxezyp6ha3zqibgdlphmeb7vtghgy2wti66b@fsmptbss2zvi>
	<87h69i7v8c.fsf@kernel.org>
	<p4j7i6fbr7htsh44vumlsziuhbl4phqok4zxnubdvyrjo2cllt@cez4iynfjayt>
Date: Fri, 11 Oct 2024 17:38:46 +0300
In-Reply-To: <p4j7i6fbr7htsh44vumlsziuhbl4phqok4zxnubdvyrjo2cllt@cez4iynfjayt>
	(Dmitry Baryshkov's message of "Fri, 11 Oct 2024 16:46:14 +0300")
Message-ID: <87ttdi66x5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_073851_440781_B1EBF63E 
X-CRM114-Status: GOOD (  11.25  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Fri, Oct 11, 2024 at 02:08:19PM +0300, Kalle Valo wrote:
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>> 
>> >> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> >> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> >> @@ -680,6 +680,25 @@ &pcie0_phy {
>> >>  	status = "okay";
>> >>  };
>> >>  
>> >> +&pcieport0 {
>> >> +	wifi@0 {
>> >> +		compatible = "pci17cb,1101";
>> >> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> >> +
>> >> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> >> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> >> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> >> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> >> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> >> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> >> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> >> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> >> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> >> +
>> >> +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
>> >
>> > Let's wait for Kalle's response.
>> 
>> Sorry, I don't know what you refer to here. I have been extremly busy
>> with MLO patches so drowning with mail right now :/
>
> Just an ack for the calibration variant name.

Ah, then ack from me for the name. Thanks for following these.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

