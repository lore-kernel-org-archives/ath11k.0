Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knhX4-0001lQ-Cj
 for ath11k@lists.infradead.org; Fri, 11 Dec 2020 12:28:24 +0000
Received: by mail-ed1-x542.google.com with SMTP id h16so9142028edt.7
 for <ath11k@lists.infradead.org>; Fri, 11 Dec 2020 04:28:20 -0800 (PST)
MIME-Version: 1.0
References: <XEttDWCeuyBOzI9ypOwPDrgK-gUENAtY06t0CLx9viSsEPSQ6RAibULAYL2Vl_DuxN1HXhqlRlsmhdZstp1aoh8wrT_YZt8arK6PuS457Lo=@mitchellnordine.com>
 <CAHUdJJW0wfXQdCJgew8PC+=mk3pBCUaRFXXWARmFNZhogCyABg@mail.gmail.com>
 <CAHUdJJUjts8xFOAuULO-j=vft5BS4ijz1Lk6A1YrBfR-=MPFRQ@mail.gmail.com>
 <87r1nz9emq.fsf@codeaurora.org>
 <CAHUdJJWpxVCz1S1AcoNGjCcKGCuRXsJqZZtx4=rpev2nOc-dGQ@mail.gmail.com>
 <87mtyn9dx0.fsf@codeaurora.org>
 <CAHUdJJWNSKw9aAHQBc8Ftne1J+s5KdVfdMLwgWu+g-ZfeDnitA@mail.gmail.com>
 <CAHUdJJXiDUc7ovAo8KbWxo_FEdniN4hXo67M9w6979QdNXeMfA@mail.gmail.com>
In-Reply-To: <CAHUdJJXiDUc7ovAo8KbWxo_FEdniN4hXo67M9w6979QdNXeMfA@mail.gmail.com>
From: wi nk <wink@technolu.st>
Date: Fri, 11 Dec 2020 13:28:08 +0100
Message-ID: <CAHUdJJXsduncuuA-Q=4A0mo=vO9z2zBe0=x5SBd7+J1eSQKZ8Q@mail.gmail.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Stephen Liang <stephenliang7@gmail.com>, Mitchell Nordine <mail@mitchellnordine.com>, Carl Huang <cjhuang@codeaurora.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>

