Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290CD5AE75
	for <ath11k@archiver.kernel.org>; Thu,  7 Nov 2024 09:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3gBPLxLIFjBUvT/9EO2DO8Lp/H909xwWuUilV/trcc=; b=ThTSgq4LmkT1LtwXDNeiGYv3Cq
	5fXTXm4dGiaKPd1nQ387OSf8FE2G2ZxoaUESqHq2kSTK9n2ARKS7CRqMXKED56fZaKMPEhxyRDnjE
	XDCGot3HSpEq+soRs94Zsp1esd8f9tJQ9+12Hh366rzOmL91qQar8eDOi2lSLjC/xg0k98xvNbVfz
	m6b83G3B4aShMPiL39ZQO0TQgMv2IaCiz6lVl5vxgP0PJ4k23UvetQe0yT0I88e7AvgpRN/+zE7TG
	MQPwrpkPC6gZS2Hi/MBM6J3fNcvqFqHJLVndWIOSaA38g31EOMSzqYI8EQVlfonWQA+3yl0BUwbGr
	hzKYWZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yvE-00000006JNO-1SEa;
	Thu, 07 Nov 2024 09:35:24 +0000
Received: from mail.toke.dk ([45.145.95.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yv9-00000006JKf-2i1p;
	Thu, 07 Nov 2024 09:35:21 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1730972113; bh=A3gBPLxLIFjBUvT/9EO2DO8Lp/H909xwWuUilV/trcc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hMPqC1nqdZbu6JIOlIiGh/tEo0XoQaVFqxaQKpTMmrzMTI0Z51JWqX6tb123/ka/Z
	 80RM8u6wubPj8YKnZHy87BTlMuiQEn/UZA1X6A6P1gWo+1AuKpNwcY+68Ig26WP4SI
	 fJI7tyu7vdPYi2nh9oby8Fg1OCPwkc4KKA33CyS/MhmtWHZYQb6mk16iUiwqW7IFA+
	 Gycf+7r3Q4kXbC6UNJb+XZDtNG10TuQcjyRe0f2EA7h6YSbRi7kK0BispM8M0TVPhK
	 f4FjKx4qMWAhVxnVDBkl9psNyyt9lII4mdUthuyxmNP0J+qd8W++L9eMEJrQ+CDUiB
	 jNQwPYfvdD45A==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Kalle
 Valo
 <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, Arend van
 Spriel <arend.vanspriel@broadcom.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Peter Chiu
 <chui-hao.chiu@mediatek.com>, Breno Leitao <leitao@debian.org>, "Russell
 King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, wcn36xx@lists.infradead.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: Switch back to struct platform_driver::remove()
In-Reply-To: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
References: <20241106170706.38922-2-u.kleine-koenig@baylibre.com>
Date: Thu, 07 Nov 2024 10:35:13 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87fro375f2.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_013520_212835_4B88037B 
X-CRM114-Status: UNSURE (   6.11  )
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

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> writes:

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
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

For ath9k:

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>

