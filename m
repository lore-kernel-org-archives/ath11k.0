Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAA8C636CC
	for <ath11k@archiver.kernel.org>; Tue, 31 Jan 2023 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiV1BNUul8nZOqVRJGnMhQRHiUgxCY06n81HS5D5deM=; b=yBzVUG9DQ/0e5Y
	K2fNFIGLSDfpk2+u3N1XeQVrx+yK8N+MXBvYnWnHlIlLhFjroaRxUHRaINRUO9fdVZUUnOUNWoZf6
	PjmGVWMvgAhKJq2tzbthdcY4QCpYAe6NKYVG6M9Qqpt2QmoL0xLutJc9crUHJXNIVztGqekUD2uZi
	PMVn4jPhlQ2O2tP96FiaEXHDUpVKY3QdQaVeS6b2f0s0rwVbbmP3tGpHaP2iUv/xbgKZAuUu75zTk
	eihewz1a4m0VdHDu4Kzx5qjUSiPaS+F8H7EPnTOXJaAWw+cFPF7HnsD30tJh3LH5g+jJNunbuunk1
	+gDDSNSHHv/Z7waOfjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMuxb-008uwl-Lp; Tue, 31 Jan 2023 18:02:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMuxZ-008uwM-AI
	for ath11k@lists.infradead.org; Tue, 31 Jan 2023 18:02:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso6233853wms.5
        for <ath11k@lists.infradead.org>; Tue, 31 Jan 2023 10:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpDv+9QPHupt1UyeJB0z1k2Ufnogyk9lZGLkIf5nWzc=;
        b=svhNacA6geE2Ndg8QTafTeJu6fXopqBbRymSroIFbX/LguDYlC21U70PeI85j0xCO/
         de7Rlm3uRrh8/qlrB1NYmw40Q4ecXeuTtNnWmIu4sV6zoZ1/B40no6R1OICgEj/YiwqO
         chbqhdxE1n1PbVE6UtbqKZ/dH0C5M6cetlRhN5aflW70jBH8H0V3FdD1Kg1BsTxxEtOp
         o14OYqQLXk7wjBOd4JHFQrK5rTWVdkXYAnuaXZJIolGF+VmnH9VpjnnC9OkG8YfpzF7N
         BltxlLu0omgrNryDuBjGAUIG+WKGKdknMrQCjT4rOD2tcGRxjccSZD1mZl/p8KwOR1+H
         GHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpDv+9QPHupt1UyeJB0z1k2Ufnogyk9lZGLkIf5nWzc=;
        b=8BpQRsmqRTi9JWof9hYuejc63H0agoz0XSnQ3UsZF+DM+RW1v1L8wBMjX26Ojx35kf
         RhcbDgv1tHOPXAsMt6VjypX1FoNDh/vmEkoVE8OwXGHjGkL/IFwDXcRHl3kAtk/Gx2Vt
         YADAHzvgsvxMFWbQEB5IlC5yZjlh5RtN+SLFJNz1/fj+wblWTP5g6mW7W3Bitmke94Xq
         DcC4Ja2wDr49U8UjHGISGPgximGt91vExqq+otFxJAoyhNO61fWjBEUu/9VG3lviqy1P
         UsyIc5CDyjETE3fj5Tu7ZsUVXw3KPb/KyfXJ31OIApQTTNwC1yO7hfJm73HwipApchmB
         tIrg==
X-Gm-Message-State: AFqh2kpSqHvUpZz69KGV1MhFXMygrnLrR12vJyE7rVhgExmUCPQ0yX+q
	YNYQ+Frm4o19S95kUhqUwJhcMQ==
X-Google-Smtp-Source: AMrXdXtKb+4uvfotizMeuQfwAZA8MV5qRAu8vrz2XPdlaH7ZSWFKiEGd/DB4cabCuP4PCRF20iHbaA==
X-Received: by 2002:a1c:ed0a:0:b0:3d3:4a47:52e9 with SMTP id l10-20020a1ced0a000000b003d34a4752e9mr55153400wmh.15.1675188138023;
        Tue, 31 Jan 2023 10:02:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b003db2b81660esm7148131wmo.21.2023.01.31.10.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 10:02:17 -0800 (PST)
Message-ID: <622ef51f-643e-5eb5-3884-3f22bf4fa9be@linaro.org>
Date: Tue, 31 Jan 2023 19:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] dt: bindings: add dt entry for XO calibration
 support
Content-Language: en-US
To: Youghandhar Chintala <quic_youghand@quicinc.com>, kvalo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230131140345.6193-1-quic_youghand@quicinc.com>
 <20230131140345.6193-2-quic_youghand@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131140345.6193-2-quic_youghand@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_100221_407788_C418BC5A 
X-CRM114-Status: GOOD (  13.90  )
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

On 31/01/2023 15:03, Youghandhar Chintala wrote:
> Add dt binding to get XO calibration data support for Wi-Fi RF clock.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).
Hint: dt-bindings: net: qcom,ath11k:

> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index f7cf135aa37f..205ee949daba 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -41,6 +41,10 @@ properties:
>          * reg
>          * reg-names
>  
> +  xo-cal-data:
> +    description:
> +      XO cal offset to be configured in XO trim register

Missing type. I also do not understand what's this and why some register
offset should be stored in DT. Please give us some justification why
this is suitable for DT.

Best regards,
Krzysztof


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
