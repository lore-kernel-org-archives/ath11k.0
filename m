Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0616D5CC9F
	for <ath11k@archiver.kernel.org>; Wed, 30 Oct 2024 11:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbuZLEq7vQaYUmIhGec8BBDdbFRDmIKWFU6VUpdZRzw=; b=SUOfEDOZG4hfPXJA7O4JTEJ8N+
	Kdza1E8aTOlP6SXzzjw65O2SwZ8sbDNBgezTHSglZpsf+TbXSZZGZI1KF/KkrES/0J70G5piFFng1
	kkSmN8tFsww9pTqFD2EjoivxZ8y541JEOYJKkMKFP9MmkMJ56VsYZRC1V5PsOxrRGuzOMs85vu0fq
	Nc7odxHY1AFlDUSKZWA47rXTqIKHW0Es0OAhxfEDISz32CguFB6CQRNPSxV1/DXCXaLGS4gP8Un/0
	yNYV+tdaJa6iODjKjJz776kK1vZTmZgjrRNMMOJwVRux9DocBQ+gOJAs4YlFSS2pGxEc+i2A6vjkP
	+zrC7Qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67K2-00000000F29-1RIE;
	Wed, 30 Oct 2024 11:57:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67Bj-00000000DBW-1v39
	for ath11k@lists.infradead.org;
	Wed, 30 Oct 2024 11:48:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8F2E5C5D9E;
	Wed, 30 Oct 2024 11:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166A6C4CEE5;
	Wed, 30 Oct 2024 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730288914;
	bh=vQdaZWTismRSR1RwA+QoQPnrWdtdxnycqAXlRNG5AkE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fSBOKeT4rskvYGzrKk+t6aHGUIJ025NhddV3on3sW/l4LJ1ggN/M7zjLk3W8RThkW
	 cJz3xCqdANv6RQDLv0VNZAxvMQ21OjgR7WI7M5WtfKbh8X6hNS2lghtxoJqwq1f+4t
	 AfpLrauefNC2u0a4C2yDnR+rtBKk5SCOwK/ForLraNhHLxDgi/WTk7Cb9AsTE6AQdf
	 KGDM/jv1OeqR8+nkZ+RRIMez5KmRBoqtQlEgpX5cOulMcwU7y0ax6zPAgI/Rpczl/4
	 gRfK8E9qLuM+p41dVyCGsKQSiOVSEgWDyLLCO79QEpHSHgb9HS+Jc68X9Zlk1t9UEl
	 vAGgUOmXH0ocQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  jens.glathe@oldschoolsolutions.biz,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Merck Hung
 <merckhung@gmail.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,
    ath11k@lists.infradead.org
Subject: Re: [PATCH v6 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for Windows Dev Kit 2023
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
Date: Wed, 30 Oct 2024 13:48:30 +0200
In-Reply-To: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
	(Jens Glathe via's message of "Wed, 30 Oct 2024 12:02:00 +0100")
Message-ID: <87r07xzu9d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_044835_605583_6AD31344 
X-CRM114-Status: GOOD (  15.95  )
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

Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> writes:

> "Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"
>
> Device tree for the Microsoft Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>
> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
>
> Supported features:
> - USB type-c and type-a ports
> - minidp connector
> - built-in r8152 Ethernet adapter
> - PCIe devices
> - nvme
> - ath11k WiFi (WCN6855)
> - WCN6855 Bluetooth
> - A690 GPU
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
>
> This dt is more or less deducted from the Thinkpad X13s.
> It contains a lot of guesswork, and also a lot of research on
> what works with the Windows Dev Kit.
>
> The WiFi definition references qcom,ath11k-calibration-variant = "MS_Volterra"
> which is unfortunately not yet in the linux-firmware. The ath11k driver finds
> the default one for 
> "bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2|18,qmi-board-id=255"
> when the entry with the variant is not found which is quite sub-optimal. I 
> have placed a pr on github/qca-swiss-army-knife:
> https://github.com/qca/qca-swiss-army-knife/pull/9 that provides an amended 
> board-2.bin and a board-2.json to generate it. 

qca-swiss-army-knife is only for scripts or similar, not for board
files. For ath11k board files it's best to file a bug in bugzilla:

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html

For ath11k discussions we have a mailing list, adding it now:

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/mailinglist.html

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

