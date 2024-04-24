Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB716C10F15
	for <ath11k@archiver.kernel.org>; Wed, 24 Apr 2024 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMGzAJc20NJL3gSYgRPADWhaRVuwqk6dTZECjo689DA=; b=JbmPKRMSyb2flYmcZ98feBuOOf
	CZFf4OyA9U1fSyRLX8aQxNGyWiCB015L6ljCnpil/h5txbeXfkPXj/kyEs5san501EDEdL9wA/9rj
	l0zVYlhzGPSXQdD0WAEdG2Pw9afXS7+mfejkubED0HxNGevYnRUIH4DzAtxCjllE4ma3zIpRXPvcl
	A1/PFaDNTzX6nIfcuIIh4NQnOZoGn4C92GOeTXvb/TYyLQGcNMR9lgNjzoJGtq84O0FLp6clKrTls
	aWpTUaaWT5psjnmRn3OJXd5BzhEN6IAKkmKi5dDZlYCNvG6Us8xoeHY/HQebzB/fQWjaY9TOyDnmG
	R349eeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaWa-00000003r2C-0emJ;
	Wed, 24 Apr 2024 11:10:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzaWI-00000003qoJ-25ou;
	Wed, 24 Apr 2024 11:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD80761A2F;
	Wed, 24 Apr 2024 11:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9438C4AF16;
	Wed, 24 Apr 2024 11:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713957031;
	bh=5gH5c9GDDi9WLsKl6Z7sGCJeqtsVrGwX2qo4yjbesBQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lLRpz56F9j55d+6+qu39aNUTMLy7csK6asaF+R997D3H77neV+fKWIP1P0g9HC7MX
	 vGJzItw+ps3IDad3rYSXgqM1wQcZ92403W39GmvmGPSo4K3DqEchhOSBKmn3WmEzn8
	 uWggEcPmCuqGgl3/IfYvFqD7ygaPulhp64ijkE8vgY5UDpOSfTu8/rnaAs1sxvS4lz
	 D/qRuYL9JdEKYX8aSTSV4yd8zwI/wxWow/6s5PCtgnmOLYujO0BSP5opoGCyF/EjSZ
	 n+KSCP7uroT83MKzNEyHF9oin4czDsVB0TennMitDo/oVxQUBgSAB6N6LjfJZ7Yq07
	 0z+uVazcvXK+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BADCCCF21D8;
	Wed, 24 Apr 2024 11:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7 00/10] allocate dummy device dynamically
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171395703175.12181.16297886360257972212.git-patchwork-notify@kernel.org>
Date: Wed, 24 Apr 2024 11:10:31 +0000
References: <20240422123921.854943-1-leitao@debian.org>
In-Reply-To: <20240422123921.854943-1-leitao@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com, kuba@kernel.org, davem@davemloft.net,
 pabeni@redhat.com, edumazet@google.com, elder@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, taras.chornyi@plvision.eu, ath11k@lists.infradead.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 geomatsi@gmail.com, kvalo@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, quic_jjohnson@quicinc.com,
 leon@kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 idosch@idosch.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_041034_726201_094C6B27 
X-CRM114-Status: UNSURE (   7.61  )
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
by David S. Miller <davem@davemloft.net>:

On Mon, 22 Apr 2024 05:38:53 -0700 you wrote:
> struct net_device shouldn't be embedded into any structure, instead,
> the owner should use the private space to embed their state into
> net_device.
> 
> But, in some cases the net_device is embedded inside the private
> structure, which blocks the usage of zero-length arrays inside
> net_device.
> 
> [...]

Here is the summary with links:
  - [net-next,v7,01/10] net: core: Fix documentation
    https://git.kernel.org/netdev/net-next/c/c6e7f276841d
  - [net-next,v7,02/10] net: free_netdev: exit earlier if dummy
    https://git.kernel.org/netdev/net-next/c/f8d05679fb3f
  - [net-next,v7,03/10] net: create a dummy net_device allocator
    https://git.kernel.org/netdev/net-next/c/c661050f93d3
  - [net-next,v7,04/10] net: marvell: prestera: allocate dummy net_device dynamically
    https://git.kernel.org/netdev/net-next/c/ec24c06eb312
  - [net-next,v7,05/10] net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically
    https://git.kernel.org/netdev/net-next/c/b209bd6d0bff
  - [net-next,v7,06/10] net: ipa: allocate dummy net_device dynamically
    https://git.kernel.org/netdev/net-next/c/1bdab0ee635d
  - [net-next,v7,07/10] net: ibm/emac: allocate dummy net_device dynamically
    https://git.kernel.org/netdev/net-next/c/2eb5e25d8495
  - [net-next,v7,08/10] wifi: qtnfmac: Use netdev dummy allocator helper
    https://git.kernel.org/netdev/net-next/c/4a8b77eff7e5
  - [net-next,v7,09/10] wifi: ath10k: allocate dummy net_device dynamically
    https://git.kernel.org/netdev/net-next/c/57738dab12d9
  - [net-next,v7,10/10] wifi: ath11k: allocate dummy net_device dynamically
    https://git.kernel.org/netdev/net-next/c/bca592ead825

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



