Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knGW1-000875-69
 for ath11k@lists.infradead.org; Thu, 10 Dec 2020 07:37:30 +0000
Received: by mail-pl1-x642.google.com with SMTP id bj5so2348181plb.4
 for <ath11k@lists.infradead.org>; Wed, 09 Dec 2020 23:37:28 -0800 (PST)
MIME-Version: 1.0
References: <CAE+mCOEX5ccBa2HBYpi_3YpayApyr-C1csBpvvjWZ-hnW38Oqw@mail.gmail.com>
 <87v9db9ftj.fsf@codeaurora.org>
 <CAE+mCOEZed9Wa8CxHv9dkuyB_-5YukjNPLQTjXv4pK8fc1ev6Q@mail.gmail.com>
In-Reply-To: <CAE+mCOEZed9Wa8CxHv9dkuyB_-5YukjNPLQTjXv4pK8fc1ev6Q@mail.gmail.com>
From: Stephen Liang <stephenliang7@gmail.com>
Date: Wed, 9 Dec 2020 23:37:15 -0800
Message-ID: <CAE+mCOGxEhwnB6m56uvck-ocFdj7PW15hOwVsXE_1X4nZZR-iQ@mail.gmail.com>
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
Cc: ath11k@lists.infradead.org

Okay, I installed ath11k-qca6390-bringup (6244933dd) and did notice
lockups occurring. In fact, I found a reproducible way to lock up the
system:

1. Turn off WiFi
2. Reboot system
3. Login
4. Turn on WiFi

If you perform those steps, the system will lock on
ath11k-qca6390-bringup, dmesg: https://i.imgur.com/0XExack.jpg

On 59c6d02 + revert of 7fef431be9c9, the firmware will crash but the
system will not lock up. dmesg: https://pastebin.com/raw/hH0HyWVx

If you keep WiFi on, i.e. the system is automatically connected to
WiFi on boot, then on the ath11k-qca6390-bringup tag, it randomly
freezes. On 59c6d02, it seems to be fairly stable so long as I do not
turn off/turn on WiFi. I can bisect based on the reproducible steps in
the next couple days if nobody else comes up with something first.

On Wed, Dec 9, 2020 at 7:07 PM Stephen Liang <stephenliang7@gmail.com> wrote:
>
> > Thanks, good to know. On what platform is this, can you share more details? Is it the new Dell XPS 13 9310 or something else?
>
> Yes, this is the XPS 13 9310.
>
> > I recommend using ath11k-qca6390-bringup branch, it has quite a few
> fixes:
>
> Let me give that a shot, perhaps if I can reproduce the same issues
> the others have been seeing I could start a bisect as well.
>
> My uptime is now at 2 days with Fedora Rawhide kernel 5.10.0-0.rc6
> with commit 59c6d022df8efb450f82d33dd6a6812935bd022f and a revert of
> 7fef431be9c9 patched in. I'm not experiencing any of the stalls or
> crashes that others have been mentioning and I have been able to
> suspend/resume consistently. No issues with power being plugged and
> unplugged either. Happy to help provide details if anybody needs any.
>
> > You mean that the reboot stalls and you need to turn off the laptop using power button?
>
> Actually, with the previously mentioned commit combination, I was able
> to shutdown and reboot successfully as well.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
