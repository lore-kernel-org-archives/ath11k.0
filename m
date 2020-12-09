Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmpWh-0008IQ-SW
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 02:48:25 +0000
MIME-Version: 1.0
Date: Wed, 09 Dec 2020 10:48:21 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v4 13/17] mac80211: receive and process S1G beacons
In-Reply-To: <bc3e532c5d21ac5d703de41d4144cf7d@adapt-ip.com>
References: <20200922022818.15855-1-thomas@adapt-ip.com>
 <20200922022818.15855-14-thomas@adapt-ip.com>
 <6064b579538afca27c511edeb5400032@codeaurora.org>
 <bc3e532c5d21ac5d703de41d4144cf7d@adapt-ip.com>
Message-ID: <b64d2f6db4464c9ea53a4e29af8332af@codeaurora.org>
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
To: Thomas Pedersen <thomas@adapt-ip.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org, ath10k@lists.infradead.org

On 2020-12-09 02:19, Thomas Pedersen wrote:
> Hi Wen,
> 
> On 2020-12-07 23:44, Wen Gong wrote:
>> On 2020-09-22 10:28, Thomas Pedersen wrote:
>>> S1G beacons are 802.11 Extension Frames, so the fixed
>>> header part differs from regular beacons.
>>> 
>>> Add a handler to process S1G beacons and abstract out the
>>> fetching of BSSID and element start locations in the
>>> beacon body handler.
>>> 
>>> Signed-off-by: Thomas Pedersen <thomas@adapt-ip.com>
>>> ---
>>>  net/mac80211/ieee80211_i.h |  4 ++
>>>  net/mac80211/iface.c       |  5 +++
>>>  net/mac80211/mlme.c        | 84 
>>> +++++++++++++++++++++++++++++---------
>>>  net/mac80211/rx.c          | 84 
>>> ++++++++++++++++----------------------
>>>  net/mac80211/util.c        | 52 +++++++++++++++++++++++
>>>  5 files changed, 162 insertions(+), 67 deletions(-)
>>> 
>> ...
>>> @@ -1801,7 +1756,8 @@ ieee80211_rx_h_sta_process(struct 
>>> ieee80211_rx_data *rx)
>>>  		}
>>>  	} else if (rx->sdata->vif.type == NL80211_IFTYPE_OCB) {
>>>  		sta->rx_stats.last_rx = jiffies;
>>> -	} else if (!is_multicast_ether_addr(hdr->addr1)) {
>>> +	} else if (!ieee80211_is_s1g_beacon(hdr->frame_control) &&
>>> +		   is_multicast_ether_addr(hdr->addr1)) {
>> is this a typo mistake?
>> it removed ! for is_multicast_ether_addr(!is_multicast_ether_addr ==>
>> is_multicast_ether_addr)
> 
> Yes that does look like a typo, it should be:
> 
> 	} else if (!ieee80211_is_s1g_beacon(hdr->frame_control) &&
> 		   !is_multicast_ether_addr(hdr->addr1)) {
> 
> (because is_multicast_ether_addr() evaluates to true for s1g beacons).
> 
> Do you have a patch or would you like me to send a fixup?
Yes, I have a patch for it.
I will send it.
> 
> Thanks,

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
