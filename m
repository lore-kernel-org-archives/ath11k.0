Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koZZ9-0005Sn-47
 for ath11k@lists.infradead.org; Sun, 13 Dec 2020 22:10:08 +0000
Received: by mail-pf1-x441.google.com with SMTP id 131so10797633pfb.9
 for <ath11k@lists.infradead.org>; Sun, 13 Dec 2020 14:10:05 -0800 (PST)
MIME-Version: 1.0
References: <XEttDWCeuyBOzI9ypOwPDrgK-gUENAtY06t0CLx9viSsEPSQ6RAibULAYL2Vl_DuxN1HXhqlRlsmhdZstp1aoh8wrT_YZt8arK6PuS457Lo=@mitchellnordine.com>
 <87mtyn9dx0.fsf@codeaurora.org>
 <CAHUdJJWNSKw9aAHQBc8Ftne1J+s5KdVfdMLwgWu+g-ZfeDnitA@mail.gmail.com>
 <CAHUdJJXiDUc7ovAo8KbWxo_FEdniN4hXo67M9w6979QdNXeMfA@mail.gmail.com>
 <CAHUdJJXsduncuuA-Q=4A0mo=vO9z2zBe0=x5SBd7+J1eSQKZ8Q@mail.gmail.com>
 <874kkr4mba.fsf@codeaurora.org>
 <CAHUdJJUQmRkh2vAFksvnSqwN5hk58O8Smrf_-PSfwaJwC+D2CQ@mail.gmail.com>
 <CAHUdJJW_M1p0QWND1nS-WgZ2ZV8sWt-qipwCxmUzuRKXr-x6uw@mail.gmail.com>
 <CAHUdJJWymU7MT=B-xMTQeVKj2RtE9sAGzrBEcETg+0a2NN83+w@mail.gmail.com>
 <GEqEHwkxcbfwllceC1TRVJLtj8Dmwp8siybWHHJNuiG4DSh9Ovh293KwSJfMwfykp1ToCm3Jh_hxLlNr-XaNNsMJFvErV3vjVXfOrXgprJw=@mitchellnordine.com>
In-Reply-To: <GEqEHwkxcbfwllceC1TRVJLtj8Dmwp8siybWHHJNuiG4DSh9Ovh293KwSJfMwfykp1ToCm3Jh_hxLlNr-XaNNsMJFvErV3vjVXfOrXgprJw=@mitchellnordine.com>
From: Stephen Liang <stephenliang7@gmail.com>
Date: Sun, 13 Dec 2020 14:09:51 -0800
Message-ID: <CAE+mCOH_S6V73+kCyY-2j9qpA_V_+5XN2LC8Xw=LPZ_Xcr5ybg@mail.gmail.com>
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
To: Mitchell Nordine <mail@mitchellnordine.com>
Cc: Carl Huang <cjhuang@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, wi nk <wink@technolu.st>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>

I spent a bit of time this weekend attempting to bisect commits based
on the below reproduction steps, but received no conclusive results.
What I've discovered is that the lockups and the firmware crashing
typically occurred only during WiFi scanning. The reproduction steps
are as follows:

1. Open Gnome WiFi Settings to get a list of networks
2. Wait a couple moments, typically less than a minute.

If you do this, either the firmware will crash or the system will
lockup. I guess the reason why I was able to escape this and stayed
fairly stable is that I never need to look at other WiFi networks and
the system just auto-connects to the same one each time. On any of the
commits (including the tip of bringup), if I never look at the WiFi
networks list, it never locks up.

Firmware crash logs (no lockup): https://pastebin.com/raw/E0y49evA
Firmware crash with lockup: https://i.imgur.com/0XExack.jpg

I ended up going back to the bringup branch on rc6 and applied wi nk's
M2 patch on top, and upon performing the reproduction steps - I have
not had any lockups or firmware crashes and it's been going several
minutes now. MHI also does not report dev_state:M2, but rather
dev_state:M1. Great find, wi nk!

Perhaps there's some sort of issue in the WiFi scanning process?


