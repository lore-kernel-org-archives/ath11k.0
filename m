Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E56FC54E67
	for <ath11k@archiver.kernel.org>; Tue, 26 Mar 2024 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeOLfPMdqRqnd4YCiCJ8ZccIXxfW6lhxWbHbTlADgAM=; b=cUPFES/Tmee7djRQ5T/Mrg9M/0
	rLgkU8rrlwudpkRFJbbcxZKptUgcwb/XhFxxNjotr1IY8w8Y2eVtHfnmgT3Qi0AgQbhkBTZ7akS1E
	e44RpR+troqdxwcVoAN+KcEhAROy9RyJQgiSHV8DsJTdYPzZHvTEVHWew2d6Ih7qGa+cl3crMAB4R
	AB1DGfkJBZ5be5sqGGydWMgbvxpp3f8QyyoRpThXPwEOT96vaAlNcgPeG8sfAO2O53BhVGk8HcIM+
	tTnlrROAD8ZqUl95+Y0wZQ26twKezwHXyy6m0Lrves0J0DWz0eb8cnu/VvelEdAR1I6QUFJYhAp6b
	1hLzqhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAFH-00000005dKD-2My3;
	Tue, 26 Mar 2024 17:05:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAFE-00000005dIr-2uYz;
	Tue, 26 Mar 2024 17:05:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3206612ED;
	Tue, 26 Mar 2024 17:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378A0C433F1;
	Tue, 26 Mar 2024 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711472751;
	bh=71bc6Icg2W+tsc/KrncHz55w8fQK/AdKxcY+zxw842I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8Z0eTCE91cnVLMjLsMZ5XnbXj46lolCBrEa2MuMCeOGKl2oNVv8YsfvE+OcWzfiR
	 2zZEvqlWd85/5mlWV+X3+eev3YcTeIbNtOytfIp97MmTfdvIP4a8oe/9oP5jsqhEih
	 KrEshn1lL9OneLTXy5A3ktgc7q0v/8hHhC+hUFQCQe22on3BOwFw+XtA/vv/IvGayB
	 hftb7+vs2AaKRqiZXmwNOIiE5v8kPXZX7paNsjz/IcH0HAfnNg+xjjp2EiWvbaYZEf
	 Myua/CeRUH2RRkxwg1P1O6ahhk60xu6EUI2aj/SxXWACo5VfjhGitiA4EGDc9nzM2I
	 xLIGc7N/yvZgQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rpAFK-000000006pW-44Tm;
	Tue, 26 Mar 2024 18:05:59 +0100
Date: Tue, 26 Mar 2024 18:05:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kalle Valo <kvalo@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ath11k@lists.infradead.org
Subject: Re: [PATCH v6 04/16] dt-bindings: net: wireless: qcom,ath11k:
 describe the ath11k on QCA6390
Message-ID: <ZgMAdvEADhJ8TXa9@hovoldconsulting.com>
References: <20240325131624.26023-1-brgl@bgdev.pl>
 <20240325131624.26023-5-brgl@bgdev.pl>
 <87r0fy8lde.fsf@kernel.org>
 <CAMRc=Mc2Tc8oHr5NVo=aHAADkJtGCDAVvJs+7V-19m2zGi-vbw@mail.gmail.com>
 <87frwe8jiu.fsf@kernel.org>
 <CAMRc=MdCv+vTMZML-wzRQqZZavquV3DABYM4KYw-HwqS47sTyw@mail.gmail.com>
 <874jct10yf.fsf@kernel.org>
 <CAMRc=Me5ef_kFDz0SyGZb4S+2Ma4i=Fek_tzwj+bYD4DGSV4mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me5ef_kFDz0SyGZb4S+2Ma4i=Fek_tzwj+bYD4DGSV4mA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_100552_833258_47CDE91B 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, Mar 26, 2024 at 05:32:55PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 26, 2024 at 4:12 PM Kalle Valo <kvalo@kernel.org> wrote:

> > >> Adding also Johan and ath11k list. For example, I don't know what's the
> > >> plan with Lenovo X13s, will it use this framework? I guess in theory we
> > >> could have devices which use qcom,ath11k-calibration-variant from DT but
> > >> not any of these supply properties?
> > >
> > > Good point. I will receive the X13s in a month from now. I do plan on
> > > upstreaming correct support for WLAN and BT for it as well.
> > >
> > > I guess we can always relax the requirements once a valid use-case appears?
> >
> > I think we have such cases already now:
> >
> > $ git grep ath11k-calibration-variant -- arch
> > arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:     qcom,ath11k-calibration-variant = "Fairphone_5";
> > arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:                     qcom,ath11k-calibration-variant = "LE_X13S";
> >
> > But please do check that. I'm no DT expert :)
> 
> You're thinking about making the required: field depend on the value
> of qcom,ath11k-calibration-variant? Am I getting this right?

No, I think Kalle is worried about requiring the supply properties for
certain PCI device ids, in case we have existing or future devicetrees
with those ids that did not specify them or that need not specify them
(e.g. any PC modules).

Currently we only have the X13s controller in mainline being described
by a PCIe endpoint node in DT, but it has a different id ("pci17cb,1103"
instead of "pci17cb,1101" which you are adding here).

The Fairphone controller is apparently not a PCI device at all.

Johan

