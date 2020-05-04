Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH 1/2] ath10k: use cumulative survey statistics
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <f772b7bf0eac31516a4e28719c1938f2@codeaurora.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <323b4d4f-a967-cf63-6f5a-04f53802c50a@candelatech.com>
Date: Mon, 4 May 2020 16:49:19 -0700
MIME-Version: 1.0
In-Reply-To: <f772b7bf0eac31516a4e28719c1938f2@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>, Markus Theil <markus.theil@tu-ilmenau.de>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@codeaurora.org, ath11k@lists.infradead.org



On 05/04/2020 04:46 PM, Rajkumar Manoharan wrote:
> On 2020-05-04 08:41, Markus Theil wrote:
>> ath10k currently reports survey results for the last interval between each
>> invocation of NL80211_CMD_GET_SURVEY. For concurrent invocations, this
>> can lead to unexpectedly small results, e.g. when hostapd uses survey
>> data and iw survey dump is invoked in parallel. Fix this by returning
>> cumulative results, that don't depend on the last invocation. Other
>> drivers, e.g. ath9k or mt76 also use this behavior.
>>
>> Signed-off-by: Markus Theil <markus.theil@tu-ilmenau.de>
>>
>
> IIRC this was fixed a while ago by below patch. Somehow it never landed in ath.git.
> Simple one line change is enough.
>
> https://patchwork.kernel.org/patch/10550707/
>
> -Rajkumar

Have you tested this with wave-1?  Lots of older, at least, firmware has brokenness in this area.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
