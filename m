Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIYLx-000481-Vk
 for ath11k@lists.infradead.org; Wed, 16 Sep 2020 14:24:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Hastings: kernel bug on rmmod at drivers/pci/msi.c:375
References: <1005491c-24ec-1c67-5762-59e337913ff3@candelatech.com>
Date: Wed, 16 Sep 2020 17:23:51 +0300
In-Reply-To: <1005491c-24ec-1c67-5762-59e337913ff3@candelatech.com> (Ben
 Greear's message of "Tue, 18 Aug 2020 16:53:41 -0700")
Message-ID: <87zh5piyvc.fsf@codeaurora.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath11k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> I cloned kvallo's ath tree today and tried it on a system with one of the Hastings
> NICs in it.  Firmware wasn't in my file system, so it didn't load.  I put FW into
> place and did 'rmmod ath11k_pci ath11k' and got the splat below:
>
> [  520.273845] ------------[ cut here ]------------
> [  520.273848] kernel BUG at drivers/pci/msi.c:375!
> [  520.277302] invalid opcode: 0000 [#1] PREEMPT SMP
> [  520.280889] CPU: 4 PID: 4760 Comm: rmmod Not tainted 5.8.0-rc7-wt-ath+ #1
> [ 520.286566] Hardware name: Default string Default string/SKYBAY,
> BIOS 5.12 02/19/2019
> [  520.293368] RIP: 0010:free_msi_irqs+0x168/0x190
> [  520.296714] Code: 14 85 c0 0f 84 e4 fe ff ff 31 ed eb 0f 83 c5 01
> 39 6b 14 0f 86 d4 fe ff ff 8b 7b 10 01 ef e8 9f d0 b3 ff 48 83 78 70
> 00 74 e3 <0f> 0b 49 8d b5 b0 00 00 00 e8 ca 8e b4 ff e9 d6 fe ff ff 48
> 8b 7d
> [  520.314895] RSP: 0018:ffffc900068c7de0 EFLAGS: 00010282
> [  520.318990] RAX: ffff8882559acc00 RBX: ffff88825a5b4700 RCX: 0000000000000000
> [  520.325080] RDX: ffff8882543ec6d8 RSI: ffff8882543ec778 RDI: 00000000000000cf
> [  520.331157] RBP: 0000000000000000 R08: ffff8882559acc00 R09: ffffffff82880c88
> [  520.337257] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88825b9424b8
> [  520.343361] R13: ffff88825b942000 R14: ffffffffa0176250 R15: 0000000000000000
> [ 520.349427] FS: 00007f518244f740(0000) GS:ffff88826dd00000(0000)
> knlGS:0000000000000000
> [  520.356533] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  520.361163] CR2: 00005581d5bdc258 CR3: 00000002558f4003 CR4: 00000000003606e0
> [  520.367254] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  520.373354] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  520.379456] Call Trace:
> [  520.380653]  ath11k_pci_remove+0x2b/0x90 [ath11k_pci]
> [  520.384565]  pci_device_remove+0x31/0x90
> [  520.387292]  __device_release_driver+0x15a/0x210
> [  520.390742]  driver_detach+0xcf/0x110
> [  520.393210]  bus_remove_driver+0x56/0xca
> [  520.395942]  pci_unregister_driver+0x36/0x80
> [  520.399000]  __do_sys_delete_module.constprop.0+0x16f/0x2b0
> [  520.403439]  ? ktime_get_coarse_real_ts64+0x9/0x40
> [  520.407078]  ? syscall_trace_enter+0x10f/0x240
> [  520.410356]  do_syscall_64+0x56/0xe0
> [  520.412721]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  520.416656] RIP: 0033:0x7f5182577a9b

Most likely this patch will fix it:

ath11k: fix ath11k_pci rmmod crash

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath11k-qca6390-bringup&id=73a5afae5fd8362f4f9b36e9a5558b0db51e30f3

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
