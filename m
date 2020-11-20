Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8rS-0005Ks-MU
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 16:02:13 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k-qca6390-bringup-202011191920: new suspend implementation
References: <87sg95t9ez.fsf@codeaurora.org> <87o8jtt98l.fsf@codeaurora.org>
 <ba11dcda-ed2c-6840-e42c-bb3fa4e59cec@gmail.com>
 <CAHUdJJXWSiWz7Te0hJ5uvzk1iAtSdo8QrjBWiTHw_gSt4R+ZSg@mail.gmail.com>
 <CAHUdJJVOcwzKg3QTS8=p-C_s11WnpsX3cHJPSDadphrpKim_sA@mail.gmail.com>
Date: Fri, 20 Nov 2020 18:01:16 +0200
In-Reply-To: <CAHUdJJVOcwzKg3QTS8=p-C_s11WnpsX3cHJPSDadphrpKim_sA@mail.gmail.com>
 (wi nk's message of "Fri, 20 Nov 2020 00:08:54 +0100")
Message-ID: <87zh3cqapf.fsf@codeaurora.org>
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
Cc: Pavel Procopiuc <pavel.procopiuc@gmail.com>, ath11k@lists.infradead.org

wi nk <wink@technolu.st> writes:

> Ok, so I can answer my own question, no I didn't need to revert that
> commit.  That said I seem to be activating the RT throttling message
> way more frequently (4/5 boots, this fifth one was successful).  Kalle
> - following the thought that something is going out of control in the
> irq tasklet stuff, earlier today I was playing with the MSI patch that
> introduces the irq_enable_flag and the functions to set/unset it and
> noticed that in the ath11k_pci_ce_* functions that enable / disable
> IRQs , if I switched the order of the flag assignment and the irq
> enable/disable function call, I saw this behavior more frequently as
> well.  I haven't fully groked the re-entrancy model of these
> functions, but there's definitely a race occuring somehow.  It seems
> to occur mostly during some of the actual 802.11 association:
>
> [   26.945028] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
> experimental!
> [   26.945102] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
> 0x8e300000-0x8e3fffff 64bit]
> [   26.945120] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
> [   26.945207] ath11k_pci 0000:55:00.0: MSI vectors: 1
> [   26.949329] NET: Registered protocol family 42
> [   26.999257] mhi 0000:55:00.0: Requested to power ON
> [   26.999419] mhi 0000:55:00.0: Power on setup success
> [   27.171994] ath11k_pci 0000:55:00.0: qmi req mem_seg[0] 0x27800000 3522560 1
> [   27.171999] ath11k_pci 0000:55:00.0: qmi req mem_seg[1] 0x27d00000 884736 4
> [   27.183341] ath11k_pci 0000:55:00.0: chip_id 0x0 chip_family 0xb
> board_id 0xff soc_id 0xffffffff
> [   27.183345] ath11k_pci 0000:55:00.0: fw_version 0x101c06cc
> fw_build_timestamp 2020-06-24 19:50 fw_build_id
> [   27.387420] ath11k_pci 0000:55:00.0 wlp85s0: renamed from wlan0
>
> <snip>  Some time during the following pile of messages (after some
> seconds) is when I usually experience the machine spinning out and
> freezing.
>
> [   34.843605] wlp85s0: authenticate with ec:08:6b:27:01:ea
> [   34.990949] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
> [   35.094334] wlp85s0: send auth to ec:08:6b:27:01:ea (try 2/3)
> [   35.096624] wlp85s0: authenticated
> [   35.102421] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
> [   35.105012] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
> (capab=0x411 status=0 aid=6)
> [   35.116898] wlp85s0: associated
> [   35.154059] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready
>
> If the machine/adapter survives about 10 seconds beyond this, it will
> stay up indefinitely..

Yeah, there's something strange happening which is causing different
symptoms, and some people don't see it at all. We are still
investigating it, but if you find any possible ideas please let me (and
the list) know.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
