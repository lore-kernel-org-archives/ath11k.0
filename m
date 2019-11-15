Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVaYy-0007sT-RN
 for ath11k@lists.infradead.org; Fri, 15 Nov 2019 12:18:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 01/49] dt: bindings: net: add qcom,ath11k.yaml
References: <1571565847-10338-1-git-send-email-kvalo@codeaurora.org>
 <1571565847-10338-2-git-send-email-kvalo@codeaurora.org>
 <20191025213028.GA5117@bogus>
 <87k18by9w0.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 15 Nov 2019 14:18:50 +0200
In-Reply-To: <87k18by9w0.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 07 Nov 2019 17:38:23 +0200")
Message-ID: <8736epwcwl.fsf@codeaurora.org>
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

Kalle Valo <kvalo@codeaurora.org> writes:

> Rob Herring <robh@kernel.org> writes:
>
>> On Sun, Oct 20, 2019 at 01:03:19PM +0300, Kalle Valo wrote:
>>> ath11k is a driver for Qualcomm IEEE 802.11ax devices. Add a
>>> bindings document for the driver, first documenting IPQ8074 which is the
>>> only device ath11k currently supports.
>>> 
>>> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> [...]
>
>>> +  interrupts:
>>> +    minItems: 53
>>> +    maxItems: 53
>>
>> Assuming the list below has 53 entries min/maxItems is implied.
>
> There's actually 52 entries in the items list below this, I need to
> check if we are missing an entry or is this just a miscalculation.

I got a confirmation internally, 52 entries is correct.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
