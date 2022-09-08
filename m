Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035D2C38145
	for <ath11k@archiver.kernel.org>; Thu,  8 Sep 2022 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fmute6CLMme05yvffhWxVMQuYkseys35MedQD2lbUIc=; b=pQdppqTQSHl6uk
	TldJL1U4CZ0KskLfes/TIC6XAEllUmwXYxM3m8fK21RWscMJ6b9dFKR8XC/iqGSVFgE5U/PpU4/ld
	upDUmzeyrLAbIMRxrK693SZYAXVAglpk1nCZc6pyj/LMHaGCjkntqTlk9s6RvwTaqKzcMAOUrzZPg
	bEH3RJyqmP06HI4+KHtTu5qZJpRiCNbB+y0jD2vItH54SIUNviRDsamLju56bdAEiICq/KrcBCOV1
	JjYeUXbDUCajDzq/5ccDTXbu3/bTSNKJMeI+aoJ+HGd0yFt9u0l6OfGbAZwNVDJU3l4DG44ypN6sF
	IrYjgjWwOjb8P7sSSpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHIO-003bVg-Cy; Thu, 08 Sep 2022 13:10:16 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHIM-003bTl-Ab
	for ath11k@lists.infradead.org; Thu, 08 Sep 2022 13:10:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id i26so11892937lfp.11
        for <ath11k@lists.infradead.org>; Thu, 08 Sep 2022 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=t/JKBcxHSoQ7FDdtMfQrLOO/w2yUY2K7brpbjLCBW3g=;
        b=wB0/xm+BFAcD2XB5PoeFrU35xabxoPH5MY/aClwkqocNit/9ca/fVThTgrVyElDYDx
         eOD9XCNIauq8D3pRD54qwbJ7EB9+M7HzOAs8tV7qYNF+M3xETgkmEBq1YtSHXSW3gZGU
         paDAxzfhGjwILYL8vhwcx0fxGMhulS/bqCPTGwzVm8VboQyhvoAyLvlX2uJuX+ki5ck7
         jlRQZZvX+Cl9isIy9rd6l5b7h2Z8+pZwrA65ssAvQige4qu91GkKKutJQGEpIFziHH/u
         6VvVto0w+yMzgMAHsIKmGlGjODmvMo/8wduU52OAT+zS2l88nZkegXlLgwnzJmkFnIlA
         fHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=t/JKBcxHSoQ7FDdtMfQrLOO/w2yUY2K7brpbjLCBW3g=;
        b=xPhADh1/w3jKWhuXu65MrhJhiw9cAyzstQb6Ho8ZOZdqPA0ox5Y0MTpP2bM2Nsh2Nx
         gyj6Jn5C79yell84I8BEddkupfiuXwXiUU+VATIh7Ug8qf+J4HVFV6P8sEsxIFgwzFCR
         uBT2AoOc9f/gLsWGyH2u5bNMaLBkAR7UFO1tJLm87YXzCvDQT+nJ60YNbxgKNVZn6g5s
         td0m61lqfMtZdn+Xinhm067kocCf8BQIllNjnkihimLrr9TyiW+0RlAobwXwAiAqRWK3
         vcCdv1BHEbLxZB7RfVLQoZd4ZXsfhwq0Cce4VNg9K66wilR9n4HHz3OW+/77/zlNEtsC
         PRLg==
X-Gm-Message-State: ACgBeo2TxpeQ/3o8agpeqsiPCMSD5xfHHXcgQzDnMwDxFzQpevtAsnC0
	3XTJUQTXKgFgQOY1GxTJEQnDqeBZsDKrEQ==
X-Google-Smtp-Source: AA6agR7PfVl1wFwXF97fp+T0/Q3Ytb8dUk7/qcr7ZoJskpRSpz89r6EhxlMehGqltA5bMJUI7xQjXQ==
X-Received: by 2002:a05:6512:3f85:b0:492:c17e:d566 with SMTP id x5-20020a0565123f8500b00492c17ed566mr2544577lfa.341.1662642612739;
        Thu, 08 Sep 2022 06:10:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bg18-20020a05651c0b9200b00261cc85c32fsm3170324ljb.31.2022.09.08.06.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:10:12 -0700 (PDT)
Message-ID: <72cb0161-2988-b0fd-321d-96bb548ccc47@linaro.org>
Date: Thu, 8 Sep 2022 15:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/2] dt: bindings: net: add bindings to add WoW support
 on WCN6750
Content-Language: en-US
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 ath11k@lists.infradead.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org
References: <20220902112520.24804-1-quic_mpubbise@quicinc.com>
 <20220902112520.24804-2-quic_mpubbise@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220902112520.24804-2-quic_mpubbise@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_061014_419119_C718DC06 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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

On 02/09/2022 13:25, Manikanta Pubbisetty wrote:
> Add required bindings to support WoW (Wake on Wireless) on
> WCN6750 which is based on ath11k driver.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
