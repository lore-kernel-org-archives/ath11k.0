Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B369CFD35C
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GjJXfPzJ7A0h6sY6gPeazKd5VCiXQBjQ5A4qAZwhK6E=; b=PVSDN0GsJh98W7CceaD4aGbr+J
	a5kS8mrxI7gAAXlzl9vmLWjrUX+/5os5ImcORFp/kykFpT6FJQUyuGt7aKtcDaE113zbNueGtTMTE
	iyhi3/vZsQ77YrwNCcGea/mvcZWR5je276v6DP7jpC9Kq3cx7R5YOCZ/cmxECrViopy/rFoLMbZXY
	OStlED7S3+syVcSA92JOTDopOcrUoonjzKnY/BxM8kATd69xARUEo+w1XF3I/d6+iUpCKuIwfx16T
	JGKjVScjZHbf4pw1+NgpRJ1VmmDI7uczFmKqqNGWY0M+QvFzSqQIoqKDZwJZL6blWoCVz4B1jB8HG
	xySUx4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEZP-0000000GGMo-3cvz;
	Fri, 11 Oct 2024 12:16:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szDVR-0000000G6lv-0x8o
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 11:08:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 036005C5E5F;
	Fri, 11 Oct 2024 11:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C52C4CEC3;
	Fri, 11 Oct 2024 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644903;
	bh=tItc0jJqioiJKJBYJHlOGatN0iSrXx49oxnZO+FaE5w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=rPgcR1fkqJXIbp90DIP1kI86Ic7xUtxihl4nQwXx4jkzcxbPfDhx05dkOfu8y9aZY
	 GvLpqa7ybnU9lCnoOFnMeQakOHbno8MPRafGPxjYbNcc/xXaXMi7tSfphp6uCSsDjY
	 Sz70ReKMrmipk+yhLvgVqkcB+iIQanNg1Qx1Dr6PrEq4PuiZjF/C4S5+z5Ok4ilzu7
	 o6nHyFafswmHP1BcTRugvXMbmuFV4bCTS2aVhmkRseOPSB1sAHS7/61jGzN6quKDnS
	 d0K5TjQYelyCUSvnIDOilK6eHDpkqE67RUucX6egiLk6YW4xsFymKVwz6P0oSDPthu
	 AzMVr8qW2w4vw==
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
Date: Fri, 11 Oct 2024 14:08:19 +0300
In-Reply-To: <pbsooimr6l65hgyxezyp6ha3zqibgdlphmeb7vtghgy2wti66b@fsmptbss2zvi>
	(Dmitry Baryshkov's message of "Thu, 10 Oct 2024 18:23:13 +0300")
Message-ID: <87h69i7v8c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_040825_341704_871F9622 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

>> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
>> @@ -680,6 +680,25 @@ &pcie0_phy {
>>  	status = "okay";
>>  };
>>  
>> +&pcieport0 {
>> +	wifi@0 {
>> +		compatible = "pci17cb,1101";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
>> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
>> +
>> +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
>
> Let's wait for Kalle's response.

Sorry, I don't know what you refer to here. I have been extremly busy
with MLO patches so drowning with mail right now :/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

