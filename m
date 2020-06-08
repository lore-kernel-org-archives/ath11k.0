Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiFa4-0003Hk-Sp
 for ath11k@lists.infradead.org; Mon, 08 Jun 2020 11:04:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 0/8] add 6GHz radio support in ath11k driver
References: <20200603001724.12161-1-pradeepc@codeaurora.org>
 <871rmwl2d6.fsf@codeaurora.org>
 <97dabee94c4faecbc83bbd02baf3a798@codeaurora.org>
Date: Mon, 08 Jun 2020 14:04:29 +0300
In-Reply-To: <97dabee94c4faecbc83bbd02baf3a798@codeaurora.org> (Pradeep Kumar
 Chitrapu's message of "Wed, 03 Jun 2020 10:50:53 -0700")
Message-ID: <87k10hkede.fsf@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> writes:

> On 2020-06-03 06:12, Kalle Valo wrote:
>> Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> writes:
>>
>>> This patch series adds 6GHz frequency listing in ath11k driver and
>>> mac80211
>>> registration for the 6GHz band. Also, extends some of wmi command
>>> tlvs for
>>> supporting 6GHz.
>>>
>>> changes in v5:
>>>  - latest 6ghz patches on mac80211 expects driver not to pass ht/vht
>>>    caps for 6GHZ band at device registration. so fix that.
>>
>> What are the dependencies for this patch? Is everything that is in
>> mac80211-next as of today enough?
>
> Yes Kalle. current mac80211-next is enough.
>
>>
>> Also what I do with Rajkumar's patch:
>>
>> [PATCH] ath11k: build HE 6 GHz capability
>>
>> Should I apply it before or after this patchset?
>
> Although there is no compile dependency with above patchset, there
> will be 6ghz functionality dependency with above. So, IMO, its better
> to apply after this patch set.

Ok, thanks.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
