Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85371C433FE
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 02:27:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DBC61BFB
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 02:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39DBC61BFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z32jWUBN5HASFMVsO4mUt/WURSJwWVt9y2lkxfQLAVM=; b=g+2EoQS0mbY8R8
	tJWu1fxeznC/aVNNlf1dzPOgKCgNw0rQbBE/kyar6WqdmMi0DehtN4I9zcPlH/RquAiyutm+79qfy
	Y8FJLsNTJlHh+Dky2fkhwgdf93bV8w6BQXRnXOd2nXVbNFL8AG41ioD3YmRFNarceqSMJT+f6Jd0P
	jE0AJLHDa4tWXO22ducpaxPKBH51obPMA8s+Tb2T9+Lv/ukCdcWf1gRayX1zWum0lQzUlur0cs84v
	C9d+HqQSzelNihGD2OZuyyWIVdXu/XNeyPOCkvUeNzSmuS/q4m6xEND8+Ra42dgCXdHduDZxPmYud
	Dcsdz5ordf0MDPLDLozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnAfN-0039Mw-57; Wed, 17 Nov 2021 02:27:17 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnAfK-0039MS-7F
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 02:27:15 +0000
Received: by mail-oi1-f178.google.com with SMTP id m6so2980645oim.2
 for <ath11k@lists.infradead.org>; Tue, 16 Nov 2021 18:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Gi1zkQUusKr2oOET/+vmdyiUMkS7tjWRTDsmrGSi95U=;
 b=DB+ZdTulDOHQg7RRZ/7WjVHsj7Almn/gEjo18fuM2lDA70pjMdRUytEsPWKDqT9SMj
 QpgvIoGp5KTKOO18TnAFI0L2yv9g94MWw4zckFAzWf5IjAxasIutFysMcxV+jyxACe6W
 uGu+3AAKaZuhXnclL6oSGAF4rYx2dN6i/kAdpOrUGjNJ4PWEeel7Tk4oZO5YsJE23dzV
 VTFLJy/wlCExiSDBQo06MouQ7nOfFRnDWjk4arZ7uzKFa3v7ejLVy90soMPAj6Mb0Jxt
 WOhTejiP2U+A/sJ98Sq4Q6sM3R2hOubQCmTHWV21wPvHbAXoSjEjVig2ZDxwTmx4TcEP
 NCrA==
X-Gm-Message-State: AOAM531g//mWgCThb381sBSar43wCvq8tqWnlLTqPxKzcUX4I7a9O9HO
 irL1OXtr6ixA2esIxnrCsQ==
X-Google-Smtp-Source: ABdhPJxRWYhsA6sYXwAKKgt94oXi44oGPgwsIh7XEiwG0npDL4m9qIjfjiPVBZop174yqTn2JS8TzQ==
X-Received: by 2002:aca:3b89:: with SMTP id
 i131mr10965582oia.102.1637116033279; 
 Tue, 16 Nov 2021 18:27:13 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o6sm1669635oou.41.2021.11.16.18.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 18:27:12 -0800 (PST)
Received: (nullmailer pid 1207284 invoked by uid 1000);
 Wed, 17 Nov 2021 02:27:10 -0000
From: Rob Herring <robh@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <1637082058-6398-1-git-send-email-akolli@codeaurora.org>
References: <1637082058-6398-1-git-send-email-akolli@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
Date: Tue, 16 Nov 2021 20:27:10 -0600
Message-Id: <1637116030.353961.1207283.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_182714_285670_403F4B54 
X-CRM114-Status: GOOD (  11.31  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, 16 Nov 2021 22:30:57 +0530, Anilkumar Kolli wrote:
> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
> Ath11k firmware uses host DDR memory. DT entry is used to reserve
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:160.13-31: Warning (reg_format): /example-0/pcie0_rp:reg: property has invalid length (20 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:164.17-36: Warning (reg_format): /example-0/pcie0_rp/ath11k@0:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:170.13-31: Warning (reg_format): /example-0/pcie1_rp:reg: property has invalid length (20 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:174.17-36: Warning (reg_format): /example-0/pcie1_rp/ath11k@1:reg: property has invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:138.16-141.11: Warning (unit_address_vs_reg): /example-0/memory: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:159.28-167.11: Warning (unit_address_vs_reg): /example-0/pcie0_rp: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:169.28-177.11: Warning (unit_address_vs_reg): /example-0/pcie1_rp: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:163.32-166.15: Warning (avoid_default_addr_size): /example-0/pcie0_rp/ath11k@0: Relying on default #address-cells value
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:163.32-166.15: Warning (avoid_default_addr_size): /example-0/pcie0_rp/ath11k@0: Relying on default #size-cells value
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:173.32-176.15: Warning (avoid_default_addr_size): /example-0/pcie1_rp/ath11k@1: Relying on default #address-cells value
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:173.32-176.15: Warning (avoid_default_addr_size): /example-0/pcie1_rp/ath11k@1: Relying on default #size-cells value
Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml: reserved-memory: qcn9074_pcie0@51100000:reg:0: [0, 1360003072, 0, 55574528] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml: reserved-memory: qcn9074_pcie1@54600000:reg:0: [0, 1415577600, 0, 55574528] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1555958

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
