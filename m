Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51DFC4345F
	for <ath11k@archiver.kernel.org>; Sat, 13 Apr 2024 02:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edVYBrCFyItV2d/UveybSyGwsRExQsBBAgMZRGTiSYQ=; b=gdObl/OZhQBUpmf9E9zWdQ7Tjs
	MDGAClE0eDFolKqHkAq3T+/1duwbkHQ6+zP4YLOmeDC7aj0s2exUaHEs5itPVuSYwpPHU+agrVBz/
	rolsVzvdcjgSfRw29X4ySOU5jF4wVhLXnjVGm62BDhGf8/5ih1F8mCTAxcv6ULeSBggejXvjcfCPr
	Mk32ZwdhYBk/5Jc52eZ0KMKyeP71ySKpu9bFzA4CYIhT+TOHLFH8Z2JSTE4YvSBcuM6Zmh1xozqKe
	cmLuQXDhqydEVMndtMgBGXjaWw9eWcxydocNDIT44w+RilZyLyB+CLcoQBjssUDXtK+edjMaLDfdG
	ejd4fWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvSwU-000000023yX-2tbI;
	Sat, 13 Apr 2024 02:16:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvSwR-000000023xM-2wNS;
	Sat, 13 Apr 2024 02:16:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0E6F601FE;
	Sat, 13 Apr 2024 02:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1595FC113CC;
	Sat, 13 Apr 2024 02:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712974588;
	bh=edVYBrCFyItV2d/UveybSyGwsRExQsBBAgMZRGTiSYQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C8+3BVLRyA53WLwuKA0hZTTf79KRJ8rtny/HmzaGPRxqFvuz2QSCA1zalbiHLREqB
	 RqT+VpzaswsCXZmNXJELAw45yTMpmIxKDzJQfH8fnqIqY1bf/Mgjw7b/q2TVK4YWjc
	 cUNO7FSbDfMbCl0ClGrohxtTHL1Wjva6I05WvxNT3QqkPFdk2t7p/g5CO+sCcg4hUB
	 sNvgDlG2d2FEYOV4zz6Z9ID4nQlo0rht493d1n0T+QZKkw4PZfLYGQYAJyg1grkQkv
	 Gwe3M71KTriLQ3SW6lsTq05SWJpXIgtfcCQMG5HT/rqQcXv/18TLrHqXKcxck6FrUh
	 ivwL/jEOTOuHw==
Date: Fri, 12 Apr 2024 19:16:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com, davem@davemloft.net, pabeni@redhat.com,
 edumazet@google.com, elder@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, taras.chornyi@plvision.eu, ath11k@lists.infradead.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 geomatsi@gmail.com, kvalo@kernel.org, quic_jjohnson@quicinc.com,
 leon@kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 idosch@idosch.org, Ido Schimmel <idosch@nvidia.com>, Jiri Pirko
 <jiri@resnulli.us>, Simon Horman <horms@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH net-next v6 03/10] net: create a dummy net_device
 allocator
Message-ID: <20240412191626.2e9bfb4a@kernel.org>
In-Reply-To: <20240411135952.1096696-4-leitao@debian.org>
References: <20240411135952.1096696-1-leitao@debian.org>
	<20240411135952.1096696-4-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_191631_892895_96846DC5 
X-CRM114-Status: UNSURE (   5.63  )
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

On Thu, 11 Apr 2024 06:59:27 -0700 Breno Leitao wrote:
> +/**
> + * alloc_netdev_dummy - Allocate and initialize a dummy net device.
> + * @sizeof_priv: size of private data to allocate space for
> + */
> +struct net_device *alloc_netdev_dummy(int sizeof_priv)

Sorry, one more round :)

We started using -Wall for kdoc (./scripts/kernel-doc -Wall $files)
recently and it now complains about missing return values...

