Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn1Ux-0005Xr-Hd
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 15:35:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k: QCA6390 on Dell XPS 13 and kernel crashes
References: <XEttDWCeuyBOzI9ypOwPDrgK-gUENAtY06t0CLx9viSsEPSQ6RAibULAYL2Vl_DuxN1HXhqlRlsmhdZstp1aoh8wrT_YZt8arK6PuS457Lo=@mitchellnordine.com>
 <CAHUdJJW0wfXQdCJgew8PC+=mk3pBCUaRFXXWARmFNZhogCyABg@mail.gmail.com>
 <CAHUdJJUjts8xFOAuULO-j=vft5BS4ijz1Lk6A1YrBfR-=MPFRQ@mail.gmail.com>
Date: Wed, 09 Dec 2020 17:35:09 +0200
In-Reply-To: <CAHUdJJUjts8xFOAuULO-j=vft5BS4ijz1Lk6A1YrBfR-=MPFRQ@mail.gmail.com>
 (wi nk's message of "Sun, 6 Dec 2020 22:45:29 +0100")
Message-ID: <87r1nz9emq.fsf@codeaurora.org>
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
To: wi nk <wink@technolu.st>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, Mitchell Nordine <mail@mitchellnordine.com>

wi nk <wink@technolu.st> writes:

> So I've managed to stabilise my system now, so either the race is
> gone, or I've done something to win it all the time.  So one of the
> avenues of racing I was chasing at first was in the ath11k driver
> itself.  There are a couple areas where the single/shared IRQ is being
> forcibly toggled in ways that the documentation says are not great
> (and the original patch was trying to avoid).  Fixing those didn't
> seem to have much impact on the stability of things (I've included
> those changes in my patch though).  After the last email I was
> thinking about the MHI side of things a bit more and found a number of
> call sites that my naive grepping had missed that do the same thing,
> but via acquiring a lock at the same time.  I modified all the calls
> to *_lock_irq and *_unlock_irq to the lock/unlock - save/restore
> variants that accept the flags parameter to capture state.  I've now
> booted and loaded the driver 10+ times without a single freeze or
> crash.  I'm not sure all of those modifications are necessary (ie:
> which things are re-entrant in this single interrupt operating mode vs
> which ones can use the simpler lock/unlock mechanisms), so I could use
> some advice/guidance there.
>
> Mitchell - if you want to grab this patch and try it, let me know how
> it goes and I can clean it up for the mailing list:
> https://github.com/w1nk/ath11k-debug/blob/master/one-irq-manage.patch
> (apply to ath11k-qca6390-bringup-202011301608)

Wink, I want to ask more about your the very interesting
one-irq-manage.patch you wrote. Have you seen the "sched: RT throttling
activated" crash with that patch? If yes, how many times, for example 5
out of 10 times or something like that?

Or is it so with one-irq-manage.patch the kernel doesn't crash at all? I
didn't quite understand the situation.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
