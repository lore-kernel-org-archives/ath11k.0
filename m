Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0883C433EF
	for <ath11k@archiver.kernel.org>; Thu, 23 Jun 2022 20:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fj7D3ZLiAqMnYjVQlMJ3OL1lnKjL3yNuAOKQ4QZmiUU=; b=HZPIxZdsZCPL41
	OZUg5AYyKU1wUtd9LDeaAo9Xk0H/clKmToNCuDoZxdZ/lTf6uSg4kcMCOQoVG5uBtdf41e0c6YfEr
	o1pCkRmyxFJdN/P82VLoqkL22iwqxnqfYkimkm2KWWVUN4htIT0Ft+b1yuN2pWhujzegECxBeFTS9
	bZYdPzNUEFjCUtCmSTIClXX5prqwQZ9gdXUfL2mb0+ykxWDeIG07wGavqw1rSHePnbIGs915gaZ6X
	iVTnCrThUhcgyNSLa5DJEugHYIoJ4zx/1hgx6JJADkBKdf5cfn1njW5ix75H/j26SRsxdhVVQAeV8
	djVm1fII2MW6KtaVd4+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4TG4-00Ghw3-Le; Thu, 23 Jun 2022 20:16:56 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4TG1-00Ghu5-Sr
	for ath11k@lists.infradead.org; Thu, 23 Jun 2022 20:16:55 +0000
Received: by mail-qv1-xf30.google.com with SMTP id g18so1700002qvn.2
        for <ath11k@lists.infradead.org>; Thu, 23 Jun 2022 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YWrCQp6H9wIltSv1NIBwWayinjF3IWxeRXdz64C/6O8=;
        b=H0iRj/c6MpY2eSSDDZgyYSk4nDUWmxYHRjgj/m/4qUypbcJDTPIYhuazKHcWobrHr5
         gzMxPmUZ9TfzoBSbDy93yX8ibOTfAgZvUQ9nlTwbpwBobAafrndImc/rjqlIdrsjGgIU
         f939IpzQVfemTQC12tvKJFYdtEcTrC9hRKFPx1sxB9nFhDjPgJUcZl+Gj7cuYk5uqdlc
         Wuhk8GAWrGirtvCXM2trIZbiskzbpJqoWnkSSuLaP6YZXRsHMIp2vx68N6kkGoejR9Bc
         OnLAZPnHxE1tdrKATsSqZJRPMxMIxGVQ7N5PWXw8NOaCt9IJo+MjipZvs8RqUkY5as6R
         kA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YWrCQp6H9wIltSv1NIBwWayinjF3IWxeRXdz64C/6O8=;
        b=GzXnsSD0UdmEGC20mLrXqwJ6x7zVbHhP9j8sjPAigSmDu4dlQOfP/GWEJpPlIvmuMP
         0HS/pEacsK+ZUYrd8dIEKkSTxtBy/KUjz9CgtqR91XiyG40dtnc/pfeIG+o1ZaW1Eu7m
         4rXPQ3oG5OqD7p+iTx2TNLlz2qtnvflOF3ATJmBFc4A5nBjQZxm00Cw8PGrSVya567Gu
         YaSyguHBRyQXLfvIaraxdmTmJ50qS8PRsaZGqVCBnkf9ViFR32jH0RhCH/XGr7J/5l7S
         x54XAD7uty6jY7HRBGjBTWdx182w/VQO+f0sDyObdFzAyPk+n/Cv+FrzsFbzH4Q3S9bg
         WIbA==
X-Gm-Message-State: AJIora9fM377rNEOQKAQGe+klpz0wFeUHuVkcm7nHRzGheOWGELzMGaT
	zWugXENtlk8RaXMvFsR3b6g4r1aGM0S5LIcsNrU=
X-Google-Smtp-Source: AGRyM1uOtTXMj9r/qGMK6GqGlRRTsCptlK8dfpB68zWK8onR9QisCok7v5sadUPaTDEsbVzVvhUCa+H87ScWox2/GG4=
X-Received: by 2002:ac8:5dce:0:b0:305:300e:146d with SMTP id
 e14-20020ac85dce000000b00305300e146dmr10167380qtx.546.1656015409065; Thu, 23
 Jun 2022 13:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220621135339.1269409-1-robimarko@gmail.com> <a194d4c5-8e31-ecd9-ecd0-0c96af03485b@linaro.org>
 <CAOX2RU6fBo5f6cxAUgLKj3j+_oP7nSm7awCpr_yiO_p3NssWkQ@mail.gmail.com> <60ee4aa5-4fef-24e0-0ccf-b93eee1db876@linaro.org>
In-Reply-To: <60ee4aa5-4fef-24e0-0ccf-b93eee1db876@linaro.org>
From: Robert Marko <robimarko@gmail.com>
Date: Thu, 23 Jun 2022 22:16:38 +0200
Message-ID: <CAOX2RU7da_bUNM0Zr-YA1eQN96ENcfsKLD9C2PVVNijN6Y2hNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add new DT entry
 for board ID
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, kuba@kernel.org, pabeni@redhat.com, 
	Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_131653_981041_5A2E1D8A 
X-CRM114-Status: GOOD (  27.33  )
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

On Wed, 22 Jun 2022 at 16:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/06/2022 20:47, Robert Marko wrote:
> > On Tue, 21 Jun 2022 at 17:58, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 21/06/2022 15:53, Robert Marko wrote:
> >>> bus + qmi-chip-id + qmi-board-id and optionally the variant are currently
> >>> used for identifying the correct board data file.
> >>>
> >>> This however is sometimes not enough as all of the IPQ8074 boards that I
> >>> have access to dont have the qmi-board-id properly fused and simply return
> >>> the default value of 0xFF.
> >>>
> >>> So, to provide the correct qmi-board-id add a new DT property that allows
> >>> the qmi-board-id to be overridden from DTS in cases where its not set.
> >>> This is what vendors have been doing in the stock firmwares that were
> >>> shipped on boards I have.
> >>>
> >>> Signed-off-by: Robert Marko <robimarko@gmail.com>
> >>
> >> Thank you for your patch. There is something to discuss/improve.
> >>
> >>> ---
> >>>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml     | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> >>> index a677b056f112..fe6aafdab9d4 100644
> >>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> >>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> >>> @@ -41,6 +41,14 @@ properties:
> >>>          * reg
> >>>          * reg-names
> >>>
> >>> +  qcom,ath11k-board-id:
> >>
> >> The "board" a bit confuses me because in the context of entire system it
> >> means the entire hardware running Qualcomm SoC. This is sometimes
> >> encoded as qcom,board-id property.
> >
> > Hi Krzysztof,
> > I agree that the name is a bit confusing, it's not the same as
> > qcom,board-id AFAIK
> > and QCA as well as vendors are using a similar property in the wifi
> > node to override
> > the default qmi-board-id to the correct one as its rarely properly fused.
> >
> > I assume it would be better-called qcom,ath11k-qmi-board-id as you
> > dont even have
> > to be using a Qualcomm SoC as the same is used by PCI ath11k cards as well.
> >
>
> Thanks for the explanation. What is the "board" in that context? The
> card/hardware with ath11k? Then maybe qcom,ath11k-qmi-id or
> qcom,ath11k-qmi-hw-id?

Hi,

I assume it started off as a numerical value to match the board design and was
then simply carried off to the PCI cards as well.

qcom,ath11k-qmi-hw-id is fine by me, will just expand the description to make
it clear.

Regards,
Robert

>
> Best regards,
> Krzysztof

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
