Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5FBC7EE45
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qs4w3VGMIWQBjCTTIbe8TfBFZ7fB7ZWKR1kogTjdIwc=; b=ShOykIj2oVs3Nf
	l+OiR7UrU3wYxZUOMvPhAcomGxbyumnBiDElo2+U+g0bAarO4vpRZD6pcU8eS+zRBQpHkHVRuLo8A
	UJFIEbqTGWlE9FZyPYRXaiAKMwJ19ciQnRdASKeXyX1j72N7trI/TBphnEbydETexNCh3EQqzr2B/
	MjzjbNcaP/Zwf6hFwkyi3/zIIkWRU+3raj0jYWF/ReF2w5uHOtBUzbzUFOdAnpyp1XZYqGQG+Oxba
	xnVPRmu7ZrB8EVY8VAr3Zzs9jbAld3Em7M5qpvV6CncYkswvIbSflbKW02AxSD2ahvQl40S/y7da0
	/pRa99ZA9KplSJUrfPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7fKU-00Den1-2F;
	Fri, 09 Jun 2023 16:51:14 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7fKS-00DemD-2n
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 16:51:14 +0000
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-777b4c9e341so89261939f.0
        for <ath11k@lists.infradead.org>; Fri, 09 Jun 2023 09:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329466; x=1688921466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSSJEKpJS9ep8WBVYc80IqXbeNN7GGka4ikEwnoQKkY=;
        b=jJyQIk/vU+FiVxzvl1TsvFmgCy91ehv49jKzmGAbcEueZjKQIFNfph+BlZYd9GF2E2
         /zSNdzAmroswD4ZIgJCqWc5j3BZW4XtJqkyRyVw0c2RxmxXb4VELGBWM6DLCYoES0m4r
         YEcLJX7MALAwkbDC8KuUMPvr68yVe1F6MEAd62Zd7vFgDZfeaCUp6TqHQvi1/+Rikz6s
         KwRd8ehFm54LpXuaUq2si2+ib4Wq14ArI/SSLn5rHUsjYOtVGxy0Ig9efnrh3RQyPE8k
         1jEtcVcFd2JgwAGQ0XXjycUzhYYGcXCGUrceZc1r0bL0LHgp61/vqEAUqTrmtlSonb/C
         OTUg==
X-Gm-Message-State: AC+VfDxQFgss5XDaTthlnmL+DdS4cW1zhmRf2sVJ190O1xOviAXtoYdr
	TN2VHd/htqu39ocdIJR6NX6Gf9gGaQ==
X-Google-Smtp-Source: ACHHUZ5ZEtQEXRaoNcL0DnxR5zhTN2IfUfFuYLnnfKE0ET+R0URsKnN0RwzwLGQ61w7QMCZNNrFA1Q==
X-Received: by 2002:a6b:4401:0:b0:774:94e1:3aee with SMTP id r1-20020a6b4401000000b0077494e13aeemr2107034ioa.6.1686329466676;
        Fri, 09 Jun 2023 09:51:06 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id j12-20020a02cb0c000000b0041d859c5721sm1054666jap.64.2023.06.09.09.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:51:05 -0700 (PDT)
Received: (nullmailer pid 1259925 invoked by uid 1000);
	Fri, 09 Jun 2023 16:51:04 -0000
Date: Fri, 9 Jun 2023 10:51:04 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, kvalo@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v1 1/2] dt-bindings: net: ath11k: add
 ieee80211-freq-limit property
Message-ID: <20230609165104.GA1257474-robh@kernel.org>
References: <a3075482150d342f71ec235badacec32cdd6c553.1686300243.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3075482150d342f71ec235badacec32cdd6c553.1686300243.git.chunkeey@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_095112_929446_1A918416 
X-CRM114-Status: GOOD (  14.04  )
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

On Fri, Jun 09, 2023 at 10:44:54AM +0200, Christian Lamparter wrote:
> This is an existing optional property that ieee80211.yaml/cfg80211
> provides. It's useful to further restrict supported frequencies
> for a specified device through device-tree.
> 
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index 7d5f982a3d09..91bf69c2df01 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -58,6 +58,8 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  ieee80211-freq-limit: true
> +

You need a ref to ieee80211.yaml as well.

>    wifi-firmware:
>      type: object
>      description: |
> -- 
> 2.40.1
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
