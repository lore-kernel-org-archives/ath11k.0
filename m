Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16CCC636CC
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsZeGft8LyWD28DsXL8SA3o46EIpZ2i4ZIsdpquiQhA=; b=XhJJrki6oO05/N
	V5TPDsxepicPv+J48NX3KgemgbxEAc5ehRRaXMv85rSEP+CqK+jxoNnYHcmptOpUAHeCPqT+vIRND
	GXNeOANOlRZTAzH27uizCSXkaSlOhWA4vPBOTOm5RAVJuXuuta9tsUeQlldz/xsDv+xTdGocs+7vh
	CrKsfMWXcV6mW3B3MdByvac00v6ajgtjMgbynw9C6QMVX0C309mHgG+VVmoHyyyonZEvaGbJRuIcH
	PTrPNiqIB2Vgw0BZPgeZ/UhP31ng5q4X81REPSJ8UddJRH3ohMElVf6l/MX1011rYDRzR3dyOl0cd
	NvOvvzVaL4e4xZix0CMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLL4-00Bk17-1y; Tue, 07 Feb 2023 10:36:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLL1-00Bjzx-TE
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 10:36:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so836837wms.0
        for <ath11k@lists.infradead.org>; Tue, 07 Feb 2023 02:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6akUIoItLi3FPLFbzJ7SrzjHSbuoH+2n41Ug/RmLJwc=;
        b=dRcfv9CHkDxW/ZUOibWuY6fjH5+3zcpZ2Sx+P63o+6bUh6UFzD2QexUPBR2Nak9U8C
         YDq7V41MvojNOMA3BpXiMb9cV0gqX9oTi9uElt/85ajXg+xShHs4aaSlGbPw4+mnFYeS
         43v9xxZ868hbEK0E8vxdK1GgltJPpBthIgBg032n9N6P5zj4gH0Kxz6xL8JfXLZ4BsaX
         OSITbJR82H18wIS5pEc7QG1JQR26r3HLURTxe0KKShSre1H7BnEn1TK5A3sl5FzMRYnL
         HvUtSHb25hixtvU/gIAcxTEpQJ8KlqKK2UVvRXR8Yc4pIQB/nJmLPjXQ+vJq1Yai9i0e
         7tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6akUIoItLi3FPLFbzJ7SrzjHSbuoH+2n41Ug/RmLJwc=;
        b=CQS/ADN6CXKg9x0OZjAjaDeQjKQEQN1H7iqXHDXT4i28tg1XlciEIE4en99q0HUN76
         /ZLewDS/QD+subQLJlnh33S9uCY4nSQ2eR3+BAgb4ZUyG2fYgk1PCvx5ESNV+8jrfpVA
         DQ2bzRXmk9Q9jjrnm/jEZ0VDUMXLZeXk2XaQ9ovtxsl40WaeuGwnmyOVoovSKRTl9hBr
         d4kkosJYSicKF26pTQc6FZQR4MVwELdiAvGnzLg3Xe181ZaG1TPFAOM5O+M7JlsRjR83
         /IhnLOijzndKAdJkFzAjl3mGHvRT5OAuxB9LvkgO6jzJqUhrQTtF1nao16Ee4m5tZDIa
         +msw==
X-Gm-Message-State: AO0yUKXAy2VViK4pI1CEUbL30XkD+sH62g+u28u2tlBf+fq9di559OU4
	CUerZLZzwVX3mWIZ9OM/syBfCw==
X-Google-Smtp-Source: AK7set9dhWTRjD2sCEQ1PXiRWCf6P/rNr3G4SvS5+IcLaf3dVJAC7IrrK5MTz5yTEI2K3JWwmtIJ2A==
X-Received: by 2002:a05:600c:44c4:b0:3e0:14a:697a with SMTP id f4-20020a05600c44c400b003e0014a697amr2728064wmo.6.1675766193599;
        Tue, 07 Feb 2023 02:36:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w14-20020a05600c474e00b003dfe57f6f61sm13680712wmo.33.2023.02.07.02.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:36:33 -0800 (PST)
Message-ID: <e56a9985-001e-fb42-f916-94f2bb5d6d13@linaro.org>
Date: Tue, 7 Feb 2023 11:36:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] dt: bindings: net: ath11k: add dt entry for XO
 calibration support
To: Youghandhar Chintala <quic_youghand@quicinc.com>, kvalo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230207103207.759-1-quic_youghand@quicinc.com>
 <20230207103207.759-3-quic_youghand@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207103207.759-3-quic_youghand@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_023636_021590_DCD37A52 
X-CRM114-Status: GOOD (  17.37  )
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

On 07/02/2023 11:32, Youghandhar Chintala wrote:
> Add dt binding to get XO calibration data support for Wi-Fi RF clock.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Several comments were ignored.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Subject: drop second/last, redundant "dt entry for". The "dt-bindings"
prefix is already stating that these are bindings.

dt-bindings: net: qcom,ath11k: add XO frequency offset

> 
> Retrieve the XO trim offset via system firmware (e.g., device tree),
> especially in the case where the device doesn't have a useful EEPROM
> on which to store the calibrated XO offset.
> Calibrated XO offset is sent to firmware, which compensate the RF clock
> drift by programing the XO trim register.
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index f7cf135aa37f..4745251e70d4 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -41,6 +41,10 @@ properties:
>          * reg
>          * reg-names
>  
> +  xo-cal-data:
> +    description:
> +      XO frequency offset to program the XO trim register

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

(missing type/ref, vendor prefix).


Best regards,
Krzysztof


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
