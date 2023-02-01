Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DF1C38142
	for <ath11k@archiver.kernel.org>; Wed,  1 Feb 2023 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B491kSTqL/DPrcJ2MELzMxTu+2YYz9GE2ylGSIMke9A=; b=jCBJYS56qCykIF
	Wb5jSIwGIAGW5FDCkzsNbVF8bkyPvXx7DuOu1V/KuNxMcgHO5SgdWGVPqKuyk++7IgaltR6RYeXH8
	+5MIlOs59FQALrFzhcefJT/FrnH8WTvsJzuyQSLMOyMUF7yVpQWzEyrzRXw2t35CWYbY8zil6khxp
	W+ex0XWIz7aoTDvifqi83SMiURZSWCKB4OMK5qNV0jKaXL+l1Vl4JAAgsQVY7oxQJ6MqQQbWfT1SF
	UAIVjqkaYRa5iq/x/Ncnjw/cKLaqZoVS7DoO0KKZIjM616r3hmNaKUweUbTXFJDLzKOcKcy9fA4yy
	4WLf1Mb4cwlF8OWQfylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGmL-00D0Ps-KV; Wed, 01 Feb 2023 17:20:13 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGmI-00D0PN-7a
	for ath11k@lists.infradead.org; Wed, 01 Feb 2023 17:20:11 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-16332831ed0so24392510fac.10
        for <ath11k@lists.infradead.org>; Wed, 01 Feb 2023 09:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvS6IzC8bwewPncy4ABn16veV+Ux4xgWqkXAqCcyLxY=;
        b=s1v/te+T8TZfVxTEt3kQKrC57vybigjtiDExDEsaRKFHiv3Vn4D1n91LcEvk3qYp9L
         EyOXuiYirpxOcrqlPwWB5PSKbIww07CN8C0B0X8XPCkx9HJmb0AsFIFRzeLVIHYU64Qs
         miAU5i7h2iPIBh8gwNAtqAu5ze6h/qVZsljnpaLvlNJ2iCeOo2tYLsjrmLLkuduZU8cN
         mNGJ+PM1xMiXi2jYHGz7aDNHPH6jxrkNMdJR0aptOmwy5TaIYI+Ho6EqSQuOqVLRvMKo
         /xQdHVl3sfbnd6ZCfvIn2dFVkQDKZoQvwDWz+Rnb8Njuv+YzTVVDIbWEUZJLcbX/uUU2
         SPuA==
X-Gm-Message-State: AO0yUKVItj9xWdDiiBbmYdCKnnWKgXx/Onm4dbLXXk1hKhyAsLy7xnUI
	RaWs6Iz23DmSltzA9sqoDA==
X-Google-Smtp-Source: AK7set/BDnVzkpsE8Teoq5qX/sm2jzdvxGaWqxAltLjnnVeHkNBTa305CN2wWkzToMcN1ClyGheccg==
X-Received: by 2002:a05:6871:28e:b0:166:732f:243b with SMTP id i14-20020a056871028e00b00166732f243bmr1364046oae.52.1675272009003;
        Wed, 01 Feb 2023 09:20:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q42-20020a05687082aa00b001676a4dc22bsm1312853oae.58.2023.02.01.09.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:20:08 -0800 (PST)
Received: (nullmailer pid 3750008 invoked by uid 1000);
	Wed, 01 Feb 2023 17:20:07 -0000
Date: Wed, 1 Feb 2023 11:20:07 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Youghandhar Chintala <quic_youghand@quicinc.com>, kvalo@kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, krzysztof.kozlowski+dt@linaro.org, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt: bindings: add dt entry for XO calibration
 support
Message-ID: <20230201172007.GA3733090-robh@kernel.org>
References: <20230131140345.6193-1-quic_youghand@quicinc.com>
 <20230131140345.6193-2-quic_youghand@quicinc.com>
 <622ef51f-643e-5eb5-3884-3f22bf4fa9be@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <622ef51f-643e-5eb5-3884-3f22bf4fa9be@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_092010_312633_5B3C47E5 
X-CRM114-Status: GOOD (  18.44  )
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

On Tue, Jan 31, 2023 at 07:02:16PM +0100, Krzysztof Kozlowski wrote:
> On 31/01/2023 15:03, Youghandhar Chintala wrote:
> > Add dt binding to get XO calibration data support for Wi-Fi RF clock.
> 
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).
> Hint: dt-bindings: net: qcom,ath11k:
> 
> > 
> > Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> > ---
> >  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml         | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > index f7cf135aa37f..205ee949daba 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > @@ -41,6 +41,10 @@ properties:
> >          * reg
> >          * reg-names
> >  
> > +  xo-cal-data:
> > +    description:
> > +      XO cal offset to be configured in XO trim register
> 
> Missing type. I also do not understand what's this and why some register
> offset should be stored in DT. Please give us some justification why
> this is suitable for DT.

I think that's a voltage offset or something, but you are right, we 
shouldn't have to guess.

It needs a vendor prefix, too.

Rob

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
