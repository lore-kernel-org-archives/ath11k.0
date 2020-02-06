Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izd71-0002Wz-70
 for ath11k@lists.infradead.org; Thu, 06 Feb 2020 09:06:16 +0000
Received: by mail-pg1-x541.google.com with SMTP id b9so2390964pgk.12
 for <ath11k@lists.infradead.org>; Thu, 06 Feb 2020 01:06:14 -0800 (PST)
Subject: Re: [PATCH V2 1/3] nl80211: add support for setting fixed HE
 rate/gi/ltf
References: <20200204103514.18111-1-john@phrozen.org>
 <4bf4c267-bfc2-1a04-f2d6-541f086e72c0@broadcom.com>
 <1b74ca8c-3bed-6296-5b3d-1ece82b4a56e@phrozen.org>
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5d96b4b5-dcbd-30da-754c-685619ea671e@broadcom.com>
Date: Thu, 6 Feb 2020 10:06:06 +0100
MIME-Version: 1.0
In-Reply-To: <1b74ca8c-3bed-6296-5b3d-1ece82b4a56e@phrozen.org>
Content-Language: en-US
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
To: John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org



On 2/6/2020 10:04 AM, John Crispin wrote:
> On 06/02/2020 09:58, Arend Van Spriel wrote:
>> On 2/4/2020 11:35 AM, John Crispin wrote:
>>> From: Miles Hu <milehu@codeaurora.org>
>>>
>>> This patch adds the nl80211 structs, definitions, policies and parsing
>>> code required to pass fixed HE rate, gi and ltf settings.
>>>
>>> Signed-off-by: John Crispin <john@phrozen.org>
>>> Signed-off-by: Miles Hu <milehu@codeaurora.org>
>>> ---
>>> Changes in V2
>>> * add more policies
>>> * reoder enums
>>> * remove incorrect he_cap from ieee80211_supported_band
>>
>> Not seeing the change listed above or am I missing something?
>>
>> Regards,
>> Arend
> 
> Hi Arend,
> that is the delta to V1 as per Johannes's feedback. Not additional 
> code/features

Guess I was missing context ;-)

Thanks,
Arend

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
