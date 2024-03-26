Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3A9C54E67
	for <ath11k@archiver.kernel.org>; Tue, 26 Mar 2024 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOr59TnSNbuwHyStgA1CmYTb0lQTvUXQGbs4RuFJ7g0=; b=ox6RotcMbcooNQIjKFx9KDUV9Y
	TYk/ySBtjbjOvjJexy/xNpwm6dOS0kr5aHzvU5sXCyDPvMV6PHGsA4+hb+vCiRq3EMM3nylgvvzrq
	eeq4JKJkJUPJb+VJAJuX7m6TFznG6TJeTunk7UGshg/84KLZov/0hM+kdS4pQ5mSc4qJD5En9QHSU
	aqVP23Dv5yo79iulVBiWbA1qRnXgfybdAlxKIQ0nv6r04sSTyMTE7Pgf91jWs0Dl63FEEzLZoNjL/
	GTNPZaikFrx/9AYEiW+nb0qkhUXa58nC6UoS/i/iQ4dPI0fKGNy7CMV0/6NwQfApbO8HFQurQqRry
	gi4k1r3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1tr-00000003YUs-3Ir6;
	Tue, 26 Mar 2024 08:11:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1to-00000003YUF-1uRr;
	Tue, 26 Mar 2024 08:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63906CE1EC6;
	Tue, 26 Mar 2024 08:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9209BC433F1;
	Tue, 26 Mar 2024 08:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711440669;
	bh=qgPYrZ/NPDwrw9n8R5vjfsAIwZpztvwYlvGEZ1/cqwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJWLaQVrmHkXdPfZu2CLehPVBt1a3A07VW9D2hHdhmdx1dfdxfVkVKCTg3D62osKG
	 covenVtPafFo/IsLWh5g6/g3y4hUOYHVaYVuutRm+dDNWvFegJiXJkyb9LPukcVk1u
	 m2VKGv9L+iOGqzN1zqikyJWB7X2H+66W3diLGpPYXcd955q0ivSrK5+w1rrysq8ScW
	 jQgegNSKueMZQeTO9BeBWfCCjyuJE8rYmEQ3DowcaWuUvoIMe1slI1gbwfkLgkTh5p
	 0SWFa6/UJfRQdfXuO3A8YQwEULv6J+4OPmMdm50N29USGF6PCDE72cs+NvDxnyRPel
	 LHLk7KAb/beXQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rp1tr-000000005vk-2JeX;
	Tue, 26 Mar 2024 09:11:16 +0100
Date: Tue, 26 Mar 2024 09:11:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Marcel Holtmann <marcel@holtmann.org>,
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
Message-ID: <ZgKDI4Es11aN5nx7@hovoldconsulting.com>
References: <20240325131624.26023-1-brgl@bgdev.pl>
 <20240325131624.26023-5-brgl@bgdev.pl>
 <87r0fy8lde.fsf@kernel.org>
 <CAMRc=Mc2Tc8oHr5NVo=aHAADkJtGCDAVvJs+7V-19m2zGi-vbw@mail.gmail.com>
 <87frwe8jiu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frwe8jiu.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_011112_978847_8DBD5A06 
X-CRM114-Status: GOOD (  23.32  )
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

On Mon, Mar 25, 2024 at 04:37:29PM +0200, Kalle Valo wrote:
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
> > On Mon, Mar 25, 2024 at 2:57 PM Kalle Valo <kvalo@kernel.org> wrote:
> >> Bartosz Golaszewski <brgl@bgdev.pl> writes:
> >> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >> >
> >> > Add a PCI compatible for the ATH11K module on QCA6390 and describe the
> >> > power inputs from the PMU that it consumes.
> >> >
> >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> [...]
> >>
> >> > +allOf:
> >> > +  - if:
> >> > +      properties:
> >> > +        compatible:
> >> > +          contains:
> >> > +            const: pci17cb,1101
> >> > +    then:
> >> > +      required:
> >> > +        - vddrfacmn-supply
> >> > +        - vddaon-supply
> >> > +        - vddwlcx-supply
> >> > +        - vddwlmx-supply
> >> > +        - vddrfa0p8-supply
> >> > +        - vddrfa1p2-supply
> >> > +        - vddrfa1p7-supply
> >> > +        - vddpcie0p9-supply
> >> > +        - vddpcie1p8-supply
> >>
> >> I don't know DT well enough to know what the "required:" above means,
> >> but does this take into account that there are normal "plug&play" type
> >> of QCA6390 boards as well which don't need any DT settings?
> >
> > Do they require a DT node though for some reason?
> 
> You can attach the device to any PCI slot, connect the WLAN antenna and
> it just works without DT nodes. I'm trying to make sure here that basic
> setup still works.
> 
> Adding also Johan and ath11k list. For example, I don't know what's the
> plan with Lenovo X13s, will it use this framework? I guess in theory we
> could have devices which use qcom,ath11k-calibration-variant from DT but
> not any of these supply properties?

In theory we could, but at least the WCN6855 in the X13s has a similar
set of supplies and enable gpios which are currently not fully described
in the devicetree as there has been no support for doing so thus far.
Instead we rely on the bootloader to enable the module.

I haven't had time to look at the latest attempt on adding support for
handling such resources, but eventually we'll need to address this in
some way.

Johan

