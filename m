Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76576C4345F
	for <ath11k@archiver.kernel.org>; Tue, 16 Apr 2024 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUyFM9i0rtryeQoNW8AUTADCgYG36OPoQZzM4bvcyrg=; b=MvBaQDKjZu3xccOIS5ek6OlBRy
	43afZ28d1WNl4/g76LXhlOwkp3Bx0Y0LWYTkD8K8i20kVXJ/LBZoq7NKSsAIZCFz2+81vnhN8z57W
	/r11v2hcAidyQepnCPqJ33Aw6iog24kCHuCYC8etpFez5N6MmY/V1aLIKqIGIA3MKfLhinLmA0D8A
	8h08bh6L+F6FievB4zyFTEZeQhAqoc5uLHxKngN0dFxR81YNU0hva2rkPL264d1H4HO8c9OCwkkt+
	+a7iCp1odR4aiA0XEZp5DH1hYAxkIN9irLyq4kZXHV36UmQi4M/XOzguXo6Wl2wJqBbtyzNmhL42u
	f7hNt4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwim3-0000000CHjs-0Em7;
	Tue, 16 Apr 2024 13:22:59 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwilv-0000000CHeD-1ejL
	for ath11k@lists.infradead.org;
	Tue, 16 Apr 2024 13:22:57 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so2858596a91.0
        for <ath11k@lists.infradead.org>; Tue, 16 Apr 2024 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713273767; x=1713878567; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NUyFM9i0rtryeQoNW8AUTADCgYG36OPoQZzM4bvcyrg=;
        b=N4zPiwq9iuHK8dxl0TPb24ut/eMaQHyJEiAm8Td+iqy6EQDzFWIEPkKGnU8f+pXjw7
         /jK89k6nDmJ2BWZSigro7F9mvqfq2ld2CcyI9cVyPdBwnE++5UwD/kOElwXpkS3rJGce
         ppm7Zsh0ZUvpkGVZ+7Iy9XtsuP4tVYvzK9KOHqp0VicZxRKLPGQ1oO6LtLKNc7cdbIWO
         UlR7QnTiwO/KrpB07Ca+eL3UaHxBewoTWP2RMPJszN3tM2tt9W1mxtGw2MUdRt9DtKZe
         O57NaskcGVih3uVah+trclay8hRKlleTsHgTobSg6R9+73Z0xZ2fICS10GtHakL6fK5n
         iHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713273767; x=1713878567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUyFM9i0rtryeQoNW8AUTADCgYG36OPoQZzM4bvcyrg=;
        b=ebqDHtjGPXvNDJ6OHUg8Inqc8NdRiulh/qbPEbI/bBDr661lwzJZSyVU6T+FIgXfQn
         QBOLxDYho1Ix4RJPBBQmlFn7Aema/z4tvU9oJjZojlE1KgdnuLFrJLj8xHolKlC00f7F
         GNitgzo8a4o9id1keOh2iLBpTGxo+pbmlt48txOv1XnQMTZKad8RDHLL/1vxhUHd3zBp
         Nqc5RCCjHGV3y6JJtjGIj833GT70dDB3fJHUGLM1q1ngYPYyE9cRaFQMOjNadrqcILRA
         uINrWYtinMU0FLoPa6G+d4NoG3axKFwieqg1y9uO1nNp9C3Lk/EgVW4f4q32laJAKM9k
         cYsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe1no7bQQxrEw2k14CKA2+o1sPX1zecabPbXnRfa+EmStuJ3AWzX7swc5Kl/oMNiraYWX0gKp6HbtGkjmP51N9kcK2Z8DLTT5Mew==
X-Gm-Message-State: AOJu0YxrbgVe68RnbAq7bQBX0LZ+EkcMXEbABb1nesLf5ITlUCta1UFs
	Do3Z8w4ePZN85/x18Cqm21Z0oArl3ZgK6GBq2bpJ5js/k+cRG1n1RHETzswm0N6k/QpZEnP/S7J
	mvBEWPczJCzucEhhXHCpxR94SMVs=
X-Google-Smtp-Source: AGHT+IFP6210waMqO1NN+/uEDyO7Znkn9Ms/B1bjT8WrCAkXIpVxBUQKxtXXNBOYwcbWaGoZpe/UQlzDo69EIq+/22M=
X-Received: by 2002:a17:90a:ad7:b0:2a2:dcfe:bd69 with SMTP id
 r23-20020a17090a0ad700b002a2dcfebd69mr3827029pje.13.1713273766756; Tue, 16
 Apr 2024 06:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240412162510.29483-1-robimarko@gmail.com> <20240416132124.GA2143558-robh@kernel.org>
In-Reply-To: <20240416132124.GA2143558-robh@kernel.org>
From: Robert Marko <robimarko@gmail.com>
Date: Tue, 16 Apr 2024 15:22:34 +0200
Message-ID: <CAOX2RU5tWt-dEA4it1G+LeNawwPqkwdG=vBBgnmdD6CNc4iywA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add
 ieee80211-freq-limit property
To: Rob Herring <robh@kernel.org>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, jjohnson@kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_062251_967329_066FA208 
X-CRM114-Status: GOOD (  16.95  )
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

On Tue, 16 Apr 2024 at 15:21, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 12, 2024 at 06:24:08PM +0200, Robert Marko wrote:
> > This is an existing optional property that ieee80211.yaml/cfg80211
> > provides. It's useful to further restrict supported frequencies
> > for a specified device through device-tree.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > index 672282cdfc2f..907bbb646614 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> > @@ -55,6 +55,8 @@ properties:
> >        phandle to a node describing reserved memory (System RAM memory)
> >        used by ath11k firmware (see bindings/reserved-memory/reserved-memory.txt)
> >
> > +  ieee80211-freq-limit: true
> > +
>
> Drop this and change additionalProperties to unevaluatedProperties.

Hi Rob,
This patch series has been dropped as Christian already proposed the
same before and it was reviewed.

Regards,
Robert
>
> >    iommus:
> >      minItems: 1
> >      maxItems: 2
> > @@ -88,6 +90,7 @@ required:
> >  additionalProperties: false
> >
> >  allOf:
> > +  - $ref: ieee80211.yaml#
> >    - if:
> >        properties:
> >          compatible:
> > --
> > 2.44.0
> >

