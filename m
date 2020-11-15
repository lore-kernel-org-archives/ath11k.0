Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keNod-0001Wl-7A
 for ath11k@lists.infradead.org; Sun, 15 Nov 2020 19:36:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Fwd: XPS 9310 MSI vectors patch for ath11k
References: <CAJxb_EpOy-CqJhodHMcBDuOgeQoZrtims9stB4uGxz7kCz_Y7Q@mail.gmail.com>
 <877dqn3m3t.fsf@codeaurora.org>
 <CAJxb_EoTvUV3Bwq4O7DMS1AgvWD3VLq9e5Z_Y8FeGbSFxmvzbg@mail.gmail.com>
 <CAJxb_Eq1NemrYh+DzrOiRfagZpcF5E4de=JPuU1EhspFF2nCWA@mail.gmail.com>
Date: Sun, 15 Nov 2020 21:35:41 +0200
In-Reply-To: <CAJxb_Eq1NemrYh+DzrOiRfagZpcF5E4de=JPuU1EhspFF2nCWA@mail.gmail.com>
 (Mitchell Nordine's message of "Sun, 15 Nov 2020 16:16:25 +0100")
Message-ID: <87zh3i1khe.fsf@codeaurora.org>
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

Mitchell Nordine <mitchell.nordine@gmail.com> writes:

> With Kalle's help I have managed to get wi-fi working on my XPS 13
> 9310 (with the QCA6390) working on NixOS.
>
> To do this, I switched to 5.10-rc2 and applied Kalle's patch for the
> XPS 9310 here[1] and installed the latest version of the firmware
> following the instructions outlined here[2].
>
> However, despite wi-fi working, with these changes my system has
> become incredibly unstable, often crashing resulting in a frozen
> desktop with nothing responding and no ability to switch to the other
> ttys.
>
> Occasionally however, the system will not crash, and instead the
> internet will simply drop out (though with GNOME still showing the
> wi-fi as "connected") with the following errors reported in
> journalctl:

To pinpoint the problem can you try Carl's suggestion adding
"memmap=12M\$20M" to kernel parameters:

http://lists.infradead.org/pipermail/ath11k/2020-November/000686.html

Let me know how it goes.

> I've also noticed that on each boot, there appear to be some errors
> during ath11k_pci initialisation related to a memory request and qmi.
>>From dmesg:
>
> [    4.738943] ath11k_pci 0000:56:00.0: Respond mem req failed,
> result: 1, err: 0
> [    4.738945] ath11k_pci 0000:56:00.0: qmi failed to respond fw mem
> req:-22

There's a fix coming for this error.

> [    4.739070] ath11k_pci 0000:56:00.0: req mem_seg[0] 0x5a100000
> 524288 1
> [    4.739071] ath11k_pci 0000:56:00.0: req mem_seg[1] 0x5a180000
> 524288 1
> [    4.739072] ath11k_pci 0000:56:00.0: req mem_seg[2] 0x5a200000
> 524288 1
> [    4.739072] ath11k_pci 0000:56:00.0: req mem_seg[3] 0x5a280000
> 294912 1
>                       [    4.739073] ath11k_pci 0000:56:00.0: req
> mem_seg[4] 0x5a300000 524288 1
> [    4.739073] ath11k_pci 0000:56:00.0: req mem_seg[5] 0x5a380000
> 524288 1
> [    4.739074] ath11k_pci 0000:56:00.0: req mem_seg[6] 0x59c00000
> 458752 1
> [    4.739074] ath11k_pci 0000:56:00.0: req mem_seg[7] 0x5a5c0000
> 131072 1
>                       [    4.739075] ath11k_pci 0000:56:00.0: req
> mem_seg[8] 0x59c80000 524288 4
> [    4.739075] ath11k_pci 0000:56:00.0: req mem_seg[9] 0x59d00000
> 360448 4
>                       [    4.739076] ath11k_pci 0000:56:00.0: req
> mem_seg[10] 0x5a5a4000 16384 1

These are just debug messages to help diagnose the instability issues,
they will be removed in the final patch.

> For the record, bluetooth still does not appear to be working, though
> I'm not sure if this is expected or not at this point.

I don't know the status with bluetooth.

> I'm on NixOS, and unfortunately I haven't yet worked out how to enable
> the ath11k debugging options via `make menuconfig` in a declarative
> manner for my nix configuration. That said, if there are any other
> patches you would like me to test just let me know.
>
> Btw, I tried subscribing to the ath11k mailing list today and
> yesterday, but haven't received any ack or response, but maybe this is
> normal over the weekend.

Yes, weekends are normally pretty quiet here.

> In case anyone is interested in following along, I have a draft PR
> open at the nixos/nixos-hardware repo[3] for the Dell XPS 9310 which
> includes these WIP patches. This includes a nix module for installing
> the QCA6390 firmware and Kalle's patch mentioned above.
>
> [1]:
> https://patchwork.kernel.org/project/linux-wireless/patch/1605121102-14352-1-git-send-email-kvalo@codeaurora.org/
> [2]: http://lists.infradead.org/pipermail/ath11k/2020-November/000537.html
> [3]: https://github.com/NixOS/nixos-hardware/pull/207

Nice, but do note that these patches are not finalised yet. So there
will be new versions coming.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
