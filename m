Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0430ECFD36E
	for <ath11k@archiver.kernel.org>; Fri, 11 Oct 2024 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/vmXyhxw2IBfQWjUySbO7rnVc7zoAAFf/g2ovOLpcA=; b=yUMdx2jikfkGSecZc6GdZjQSE1
	5JxSfBFiHRmeDhVyG6CHbsehF8zJGQ/9r+ciLxYUDA9flwQJIoxd8KwIZjMKLcQOUYSfeWw0dRVoY
	epX0vPpyE6MaASLHkP0BGI+W3jI2X1iA4QZSZMtJjCpev1Gjct3bA+xZjAZODiv9NfrLmK+/1Stc+
	R4pGv1+1WdZeDFU0i/f/2cLEeV7nMfqloUeeOCFm8fVgQDJqkiQEtLolJDEtdCFtuXDIEjCRUzDQE
	VIeCJtdaiyoHLgJb+LNq+cxCxO6J1VoUkKaXkMliub8OpfG/9az5FUqlHZs5+vhrImNJCJPIcmTDG
	7l42m1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEZR-0000000GGO6-2ihL;
	Fri, 11 Oct 2024 12:16:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szDcE-0000000G7XD-0JFS
	for ath11k@bombadil.infradead.org;
	Fri, 11 Oct 2024 11:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M/vmXyhxw2IBfQWjUySbO7rnVc7zoAAFf/g2ovOLpcA=; b=me5B6uj65QzrwP82FzRhq2CB4Y
	5rAWJ5EkloDQPRDNvZG6cDukksr5m0M7pgPhnH5ky7ZWdqDMNh1fbfdERvex9Eh4FN2NUdjuxx3q/
	NEJf202aEbZWWGzskawd9ZiwkX7KEfsV3K4WPvXXLvGqMW59EIJfWlhYOZlLvrFPEoDV0w5naslbI
	aFK0hV8EFrPwz9FG8GtqO3tRphw2BT/5ylFBRWtkifDylU/iiv5Ykq4jkmXWB03sGix7JumEOU7DD
	gHBPYgUDjWfQV7QHEqC6ICvStYQ8Gh9NDzOOHcE0/v3mExrKpuCRngLr1/3rWQlwJglYRRq+3wC6I
	HFiIN5Jg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szDcA-00000005s3O-2pqv
	for ath11k@lists.infradead.org;
	Fri, 11 Oct 2024 11:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 805C9A43945;
	Fri, 11 Oct 2024 11:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7779FC4CEC3;
	Fri, 11 Oct 2024 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728645318;
	bh=/wxFnjdd8oLQxNU2I2l9u/U9YVjipKQwmvkmr0gU8+0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lzmS/NPECTpCG/XMh0pRfsGFUffBTP/KfNudbr9CYgTkNCKSxRyJtqHO+Ey5tHFgq
	 DUBblhya6G1id79W7EgVEF2ekJcWgLS96x5qY5lco7//y/Y5TYjItDmXkiw2R3QygH
	 vCxgWKWJ9DnRkD2zMJMCwpBaLYge4BoJlGX1qe0SkzGW1uCRsy2IFrHI8cIDaExuDy
	 YZAl1fDfzF/pTfk0sB+0nC41aF9WXemr4Ivv1JqxFWhuJXcl4aR8uLpLNo6BjIo8FJ
	 e4jJn69cB2zvGgFyC5yG8Us/Oz9Ipu/VIvR/w3Y+WJDMhhA5tBodcgQgPdaUO24KTY
	 3RpoAUoO0aFJg==
From: Kalle Valo <kvalo@kernel.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  <linux-arm-msm@vger.kernel.org>,  <linux-media@vger.kernel.org>,
  <agross@kernel.org>,  <andersson@kernel.org>,
  <linux-kernel@vger.kernel.org>,  <konrad.dybcio@linaro.org>,
  <mchehab@kernel.org>,  <quic_vgarodia@quicinc.com>,
  <stanimir.k.varbanov@gmail.com>,  <quic_jjohnson@quicinc.com>,
  <ath11k@lists.infradead.org>
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
	<asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
	<cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
	<3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
	<c6c5068d-ed05-4b49-97e1-f4962839cf44@quicinc.com>
Date: Fri, 11 Oct 2024 14:15:14 +0300
In-Reply-To: <c6c5068d-ed05-4b49-97e1-f4962839cf44@quicinc.com> (Miaoqing
	Pan's message of "Fri, 11 Oct 2024 10:57:22 +0800")
Message-ID: <87cyk67uwt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_121523_007238_33D79B0E 
X-CRM114-Status: GOOD (  13.83  )
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

Miaoqing Pan <quic_miaoqing@quicinc.com> writes:

> On 10/10/2024 10:40 PM, Dmitry Baryshkov wrote:
>> On Thu, Oct 10, 2024 at 09:59:11PM GMT, Miaoqing Pan wrote:
>>>
>>>
>>> On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
>>>>> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
>>>>> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
>>>>>
>>>>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>>>>> ---
>>>>> v2:
>>>>>     - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>>>>>     - relocate pcieport0 node in alphabetical order.
>>>>> v3:
>>>>>     - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
>>>>> v4:
>>>>>     - update 'ath11k-calibration-variant' to "Ride".
>>>>
>>>> What exactly is Ride? Is there just one Ride board? I thought it's a
>>>> board family name.
>>>
>>> I just follow the existing boards, 'Ride' is a board name. Both 'Ride' and
>>> 'Ride r3' boards are attached with WCN6855 WLAN chip.
>>>
>>> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112:
>>> qcom,ath11k-calibration-variant = "Fairphone_5";
>>> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958:
>>> qcom,ath11k-calibration-variant = "SHIFTphone_8";
>>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	
>>> qcom,ath11k-calibration-variant = "LE_X13S";
>> There definitely are other Ride boards. I see patches related to
>> qcs8300-ride. Does that board use the same BDF file?  If not,
>> Qualcomm_SA8775P_Ride or QC_SA8775P_Ride sounds like a better approach.
>> 
>
> QCS8300 and SA8775P both use the same WiFi card, so the same BDF file
> will be used. The extra variant will increase the size of board-2.bin.

In board-2.bin one board file can have multiple names, that was designed
exactly for cases like this. So the memory inrease is just the size of
string (plus few bytes for the TLV headers).

Dmitry is correct here. It's much better to have unique names instead
trying reuse the same names for different hardware. For example, if
later we actually need different board files then that's simple to do
just in board-2.bin.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

