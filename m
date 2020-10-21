Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVHle-00039O-Sk
 for ath11k@lists.infradead.org; Wed, 21 Oct 2020 17:19:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCHv2 1/2] nl80211: vendor-cmd: qca: add command for ap power
 save
References: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 <4b4a0d79a243c1c3b8044730da0493c96ba294bf.camel@sipsolutions.net>
 <871rilf2th.fsf@codeaurora.org>
 <dbaa655c3f15f800f73b7c19f2b1a054@codeaurora.org>
Date: Wed, 21 Oct 2020 20:19:10 +0300
In-Reply-To: <dbaa655c3f15f800f73b7c19f2b1a054@codeaurora.org>
 (vnaralas@codeaurora.org's message of "Tue, 29 Sep 2020 18:09:44
 +0530")
Message-ID: <87eelr1oq9.fsf@codeaurora.org>
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
To: vnaralas@codeaurora.org
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

vnaralas@codeaurora.org writes:

> On 2020-09-29 13:10, Kalle Valo wrote:
>> Johannes Berg <johannes@sipsolutions.net> writes:
>>
>>> On Mon, 2020-08-24 at 13:56 +0530, Venkateswara Naralasetty wrote:
>>>> AP power save feature is to save power in AP mode, where AP goes
>>>> to power save mode when no stations associate to it and comes out
>>>> of power save when any station associate to AP.
>>>
>>> Why do you think this requires a vendor command? I mean, that seems
>>> like
>>> fairly reasonable - even by default - behaviour?
>>
>> I have not studied the details, but doesn't AP power save break normal
>> functionality? For example, I would guess probe requests from clients
>> would be lost. So there's a major drawback when enabling this, right?
>
> This AP power save feature will not break any functionality, Since one
> chain is always active and all other chains will be disabled when this
> feature is enabled. AP can still be able to beacon and receive probe
> request from the clients. The only drawback is reduced network range
> when this feature is enabled. Hence, we don't want to enable it by
> default.

Yeah, we really would not want to enable that by default. But what
should be the path forward, a vendor command or a proper nl80211
command? Any opinions?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
