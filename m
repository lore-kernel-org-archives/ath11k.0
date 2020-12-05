Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kld3c-00040D-Me
 for ath11k@lists.infradead.org; Sat, 05 Dec 2020 19:17:26 +0000
Received: by mail-ej1-x643.google.com with SMTP id ga15so13649044ejb.4
 for <ath11k@lists.infradead.org>; Sat, 05 Dec 2020 11:17:21 -0800 (PST)
MIME-Version: 1.0
References: <87tut6iy39.fsf@codeaurora.org>
 <CAHUdJJWA=XqYUwYk9deK3UTr9S03rM3L8YZ9_DHJyKh-CVgW-w@mail.gmail.com>
 <CAHUdJJX6_K9X4HeKDg6459atJL=QBo1ouwGWYs6Vk4BMpf5TPw@mail.gmail.com>
In-Reply-To: <CAHUdJJX6_K9X4HeKDg6459atJL=QBo1ouwGWYs6Vk4BMpf5TPw@mail.gmail.com>
From: wi nk <wink@technolu.st>
Date: Sat, 5 Dec 2020 20:17:10 +0100
Message-ID: <CAHUdJJX6JWbNY+=B2D1fFGZPqzbJSw0V0C2i+bZ=xabE56cv_A@mail.gmail.com>
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
Cc: Thomas Krause <thomaskrause@posteo.de>, ath11k@lists.infradead.org

On Tue, Dec 1, 2020 at 11:17 AM wi nk <wink@technolu.st> wrote:
>
> On Mon, Nov 30, 2020 at 6:02 PM wi nk <wink@technolu.st> wrote:
> >
> > On Mon, Nov 30, 2020 at 5:55 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> > >
> > > Hi Wi and Thomas,
> > >
> > > I'll start a new thread about problems on XPS 13. The information is
> > > scattered to different threads and hard to find everything, it's much
> > > easier to have everything in one place. So let's continue the discussion
> > > about the kernel crashes on this thread.
> > >
> > > Here's what I have understood so far:
> > >
> > > * On Dell XPS 15 there are no issues with QCA6390 and it seems to work
> > >   with 32 MSI vectors.
> > >
> > > * On Dell XPS 13 there's a BIOS bug and kernel prints:
> > >
> > > [    0.050130] DMAR: [Firmware Bug]: Your BIOS is broken; DMAR reported at address 0!
> > >                BIOS vendor: Dell Inc.; Ver: 1.1.1; Product Version:
> > >
> > > * Because of this BIOS bug QCA6390 only gets one MSI vector on Dell XPS
> > >   13. We added a hack to ath11k make it work with only vector and after
> > >   that it's possible to boot the firmware, connect to the AP and use the
> > >   device for a while.
> > >
> > > * But the problem now is that the kernel is crashing almost immediately
> > >   and almost every time(?). And these crashes only happen on Dell XPS
> > >   13, all other systems (including Dell XPS 15) seem to work without
> > >   issues.
> > >
> > > Is my understanding correct? Did I miss anything?
> > >
> > > About the symptoms Wi reports:
> > >
> > > ----------------------------------------------------------------------
> > > So up until this point, everything is working without issues.
> > > Everything seems to spiral out of control a couple of seconds later
> > > when my system attempts to actually bring up the adapter.  In most of
> > > the crash states I will see this:
> > >
> > > [   31.286725] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
> > > [   31.390187] wlp85s0: send auth to ec:08:6b:27:01:ea (try 2/3)
> > > [   31.391928] wlp85s0: authenticated
> > > [   31.394196] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
> > > [   31.396513] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
> > > (capab=0x411 status=0 aid=6)
> > > [   31.407730] wlp85s0: associated
> > > [   31.434354] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready
> > >
> > > And then either somewhere in that pile of messages, or a second or two
> > > after this my machine will start to stutter as I mentioned before, and
> > > then it either hangs, or I see this message (I'm truncating the
> > > timestamp):
> > >
> > > [   35.xxxx ] sched: RT throttling activated
> > >
> > > After that moment, the machine is unresponsive.  Sorry I can't seem to
> > > extract this data other than screenshots from my phone at the moment,
> > > you can see the dmesg output from 6 different hangs here:
> > >
> > > https://github.com/w1nk/ath11k-debug
> > > ----------------------------------------------------------------------
> > >
> > > And Thomas Krause reports:
> > >
> > > --------------------------------------------------------------------------------
> > > I can confirm this behavior on my configuration. I managed to login
> > > once and select the Wifi and connect to it. It seemed curiously enough
> > > be stable long enough to enter the Wifi passphrase. After the
> > > connection was established, the system hang and on each attempt to
> > > reboot into the graphical system it would freeze at some point
> > > (sometimes even before showing the login screen).
> > > ----------------------------------------------------------------------
> > >
> > > --
> > > https://patchwork.kernel.org/project/linux-wireless/list/
> > >
> > > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> >
> > Hi Kalle,
> >
> >   Again, thanks much for your work.  I think you've summarized
> > everything up until this point.  On my XPS 13 9310 The behavior of the
> > RT throttling still exists for me occasionally on loading the
> > driver/associating with an AP.  The throttling consistently occurs
> > after a few sets of the MHI debug printing showing the EE entering an
> > invalid state ( AMSS -> INVALID_EE ).  I'm now building the latest tag
> > to see if there are any differences.
> >
> > Thanks!
>
> Just to follow up, the first boot resulted in the RT throttling
> message as the adapter was coming up/associating, shortly after the
> firmware crashed and the kernel didn't fully freeze, but I needed to(
> reboot to bring the adapter back.

Kalle -

  I've noticed one additional behavior that may give someone with
familiarity with the QCA hardware a clue.  I'm running
ath11k-qca6390-bringup-202011301608 on the dell xps 13 9310.  For
whatever reason, having the bluetooth subsystem enabled (with a paired
device) on this dell basically guarantees I'll hit the scheduler
throttling issue as the ath11k driver is initializing / associating.
The bluetooth system is using the btqca driver.  I don't have any
useful debugging (I'll gladly collect some if there is a way to do it)
other than tracking some simple statistics.  I booted my system 20
times, 10 times with bluetooth enabled ((and some headphones turned on
ready to pair), and 10 times without.  In both scenarios, I'm booting
into X and manually modprobing the ath11k driver.  The difference is
that with bluetooth on and by the time I modprobe the driver, the
headphones are paired and I received the throttling message and
subsequent freezing 10/10 times.  With bluetooth off / my headphones
not paired, I only saw it 2/10.  I know it's not much hard information
but it's reliably reproducible for me, is there anything useful I can
collect?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
