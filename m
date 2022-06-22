Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B7CC433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Jun 2022 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SI2QJT5cq4Rxu/ybh6kvP+2L28CUWT1WizprZVBQ5cQ=; b=X8x8w5XYJIzzkg
	imlE8PVFAS9cp3p2Qzez4UQxShZ68m0KDskERs8Eudpey8mKQI/NJW7QYIMwnvHMvPB5V38DlMBPe
	w7Q1fyCTRRH//PwKKH3sHVB6bh5t+WBYCOeNFCF0/dm4/2NyF8BImCEYKsvB3HiPfY2zzAdaQm8KT
	mCpi46k1xHzgE/NbA3c9/o1XctbcRU3NXFjMHXIy8mXAkaALEVcPi0K9j8iyVxiWYr4ccq38iiSR9
	IDjgHUKCWLJxr2hr7HKTQekN661cWsrAhPeJBd6u2BE+1QqxaKH/Y1/aAAyDfGSmlh2EB9RtLFp2i
	Rd/uW96CHg/UnoYeP79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41li-00B2M5-So; Wed, 22 Jun 2022 14:55:46 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o41le-00B2KJ-RX
	for ath11k@lists.infradead.org; Wed, 22 Jun 2022 14:55:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id eo8so24331147edb.0
        for <ath11k@lists.infradead.org>; Wed, 22 Jun 2022 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=X4Pad+8YipqXc8GK64t0Ga8h3j5acT4+ZXhROSFDHAY=;
        b=XaohlEvylppMCY+/f6p9Lh/ym1Lu1XP4HY/ahNo8U3FobNAq5i6QYoHqsYQH7gsp/l
         tG0fOtThXQAFnAk1dNF7pnFrQ4KacfboqDJZlHSNCi4MNhEBK0MOqo2TKJ5CV6RGbdy8
         f/vaZA3fJT4lB6x10IJLm42VIZPioeOE849DYzCJzmkT5XAmzPFH0e4Lx73dVQo/n6yZ
         fuefbMwfGTzqKghT6wkElXWdCU/OdNrrAZm3GfLUkwweapg38cqZQE4YLIwjMk0PUKNW
         J5fNUAaAnUmKURnXn9ZUxVa43/wCQBV6PEFl2Db86eHY9Aapzu44VY1ZzO8bo+0KlerO
         dDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X4Pad+8YipqXc8GK64t0Ga8h3j5acT4+ZXhROSFDHAY=;
        b=Z9RJOfGsZsuMd3PXmrO2y8J9qvTIACbUJZaDr+gz/C8XwI0uRY9sxbmjofIvqkjj2O
         qUCB+Fb3hI+T2/Er52bq26Gr9io11zTt3G1Wlc7i4KMJmVvRVYBGTUJUuToZ6VxKbA80
         /f7s/KOMqztEnNMr7Y2cpd/X1HdSYbP7LUc9MbzAl7/8gRjnFeKw1F0Cb6eLeEYl/v3w
         SFFsrJM4y3/djhONu8kkYA8UXeeN19cPxtFivMnp7tldke1c/oXW6ukIV/z+nzzL9tV7
         9ycc8U5FNvEpGLiuro+TgLYFYt+ratSjozBVP0iHwADo2HaUHVqisQvaTPhb9wNy6iRO
         nujQ==
X-Gm-Message-State: AJIora9rczTTkaRp2Wc+6+8M0abG6zAJyJKdkIeDBOGgVp+ANfpWEbO3
	Oq/lQbtzxwsSeBP/smLoonttvw==
X-Google-Smtp-Source: AGRyM1u0tYBGnlEakino5fvDCPmYG7WkCkTmr987C3P4bO2FgwL/3yqTnzyi+ecJDIW6Kl+6s3mbNw==
X-Received: by 2002:a05:6402:528d:b0:435:89c6:e16b with SMTP id en13-20020a056402528d00b0043589c6e16bmr4717954edb.292.1655909739169;
        Wed, 22 Jun 2022 07:55:39 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ju27-20020a17090798bb00b00722e57fa051sm2678547ejc.90.2022.06.22.07.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:55:38 -0700 (PDT)
Message-ID: <60ee4aa5-4fef-24e0-0ccf-b93eee1db876@linaro.org>
Date: Wed, 22 Jun 2022 16:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add new DT entry
 for board ID
Content-Language: en-US
To: Robert Marko <robimarko@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 Devicetree List <devicetree@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20220621135339.1269409-1-robimarko@gmail.com>
 <a194d4c5-8e31-ecd9-ecd0-0c96af03485b@linaro.org>
 <CAOX2RU6fBo5f6cxAUgLKj3j+_oP7nSm7awCpr_yiO_p3NssWkQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAOX2RU6fBo5f6cxAUgLKj3j+_oP7nSm7awCpr_yiO_p3NssWkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_075542_975740_E17E2A2F 
X-CRM114-Status: GOOD (  20.93  )
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

On 21/06/2022 20:47, Robert Marko wrote:
> On Tue, 21 Jun 2022 at 17:58, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 21/06/2022 15:53, Robert Marko wrote:
>>> bus + qmi-chip-id + qmi-board-id and optionally the variant are currently
>>> used for identifying the correct board data file.
>>>
>>> This however is sometimes not enough as all of the IPQ8074 boards that I
>>> have access to dont have the qmi-board-id properly fused and simply return
>>> the default value of 0xFF.
>>>
>>> So, to provide the correct qmi-board-id add a new DT property that allows
>>> the qmi-board-id to be overridden from DTS in cases where its not set.
>>> This is what vendors have been doing in the stock firmwares that were
>>> shipped on boards I have.
>>>
>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> ---
>>>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml     | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>>> index a677b056f112..fe6aafdab9d4 100644
>>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>>> @@ -41,6 +41,14 @@ properties:
>>>          * reg
>>>          * reg-names
>>>
>>> +  qcom,ath11k-board-id:
>>
>> The "board" a bit confuses me because in the context of entire system it
>> means the entire hardware running Qualcomm SoC. This is sometimes
>> encoded as qcom,board-id property.
> 
> Hi Krzysztof,
> I agree that the name is a bit confusing, it's not the same as
> qcom,board-id AFAIK
> and QCA as well as vendors are using a similar property in the wifi
> node to override
> the default qmi-board-id to the correct one as its rarely properly fused.
> 
> I assume it would be better-called qcom,ath11k-qmi-board-id as you
> dont even have
> to be using a Qualcomm SoC as the same is used by PCI ath11k cards as well.
> 

Thanks for the explanation. What is the "board" in that context? The
card/hardware with ath11k? Then maybe qcom,ath11k-qmi-id or
qcom,ath11k-qmi-hw-id?

Best regards,
Krzysztof

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
