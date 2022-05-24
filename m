Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2004C43217
	for <ath11k@archiver.kernel.org>; Tue, 24 May 2022 07:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKVpevrNG4UYzE5sildEnfu+IiCXY9bF9PL0EpNNQjI=; b=IFXwHOgPgqLf4T
	HQ+zm6taARDTE5QcZ2efCxlFt53gXhsQzbGLluVQdVqdaex8H+RzzD48L91bMx3iiSqNqHqWYj3Kn
	HdmMNcUFcEI+h6MJ8ND58uGXp2Ek+qGlqtL18ITav/VfkjzHdAcnRuzu5sOp8fnuTO4+I3Xhte5u8
	Zt47jzn/A8YH86qeYeaz25KMHG35B0Og/4FhFCmHJ3XteC2ekRTYHKUR9hmkgTMEWPEKnUGb66UAQ
	RAxqo83CY2J4wd6ZAg7ea3gRxbYeYz8EFP0TBjEg9lYPpvTzB6Az1kODnuUQ+6Cg5SQKPn6gvJQt2
	6OF99V9o2Th6jMIp/13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntOwA-0074e3-Mx; Tue, 24 May 2022 07:26:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntOvy-0074Zb-T1
 for ath11k@lists.infradead.org; Tue, 24 May 2022 07:26:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 453066155A;
 Tue, 24 May 2022 07:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1474CC34100;
 Tue, 24 May 2022 07:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653377186;
 bh=bIROaGOZbF93Xt0aHUg1j/Xrg0023fKyXPwCzZwVCaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cK34n+iF/tkd+qGzXLOY68MrWM0kGjGMv7m8Tmu9tc6YmeNSSr5dDp3yugtJvZyqh
 1HyARCzxvwupVDVgf+4eMX37hSuwlEEOrpOT4GfxITMMG28M0XeR3H3m2Gry9UFF5A
 fDwsr2eK6aqYAx784UpRUf9Mc6bfEbRUCZMno0zf+cl20DVtOSB5MRZW+WF4M82V2L
 irGYe4xG9Zhx44jfeueCvBvVVCrBx3jCBUv52rbzkVY1HPYpvMVazxy8qQaMDsW93/
 7xD3Qh1Nyi/cvzsp4Q0yRVngUR9NshAdEOGoVv8h5sPNKnCKdZOQikB8mhRE8CvgoO
 eRpJSGrJu50Bg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1ntOvv-0001yU-4e; Tue, 24 May 2022 09:26:23 +0200
Date: Tue, 24 May 2022 09:26:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] ath11k: fix netdev open race
Message-ID: <YoyIn5L8cIwxHxR0@hovoldconsulting.com>
References: <20220517103436.15867-1-johan+linaro@kernel.org>
 <YouezMIwm3PYxOKY@hovoldconsulting.com> <875ylwysoy.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875ylwysoy.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_002627_058195_61661EDF 
X-CRM114-Status: GOOD (  22.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, May 23, 2022 at 10:06:37PM +0300, Kalle Valo wrote:
> Johan Hovold <johan@kernel.org> writes:
> 
> > On Tue, May 17, 2022 at 12:34:36PM +0200, Johan Hovold wrote:
> >> Make sure to allocate resources needed before registering the device.
> >> 
> >> This specifically avoids having a racing open() trigger a BUG_ON() in
> >> mod_timer() when ath11k_mac_op_start() is called before the
> >> mon_reap_timer as been set up.
> >> 
> >> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> >> Fixes: 840c36fa727a ("ath11k: dp: stop rx pktlog before suspend")
> >> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >> ---
> >
> > For completeness:
> >
> > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Thanks, added in the pending branch.
> 
> You submitted this as RFC but do you mind if I apply this anyway? The
> patch looks good and passes my tests. But I do wonder why I haven't seen
> the crash...

If it looks good to you then please do apply it.

I was just worried that there may be some subtle reason for why
ath11k_dp_pdev_alloc() was called after netdev registration in the first
place and that it might need to be split up so that for example
ath11k_dp_rx_pdev_mon_attach() isn't called until after registration.

I did not see this issue with next-20220310, but I hit it on every probe
with next-20220511. Perhaps some timing changed in between.

Here's the backtrace for completeness in case someone else starts hitting
this and searches the archives:

[   51.346947] kernel BUG at kernel/time/timer.c:990!
[   51.346958] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
...
[   51.578225] Call trace:
[   51.583293]  __mod_timer+0x298/0x390
[   51.589518]  mod_timer+0x14/0x20
[   51.595368]  ath11k_mac_op_start+0x41c/0x4a0 [ath11k]
[   51.603165]  drv_start+0x38/0x60 [mac80211]
[   51.610110]  ieee80211_do_open+0x29c/0x7d0 [mac80211]
[   51.617945]  ieee80211_open+0x60/0xb0 [mac80211]
[   51.625311]  __dev_open+0x100/0x1c0
[   51.631420]  __dev_change_flags+0x194/0x210
[   51.638214]  dev_change_flags+0x24/0x70
[   51.644646]  do_setlink+0x228/0xdb0
[   51.650723]  __rtnl_newlink+0x460/0x830
[   51.657162]  rtnl_newlink+0x4c/0x80
[   51.663229]  rtnetlink_rcv_msg+0x124/0x390
[   51.669917]  netlink_rcv_skb+0x58/0x130
[   51.676314]  rtnetlink_rcv+0x18/0x30
[   51.682460]  netlink_unicast+0x250/0x310
[   51.688960]  netlink_sendmsg+0x19c/0x3e0
[   51.695458]  ____sys_sendmsg+0x220/0x290
[   51.701938]  ___sys_sendmsg+0x7c/0xc0
[   51.708148]  __sys_sendmsg+0x68/0xd0
[   51.714254]  __arm64_sys_sendmsg+0x28/0x40
[   51.720900]  invoke_syscall+0x48/0x120

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
