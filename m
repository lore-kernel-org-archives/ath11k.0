Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgXXY-0001Tu-CG
 for ath11k@lists.infradead.org; Wed, 03 Jun 2020 17:51:02 +0000
MIME-Version: 1.0
Date: Wed, 03 Jun 2020 10:50:53 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Subject: Re: [PATCH v5 0/8] add 6GHz radio support in ath11k driver
In-Reply-To: <871rmwl2d6.fsf@codeaurora.org>
References: <20200603001724.12161-1-pradeepc@codeaurora.org>
 <871rmwl2d6.fsf@codeaurora.org>
Message-ID: <97dabee94c4faecbc83bbd02baf3a798@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-03 06:12, Kalle Valo wrote:
> Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> writes:
> 
>> This patch series adds 6GHz frequency listing in ath11k driver and 
>> mac80211
>> registration for the 6GHz band. Also, extends some of wmi command tlvs 
>> for
>> supporting 6GHz.
>> 
>> changes in v5:
>>  - latest 6ghz patches on mac80211 expects driver not to pass ht/vht
>>    caps for 6GHZ band at device registration. so fix that.
> 
> What are the dependencies for this patch? Is everything that is in
> mac80211-next as of today enough?
Yes Kalle. current mac80211-next is enough.

> 
> Also what I do with Rajkumar's patch:
> 
> [PATCH] ath11k: build HE 6 GHz capability
> 
> Should I apply it before or after this patchset?
Although there is no compile dependency with above patchset,
there will be 6ghz functionality dependency with above. So, IMO, its 
better
to apply after this patch set.

Thanks
Pradeep

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
