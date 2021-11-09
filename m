Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6539C433F5
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 05:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5667261179
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 05:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5667261179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNSrdKBKANEqt9BcZcbpUFIB5+QIZWXSH41zL0K6NW0=; b=yO+JbyAK31GMAbdqPAgBwD1KHy
	1XkLBmQKOjrID30EOM1drdlRjSVsankmznk4z5GBNF4qNKU8/GfNkE8Wq5j6Dx/Zx3nnuGdfEB28C
	UHGk67Tv9kMzbf5j31XfAb5B0OYwAPq3j6NdD5YsRtZecxYlUb+ImLYxxXWtMFJSLCNzHW1lWMdMw
	O5Dz93pcHdunpIVBA6nBxLy6iAAc1T0bktPx0qsd6XlEYPk/juvNKDVX9fJPUWfO1L0Lsb9LiEqjp
	Eb7ZewiRiv0BgvlYrar3TaTSukloV3IIY+TSXy+hQwXBDjXkvxwNadqLtA2ivj3JXXJ3VFm4Abf6y
	HBR6/7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkJIh-000hFz-IR; Tue, 09 Nov 2021 05:04:03 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkJIe-000hFc-Ql
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 05:04:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636434240; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EktT4GpDSMg7u7QNcUdJTd4WqshYz7T+uzhoJXta5LM=;
 b=XqgrqsY6WLitACtVJlaTKFzKMuRelswTCndA3pEFRqepHK/O4/tCezLeHBxkbHgGPoW/j9oN
 MKc4fYuLSDtGI7VkjXvO0iew4djRCTzlDLCAN2L4nKBlK0ubViCfxhMt9JflSwgXGrVrxJeC
 MuPqdyz9w35kCUo2480m5kI3fUg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 618a013f6b778b5a19ff7daf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Nov 2021 05:03:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 584C5C4360C; Tue,  9 Nov 2021 05:03:59 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A80D4C4338F;
 Tue,  9 Nov 2021 05:03:58 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 10:33:58 +0530
From: Anilkumar Kolli <akolli@codeaurora.org>
To: Rob Herring <robh@kernel.org>, manivannan.sadhasivam@linaro.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, mhi@lists.linux.dev
Subject: Re: [PATCH 1/2] dt: bindings: add new DT entry for ath11k PCI device
 support
In-Reply-To: <YYBPd+Z/dA/pTReo@robh.at.kernel.org>
References: <1635175648-23491-1-git-send-email-akolli@codeaurora.org>
 <YYBPd+Z/dA/pTReo@robh.at.kernel.org>
Message-ID: <b142a4850d9cbc3bb451a78b488688cc@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_210400_959055_212302C0 
X-CRM114-Status: GOOD (  16.22  )
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

On 2021-11-02 02:05, Rob Herring wrote:
> On Mon, Oct 25, 2021 at 08:57:27PM +0530, Anilkumar Kolli wrote:
>> Ath11k driver supports PCI devices such as QCN9074/QCA6390.
>> Ath11k firmware uses host DDR memory, DT entry is used to reserve
>> these host DDR memory regions, send these memory base
>> addresses using DT entries.
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath11k.yaml         | 38 
>> ++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml 
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> index 5ac9616c9239..c7e6612e949c 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> @@ -19,6 +19,10 @@ description: |
>>    These devices use HOST DDR memory, HOST DDR memory can be reserved
>>    and send to ath11k driver from DT.
>> 
>> +  ATH11K supports PCI devices like QCA6390,QCN9074.
>> +  These devices use host DDR memory, host DDR memory can be reserved
>> +  and send to ath11k driver from DT.
>> +
>>  properties:
>>    compatible:
>>      enum:
>> @@ -177,6 +181,29 @@ properties:
>>      description:
>>        HOST DDR end address.
>> 
>> +  qcom,base-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Host DDR base address for firmware. QCN9074 firmware uses 45 MB 
>> of host
>> +      DDR memory in mode-0 and 15 MB of host DDR memory in mode-2.
>> +
>> +  qcom,caldb-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Host DDR address to store CALDB. CALDB is calibration data base
>> +      for WLAN channel and tx power.
>> +
> 
> Use /reserved-memory entries for these.
> 

Sure.

>> +  qcom,start-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Host DDR start address. For example on x86 it is 0x0,
>> +      on IPQ8074 it is 0x41000000.
>> +
>> +  qcom,end-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Host DDR end address.
> 
> Nak. I don't know what you are doing with these 2, but it's wrong.
> 

The DDR start address and end address are sent to MHI control bus,
For x86 platform code snip in ath11k/mhi.c

         mhi_ctrl->iova_start = 0;
         mhi_ctrl->iova_stop = 0xffffffff;

Similarly for ARM platfroms, send DDR addresses from DT entry.

Thanks
Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
