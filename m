Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80496C00A5A
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 05:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Spk79HNB2e0n8UMthiptw+/l95Xz8XDaOjjobjEN11Y=; b=aj68MYvredkryN
	6qDBHIyP64vDBRyj4cW2lw8UkS7l6FBoWjfDxD33yyQ6avgU7f3F09HdGHlpbKhk9353V+8CWQpkh
	YJVSxJpzArwozjQ7TNyFt/zuoz61RRbBm4/as1rDjANUHsHRaPhpDkU6Zz0zFEMFGHF6XZ6Si/vEY
	fMWihZUB6LBy7tVY1cc8RVKmekF6iGLAoIMOl1VGt1wv9l9C+IJToLNAX9kZES+DBeJJr4VHYXfO6
	skplzBCsP8/ilEGP5+xXJF/TunyRknBZy9avxx3Dh7OZFypokB7kL/d4CC7Kf4pe2hUb0zucju1Zg
	BYqKyp4z8Umvbtgf65ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINFY-003eEV-W3; Thu, 19 Jan 2023 05:14:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINFV-003eDc-M1; Thu, 19 Jan 2023 05:14:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28DCD61A60;
	Thu, 19 Jan 2023 05:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C09C433EF;
	Thu, 19 Jan 2023 05:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674105241;
	bh=vOpQ4Ds9jWqyGxR9dJ6k9KZUW8KJ9ISfjtx7rMdu5Vo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tSrDNfwWpTpr7+utoIBt0yr9qOIlNUR6q3GVm7F6C3MXYpzwIcJhJkPd/xCgjkW1Q
	 KyUqqDC98bCI0JpuVjU3GxTGPFSUYqyD5ihoBoEJZMwUz4b3XNABP08FYhJyySJVzv
	 BYBUdkpWnh3Mf0oky2BSSNGH4p14qIW/nDr8lIzptM4+m2/At9i4kvFInVW9z8sbFV
	 q2ksRhOjtceeaBxdAeuV/CoNi83BELbyNE03TPPtoMgl+ZtPN7AJTEOVPJOUEJMn58
	 yt706ICqTTwZ6u+tWi3ddued5oW/hSHksddbDe/ZkiZEyNnCyztmwO/jdfALAaYoMN
	 iZY4ZR/+17kcQ==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Felix Fietkau
 <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean
 Wang <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>,  de Goede
 <hdegoede@redhat.com>,  Tony Lindgren <tony@atomide.com>,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  ath11k@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: net: wireless: minor whitespace and name cleanups
References: <20230118175413.360153-1-krzysztof.kozlowski@linaro.org>
Date: Thu, 19 Jan 2023 07:13:52 +0200
In-Reply-To: <20230118175413.360153-1-krzysztof.kozlowski@linaro.org>
	(Krzysztof Kozlowski's message of "Wed, 18 Jan 2023 18:54:13 +0100")
Message-ID: <87bkmv85tb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_211405_797082_FB5929BF 
X-CRM114-Status: GOOD (  12.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Minor cleanups:
>  - Drop redundant blank lines,
>  - Correct indentaion in examples,
>  - Correct node names in examples to drop underscore and use generic
>    name.
>
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/wireless/esp,esp8089.yaml    | 20 +++---
>  .../bindings/net/wireless/ieee80211.yaml      |  1 -
>  .../bindings/net/wireless/mediatek,mt76.yaml  |  1 -
>  .../bindings/net/wireless/qcom,ath11k.yaml    | 11 ++-
>  .../bindings/net/wireless/silabs,wfx.yaml     |  1 -
>  .../bindings/net/wireless/ti,wlcore.yaml      | 70 +++++++++----------
>  6 files changed, 50 insertions(+), 54 deletions(-)

Thanks for the cleanup. Would you like to me to take this to
wireless-next or do you have other plans?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
