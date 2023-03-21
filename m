Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E56DC761A6
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOQ4RoZeAQe5OZsAjdoHrvs+94M3eXdJ9WZWzdzRgj4=; b=h9raNFcN5QfeNE
	g0xHgnYUKp5bMNZBapXBdcRxHM8EvMBlc0z5q3BrMI7khR1bflPeu6M+M0pYjY3ag00JeL4mLkBZ0
	e64WSc3Z1UnEbzsntLMzCS+5vtp4vi+qFmKD2HNDgflxHVeXUFHam15Lo8VgsT7Bh6Kyvb5WQws8i
	1XbUiWpIahQ7cDXoaBaYndQ+4w0UivfPXrZlBHGLtrZfUc4q63nqqrbF6Spi0Awp67K371E5LrXGS
	zdy027L/0u+j3dTZ9gSUoKExMku7vwSO4VVZC3PIkNzyO5nTPWFQpidFrnLlqhr1fpX8qZqBvL6pO
	ze7R6WclDdu0PopQvMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYz8-00Byyi-0l;
	Tue, 21 Mar 2023 10:12:54 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYz6-00Byxv-0I
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 10:12:53 +0000
Received: by mail-ed1-x52c.google.com with SMTP id eh3so57434678edb.11
        for <ath11k@lists.infradead.org>; Tue, 21 Mar 2023 03:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679393566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBblg6ouqKODHyX877fXDi2urk7+HMZmQEWvK4N+5xA=;
        b=cyDchbnmi/K2X12VsJrtHmzOjhrjENPwu2ileUBtV/RR8kgrZ0leVFpzOYCfij+f8s
         +j0bZQSRs/xu91acp5PQGXNgAyIDjwcpuExswfSxzVRjnvoiryoQqjxckO02RX9RZUwE
         Uyz4OfHVdkj2VLarrKqf4fzVEd9lh5y2GPMzm3nnByYCs7FmDLUTw/uzJPuT+m5NUSkF
         FHrzc2YTyAYiXxW4nsBVVBpeddlVENEZ8XQvNE6RXkAZHCtOqvAQBAsyl7kw9ONLHFkT
         3fZwrtBB3WppLix8HvgVD9jWpWM3/6BDfqmkPmssj0pcorizhIN0+KD8P5ok8DVg/GP7
         Z8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679393566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBblg6ouqKODHyX877fXDi2urk7+HMZmQEWvK4N+5xA=;
        b=kZY5ZgPC/xr9jdYdTrJIx6Cxfav7GgZJBh7rB/mNkc8fXeiIqvCuT0BC0q/c4nzJfR
         TtIxt/WNdc+xLGi7v5IiDnmmS8a2QOW9K2LRAvab5nphE9/zkLclciTjQsPnuXo9qzY1
         d4j0uA9PSDP7XNMikCiwofWOu+ww5t7slaaSldz1YsTgMNPRgrJL+ROlAz0EgtsUQq7X
         oOenAfMFVRZfNoSdozD8Dwc7NaWpSC1DuMhWji7WqkZ6fdJgaDIYePBF1+TYWFWQL+q8
         l2DvzRM1xGDNNWAJ30d0YGMm1J7aHbTf8LkxqEssh5ZxWs4Ynp8WEsA81Fn2vSrLRdTJ
         v/PA==
X-Gm-Message-State: AO0yUKUJ/J5vcWRBqM3o3iaNLG5BWIjNhy3J59UhTQPISomFT1maJ9OW
	pNAdE/sBOFnAnbX6jsu21QB+yA==
X-Google-Smtp-Source: AK7set9y91HFCneDKUYOtGWZfa4sI4vIRE5C0iaFvRabDlbD7NgNvD8qB02c9rR0uphL/1AlejObbA==
X-Received: by 2002:aa7:d317:0:b0:4fb:5795:b7e0 with SMTP id p23-20020aa7d317000000b004fb5795b7e0mr2523640edq.31.1679393566673;
        Tue, 21 Mar 2023 03:12:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id g9-20020a056402320900b004fd219242a5sm5983006eda.7.2023.03.21.03.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 03:12:46 -0700 (PDT)
Message-ID: <c4d67c22-6953-0f2c-4b80-cc9ab2ab5e8b@linaro.org>
Date: Tue, 21 Mar 2023 11:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: wireless: add ath11k pcie bindings
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Steev Klimaszewski <steev@kali.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230321094011.9759-1-johan+linaro@kernel.org>
 <20230321094011.9759-2-johan+linaro@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321094011.9759-2-johan+linaro@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_031252_145500_C8CEE193 
X-CRM114-Status: GOOD (  10.56  )
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

On 21/03/2023 10:40, Johan Hovold wrote:
> Add devicetree bindings for Qualcomm ath11k PCIe devices such as WCN6855
> for which the calibration data variant may need to be described.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../net/wireless/qcom,ath11k-pci.yaml         | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
