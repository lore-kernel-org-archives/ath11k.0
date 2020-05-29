Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jee9A-0002Vn-DH
 for ath11k@lists.infradead.org; Fri, 29 May 2020 12:30:04 +0000
MIME-Version: 1.0
Date: Fri, 29 May 2020 17:59:51 +0530
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: Re: [PATCH 1/2] mac80211: enable TKIP when using encapsulation
 offloading
In-Reply-To: <aaa53c3a9cf6788cb653eb574073a1a0bcc5e6bf.camel@sipsolutions.net>
References: <1587720951-9222-1-git-send-email-murugana@codeaurora.org>
 <1587720951-9222-2-git-send-email-murugana@codeaurora.org>
 (sfid-20200424_113624_468114_4CC488DE)
 <d4e39180f0a8a8b07dc558c9439b66cd2c3aec07.camel@sipsolutions.net>
 <7fb606edf1e5c7ab5b1446d637768ee7@codeaurora.org>
 <aaa53c3a9cf6788cb653eb574073a1a0bcc5e6bf.camel@sipsolutions.net>
Message-ID: <4bab3197997bb2dd6555ff920c5dd1cb@codeaurora.org>
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

On 2020-05-29 17:40, Johannes Berg wrote:
> On Fri, 2020-05-29 at 17:38 +0530, Sathishkumar Muruganandam wrote:
> 
>> > I don't think it can. It doesn't have all the necessary information to
>> > call cfg80211_michael_mic_failure(), as far as I can tell.
>> 
>> Ath11k HW has capability of reporting TKIP MIC error when hw encap is
>> enabled as well, so TKIP encryption shall be enabled.
> 
> Maybe so. But it cannot tell wpa_supplicant about MIC errors, and so
> that cannot do countermeasures, so something isn't right.
> 
>> Shall we have a ieee80211_hw_flags for the driver to advertise TKIP 
>> MIC
>> error reporting capability when hw encap is enabled ?
>> TKIP bring-up will be disabled for the drivers which doesn't have the
>> capability.
> 
> That would be better, since for TKIP it's actually more tricky and
> requires more work.
> 
> But mostly I was thinking that you should make it possible for ath11k 
> to
> actually report the MIC errors up to userspace. Right now I don't think
> it can, because it doesn't have the netdev pointer?
> 

Yes, currently only tx encap support is added and rx decap support is in
progress to do TKIP MIC error reporting to userspace via 
cfg80211_michael_mic_failure().
With NL80211_CMD_MICHAEL_MIC_FAILURE, hostapd will be able to do TKIP 
counter-measures.

Thanks,
Sathishkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
