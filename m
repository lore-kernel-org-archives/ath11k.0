Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD19C433F5
	for <ath11k@archiver.kernel.org>; Sun, 28 Nov 2021 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE37AMNM72RF2RDqNZWQHynZ8vGPpcHqoaiITz6gOyY=; b=XUum5+7guxLNm2
	2jblqrqnOZW5UsOn9NpVwNwNHRUXZcQrPmkVxHsyT7K1ebwA48koQ41RNnml+MZ/tzYPwBBhE+d2u
	ID8F7f7uJbnQMnsku3sM3Z85FHLoHin4WRg71KXD1u18u/rtl/Yn3907cHk3Pd70bviToToLJfq7+
	Scxvu2Ta5oj1KmRsC0aYTMXzO2IVAhKHZH5djZDjpZgY8mKfCoLLh+dlQFf0k23oycNy84JnshQf0
	0DHh4p9C0PeVjbe2tej9og8W+ei0oE0ZcOfYoBD9hF0oUUxRubc3v0Eo8oP2by9zDockMWBGKzZx0
	4cKWHBRt2z8JfRP1Q+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMvK-00GAqv-Cg; Sun, 28 Nov 2021 16:21:06 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMvI-00GAqR-E1
 for ath11k@lists.infradead.org; Sun, 28 Nov 2021 16:21:05 +0000
Received: by mail-oi1-f181.google.com with SMTP id m6so29699925oim.2
 for <ath11k@lists.infradead.org>; Sun, 28 Nov 2021 08:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rows3bbzx3uDnffPtYtrJqcIHaHB1wqydgZBkfJyu+g=;
 b=uwyTwg9eOCInM3XsIU/BqUy0Swim+A5w1TOPRgkFIupNm7VyJip5HX+rie1XfdMHZX
 ME4YPr3TjcusUu1iNxNzdutEZbAo2/VeOje0VdZAkI3xT7LtHxPwMdCxC47TlmZhHiQa
 WZ4UnQDhE1Gh7G/Chur30pWZcUb6qYSSW4bVSLQdY6tgU9Sg9sQyWHWqbMpzC+d9WquW
 PiqwYPvJGYLp0XkifQEIa1kzcHGx6as8mP71LgGqx52PmfdNK1kBAsbeIM7/YZGbxJ7m
 EPGgEuastQEkRqwmnqdFjOnmTH+zcNAHukZvAt/JWMqduY0b40518AYrzZUrWWjYmcCa
 0nyw==
X-Gm-Message-State: AOAM531ewXN2GHrucePybl+EaZnQ5NclfsZttUVNQmgGRgTcxR/sdI+6
 bBPGWEq5kFluHzon5ibUUw==
X-Google-Smtp-Source: ABdhPJyOjwch8/laQZLnAM4PHiyEzn14IdNUcQCwKF6bifCPIkJdQgCoTLoC7k76111sLmANHibt1Q==
X-Received: by 2002:a05:6808:148d:: with SMTP id
 e13mr35765874oiw.140.1638116462727; 
 Sun, 28 Nov 2021 08:21:02 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
 by smtp.gmail.com with ESMTPSA id
 p14sm1948298oou.31.2021.11.28.08.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 08:21:02 -0800 (PST)
Received: (nullmailer pid 2655105 invoked by uid 1000);
 Sun, 28 Nov 2021 16:20:59 -0000
Date: Sun, 28 Nov 2021 10:20:59 -0600
From: Rob Herring <robh@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 19/19] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Message-ID: <YaOsaxfXLmOtznYg@robh.at.kernel.org>
References: <1637693434-15462-1-git-send-email-quic_mpubbise@quicinc.com>
 <1637693434-15462-20-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1637693434-15462-20-git-send-email-quic_mpubbise@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_082104_506161_527BBD46 
X-CRM114-Status: GOOD (  11.97  )
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

