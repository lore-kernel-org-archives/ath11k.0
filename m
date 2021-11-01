Return-Path: <SRS0=iaLC=PU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7678C433EF
	for <ath11k@archiver.kernel.org>; Mon,  1 Nov 2021 20:35:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9314361051
	for <ath11k@archiver.kernel.org>; Mon,  1 Nov 2021 20:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9314361051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8P6qqz0gBPkJ3+BEsUDhG1i2pfwacZm9Tr3K0rmevao=; b=ZiSHnE7W7Xmogx
	/GzMTcG54BJl3MLEyJr/UtXYDvhmOpaDVauxv9hpNpv2UASAoQCH5G4BUW8vA0f1U5lriduzovf1N
	ix/YELmVCgCTgYlKukNTCcyfYEnJzyxW8zIo7DVEa3jaQ6xIdFiOFB+p5S0gNKiWbe7VFov4LfXXj
	kPljMBiUXRnLv6ZF38xX/PoTCq0o1jNApftuJxCea56nvzQ+ZNNEpSJvu9kYq8pEHdKKmHJk3oxsQ
	0u589CkjrwvggxRPVXX8i55GaxX8X9KhMxtRgts1bpXXBXGptHQ43EFLrNuS8MkT6WYCtsSED691k
	w4AcnTA6Iyff8kGa3PLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhe1N-00HHSp-25; Mon, 01 Nov 2021 20:35:09 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhe1K-00HHSW-58
 for ath11k@lists.infradead.org; Mon, 01 Nov 2021 20:35:07 +0000
Received: by mail-oi1-f171.google.com with SMTP id u2so7539975oiu.12
 for <ath11k@lists.infradead.org>; Mon, 01 Nov 2021 13:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7jMCRGui2/Gum4mb5UjGuBVKQlP/7omX+39AlRJjhUM=;
 b=Mh3bIT5ktpM7rM+bEe7yQ7uVzGD/p+q2aHcyw8C2dk1wLKlTzikDs1hA5w1dFWWJ+R
 S94Qft7r0NeqjkVlQIq4LnK2dqNYbbUrjn3uGIskwGfeY4PFWOh6w5uZisT6UWburW+n
 pS4ba8G4Kntn8yUDRcPCsaqyc2SImgwdbB7jogZw+UDwiKgEy6DCGUgc9YvBZ+OVDlqU
 gMinxf9hzw3VBc075pwfQ3OTf5r2IZ+prDdmQVc9wlp25+CPgQCs+DtUEboEyf05jHGv
 ENSxJ9DmibmLQQxSAtjmH1NyUfL14lG75ofxrRdHWdyi69IU2OcCrHL3cjReoBj75vl6
 JA4A==
X-Gm-Message-State: AOAM533mSvhsTWlROhtIRoEQ57LFo5P3LXC0kA13TuUr6El0DPh6/WLe
 h3ApXCRXvNaO6gHQoYhH9eneyOy2ig==
X-Google-Smtp-Source: ABdhPJyzobvdnowFNE2K2Dz5NpV+H/uhhJTM9QM+KIyZSoj/dye1t89/4YPEZgz3psioLjsPPZJeHg==
X-Received: by 2002:aca:502:: with SMTP id 2mr1142915oif.121.1635798905160;
 Mon, 01 Nov 2021 13:35:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ay6sm1242483oob.17.2021.11.01.13.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 13:35:04 -0700 (PDT)
Received: (nullmailer pid 1000398 invoked by uid 1000);
 Mon, 01 Nov 2021 20:35:03 -0000
Date: Mon, 1 Nov 2021 15:35:03 -0500
From: Rob Herring <robh@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
Message-ID: <YYBPd+Z/dA/pTReo@robh.at.kernel.org>
References: <1635175648-23491-1-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1635175648-23491-1-git-send-email-akolli@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_133506_245208_B2E78BBC 
X-CRM114-Status: GOOD (  19.06  )
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

On Mon, Oct 25, 2021 at 08:57:27PM +0530, Anilkumar Kolli wrote:
> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> Ath11k firmware uses host DDR memory, DT entry is used to reserve
> these host DDR memory regions, send these memory base
> addresses using DT entries.
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
>  .../bindings/net/wireless/qcom,ath11k.yaml         | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index 5ac9616c9239..c7e6612e949c 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -19,6 +19,10 @@ description: |
>    These devices use HOST DDR memory, HOST DDR memory can be reserved
>    and send to ath11k driver from DT.
>  
> +  ATH11K supports PCI devices like QCA6390,QCN9074.
> +  These devices use host DDR memory, host DDR memory can be reserved
> +  and send to ath11k driver from DT.
> +
>  properties:
>    compatible:
>      enum:
> @@ -177,6 +181,29 @@ properties:
>      description:
>        HOST DDR end address.
>  
> +  qcom,base-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Host DDR base address for firmware. QCN9074 firmware uses 45 MB of host
> +      DDR memory in mode-0 and 15 MB of host DDR memory in mode-2.
> +
> +  qcom,caldb-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Host DDR address to store CALDB. CALDB is calibration data base
> +      for WLAN channel and tx power.
> +

Use /reserved-memory entries for these.

> +  qcom,start-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Host DDR start address. For example on x86 it is 0x0,
> +      on IPQ8074 it is 0x41000000.
> +
> +  qcom,end-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Host DDR end address.

Nak. I don't know what you are doing with these 2, but it's wrong.

Rob

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
