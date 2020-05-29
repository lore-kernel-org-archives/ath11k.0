Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jegMc-0005UV-4x
 for ath11k@lists.infradead.org; Fri, 29 May 2020 14:52:08 +0000
MIME-Version: 1.0
Date: Fri, 29 May 2020 20:21:42 +0530
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: Re: [PATCH 1/2] mac80211: enable TKIP when using encapsulation
 offloading
In-Reply-To: <86c1e5d23093f350bdabdde4c305c33ecde06b3b.camel@sipsolutions.net>
References: <1587720951-9222-1-git-send-email-murugana@codeaurora.org>
 <1587720951-9222-2-git-send-email-murugana@codeaurora.org>
 (sfid-20200424_113624_468114_4CC488DE)
 <d4e39180f0a8a8b07dc558c9439b66cd2c3aec07.camel@sipsolutions.net>
 <7fb606edf1e5c7ab5b1446d637768ee7@codeaurora.org>
 <aaa53c3a9cf6788cb653eb574073a1a0bcc5e6bf.camel@sipsolutions.net>
 <4bab3197997bb2dd6555ff920c5dd1cb@codeaurora.org>
 <f2b8fb0783b270a177ee900168fdc1fbc9253e3d.camel@sipsolutions.net>
 <92eddf5d153781b2698ad258aac2fbe4@codeaurora.org>
 <86c1e5d23093f350bdabdde4c305c33ecde06b3b.camel@sipsolutions.net>
Message-ID: <21fcffb4db13e9f0b70669d2e7f97d8a@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-05-29 20:14, Johannes Berg wrote:
> On Fri, 2020-05-29 at 20:10 +0530, Sathishkumar Muruganandam wrote:
>> On 2020-05-29 18:16, Johannes Berg wrote:
>> > On Fri, 2020-05-29 at 17:59 +0530, Sathishkumar Muruganandam wrote:
>> > > Yes, currently only tx encap support is added and rx decap support is
>> > > in
>> > > progress to do TKIP MIC error reporting to userspace via
>> > > cfg80211_michael_mic_failure().
>> >
>> > Yes, but can you actually call that? It requires a netdev. I don't
>> > think
>> > you can easily get it from the vif?
>> >
>> 
>> Yes, that's right. Currently the plan is to add new mac80211 api for 
>> rx
>> decap where
>> we can call cfg80211_michael_mic_failure() and not called directly 
>> from
>> driver.
> 
> Sure, that sounds fine.
> 
> Really what I was saying is that we should have that together, not just
> this patch that allows TKIP offload, but then nothing that actually
> makes that working properly/safely.

Sure, thanks Johannes !

Will include this along with rx decap patch.

> 
>> Whether we can expose netdev to driver for doing such cfg80211 call ?
> 
> I've always worried that if we expose the netdev we'll just get all
> kinds of messy things happening in the driver :)
> 
> But maybe not. I guess it doesn't make a big difference.
> 

Sure, will fallback to mac80211 approach for rx decap. Thanks for your 
review !

Thanks,
Sathishkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
