Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB34C67861
	for <ath11k@archiver.kernel.org>; Wed, 10 Apr 2024 01:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qfm32UeQ5h10peikRax6Cr16r09b7jPDRi2tP8rOrfw=; b=ly8qWfwBZZordj3VzTfCpiTrUb
	AR3Brgr0WARdFTt3fvmCtlyAvLxteOmA6SE19bnNK3Og0VwQiXo5cbBDX7B+i4WvszMUka5KxnanM
	X/sciNOzTaZQ1vpVbdqW0WOmP1fr0z+dMvcVyj3y79o3OxI4eQAK1TKGa65ld9ix/zFVZTdgVneRp
	AIZBg21fVvCSCAfnwWkZH6/exr6gWYPl17JORgWmlFgZS7zovLnsxhN0P7MFPzuHloqjhrp99Iwnq
	Zd+ug4/OoJzcLGjbyItkadj2nKjnfACKaOCej4wnTfcq0GeHG6V3LR74Yh4EmSPgjQhbC3tVCV+ya
	mwJL0r/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruN2v-00000004e6h-2Txe;
	Wed, 10 Apr 2024 01:46:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruN2i-00000004e49-1eML;
	Wed, 10 Apr 2024 01:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89A1F60D2D;
	Wed, 10 Apr 2024 01:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D42C433F1;
	Wed, 10 Apr 2024 01:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712713587;
	bh=1YgFdUcBOKesTaua31ZEyD1c9Gpgvfr0heHVZed0Enk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I/78VjWdo/c0F0Ap07gI5asrS7PrsOu2M02J+DbxVjLWDvzFOCQj0or2QN13AWozE
	 I69cMnaM1ljMIhs/0Lp84+zGGrKjGK+/CXANY3BLrmNxLBhq4kaduZjuEReLaCWWCM
	 rte8M4SlHEUagzJtAXFK0rggGoLFQZvYFbNsor1v1NzuoQK/a4YRotlvV3NLP6fos1
	 5WsKk0K30sTsNVRZti9VcJ00BcNP1yTZV7kxZYXi4/yHOzNi43F1A9xC8vq4CFQg0l
	 rwcAwaw4bJhCi9poeYvELIrMuEt8FcP5FKz1pc4TBZxdLGNQelNbfUOj7E91vbTg6q
	 dEzc8Cp+Z0Vvg==
Date: Tue, 9 Apr 2024 18:46:25 -0700
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
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH net-next v4 1/9] net: free_netdev: exit earlier if dummy
Message-ID: <20240409184625.301e4bc0@kernel.org>
In-Reply-To: <20240409125738.1824983-2-leitao@debian.org>
References: <20240409125738.1824983-1-leitao@debian.org>
	<20240409125738.1824983-2-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_184637_150786_CC5AA776 
X-CRM114-Status: UNSURE (   9.45  )
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

On Tue,  9 Apr 2024 05:57:15 -0700 Breno Leitao wrote:
> For dummy devices, exit earlier at free_netdev() instead of executing
> the whole function. This is necessary, because dummy devices are
> special, and shouldn't have the second part of the function executed.
> 
> Otherwise reg_state, which is NETREG_DUMMY for dummy devices, will be
> overwritten and there will be no way to identify that this is a dummy
> device. Also, this device do not need the final put_device(), since
> dummy devices are not registered (through register_netdevice()), where
> the device reference is increased (at netdev_register_kobject() ->
> device_add()).

There's a small fuzz when applying due to the phy topo changes
landing, please rebase, the CI didn't ingest it right.
-- 
pw-bot: cr

