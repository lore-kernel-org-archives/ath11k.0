Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW1Q1-0003tC-E1
 for ath11k@lists.infradead.org; Tue, 05 May 2020 17:31:49 +0000
MIME-Version: 1.0
Date: Tue, 05 May 2020 10:31:10 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 2/2] ath11k: use cumulative survey statistics
In-Reply-To: <c786e982-fcd6-2368-6b2f-f09b265654d6@tu-ilmenau.de>
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <20200504154122.91862-2-markus.theil@tu-ilmenau.de>
 <85fa2d5f9183b3a12c5283b800f3750f@codeaurora.org>
 <c786e982-fcd6-2368-6b2f-f09b265654d6@tu-ilmenau.de>
Message-ID: <61f3dcc195fa4d877ddbd161523142ec@codeaurora.org>
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
To: Markus Theil <markus.theil@tu-ilmenau.de>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org

On 2020-05-04 23:53, Markus Theil wrote:
> Am 05.05.2020 um 01:37 schrieb Rajkumar Manoharan:
>> On 2020-05-04 08:41, Markus Theil wrote:
>>> ath11k currently reports survey results for the last interval between 
>>> each
>>> invocation of NL80211_CMD_GET_SURVEY. For concurrent invocations, 
>>> this
>>> can lead to unexpectedly small results, e.g. when hostapd uses survey
>>> data and iw survey dump is invoked in parallel. Fix this by returning
>>> cumulative results, that don't depend on the last invocation. Other
>>> drivers, e.g. ath9k or mt76 also use this behavior.
>>> 
[...]
>> Markus,
>> 
>> It depends on type of survey request is given to firmware. In ath11k, 
>> firmware reports
>> accumulated values. So the above addition is wrong and report double 
>> value. Have you
>> tested this change?
>> 
>> -Rajkumar
> Ok, so please drop both of my patches. My assumptions were incomplete
> and too humble. I just assumed, ath10k and ath11k both use incremental
> surveys.
> 
Markus,

The ath10k driver still counts survey stats incrementally. But it should 
be handled by sending
appropriate survey request_type to firmware.

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