On Wed, Nov 24, 2021 at 12:20:34AM +0530, Manikanta Pubbisetty wrote:
> Add WCN6750 wireless driver support, its based on ath11k driver.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  .../bindings/net/wireless/qcom,ath11k.yaml         | 333 ++++++++++++++-------
>  1 file changed, 225 insertions(+), 108 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index 85c2f69..60bda6d 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -20,120 +20,21 @@ properties:
>      enum:
>        - qcom,ipq8074-wifi
>        - qcom,ipq6018-wifi
> +      - qcom,wcn6750-wifi
>  
>    reg:
>      maxItems: 1
>  
> -  interrupts:
> -    items:
> -      - description: misc-pulse1 interrupt events
> -      - description: misc-latch interrupt events
> -      - description: sw exception interrupt events
> -      - description: watchdog interrupt events
> -      - description: interrupt event for ring CE0
> -      - description: interrupt event for ring CE1
> -      - description: interrupt event for ring CE2
> -      - description: interrupt event for ring CE3
> -      - description: interrupt event for ring CE4
> -      - description: interrupt event for ring CE5
> -      - description: interrupt event for ring CE6
> -      - description: interrupt event for ring CE7
> -      - description: interrupt event for ring CE8
> -      - description: interrupt event for ring CE9
> -      - description: interrupt event for ring CE10
> -      - description: interrupt event for ring CE11
> -      - description: interrupt event for ring host2wbm-desc-feed
> -      - description: interrupt event for ring host2reo-re-injection
> -      - description: interrupt event for ring host2reo-command
> -      - description: interrupt event for ring host2rxdma-monitor-ring3
> -      - description: interrupt event for ring host2rxdma-monitor-ring2
> -      - description: interrupt event for ring host2rxdma-monitor-ring1
> -      - description: interrupt event for ring reo2ost-exception
> -      - description: interrupt event for ring wbm2host-rx-release
> -      - description: interrupt event for ring reo2host-status
> -      - description: interrupt event for ring reo2host-destination-ring4
> -      - description: interrupt event for ring reo2host-destination-ring3
> -      - description: interrupt event for ring reo2host-destination-ring2
> -      - description: interrupt event for ring reo2host-destination-ring1
> -      - description: interrupt event for ring rxdma2host-monitor-destination-mac3
> -      - description: interrupt event for ring rxdma2host-monitor-destination-mac2
> -      - description: interrupt event for ring rxdma2host-monitor-destination-mac1
> -      - description: interrupt event for ring ppdu-end-interrupts-mac3
> -      - description: interrupt event for ring ppdu-end-interrupts-mac2
> -      - description: interrupt event for ring ppdu-end-interrupts-mac1
> -      - description: interrupt event for ring rxdma2host-monitor-status-ring-mac3
> -      - description: interrupt event for ring rxdma2host-monitor-status-ring-mac2
> -      - description: interrupt event for ring rxdma2host-monitor-status-ring-mac1
> -      - description: interrupt event for ring host2rxdma-host-buf-ring-mac3
> -      - description: interrupt event for ring host2rxdma-host-buf-ring-mac2
> -      - description: interrupt event for ring host2rxdma-host-buf-ring-mac1
> -      - description: interrupt event for ring rxdma2host-destination-ring-mac3
> -      - description: interrupt event for ring rxdma2host-destination-ring-mac2
> -      - description: interrupt event for ring rxdma2host-destination-ring-mac1
> -      - description: interrupt event for ring host2tcl-input-ring4
> -      - description: interrupt event for ring host2tcl-input-ring3
> -      - description: interrupt event for ring host2tcl-input-ring2
> -      - description: interrupt event for ring host2tcl-input-ring1
> -      - description: interrupt event for ring wbm2host-tx-completions-ring3
> -      - description: interrupt event for ring wbm2host-tx-completions-ring2
> -      - description: interrupt event for ring wbm2host-tx-completions-ring1
> -      - description: interrupt event for ring tcl2host-status-ring
> +  reg-names:
> +    maxItems: 1
>  
> +  interrupts:
> +    minItems: 32
> +    maxItems: 52

You have to define what each interrupt is which you are not doing for 
6750.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
