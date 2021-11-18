Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1893CC433F5
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 23:11:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB07161994
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 23:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB07161994
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1XDWs9VkNVMzxM1NUfzzjLc1QowdBNSTr+c7pwiyls=; b=YjrU9WJMxEAFQg
	GH8up7gWitpg9tDAiDy0OJRib2Sur4aG9BIWWASAygmRj/9l/nZ0KHbUUDnBhEKFNrNHLMmkL8BE2
	ETiZgfLrN2APtjKEkrVE2jXYKymBLi5nkEk83Sxj6szLI8Ee11e9gWNfVQLrGe6jD79zNeJY1sxGO
	/b6hcF9XuRqB7M6/ZT5bVKKKvviSlOypu0gljJDmWQ0Mvt4XLnjzsscluMKYWM2Z3Y/FALguwarRh
	aZMbxNJNX4vH7JBmfh5pSVg6RfoPBfHGBAUhWoOb2M57zriBNphycvnOxBJpAa2whSjlq/6tp74hj
	Yfl+guq25N4chXAudX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnqZP-00929n-QV; Thu, 18 Nov 2021 23:11:55 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnqZN-009298-S3
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 23:11:55 +0000
Received: by mail-oi1-f169.google.com with SMTP id bj13so17832917oib.4
 for <ath11k@lists.infradead.org>; Thu, 18 Nov 2021 15:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6myScuq3nOr20A1Ksiuor/A5GOiLxa2QAT4GCP9Aq+0=;
 b=xXIEeszxEPwvFTVDXspK0Q7Z2iR8e0RTK7UHRi8B4X4qe19P/peagHPnq+Q1wFC4c8
 4RVynyS7n2zEaJOZY52wyXPo1G1VmlmLNd5OofzGaVG0iMYq0K5F/qsxmV6UQQqNAHQO
 sHlZfSI1tVbXCKSSq1Bi1XCRsXf67G4ZFLp238E6ETBLsBuQ1g8b4V8inZUOSKqouFPd
 3Z7B+oDJDPa9wVVDIx2QlFDomSzbqjFqnNF+5fHVjGVLMaDvYLakQfCZVleiMcJTko+C
 JOW00wJbgXvpKz8LWod5Zni1JaRcuxWC1SGKaa9RN/VrTNb2ocZFom4I+Jh4YIQZ4afo
 OAwQ==
X-Gm-Message-State: AOAM532SH650aFomkLACZFe0OkHNvKDRG3gk9eSB48ojsrfgwNNbuTNC
 1MGk9a7ZqyX7UON0cho3PMjqa8I7Mw==
X-Google-Smtp-Source: ABdhPJwxQ48ocNKAXi7TijyVJEySn66JtgRGmKvzqJt1ZKcDAHTqHqWYMJK5dMvuEoa0aB95rK+6Kw==
X-Received: by 2002:aca:4307:: with SMTP id q7mr686998oia.3.1637277109242;
 Thu, 18 Nov 2021 15:11:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o6sm218385oou.41.2021.11.18.15.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 15:11:48 -0800 (PST)
Received: (nullmailer pid 1944164 invoked by uid 1000);
 Thu, 18 Nov 2021 23:11:47 -0000
Date: Thu, 18 Nov 2021 17:11:47 -0600
From: Rob Herring <robh@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATH v3 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
Message-ID: <YZbds1DgmwbFPQdM@robh.at.kernel.org>
References: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_151153_941408_E74791DD 
X-CRM114-Status: GOOD (  21.40  )
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

On Thu, Nov 18, 2021 at 07:44:51PM +0530, Anilkumar Kolli wrote:
> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> Ath11k firmware uses host DDR memory, DT entry is used to reserve
> these host DDR memory regions, send these memory base
> addresses using DT entries.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
> V2:
>   - Use reserved-memory (Rob)
> 
>  .../bindings/net/wireless/qcom,ath11k.yaml         | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index 85c2f699d602..5a8994f6cb10 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -150,6 +150,12 @@ properties:
>        string to uniquely identify variant of the calibration data in the
>        board-2.bin for designs with colliding bus and device specific ids
>  
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      phandle to a node describing reserved memory (System RAM memory)
> +      used by ath11k firmware (see bindings/reserved-memory/reserved-memory.txt)
> +
>  required:
>    - compatible
>    - reg
> @@ -279,3 +285,45 @@ examples:
>                            "tcl2host-status-ring";
>          qcom,rproc = <&q6v5_wcss>;
>      };
> +

This looks like a separate example. Please split to its own entry.

> +    memory {
> +        device_type = "memory";
> +        reg = <0x0 0x40000000 0x0 0x20000000>;
> +    };

Outside the scope of what's needed in the example.

> +
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        qcn9074_pcie0: qcn9074_pcie0@51100000 {
> +            no-map;
> +            reg = <0x0 0x51100000 0x0 0x03500000>;
> +        };
> +
> +        qcn9074_pcie1: qcn9074_pcie1@54600000 {
> +            no-map;
> +            reg = <0x0 0x54600000 0x0 0x03500000>;
> +        };
> +    };

As is this really.

> +
> +    pcie0_rp: pcie0_rp {
> +        reg = <0 0 0 0 0>;

This isn't a valid PCI bus binding.

> +
> +        status = "ok";

Don't need status.

> +        ath11k_0: ath11k@0 {

wifi@0

> +            reg = <0 0 0 0 0 >;
> +            memory-region = <&qcn9074_pcie0>;
> +        };
> +    };
> +
> +    pcie1_rp: pcie1_rp {
> +        reg = <0 0 0 0 0>;
> +
> +        status = "ok";
> +        ath11k_1: ath11k@1 {
> +            reg = <0 0 0 0 0 >;

unit-address and reg don't match.

Why do we need 2 nodes in the first place?

> +            memory-region = <&qcn9074_pcie1>;
> +        };
> +    };
> +
> -- 
> 2.7.4
> 
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
