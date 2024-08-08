Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598FBC52D73
	for <ath11k@archiver.kernel.org>; Thu,  8 Aug 2024 05:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:Subject:To:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQalC81tDFrZmKHUo2m7ulS/QbWwgG6+DOHMGdElypI=; b=zg8FNjPg2PTdkR
	TXFIJUMwBGUDwSsEUBBXcp3hCL1Y3Mz5eNMHxH1tKHQB0aalKb1xCx3VZ+Y5v0s4wy2PmiJKNV+1f
	xYM0k+XnqgiC7+R1taFM2Hw023eUSRv8Yi2txO5x6znGVHOiSg/98VhLE8jcbe8LLZsr83Nz74Dq1
	itd1g17yeAH9P3+3Q+SRI2E2sOo2a+HS6UQ1UJVW9k98nNnPr6HPTHUTgxjUzDfTs+OjiEUQDeVDF
	LPmywb2gWxS6Xy3zpNWfLHqzZijeAspA5EzY1YukuP27xoNG2hpxLS4k4FrBVoxhBwB0FFTkpqrkU
	n7FyifRg9+iQuz/OJ1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbvyf-000000079wn-3tbg;
	Thu, 08 Aug 2024 05:46:21 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbvyc-000000079wK-3uW3
	for ath11k@lists.infradead.org;
	Thu, 08 Aug 2024 05:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:Cc:
	Subject:Reply-To:To:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
	Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=IQalC81tDFrZmKHUo2m7ulS/QbWwgG6+DOHMGdElypI=; t=1723095978;
	x=1723527978; b=1B+VIXkhubC1z5N98Mu3OcQY1gzhF6ufrr8y9EgbKItZTy3Zq8w3RDFUok7W3
	RDaqTjfxXhoqDR9aBQLwFzsTGq0et216s41q3Nun9nw/uhWGBnlBPpJtPQFiwVRIi5s8gE7w1tcr3
	HuGJhE6HwHrTIqZC+Q0J7PRHbcwZJBKl1p94aA66zxM/ovzUefzGvipy9HyjSW3KjRdne1K1OIZro
	54LyivIZBnyOYcIafqebWwbHqOsXy7flTNnXpJvpOoMnFKtDeQvnmQ0q/OvWKy8yzH3k3oxdCoLk0
	2LJn+XBE949+zqa/WzJSz4OPGus967flinEaPsj0iVeT/IKtTg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sbvyX-0006VS-Ly; Thu, 08 Aug 2024 07:46:13 +0200
Message-ID: <05c3f9ea-b5f5-4341-9e4f-d44133629fe6@leemhuis.info>
Date: Thu, 8 Aug 2024 07:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Subject: [regression] [ath11k] kernel NULL pointer in
 ath11k_mac_get_eirp_power.isra
