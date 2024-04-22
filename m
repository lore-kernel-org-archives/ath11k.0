Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BEDC4345F
	for <ath11k@archiver.kernel.org>; Mon, 22 Apr 2024 10:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzTPXENqq5jvZCAKoHI6ryjLlEGLnVyo7XtSv7g7nyY=; b=K2wHgiQrf9iH0vXnwCmsqRZ1ql
	iGnEcQJN0m/5HmlQX7cjKPxQMhAxT31tqYXuPKw8V6paaGu6CciJlK6y8+xzaNOMG76A3IcIyrBfR
	aZr7Mmsxdw8GuPPGPomLlJO8rNasaUmU9QQxuv3OB1vV/XvpyDrXZXBTADs9XAuie3R5laIl65w5t
	eUxUuptsWiRC5yub5EdFtDRTAphLqHjq7paUj0ILAG8HvWXlYoytn35GyzyFhlcOFqmRmbKKV6O8n
	BBfN6dnXxAxVUbAFm0cYE6HxKdF85nZgDj1cLTSbh3uxJ72Rdm0sh/C6qygegCQu+sbsG5B04zYsW
	OEu3t0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryr1B-0000000DAwZ-2ewb;
	Mon, 22 Apr 2024 10:35:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryr18-0000000DAuV-357Q
	for ath11k@lists.infradead.org;
	Mon, 22 Apr 2024 10:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8DBE8CE09F1;
	Mon, 22 Apr 2024 10:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24260C113CC;
	Mon, 22 Apr 2024 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713782118;
	bh=MQ7x2sZbdT7oeZ3rMas1QbjI/IwmWitJrkANCgeDjgw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=poDa84j+zMMCqQ4s7FbhO1R1/q1gSPfEl2wswLVpSGR+lNwbHF0WZ6eubHZAoZnb0
	 2hVHty3xcZ5A1gfbUT+vNRu21Ne9B1KMVCE1RgXx5zFy/XFWc1nGZc7UH8DHm/cM6w
	 3aP1HgLRFe0H7lCFxwSZ3K5ql3tmM7YDa4HEJZ7qfNkwFlLNSKzclEYwfdZqOsY4lY
	 3gygbhVa0U2yEOqhjCVU9yeEjA1JmGmTNW66mVbsUD+ERNt5H6P7hd4GujhuZusvfb
	 xtKM6NzY93oV2oqVZC4KWEA3D3+GehKfdJ2+HAkPUQDbxqzhVfLhwEig2Vj7UrEJdw
	 /Ppjlqr/HBumQ==
From: Kalle Valo <kvalo@kernel.org>
To: "Lindner, Frank" <Frank.Lindner@ghmt.de>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6856 monitor mode
References: <FRYP281MB0160DB4CC65BD0BF23BE491AEB122@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Date: Mon, 22 Apr 2024 13:35:16 +0300
In-Reply-To: <FRYP281MB0160DB4CC65BD0BF23BE491AEB122@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
	(Frank Lindner's message of "Mon, 22 Apr 2024 10:25:44 +0000")
Message-ID: <8734rdwuqj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_033523_627368_760A9AA7 
X-CRM114-Status: UNSURE (   9.28  )
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

"Lindner, Frank" <Frank.Lindner@ghmt.de> writes:

> is WCN6856 chip able to do monitor mode? Any idea how to get this
> working in full monitor mode?

It would need support from the ath11k firmware. Usually the mobile
chipset firmware (eg. QCA6390 and WCN6855) doesn't support monitor mode,
unfortunately.

> And if not, which tri-band (2.4/5/6 GHz) chip is supported in
> monitor-mode?

You can check the sources yourself, see supports_monitor field in
ath11k_hw_params:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/core.c#n40

For example, QCN9074 should support monitor mode but I have not tested
that myself so don't count on that. Hopefully others can chime in.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

