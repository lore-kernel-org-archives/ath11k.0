Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1EDC38142
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 07:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tcQraBb68/fVQW7Ym7JlLtLwqOmWIndS1DQSOKsN2Y=; b=jOfZzLoiRpV9Zd
	Ne57tq/iUEX1Go3FRphZEILTc59RMm3RSAbBbVUPQyaQmUPukw0lRdz1nEIUIYFPvNOjD5XT3nbDu
	ugMoJk40zYCIhwrNpRvS0bKqagG+g3Y4NRKhCoZ8wuVfxFJzEpgVH0+63vo7dr3HjsB2nkOr3Kooy
	O4agDpw0yS3FoNYp8/0om+PDTALPsf0DDnILq2mb3RYqsIsqAHgDF1BO3+RdSGk9+wEchxG7GRv7a
	Z1m3eDoxUcbjgA8d0uZOrscrAaV6+pQZ0tEpPCcoGA4dxHABQ6UGnhoQ3/CijOnHjfK/BuU8YhOaV
	f/c94cUgs0T8biggegUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPPb-003rIW-96; Thu, 19 Jan 2023 07:32:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPPP-003rEn-5P
	for ath11k@lists.infradead.org; Thu, 19 Jan 2023 07:32:28 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h16so906901wrz.12
        for <ath11k@lists.infradead.org>; Wed, 18 Jan 2023 23:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOAGtEwwl9ah5X14+fr3xyjQkxYKgtW7wTdmd7LaFEg=;
        b=vRIRpio+Aom4lroZdxIv5dfYLWZdktfYVL3jHgETXcsxRJ2IKyD1BV36YuWKt8r1nQ
         +07wunX4ZC3IPo0SiFKP/4cW4rCUCfgTlN/S3oDPCkSQ31hkzmGIEBxm3gnmd4L6UmKl
         skGsnD6BenqldlGA2OrrmLySBX41OvAjMUQRJ8cUUO+fWk72verQOTsg+UiyW/fjh7X1
         z5zfL1pWRMbdqXu+TUTUh+4KfrCuKlXZ/i2QJReFETSj/UWiGssDGb/4JCGsPml6Njtc
         k+zsV+4nZoM+MsAECNOaZY1mX1Eygrw9Sjwbj8l1hy5tTux8/UmnXFK4RdG5XA8ZJ+a4
         Jxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOAGtEwwl9ah5X14+fr3xyjQkxYKgtW7wTdmd7LaFEg=;
        b=x4LEpdRZvX19csDWiheHNzHmEW1keTGi/JeVBS1o470eE69L9Rbcy5QRHbTK50oal6
         qxpiwMuFztBJSBNIcHtGCcA9XTPLhJliNpdT8sNqULYkYVYXOpuwXdytf4R39FFZK4ph
         I+rdKhPyed+GcJf3/ByiZGp3Zo7pqdOZFUHNSu73EW2jEc4GT6U0ODnWxcrzOwgPka4G
         h4HhB6QsrpL5A4bcI78ziySAEu9rJy6qImJmfg4cUkL1Eic63szjky/Q69BD85u02ekW
         Ylz6btLwDXvCX2K82dHyJnlQ9XVFBZ4ZUY60CHD46dKDdkYNkx6UhgsLCztFUuHy5WIr
         Be7A==
X-Gm-Message-State: AFqh2kpFL4etD1Ca8RjYo6eXMpTQeAtvKYyfK70rGwat4h5zVCjLviL8
	FiFAiK3CTQGH9mu+rlmBpuMZ3w==
X-Google-Smtp-Source: AMrXdXsYozDSX5UXzU8eViFCPgDNSOimFqf7m+5mZ3D5VIeY9Dv8lV1BtejtIKH3WhVddwYIOFPnhQ==
X-Received: by 2002:a5d:4dc9:0:b0:2be:21fc:ae3 with SMTP id f9-20020a5d4dc9000000b002be21fc0ae3mr7080130wru.11.1674113545389;
        Wed, 18 Jan 2023 23:32:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d404a000000b00275970a85f4sm32958865wrp.74.2023.01.18.23.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:32:24 -0800 (PST)
Message-ID: <0662e292-91b4-0b1a-f012-83cb2f316353@linaro.org>
Date: Thu, 19 Jan 2023 08:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] dt-bindings: net: wireless: minor whitespace and name
 cleanups
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>, de Goede <hdegoede@redhat.com>,
 Tony Lindgren <tony@atomide.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, ath11k@lists.infradead.org
References: <20230118175413.360153-1-krzysztof.kozlowski@linaro.org>
 <87bkmv85tb.fsf@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87bkmv85tb.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_233227_265599_7C3C19D3 
X-CRM114-Status: GOOD (  11.12  )
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

On 19/01/2023 06:13, Kalle Valo wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
> 
>> Minor cleanups:
>>  - Drop redundant blank lines,
>>  - Correct indentaion in examples,
>>  - Correct node names in examples to drop underscore and use generic
>>    name.
>>
>> No functional impact except adjusting to preferred coding style.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/net/wireless/esp,esp8089.yaml    | 20 +++---
>>  .../bindings/net/wireless/ieee80211.yaml      |  1 -
>>  .../bindings/net/wireless/mediatek,mt76.yaml  |  1 -
>>  .../bindings/net/wireless/qcom,ath11k.yaml    | 11 ++-
>>  .../bindings/net/wireless/silabs,wfx.yaml     |  1 -
>>  .../bindings/net/wireless/ti,wlcore.yaml      | 70 +++++++++----------
>>  6 files changed, 50 insertions(+), 54 deletions(-)
> 
> Thanks for the cleanup. Would you like to me to take this to
> wireless-next or do you have other plans?

Go ahead and grab it for wireless-next, please. Thanks!

Best regards,
Krzysztof


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
