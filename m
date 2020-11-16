Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keaqF-0003Pr-Vn
 for ath11k@lists.infradead.org; Mon, 16 Nov 2020 09:30:33 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Fwd: XPS 9310 MSI vectors patch for ath11k
References: <CAJxb_EpOy-CqJhodHMcBDuOgeQoZrtims9stB4uGxz7kCz_Y7Q@mail.gmail.com>
 <877dqn3m3t.fsf@codeaurora.org>
 <CAJxb_EoTvUV3Bwq4O7DMS1AgvWD3VLq9e5Z_Y8FeGbSFxmvzbg@mail.gmail.com>
 <CAJxb_Eq1NemrYh+DzrOiRfagZpcF5E4de=JPuU1EhspFF2nCWA@mail.gmail.com>
 <87zh3i1khe.fsf@codeaurora.org>
 <CAJxb_ErL6NhWNxp_yxFmTqB9v1q3VL399+V+yL4n3L1aBWuocQ@mail.gmail.com>
Date: Mon, 16 Nov 2020 11:30:15 +0200
In-Reply-To: <CAJxb_ErL6NhWNxp_yxFmTqB9v1q3VL399+V+yL4n3L1aBWuocQ@mail.gmail.com>
 (Mitchell Nordine's message of "Sun, 15 Nov 2020 23:12:41 +0100")
Message-ID: <87ima51wew.fsf@codeaurora.org>
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
To: Mitchell Nordine <mitchell.nordine@gmail.com>
Cc: ath11k@lists.infradead.org

(adding back ath11k list, please don't drop it so that others can also
see and participate the discussion)

Mitchell Nordine <mitchell.nordine@gmail.com> writes:

>> To pinpoint the problem can you try Carl's suggestion adding
>> "memmap=12M\$20M" to kernel parameters:
>>
>> http://lists.infradead.org/pipermail/ath11k/2020-November/000686.html
>>
>> Let me know how it goes.
>
> Thanks for the suggestion. I have given this a go but haven't noticed
> any change in behaviour.

Ok, thanks for testing.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
