Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C302ECAAD1
	for <ath11k@archiver.kernel.org>; Tue, 30 Aug 2022 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEQ7QeKarYMuSGEvzO5k0/LozNEmlHyEMokaFRH4YRc=; b=a6rfSroKinAI6/
	Lf29/BKTMEmLnPwM1uLMX73Au1VZapj+QXlM1l2FFzZlGtx3d06+AHVI4akW0u9nUSh+KTasN2Tba
	Az3p3H/Nt8KVvg7cwBeMvPjfbOIsrnTNvAvjQlM4xXcLeWnC8j1luTsvRZMdFNoZ2KOSO+JOgWXBh
	AC4v4IlUgGJ+95uzSUFCxdhyjacZFp5WSQpdTHcfntF64FBWOBeEeb0xiWU7bXNsHLHWc03deMcWf
	CGBxcXbrYzO3Z3zimPOSsEldjpYSNcdLODmtABmv+TL3roj5i2tZUY0bb4eEYumQCoEuN2UZpunFC
	JSST8FKGeh++1JpMuGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT503-000p5x-2l; Tue, 30 Aug 2022 17:26:07 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4zv-000p1k-A3
	for ath11k@lists.infradead.org; Tue, 30 Aug 2022 17:26:00 +0000
Received: by mail-lj1-x236.google.com with SMTP id b26so5195320ljk.12
        for <ath11k@lists.infradead.org>; Tue, 30 Aug 2022 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=KgBuun5MUMbC1cLHpEsYOW1ltE2MSZUVgIoptXfoUwU=;
        b=PHQq8Bm1Aa8YGdbMElujp9pCW2YsHrzcvSqwHbA/ocHa8ELvDwUfUUqGsjHz/KK3QP
         mMeNiQrIvUcjRCAmKhiAYPbfH0v7xgkrb/atZgLSKAhFVaw80k9efhb8hmYUTz0LsvGz
         K+TJid5kHjDJqYbqZcT695AA2oUccvIugvOhv/cOGpneAwHI/4J+WnvHBWgpXkGUbG0M
         AH2qqVpxMdklLa6+q4KFlVgL4FeVQJejFdHYvx0hc/i0xA/qN9IzUNFbpKxJUHUHylbh
         UshwJkOuAOf4FohPIvyKjz9c6gRQdCs+IQ3CraCSg0j5QPYzdKKkQJQSwajFheM7jLSn
         wn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KgBuun5MUMbC1cLHpEsYOW1ltE2MSZUVgIoptXfoUwU=;
        b=xWY8VNaVzw6OMMcxQo4YmbpNv36Jq5io9CFeMcUZZJBFkCEwSakpaXdd0k/DcoRbG7
         0M1ju3pRstlRCGCMPpIT/sXxWskhCm89wCEfuT9tEW9RMJRPYpjGvOEFLZwSwzmFcqS1
         akPhmnzGVkaL8MDMpjMaxt7zRJe/jZmjPQt5l7iRc+f9m3clCwm07FbK+36eohrayKBd
         VuKloPim/8Apdk9npNqSor75ml16G+qAy6hswcKUU4EDaYwK5itH657O5w+YwNSA1OOd
         mfh2FvSXAXWXrt1xQZWq9KWfwVs3LkDdU9edcSXrtYyXV+G/RilV4qb3c5Dk5N6D7oZP
         F3yQ==
X-Gm-Message-State: ACgBeo0b1KGrDhLgJ9HdFV8OxOj4ZcIP/Igp1uMxGYnjOA1Q2xJlvTCf
	HOtUuxhvbgQlaEoWFrjYYcQ8Pg==
X-Google-Smtp-Source: AA6agR7AMkNLzldsN7CSndDsJ/IajUZ+QIqAcfUHAeF1dxFSuX7EUio6GcUstiS8SvFpou+/tJ1xFw==
X-Received: by 2002:a2e:8857:0:b0:261:b1b3:ab93 with SMTP id z23-20020a2e8857000000b00261b1b3ab93mr7776341ljj.270.1661880357694;
        Tue, 30 Aug 2022 10:25:57 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id c11-20020a19654b000000b0049461118812sm270646lfj.285.2022.08.30.10.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:25:57 -0700 (PDT)
Message-ID: <3b169ca3-2962-339f-c8cb-c48ac41c9aa5@linaro.org>
Date: Tue, 30 Aug 2022 20:25:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt: bindings: net: add bindings to add WoW support
 for WCN6750
Content-Language: en-US
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
 ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org
References: <20220829124323.26874-1-quic_mpubbise@quicinc.com>
 <20220829124323.26874-2-quic_mpubbise@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829124323.26874-2-quic_mpubbise@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_102559_421405_891D07B4 
X-CRM114-Status: GOOD (  16.87  )
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

On 29/08/2022 15:43, Manikanta Pubbisetty wrote:
> Add required bindings to support WoW (Wake on Wireless) for
> WCN6750 which is based on ath11k driver.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Use scripts/get_maintainers.pl to CC all maintainers and relevant
mailing lists.

> ---
>  .../bindings/net/wireless/qcom,ath11k.yaml      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index a677b056f112..307a5b9d1588 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -66,6 +66,14 @@ properties:
>      required:
>        - iommus
>  
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: State bits used in WCN6750 to signal the firmware
> +                 to exit from WoW.

You need to describe the item (s).

> +
> +  qcom,smem-state-names:
> +    description: The names of the state bits used for SMP2P output

You need to describe the item (s).

> +
>  required:
>    - compatible
>    - reg
> @@ -410,6 +418,13 @@ examples:
>          };
>      };
>  
> +    smp2p-wpss {
> +        wlan_smp2p_out: wlan_smp2p_out {

No underscores in node names. This example is incomplete and I am not
sure what is the benefit of adding provider example to the consumer
binding... Just skip it.

Best regards,
Best regards,
Krzysztof

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
