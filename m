Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E38C25B50
	for <ath11k@archiver.kernel.org>; Mon, 23 Jan 2023 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0bjb3Nyi4h3FQgTxS52pRt6KVjFEh8qoOSewmzq7Us=; b=z9ct2VmzfBKAUR
	/LFiMfcbEg/KieiNzuu88Pb7zTuSo5yfP7bjIOrYwR1/OLI7HJIb4xZzzmhzZnaZDxGGyVys2CliM
	d+gVzjAlSXWYALEGP5c2JRpaL1h59fcxP8vvN4wa8+qf+0hQi8gyMP0Cv0da2fozqOA2x5hkM+yle
	0VSLEX9phZtL2AdeoCZEvs6eIRFDLQuU6/fvCGKr1HsynBIZFmb4NsjtAd1TZJQRgKyrHzgfLzK3p
	Lb95Q7tOtJPtQXBaU9DfcbkFW7qKxtN8nlEa+2UwQIPnh2PfNRjLu1WDAqs5BZmJckbSKR2hM3txI
	WCby3PyB/J2v/4q5QwBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3Gx-001IGx-KI; Mon, 23 Jan 2023 20:18:31 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3Gl-001IAr-M7; Mon, 23 Jan 2023 20:18:20 +0000
Received: by mail-oi1-f180.google.com with SMTP id r205so11411439oib.9;
        Mon, 23 Jan 2023 12:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mK0iGLqhByM+nmssrOHeinttd969xwUfXTpdV4dep5c=;
        b=C+862ckUy5jmDZ/NR5Xfa4AFUoLPm9AP3hp2mzM+w2keXNTeZ0qz/HuqRJGT8Z3xPv
         rosQFXu3bYcCKHIixk6vpKlcDCJ2lofZmDStmpjaAw02ERQ75ahg5HzyVZvyth3Sqpw5
         t+ZInJTsYkdLkkq6YgJw8N1r5ksZA6aZAF1cVEosYj107XAyWJbdDPlJZJ9x1JQEVfAf
         D5AbnojycdP8g0XgAx1lLpJ3qfoMPycdYK3l3IvWpf3H2FU/mlghUULIfTMMSzGJiIz2
         0p3evQzJTb9YhNyWbnC81nyTM4H46PpmER9h4ZQgwptkmzpihQbXhXBWD+AHPAmSYxEK
         IYWA==
X-Gm-Message-State: AFqh2kqH97Ho8fVNj/y4QRbOvWjRbrBxk/5EQ4VaqrmCN4gkeExs1Wqx
	9KEcI4/qBWO+nocJUHxZ8Q==
X-Google-Smtp-Source: AMrXdXvG469eglRB6stlMcR9S5LSQ9Bd8cqzftLdjrwTlwQV82cvdD2vmDaBK/X/vfCMNq4asQc4ZA==
X-Received: by 2002:aca:3205:0:b0:364:be69:fbc with SMTP id y5-20020aca3205000000b00364be690fbcmr12402093oiy.9.1674505097515;
        Mon, 23 Jan 2023 12:18:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w21-20020a056808091500b0036eafb8eee9sm147503oih.22.2023.01.23.12.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:18:17 -0800 (PST)
Received: (nullmailer pid 2454843 invoked by uid 1000);
	Mon, 23 Jan 2023 20:18:16 -0000
Date: Mon, 23 Jan 2023 14:18:16 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, ath11k@lists.infradead.org, de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, =?iso-8859-1?B?Suly9G1l?= Pouiller <jerome.pouiller@silabs.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: wireless: minor whitespace and name
 cleanups
Message-ID: <167450509566.2454785.18050476344855369899.robh@kernel.org>
References: <20230118175413.360153-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118175413.360153-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_121819_739223_C14104B6 
X-CRM114-Status: GOOD (  10.18  )
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


On Wed, 18 Jan 2023 18:54:13 +0100, Krzysztof Kozlowski wrote:
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
> 

Acked-by: Rob Herring <robh@kernel.org>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
