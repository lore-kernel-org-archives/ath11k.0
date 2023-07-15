Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F6C001B0
	for <ath11k@archiver.kernel.org>; Sat, 15 Jul 2023 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALDo05jRJXOpL9gipKXdQNGBrDpFTHAMVdnFMEYyhZM=; b=aUTxShRuQDvUgq
	g1lIoFXBrAifAyqP7o6KMHxxHjcAe9/vz4bFGkic4ofvIRIVLt6PK+5zQfSZ98CZILscCnSayfFpq
	VUNalNVkLJC19jYMXn5JnGv1bvOaNKGg5H9md2GIU9yLxVaklD6cAtW8ICN6CqegbOd6PDARDA2NU
	XbwTtGfQf+1XxNHNu8R1CwbQjmVP2yU/Ty8t0MfxMdyyrvHM7xz+Z1JjYi+cQMkkDub452UfyRZpH
	d4eI3khgatnF8KV+D1b1N4rK+3tJT7IpDjuJSyeRUIJmKyBGThq3nQirNUFL1hKeXUWN87QmLCE22
	wHSVsUq/cFBTrg4B3tog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgwA-0090wP-0G;
	Sat, 15 Jul 2023 15:11:58 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKgw3-0090t9-23
	for ath11k@lists.infradead.org;
	Sat, 15 Jul 2023 15:11:55 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-346129c9512so6465595ab.1
        for <ath11k@lists.infradead.org>; Sat, 15 Jul 2023 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689433909; x=1692025909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=;
        b=KpbiwA9NRF8+W6tdUk7oAEajedYliLcT3fLwx1hKWNPafETFpJG9nnPmhVRp1UdI1a
         ec9mVwfBesk49WkdsrPfeQTQNowRCIhbKJuP16XD7dO7TZekJ8yDxNsj6kgUO5dmVinN
         O/xItmOPmt9BnCnKdfjfmpm5zf8eizKb7wHPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433909; x=1692025909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=;
        b=dRU569k7yLG7QfcWUIYTUUzaFWXA44Y+icaP8dZIh5DQJ3Ow2Tv5JONJN9nLQz6kVd
         FY4j0uJURW/IZ6Oy1BTqW6gUhd+htKmT7UX62DqUBGDMhhHplO5Z1OYogZCOlsLyO4d4
         urv5cSUsHAzPQLX4DckLspKt6cQ8A9JT7Plj5T52mdPDX9gOi9LFcvVyJQcY0F+c3q/o
         wvTutES/sZ+vmUGbecjXpHQFkIU1zwkgxeOwqOIjufQc3sTaNQ4rvy0dCY0CBzNedc6X
         9zsqyVBJI0N9xLB+dWWarzYT7Z8YjjLpEuy2t0B5+J+CO95c8U/GVJGKKppF0IV/x7je
         I79g==
X-Gm-Message-State: ABy/qLaFi+8s4Z2wpMUYnfMcWYXeO9iHzXzssxl0N0aug+AjBfg3Ed15
	ZfJehA7KokasyiVQMC57X5Ep0g==
X-Google-Smtp-Source: APBJJlGJVqbBu5lKEA54CgyQF24n/fOTJfhIYz9w3XH4VGOvH3KCmWksDsEmgsEiSCeG83sO26Hgmw==
X-Received: by 2002:a05:6e02:1148:b0:343:ef5e:8286 with SMTP id o8-20020a056e02114800b00343ef5e8286mr3847417ill.7.1689433909634;
        Sat, 15 Jul 2023 08:11:49 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id f8-20020a056638022800b0042b2959e6dcsm3321388jaq.87.2023.07.15.08.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 08:11:48 -0700 (PDT)
Message-ID: <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
Date: Sat, 15 Jul 2023 10:11:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] net: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wpan@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 wcn36xx@lists.infradead.org
References: <20230714174809.4060885-1-robh@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_081151_683697_A941C0EC 
X-CRM114-Status: GOOD (  14.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 7/14/23 12:48 PM, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

(I significantly reduced the addressee list to permit the message
to be sent.)

For "drivers/net/ipa/ipa_main.c":

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/net/can/bxcan.c                                 | 1 -
>   drivers/net/can/ifi_canfd/ifi_canfd.c                   | 1 -
. . .
>   drivers/net/ieee802154/ca8210.c                         | 1 -
>   drivers/net/ipa/ipa_main.c                              | 2 +-
>   drivers/net/pcs/pcs-rzn1-miic.c                         | 1 +
>   drivers/net/phy/marvell-88x2222.c                       | 1 -
>   drivers/net/phy/mediatek-ge-soc.c                       | 2 --
>   drivers/net/wireless/ath/ath10k/ahb.c                   | 2 +-
>   drivers/net/wireless/ath/ath11k/qmi.c                   | 1 -
>   drivers/net/wireless/ath/wcn36xx/main.c                 | 3 +--
>   drivers/net/wireless/intersil/orinoco/airport.c         | 2 +-
>   drivers/net/wireless/mediatek/mt76/mt7915/soc.c         | 1 -
>   drivers/net/wireless/silabs/wfx/bus_sdio.c              | 2 +-
>   net/core/of_net.c                                       | 1 +
>   124 files changed, 110 insertions(+), 120 deletions(-)

. . .

> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 6a2f2fc2f501..da853353a5c7 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -13,8 +13,8 @@
>   #include <linux/firmware.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_device.h>
>   #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/soc/qcom/mdt_loader.h>

. . .

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
