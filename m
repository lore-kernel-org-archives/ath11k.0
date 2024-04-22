Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FF8C4345F
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 13:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93J8UaMzS+7O+iNBrRp2s5A4WqBU9HqLHO1AgyN8UH8=; b=Z07YN+pry9M2PTsubPOdP5WbZj
	9tltnlgzyZxx0wu7tHyC6AxACYzSCH/6NMJd7pJRgH39l1gSGojLBe+RlZJcyBT6npZG2m1kllBuy
	jllA3+AOOvJCUIQHI4rGGjkcu6tvWi6IvzkzjfLaGdM07rM6O3PhPnZ2jyIxM8xyNzYoMW15SeJUk
	ohUOPpsaVj9Zlb/hTgQj2b5ntuYMCtjyYTfAv8VKelgjB/SNIU/oIot7tIpkD8h3Bxb526laqbDXq
	/zIBwnl11/T3K/NiCFlOLDGcGwDOioviMk5RfAVChNYG2cJ2u/9SOMooYwRaArSK92NVmxByE7ZUa
	4CbwrZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytOu-0000000DfZQ-1Yw3;
	Mon, 22 Apr 2024 13:08:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rytOp-0000000DfXu-1wDV;
	Mon, 22 Apr 2024 13:08:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 324D160DFB;
	Mon, 22 Apr 2024 13:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030FDC113CC;
	Mon, 22 Apr 2024 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713791277;
	bh=yfG+kUmCzNShwqakh8yn3JA3rJOrIkdZFg2+CO25P+o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ANvLJA7biQ9f6pkY5lJrJl+ZcdKSSALWrgT6llVYoiv35Imd5Zo+H6zpMIL/usbEP
	 1zY8AXLDhqhHe7DxBNq8Zp0YnkFut7iq5c0imJAMyYh1Q70pIFczPuHmPwF5W7FL98
	 cB+67aE+2KWePsmpE1Ku9uFhBf0Tnje6fjv2cYExqBdfG4ycIkkaCdVx8MMguXMIvi
	 YHTSMeeN19NHzEDZVWZJ6wF7XD0Pawu3LAEh/FsWo9k/T6Uo1oGLh7aYnljfLNOQR1
	 U09qYeGKM9FDM7Yik0XukOqQg9H3irEvD91hgMtYxZh7vrU4JcCJ/RL7jBQV7yBx1z
	 7P6R43TEygQ1w==
From: Kalle Valo <kvalo@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: aleksander.lobakin@intel.com,  kuba@kernel.org,  davem@davemloft.net,
  pabeni@redhat.com,  edumazet@google.com,  elder@kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  nbd@nbd.name,
  sean.wang@mediatek.com,  Mark-MC.Lee@mediatek.com,  lorenzo@kernel.org,
  taras.chornyi@plvision.eu,  ath11k@lists.infradead.org,
  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  geomatsi@gmail.com,  Igor Mitsyanko <imitsyanko@quantenna.com>,
  quic_jjohnson@quicinc.com,  leon@kernel.org,
  dennis.dalessandro@cornelisnetworks.com,  linux-kernel@vger.kernel.org,
  netdev@vger.kernel.org,  bpf@vger.kernel.org,  idosch@idosch.org,
  angelogioacchino.delregno@collabora.com,  matthias.bgg@gmail.com
Subject: Re: [PATCH net-next v7 08/10] wifi: qtnfmac: Use netdev dummy
 allocator helper
References: <20240422123921.854943-1-leitao@debian.org>
	<20240422123921.854943-9-leitao@debian.org>
Date: Mon, 22 Apr 2024 16:07:49 +0300
In-Reply-To: <20240422123921.854943-9-leitao@debian.org> (Breno Leitao's
	message of "Mon, 22 Apr 2024 05:39:01 -0700")
Message-ID: <87ttjtv93u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_060759_565558_A798BE53 
X-CRM114-Status: UNSURE (   8.18  )
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

Breno Leitao <leitao@debian.org> writes:

> There is a new dummy netdev allocator, use it instead of
> alloc_netdev()/init_dummy_netdev combination.
>
> Using alloc_netdev() with init_dummy_netdev might cause some memory
> corruption at the driver removal side.
>
> Fixes: 61cdb09ff760 ("wifi: qtnfmac: allocate dummy net_device dynamically")
> Signed-off-by: Breno Leitao <leitao@debian.org>

I assume this goes via net-next:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