On Wed, Dec 9, 2020 at 10:46 PM wi nk <wink@technolu.st> wrote:
>
> On Wed, Dec 9, 2020 at 4:55 PM wi nk <wink@technolu.st> wrote:
> >
> > On Wed, Dec 9, 2020 at 4:50 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> > >
> > > wi nk <wink@technolu.st> writes:
> > >
> > > > On Wed, Dec 9, 2020 at 4:35 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> > > >>
> > > >> wi nk <wink@technolu.st> writes:
> > > >>
> > > >> > So I've managed to stabilise my system now, so either the race is
> > > >> > gone, or I've done something to win it all the time.  So one of the
> > > >> > avenues of racing I was chasing at first was in the ath11k driver
> > > >> > itself.  There are a couple areas where the single/shared IRQ is being
> > > >> > forcibly toggled in ways that the documentation says are not great
> > > >> > (and the original patch was trying to avoid).  Fixing those didn't
> > > >> > seem to have much impact on the stability of things (I've included
> > > >> > those changes in my patch though).  After the last email I was
> > > >> > thinking about the MHI side of things a bit more and found a number of
> > > >> > call sites that my naive grepping had missed that do the same thing,
> > > >> > but via acquiring a lock at the same time.  I modified all the calls
> > > >> > to *_lock_irq and *_unlock_irq to the lock/unlock - save/restore
> > > >> > variants that accept the flags parameter to capture state.  I've now
> > > >> > booted and loaded the driver 10+ times without a single freeze or
> > > >> > crash.  I'm not sure all of those modifications are necessary (ie:
> > > >> > which things are re-entrant in this single interrupt operating mode vs
> > > >> > which ones can use the simpler lock/unlock mechanisms), so I could use
> > > >> > some advice/guidance there.
> > > >> >
> > > >> > Mitchell - if you want to grab this patch and try it, let me know how
> > > >> > it goes and I can clean it up for the mailing list:
> > > >> > https://github.com/w1nk/ath11k-debug/blob/master/one-irq-manage.patch
> > > >> > (apply to ath11k-qca6390-bringup-202011301608)
> > > >>
> > > >> Wink, I want to ask more about your the very interesting
> > > >> one-irq-manage.patch you wrote. Have you seen the "sched: RT throttling
> > > >> activated" crash with that patch? If yes, how many times, for example 5
> > > >> out of 10 times or something like that?
> > > >>
> > > >> Or is it so with one-irq-manage.patch the kernel doesn't crash at all? I
> > > >> didn't quite understand the situation.
> > > >>
> > > >> --
> > > >> https://patchwork.kernel.org/project/linux-wireless/list/
> > > >>
> > > >> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> > > >
> > > > Kalle,
> > > >
> > > >    Sorry for moving the thread :).
> > >
> > > No problem, I'll just make extra questions to make sure that I'm
> > > understanding things correctly :)
> > >
> > > > So I've attempted 2 patches that seem to produce varying degrees of
> > > > success. The single IRQ patch took the crashing behaviour from hard
> > > > locking immediately, to that stuttering / RT throttling message
> > > > consistently. So instead of hard locking 9/10 times and stuttering
> > > > 1/10, it was inverted.
> > >
> > > Ok, got it now.
> > >
> > > > The second patch disabling the m2 transition (even without the single
> > > > IRQ patch) seems to have resolved the issues altogether, but at the
> > > > expense of disabling this m2 state, which I don't have much idea of
> > > > the consequences..
> > >
> > > Sorry, I have missed that. What second patch are you talking about?
> > >
> > > Also can you share your /proc/interrupts in full?
> > >
> > > --
> > > https://patchwork.kernel.org/project/linux-wireless/list/
> > >
> > > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> > >
> > > --
> > > ath11k mailing list
> > > ath11k@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/ath11k
> >
> > Here's interrupts in full , and the short patch after:
> >
> >             CPU0       CPU1       CPU2       CPU3       CPU4
> > CPU5       CPU6       CPU7
> >    0:          7          0          0          0          0
> > 0          0          0   IO-APIC    2-edge      timer
> >    1:          0          0          0          0          0
> > 0          0       2923   IO-APIC    1-edge      i8042
> >    8:          0          0          0          0          0
> > 0          0          0   IO-APIC    8-edge      rtc0
> >    9:          0       9290          0          0          0
> > 0          0          0   IO-APIC    9-fasteoi   acpi
> >   12:          0          0          0          0          0
> > 0         53          0   IO-APIC   12-edge      i8042
> >   14:          0      29816          0          0          0
> > 0          0          0   IO-APIC   14-fasteoi   INT34C5:00
> >   16:          0          0          0          0          0
> > 10376          0          0   IO-APIC   16-fasteoi   intel_ish_ipc,
> > i801_smbus, idma64.4
> >   27:          0          0          0          0          0
> > 0          0          0   IO-APIC   27-fasteoi   idma64.0,
> > i2c_designware.0
> >   31:          0          0          0          0          0
> > 0          0          0   IO-APIC   31-fasteoi   idma64.2,
> > i2c_designware.2
> >   32:          0          0          0          0          0
> > 0          0          0   IO-APIC   32-fasteoi   idma64.3,
> > i2c_designware.3
> >   40:       9681     777197      27906          0          0
> > 0          0          0   IO-APIC   40-fasteoi   idma64.1,
> > i2c_designware.1
> >  120:          0          0          0          0          0
> > 0          0          0   PCI-MSI 114688-edge      PCIe PME, pciehp
> >  121:          0          0          0          0          0
> > 0          0          0   PCI-MSI 118784-edge      PCIe PME, pciehp
> >  122:          0          0          0          0          0
> > 0          0          0   PCI-MSI 458752-edge      PCIe PME
> >  123:          0          0          0          0          0
> > 0          0          0   PCI-MSI 475136-edge      PCIe PME
> >  124:          0          0          1          0          0
> > 0          0          0   PCI-MSI 229376-edge      vmd
> >  125:          0          0          0         27          0
> > 0          0          0   PCI-MSI 229377-edge      vmd
> >  126:          0          0          0          0       4303
> > 0          0          0   PCI-MSI 229378-edge      vmd
> >  127:          0          0          0          0          0
> > 2992          0        434   PCI-MSI 229379-edge      vmd
> >  128:          0          0          0          0          0
> > 593       2504          0   PCI-MSI 229380-edge      vmd
> >  129:          0          0          0          0        699
> > 0       1061       1873   PCI-MSI 229381-edge      vmd
> >  130:       2382        394          0        603          0
> > 0          0          0   PCI-MSI 229382-edge      vmd
> >  131:          0       1670          0        406        646
> > 0          0          0   PCI-MSI 229383-edge      vmd
> >  132:        692          0       2903          0          0
> > 0          0          0   PCI-MSI 229384-edge      vmd
> >  133:          0        518        913       2198          0
> > 0          0          0   PCI-MSI 229385-edge      vmd
> >  134:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229386-edge      vmd
> >  135:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229387-edge      vmd
> >  136:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229388-edge      vmd
> >  137:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229389-edge      vmd
> >  138:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229390-edge      vmd
> >  139:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229391-edge      vmd
> >  140:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229392-edge      vmd
> >  141:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229393-edge      vmd
> >  142:          0          0          0          0          0
> > 0          0          0   PCI-MSI 229394-edge      vmd
> >  143:          0          0          0          0          0
> > 0          0          0   VMD-MSI  124  PCIe PME, aerdrv, pcie-dpc
> >  144:          0          0          0          0          0
> > 0          1          0   PCI-MSI 212992-edge      xhci_hcd
> >  145:          0          0          0          0          0
> > 0          0         72   PCI-MSI 327680-edge      xhci_hcd
> >  146:          6          0          0          0          0
> > 0          0          0   PCI-MSI 45088768-edge      rtsx_pci
> >  147:          0          0          0          0          0
> > 0          0          0   VMD-MSI  125  nvme0q0
> >  148:          0          0          0       1859          0
> > 0          0      38399   PCI-MSI 32768-edge      i915
> >  149:          0          0          0          0          0
> > 0          0          0   VMD-MSI  126  nvme0q1
> >  150:          0          0          0          0          0
> > 0          0          0   VMD-MSI  127  nvme0q2
> >  151:          0          0          0          0          0
> > 0          0          0   VMD-MSI  128  nvme0q3
> >  152:          0          0          0          0          0
> > 0          0          0   VMD-MSI  129  nvme0q4
> >  153:          0          0          0          0          0
> > 0          0          0   VMD-MSI  130  nvme0q5
> >  154:          0          0          0          0          0
> > 0          0          0   VMD-MSI  131  nvme0q6
> >  155:          0          0          0          0          0
> > 0          0          0   VMD-MSI  132  nvme0q7
> >  156:          0          0          0          0          0
> > 0          0          0   VMD-MSI  133  nvme0q8
> >  157:          0      29816          0          0          0
> > 0          0          0  INT34C5:00  327  DLL0945:00
> >  158:          0          0          0          0          0
> > 0         48          0   PCI-MSI 360448-edge      mei_me
> >  159:          0          0          0          0          0
> > 0          0       1134   PCI-MSI 514048-edge      AudioDSP
> >  162:          0          0          0     108102          0
> > 0          0          0   PCI-MSI 44564480-edge      ce0, ce1, ce2,
> > ce3, ce5, ce7, ce8, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ,
> > DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ, DP_EXT_IRQ,
> > DP_EXT_IRQ, bhi, mhi, mhi
> >  NMI:          0          0          0          0          0
> > 0          0          0   Non-maskable interrupts
> >  LOC:      64516      80387      54151      82574      64663
> > 113373      58033      81555   Local timer interrupts
> >  SPU:          0          0          0          0          0
> > 0          0          0   Spurious interrupts
> >  PMI:          0          0          0          0          0
> > 0          0          0   Performance monitoring interrupts
> >  IWI:          5          2          1        760          1
> > 1          0      16078   IRQ work interrupts
> >  RTR:          6          0          0          0          0
> > 0          0          0   APIC ICR read retries
> >  RES:       1834       7304       1432       1807       3015
> > 1552       1417       1498   Rescheduling interrupts
> >  CAL:      21739      26798      28934      22211      22590
> > 28622      22541      20023   Function call interrupts
> >  TLB:      51267      49182      59392      48384      46755
> > 56491      48103      46560   TLB shootdowns
> >  TRM:          2          2          2          2          2
> > 2          2          2   Thermal event interrupts
> >  THR:          0          0          0          0          0
> > 0          0          0   Threshold APIC interrupts
> >  DFR:          0          0          0          0          0
> > 0          0          0   Deferred Error APIC interrupts
> >  MCE:          0          0          0          0          0
> > 0          0          0   Machine check exceptions
> >  MCP:          3          4          4          4          4
> > 4          4          4   Machine check polls
> >  ERR:         16
> >  MIS:          0
> >  PIN:          0          0          0          0          0
> > 0          0          0   Posted-interrupt notification event
> >  NPI:          0          0          0          0          0
> > 0          0          0   Nested posted-interrupt event
> >  PIW:          0          0          0          0          0
> > 0          0          0   Posted-interrupt wakeup event
> >
> > and the modification that disables m2 state:
> >
> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > index 3de7b1639ec6..20f670c8b129 100644
> > --- a/drivers/bus/mhi/core/pm.c
> > +++ b/drivers/bus/mhi/core/pm.c
> > @@ -55,12 +55,12 @@ static struct mhi_pm_transitions const
> > dev_state_transitions[] = {
> >      },
> >      {
> >          MHI_PM_M0,
> > -        MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
> > +        MHI_PM_M0 | MHI_PM_M3_ENTER |
> >          MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> >          MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
> >      },
> >      {
> > -        MHI_PM_M2,
> > +        MHI_PM_M0,
> >          MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> >          MHI_PM_LD_ERR_FATAL_DETECT
> >      },
>
> Adding one more data point.  The driver will not crash on
> initialization this way, but also with the M2 state transition
> disabled the system survives suspend and wake and the adapter
> successfully reassociates consistently.  As expected with my patch,
> the MHI driver shows everything stays in the M1 state instead of
> attempting to transition to M2 ever.  It also doesn't return back to
> M0 if I disconnect the power / replug it.  I'm not sure what things
> are affected by me hacking this state machine, but avoiding that M2
> transition has removed any obvious issues from my system.

While waiting for someone else to confirm, I can report that I've
still not seen any instability since this patch.  The laptop has been
stable through reboots, power cycling, suspension, etc.  I'd be happy
to continue to try to understand why this is this case.  It sounds
like Stephen isn't seeing these issues on 5.10 rc6 with the single msi
patch+reverting that one commit.  I can try to give that a shot if
it'd produce something useful.

Kalle - a couple quick questions, in the driver comments the M2 state
is loosely documented as a low power mode.  Why would it transition to
that while on charger/plugging in, but stay in M0 while on battery
(you can see this behavior in the videos I linked previously)?
Naively I would've expected the opposite behavior.  Also, is there any
way to prevent that transition other than my brute force?  It seems on
battery the 'nominal' state for it is M0, I'm not sure what the effect
of it being left in this M1 state really is even though there's
nothing observable.  Lastly, any thoughts as to why it seems that
transition causes the EE state to become invalid?

Thanks!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
