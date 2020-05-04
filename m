Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [PATCH 1/2] ath10k: use cumulative survey statistics
References: <20200504154122.91862-1-markus.theil@tu-ilmenau.de>
 <1760068.xeLkAeoAig@bentobox>
From: Markus Theil <markus.theil@tu-ilmenau.de>
Message-ID: <5a4c9924-e727-30e7-8409-967c361c2fae@tu-ilmenau.de>
Date: Mon, 4 May 2020 18:33:43 +0200
MIME-Version: 1.0
In-Reply-To: <1760068.xeLkAeoAig@bentobox>
Content-Language: en-US
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
To: Sven Eckelmann <sven@narfation.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org

On 5/4/20 6:29 PM, Sven Eckelmann wrote:
> On Monday, 4 May 2020 17:41:21 CEST Markus Theil wrote:
>> ath10k currently reports survey results for the last interval between each
>> invocation of NL80211_CMD_GET_SURVEY. For concurrent invocations, this
>> can lead to unexpectedly small results, e.g. when hostapd uses survey
>> data and iw survey dump is invoked in parallel. Fix this by returning
>> cumulative results, that don't depend on the last invocation. Other
>> drivers, e.g. ath9k or mt76 also use this behavior.
> It is (unfortunately) not that trivial:
>
> See code and comments from other people:
>
> * https://patchwork.kernel.org/cover/11150285/
> * https://patchwork.kernel.org/patch/11150287/
> * https://patchwork.kernel.org/patch/11150289/
>
> Kind regards,
> 	Sven
Thanks a lot for pointing this out! I was not aware of your patch.


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
