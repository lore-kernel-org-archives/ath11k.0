Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVktD-0002X5-Qw
 for ath11k@lists.infradead.org; Mon, 04 May 2020 23:52:49 +0000
MIME-Version: 1.0
Date: Mon, 04 May 2020 16:52:45 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 1/2] ath10k: use cumulative survey statistics
In-Reply-To: <323b4d4f-a967-cf63-6f5a-04f53802c50a@candelatech.com>
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <f772b7bf0eac31516a4e28719c1938f2@codeaurora.org>
 <323b4d4f-a967-cf63-6f5a-04f53802c50a@candelatech.com>
Message-ID: <4b03993ba81a8e9ebb1203c0b8aa90f6@codeaurora.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Markus Theil <markus.theil@tu-ilmenau.de>, ath10k@lists.infradead.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

On 2020-05-04 16:49, Ben Greear wrote:
> On 05/04/2020 04:46 PM, Rajkumar Manoharan wrote:
>> On 2020-05-04 08:41, Markus Theil wrote:
>>> ath10k currently reports survey results for the last interval between 
>>> each
>>> invocation of NL80211_CMD_GET_SURVEY. For concurrent invocations, 
>>> this
>>> can lead to unexpectedly small results, e.g. when hostapd uses survey
>>> data and iw survey dump is invoked in parallel. Fix this by returning
>>> cumulative results, that don't depend on the last invocation. Other
>>> drivers, e.g. ath9k or mt76 also use this behavior.
>>> 
>>> Signed-off-by: Markus Theil <markus.theil@tu-ilmenau.de>
>>> 
>> 
>> IIRC this was fixed a while ago by below patch. Somehow it never 
>> landed in ath.git.
>> Simple one line change is enough.
>> 
>> https://patchwork.kernel.org/patch/10550707/
>> 
>> -Rajkumar
> 
> Have you tested this with wave-1?  Lots of older, at least, firmware
> has brokenness in this area.
> 
Yes. It was tested in wave-1 as well. Venkat replied to your comment on 
original change.

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
