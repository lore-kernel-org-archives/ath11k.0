Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21393ECE57A
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdmWO/y6gEncx0yc/KC1ZIgIx6TLjxCgyEgLMmNM1FU=; b=NzpWo5MzDrBb9ubvMgbdRWwaPm
	rlZYheIAhW51cG6i5p4nOv/ooSdmL1MtILyAltZyRmQGql69jNa7GeZBS0IZErIzj06kWt6WmbIbH
	0IHF9vQ84+tuiv3aU6B2Bqa8GOqkZCA9TNCGuUfoKM6sWwMlE/rGVDmFrMjdB1JLjehqAdLnds23Y
	Hx4GKONAPi4D1vuttETAIjV3737q0qNrurTyx4CusBWza7GkJ7+3CaZYK3CKK+WJdwEibIL8APxTj
	vgMpcT9/FqcLLRo+WA13MloPGDzdViPS4J4+B5Ksn9ca0XfhThCBzOplQk2oca44rx/hR0j6IifCh
	7rFca2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne3J-00000001ywT-491G;
	Mon, 09 Sep 2024 13:03:34 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndx8-00000001xa4-3HiB
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 12:57:12 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5365928acd0so3565899e87.2
        for <ath11k@lists.infradead.org>; Mon, 09 Sep 2024 05:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725886629; x=1726491429; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdmWO/y6gEncx0yc/KC1ZIgIx6TLjxCgyEgLMmNM1FU=;
        b=c5BqNfSC/Df2d6MHcAS0+GhugdgL2pSObXsVfcRtPVg/g2AACJbx4n7owfosqZAkOS
         HXodTlf8klDVB9Uj6cJCb/YusfwiqZ0rcirH1OvWFcSuDD04VbjG962VinK2/h+yhMvu
         IgE0Kz9a8Y6lke28EbB2Xr8Mq545XNqoCQ/nEj+AhhMRwEVLyXpIp40+jIwJxUwi7/Vv
         g7Jkk7kiGzvXDx4YOpe6wQGELsBIX8HtqWXJbkYPohvWgCsjL7QOau5ZW9qZI0RIwpPE
         tU98kb++BTW+ACz5DSpuYpIegX+u3qcIsJPVqTaD9t/EnxZdVlmZRkX6atKhwx0EAfGu
         u7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886629; x=1726491429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdmWO/y6gEncx0yc/KC1ZIgIx6TLjxCgyEgLMmNM1FU=;
        b=E4JWDRo6bo2voMFS7bQN1whqIzfFUG2FoVdGU/WN7Jm/FGJcUrxmzlbcGtAjPYlzOk
         nPbUkHkNwMujEfSevtaEI0doCCwzI+JsoHyW5ebv0avJV6f6i0aNMaYtkNPbCoVbTD80
         ElxaF7uMYQF5R6KZvV0exvy0wd7O8wBhqSfbRGtUwpS1o8r4Nfe1Em8uL9wjtMRridlH
         CtK75V3m08pRMosiuD4D4tX+Her1OTf7DyHbC2BjoIYEnIenbCXJpA6w0d36j8b3C/Vd
         /Iv/4tHY8Fcc0wldwqnO/PEd3VT5Ll104qJrNQ3KPKRTF7T84qdr81P+wyji8yGEj/vF
         SH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEdDjuHTLdBNhLSQ9O1nWOh5TnJwBRt8QfouA2QAhRuB8/1ekyxobcdLhXd8E2hd70T2BXvek=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0KjUTgUJSkL1vDhoj8sKFlmPCrcvSVXIUoB56uvcMHidQYwOE
	s6y0rQooYmbxz9wvYkYRkOnWcCWyIXdOctKbNZAGNkyPNzQKPVPcwN2ln0I3jbU=
X-Google-Smtp-Source: AGHT+IGg6lD6GrF9orDPwQmF2EnUQWjg+tjIcVSrbmI3BFu/hSrE5+5/oRxQV8ihfoTz1okFEZmoYw==
X-Received: by 2002:a05:6512:2313:b0:533:40dc:8248 with SMTP id 2adb3069b0e04-536587a5453mr8033269e87.11.1725886628058;
        Mon, 09 Sep 2024 05:57:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90d44asm749391e87.247.2024.09.09.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 05:57:07 -0700 (PDT)
Date: Mon, 9 Sep 2024 15:57:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>, ath11k@lists.infradead.org, 
	Dmitry Baryshkov <dbaryshkov@gmail.com>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <5mz7b4tou6iohqkdt5igt4cajt4hzvibvphcyo7bzk3uf7jg45@unijiusqdpga>
