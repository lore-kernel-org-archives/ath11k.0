Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D50C636D4
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07O5AK7QsieJlp4gjsvMSACtCK2WRdYTDfVvNdELdfg=; b=Qbuib4qhJ1LIlE
	xB9+cCKlMEMKqiyw6S+77BNcCp3qudoXbrQiaKhfs4Pcf2A02132co70KL8fzDCQ2mwh1tHN856Jw
	omiKAaVSw9jqGyLMqpbypF4Ci4iYPLWoZFoWcwdJjLsBu6fePxPElxVLpZymzAMKNSjbHbtsLAOAc
	mUdRMgQn3RCYIniudkS572BS0DbgJ51OwN7wk0T73lxtVrE65cmo1kQBGVHraJuC3FZ0tKbugWsHw
	1gLITWQrpzUyGcLT+hOmj4FOczqkDxM6rqStiDQE13szZqxkRan0BRA6OCOUQ200jy7Si+m/P5zeI
	n8UXeR2TDojyW9NbJ5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRc28-00FZoG-4E; Mon, 13 Feb 2023 16:50:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRc24-00FZmu-Qx; Mon, 13 Feb 2023 16:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 62C4E611DC;
	Mon, 13 Feb 2023 16:50:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC7DC433D2;
	Mon, 13 Feb 2023 16:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676307023;
	bh=Rj4b5OcNcUEi5G0PXsOiV12Dhn98uCWgxCg+T++ejCI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=j9mnAfY33kOYp1aEXfqKhjBSTcecFDWKKpag1CJabG2XcUzUDPARmvil8fop/LYAi
	 N+z3B/WUT5E+yEqZKt0oQefjPuniz0XZzWOCCVpDG98eZtmT+t8SYsnhpvvXxUnOO5
	 gBHCby+4stmRtAYK8k/szM9bentQSj6765/O/i4uXsrHgVGoJCZIDMGlybAsaM3pkg
	 ooqCeyseBW2dnFQeUZvHEhuNxexfwBNzKwCPq1Y6dcyAsG9ikdM5nKyzXMgdQxqGUo
	 ZDARxWX2fRqFYDFa1vTXwIrB4fn0FGJ6lbIcOJYeJggi9QcL64C8pn7Soai2IfQcvE
	 amaXGKuIULFng==
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: net: wireless: minor whitespace and name
 cleanups
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230118175413.360153-1-krzysztof.kozlowski@linaro.org>
References: <20230118175413.360153-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, =?utf-8?b?SsOpcsO0bWUgUG91aWxs?=
	=?utf-8?b?ZXI=?=  <jerome.pouiller@silabs.com>,
 de Goede <hdegoede@redhat.com>, Tony Lindgren <tony@atomide.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ath11k@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167630701594.12830.46272053415017973.kvalo@kernel.org>
Date: Mon, 13 Feb 2023 16:50:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_085024_945985_187BC4E0 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Minor cleanups:
>  - Drop redundant blank lines,
>  - Correct indentaion in examples,
>  - Correct node names in examples to drop underscore and use generic
>    name.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied to wireless-next.git, thanks.

1c30e9c0c8eb dt-bindings: net: wireless: minor whitespace and name cleanups

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230118175413.360153-1-krzysztof.kozlowski@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
