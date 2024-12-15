Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7871AE7716A
	for <ath11k@archiver.kernel.org>; Sun, 15 Dec 2024 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmVkckjW6Gz44iHmZeQm6fMSVW0ipcMebg2jtb4VUZM=; b=FypPPD1+B+ZFtoFOaIyi6WBHtQ
	FLoiiq5CgJ6GN3VTjlOslSHJ4tCwZP33MH7iTbgrzFemfBbsQwnLhi6c0Ev9rcWDxEiBTawy7XWCm
	Wx0pH/NiChZHvqEYiWGrjSmz4nIax19T8J6zeJpNkBvNjmRC7YTcUgI7WUZxvytiVOuon12juK2z4
	G9Qb2p+zcNvrjSmkvt+PxzJEXsgS0JLaruISXVcaVrQ95iadgO8ajFPUCSQlnCXF/b32elW+Kqx9p
	rDr4y7X1o8x0UDXtuiHQJE8K2GvUF/3nIHzQ7lD8+xb2rbDP9VtzdC6eXIuD1TjmhrmELzM1h7Qzs
	X7lGQBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwyF-00000008Yv6-0jng;
	Sun, 15 Dec 2024 22:20:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMwyC-00000008YuU-1UC1
	for ath11k@lists.infradead.org;
	Sun, 15 Dec 2024 22:20:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4718DA40B95;
	Sun, 15 Dec 2024 22:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3F5C4CECE;
	Sun, 15 Dec 2024 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734301210;
	bh=+f/3R0qpROTHLJvl7CebrBCCFdNqcTYDyYpt0tn2/Os=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eP5tyUC7btHFwOsrjrKhd35N32EClIU1kwyNTnnhW2ngFjKFYGOYs5AhbAyATpfbW
	 4LgOIuSphtDymSbSXz1MMb2/JRwv12LLiBUJS859enf1JamnHfPjecwa11iQxJeE5f
	 bPo7f9ZqjT+y/O27DP4kG9VbrQB34yXLbyae08xOnuJvsYBE+5VJxXOjH18hJRL2D/
	 LR/XpUDWiCx3oB+a7yyJ5k5ZHIDqmhlYTt7aMHoek/vNJqC7t29FxttZqevtLq03yA
	 cZ6z2BZaJpr9qpk12eVNlTijrAaGMlqm8C3rAGeehYeeoDzLH4GVIIjn9/2JsTPveM
	 j7n+kKgyWQ2Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB3893806656;
	Sun, 15 Dec 2024 22:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 0/2] Converge on using secs_to_jiffies() in netdev
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173430122779.3593151.18169196230893738996.git-patchwork-notify@kernel.org>
Date: Sun, 15 Dec 2024 22:20:27 +0000
References: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
In-Reply-To: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: jeroendb@google.com, pkaligineedi@google.com, shailend@google.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, kvalo@kernel.org, jjohnson@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 quic_jjohnson@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_142012_478186_9D458917 
X-CRM114-Status: UNSURE (   7.21  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Dec 2024 17:33:00 +0000 you wrote:
> These patches are pulled out from v2 [1] and v3 [2] of my series to be sent
> through netdev. The series converts users of msecs_to_jiffies() that need
> seconds-denominated timeouts to the new secs_to_jiffies() API in
> include/linux/jiffies.h to avoid the multiplication with 1000 or MSEC_PER_SEC.
> 
> [1]: https://lore.kernel.org/r/20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com
> [2]: https://lore.kernel.org/r/20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/2] gve: Convert timeouts to secs_to_jiffies()
    https://git.kernel.org/netdev/net-next/c/734ff310d38c
  - [net-next,v4,2/2] wifi: ath11k: Convert timeouts to secs_to_jiffies()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



