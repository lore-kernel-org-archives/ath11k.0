Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379BCC433EF
	for <ath11k@archiver.kernel.org>; Mon,  7 Feb 2022 22:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/QqvEyk6JMVxRn9KSORBOuzWA3mpGin/ahbtwafJ7c=; b=3I2IYrS+FfeWcC
	L5RMByDr5+nEGZBFMvpVt9HBug8vMO+lvoewl9rumBeaxqOQCcyoxYctfoUh+Y/2roXdluU4XfgTC
	zn6ulcnR2kWKrlocQirTM0Nl3Yxc28qs9R8DdLTQb2n+wYXfNq6xtBsQsY1MC0Pd/MflLScLhVvj0
	ve72DN5qmaPj5fS+0ZYq085ncpg04vFAxaGdgWN+dW6sRDTcjjWhCgbEum8Ygjobw0MZIVC6vOEVI
	jIO2TBvE58KEiczbXtRUa2VTN5iptOgELOWj0J3OsCvsqZQgJc5tzmFpjAWMhsgrHDRPmJkleVGXg
	Y9W2YI0nZxG2MZqkyJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHCFz-00BqTZ-95; Mon, 07 Feb 2022 22:13:11 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHCFv-00BqSw-8X
 for ath11k@lists.infradead.org; Mon, 07 Feb 2022 22:13:09 +0000
Received: by mail-oi1-f176.google.com with SMTP id s24so10951416oic.6
 for <ath11k@lists.infradead.org>; Mon, 07 Feb 2022 14:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3jyNz5pg2UyZq04f1UG2D2METtpVTKUPDLfBiKBoAPk=;
 b=4m6MMSXmCibcWH80rJeqYm9Mn+uaVpBRQcaDKadkl1ioBSVYJTd3XYPeHkXqJYEvtw
 In2X7WekQV7csicXVpt0FJpDPK2eGZaX1dJ9JioGlIXdXGb1JUqyUZHWRhz+qqZ9K6Wx
 tFJzxwxE9/s8gXDn3Q1TbtJt5OgRGqePJULQLwZifwdl/ImYWX01q73qfmOigptC0wti
 U7nEfj8lc2S51S3p6uGE+KP+TyiEKjSjIrGyCsfkjsJH5KGXQzebsZY0Fi/8EVNyBW1Y
 QvcSu+SgA+kUzBlfN9U6VYBg/VJtfyMSNk0I2qOdNlKBw+YIvzqW62hQcW4NYTomeuOo
 Fzfw==
X-Gm-Message-State: AOAM532fYFKwfZpHkjRz/+f3B+LyBWp2s9XrbCN1vrwDtBgjrILGFYNX
 q9GYbRzc32repRSh33yobGyFmcxw+w==
X-Google-Smtp-Source: ABdhPJzWUM53/kf50mnDcnkTUk7imTJJXtWJA42TzeSRfkZiYUn62WBPrU3swx5ttDd5kVdmZjO7TA==
X-Received: by 2002:a05:6808:219d:: with SMTP id
 be29mr468598oib.77.1644271986572; 
 Mon, 07 Feb 2022 14:13:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v78sm4778007oie.18.2022.02.07.14.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 14:13:05 -0800 (PST)
Received: (nullmailer pid 1018829 invoked by uid 1000);
 Mon, 07 Feb 2022 22:13:04 -0000
Date: Mon, 7 Feb 2022 16:13:04 -0600
From: Rob Herring <robh@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 19/19] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Message-ID: <YgGZcB2HYNiTaiSG@robh.at.kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-20-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1642337235-8618-20-git-send-email-quic_mpubbise@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_141307_353925_3F8FBB8E 
X-CRM114-Status: GOOD (  16.07  )
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

On Sun, Jan 16, 2022 at 06:17:15PM +0530, Manikanta Pubbisetty wrote:
> Add WCN6750 wireless driver support, its based on ath11k driver.

As mentioned, provide a better commit message answering 'why'?

> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> ---
>  .../bindings/net/wireless/qcom,ath11k.yaml         | 365 +++++++++++++++------
>  1 file changed, 257 insertions(+), 108 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index cdf7b87..dba1434 100644
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

Need to define the names though for 1 entry, -names is kind of 
pointless.

>  
> +  interrupts:
> +    minItems: 32
> +    maxItems: 52
>  
>    interrupt-names:
> -    items:
> -      - const: misc-pulse1
> -      - const: misc-latch
> -      - const: sw-exception
> -      - const: watchdog
> -      - const: ce0
> -      - const: ce1
> -      - const: ce2
> -      - const: ce3
> -      - const: ce4
> -      - const: ce5
> -      - const: ce6
> -      - const: ce7
> -      - const: ce8
> -      - const: ce9
> -      - const: ce10
> -      - const: ce11
> -      - const: host2wbm-desc-feed
> -      - const: host2reo-re-injection
> -      - const: host2reo-command
> -      - const: host2rxdma-monitor-ring3
> -      - const: host2rxdma-monitor-ring2
> -      - const: host2rxdma-monitor-ring1
> -      - const: reo2ost-exception
> -      - const: wbm2host-rx-release
> -      - const: reo2host-status
> -      - const: reo2host-destination-ring4
> -      - const: reo2host-destination-ring3
> -      - const: reo2host-destination-ring2
> -      - const: reo2host-destination-ring1
> -      - const: rxdma2host-monitor-destination-mac3
> -      - const: rxdma2host-monitor-destination-mac2
> -      - const: rxdma2host-monitor-destination-mac1
> -      - const: ppdu-end-interrupts-mac3
> -      - const: ppdu-end-interrupts-mac2
> -      - const: ppdu-end-interrupts-mac1
> -      - const: rxdma2host-monitor-status-ring-mac3
> -      - const: rxdma2host-monitor-status-ring-mac2
> -      - const: rxdma2host-monitor-status-ring-mac1
> -      - const: host2rxdma-host-buf-ring-mac3
> -      - const: host2rxdma-host-buf-ring-mac2
> -      - const: host2rxdma-host-buf-ring-mac1
> -      - const: rxdma2host-destination-ring-mac3
> -      - const: rxdma2host-destination-ring-mac2
> -      - const: rxdma2host-destination-ring-mac1
> -      - const: host2tcl-input-ring4
> -      - const: host2tcl-input-ring3
> -      - const: host2tcl-input-ring2
> -      - const: host2tcl-input-ring1
> -      - const: wbm2host-tx-completions-ring3
> -      - const: wbm2host-tx-completions-ring2
> -      - const: wbm2host-tx-completions-ring1
> -      - const: tcl2host-status-ring
> +    minItems: 32
> +    maxItems: 52

But you didn't define any names for the new chip.

>  
>    qcom,rproc:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -156,15 +57,201 @@ properties:
>        phandle to a node describing reserved memory (System RAM memory)
>        used by ath11k firmware (see bindings/reserved-memory/reserved-memory.txt)
>  
> +  iommus:
> +    maxItems: 1
> +
> +  wifi-firmware:
> +    type: object
> +    description: |
> +      WCN6750 wifi node can contain one optional firmware subnode.
> +      Firmware subnode is needed when the platform does not have TustZone.

Trustzone

> +    properties:
> +      iommus:
> +        maxItems: 1

If this is the only property, then just make parent 'iommus' 1 or 2 
entries.

