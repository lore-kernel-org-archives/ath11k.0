Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1A7C433EF
	for <ath11k@archiver.kernel.org>; Tue,  5 Apr 2022 06:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76uXYpuMcVq9kgx0LYR0HXT3k9c03MqkzSqSOpxEXj8=; b=EUd2SG0fzcOlwB
	247m+sUyXb9dqCYtCRytNO4BfeTDnJzrowUZ2EjJd/atwB0vA3QfMvksLWGdzTdGvuZauOnr5UgGp
	BgMtVorABgnXhuFoqaNWLm+0A71zQZ8DOfv7qMSLtYtcdcYXJBnnZ72udpgaFmpaPK4OJUXpuk8I/
	5OWuv8vyimzx3Y0vl3QPW7xXPM1Wj4huda6TdY5BHGutxGSnb3J0mf7QSopTGIUX6+wB0Dzp065q2
	Ut9V0Y9U1DE2Gu7PwLoEEkpgS1u4esZ8l11h1dqa2EMOylfcJnb1tNtUtROc2xz7WsZCYP4ZzY7Hm
	9LmfQFIVfL1apQ64mOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbcdV-00HIk8-Px; Tue, 05 Apr 2022 06:25:53 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbcdR-00HIj1-KX
 for ath11k@lists.infradead.org; Tue, 05 Apr 2022 06:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649139949; x=1680675949;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4rpAJc3L1wkLaLffVbJOnhxpE3i3+OQWB38w+iz5T7o=;
 b=Vi3IruDCrMFDifntDTCTqg4CE4SydTWCOZdwMsoneCuC2yOfv5TMuvhc
 j/FYZdDKZtVsM5sO3AV2mfmEcQZafFtqKZbv9tdn/ZOtqzXjBNGNua4Nm
 VFKPU7e3dp7pWqdWk3diaTR+sPiJvDZWnm2JR6wrW25jiTi/Q9lubD54Q 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Apr 2022 23:25:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 23:25:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 4 Apr 2022 23:25:46 -0700
Received: from [10.50.5.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 4 Apr 2022
 23:25:43 -0700
Message-ID: <170e54ac-d3c1-47ca-30ac-6b4e69df31a4@quicinc.com>
Date: Tue, 5 Apr 2022 11:55:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 01/12] dt: bindings: net: add bindings of WCN6750 for
 ath11k
Content-Language: en-US
To: Matthias Kaehlcke <mka@chromium.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <20220328094838.14093-1-quic_mpubbise@quicinc.com>
 <20220328094838.14093-2-quic_mpubbise@quicinc.com>
 <YktC6ksYZIEVNsIF@google.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <YktC6ksYZIEVNsIF@google.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_232549_778448_127FEECA 
X-CRM114-Status: GOOD (  14.07  )
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

