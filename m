Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <9a1d7a6651d3bf6c4a43c5bc8659df690c009328.camel@sipsolutions.net>
Subject: Re: [PATCH v3 0/3] mac80211/ath11k: HE mesh support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 12 Jul 2019 11:42:51 +0200
In-Reply-To: <2019422.XptUlqRJNA@bentobox>
References: <20190612193510.29489-1-sven@narfation.org>
 <1610842.TRhm9evnVP@bentobox>
 <06c7c1a2c8d0f955cb107475d17587c156fb19de.camel@sipsolutions.net>
 <2019422.XptUlqRJNA@bentobox>
Mime-Version: 1.0
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
To: Sven Eckelmann <sven@narfation.org>
Cc: hostap@lists.infradead.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Fri, 2019-07-12 at 11:36 +0200, Sven Eckelmann wrote:
> 
> There is already a workaround for that in the hostap testcases:
> 
>     if all_cap_one:
>         # It looks like tshark parser was broken at some point for
>         # wlan.mesh.config.cap which is now (tshark 2.6.3) pointing to incorrect
>         # field (same as wlan.mesh.config.ps_protocol). This used to work with
>         # tshark 2.2.6.
>         #
>         # For now, assume the capability field ends up being the last octet of
>         # the frame.

> But maybe you already spotted the problem - it requires that mesh 
> configuration element is the last element. Which is not the case here - 
> similar to 5GHz tests (where you have most likely a VHT cap/oper element 
> after the meshconf_ie).
> 
> I hope that this makes more sense now.

Ah, yes, it does. So I guess we need to update/fix that workaround. And
I guess newer tshark (which you used) is fixed again, if I understand
correctly?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
