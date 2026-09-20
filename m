Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB04C982CC
	for <ath11k@archiver.kernel.org>; Sun, 20 Sep 2026 00:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pldEBeieoNLIMuf3xzY7/FQ4h1jOVkgeRGPmSStpAeg=; b=SKmlVOtysW7XW95UegcjJWn7ao
	eeebsmPEX2xTuAopRRrPEXmeYZrupJjiap1blOaCu1vovtgI08JBOvM88Y7K7fTaQjSumvtGZ1nhY
	FofwLUvdVYmNhU+w3dFu5BJQFbhLZOYgSamaPUp8Gav/CVnBRe3yoUxxWThDLsSuENcx8taK2l0Bi
	b2z5whd/jSXsrmmFjKbky5ytxlUinqbKw2DJqsb1PaJ5OT36YpjoV8/qNI/854P9Zu3d+9tYRCJOf
	K+xBp2k+SJ8O9fw1itfHn2dp2O7+NpTIjqfxh3Qya0mjepV4s/Do4mGRJMVCFiY3rgs9h4fs1pyDR
	9yf1fSbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x85cJ-0000000GhwM-40Bo;
	Sun, 20 Sep 2026 00:41:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x85cI-0000000Ghvz-3AeX;
	Sun, 20 Sep 2026 00:41:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A3A760136;
	Sun, 20 Sep 2026 00:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3674D1F000FF;
	Sun, 20 Sep 2026 00:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789864873;
	bh=pldEBeieoNLIMuf3xzY7/FQ4h1jOVkgeRGPmSStpAeg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iw/RZudZflo07UepdUsNoLomL9kP8U+VcGoZH1lq76C7Hi6ussDP5UikNkB734d86
	 l3B3MXE5Zc7X7RrjX4TpJIVdmp/B3hGBn5+ZoNnGUV16nkbz6djLrRfGZgSK9b7Enm
	 gchOvlQQEkrWuL68TjyzJkaen9d+CWC+y/TaudYfUfOsfnP6A5a8nn88+hT9HlwImb
	 if2KRi6q6JiM2P91F1pzMDq5Y+ZZUtdNoccrqEYktkMLHKKJBRRUSBAm8gVDEgH3Tz
	 kBc4bE9D5vNj04GIXeQv6WWh7sKCjulMMhiHqND2hgZk+WOQ9dGwWDXk0XNVH5JPrS
	 bScvF10iYHNnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BAE3924A49;
	Sun, 20 Sep 2026 00:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: use assign_bit() where applicable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178986480565.1504357.13555480327800349461.git-patchwork-notify@kernel.org>
Date: Sun, 20 Sep 2026 00:40:05 +0000
References: <20260917-net-assign-bit-v1-1-e9c97965e080@nxp.com>
In-Reply-To: <20260917-net-assign-bit-v1-1-e9c97965e080@nxp.com>
To: Peng Fan (OSS) <peng.fan@oss.nxp.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de,
 mailhol@kernel.org, Raju.Rangoju@amd.com, PrashanthKumar.K.R@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, sukhdeeps@marvell.com,
 skalluru@marvell.com, manishc@marvell.com, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
 shenjian15@huawei.com, shaojijie@huawei.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, sgoutham@marvell.com, rkannoth@marvell.com,
 gakula@marvell.com, sbhatta@marvell.com, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, alexanderduyck@fb.com,
 kernel-team@meta.com, brett.creeley@amd.com, GR-Linux-NIC-Dev@marvell.com,
 shshaikh@marvell.com, jiawenwu@trustnetic.com, mengyuanlou@net-swift.com,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jjohnson@kernel.org, toke@toke.dk,
 nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, pkshih@realtek.com,
 richardcochran@gmail.com, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, imx@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, peng.fan@nxp.com
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Sep 2026 20:39:52 +0800 you wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch:
>     // set_bit -> clear_bit => assign_bit
> 
> [...]

Here is the summary with links:
  - [net-next] net: use assign_bit() where applicable
    https://git.kernel.org/netdev/net-next/c/8830e65ed46d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



