Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAE0C433F5
	for <ath11k@archiver.kernel.org>; Thu, 23 Dec 2021 00:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fycReS9fd4V2pNLeGGySvpiUmLR09/W9b2YPgkmJF8c=; b=JVnqISj2xP7zoR
	4xFNs7UWvl3jgNwwAkkG82Yv0zaa3i2MrHIT8d9ttnQTgkaQY2l5yReXF6uElwQ6wUkqzHy5LVTUv
	QWoWkQAQhLmsn9pa56Q2HSgDigIbBlkyP52igqApoiXUYBBXLueMM/LapfgfaWgAcqScAtZPrJF2W
	tuTp3oHwAQmtxvPQuQqSW1aOFwwXy8RckGRBhmyarUv9+SF0ca+ZMEA0M/6tE42/pgxAEPsHaI1Hy
	LSBqEXfx1/LXcU8cgqMNavjwjCSB5TKyqpRasZsVY3942kjshf7vugpWLjAS6+0DvbN2VY47xPv0i
	tARxGRN2jCg1pxHtCqDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0CJD-00BcFQ-Sl; Thu, 23 Dec 2021 00:50:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0CJB-00BcEm-0K
 for ath11k@lists.infradead.org; Thu, 23 Dec 2021 00:50:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 007C9B81F46;
 Thu, 23 Dec 2021 00:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BABEAC36AEA;
 Thu, 23 Dec 2021 00:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640220609;
 bh=hMkExGW3xLUwd0qRah6sMhBW5wuhCL8RWHxF+ccCF70=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NBUjKFQXLUuCjL1uYrahsFFsYUJPqklyF0sahvX26hIwC7tzLcHtdvhxOU1Ic0iS1
 +5KPZB79VkNJZTdeoe6AoIqF6xDaNTMs6yGd7mj3KFVaNLZtReKYP+mdSBCdG/VHPg
 R2dB/nDodJ1CA9eSlgJv31MrjfJe0GGbnW3tOZoCr1PYED7T0XfCmjDQoDs8qBlUOk
 Ep+tsGfVAFGfDmwRjJQAZ+lO5F/0kGm14UqEFEqDKXnI9r7UYWBS7hxzSDDdTPWYv8
 6qz16BAaCVifHDIu/J2PH5ZwezynzuBwIdNs28+83gkwrrGZ5n1f5Hugon+IpZzJ5s
 4+g4zMwnELTrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A2E8BFE55A6; Thu, 23 Dec 2021 00:50:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] codel: remove unnecessary sock.h include
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164022060966.21673.3814438675172430394.git-patchwork-notify@kernel.org>
Date: Thu, 23 Dec 2021 00:50:09 +0000
References: <20211221193941.3805147-1-kuba@kernel.org>
In-Reply-To: <20211221193941.3805147-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, kvalo@kernel.org,
 pkshih@realtek.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_165013_231849_D7BD1B0B 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 21 Dec 2021 11:39:40 -0800 you wrote:
> Since sock.h is modified relatively often (60 times in the last
> 12 months) it seems worthwhile to decrease the incremental build
> work.
> 
> CoDel's header includes net/inet_ecn.h which in turn includes net/sock.h.
> codel.h is itself included by mac80211 which is included by much of
> the WiFi stack and drivers. Removing the net/inet_ecn.h include from
> CoDel breaks the dependecy between WiFi and sock.h.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] codel: remove unnecessary sock.h include
    https://git.kernel.org/netdev/net-next/c/15fcb1031178
  - [net-next,2/2] codel: remove unnecessary pkt_sched.h include
    https://git.kernel.org/netdev/net-next/c/e6e590445581

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
