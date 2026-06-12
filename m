Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FD6CD8CA8
	for <ath11k@archiver.kernel.org>; Fri, 12 Jun 2026 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTLM106efnje673B2OyrJhDO3JKyBJ//Wa8kKGBktzg=; b=SG9K7FyrHEX/OlzSXsaTRcan8l
	6ne5aZJIh/ydmVmMzQY8WrnS58liQNQ1U14b85g4NoGeb0+1wLhpbqr2S3dHEo7nITuaP9fEakbJB
	PO3tALUqt9OqyeLrWJuFz994YheobMTc/l4CYs7nd167NG12l8bPOBYK1B96UpaWti8FuQUUEerOE
	1mHjiVrmojrviQKzRJiW/BTFbn6/M9vFg0vvwu5YJcXdFMRnQS2XxIQZ8b2NKwH5ex69PxSfMlnz5
	eQBtR3/KdDnC2/wbEUPcDMSWoIwTlS6QkfeT2swFadUpgd+Y+I9GIFcXaz/L5FapvrlBofvdFh2Bm
	SDTeinkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2wi-0000000B4x4-3zfy;
	Fri, 12 Jun 2026 14:33:20 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2wf-0000000B4wK-488u
	for ath11k@lists.infradead.org;
	Fri, 12 Jun 2026 14:33:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso177592666b.0
        for <ath11k@lists.infradead.org>; Fri, 12 Jun 2026 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781274795; x=1781879595; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTLM106efnje673B2OyrJhDO3JKyBJ//Wa8kKGBktzg=;
        b=vU8RUmazfENQUhiA+neetwW/9Lp3SGgVeufYzTlte1aPQWDXlFoVQ2w8wabVh5woS5
         dW9sOoqT75chBgj9rn+K3epiA2IuSs6TOG7FWDScc1Y3LUAGEW0icNm+oRtmgGr3Msk5
         UHEivisFdGEL96ndYIUBWKxK1geF5GQcz3oCl0Ne4Wr9nv5hwh/DJTdo3w0Ikx+fRH+p
         f2NXDL1SJ+KyfOwk1wgvtCtsXMX9VnXmv6fBBaNBfzy/yJaZBmVr4/dIwIikQVIk8TVt
         bk/qnmHh0eV0p9vnoH7wodx/eAvigXovAaULE68s/h8KdpiUzjVs4gNH3plKyvbe2fKy
         /ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274795; x=1781879595;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTLM106efnje673B2OyrJhDO3JKyBJ//Wa8kKGBktzg=;
        b=FAgqDuxNbSXgxHlkkTV6uVGSxxoKXuDefTZrYxwYo/xtQvEABVX5XUsq/hHAFia52R
         sN5Awuk+tdUEHg99xhrm4EHwcp9GplOY0aBhDUOk7bSYn4JghzDF+tZLhchmcy6aNFp9
         8sdg7yKc/bvAJv92EEjIPf/XohkFnmNa4StROx4xNk4Qo0gzK6+FViQ3g5CDD59cYD8J
         YqLNPZbY5uLa3qKKaXIlcbxioCmXBlq0WtzUYoA0ZI5yRE1N227Ostowrld+4TL7qFbH
         fXzePL8r67wuEKA0zYPu/gobFp9uL4+vYPs2Z+N+3ZMQEBph1uV/uwj7aosSW+Y/4pka
         rBoA==
X-Forwarded-Encrypted: i=1; AFNElJ9ytZ41QMx6fOre6Owo+mrdM41O906tH7LJXjfFmZ+eyookcokUA1d6UznN47T5X6bdM3pUnTE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3PaG1kBnFlrhlp3m+1qpwzw1l3PNAM3S6EfJrswUFe4hJG+rM
	DufGs1jlN7BST0cqfznsabpWS7cdKTfYobAXquZ3SMg28zta+fo+IWsDzs3nduJsOJY=
X-Gm-Gg: Acq92OFvVRQJAJPXw+NB6rVJ7z4sVWMQh5ozayQR21WmYieOMG3e+hnav0mS9MtdHFZ
	MR5PPAFi2Gnm1aPCrbxaDvCkQJ494raywkG48lKA8IKraQmIlbVvQG8OKLfUQQVI9SkRhFKu/97
	HpVIVXniDgVqoazz/IirR2PCQ6LteFhbOa38Q+4WsHAG5NHuc5ZSkaoPavtr4NX34e2/9MIjznZ
	GlOLyLTQrVBL0aO/2ZFP0H6j9kEu2eIiH7UTllBAK5gz8it4ri7MkFy1r+DAcx0Kfef2aF3nUet
	Gck0XJSA0VNLZz1EevBDZIwuM8c1upvpZ5YmEazIeNe4MJYqOIuQdQWZlFQaTnKR474bnpQptKl
	JYihXq+j/cFldYoEZTTrer+c+EBevKKHqJ6XuN9AA8oj1cO5P7AAen3tL+z/gLZd4nlAZtp4m8v
	rcUkPPICmoiN1URiCze8IQI3Vl7C3KVv1BPHFsYy24S4CEgF5AMqSUOX0EkkQQpxECkJbQQjn1q
	nAMOAVqq0o6pw+FBxbgJdW4v2YxGAlKUnLgVw==
X-Received: by 2002:a17:907:9994:b0:beb:bf23:ac78 with SMTP id a640c23a62f3a-bfe2aefcebcmr149500366b.44.1781274795114;
        Fri, 12 Jun 2026 07:33:15 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b32308sm110137366b.19.2026.06.12.07.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 07:33:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 16:33:13 +0200
Message-Id: <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Alexander Koskovich"
 <AKoskovich@pm.me>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Marcel
 Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt:
 Document WCN6755 Bluetooth
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_073318_142953_BF5FDC93 
X-CRM114-Status: GOOD (  12.14  )
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

Hi Luiz,

On Fri Apr 3, 2026 at 3:52 PM CEST, Luca Weiss wrote:
> Document the WCN6755 Bluetooth using a fallback to WCN6750 since the two
> chips seem to be completely pin and software compatible. In fact the
> original downstream kernel just pretends the WCN6755 is a WCN6750.

Could you please pick up this patch (or provide an Ack if you want Bjorn
to pick this up with the rest of the series).

Regards
Luca

>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++++=
++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750=
-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.=
yaml
> index 8606a45ac9b9..79522409d709 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yam=
l
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yam=
l
> @@ -12,8 +12,14 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - qcom,wcn6750-bt
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,wcn6755-bt
> +          - const: qcom,wcn6750-bt
> +
> +      - enum:
> +          - qcom,wcn6750-bt
> =20
>    enable-gpios:
>      maxItems: 1


