Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOiar-00089s-0N
 for ath11k@lists.infradead.org; Sun, 27 Oct 2019 13:28:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 01/49] dt: bindings: net: add qcom,ath11k.yaml
References: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
 <1571565847-10338-2-git-send-email-kvalo@codeaurora.org>
 <20191025213028.GA5117@bogus>
Date: Sun, 27 Oct 2019 15:28:23 +0200
In-Reply-To: <20191025213028.GA5117@bogus> (Rob Herring's message of "Fri, 25
 Oct 2019 16:30:28 -0500")
Message-ID: <874kzu9v2g.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Rob Herring <robh@kernel.org> writes:

> On Sun, Oct 20, 2019 at 01:03:19PM +0300, Kalle Valo wrote:
>> ath11k is a driver for Qualcomm IEEE 802.11ax devices. Add a
>> bindings document for the driver, first documenting IPQ8074 which is the
>> only device ath11k currently supports.
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>> ---
>>  .../bindings/net/wireless/qcom,ath11k.yaml         | 277 +++++++++++++++++++++
>>  1 file changed, 277 insertions(+)
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> new file mode 100644
>> index 000000000000..5d25542f85f8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> @@ -0,0 +1,277 @@
>> +# SPDX-License-Identifier: BSD-3-Clause-Clear
>
> (GPL-2.0-only OR BSD-2-Clause) please.

I chose BSD-3-Clause-Clear because ath11k uses that license and I would
prefer to use the same license throughout the driver. Also it's
categorised as a preferred license:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/LICENSES/preferred

Any specific reason why you want to change the license?

>> +# Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>> +
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath11k.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies ath11k wireless devices Generic Binding
>> +
>> +maintainers:
>> +  - Kalle Valo <kvalo@codeaurora.org>
>> +
>> +description: |
>> + These are dt entries used on ath11k driver. AHB based ipq8074 uses
>> most of the properties defined in this doc.
>
> Describe the h/w, not what the document is.
>
> Wrap your lines.
>
>> +
>> +properties:
>> +  compatible:
>> +    const: "qcom,ipq8074-wifi"
>
> Drop quotes.
>
>> +
>> +  reg:
>> +    description: Address and length of the register set for the device
>
> Don't need a description.
>
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 53
>> +    maxItems: 53
>
> Assuming the list below has 53 entries min/maxItems is implied.

Will fix these.

>> +examples:
>> +  - |
>> +
>> +    q6v5_wcss: q6v5_wcss@CD00000 {
>> +    	compatible = "qcom,ipq8074-wcss-pil";
>> +    	reg = <0xCD00000 0x4040>,
>> +    	      <0x4AB000 0x20>;
>> +    	reg-names = "qdsp6",
>> +    		    "rmb";
>
> Mixed tabs and spaces. YAML needs spaces (at least at the beginning), so 
> just use spaces. More below...

Ok, I'll remove all the tabs from the doc. Thanks for the review!

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
