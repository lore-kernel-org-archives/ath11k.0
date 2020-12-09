Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn1jW-0007S7-VC
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 15:50:27 +0000
Received: by mail-ed1-x542.google.com with SMTP id cm17so2082806edb.4
 for <ath11k@lists.infradead.org>; Wed, 09 Dec 2020 07:50:26 -0800 (PST)
MIME-Version: 1.0
References: <XEttDWCeuyBOzI9ypOwPDrgK-gUENAtY06t0CLx9viSsEPSQ6RAibULAYL2Vl_DuxN1HXhqlRlsmhdZstp1aoh8wrT_YZt8arK6PuS457Lo=@mitchellnordine.com>
 <CAHUdJJW0wfXQdCJgew8PC+=mk3pBCUaRFXXWARmFNZhogCyABg@mail.gmail.com>
 <CAHUdJJUjts8xFOAuULO-j=vft5BS4ijz1Lk6A1YrBfR-=MPFRQ@mail.gmail.com>
 <87r1nz9emq.fsf@codeaurora.org>
 <CAHUdJJWpxVCz1S1AcoNGjCcKGCuRXsJqZZtx4=rpev2nOc-dGQ@mail.gmail.com>
In-Reply-To: <CAHUdJJWpxVCz1S1AcoNGjCcKGCuRXsJqZZtx4=rpev2nOc-dGQ@mail.gmail.com>
From: wi nk <wink@technolu.st>
Date: Wed, 9 Dec 2020 16:50:14 +0100
Message-ID: <CAHUdJJVppFpTnE+HPwL7GcBQOLm0FTQn-0CS9X73YAXWS26GEQ@mail.gmail.com>
Subject: Re: ath11k: QCA6390 on Dell XPS 13 and kernel crashes
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, Mitchell Nordine <mail@mitchellnordine.com>

On Wed, Dec 9, 2020 at 4:39 PM wi nk <wink@technolu.st> wrote:
>
> On Wed, Dec 9, 2020 at 4:35 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> >
> > wi nk <wink@technolu.st> writes:
> >
> > > So I've managed to stabilise my system now, so either the race is
> > > gone, or I've done something to win it all the time.  So one of the
> > > avenues of racing I was chasing at first was in the ath11k driver
> > > itself.  There are a couple areas where the single/shared IRQ is being
> > > forcibly toggled in ways that the documentation says are not great
> > > (and the original patch was trying to avoid).  Fixing those didn't
> > > seem to have much impact on the stability of things (I've included
> > > those changes in my patch though).  After the last email I was
> > > thinking about the MHI side of things a bit more and found a number of
> > > call sites that my naive grepping had missed that do the same thing,
> > > but via acquiring a lock at the same time.  I modified all the calls
> > > to *_lock_irq and *_unlock_irq to the lock/unlock - save/restore
> > > variants that accept the flags parameter to capture state.  I've now
> > > booted and loaded the driver 10+ times without a single freeze or
> > > crash.  I'm not sure all of those modifications are necessary (ie:
> > > which things are re-entrant in this single interrupt operating mode vs
> > > which ones can use the simpler lock/unlock mechanisms), so I could use
> > > some advice/guidance there.
> > >
> > > Mitchell - if you want to grab this patch and try it, let me know how
> > > it goes and I can clean it up for the mailing list:
> > > https://github.com/w1nk/ath11k-debug/blob/master/one-irq-manage.patch
> > > (apply to ath11k-qca6390-bringup-202011301608)
> >
> > Wink, I want to ask more about your the very interesting
> > one-irq-manage.patch you wrote. Have you seen the "sched: RT throttling
> > activated" crash with that patch? If yes, how many times, for example 5
> > out of 10 times or something like that?
> >
> > Or is it so with one-irq-manage.patch the kernel doesn't crash at all? I
> > didn't quite understand the situation.
> >
> > --
> > https://patchwork.kernel.org/project/linux-wireless/list/
> >
> > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> Kalle,
>
>    Sorry for moving the thread :).  So I've attempted 2 patches that
> seem to produce varying degrees of success.  The single IRQ patch took
> the crashing behaviour from hard locking immediately, to that
> stuttering / RT throttling message consistently.  So instead of hard
> locking 9/10 times and stuttering 1/10, it was inverted.
>
> The second patch disabling the m2 transition (even without the single
> IRQ patch) seems to have resolved the issues altogether, but at the
> expense of disabling this m2 state, which I don't have much idea of
> the consequences..

Sorry one more point of clarification, after the first patch I made, I
was able to always bring the adapter up while not on the charger.  I
didn't test that mode on an unmodified bringup branch.  I suspect it
would eventually crash though and I just modified some of the racing
parameters, I can confirm that if it'd be useful information for you.
It seems the key is that sometimes, something is causing this M2 state
transition (so in my original observation, plugging in the charger)
and that in the majority of the time, that state transition causes the
EE to become invalid and then everything goes sideways.  It does seem
like the adapter can successfully survive the transition occasionally,
just not often.  Preventing the transition entirely seems to keep the
race from ever occurring, but doesn't solve it really.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