Cc: ath11k <ath11k@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1723095979;3043feae;
X-HE-SMSGID: 1sbvyX-0006VS-Ly
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_224619_198844_0699AEAC 
X-CRM114-Status: GOOD (  10.25  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi, Thorsten here, the Linux kernel's regression tracker.

I noticed a report about an ath11k regression in bugzilla.kernel.org. As
many (most?) kernel developers don't keep an eye on the bug tracker, I
decided to write this mail. To quote from
https://bugzilla.kernel.org/show_bug.cgi?id=219131 :

> Wifi stopped working on my laptop when updating from 6.10.3 to 6.11-rc2 kernel.
> 
> 02:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 Wireless Network Adapter (rev 01)
> wpa_supplicant-2.11-1.fc40.x86_64
> 
> wlp2s0: SME: Trying to authenticate with b2:25:4a:59:04:37 (SSID='Mecha34bb-combo' freq=6295 MHz)
> BUG: kernel NULL pointer dereference, address: 0000000000000018
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0 
> Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 10 UID: 0 PID: 1308 Comm: wpa_supplicant Not tainted 6.11.0-0.rc2.23.fc41.x86_64 #1
> Hardware name: LENOVO 21K5000DMX/21K5000DMX, BIOS R2FET57W (1.37 ) 05/20/2024
> RIP: 0010:ath11k_mac_get_eirp_power.isra.0+0x5b/0x80 [ath11k]
> Code: 0f 87 7f ea 02 00 66 41 89 5d 00 84 c9 75 35 49 8b 44 24 10 0f b7 f3 69 f6 e8 03 00 00 48 8b 78 40 e8 d9 5f 60 ff 48 89 45 00 <8b> 50 18 48 8b 44 24 28 88 10 5b 5d 41 5c 41 5d e9 0b 1a ae f5 41
> RSP: 0018:ffffa725c77a3360 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000001d83 RCX: 0000000000000000
> RDX: 00000000005a8f98 RSI: 0000000000000005 RDI: 0000000000000000
> RBP: ffffa725c77a33d8 R08: ffffa725c77a33d8 R09: ffff8b7ff1b0e488
> R10: ffff8b7ff0aa2000 R11: 0000000000001883 R12: ffff8b7ff0aa2000
> R13: ffffa725c77a33d6 R14: 0000000000000000 R15: ffff8b8000cb9440
> FS:  00007f07966c4840(0000) GS:ffff8b8e21d00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000018 CR3: 00000001416fa000 CR4: 0000000000f50ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? __die_body.cold+0x19/0x27
>  ? page_fault_oops+0x15a/0x2f0
>  ? exc_page_fault+0x7e/0x180
>  ? asm_exc_page_fault+0x26/0x30
>  ? ath11k_mac_get_eirp_power.isra.0+0x5b/0x80 [ath11k]
>  ath11k_mac_fill_reg_tpc_info+0x3d6/0x800 [ath11k]
>  ? __entry_text_end+0x101e45/0x101e49
>  ath11k_mac_vdev_start_restart+0x412/0x4d0 [ath11k]
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? crypto_alloc_tfm_node+0x5b/0xd0
>  ath11k_mac_op_sta_state+0x7bc/0xbb0 [ath11k]
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? __rhashtable_insert_fast.constprop.0.isra.0+0x17f/0x490 [mac80211]
>  drv_sta_state+0xf1/0x5f0 [mac80211]
>  sta_info_insert_rcu+0x28d/0x530 [mac80211]
>  sta_info_insert+0xf/0x20 [mac80211]
>  ieee80211_prep_connection+0x3b4/0x4c0 [mac80211]
>  ieee80211_mgd_auth+0x363/0x600 [mac80211]
>  ? __entry_text_end+0xfdd48/0x101e49
>  ? __cfg80211_get_bss+0x215/0x2e0 [cfg80211]
>  cfg80211_mlme_auth+0xb4/0x1b0 [cfg80211]
>  nl80211_authenticate+0x369/0x3d0 [cfg80211]
>  genl_family_rcv_msg_doit+0xef/0x150
>  genl_rcv_msg+0x1b7/0x2c0
>  ? __pfx_nl80211_pre_doit+0x10/0x10 [cfg80211]
>  ? __pfx_nl80211_authenticate+0x10/0x10 [cfg80211]
>  ? __pfx_nl80211_post_doit+0x10/0x10 [cfg80211]
>  ? __pfx_genl_rcv_msg+0x10/0x10
>  netlink_rcv_skb+0x50/0x100
>  genl_rcv+0x28/0x40
>  netlink_unicast+0x242/0x370
>  netlink_sendmsg+0x21b/0x470
>  ____sys_sendmsg+0x39d/0x3d0
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ___sys_sendmsg+0x9a/0xe0
>  __sys_sendmsg+0xcc/0x100
>  do_syscall_64+0x82/0x160
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? do_sock_setsockopt+0xc1/0x180
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? __sys_setsockopt+0xb1/0xe0
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? syscall_exit_to_user_mode+0x10/0x220
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? do_syscall_64+0x8e/0x160
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? do_sock_setsockopt+0xc1/0x180
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? syscall_exit_to_user_mode+0x10/0x220
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? do_syscall_64+0x8e/0x160
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? syscall_exit_to_user_mode+0x10/0x220
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? do_syscall_64+0x8e/0x160
>  ? exc_page_fault+0x7e/0x180
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7f079612ca14
> Code: 15 09 94 0c 00 f7 d8 64 89 02 b8 ff ff ff ff eb bf 0f 1f 44 00 00 f3 0f 1e fa 80 3d 35 16 0d 00 00 74 13 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 4c c3 0f 1f 00 55 48 89 e5 48 83 ec 20 89 55
> RSP: 002b:00007ffc97d7eeb8 EFLAGS: 00000202 ORIG_RAX: 000000000000002e
> RAX: ffffffffffffffda RBX: 000055e6cd9de920 RCX: 00007f079612ca14
> RDX: 0000000000000000 RSI: 00007ffc97d7eef0 RDI: 0000000000000006
> RBP: 00007ffc97d7eee0 R08: 0000000000000004 R09: 0000000000000001
> R10: 00007ffc97d7effc R11: 0000000000000202 R12: 000055e6cdab10a0
> R13: 000055e6cd9de830 R14: 00007ffc97d7eef0 R15: 0000000000000000
>  </TASK>

See the ticket for more details. Note, you have to use bugzilla to reach
the reporter, as I sadly[1] can not CCed them in mails like this.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"

P.S.: let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.10..v6.11-rc2
#regzbot title: wifi: ath11k: null pointer
#regzbot from: Mikko Tiihonen
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=219131
#regzbot ignore-activity