References: <20240905064817.3885953-1-quic_miaoqing@quicinc.com>
 <d6mt6i4a6xa3juvn4gzytuhsot2kx7dn4wmm3kmgwywfj2hcau@leecyxx36wql>
 <87a1a50f-f485-4a4f-91fc-34fa19312519@quicinc.com>
 <6to5p2dgsu6pvebkmkliojv5kfhnairigd46tmbraimxij7ddu@h6ziv7uwjeeq>
 <871q1tgj1f.fsf@kernel.org>
 <CAA8EJpp9=tm1WAEc22-DZtTZsErqAiZM-0Cu-kc18E92frdYYA@mail.gmail.com>
 <87wmjlf1vf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmjlf1vf.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_055710_852589_F027A8E6 
X-CRM114-Status: GOOD (  43.70  )
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

On Mon, Sep 09, 2024 at 03:27:48PM GMT, Kalle Valo wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
> > On Mon, 9 Sept 2024 at 14:31, Kalle Valo <kvalo@kernel.org> wrote:
> >
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > On Fri, Sep 06, 2024 at 08:19:28AM GMT, Miaoqing Pan wrote:
> >> >
> >> >>
> >> >>
> >> >> On 9/5/2024 8:49 PM, Dmitry Baryshkov wrote:
> >> >> > On Thu, Sep 05, 2024 at 02:48:17PM GMT, Miaoqing Pan wrote:
> >> >> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> >> >> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> >> >> > >
> >> >> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> >> >> > > ---
> >> >> > >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
> >> >> > >   arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
> >> >> > >   2 files changed, 120 insertions(+), 1 deletion(-)
> >> >> > >
> >> >> > > @@ -837,3 +939,20 @@ &usb_2_hsphy {
> >> >> > >   &xo_board_clk {
> >> >> > >          clock-frequency = <38400000>;
> >> >> > >   };
> >> >> > > +
> >> >> > > +&pcieport0 {
> >> >> > > +        wifi@0 {
> >> >> > > +                compatible = "pci17cb,1101";
> >> >> > > +                reg = <0x10000 0x0 0x0 0x0 0x0>;
> >> >> > > +
> >> >> > > +                vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> >> >> > > +                vddaon-supply = <&vreg_pmu_aon_0p59>;
> >> >> > > +                vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> >> >> > > +                vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> >> >> > > +                vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> >> >> > > +                vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> >> >> > > +                vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> >> >> > > +                vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> >> >> > > +                vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> >> >> >
> >> >> > Please add
> >> >> >
> >> >> > qcom,ath11k-calibration-variant = "name";
> >> >>
> >> >> No need, here the WiFi node is for 'drivers/pci/pwrctl', not ath11k driver.
> >> >
> >> > NAK, nodes describe hardware, not drivers. And we have had enough issues
> >> > with the WCN wifi having collisions on the board-id / chip-id / etc.
> >> >
> >> > Maybe we should make calibration-data required for the DT-based systems?
> >> > Kalle, WDYT?
> >>
> >> I don't know exactly what hardware you are referring so this is just a
> >> quick and vague answer, take all this as grain of salt.
> >>
> >> I don't have any numbers but I'm assuming most of the
> >> ath10k/ath11k/ath12k devices have the calibration data stored in OTP
> >> inside the chip. There are also devices which store the calibration
> >> outside the chip, for example in DT, but my understanding is that they
> >> are a minority.
> >
> > Please excuse me, the comment was about the
> > qcom,athNk-calibration-variant
> 
> Ah :) In case you were wondering, I was talking above about
> qcom,ath10k-calibration-data property which is the full calibration
> data, board files are not used at all in that case. So please ignore all
> that I said.
> 
> > the property used to identify the BDF within board-2.bin. Currently
> > it is optional, which leads to developers omitting it. I think it's
> > worth making it a required property for new DT devices, making sure
> > that we don't have an issue with the plenty of boards programmed to
> > use 0xff as the board_id. Or just using the same ID, but different BDF
> > files.
> 
> This is also a quick answer, the merge window is getting close and we
> are finalising the ath12k MLO support so not much free time right now.
> 
> Some chipsets do provide unique information for the ath10k/ath11k/ath12k
> driver to choose the correct board file, but I guess they are mostly
> mobile chipsets. Though not even all mobile chipsets provide that, as
> you are painfully aware. For AP chipsets it seems to be a rule that they
> don't provide unique information to choose the board file and a variant
> field is always needed. So I think there is a point in your proposal.

Ack, thanks :-)

> 
> Backward compatibility is important but I think we already handle that,
> at least in ath11k, as it's first try with variant field and then
> without variant. But this needs more investigation on both ath11k and
> ath12k. I hope for ath10k we would not need to touch the driver anymore.
> 
> Can we revisit this in few weeks, after MLO is in better shape, and
> maybe you could start a new thread?

Sure. Let's agree that I'll send a patch after -rc1, if I don't forget
about it.

-- 
With best wishes
Dmitry

