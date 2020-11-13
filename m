Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdV5l-0007TN-A6
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 09:10:02 +0000
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 17:09:59 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] mac80211: reject/clear user rate mask if not usable
In-Reply-To: <365b1abcfd043a3b0c356ec9f8c7c44acd5a79d2.camel@sipsolutions.net>
References: <20170308132022.4216-1-johannes@sipsolutions.net>
 <07179008e9369bc81e152009ca85191d@codeaurora.org>
 <5decc452-7b2a-db1d-c5eb-04ab6bb61553@broadcom.com>
 <4b8f37fde23262547edb6ed4635cf89b@codeaurora.org>
 <cfee0b47ad026c74a105d3adf2923357bbc5e96e.camel@sipsolutions.net>
 <83dd20def685d303106f285400367b6e@codeaurora.org>
 <798cea679ae1df5a2ab9b59dd81c8e2b3ca2d6e3.camel@sipsolutions.net>
 <30e2e578983e4df447e0c26c5bba0aba@codeaurora.org>
 <0e60e4cdc036a5ef7394848d212a6e3f499c386f.camel@sipsolutions.net>
 <256c487bb8c8c191a88d806e6125296e@codeaurora.org>
 <365b1abcfd043a3b0c356ec9f8c7c44acd5a79d2.camel@sipsolutions.net>
Message-ID: <6caaa87ba3f37bd424e92d03c2340689@codeaurora.org>
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

On 2020-11-13 16:51, Johannes Berg wrote:
> On Fri, 2020-11-13 at 16:51 +0800, Wen Gong wrote:
> 
>> yes.
>> It can add check with supp_rates[band] of ieee80211_sta for
>> NL80211_IFTYPE_STATION type.
>> for others, check with sdata->vif.bss_conf.basic_rates
> 
> Right.
> 
> Though, might need to check that only if there's no TDLS station or
> something?
> 
yes, I think it should do like that for TDLS:
test_sta_flag(sta, WLAN_STA_TDLS_PEER)
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
