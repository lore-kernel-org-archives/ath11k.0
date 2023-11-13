Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F36BC4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OTtoX+IykYpfu+iswWbXQdd3wVPeL3Y2FFZQIuWt2M=; b=M9IP+VHKxVqyFm
	7agoe3FMXJkkb2iQ5ZI21nmMgYLkku2TZK1faWMih7YidHbBJippEuMIHxfPmegW1Tx+FqycUfq3r
	1jbDIL+NWoL5ojUY5soDfxOI4YE1tobwpJCqgkn+Nrp5l4xBC/3zSBy+sODLkc3b42p7cX+QFmU2v
	0XqUHW4pqsyiRv38fDWXJ0gHhRNtKmhQV8yZXLofKxhJFRiVeMdq+GIWZpau0tdqr6MQH/Vx+uOJs
	BUZkn0Qo8ATUkb9lgJAbm+KH5aMQKiIqiPdpt2MKtYQ3c9Jf1Mb7RHVk74Qkxba6Ta2owgTU9nIYa
	5rAh++pqoVpbkP8nDDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WOg-00DzlW-0W;
	Mon, 13 Nov 2023 12:50:34 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WOd-00DzkE-0s
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 12:50:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5441ba3e53cso6561799a12.1
        for <ath11k@lists.infradead.org>; Mon, 13 Nov 2023 04:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699879822; x=1700484622; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N13JBdU904zFnf0HqevyoXQNJ3lJ+1zQrKvMl13vlHo=;
        b=JLgFuNmb6D0BlbAPZTyhyKwAEK7yhe0q+KLIYZPoF3cWeENO6GIAc1TiQzsRJlDJYd
         4cuVP1hVkb94WyBQHg/CTpsqf+WwpQU2TfHIbkWcWwt9BTO9HEYqOTG4a7FDIVfZCxcf
         OqR1n2IL0a/m7p1jsAOuL3gNql34TxvZu+mPIP8aRelBqqrJ3o42XZ+gKrZuspUcGdra
         kuDqbBa5Ac43eQJ1QZLyeRAehYdJYc8y4viOk5hpYv106oJhai23ZNLV+MxgFZxEnP+J
         0r0Z+y6yBSDGUgIbLP72Oi7f4dzhFmgA591UIbmTEhYwhdFv3qgrMkbHtJltX6pfaS9b
         11Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699879822; x=1700484622;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N13JBdU904zFnf0HqevyoXQNJ3lJ+1zQrKvMl13vlHo=;
        b=jDXgpToOpcjENLa/jMuJlFyL2d9uVA18YtVBqFdRj2XlfTSApGLNvNLWPa1/oUrf1Y
         JjHut312rcNcmFhAUVfl5F6Guq/VFcPd8LzlApLu2sBLmjoJxgqR+RHehiap1XypLJyO
         f6s1sLwo/IoMOiaS0vDDhk/Mr/2NpBqJTCqx8dyG6kCy5RNeKw9THvmGiTO4pCY74icA
         GLlFSVQXQo7Pxk79qXovQZo6wN/ydpHh+Otp0jijJGTjfQ7TR8OthbmZfYsRXap263oQ
         Dt5XtZxhTb1UFW52GEb1H7KMQRMqtN+3MNPObRpsZdu0f6zBJzkBZsdl4jKghYUSRAam
         LlGQ==
X-Gm-Message-State: AOJu0Yw72qqhZZo84yyfSM/pvrUp3Ln+CapjwOtVEfiYFC4CNrCIPLbQ
	uVn0HwoiNp9b4bELzL9Rvsv9yQ==
X-Google-Smtp-Source: AGHT+IFAHarCQT9X05gSVzLNnvdGW4iSoxHQZnNRwA8Psb/ROnfXippLqiuXAEGP4HAefaqXNIn0Qw==
X-Received: by 2002:a05:6402:1a45:b0:53e:1815:ed0f with SMTP id bf5-20020a0564021a4500b0053e1815ed0fmr4884047edb.31.1699879822427;
        Mon, 13 Nov 2023 04:50:22 -0800 (PST)