On Sat, Dec 12, 2020 at 5:00 PM Mitchell Nordine
<mail@mitchellnordine.com> wrote:
>
> On Sunday, December 13, 2020 1:03 AM, wi nk wink@technolu.st wrote:
>
> > On Sun, Dec 13, 2020 at 12:29 AM wi nk wink@technolu.st wrote:
> >
> > > On Sat, Dec 12, 2020 at 12:46 PM wi nk wink@technolu.st wrote:
> > >
> > > > On Sat, Dec 12, 2020 at 6:37 AM Kalle Valo kvalo@codeaurora.org wrote:
> > > >
> > > > > wi nk wink@technolu.st writes:
> > > > >
> > > > > > > > and the modification that disables m2 state:
> > > > > > > > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > > > > > > > index 3de7b1639ec6..20f670c8b129 100644
> > > > > > > > --- a/drivers/bus/mhi/core/pm.c
> > > > > > > > +++ b/drivers/bus/mhi/core/pm.c
> > > > > > > > @@ -55,12 +55,12 @@ static struct mhi_pm_transitions const
> > > > > > > > dev_state_transitions[] = {
> > > > > > > > },
> > > > > > > > {
> > > > > > > > MHI_PM_M0,
> > > > > > > >
> > > > > > > > -            MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
> > > > > > > >
> > > > > > > >
> > > > > > > > -            MHI_PM_M0 | MHI_PM_M3_ENTER |
> > > > > > > >              MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> > > > > > > >              MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
> > > > > > > >
> > > > > > > >
> > > > > > > >     },
> > > > > > > >     {
> > > > > > > >
> > > > > > > > -            MHI_PM_M2,
> > > > > > > >
> > > > > > > >
> > > > > > > > -            MHI_PM_M0,
> > > > > > > >              MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
> > > > > > > >              MHI_PM_LD_ERR_FATAL_DETECT
> > > > > > > >
> > > > > > > >
> > > > > > > >     },
> > > > > > > >
> > > > > > >
> > > > > > > Adding one more data point. The driver will not crash on
> > > > > > > initialization this way, but also with the M2 state transition
> > > > > > > disabled the system survives suspend and wake and the adapter
> > > > > > > successfully reassociates consistently. As expected with my patch,
> > > > > > > the MHI driver shows everything stays in the M1 state instead of
> > > > > > > attempting to transition to M2 ever. It also doesn't return back to
> > > > > > > M0 if I disconnect the power / replug it. I'm not sure what things
> > > > > > > are affected by me hacking this state machine, but avoiding that M2
> > > > > > > transition has removed any obvious issues from my system.
> > > > > >
> > > > > > While waiting for someone else to confirm, I can report that I've
> > > > > > still not seen any instability since this patch. The laptop has been
> > > > > > stable through reboots, power cycling, suspension, etc.
> > > > >
> > > > > Very interesting! Are you saying that with this patch the wireless
> > > > > connection using QCA6390 works fine on your Dell XPS 9310, you can
> > > > > connect to an AP and transfer data normally?
> > > >
> > > > Precisely. The machine is now over 24h of uptime, I can reboot/sleep
> > > > without any issues, and throughput seems to saturate my wifi link
> > > > (5-600mpbs).
> > > >
> > > > > I would like to submit your patch to patchwork.kernel.org as RFC patch
> > > > > so that it's easier for everyone to download. But before I can do that I
> > > > > need your Signed-off-by, can you read Developer's Certificate of Origin:
> > > > > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
> > > > > And if you agree with the DCO please send your s-o-b by replying to this
> > > > > email. But you can also submit the RFC patch yourself, instructions
> > > > > here:
> > > > > https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches
> > > >
> > > > Signed-off-by: Lee Smith wink@technolu.st
> > > > I'll get an email out later this afternoon, if you get there first,
> > > > please feel free :).
> > > >
> > > > > > I'd be happy to continue to try to understand why this is this case.
> > > > > > It sounds like Stephen isn't seeing these issues on 5.10 rc6 with the
> > > > > > single msi patch+reverting that one commit. I can try to give that a
> > > > > > shot if it'd produce something useful.
> > > > >
> > > > > Yes, being able to give datapoints what affects this bug is very helpful
> > > > > to track down it.
> > > >
> > > > Ok, I'll try to rebuild to that configuration later today and report back.
> > > >
> > > > > > Kalle - a couple quick questions, in the driver comments the M2 state
> > > > > > is loosely documented as a low power mode. Why would it transition to
> > > > > > that while on charger/plugging in, but stay in M0 while on battery
> > > > > > (you can see this behavior in the videos I linked previously)?
> > > > > > Naively I would've expected the opposite behavior.
> > > > >
> > > > > I would have expected the same as well, it does sound strange or we are
> > > > > misunderstanding something. I'll try to find out why it's so. But if you
> > > > > learn more, please do let me know.
> > > >
> > > > Will do.
> > > >
> > > > > > Also, is there any way to prevent that transition other than my brute
> > > > > > force? It seems on battery the 'nominal' state for it is M0, I'm not
> > > > > > sure what the effect of it being left in this M1 state really is even
> > > > > > though there's nothing observable. Lastly, any thoughts as to why it
> > > > > > seems that transition causes the EE state to become invalid?
> > > > >
> > > > > TBH I'm not very familiar with MHI, you seem to already know it much
> > > > > more better than I do :) I'll include more folks to the thread later,
> > > > > hopefully they can help.
> > > >
> > > > Thanks!
> > > >
> > > > > --
> > > > > https://patchwork.kernel.org/project/linux-wireless/list/
> > > > > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> > >
> > > Ok I tried to boot 5.10-rc6 with
> > > 59c6d022df8efb450f82d33dd6a6812935bd022f (single msi) and reverted
> > > 7fef431be9c9. With this kernel, I can't get the wifi adapter to come
> > > up, but no freezing. I receive this consistently:
> > > [ 23.959920] mhi 0000:55:00.0: Requested to power ON
> > > [ 23.960058] mhi 0000:55:00.0: Power on setup success
> > > [ 24.362295] ath11k_pci 0000:55:00.0: Respond mem req failed, result: 1, err:
> > > 0
> > > [ 24.362303] ath11k_pci 0000:55:00.0: qmi failed to respond fw mem req:-22
> > > [ 24.374433] ath11k_pci 0000:55:00.0: chip_id 0x0 chip_family 0xb board_id 0xf
> > > f soc_id 0xffffffff
> > > [ 24.374438] ath11k_pci 0000:55:00.0: fw_version 0x101c06cc fw_build_timestamp
> > > 2020-06-24 19:50 fw_build_id
> > > [ 25.450139] ath11k_pci 0000:55:00.0: failed to receive control response compl
> > > etion, polling..
> > > [ 26.474154] ath11k_pci 0000:55:00.0: Service connect timeout
> > > [ 26.474163] ath11k_pci 0000:55:00.0: failed to connect to HTT: -110
> > > [ 26.477247] ath11k_pci 0000:55:00.0: failed to start core: -110
> > > With the latest bringup and my patch to disable M2, I'm still booting
> > > and operating reliably.
> >
> > I took my bringup branch and merged 5.10-rc6 into it. It merges fine,
> > and seems to be stable as well.
>
> Nice find wink, I've been running your patch that disables the MHI M2 state on my XPS 9310 for the past few hours and wifi appears to be running smoothly for the first time.
>
> The wifi symbol in the top right menu (GNOME 3 desktop on NixOS) does show a question mark for some reason, but otherwise everything appears quite stable so far.
>
> Perhaps its worth running git blame on `pm.c` and seeing if the original author of the MHI state machine might be able to shed some light (if they remember)? Would it be inappropriate to cc them into this thread? I'm unsure of mailing list etiquette here.
>
> I'll report back if I run into any other issues, otherwise will keep an eye on this mailing list in case of any updates or new patches that need testing.
>
> And thanks again all, excited to finally discard my dangly USB-2 external wifi adapter :)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
