Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EA6C433F5
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 08:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC36461A8A
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 08:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC36461A8A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMrGqy1v6wOX3wZRtRIWMoXVHa72ZP/k4KF/wDpBYnc=; b=HgImawJj8CMTAP7LpiMSt8jO1J
	V99cllev3tug+FNqgukWMtNQBQSMffgda/lWfmY87zBeTHvKM8OzBJHyZkvfTJCrsfO2LchUr8AUR
	e47ku9YbFfu17Ri4Xbq6+Bcoc5FnA8e+7F7bSLTLSkVz7TMysmql4FRnyQ7Oqu2H/nKQJ7gGeyV8M
	ApJDp74ooesDB7N/uM90C+RQauFYesC6Rcw5eSVIoRvOVDbTsZnFX5TW62nEa4/8yG1J8FaF6WLYK
	Q76MncnwM3BLWeHuXePn+ZVQAlqNSW8tO+cg1OST76fARhgX8OmrmUukf+Y7CIQ27lcy/3s1mMFUq
	aTCpB6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnz93-009k4I-Gc; Fri, 19 Nov 2021 08:21:17 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnz90-009k3T-7c
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 08:21:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637310074; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qPRQ8GT1EoqJcWnMwOwKF9zdY1ZKDhNu/XlFvKEQsVU=;
 b=bVszgf6zjEERem4mL6kCgJI7LSkt3ExnIw8ZkV39X64G8GMmqABIZG8wQ9JgzqZfWEM2BheA
 r8hwGplMJebejlvYLE6hvW3s4kz4LwbQyfo6jBlTODBlwarDAzFV2i8wLmhMrOYNrq2zI1aO
 9OdaJgIcjMt+Vp8g+XMnGDApDQ0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61975e791e1d2f5233a2aa7e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 08:21:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2186CC4360D; Fri, 19 Nov 2021 08:21:13 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5DEADC4338F;
 Fri, 19 Nov 2021 08:21:12 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 19 Nov 2021 13:51:12 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATH v3 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
In-Reply-To: <1637273394.267065.1841665.nullmailer@robh.at.kernel.org>
References: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
 <1637273394.267065.1841665.nullmailer@robh.at.kernel.org>
Message-ID: <c53e9299093a315f997c17048872aeff@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_002114_391619_4F17B69A 
X-CRM114-Status: GOOD (  16.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-11-19 03:39, Rob Herring wrote:
> On Thu, 18 Nov 2021 19:44:51 +0530, Anilkumar Kolli wrote:
>> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
>> Ath11k firmware uses host DDR memory, DT entry is used to reserve
>> these host DDR memory regions, send these memory base
>> addresses using DT entries.
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> ---
>> V2:
>>   - Use reserved-memory (Rob)
>> 
>>  .../bindings/net/wireless/qcom,ath11k.yaml         | 48 
>> ++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>> 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:160.13-31:
> Warning (reg_format): /example-0/pcie0_rp:reg: property has invalid
> length (20 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:164.17-36:
> Warning (reg_format): /example-0/pcie0_rp/ath11k@0:reg: property has
> invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:170.13-31:
> Warning (reg_format): /example-0/pcie1_rp:reg: property has invalid
> length (20 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:174.17-36:
> Warning (reg_format): /example-0/pcie1_rp/ath11k@1:reg: property has
> invalid length (20 bytes) (#address-cells == 2, #size-cells == 1)
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:138.16-141.11:
> Warning (unit_address_vs_reg): /example-0/memory: node has a reg or
> ranges property, but no unit name
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:159.28-167.11:
> Warning (unit_address_vs_reg): /example-0/pcie0_rp: node has a reg or
> ranges property, but no unit name
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:169.28-177.11:
> Warning (unit_address_vs_reg): /example-0/pcie1_rp: node has a reg or
> ranges property, but no unit name
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:
> Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:
> Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:
> Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:
> Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:
> Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:163.32-166.15:
> Warning (avoid_default_addr_size): /example-0/pcie0_rp/ath11k@0:
> Relying on default #address-cells value
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:163.32-166.15:
> Warning (avoid_default_addr_size): /example-0/pcie0_rp/ath11k@0:
> Relying on default #size-cells value
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:173.32-176.15:
> Warning (avoid_default_addr_size): /example-0/pcie1_rp/ath11k@1:
> Relying on default #address-cells value
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dts:173.32-176.15:
> Warning (avoid_default_addr_size): /example-0/pcie1_rp/ath11k@1:
> Relying on default #size-cells value
> Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:
> Warning (unique_unit_address): Failed prerequisite
> 'avoid_default_addr_size'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:
> reserved-memory: qcn9074_pcie0@51100000:reg:0: [0, 1360003072, 0,
> 55574528] is too long
> 	From schema: 
> /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.example.dt.yaml:
> reserved-memory: qcn9074_pcie1@54600000:reg:0: [0, 1415577600, 0,
> 55574528] is too long
> 	From schema: 
> /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1556692
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

Sure, I will post v2 with fixes.

- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
