Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7929FECE57A
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 12:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAz7CwHNVqz/dlCK7NR0kL8RetmLQ1f1T0LwcpAIkgI=; b=tNT6qQH+vFls+P3FWF8/y5oKn5
	7TIRaHAEqyQ65eRDh4OhV/lABDjVqjpFrmaxtbgz2bqNwMrvcwjVXSIC1paVBHar1J6u+35cpDs6x
	ap8biXE0cvZ7lBiPh+yceHs7zjHzOzoYqpXXQ0A38Qda0H5hwoDbQrO/OJVrCyg2Jgv6roMJCGYzp
	tIIeqwsgP5h7m0C+NDp41IfKIQOBuj/H3dbAuk63KT7nkm3ohGr7jueV2NmsXNr8g4YFB2Dd29XnM
	yXACpvxP5t6CNyTcCOZLqBjTjPHiF81jHX6E1phffV/NuH51J6gDlkUz5DvrY7jKufnrqDNWwzpKI
	I63+dZkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snd4E-00000001m4O-09LJ;
	Mon, 09 Sep 2024 12:00:26 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncuu-00000001kIh-3zNB
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 11:50:50 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6b6b9867f81so36421357b3.1
        for <ath11k@lists.infradead.org>; Mon, 09 Sep 2024 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725882648; x=1726487448; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PAz7CwHNVqz/dlCK7NR0kL8RetmLQ1f1T0LwcpAIkgI=;
        b=EhFx35TAPLrFVeCsQ6rPb2QxOgFB9SuEzbemkb7XQHjxsDaMUxIZZFXw2I7g/tEAfu
         x1DXEnriEB4nl4NmxuQEIqgN98SKcXB+qnEJqeIxU0RfXE6cg8qM4ZexlHSlK4NY+RFY
         kMruM69zKjXDTmJ+tWIcmcVRvlSDtode++KWRP69wbuQieJz/e4Jizv7yIk+rM+5wc98
         olyUJZMBEKIOrVlJqadRM4fQxRr+DsLx0O9L0zUcL839AWgfJFs8pqut+iOCc3hokgJl
         OqhGbOBQwXNratu7td7SI+NIJu/a2bYhBiAFR45OVQjX4xibnI2jDHeho0lLU1+vE8ni
         6+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882648; x=1726487448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAz7CwHNVqz/dlCK7NR0kL8RetmLQ1f1T0LwcpAIkgI=;
        b=oV7/5Z2tplPv5e5uJdv08AyBc1VS4Qe4eXSxukTopbhhiOrRQXS/XyGQDVyIQyiGJ/
         vwPLyug4kYEoxzt3Yc0PRdzFEtZ7EJrR+ywvsaP5qIJs5VDI3PoAzbhD8PwGWJr/KAHi
         rD71uLHMWCajmBMuPuqEjxanzRNoZJkvZGlMe3G4pMf6GjVqZUmtYEkRfdcuQxHyTaB8
         9LTV2fq1Gjsci9mKlHX0dgsEQDcrAckn9qPG0mmEyYm92AqRbYUg22uTIiFeSYoG8IFl
         ke6kATpesbXNMZvm6T7W7/Us7gTd7G4UoOw8P+l8TrAvvwOTarrhBZSaAOvEwYM+OxtS
         onQw==
X-Forwarded-Encrypted: i=1; AJvYcCWqxoFIET98bhVlGS7jEdT7QG9wvxzgFq2v43BjpTid+9hW2ToChgB8qBCaXxZQRQVaWJqqK4w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+opLeenaG6JVA9H1K2gqObBgy+smcJpeuv1yzY0N8ozTSAyf/
	dsuaIUiX5tX6Xm8LBq/YRuS2svzRu9uMk9guX5vQ0jd/B7DIqi62Xed9tE7B8f0OSNcr5HPHmLE
	/fXDD0hokIUDy0qVqUtSoJ5ssPLxQpfr9/vvT+g==
X-Google-Smtp-Source: AGHT+IFUTF0tj16jDoNeu3TE1nUleDa4pxpe3llpbtyBW8vJVSu1PZ3LjFNbLZtUj574g9rzI+6oQpQx8q8WiPN3NeY=
X-Received: by 2002:a05:690c:82:b0:6d3:b708:7b19 with SMTP id
 00721157ae682-6db44f2f0ccmr121030987b3.27.1725882647637; Mon, 09 Sep 2024
 04:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
 <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
 <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com> <6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
 <871q1tgj1f.fsf@kernel.org>
In-Reply-To: <871q1tgj1f.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Sep 2024 14:50:37 +0300
Message-ID: <CAA8EJpp9=tm1WAEc22-DZtTZsErqAiZM-0Cu-kc18E92frdYYA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
To: Kalle Valo <kvalo@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>, ath11k@lists.infradead.org, 
	Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, agross@kernel.org, andersson@kernel.org, 
	linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org, 
	quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_045049_023456_60AE16EB 
X-CRM114-Status: GOOD (  28.46  )
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

On Mon, 9 Sept 2024 at 14:31, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
> >
> >>
> >>
> >> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
> >> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
> >> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> >> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> >> > >
> >> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> >> > > ---
> >> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
> >> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
> >> > >   2 files changed, 120 insertions(+), 1 deletion(-)
> >> > >
> >> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
> >> > >   &xo_board_clk {
> >> > >          clock-frequency = <38400000>;
> >> > >   };
> >> > > +
> >> > > +&pcieport0 {
> >> > > +        wifi@0 {
> >> > > +                compatible = "pci17cb,1101";
> >> > > +                reg = <0x10000 0x0 0x0 0x0 0x0>;
> >> > > +
> >> > > +                vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> >> > > +                vddaon-supply = <&vreg_pmu_aon_0p59>;
> >> > > +                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> >> > > +                vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> >> > > +                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> >> > > +                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> >> > > +                vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> >> > > +                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> >> > > +                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> >> >
> >> > Please add
> >> >
> >> > qcom,ath11k-calibration-variant = "name";
> >>
> >> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.
> >
> > NAK, nodes describe hardware, not drivers. And we have had enough issues
> > with the WCN wifi having collisions on the board-id / chip-id / etc.
> >
> > Maybe we should make calibration-data required for the DT-based systems?
> > Kalle, WDYT?
>
> I don't know exactly what hardware you are referring so this is just a
> quick and vague answer, take all this as grain of salt.
>
> I don't have any numbers but I'm assuming most of the
> ath10k/ath11k/ath12k devices have the calibration data stored in OTP
> inside the chip. There are also devices which store the calibration
> outside the chip, for example in DT, but my understanding is that they
> are a minority.

Please excuse me, the comment was about the
qcom,athNk-calibration-variant, the property used to identify the BDF
within board-2.bin. Currently it is optional, which leads to
developers omitting it.
I think it's worth making it a required property for new DT devices,
making sure that we don't have an issue with the plenty of boards
programmed to use 0xff as the board_id. Or just using the same ID, but
different BDF files.

-- 
With best wishes
Dmitry

