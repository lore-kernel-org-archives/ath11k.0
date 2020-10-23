Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVo2q-0002kx-Ig
 for ath11k@lists.infradead.org; Fri, 23 Oct 2020 03:47:14 +0000
MIME-Version: 1.0
Date: Fri, 23 Oct 2020 09:17:09 +0530
From: vnaralas@codeaurora.org
Subject: Re: [PATCHv2 1/2] nl80211: vendor-cmd: qca: add command for ap power
 save
In-Reply-To: <f6c148a3-73de-1481-5f63-2deecb599468@broadcom.com>
References: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 <4b4a0d79a243c1c3b8044730da0493c96ba294bf.camel@sipsolutions.net>
 <871rilf2th.fsf@codeaurora.org>
 <dbaa655c3f15f800f73b7c19f2b1a054@codeaurora.org>
 <87eelr1oq9.fsf@codeaurora.org>
 <f6c148a3-73de-1481-5f63-2deecb599468@broadcom.com>
Message-ID: <81ced18ac5b87a17cf31797cf91669bc@codeaurora.org>
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
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On 2020-10-22 13:30, Arend Van Spriel wrote:
> On 10/21/2020 7:19 PM, Kalle Valo wrote:
>> vnaralas@codeaurora.org writes:
>> 
>>> On 2020-09-29 13:10, Kalle Valo wrote:
>>>> Johannes Berg <johannes@sipsolutions.net> writes:
>>>> 
>>>>> On Mon, 2020-08-24 at 13:56 +0530, Venkateswara Naralasetty wrote:
>>>>>> AP power save feature is to save power in AP mode, where AP goes
>>>>>> to power save mode when no stations associate to it and comes out
>>>>>> of power save when any station associate to AP.
>>>>> 
>>>>> Why do you think this requires a vendor command? I mean, that seems
>>>>> like
>>>>> fairly reasonable - even by default - behaviour?
>>>> 
>>>> I have not studied the details, but doesn't AP power save break 
>>>> normal
>>>> functionality? For example, I would guess probe requests from 
>>>> clients
>>>> would be lost. So there's a major drawback when enabling this, 
>>>> right?
>>> 
>>> This AP power save feature will not break any functionality, Since 
>>> one
>>> chain is always active and all other chains will be disabled when 
>>> this
>>> feature is enabled. AP can still be able to beacon and receive probe
>>> request from the clients. The only drawback is reduced network range
>>> when this feature is enabled. Hence, we don't want to enable it by
>>> default.
>> 
>> Yeah, we really would not want to enable that by default. But what
>> should be the path forward, a vendor command or a proper nl80211
>> command? Any opinions?
> 
> I would go for a proper nl80211 command or just add an attribute for
> use in NL80211_CMD_START_AP or deal with NL80211_CMD_SET_POWERSAVE
> when operating in AP mode.
> 
Sure, I will go with the existing NL80211_CMD_SET_POWERSAVE and I will 
send next version.

> Regards,
> Arend

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
