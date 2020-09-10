Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGOoK-00061N-Sj
 for ath11k@lists.infradead.org; Thu, 10 Sep 2020 15:48:33 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v7 1/3] dt: bindings: net: update compatible for ath11k
References: <1599551717-3801-1-git-send-email-akolli@codeaurora.org>
 <010101746cb6751a-ca300933-1174-4534-a01b-b1dbf1c1f305-000000@us-west-2.amazonses.com>
 <20200908203514.GA870402@bogus>
Date: Thu, 10 Sep 2020 15:48:29 +0000
In-Reply-To: <20200908203514.GA870402@bogus> (Rob Herring's message of "Tue, 8
 Sep 2020 14:35:14 -0600")
Message-ID: <0101017478b430b0-7a41566f-6207-464f-8ee8-1b77040c0c5e-000000@us-west-2.amazonses.com>
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
Cc: devicetree@vger.kernel.org, Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Rob Herring <robh@kernel.org> writes:

> On Tue, 08 Sep 2020 07:55:31 +0000, Anilkumar Kolli wrote:
>> Add IPQ6018 wireless driver support,
>> its based on ath11k driver.
>> 
>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>> ---
>> V3:
>>  - Use 'enum' rather than oneOf+const.
>> V4:
>>  - removed oneOf, use just enum (Rob)
>> V5:
>>  - Fixes errors in 'make dt_binding_check' (Rob)
>> 
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

I added Rob's Reviewed-by in the pending branch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