Received: from localhost (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id b30-20020a509f21000000b0053d9f427a6bsm3805358edf.71.2023.11.13.04.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 04:50:22 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 13 Nov 2023 13:50:21 +0100
Message-Id: <CWXP3TCW3A1G.2ME0JJT3S540G@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Rob Herring"
 <robh@kernel.org>, =?utf-8?q?Matti_Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>
Subject: Re: [PATCH 9/9] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable
 WiFi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kalle Valo" <kvalo@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
 <20231027-sc7280-remoteprocs-v1-9-05ce95d9315a@fairphone.com>
 <12ea48bd-5022-4820-815a-89ef23ec9385@linaro.org>
 <CWMK0AQRL87L.1F9MIDVQ4J439@fairphone.com>
 <CAA8EJpqCeW8NVcrpwo6JVn0kE2W-QMELB1YH7i7pgOH6qiPbCQ@mail.gmail.com>
 <87zfzhu9kx.fsf@kernel.org>
In-Reply-To: <87zfzhu9kx.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_045031_313853_B0019E0F 
X-CRM114-Status: GOOD (  35.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon Nov 13, 2023 at 1:22 PM CET, Kalle Valo wrote:
> (adding ath11k list)
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > [Added Kalle to the CC list]
> >
> > On Tue, 31 Oct 2023 at 12:31, Luca Weiss <luca.weiss@fairphone.com> wrote:
> >>
> >> On Mon Oct 30, 2023 at 8:26 PM CET, Konrad Dybcio wrote:
> >> > On 27.10.2023 16:20, Luca Weiss wrote:
> >> > > Now that the WPSS remoteproc is enabled, enable wifi so we can use it.
> >> > >
> >> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> > > ---
> >> > >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++++
> >> > >  1 file changed, 4 insertions(+)
> >> > >
> >> > > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> >> > > index d65eef30091b..e7e20f73cbe6 100644
> >> > > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> >> > > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> >> > > @@ -713,3 +713,7 @@ &venus {
> >> > >     firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
> >> > >     status = "okay";
> >> > >  };
> >> > > +
> >> > > +&wifi {
> >> > > +   status = "okay";
> >> > qcom,ath11k-calibration-variant?
> >>
> >> What value would I put there for my device? Based on existing usages
> >> (mostly for ath10k) I'd say "Fairphone_5"?
> >
> > I think this is fine.
>
> From style point of view I would prefer lower case and dashes, for
> example "fairphone-5" but I'm just nitpicking, uppercase and underscores
> work fine as well.

I really don't mind, but I used "Fairphone_5" in v2 now, but I can
change it for v3 if that happens if you wish.

>
> If you have different SKUs or similar which need different ath11k board
> files being more specific like "fairphone-5-eu" and "fairphone-5-us" is
> one option. But I'm sure Luca knows best what is needed for Fairphone,
> just throwing out ideas here.

As far as I am aware, there's only one hardware variant, so nothing
extra should be needed there. (We also only really sell in Europe, apart
from a small rollout in Taiwan and a trial in the US, but same HW there)

Regards
Luca

>
> >> And you mean I should add this property in dts before even looking into
> >> the firmware/calibration side of it?
> >
> > From my experience some (most?) of the device manufacturers do the
> > wrong thing here. They do not program a sensible board_id, leaving it
> > as 0xff or some other semi-random value. The calibration variant is
> > the only way for the kernel to distinguish between such poor devices.
> >
> > The kernel will do a smart thing though. If the device-specific
> > calibration data is not present, it will try to fall back to the
> > generic data.
>
> You are correct, just to be specific it's ath11k which will choose which
> board file to use. I recommend always setting
> qcom,ath11k-calibration-variant in DTS if you can.
>
> Back in the day I have tried to push for the firmware team to improve
> the board file selection but no success. So the only practical solution
> we have is qcom,ath11k-calibration-variant in DTS.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