On 4/5/2022 12:41 AM, Matthias Kaehlcke wrote:
> On Mon, Mar 28, 2022 at 03:18:27PM +0530, Manikanta Pubbisetty wrote:
>> WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
>> Though being a PCIe based solution, it is not attached to
>> the APSS processor (Application Processor SubSystem), it is
>> instead attached to another tiny processor called WPSS Q6
>> processor (Wireless Processor SubSystem) on the SC7280 MSM,
>> where the WLAN firmware runs, and it is the WLAN firmware
>> running on the Q6 processor which enumerates WCN6750, as a
>> result APPS processor would never know such a device being
>> present in the system and would not detect the WCN6750
>> hardware unless and otherwise WCN6750 is registered as a
>> platform device. This is the reason behind adding WCN6750
>> WLAN node in the device tree.
>>
>> Add WCN6750 wireless driver support, its based on ath11k driver.
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../bindings/net/wireless/qcom,ath11k.yaml    | 361 ++++++++++++------
>>   1 file changed, 252 insertions(+), 109 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> index cdf7b873b419..67104d69fd72 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> @@ -20,120 +20,17 @@ properties:
>>       enum:
>>         - qcom,ipq8074-wifi
>>         - qcom,ipq6018-wifi
>> +      - qcom,wcn6750-wifi
>>   
>>     reg:
>>       maxItems: 1
>>   
>>     interrupts:
>> -    items:
>> -      - description: misc-pulse1 interrupt events
>> -      - description: misc-latch interrupt events
>> -      - description: sw exception interrupt events
>> -      - description: watchdog interrupt events
>> -      - description: interrupt event for ring CE0
>> -      - description: interrupt event for ring CE1
>> -      - description: interrupt event for ring CE2
>> -      - description: interrupt event for ring CE3
>> -      - description: interrupt event for ring CE4
>> -      - description: interrupt event for ring CE5
>> -      - description: interrupt event for ring CE6
>> -      - description: interrupt event for ring CE7
>> -      - description: interrupt event for ring CE8
>> -      - description: interrupt event for ring CE9
>> -      - description: interrupt event for ring CE10
>> -      - description: interrupt event for ring CE11
>> -      - description: interrupt event for ring host2wbm-desc-feed
>> -      - description: interrupt event for ring host2reo-re-injection
>> -      - description: interrupt event for ring host2reo-command
>> -      - description: interrupt event for ring host2rxdma-monitor-ring3
>> -      - description: interrupt event for ring host2rxdma-monitor-ring2
>> -      - description: interrupt event for ring host2rxdma-monitor-ring1
>> -      - description: interrupt event for ring reo2ost-exception
>> -      - description: interrupt event for ring wbm2host-rx-release
>> -      - description: interrupt event for ring reo2host-status
>> -      - description: interrupt event for ring reo2host-destination-ring4
>> -      - description: interrupt event for ring reo2host-destination-ring3
>> -      - description: interrupt event for ring reo2host-destination-ring2
>> -      - description: interrupt event for ring reo2host-destination-ring1
>> -      - description: interrupt event for ring rxdma2host-monitor-destination-mac3
>> -      - description: interrupt event for ring rxdma2host-monitor-destination-mac2
>> -      - description: interrupt event for ring rxdma2host-monitor-destination-mac1
>> -      - description: interrupt event for ring ppdu-end-interrupts-mac3
>> -      - description: interrupt event for ring ppdu-end-interrupts-mac2
>> -      - description: interrupt event for ring ppdu-end-interrupts-mac1
>> -      - description: interrupt event for ring rxdma2host-monitor-status-ring-mac3
>> -      - description: interrupt event for ring rxdma2host-monitor-status-ring-mac2
>> -      - description: interrupt event for ring rxdma2host-monitor-status-ring-mac1
>> -      - description: interrupt event for ring host2rxdma-host-buf-ring-mac3
>> -      - description: interrupt event for ring host2rxdma-host-buf-ring-mac2
>> -      - description: interrupt event for ring host2rxdma-host-buf-ring-mac1
>> -      - description: interrupt event for ring rxdma2host-destination-ring-mac3
>> -      - description: interrupt event for ring rxdma2host-destination-ring-mac2
>> -      - description: interrupt event for ring rxdma2host-destination-ring-mac1
>> -      - description: interrupt event for ring host2tcl-input-ring4
>> -      - description: interrupt event for ring host2tcl-input-ring3
>> -      - description: interrupt event for ring host2tcl-input-ring2
>> -      - description: interrupt event for ring host2tcl-input-ring1
>> -      - description: interrupt event for ring wbm2host-tx-completions-ring3
>> -      - description: interrupt event for ring wbm2host-tx-completions-ring2
>> -      - description: interrupt event for ring wbm2host-tx-completions-ring1
>> -      - description: interrupt event for ring tcl2host-status-ring
>> -
>> +    minItems: 32
>> +    maxItems: 52
>>   
>>     interrupt-names:
>> -    items:
>> -      - const: misc-pulse1
>> -      - const: misc-latch
>> -      - const: sw-exception
>> -      - const: watchdog
>> -      - const: ce0
>> -      - const: ce1
>> -      - const: ce2
>> -      - const: ce3
>> -      - const: ce4
>> -      - const: ce5
>> -      - const: ce6
>> -      - const: ce7
>> -      - const: ce8
>> -      - const: ce9
>> -      - const: ce10
>> -      - const: ce11
>> -      - const: host2wbm-desc-feed
>> -      - const: host2reo-re-injection
>> -      - const: host2reo-command
>> -      - const: host2rxdma-monitor-ring3
>> -      - const: host2rxdma-monitor-ring2
>> -      - const: host2rxdma-monitor-ring1
>> -      - const: reo2ost-exception
>> -      - const: wbm2host-rx-release
>> -      - const: reo2host-status
>> -      - const: reo2host-destination-ring4
>> -      - const: reo2host-destination-ring3
>> -      - const: reo2host-destination-ring2
>> -      - const: reo2host-destination-ring1
>> -      - const: rxdma2host-monitor-destination-mac3
>> -      - const: rxdma2host-monitor-destination-mac2
>> -      - const: rxdma2host-monitor-destination-mac1
>> -      - const: ppdu-end-interrupts-mac3
>> -      - const: ppdu-end-interrupts-mac2
>> -      - const: ppdu-end-interrupts-mac1
>> -      - const: rxdma2host-monitor-status-ring-mac3
>> -      - const: rxdma2host-monitor-status-ring-mac2
>> -      - const: rxdma2host-monitor-status-ring-mac1
>> -      - const: host2rxdma-host-buf-ring-mac3
>> -      - const: host2rxdma-host-buf-ring-mac2
>> -      - const: host2rxdma-host-buf-ring-mac1
>> -      - const: rxdma2host-destination-ring-mac3
>> -      - const: rxdma2host-destination-ring-mac2
>> -      - const: rxdma2host-destination-ring-mac1
>> -      - const: host2tcl-input-ring4
>> -      - const: host2tcl-input-ring3
>> -      - const: host2tcl-input-ring2
>> -      - const: host2tcl-input-ring1
>> -      - const: wbm2host-tx-completions-ring3
>> -      - const: wbm2host-tx-completions-ring2
>> -      - const: wbm2host-tx-completions-ring1
>> -      - const: tcl2host-status-ring
>> +    maxItems: 52
>>   
>>     qcom,rproc:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>> @@ -151,20 +48,205 @@ properties:
>>         board-2.bin for designs with colliding bus and device specific ids
>>   
>>     memory-region:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 2
>>       description:
>>         phandle to a node describing reserved memory (System RAM memory)
>>         used by ath11k firmware (see bindings/reserved-memory/reserved-memory.txt)
>>   
>> +  iommus:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  wifi-firmware:
>> +    type: object
>> +    description: |
>> +      WCN6750 wifi node can contain one optional firmware subnode.
>> +      Firmware subnode is needed when the platform does not have Tustzone.
> 
> s/Tustzone/Trustzone/

