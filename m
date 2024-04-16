Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AB2C4345F
	for <ath11k@archiver.kernel.org>; Tue, 16 Apr 2024 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh5ZI3idZGap2wI1a/yXBFWlDa5xgAwrO7S/C7PLbe0=; b=NC0lXijJDsi1nbJhNmAgZigo9x
	Eva9ZdfOw5hSYJozSzsF+SyruTk0TzRmzpvZXumL2HjAlxSs+TGUaHQcliXy7h7DqvOrBaj+OmWlQ
	Uh3iqf4SR9+Kh9nzyYcjHGZomsfCijHvJHdlFoW/jY5K5Tw8FBC2Okj77fRsLjaxbg9sbBiiiEd+L
	7jcjwsgnY+SjqoiPuVDS6T7XN9BSx3w+0KVDH6np3c6VbZehjvV/Qw3rGl2dPUDXBqOv4MEQkGMh8
	iqQ1kNi/NXiHf2AaoqcqluPk5gLHxxrvZlTpwYKIGz181au176dD/z2GKxvAIH5gKfmYKgIfU98Nt
	JZaAXkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwikf-0000000CHHU-3Ajj;
	Tue, 16 Apr 2024 13:21:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwikZ-0000000CHEN-1Hfo
	for ath11k@lists.infradead.org;
	Tue, 16 Apr 2024 13:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A20C061219;
	Tue, 16 Apr 2024 13:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15684C113CE;
	Tue, 16 Apr 2024 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713273686;
	bh=Z3szNAXs6ookddwvTqDP6loCkEgNjGn9QA3Y5AYjnD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcQvRfl1PF1/Kl0BySnWfDqHKFK5MwmrpmyHjJdHuGazVgbWmowxihz+X9Z1ydyV6
	 WQwFGwvxMPYCFMDwvHitP9bfrnn9N/7OWL8rLRe5hIU1QXetQ+FqBXTf6M2L4Es/Gq
	 Y9Uvtb+U4nABOQ7FuBRAouvHSMziyxKaXAxvPocg6z7de6skX9QVzplTjqVDgcejaV
	 I66+RuWPA40e0Y6inNySzxwOIYy1MEG1ji1fso7X3LWcACj4yWBuFTNHMYiWzkkYBU
	 ie+0XMkKGuWj6Fmr6h93aoRpaG72qvwsuGwhFTatP8S1nnqSBW8GAV6CnYSx7l+HEV
	 6Fxj87lCsurdg==
Date: Tue, 16 Apr 2024 08:21:24 -0500
From: Rob Herring <robh@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: kvalo@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jjohnson@kernel.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath11k: add
 ieee80211-freq-limit property
Message-ID: <20240416132124.GA2143558-robh@kernel.org>
References: <20240412162510.29483-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412162510.29483-1-robimarko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_062127_673460_40A241E5 
X-CRM114-Status: GOOD (  13.94  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2024 at 06:24:08PM +0200, Robert Marko wrote:
> This is an existing optional property that ieee80211.yaml/cfg80211
> provides. It's useful to further restrict supported frequencies
> for a specified device through device-tree.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath11k.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index 672282cdfc2f..907bbb646614 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -55,6 +55,8 @@ properties:
>        phandle to a node describing reserved memory (System RAM memory)
>        used by ath11k firmware (see bindings/reserved-memory/reserved-memory.txt)
>  
> +  ieee80211-freq-limit: true
> +

Drop this and change additionalProperties to unevaluatedProperties.

>    iommus:
>      minItems: 1
>      maxItems: 2
> @@ -88,6 +90,7 @@ required:
>  additionalProperties: false
>  
>  allOf:
> +  - $ref: ieee80211.yaml#
>    - if:
>        properties:
>          compatible:
> -- 
> 2.44.0
> 

