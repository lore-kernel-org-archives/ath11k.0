Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5reP-00047I-B7
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 13:18:14 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 01/49] dt: bindings: net: add qcom,ath11k.txt
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-2-git-send-email-kvalo@codeaurora.org>
 <20190827171307.GA23128@bogus>
Date: Thu, 05 Sep 2019 16:18:08 +0300
In-Reply-To: <20190827171307.GA23128@bogus> (Rob Herring's message of "Tue, 27
 Aug 2019 12:13:07 -0500")
Message-ID: <87o8zylw4v.fsf@kamboji.qca.qualcomm.com>
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

> On Tue, Aug 20, 2019 at 06:47:27PM +0300, Kalle Valo wrote:
>
> Missing commit message and Sob (and on the other patches).

My original plan was to commit all this in one commit and use the cover
letter as my commit. But based on your comment I realised we should have
three commits:

1. devicetree bindings doc
2. ath11k itself
3. add entry to MAINTAINERS file

>> ---
>>  .../bindings/net/wireless/qcom,ath11k.txt          | 127 +++++++++++++++++++++
>>  1 file changed, 127 insertions(+)
>
> Please use the DT schema format (YAML). See writing-schema.md.

Oh, I didn't know about the new format. We'll use that.

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.txt
>> @@ -0,0 +1,127 @@
>> +* Qualcomm Technologies ath11k wireless devices
>> +
>> +Required properties:
>> +- compatible: Should be "qcom,ipq8074-wifi"
>> +
>> +AHB based ipq8074 uses most of the properties defined in this doc.
>> +
>> +Optional properties:
>> +- reg: Address and length of the register set for the device.
>> +- interrupts: List of interrupt lines. Must contain an entry
>> +	      for each entry in the interrupt-names property.
>
> Need to be explicit as to how many interrupts and what they are.

Ok, we'll add that.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
