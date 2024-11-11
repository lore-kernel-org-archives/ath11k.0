Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF074D2E9E0
	for <ath11k@archiver.kernel.org>; Mon, 11 Nov 2024 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Srg1krJUOBkFYB3//Q0Jwf9QRolHV0irZib440X0E1A=; b=4tnHSoRaWRo1eACb2xSpxY+CCs
	VBnTVnHI+F5zgUWHCAzcs8KsQ408gz5mhHZ9GLXUstxz9TYHad9E9u3abW+9zCW9G2Z38ak3j7hO3
	EJBFZlWLbOdjo0kpPcR5HZJ2OFUT3f0rMdfuQJF8pKemsCDDvLGgccCViPdSxl6Jm/UNL46K1ZQLM
	J2aQaaSTZYtQBgA3N6Cxc7PgAB/izysEBGa28sj8iUXu+XNt8hbXvpoFhBcscEL95Uy8VyLxkzcSj
	2qHNuezpd5hQARlXTvlB2zl6uM82SSbHXM8lhjK2DsnFu3xYgHofGl+N4nbQgzznqY6qdrTyMK8pM
	Eqn5I3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tATG8-0000000HY62-1agk;
	Mon, 11 Nov 2024 12:11:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tATG5-0000000HY4n-0DyR;
	Mon, 11 Nov 2024 12:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B9A45C5499;
	Mon, 11 Nov 2024 12:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A69BC4CECF;
	Mon, 11 Nov 2024 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731327063;
	bh=gjcOJBAgJBHb99bfi5+v1hj3THzAbdFhTu2HppVYKP8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mTNitgwriKvXyx8LtAnfRpPEJ6rbpf63J9iYsWVCJc2KqQsxYnasa0wuSbOuPWiBm
	 Sb15+hbZ3ccnJ4/HLFhl0n2jXB5xcAZ3delcLD8o3dhXAmU6VlQRjgk0eTMKvEi9Yk
	 m155+/QR2a+UraJqBoq5/e2Jslikc4zSAhrujGYUR9vnbNYW+usy+kHEnYmpnc/F7V
	 MZPnXJeIiaG8QydyvBSc7Iy50x9RZiR4PDU3pQizpfniBONEs+t7LGYLOzBnpqKG1N
	 PIYod071416al6tl8E4O0wEUB/Oy62bAKYQjDJNUnnHSwZdyEnwV6X5Yu0Jli9v9IC
	 P7Qm4oVyUb8zQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: Switch back to struct platform_driver::remove()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
References: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Loic Poulain <loic.poulain@linaro.org>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Breno Leitao <leitao@debian.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, wcn36xx@lists.infradead.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173132705627.852485.14271331752921398347.kvalo@kernel.org>
Date: Mon, 11 Nov 2024 12:10:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_041105_159925_C3BCC441 
X-CRM114-Status: UNSURE (   8.42  )
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

Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/net/wireless to use
> .remove(), with the eventual goal to drop struct
> platform_driver::remove_new(). As .remove() and .remove_new() have the
> same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
> 
> En passant several whitespace changes are done to make indentation
> consistent in the struct initializers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Acked-by: Jiri Slaby <jirislaby@kernel.org>

Patch applied to wireless-next.git, thanks.

b41f96ecb9b7 wifi: Switch back to struct platform_driver::remove()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20241106170706.38922-2-u.kleine-koenig@baylibre.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


