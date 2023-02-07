Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AFAC636CC
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ar0Yvj4mZ6dtVdSsB59gnUJ52Fj8gRq3iBSG/SHJnPI=; b=YA97MZ2Q6T2qlu
	y4rpAAC14UAXuL6vfY3E48ekONj/CfPzX1vA21pK04udNSBgVX5YB+C9620oKzUAlQZUlopTC6Zoj
	rkJ+5W31u9QKugESG7da0FWiR0VEDDjL5YEj1zI1FitR9mrHK1V6XN72sSYSSAw7pb/TCJhgDQj0c
	I6k6I4whQ/FrCu96aiTypBGv5/XbBL95Wnf2QDYAnDbsU4a8k7emX6tfoD2FqWXXnUNWa+vUxKeIH
	H5AjcV2GSlshPgenaYzmXno99hbukpIGBw6VEGfZPaPScguVhhIBnfmLG2/9kEV6/ixtvzPx8kHAi
	Z6E1jDqJ4et86Um10AgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLMb-00Bkcs-JO; Tue, 07 Feb 2023 10:38:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLMZ-00Bkat-Gj
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 10:38:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so12805041wmb.4
        for <ath11k@lists.infradead.org>; Tue, 07 Feb 2023 02:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HmtMaBV/sB8u/JUVv89jY+E+OuhfbbO4b2GTm4fpi7s=;
        b=q6j/uTmQf/BYJFJ6NP5V2dATSlkHK843NjxU/LGN5zJnSKO0DeWTWOYyaBoJWUBGAY
         mipjUzQofyKwbAy2aQXIhJ28FrFk+jJzZT7ZrsTrtgftd5kF+OWcd+aiVkZUw1NK488W
         0REJ3M4bHXizt65k3DQIovJ0ECRg6nyLhKDW+cjgbDU/6mRDE82nleA/JRIKrTmaDs5S
         YL50zEfmUAGJLGeATzcON5r6NDsENPeii8eL/UwcVnlqJ8gwFn+fOt5L7J7aFT9Vogqy
         EeP1/Ud/Wxw3hw5G4Aw/+qOx2660fwo4DYPoAm8ITziMOwqmjkGjaMe1cOKFZE59Oxk+
         NV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmtMaBV/sB8u/JUVv89jY+E+OuhfbbO4b2GTm4fpi7s=;
        b=hOVQSUSWXIjGNmvkCOEXczFiab7+iLE0jJocJk3cdcvLEUSoYczITWlmbKXPkZaZcD
         avGPyJ1U1TxeQ4znpVZyJd+46LWXcDjOCUhXl0wIYbwOMzL1Tx/7vGwyr/5FyAzV5I7r
         VJWqavbYc6Darg93AQtrFm1Va6KU204SMedU9no6NndyOZ8JZKUCUjWfeY+1azkmshFX
         2y19/ABixNrjQEagypPK/dOHXB0b4FdOAL3Qr/Q9PZEM4VAgZL7JtokwcouaRu45ZV5N
         BQPrXHYmAEwKzI8RB9wtCNC/FgUGz9Im8fHYnjeDfZodcA8JhXUG4/p7Dw2+GSieCQMm
         thAg==
X-Gm-Message-State: AO0yUKWai7oTh0vqvEYgnR/3RWmypuYWk19jwa21wnMt9n4ybbgJX4zR
	Qfdrr1/da5zntk8i3VCwKjMG0g==
X-Google-Smtp-Source: AK7set9AmSWcNXpqRqR+0WoOcGLaFXrGOKZhy8ROSChp8LM5JDz15yxOjZvLb4IegJyFlEcbGG65Rg==
X-Received: by 2002:a05:600c:330f:b0:3df:ef18:b0a1 with SMTP id q15-20020a05600c330f00b003dfef18b0a1mr3311962wmp.12.1675766287872;
        Tue, 07 Feb 2023 02:38:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c459000b003da28dfdedcsm14693201wmo.5.2023.02.07.02.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:38:07 -0800 (PST)
Message-ID: <059d7ff1-6ef2-02f4-0df0-bf14ebe33898@linaro.org>
Date: Tue, 7 Feb 2023 11:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/2] dt: bindings: net: ath11k: add dt entry for XO
 calibration support
Content-Language: en-US
To: Youghandhar Chintala <quic_youghand@quicinc.com>, kvalo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230207103607.12213-1-quic_youghand@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207103607.12213-1-quic_youghand@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_023811_600092_48C2F4BC 
X-CRM114-Status: GOOD (  11.53  )
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

On 07/02/2023 11:36, Youghandhar Chintala wrote:
> Add dt binding to get XO calibration data support for Wi-Fi RF clock.
> 
> Retrieve the XO trim offset via system firmware (e.g., device tree),
> especially in the case where the device doesn't have a useful EEPROM
> on which to store the calibrated XO offset.
> Calibrated XO offset is sent to firmware, which compensate the RF clock
> drift by programing the XO trim register.
> 
> Changes from v2:
>  - Added proper commit text
> 

I received v2 and v3 the same time - it's confusing. You did not fix all
the things I asked for, so maybe you sent exactly the same patch - v2?

In any case, sent v4 implementing entire feedback, not parts.

Best regards,
Krzysztof


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
