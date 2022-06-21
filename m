Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B91CCA473
	for <ath11k@archiver.kernel.org>; Tue, 21 Jun 2022 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZoUC9XxC4NTJFFQ9DsVm7W0odUJ5uaoc8C07+IVcnVE=; b=yM1vKmdibHl1rI
	2rIoOp0AhmflKti3TzOZrsPnWAYBDJFs9XRQ2XnJ4jvICz84eGMAlkNVQe2nBd2x1H4gJxRgKgwR+
	p/ak3QcikNJvF+ZgGB+pV09RxKYItR4gDKV0QnIC7PLjPTSBahszLn2HC9c3dHmJEwhgoHEUm6iWk
	S01hEHf1fL+2sftGJAWht2MfMoehhcSE6j/9sKwYSf87Ayn8db71oTA0SvN3pn63Kg76wZtWgbCpi
	o6xKN2jYYhzIYI4ccPERpQarW2rmPJkrY7VPDi+A4ns6dQ9BUBuIsBRXpAZornxxPB/QYDMM3SK0I
	9G9q+QzQR9QO+aql7WAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3gGa-006GtQ-Se; Tue, 21 Jun 2022 15:58:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3gGY-006GsU-5D
	for ath11k@lists.infradead.org; Tue, 21 Jun 2022 15:58:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id a10so7748797wmj.5
        for <ath11k@lists.infradead.org>; Tue, 21 Jun 2022 08:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=8bGIi/65SNf1gUCizJJAA/uyPpaT7iiHXEa0Yre3OLs=;
        b=qc78xzPKYmrdcuYQ1ne6Hu8H1BSHHtXY0kD3g+N7e0SwghvQN3cw/qoAboUgUrs+Ck
         +iwQJ1AJ10Btc0VTT9f6WHOgo8D1M44NtYEiybmDF8Qw1nuDngA9JskQuGCbrE3tO6nl
         eOC4eyyo/f5SFvf9KgmRv+CDRnTziQhvDBCEM5t7Y86dYYU5K3O1Rl6sZVi1kpPAVOvC
         Mm5VwD38GAGomFJPcHYSHlYRYekmhbWFD6Ok/DiaZrz5oqAr5y0B65kbUBRp1g5dzbcn
         hGDJpk81SwmFxFBSKHm447D3o18Ami9ckEnNWJFVwbBjwjxjpvgRktuW+I3Y1jnfs+DD
         k+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8bGIi/65SNf1gUCizJJAA/uyPpaT7iiHXEa0Yre3OLs=;
        b=F4FW4G0adXEYgyIpQ7j6qWf35u/jAEkjuvCjqLhVAGDsLQS9SRUq0JorX30aZ9X0ic
         xOwIedYi8LmF4TDlpiWxnXts5XYqqD6bDMANTfCTxjSGwAKhOkWdMjgdY4CsVq0bpNa0
         rt58f5nmHvggQsweoJ/y5kmeli5z6BtCCGtaDGi25xn8/Hj3aeOYL/SVVPkKcFTieLUJ
         T7IQ5vYvDwy+9HdlraZNQYz+cO6tl2VmCcY1UK9Zi3cbLUbi5U9DCfyz6m4wVJhtlfEC
         uJGAcjmvGXB2mkGLB/Jh98gST2/tTooiCzYrq1wqv+EaGp3uEZx6N1MsAK2oL4UIT1WF
         7sDw==
X-Gm-Message-State: AOAM533Kz0kcyXLjYUUXqWx+w3qyCeWs3NYyONKRdIQrIIH1L6Y3T/fn
	j1vukTfjLW6zxS8WusIRNxO1ZA==
X-Google-Smtp-Source: ABdhPJzfQtcmGS9lGGD/a74+uwozsMtxNFYclUUgKl5wNK5vG+XpP16pmsEjUM4CRShV7wvaWru3eQ==
X-Received: by 2002:a05:600c:3b88:b0:39c:55b2:3d1 with SMTP id n8-20020a05600c3b8800b0039c55b203d1mr42734848wms.64.1655827086597;
        Tue, 21 Jun 2022 08:58:06 -0700 (PDT)
Received: from [192.168.0.221] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i187-20020a1c3bc4000000b0039ee52c1345sm12581252wma.4.2022.06.21.08.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 08:58:06 -0700 (PDT)
Message-ID: <a194d4c5-8e31-ecd9-ecd0-0c96af03485b@linaro.org>
Date: Tue, 21 Jun 2022 17:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add new DT entry
 for board ID
Content-Language: en-US
To: Robert Marko <robimarko@gmail.com>, kvalo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220621135339.1269409-1-robimarko@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220621135339.1269409-1-robimarko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_085810_263964_893D4C9F 
X-CRM114-Status: GOOD (  20.05  )
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

On 21/06/2022 15:53, Robert Marko wrote:
> bus + qmi-chip-id + qmi-board-id and optionally the variant are currently
> used for identifying the correct board data file.
> 
> This however is sometimes not enough as all of the IPQ8074 boards that I
> have access to dont have the qmi-board-id properly fused and simply return
> the default value of 0xFF.
> 
> So, to provide the correct qmi-board-id add a new DT property that allows
> the qmi-board-id to be overridden from DTS in cases where its not set.
> This is what vendors have been doing in the stock firmwares that were
> shipped on boards I have.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Thank you for your patch. There is something to discuss/improve.

> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index a677b056f112..fe6aafdab9d4 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -41,6 +41,14 @@ properties:
>          * reg
>          * reg-names
>  
> +  qcom,ath11k-board-id:

The "board" a bit confuses me because in the context of entire system it
means the entire hardware running Qualcomm SoC. This is sometimes
encoded as qcom,board-id property.

Is your property exactly the same?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Board ID to override the one returned by the firmware or the default
> +      0xff if it was not set by the vendor at all.
> +      It is used along the ath11k-calibration-variant to mach the correct
> +      calibration data from board-2.bin.
> +
>    qcom,ath11k-calibration-variant:
>      $ref: /schemas/types.yaml#/definitions/string
>      description:


Best regards,
Krzysztof

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
