Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A44C433F5
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 22:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5071261504
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 22:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5071261504
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vS+FcMbwa6LKFpF5X5AJch6kuyjHQYfwp9Yzrs7LziI=; b=0BeXkeHYJOYL68
	yeyviB0+XnG6lDYWLP5bwopRC3uQUCGFKPJTf4DW2EEmoVAQSC5lPqgFzp/M6z7RAVre4OCutUP+n
	hLz2FzCZTl5Ky4R0geZHICfdvnzteTPJVuUvLo/dAOg2FLixJ1z53xY5J+05pM4G9seyp2XRc7+QN
	y5m6YABwRUgqzhDdAGwFk+HdnmsQWf/CV8dh2NUkPSPouiF/swZn8PJW7CZf+Hie2FPAQLXdA52Ie
	k4nBhZIIBNAuwE/eewit12DyqQrS/Nq8pGmsB4DDX3yy2RbCHIaKBWLiTFE7fyrNLKI0AEVF+VqUR
	5V0Izm/4twIgBo0RUobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnpbg-008wxQ-CK; Thu, 18 Nov 2021 22:10:12 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnpbS-008wtZ-FY
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 22:10:01 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso13430967otj.11
 for <ath11k@lists.infradead.org>; Thu, 18 Nov 2021 14:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=wyaKU21KsPhRsL8O46dW6nI8PJL6dJM95EyvFAPc4RU=;
 b=c56ik/FFGwzASrnoa3FVIeAkulc57f5RMyST6hodsz0EguLBngW9VZAuVJY46q3uMr
 mXRcgUH1gZt89U0NDhSZ4WuYnZXnqVrKoP0R79Bdf+vlez8xH8vb9LEk61GHhFR2R8oH
 Yw14kLdhlqFev4FwnpbC7BVQZNv2wbS6fyzwGjx5krYGd9ddjlRxfKmW2HLJl2w+/zvD
 kEYH1I7Z6B1rORLa7DO8r061zRaSb5pYbcFuOB3hYKdbojDKFbkN5b4hGgInZFHNzGx+
 mJX1KagWIkA+iv9GXgHKpiGSezTT+J3IxfSzJEx+JLJBu/7RMgoUeu+iiTzmxHv+FxAp
 TooA==
X-Gm-Message-State: AOAM532cmIe+EIZ8hBudytdUeLQ/jz2yK0S7zb/RhW5wp8LJdDNSB1vc
 meI2wd3uAVXSyDU8GYb7cUdHl4rcGQ==
X-Google-Smtp-Source: ABdhPJzhb/Rj2EsCodTBxBTM+tZP3sxLb26m+PQkfobY+xof43b9OGeWF22/ZARCzu17SIqhtH8YZQ==
X-Received: by 2002:a9d:4f0e:: with SMTP id d14mr490282otl.137.1637273397095; 
 Thu, 18 Nov 2021 14:09:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x28sm220382ote.24.2021.11.18.14.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 14:09:56 -0800 (PST)
Received: (nullmailer pid 1841666 invoked by uid 1000);
 Thu, 18 Nov 2021 22:09:54 -0000
From: Rob Herring <robh@kernel.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
References: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
Subject: Re: [PATH v3 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
Date: Thu, 18 Nov 2021 16:09:54 -0600
Message-Id: <1637273394.267065.1841665.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_140958_553467_C16F4220 
X-CRM114-Status: GOOD (  10.66  )
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

On Thu, 18 Nov 2021 19:44:51 +0530, Anilkumar Kolli wrote:
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

See https://patchwork.ozlabs.org/patch/1556692

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
