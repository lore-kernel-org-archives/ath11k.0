Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihwJ9-0007Kd-2d
 for ath11k@lists.infradead.org; Thu, 19 Dec 2019 13:57:40 +0000
Subject: Re: [PATCH 1/2] dt: bindings: net: ath11k: add qcom,board_id
 definition
References: <20191217164329.4151-1-john@phrozen.org>
 <871rt077d8.fsf@kamboji.qca.qualcomm.com>
From: John Crispin <john@phrozen.org>
Message-ID: <7052d9eb-412e-e802-52ed-2e1d63a65fe5@phrozen.org>
Date: Thu, 19 Dec 2019 14:57:36 +0100
MIME-Version: 1.0
In-Reply-To: <871rt077d8.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 19/12/2019 14:49, Kalle Valo wrote:
> John Crispin <john@phrozen.org> writes:
> 
>> We need to be able to define what id the board has allowing us to load the
>> correct definition data. This patch adds the description of the required
>> property.
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> ---
>>   .../devicetree/bindings/net/wireless/qcom,ath11k.yaml        | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> index a1717db36dba..c68daf6ad424 100644
>> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
>> @@ -142,6 +142,11 @@ properties:
>>           * reg
>>           * reg-names
>>   
>> +  qcom,board_id:
>> +      $ref: /schemas/types.yaml#/definitions/uint32
>> +      description:
>> +        The board id defining what board definition should be loaded
> 
> I think this needs more discussion. This is very tricky to get right, as
> it needs to be extensible and what not. With ath10k we have learned that
> a simple integer is not enough.
> 

I was expecting this, there seems to be an option to add ranges and/or 
enums. I did however fail to find any docs on the schemeas.
	John

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
