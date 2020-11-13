Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <820f10c46841ac79c78d5952ebbc816fd710b4fd.camel@sipsolutions.net>
Subject: Re: [PATCH v2] mac80211: reject/clear user rate mask if not usable
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 13 Nov 2020 10:23:05 +0100
In-Reply-To: <bc1db8cd25acd698ec586ed11c9865ac@codeaurora.org>
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
 <6caaa87ba3f37bd424e92d03c2340689@codeaurora.org>
 <e4bd954afa503835e072ef71aa61c59e04ecbc40.camel@sipsolutions.net>
 <bc1db8cd25acd698ec586ed11c9865ac@codeaurora.org>
MIME-Version: 1.0
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
To: Wen Gong <wgong@codeaurora.org>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>, kirtika@google.com, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org


> > Yes but you have to iterate all the stations and check they belong to
> > the interface and all that I think?
> > 
> Maybe not need.
> if NL80211_IFTYPE_STATION and NON-WLAN_STA_TDLS_PEER, it has only 1 
> station for the ieee80211_vif
> by my understand.

Well, yes, but there's no counter.

So you need to iterate to see if there are any additional TDLS peers (in
addition to the STA entry for the AP).

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