> +    required:
> +      - iommus
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> -  - interrupt-names
>    - qcom,rproc
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq8074-wifi
> +              - qcom,ipq6018-wifi
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: misc-pulse1 interrupt events
> +            - description: misc-latch interrupt events
> +            - description: sw exception interrupt events
> +            - description: watchdog interrupt events
> +            - description: interrupt event for ring CE0
> +            - description: interrupt event for ring CE1
> +            - description: interrupt event for ring CE2
> +            - description: interrupt event for ring CE3
> +            - description: interrupt event for ring CE4
> +            - description: interrupt event for ring CE5
> +            - description: interrupt event for ring CE6
> +            - description: interrupt event for ring CE7
> +            - description: interrupt event for ring CE8
> +            - description: interrupt event for ring CE9
> +            - description: interrupt event for ring CE10
> +            - description: interrupt event for ring CE11
> +            - description: interrupt event for ring host2wbm-desc-feed
> +            - description: interrupt event for ring host2reo-re-injection
> +            - description: interrupt event for ring host2reo-command
> +            - description: interrupt event for ring host2rxdma-monitor-ring3
> +            - description: interrupt event for ring host2rxdma-monitor-ring2
> +            - description: interrupt event for ring host2rxdma-monitor-ring1
> +            - description: interrupt event for ring reo2ost-exception
> +            - description: interrupt event for ring wbm2host-rx-release
> +            - description: interrupt event for ring reo2host-status
> +            - description: interrupt event for ring reo2host-destination-ring4
> +            - description: interrupt event for ring reo2host-destination-ring3
> +            - description: interrupt event for ring reo2host-destination-ring2
> +            - description: interrupt event for ring reo2host-destination-ring1
> +            - description: interrupt event for ring rxdma2host-monitor-destination-mac3
> +            - description: interrupt event for ring rxdma2host-monitor-destination-mac2
> +            - description: interrupt event for ring rxdma2host-monitor-destination-mac1
> +            - description: interrupt event for ring ppdu-end-interrupts-mac3
> +            - description: interrupt event for ring ppdu-end-interrupts-mac2
> +            - description: interrupt event for ring ppdu-end-interrupts-mac1
> +            - description: interrupt event for ring rxdma2host-monitor-status-ring-mac3
> +            - description: interrupt event for ring rxdma2host-monitor-status-ring-mac2
> +            - description: interrupt event for ring rxdma2host-monitor-status-ring-mac1
> +            - description: interrupt event for ring host2rxdma-host-buf-ring-mac3
> +            - description: interrupt event for ring host2rxdma-host-buf-ring-mac2
> +            - description: interrupt event for ring host2rxdma-host-buf-ring-mac1
> +            - description: interrupt event for ring rxdma2host-destination-ring-mac3
> +            - description: interrupt event for ring rxdma2host-destination-ring-mac2
> +            - description: interrupt event for ring rxdma2host-destination-ring-mac1
> +            - description: interrupt event for ring host2tcl-input-ring4
> +            - description: interrupt event for ring host2tcl-input-ring3
> +            - description: interrupt event for ring host2tcl-input-ring2
> +            - description: interrupt event for ring host2tcl-input-ring1
> +            - description: interrupt event for ring wbm2host-tx-completions-ring3
> +            - description: interrupt event for ring wbm2host-tx-completions-ring2
> +            - description: interrupt event for ring wbm2host-tx-completions-ring1
> +            - description: interrupt event for ring tcl2host-status-ring
> +        interrupt-names:
> +          items:
> +            - const: misc-pulse1
> +            - const: misc-latch
> +            - const: sw-exception
> +            - const: watchdog
> +            - const: ce0
> +            - const: ce1
> +            - const: ce2
> +            - const: ce3
> +            - const: ce4
> +            - const: ce5
> +            - const: ce6
> +            - const: ce7
> +            - const: ce8
> +            - const: ce9
> +            - const: ce10
> +            - const: ce11
> +            - const: host2wbm-desc-feed
> +            - const: host2reo-re-injection
> +            - const: host2reo-command
> +            - const: host2rxdma-monitor-ring3
> +            - const: host2rxdma-monitor-ring2
> +            - const: host2rxdma-monitor-ring1
> +            - const: reo2ost-exception
> +            - const: wbm2host-rx-release
> +            - const: reo2host-status
> +            - const: reo2host-destination-ring4
> +            - const: reo2host-destination-ring3
> +            - const: reo2host-destination-ring2
> +            - const: reo2host-destination-ring1
> +            - const: rxdma2host-monitor-destination-mac3
> +            - const: rxdma2host-monitor-destination-mac2
> +            - const: rxdma2host-monitor-destination-mac1
> +            - const: ppdu-end-interrupts-mac3
> +            - const: ppdu-end-interrupts-mac2
> +            - const: ppdu-end-interrupts-mac1
> +            - const: rxdma2host-monitor-status-ring-mac3
> +            - const: rxdma2host-monitor-status-ring-mac2
> +            - const: rxdma2host-monitor-status-ring-mac1
> +            - const: host2rxdma-host-buf-ring-mac3
> +            - const: host2rxdma-host-buf-ring-mac2
> +            - const: host2rxdma-host-buf-ring-mac1
> +            - const: rxdma2host-destination-ring-mac3
> +            - const: rxdma2host-destination-ring-mac2
> +            - const: rxdma2host-destination-ring-mac1
> +            - const: host2tcl-input-ring4
> +            - const: host2tcl-input-ring3
> +            - const: host2tcl-input-ring2
> +            - const: host2tcl-input-ring1
> +            - const: wbm2host-tx-completions-ring3
> +            - const: wbm2host-tx-completions-ring2
> +            - const: wbm2host-tx-completions-ring1
> +            - const: tcl2host-status-ring
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq8074-wifi
> +              - qcom,ipq6018-wifi
> +    then:
> +      required:
> +        - interrupt-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,wcn6750-wifi
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: interrupt event for ring CE1
> +            - description: interrupt event for ring CE2
> +            - description: interrupt event for ring CE3
> +            - description: interrupt event for ring CE4
> +            - description: interrupt event for ring CE5
> +            - description: interrupt event for ring CE6
> +            - description: interrupt event for ring CE7
> +            - description: interrupt event for ring CE8
> +            - description: interrupt event for ring CE9
> +            - description: interrupt event for ring CE10
> +            - description: interrupt event for ring DP1
> +            - description: interrupt event for ring DP2
> +            - description: interrupt event for ring DP3
> +            - description: interrupt event for ring DP4
> +            - description: interrupt event for ring DP5
> +            - description: interrupt event for ring DP6
> +            - description: interrupt event for ring DP7
> +            - description: interrupt event for ring DP8
> +            - description: interrupt event for ring DP9
> +            - description: interrupt event for ring DP10
> +            - description: interrupt event for ring DP11
> +            - description: interrupt event for ring DP12
> +            - description: interrupt event for ring DP13
> +            - description: interrupt event for ring DP14
> +            - description: interrupt event for ring DP15
> +            - description: interrupt event for ring DP16
> +            - description: interrupt event for ring DP17
> +            - description: interrupt event for ring DP18
> +            - description: interrupt event for ring DP19
> +            - description: interrupt event for ring DP20
> +            - description: interrupt event for ring DP21
> +            - description: interrupt event for ring DP22
> +
>  examples:
>    - |
>  
> @@ -309,3 +396,65 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        wlan_ce_mem: wlan_ce_mem@4cd000 {
> +            no-map;
> +            reg = <0x0 0x4cd000 0x0 0x1000>;
> +        };
> +
> +        wlan_fw_mem: wlan_fw_mem@80c00000 {
> +            no-map;
> +            reg = <0x0 0x80c00000 0x0 0xc00000>;
> +        };
> +    };
> +
> +    wifi: wifi@17a10040 {
> +        compatible = "qcom,wcn6750-wifi";
> +        reg = <0x17A10040 0x0>;
> +        reg-names = "msi_addr";
> +        iommus = <&apps_smmu 0x1C00 0x1>;
> +        interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
> +        qcom,rproc = <&remoteproc_wpss>;
> +        memory-region = <&wlan_fw_mem &wlan_ce_mem>;

memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;

> +        wifi-firmware {
> +                iommus = <&apps_smmu 0x1C02 0x1>;
> +        };
> +    };
> -- 
> 2.7.4
> 
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
