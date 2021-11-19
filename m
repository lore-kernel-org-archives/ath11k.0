Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F46C433F5
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 08:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E03A61AED
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 08:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E03A61AED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y1U5hmc7lVRps4YfJvbPIzy7HnhaxYkYAq8Q4vBkV8=; b=cdKw2rsX3LI8mBHBOc/d7flv6m
	FKg2jnumK62y0xDze5YSgepUM6pugoaXuVVX5O2AhvWI/pWzKf+IIOt4E6cN8lkvr3Z8uFX6cKp3D
	CEriNHb727qxsNoz/t3SAVMXyp/kWnfcLI/fmiN74vOcXdK7M1NM44JrCYCPWLt0V33Iy7yqx4aCR
	Ztjg2EAREXnGewoSPr+666crGq/9ddi6AfCxeoHxZ14al4vposeXyFuYGpPARF6kQY6B0oMMhaKAF
	ZbSZ+Y3HfNiG2ynGCW57a1e7FMsjO6dyKvMSQ7O997W4j+TI4ffGfuRPSX7g+RNwiMDDklDO4n0uc
	KTStloSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnzSf-009ng2-D9; Fri, 19 Nov 2021 08:41:33 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnzSb-009nes-3x
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 08:41:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637311289; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TJDfJQzNs0P8ZTjwfGv8Cr99h3avRBPf0A8lWovZM4o=;
 b=alJM0ubNU0vBljOJ2agCs6p4CHQaq7lhj3YnevJ2AMIanuetv7ZA9yzh6iSpVpVu+ueAkzdK
 q2AvCUzpeLgjd8lWgQSa5o+6SeEOkhNwukMgFzeixwSpJcySWso9HGthhEMPfKs2jA6jFUfn
 PsqU7hdx5jCD4lCAAsQMSKB7iqg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61976338665450d43aefcea5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 08:41:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 49BE8C4360D; Fri, 19 Nov 2021 08:41:27 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D2BEAC4338F;
 Fri, 19 Nov 2021 08:41:26 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 19 Nov 2021 14:11:26 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATH v3 1/2] dt: bindings: add new DT entry for ath11k PCI
 device support
In-Reply-To: <YZbds1DgmwbFPQdM@robh.at.kernel.org>
References: <1637244892-27267-1-git-send-email-akolli@codeaurora.org>
 <YZbds1DgmwbFPQdM@robh.at.kernel.org>
Message-ID: <f71ed4a924adcc026c6b0f29809f3b7d@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_004129_249482_6CF5EA2C 
X-CRM114-Status: GOOD (  22.22  )
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

On 2021-11-19 04:41, Rob Herring wrote:
> On Thu, Nov 18, 2021 at 07:44:51PM +0530, Anilkumar Kolli wrote:
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
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> index 85c2f699d602..5a8994f6cb10 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> @@ -150,6 +150,12 @@ properties:
>>        string to uniquely identify variant of the calibration data in 
>> the
>>        board-2.bin for designs with colliding bus and device specific 
>> ids
>> 
>> +  memory-region:
>> +    maxItems: 1
>> +    description:
>> +      phandle to a node describing reserved memory (System RAM 
>> memory)
>> +      used by ath11k firmware (see 
>> bindings/reserved-memory/reserved-memory.txt)
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -279,3 +285,45 @@ examples:
>>                            "tcl2host-status-ring";
>>          qcom,rproc = <&q6v5_wcss>;
>>      };
>> +
> 
> This looks like a separate example. Please split to its own entry.
> 
>> +    memory {
>> +        device_type = "memory";
>> +        reg = <0x0 0x40000000 0x0 0x20000000>;
>> +    };
> 
> Outside the scope of what's needed in the example.
> 
Yes, memory entry is available in 
"arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi"
Since its used in ath11k patch, added example.
I will remove in next version.

>> +
>> +    reserved-memory {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        qcn9074_pcie0: qcn9074_pcie0@51100000 {
>> +            no-map;
>> +            reg = <0x0 0x51100000 0x0 0x03500000>;
>> +        };
>> +
>> +        qcn9074_pcie1: qcn9074_pcie1@54600000 {
>> +            no-map;
>> +            reg = <0x0 0x54600000 0x0 0x03500000>;
>> +        };
>> +    };
> 
> As is this really.
> 
ipq8074-hk10.dtsi board supports two PCI bus and QCN9074 on each PCI.
So added two separate entries to reserves memory for each QCN9074.

>> +
>> +    pcie0_rp: pcie0_rp {
>> +        reg = <0 0 0 0 0>;
> 
> This isn't a valid PCI bus binding.
> 
Got it, let me rework in next patch.

>> +
>> +        status = "ok";
> 
> Don't need status.

Sure, will remove in next patch.

> 
>> +        ath11k_0: ath11k@0 {
> 
> wifi@0
> 
>> +            reg = <0 0 0 0 0 >;
>> +            memory-region = <&qcn9074_pcie0>;
>> +        };
>> +    };
>> +
>> +    pcie1_rp: pcie1_rp {
>> +        reg = <0 0 0 0 0>;
>> +
>> +        status = "ok";
>> +        ath11k_1: ath11k@1 {
>> +            reg = <0 0 0 0 0 >;
> 
> unit-address and reg don't match.
> 
will update in next patch.

> Why do we need 2 nodes in the first place?
> 
ipq8074-hk10.dtsi board supports two PCI bus and QCN9074 on each PCI.
So added two separate entries to reserves memory for each QCN9074.

Since its example, Shall I remove one ?

>> +            memory-region = <&qcn9074_pcie1>;
>> +        };
>> +    };
>> +
>> --
>> 2.7.4
>> 

- Anil.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
