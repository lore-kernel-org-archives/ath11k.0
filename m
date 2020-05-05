Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH 1/2] ath10k: use cumulative survey statistics
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <f772b7bf0eac31516a4e28719c1938f2@codeaurora.org>
 <323b4d4f-a967-cf63-6f5a-04f53802c50a@candelatech.com>
 <4b03993ba81a8e9ebb1203c0b8aa90f6@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <9044aa57-ceb2-fecd-e220-eb8b7c0db4b5@candelatech.com>
Date: Mon, 4 May 2020 17:02:42 -0700
MIME-Version: 1.0
In-Reply-To: <4b03993ba81a8e9ebb1203c0b8aa90f6@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Markus Theil <markus.theil@tu-ilmenau.de>, ath10k@lists.infradead.org, ath11k@lists.infradead.org, kvalo@codeaurora.org



On 05/04/2020 04:52 PM, Rajkumar Manoharan wrote:
> On 2020-05-04 16:49, Ben Greear wrote:
>> On 05/04/2020 04:46 PM, Rajkumar Manoharan wrote:
>>> On 2020-05-04 08:41, Markus Theil wrote:
>>>> ath10k currently reports survey results for the last interval between each
>>>> invocation of NL80211_CMD_GET_SURVEY. For concurrent invocations, this
>>>> can lead to unexpectedly small results, e.g. when hostapd uses survey
>>>> data and iw survey dump is invoked in parallel. Fix this by returning
>>>> cumulative results, that don't depend on the last invocation. Other
>>>> drivers, e.g. ath9k or mt76 also use this behavior.
>>>>
>>>> Signed-off-by: Markus Theil <markus.theil@tu-ilmenau.de>
>>>>
>>>
>>> IIRC this was fixed a while ago by below patch. Somehow it never landed in ath.git.
>>> Simple one line change is enough.
>>>
>>> https://patchwork.kernel.org/patch/10550707/
>>>
>>> -Rajkumar
>>
>> Have you tested this with wave-1?  Lots of older, at least, firmware
>> has brokenness in this area.
>>
> Yes. It was tested in wave-1 as well. Venkat replied to your comment on original change.

Ahh, sorry I missed that.

Hopefully no one is using the broken firmware anymore then!

--Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