Sure

> 
>> +    required:
>> +      - iommus
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>> -  - interrupt-names
>>     - qcom,rproc
>>   
>>   additionalProperties: false
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq8074-wifi
>> +              - qcom,ipq6018-wifi
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          items:
>> +            - description: misc-pulse1 interrupt events
>> +            - description: misc-latch interrupt events
>> +            - description: sw exception interrupt events
>> +            - description: watchdog interrupt events
>> +            - description: interrupt event for ring CE0
>> +            - description: interrupt event for ring CE1
>> +            - description: interrupt event for ring CE2
>> +            - description: interrupt event for ring CE3
>> +            - description: interrupt event for ring CE4
>> +            - description: interrupt event for ring CE5
>> +            - description: interrupt event for ring CE6
>> +            - description: interrupt event for ring CE7
>> +            - description: interrupt event for ring CE8
>> +            - description: interrupt event for ring CE9
>> +            - description: interrupt event for ring CE10
>> +            - description: interrupt event for ring CE11
>> +            - description: interrupt event for ring host2wbm-desc-feed
>> +            - description: interrupt event for ring host2reo-re-injection
>> +            - description: interrupt event for ring host2reo-command
>> +            - description: interrupt event for ring host2rxdma-monitor-ring3
>> +            - description: interrupt event for ring host2rxdma-monitor-ring2
>> +            - description: interrupt event for ring host2rxdma-monitor-ring1
>> +            - description: interrupt event for ring reo2ost-exception
>> +            - description: interrupt event for ring wbm2host-rx-release
>> +            - description: interrupt event for ring reo2host-status
>> +            - description: interrupt event for ring reo2host-destination-ring4
>> +            - description: interrupt event for ring reo2host-destination-ring3
>> +            - description: interrupt event for ring reo2host-destination-ring2
>> +            - description: interrupt event for ring reo2host-destination-ring1
>> +            - description: interrupt event for ring rxdma2host-monitor-destination-mac3
>> +            - description: interrupt event for ring rxdma2host-monitor-destination-mac2
>> +            - description: interrupt event for ring rxdma2host-monitor-destination-mac1
>> +            - description: interrupt event for ring ppdu-end-interrupts-mac3
>> +            - description: interrupt event for ring ppdu-end-interrupts-mac2
>> +            - description: interrupt event for ring ppdu-end-interrupts-mac1
>> +            - description: interrupt event for ring rxdma2host-monitor-status-ring-mac3
>> +            - description: interrupt event for ring rxdma2host-monitor-status-ring-mac2
>> +            - description: interrupt event for ring rxdma2host-monitor-status-ring-mac1
>> +            - description: interrupt event for ring host2rxdma-host-buf-ring-mac3
>> +            - description: interrupt event for ring host2rxdma-host-buf-ring-mac2
>> +            - description: interrupt event for ring host2rxdma-host-buf-ring-mac1
>> +            - description: interrupt event for ring rxdma2host-destination-ring-mac3
>> +            - description: interrupt event for ring rxdma2host-destination-ring-mac2
>> +            - description: interrupt event for ring rxdma2host-destination-ring-mac1
>> +            - description: interrupt event for ring host2tcl-input-ring4
>> +            - description: interrupt event for ring host2tcl-input-ring3
>> +            - description: interrupt event for ring host2tcl-input-ring2
>> +            - description: interrupt event for ring host2tcl-input-ring1
>> +            - description: interrupt event for ring wbm2host-tx-completions-ring3
>> +            - description: interrupt event for ring wbm2host-tx-completions-ring2
>> +            - description: interrupt event for ring wbm2host-tx-completions-ring1
>> +            - description: interrupt event for ring tcl2host-status-ring
>> +        interrupt-names:
>> +          items:
>> +            - const: misc-pulse1
>> +            - const: misc-latch
>> +            - const: sw-exception
>> +            - const: watchdog
>> +            - const: ce0
>> +            - const: ce1
>> +            - const: ce2
>> +            - const: ce3
>> +            - const: ce4
>> +            - const: ce5
>> +            - const: ce6
>> +            - const: ce7
>> +            - const: ce8
>> +            - const: ce9
>> +            - const: ce10
>> +            - const: ce11
>> +            - const: host2wbm-desc-feed
>> +            - const: host2reo-re-injection
>> +            - const: host2reo-command
>> +            - const: host2rxdma-monitor-ring3
>> +            - const: host2rxdma-monitor-ring2
>> +            - const: host2rxdma-monitor-ring1
>> +            - const: reo2ost-exception
>> +            - const: wbm2host-rx-release
>> +            - const: reo2host-status
>> +            - const: reo2host-destination-ring4
>> +            - const: reo2host-destination-ring3
>> +            - const: reo2host-destination-ring2
>> +            - const: reo2host-destination-ring1
>> +            - const: rxdma2host-monitor-destination-mac3
>> +            - const: rxdma2host-monitor-destination-mac2
>> +            - const: rxdma2host-monitor-destination-mac1
>> +            - const: ppdu-end-interrupts-mac3
>> +            - const: ppdu-end-interrupts-mac2
>> +            - const: ppdu-end-interrupts-mac1
>> +            - const: rxdma2host-monitor-status-ring-mac3
>> +            - const: rxdma2host-monitor-status-ring-mac2
>> +            - const: rxdma2host-monitor-status-ring-mac1
>> +            - const: host2rxdma-host-buf-ring-mac3
>> +            - const: host2rxdma-host-buf-ring-mac2
>> +            - const: host2rxdma-host-buf-ring-mac1
>> +            - const: rxdma2host-destination-ring-mac3
>> +            - const: rxdma2host-destination-ring-mac2
>> +            - const: rxdma2host-destination-ring-mac1
>> +            - const: host2tcl-input-ring4
>> +            - const: host2tcl-input-ring3
>> +            - const: host2tcl-input-ring2
>> +            - const: host2tcl-input-ring1
>> +            - const: wbm2host-tx-completions-ring3
>> +            - const: wbm2host-tx-completions-ring2
>> +            - const: wbm2host-tx-completions-ring1
>> +            - const: tcl2host-status-ring
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq8074-wifi
>> +              - qcom,ipq6018-wifi
>> +    then:
>> +      required:
>> +        - interrupt-names
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,wcn6750-wifi
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          items:
>> +            - description: interrupt event for ring CE1
>> +            - description: interrupt event for ring CE2
>> +            - description: interrupt event for ring CE3
>> +            - description: interrupt event for ring CE4
>> +            - description: interrupt event for ring CE5
>> +            - description: interrupt event for ring CE6
>> +            - description: interrupt event for ring CE7
>> +            - description: interrupt event for ring CE8
>> +            - description: interrupt event for ring CE9
>> +            - description: interrupt event for ring CE10
>> +            - description: interrupt event for ring DP1
>> +            - description: interrupt event for ring DP2
>> +            - description: interrupt event for ring DP3
>> +            - description: interrupt event for ring DP4
>> +            - description: interrupt event for ring DP5
>> +            - description: interrupt event for ring DP6
>> +            - description: interrupt event for ring DP7
>> +            - description: interrupt event for ring DP8
>> +            - description: interrupt event for ring DP9
>> +            - description: interrupt event for ring DP10
>> +            - description: interrupt event for ring DP11
>> +            - description: interrupt event for ring DP12
>> +            - description: interrupt event for ring DP13
>> +            - description: interrupt event for ring DP14
>> +            - description: interrupt event for ring DP15
>> +            - description: interrupt event for ring DP16
>> +            - description: interrupt event for ring DP17
>> +            - description: interrupt event for ring DP18
>> +            - description: interrupt event for ring DP19
>> +            - description: interrupt event for ring DP20
>> +            - description: interrupt event for ring DP21
>> +            - description: interrupt event for ring DP22
>> +
>>   examples:
>>     - |
>>   
>> @@ -309,3 +391,64 @@ examples:
>>               };
>>           };
>>       };
>> +
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    reserved-memory {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        wlan_ce_mem: wlan_ce_mem@4cd000 {
> 
> Node names should use dashes ('-') as separators, so the node name should
> be 'wlan-ce-mem'.
> 
> Actually reserved memory nodes for sc7280 are all named memory@addr, the
> binding should follow this convention, so 'memory@4cd000'.
> 
>> +            no-map;
>> +            reg = <0x0 0x4cd000 0x0 0x1000>;
> 
> Pad the address here to 8 digits
> 
>> +        };
>> +
>> +        wlan_fw_mem: wlan_fw_mem@80c00000 {
> 
> Same as above: memory@80c00000
> 
>> +            no-map;
>> +            reg = <0x0 0x80c00000 0x0 0xc00000>;
>> +        };
>> +    };
>> +
>> +    wifi: wifi@17a10040 {
>> +        compatible = "qcom,wcn6750-wifi";
>> +        reg = <0x17A10040 0x0>;
> 
> Use lowercase for hex digits
> 
>> +        iommus = <&apps_smmu 0x1C00 0x1>;
> 
> Ditto
> 
>> +        interrupts = <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 769 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 770 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 771 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 773 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 774 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 775 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 776 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 777 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 778 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 779 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 780 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 781 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 782 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 783 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 784 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 785 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 786 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 787 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 788 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 789 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 790 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 791 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 792 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 793 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 794 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 796 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 797 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
>> +        qcom,rproc = <&remoteproc_wpss>;
>> +        memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
>> +        wifi-firmware {
>> +                iommus = <&apps_smmu 0x1C02 0x1>;
> 
> Use lowercase for hex digits
> 
>> +        };
>> +    };

I'll address all of these.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
