Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E24ECCA480
	for <ath11k@archiver.kernel.org>; Tue, 21 Jun 2022 18:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xrOEUn19HD5gcw9ApKdkf9YQbylUJw6UP+n2kImFD0=; b=Pjs22B+2na9KV6
	czXmMRVfgcliT2IKL9AB2Utf7U/MA2QJUNV0zr0L4Pq0Dkh20BvKCQvEGW6pySj0LTelJV0ONOSCQ
	l2UBPMJsqY95ThxsQuIHICLJrBmFMtuswC//tzeaKOEaAb6wxp3lCUWd7RtGiN5SgzO44rdJpsffd
	d1P8G8uWCj9Md2vQxBiEuE2LnCVmiF0vg8mAr3FTBvEbACAZmO3mwWsUME49hczUZ+bN9WQOgsEF4
	jnzDceLanVvvq9FbuKxQKt2CYw3MpohmGi0rcf4TGp8pPTlmITQGpeqevHT0DfswCcDDyOObQXObE
	UKr0We9QIWSJ9ucQK6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3iut-006lBp-8i; Tue, 21 Jun 2022 18:47:59 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3iur-006lAe-3I
	for ath11k@lists.infradead.org; Tue, 21 Jun 2022 18:47:58 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id cu16so21138056qvb.7
        for <ath11k@lists.infradead.org>; Tue, 21 Jun 2022 11:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TUwsjMEcTcJGTkqP1tI4ks5+DOl4Jo9qz8wBuhs7k1Q=;
        b=Q+KB8KiHfVZN/IcFhqa6GwDdZVAb/1h5YJpQ4fznMd3FxHLy83GhnTWQ1iWjVerrRQ
         oIc+S7GlOeG2zMH3AUxQ69u3ZO08rrQGR787XFx7RR3Kw6Fo4484d5rGtoIv49PFSELW
         1JJjmO7hszywj4GDpeX//vV2vEkF1mORa19P7KWmna8rzhPDm0vsvm7M1xcuqWOUaRPH
         9FxUKMbFmncFHYT+GhagELHCylo+sxgXgrjada7iWE++btcWJCRGrLWNNmNst2Bg7PgT
         wTCRoHT2XZe5KHRdycaNfciWRGTrb9+NQWDCAymUVmMrzmW3sSyuMrAgMjJWtZOxxPj3
         v9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TUwsjMEcTcJGTkqP1tI4ks5+DOl4Jo9qz8wBuhs7k1Q=;
        b=IIPtpzQ8In66/mgRWQQsJtW7ByoYm/4QyJ/LKbs4sDzmshtW/FvSWzL5xEF5zDGHXe
         oPo16bh5vSSb577rcOfp09G9Z3PMRk6U6V13hAGEvNCZSk5zJyqXV2Q5A5vqYwmssLAI
         DcDoXe8Viv8vq2wtwmnTQwdyBWlEz5joEzO5jv7mVzO3KLiFHbIedePf37K8PuYUbQIn
         LlbWBtpMMLf8SO51AFC35EAZsm9rFzIELHw+ffgX3Zslb4Z8PWtD4AgQJp+TYxa4Jsq2
         NzXa0olV24JPfVTOtoWiBmi1rill7ixZBcQ5CekYAEPUc7sWKMIaLV6JsKlsaTRbVIaV
         L+/g==
X-Gm-Message-State: AJIora8TAlpRYJlGpZBuE1D/BSAhKNe7jBQRcyt1sk66F8JXvJ/QWAa8
	gIxLrSK0FMqmaEax/ReQL50jSS5cXXz30sZEFrQ=
X-Google-Smtp-Source: AGRyM1uJLrWycZyA/aGMIqVI7+AUGaxMZh/S4K2wMif+19wdQg8R7fUB79mtPGkugehrz92tJHI4mkE6SgU4G8Y/ujU=
X-Received: by 2002:ac8:5d8c:0:b0:306:6efd:7fe1 with SMTP id
 d12-20020ac85d8c000000b003066efd7fe1mr24286817qtx.318.1655837274765; Tue, 21
 Jun 2022 11:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220621135339.1269409-1-robimarko@gmail.com> <a194d4c5-8e31-ecd9-ecd0-0c96af03485b@linaro.org>
In-Reply-To: <a194d4c5-8e31-ecd9-ecd0-0c96af03485b@linaro.org>
From: Robert Marko <robimarko@gmail.com>
Date: Tue, 21 Jun 2022 20:47:44 +0200
Message-ID: <CAOX2RU6fBo5f6cxAUgLKj3j+_oP7nSm7awCpr_yiO_p3NssWkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add new DT entry
 for board ID
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, Rob Herring <robh+dt@kernel.org>, 
	krzysztof.kozlowski+dt@linaro.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	Devicetree List <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_114757_207054_FE315D55 
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

On Tue, 21 Jun 2022 at 17:58, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/06/2022 15:53, Robert Marko wrote:
> > bus + qmi-chip-id + qmi-board-id and optionally the variant are currently
> > used for identifying the correct board data file.
> >
> > This however is sometimes not enough as all of the IPQ8074 boards that I
> > have access to dont have the qmi-board-id properly fused and simply return
> > the default value of 0xFF.
> >
> > So, to provide the correct qmi-board-id add a new DT property that allows
> > the qmi-board-id to be overridden from DTS in cases where its not set.
> > This is what vendors have been doing in the stock firmwares that were
> > shipped on boards I have.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>
> Thank you for your patch. There is something to discuss/improve.
>
> > ---
> >  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml     | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > index a677b056f112..fe6aafdab9d4 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > @@ -41,6 +41,14 @@ properties:
> >          * reg
> >          * reg-names
> >
> > +  qcom,ath11k-board-id:
>
> The "board" a bit confuses me because in the context of entire system it
> means the entire hardware running Qualcomm SoC. This is sometimes
> encoded as qcom,board-id property.

Hi Krzysztof,
I agree that the name is a bit confusing, it's not the same as
qcom,board-id AFAIK
and QCA as well as vendors are using a similar property in the wifi
node to override
the default qmi-board-id to the correct one as its rarely properly fused.

I assume it would be better-called qcom,ath11k-qmi-board-id as you
dont even have
to be using a Qualcomm SoC as the same is used by PCI ath11k cards as well.

Regards,
Robert
>
> Is your property exactly the same?
>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Board ID to override the one returned by the firmware or the default
> > +      0xff if it was not set by the vendor at all.
> > +      It is used along the ath11k-calibration-variant to mach the correct
> > +      calibration data from board-2.bin.
> > +
> >    qcom,ath11k-calibration-variant:
> >      $ref: /schemas/types.yaml#/definitions/string
> >      description:
>
>
> Best regards,
> Krzysztof

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
