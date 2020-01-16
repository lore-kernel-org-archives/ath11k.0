Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is5TL-00075l-9C
 for ath11k@lists.infradead.org; Thu, 16 Jan 2020 13:46:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH -next] mac80111: fix build error without
 CONFIG_ATH11K_DEBUGFS
References: <20200116125155.166749-1-chenzhou10@huawei.com>
 <d9e0af66e2d8cb26ef595e1a2133f55567f4b5e0.camel@sipsolutions.net>
 <943b570c-48f9-fe5b-1691-37539e3eeec8@huawei.com>
Date: Thu, 16 Jan 2020 15:45:56 +0200
In-Reply-To: <943b570c-48f9-fe5b-1691-37539e3eeec8@huawei.com> (Chen Zhou's
 message of "Thu, 16 Jan 2020 21:35:44 +0800")
Message-ID: <87lfq7zf8r.fsf@tynnyri.adurom.net>
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
To: Chen Zhou <chenzhou10@huawei.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org

+ ath11k

Chen Zhou <chenzhou10@huawei.com> writes:

> Hi johannes,
>
> On 2020/1/16 20:59, Johannes Berg wrote:
>> On Thu, 2020-01-16 at 20:51 +0800, Chen Zhou wrote:
>>> If CONFIG_ATH11K_DEBUGFS is n, build fails:
>>>
>>> drivers/net/wireless/ath/ath11k/debugfs_sta.c: In function ath11k_dbg_sta_open_htt_peer_stats:
>>> drivers/net/wireless/ath/ath11k/debugfs_sta.c:416:4: error: struct ath11k has no member named debug
>>>   ar->debug.htt_stats.stats_req = stats_req;
>>>       ^~
>>> and many more similar messages.
>>>
>>> Select ATH11K_DEBUGFS under config MAC80211_DEBUGFS to fix this.
>> 
>> Heh, no. You need to find a way in ath11 to fix this.
>
> In file drivers/net/wireless/ath/ath11k/Makefile, "ath11k-$(CONFIG_MAC80211_DEBUGFS) += debugfs_sta.o",
> that is, debugfs_sta only compiled when CONFIG_MAC80211_DEBUGFS is y.
>
> Any suggestions about this?

Arnd already fixed this:

https://patchwork.kernel.org/patch/11321921/

I'm planning to apply the patch soon.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
