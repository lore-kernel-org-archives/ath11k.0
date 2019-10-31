Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ79R-0005Lv-KO
 for ath11k@lists.infradead.org; Thu, 31 Oct 2019 09:53:58 +0000
MIME-Version: 1.0
Date: Thu, 31 Oct 2019 15:23:56 +0530
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: Re: [PATCH 1/2] nl80211: add Wide Band Scan support
In-Reply-To: <877e4m2t09.fsf@kamboji.qca.qualcomm.com>
References: <1572349405-4653-1-git-send-email-murugana@codeaurora.org>
 <1572349405-4653-2-git-send-email-murugana@codeaurora.org>
 <877e4m2t09.fsf@kamboji.qca.qualcomm.com>
Message-ID: <9a59444a57a898ec26e5824aa22db081@codeaurora.org>
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
Cc: ath11k@lists.infradead.org

On 2019-10-30 20:13, Kalle Valo wrote:
> Sathishkumar Muruganandam <murugana@codeaurora.org> writes:
> 
>> New nl80211 ext_feature and scan_flag added to support wide band scan 
>> which
>> allows driver to scan on requested channel with corresponding
>> phy mode/bandwidth (40Mhz, 80Mhz).
>> 
>> To handle center frequency of 80Mhz channel, struct cfg80211_chan_def 
>> is
>> included in cfg80211_scan_request.
>> 
>> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
>> ---
>>  include/net/cfg80211.h       |  2 ++
>>  include/uapi/linux/nl80211.h |  7 +++++
>>  net/mac80211/scan.c          |  2 ++
>>  net/wireless/nl80211.c       | 68 
>> ++++++++++++++++++++++++++++----------------
>>  4 files changed, 55 insertions(+), 24 deletions(-)
> 
> I don't apply nl80211 patches. So you need to submit this to
> linux-wireless like all other nl80211 patches.
> 
> I'll also drop the ath11k patch, please resend once the nl80211 patch 
> is
> applied.

Here both nl80211 and ath11k patches are inter-related to Wide band scan 
and hence I had sent them as single patch series like the other previous 
ath11k patches.

If I need to submit nl80211 patch to linux-wireless first, whether I can 
send ath11k patch also in series ?

-- 
Thanks,
Sathishkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
