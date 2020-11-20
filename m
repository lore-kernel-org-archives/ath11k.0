Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg9lC-0006Sg-In
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 16:59:48 +0000
Received: by mail-ej1-x62d.google.com with SMTP id i19so13803852ejx.9
 for <ath11k@lists.infradead.org>; Fri, 20 Nov 2020 08:59:45 -0800 (PST)
MIME-Version: 1.0
References: <87sg95t9ez.fsf@codeaurora.org> <87o8jtt98l.fsf@codeaurora.org>
 <ba11dcda-ed2c-6840-e42c-bb3fa4e59cec@gmail.com>
 <CAHUdJJXWSiWz7Te0hJ5uvzk1iAtSdo8QrjBWiTHw_gSt4R+ZSg@mail.gmail.com>
 <CAHUdJJVOcwzKg3QTS8=p-C_s11WnpsX3cHJPSDadphrpKim_sA@mail.gmail.com>
 <87zh3cqapf.fsf@codeaurora.org>
In-Reply-To: <87zh3cqapf.fsf@codeaurora.org>
From: wi nk <wink@technolu.st>
Date: Fri, 20 Nov 2020 17:59:34 +0100
Message-ID: <CAHUdJJUjk06hw-g8LK7+8ZKqsgiODf1b=VjZ_1DWqgUsHzSK7A@mail.gmail.com>
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
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
Cc: Pavel Procopiuc <pavel.procopiuc@gmail.com>, ath11k@lists.infradead.org

On Fri, Nov 20, 2020 at 5:02 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> wi nk <wink@technolu.st> writes:
>
> > Ok, so I can answer my own question, no I didn't need to revert that
> > commit.  That said I seem to be activating the RT throttling message
> > way more frequently (4/5 boots, this fifth one was successful).  Kalle
> > - following the thought that something is going out of control in the
> > irq tasklet stuff, earlier today I was playing with the MSI patch that
> > introduces the irq_enable_flag and the functions to set/unset it and
> > noticed that in the ath11k_pci_ce_* functions that enable / disable
> > IRQs , if I switched the order of the flag assignment and the irq
> > enable/disable function call, I saw this behavior more frequently as
> > well.  I haven't fully groked the re-entrancy model of these
> > functions, but there's definitely a race occuring somehow.  It seems
> > to occur mostly during some of the actual 802.11 association:
> >
> > [   26.945028] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
> > experimental!
> > [   26.945102] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
> > 0x8e300000-0x8e3fffff 64bit]
> > [   26.945120] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
> > [   26.945207] ath11k_pci 0000:55:00.0: MSI vectors: 1
> > [   26.949329] NET: Registered protocol family 42
> > [   26.999257] mhi 0000:55:00.0: Requested to power ON
> > [   26.999419] mhi 0000:55:00.0: Power on setup success
> > [   27.171994] ath11k_pci 0000:55:00.0: qmi req mem_seg[0] 0x27800000 3522560 1
> > [   27.171999] ath11k_pci 0000:55:00.0: qmi req mem_seg[1] 0x27d00000 884736 4
> > [   27.183341] ath11k_pci 0000:55:00.0: chip_id 0x0 chip_family 0xb
> > board_id 0xff soc_id 0xffffffff
> > [   27.183345] ath11k_pci 0000:55:00.0: fw_version 0x101c06cc
> > fw_build_timestamp 2020-06-24 19:50 fw_build_id
> > [   27.387420] ath11k_pci 0000:55:00.0 wlp85s0: renamed from wlan0
> >
> > <snip>  Some time during the following pile of messages (after some
> > seconds) is when I usually experience the machine spinning out and
> > freezing.
> >
> > [   34.843605] wlp85s0: authenticate with ec:08:6b:27:01:ea
> > [   34.990949] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
> > [   35.094334] wlp85s0: send auth to ec:08:6b:27:01:ea (try 2/3)
> > [   35.096624] wlp85s0: authenticated
> > [   35.102421] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
> > [   35.105012] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
> > (capab=0x411 status=0 aid=6)
> > [   35.116898] wlp85s0: associated
> > [   35.154059] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready
> >
> > If the machine/adapter survives about 10 seconds beyond this, it will
> > stay up indefinitely..
>
> Yeah, there's something strange happening which is causing different
> symptoms, and some people don't see it at all. We are still
> investigating it, but if you find any possible ideas please let me (and
> the list) know.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

I think one of the large differences is that Pavel's XPS is exposing /
allowing the 32 MSI vectors, whereas the 13 inch XPS with the killer
1650 are only providing one, forcing this new code path that handles
multiplexing / demultiplexing them all.  Am I understanding that
difference correctly?  I'm still spinning up on my knowledge of these
internals, but one of the big changes in that difference is that it
introduces a new set of flags that control enabling/disabling the irqs
based on index.  Does reading/writing to that array need any
synchronization?  I see the disable_irq(_nosync) calls are issued in a
way they won't block intentionally, but the enable_irqs are not (and
don't seem to be able to be).  Is there some kind of deadlocking
occuring there as a result?   Here are the changes I was referring to
in my previous email, here is piece from the single MSI vector patch:

+ if (vecs_32_cap)
+ enable_irq(ab->irq_num[irq_idx]);
+ ath11k_pci_set_irq_enable_flag(ab, irq_idx, 1);

If I swap the  ordering of the conditional/enable_irq and the setting
of the flag in the array, so:

+ ath11k_pci_set_irq_enable_flag(ab, irq_idx, 1);
+ if (vecs_32_cap)
+ enable_irq(ab->irq_num[irq_idx]);

If re-entrancy weren't an issue, I wouldn't expect any difference
between these pieces of code, however there seems to be changes in
behavior when I play with these amongst the occurrences of
enabling/disabling the irqs/flags.  As with any of these races, this
could be a red herring and just changing the timing of things
slightly, but with the observation of the XPS 17 working without the
single MSI and this version going nuts and causing the RT throttling
or freezing entirely, this seems to be a reasonable suspect.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
