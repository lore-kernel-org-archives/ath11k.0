Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E723C7EE23
	for <ath11k@archiver.kernel.org>; Mon, 12 Jun 2023 08:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZjy3+YS0v62MvoPKnb5b+UEJJTwQf9N668fP5sti2k=; b=F1tpl0BOhn/kWU
	M6vn/6nI3n5KvUHPfCiJkgcAEyd26NbmWZrI/SvVmzJrtrggMqtincPuES3qJljS8EgIDyCwO0nwV
	EK3s+mWpbwvlbj1T8s68WV+5Ci+DbXtId1Yi8kYVksrEcwB0VrqhJL+kvv13yJML1ykV6xJwhwC8O
	Ut4P/597TIdGzuXn7x+B7t71Xl31iAHT8hfkIPQ0KKDXzwZbYY9bpI+aPWIeywc7KQcNNUksvS90n
	UUldUo7EPrerPTKY9cTi/E3a7/+CiduHlaaPT2xePUUzrUn+18itP0d7uGsFSpc8OY4AUm9mnUFLb
	Q5ytEmr2lxm6Z2dmw5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8d78-0038fG-0I;
	Mon, 12 Jun 2023 08:41:26 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8d75-0038dy-1c
	for ath11k@lists.infradead.org;
	Mon, 12 Jun 2023 08:41:24 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-98220bb31c6so69261966b.3
        for <ath11k@lists.infradead.org>; Mon, 12 Jun 2023 01:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686559281; x=1689151281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8Ur8MOZrJwM92sn9ZhHLfVI+ss4yM+tySM113dAEP4=;
        b=Nvm5LKK7UZFbFYZYsqAPkKLX3/tzJlGh5zVuhbX+Tl/Gnwwi3RBKeyUD0aXjmE6c/H
         O+j5/wpVyrOW6eAEeuA6r4ZuebDW/WXxdP2wkp7/aaoW82sSVqaQmhTr49v7erX3NCug
         FSwBHxPaTfOPgX2EYm/cb/ccZ+XOL1Gpr+WpuB5NcJ1ipkGAzGeO1mEyeqbXiuVbNExQ
         Qp2vP06/eK1JvK2uxeMW5RK736CMjop7MjpWpPtBQ1jBcOunAQPD98ZdFJM8t3yOdjoV
         ackR3VIpJbJGo3N29mb1KlVVi/xP4q2YM0ERq06WP6V7zjOyJFEuFtuLv70iWQQJ23cS
         J+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686559281; x=1689151281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8Ur8MOZrJwM92sn9ZhHLfVI+ss4yM+tySM113dAEP4=;
        b=YLVZ5Oluhs/7CjqNtJfu3jFHfimTemhX/cT+6VHQYlvcicJtMg8HOea7zF8NjWWYAI
         FjP3RY6nN1tQ4T8YF/r0ALbsEKA5pu2a6ucjPZhPvq5gsRQ5z3/BjuRtDcoP5v0mjAg/
         nvNY5jvQhBnHFAe6Yb3WUEr3sssA4l8Ro00neiD7c4zckF4BUm/4ETo+t2tjvunMTpPy
         1x0dacGCNTVamfN+CRrXB++OmXlu7zpytcMSCAU+oWKhJZhZEwkHlI7xEqij7EtNwqWL
         x1xCn+B7prNj7U8IJ2ulU8J0k8O8dReGq+rFPTVd7bmHkrEHmGY+COzHTMoetkC7oezU
         4mrQ==
X-Gm-Message-State: AC+VfDw3FJmFdRIGKZysmlMnYR0q4svY/s/InyJF4onDMOMZ7q8ASK9K
	jD6CM1DbfVgUekbnDM/C+swpog==
X-Google-Smtp-Source: ACHHUZ7/fbCBoNbxjZmknhTdyBcTb/QbArlgGKZicVWWnrzwvkpF3j1phhXfZ9+I0qPNE0NO9mhrbQ==
X-Received: by 2002:a17:907:7249:b0:97d:f8da:1717 with SMTP id ds9-20020a170907724900b0097df8da1717mr6359577ejc.7.1686559280877;
        Mon, 12 Jun 2023 01:41:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906601400b00977d3fb2a7dsm4849570ejj.76.2023.06.12.01.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:41:20 -0700 (PDT)
Message-ID: <7d0b96d0-536f-e438-76b6-e132e4f8ffed@linaro.org>
Date: Mon, 12 Jun 2023 10:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] dt-bindings: net: wireless: ath11k: add
 ieee80211-freq-limit property
Content-Language: en-US
To: Christian Lamparter <chunkeey@gmail.com>, devicetree@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kvalo@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <288fc9a0db6c292bc132e828611c41785b075078.1686486461.git.chunkeey@gmail.com>
 <fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fc606d2550d047a53b4289235dd3c0fe23d5daac.1686486468.git.chunkeey@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_014123_540171_C34B571C 
X-CRM114-Status: GOOD (  10.90  )
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

On 11/06/2023 14:37, Christian Lamparter wrote:
> This is an existing optional property that ieee80211.yaml/cfg80211
> provides. It's useful to further restrict supported frequencies
> for a specified device through device-tree.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> v1->v2: make dtbs_check dt_binding_check (moved to existing allOf: seems to be fine)
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
>  1 file changed, 3 insertions(+)

I got three similar patches in one thread, two with same versions.

One version is one patchset. Do not attach (thread) your patchsets to
some other threads (unrelated or older versions). This buries them deep
in the mailbox and might interfere with applying entire sets.

Best regards,
Krzysztof


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
