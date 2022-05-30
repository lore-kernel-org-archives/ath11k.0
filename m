Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746A7C433F5
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECBw8uqMlbgZzQrSGv28ylLeP1i4ZZmYjC84P2Xx5F8=; b=IL1XYZt/Lk4Ybf
	a5L3nkLLF8o49Yv4lu2TxC/DeOwVAmlCtFXKUnTZRNkkdSmfruTWvHSbq8Ece0N0+EgFSaX7wUquG
	lIFOrKQqI3I38fJk4AJ1kV139PE3i9TdL2V4OdKwJRaKQlJzXZvvEaJCUZ4Hh5QfmINOF6ID8leKr
	pa+IQxu1t+QeDDRNQ0ZLj2ISfUz9vLHw5g88pOdhHNGENviyvVBbfFHCMXdfOSUfiGFm+OEvcxOXE
	WVPNaradHm9NlgHULMRPjAYvWFTCgpZEiU9zZHvx+/7Ts4TQkCzm2qVnVmv4xjc9qQQQROSZCL04B
	U8712Aiq1je2hSxeuwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdRE-006KCr-8Y; Mon, 30 May 2022 11:19:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdRA-006KC2-MV
	for ath11k@lists.infradead.org; Mon, 30 May 2022 11:19:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 691C0B80D7C;
	Mon, 30 May 2022 11:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DD9C385B8;
	Mon, 30 May 2022 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653909588;
	bh=jB0MVIdn8WlgNUy4ciQ0vHBFgioYsWLUFQJQmy6Vqm8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=s8jMUV5xtidVexQ9IBGsrfzG5cTNTt5VUTgs4fjQQGzWEmw08e6Bu3fhsPFDhXtTL
	 Z124M0oIBAbOM/6e33coPy+jxYoeElsg1PU3jqm7vBYX/2BIwJzIH1s3WZ2RjqCskR
	 yNmdhL1wWY4FYJxVCvQbMbQzkHvqssU8Fvv80oJjkW9/8hsjmioaHqxSE8djofEIq3
	 rE2OQXBQDGywA2SSWUKclL0nHk26ZUlOEK+ZLbYrAKltYlWsfAnjMJObxbA0W5p5uH
	 2XHSaY8xvP8gY5lzfj3uoKHLf6EF3pBOU+n7DoveW41HrWcSyBc/VfaFUJe7ckegPu
	 RsZNyQNlBUgkA==
MIME-Version: 1.0
Subject: Re: [RFC] ath11k: fix netdev open race
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220517103436.15867-1-johan+linaro@kernel.org>
References: <20220517103436.15867-1-johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165390958400.3436.14756419956692693750.kvalo@kernel.org>
Date: Mon, 30 May 2022 11:19:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_041953_076668_42868077 
X-CRM114-Status: GOOD (  12.67  )
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

Johan Hovold <johan+linaro@kernel.org> wrote:

> Make sure to allocate resources needed before registering the device.
> 
> This specifically avoids having a racing open() trigger a BUG_ON() in
> mod_timer() when ath11k_mac_op_start() is called before the
> mon_reap_timer as been set up.
> 
> I did not see this issue with next-20220310, but I hit it on every probe
> with next-20220511. Perhaps some timing changed in between.
> 
> Here's the backtrace:
> 
> [   51.346947] kernel BUG at kernel/time/timer.c:990!
> [   51.346958] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> ...
> [   51.578225] Call trace:
> [   51.583293]  __mod_timer+0x298/0x390
> [   51.589518]  mod_timer+0x14/0x20
> [   51.595368]  ath11k_mac_op_start+0x41c/0x4a0 [ath11k]
> [   51.603165]  drv_start+0x38/0x60 [mac80211]
> [   51.610110]  ieee80211_do_open+0x29c/0x7d0 [mac80211]
> [   51.617945]  ieee80211_open+0x60/0xb0 [mac80211]
> [   51.625311]  __dev_open+0x100/0x1c0
> [   51.631420]  __dev_change_flags+0x194/0x210
> [   51.638214]  dev_change_flags+0x24/0x70
> [   51.644646]  do_setlink+0x228/0xdb0
> [   51.650723]  __rtnl_newlink+0x460/0x830
> [   51.657162]  rtnl_newlink+0x4c/0x80
> [   51.663229]  rtnetlink_rcv_msg+0x124/0x390
> [   51.669917]  netlink_rcv_skb+0x58/0x130
> [   51.676314]  rtnetlink_rcv+0x18/0x30
> [   51.682460]  netlink_unicast+0x250/0x310
> [   51.688960]  netlink_sendmsg+0x19c/0x3e0
> [   51.695458]  ____sys_sendmsg+0x220/0x290
> [   51.701938]  ___sys_sendmsg+0x7c/0xc0
> [   51.708148]  __sys_sendmsg+0x68/0xd0
> [   51.714254]  __arm64_sys_sendmsg+0x28/0x40
> [   51.720900]  invoke_syscall+0x48/0x120
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Fixes: 840c36fa727a ("ath11k: dp: stop rx pktlog before suspend")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d4ba1ff87b17 ath11k: fix netdev open race

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220517103436.15867-1-johan+linaro@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
