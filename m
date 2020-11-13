Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUoU-0005tt-Gv
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 08:52:13 +0000
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 16:51:17 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] mac80211: reject/clear user rate mask if not usable
In-Reply-To: <0e60e4cdc036a5ef7394848d212a6e3f499c386f.camel@sipsolutions.net>
References: <20170308132022.4216-1-johannes@sipsolutions.net>
 <07179008e9369bc81e152009ca85191d@codeaurora.org>
 <5decc452-7b2a-db1d-c5eb-04ab6bb61553@broadcom.com>
 <4b8f37fde23262547edb6ed4635cf89b@codeaurora.org>
 <cfee0b47ad026c74a105d3adf2923357bbc5e96e.camel@sipsolutions.net>
 <83dd20def685d303106f285400367b6e@codeaurora.org>
 <798cea679ae1df5a2ab9b59dd81c8e2b3ca2d6e3.camel@sipsolutions.net>
 <30e2e578983e4df447e0c26c5bba0aba@codeaurora.org>
 <0e60e4cdc036a5ef7394848d212a6e3f499c386f.camel@sipsolutions.net>
Message-ID: <256c487bb8c8c191a88d806e6125296e@codeaurora.org>
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
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>, kirtika@google.com, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org

On 2020-11-13 16:35, Johannes Berg wrote:
> On Fri, 2020-11-13 at 16:35 +0800, Wen Gong wrote:
>> 
>> > I guess if we really want to redefine the user rate mask to not apply
>> > to
>> > control frames, then we can relax this?
>> >
>> Yes, for AP mode, it is hard to calculate the usable rates over all
>> stations.
>> But for STATION mode, it can set 54M because AP support it, so it 
>> should
>> not reject it.
>> If add a check for nl80211_iftype of ieee80211_vif in
>> ieee80211_set_bitrate_mask, it can
>> solve this like this:
>> if (sdata->vif.type != NL80211_IFTYPE_STATION &&
>> !(mask->control[band].legacy & basic_rates))
> 
> 
> That would forgo the check completely - we'd still need to check 
> against
> the *supported* rates.
> 
yes.
It can add check with supp_rates[band] of ieee80211_sta for 
NL80211_IFTYPE_STATION type.
for others, check with sdata->vif.bss_conf.basic_rates
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
