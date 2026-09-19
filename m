Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD7C982CC
	for <ath11k@archiver.kernel.org>; Sat, 19 Sep 2026 21:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AO/Eu04UJkHc6pSrEXmXrNXJ1w9izsPoCjtzx+eKB7k=; b=b4TrrH7QbfwIAzhnwOkYBc9GMB
	fRx3VvL7t5dguJoQCbI2LNi/l3ULY6QTo2Bfm36LKcWZhXp/xx9y35x6oQcRI3SeR+N5y2iiZbeWm
	hN64LQSxVLENo0vYTMxhHvAanB9tljIUYiJbUR1TW7myeAtQWzCjmZgHgO7JCd9mLa52lSNCW2eVK
	dFTYNxAYqcvdoHbCLk7pdkwD0jbMjkxOOeqLgIIzI98yGDa7xXmrH/CstFnXdY3BXOkaMrytmAe3C
	7u+rEhvYHEpfSQyb7P8PIxhQMu5cwiENDYTrZ3yw5D2uwk65AnX3P3tICRop9N1Vh/xS5wjUfJryC
	eCRG6xYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x82b7-0000000GdaD-1n00;
	Sat, 19 Sep 2026 21:27:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x82b6-0000000GdZo-3iRu;
	Sat, 19 Sep 2026 21:27:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14665601FB;
	Sat, 19 Sep 2026 21:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229FE1F000FF;
	Sat, 19 Sep 2026 21:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789853265;
	bh=AO/Eu04UJkHc6pSrEXmXrNXJ1w9izsPoCjtzx+eKB7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eXn5UcrPIov2YLgAUEs+GRTC+8uCr5IM1DP0vyBA2qlxh4fQK5tnoOvoWEaWgR4r2
	 U/3B5j/NxoS4SYFOzCfZ+gtTKqk9+7Op29pUVISKgjWk7qCuorDXWhZnVkkLH9CKW0
	 uoDNfzqFSVDROb47QsFnROg++blphKnKeKjHxk8IpvXIH1xDAHaCs+0r/KK0qBKkV2
	 /G5qb4/iOsUX/fkIj5XRMtJViPm7MtNpC+IOLqu1m+8naqg0UyOrjJRAap4wX5AyvO
	 /kcQ1jMEovLfvEO4ebv0Pl48VmcHlPV3WWjwyC5oLd6RwjYKnecyeqXxM4EMLRGvlL
	 REvYJP39Ig8zg==
Date: Sat, 19 Sep 2026 14:27:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
Cc: "Manivannan Sadhasivam" <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>,
 "Jeff Johnson" <jjohnson@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Eric
 Dumazet" <edumazet@google.com>, "Kuniyuki Iwashima" <kuniyu@google.com>,
 "Paolo Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>,
 "David S . Miller" <davem@davemloft.net>, "Simon Horman"
 <horms@kernel.org>, "Mihai Moldovan" <ionic@ionic.de>, "Denis Kenzior"
 <denkenz@gmail.com>, "Marcel Holtmann" <marcel@holtmann.org>, "Andy Gross"
 <agross@kernel.org>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v7 00/15] QRTR Multi-endpoint support
Message-ID: <20260919142744.12982b1d@kernel.org>
In-Reply-To: <9837273a-c62f-456e-9aa0-567b0d3a6f29@app.fastmail.com>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
	<20260915154705.67cfb94f@kernel.org>
	<da6003cf-515b-4d97-8059-3f4553d0251d@app.fastmail.com>
	<9837273a-c62f-456e-9aa0-567b0d3a6f29@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 18 Sep 2026 09:22:40 +0300 Juha-Matti Tilli wrote:
> Some positive news. There will be no next version, as Qualcomm is going
> to provide a superior patchset that I tested. It's easier to backport,
> cleaner design, fewer lines changed, has 1 author as opposed to 3, and
> most importantly, it worked just fine on my 2x card setup. 
> 
> Thus, I'm going to abandon this patchset.

Man, "superior" and "Qualcomm" in one sentence is really testing 
my resolution to be less sarcastic.

