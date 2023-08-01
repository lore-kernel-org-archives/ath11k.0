Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AADC001E0
	for <ath11k@archiver.kernel.org>; Tue,  1 Aug 2023 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssgyYjxdsuhAJLr9BVPisNWcuooli2K6NbFYjMR64Xs=; b=T71PyT0madsUhG
	HZP3zjpVbaBKN2W+91XqREo/wTknAa+GHavj8qacxucjn3cNzVVPU9EvU5Pcux+L3mGfeSJAzAPZH
	1Fq7RpNgIWUnGpldhK39mnuR19b7EwZ5hniegQOA6aiB4f6ek769uMthj9d64h4R2D7/f9f7mVRs6
	OLq//YobvGr5SLKosSwFg3FXKudqb1FDSp4AzgKC4auynoTJlN0Kj3ZehjwUEwaH0ZPQUt9r98PK7
	CHN48CiODBf6TrWGZ5tGzfYNO0Q8Knm9UVcJqAku0IO2PEUI8oboYnVkV6xuNq8Nh2bvonS4gmLcz
	o73Jq/4uypRi2EBPrPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqgA-002dqK-10;
	Tue, 01 Aug 2023 14:48:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqg6-002dpT-2i;
	Tue, 01 Aug 2023 14:48:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2588615A9;
	Tue,  1 Aug 2023 14:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADCAC433C7;
	Tue,  1 Aug 2023 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690901329;
	bh=nT8gUQ6qDAmcesueSE4m0Nz7EwpMx5l0NtHDJ0UaUKc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YNcdFczYzaieRuS9r1BQyiKUAmTILRQLhyy9Bdhw4fY7U6RKJHISLOpTIpTQTWOWG
	 qjpntf0uj4YT8FUENS/vE151qxVlzro8RDEMDu3Ix/i6u5DPhWQS9yj019zH+5dmb/
	 dQbhnMlk26ZEVpJ7+Y2i5OLH8a12tjJ5q2SlvL4X1sZDHXiKzmBz0v/QRCwyzVe5T+
	 x7I2LFOvRrXEnxy2C+T1eaqmUhXbDmAb/NbeM5Rm+XpOP+q9wJkDeq84xVWyYyrmWb
	 gihdh3gxke8iWCdpm108MZ2XHbsc385uwa0Ejgod2lvTOgHWmCQUgT5bRbBdsmFX41
	 IeBO6cPajX/6w==
MIME-Version: 1.0
Subject: Re: [v2] wifi: drivers: Explicitly include correct DT includes
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230724211914.805876-1-robh@kernel.org>
References: <20230724211914.805876-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno  <angelogioacchino.delregno@collabora.com>,
 =?utf-8?b?SsOpcsO0bWUgUG91aWxsZXI=?=  <jerome.pouiller@silabs.com>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 wcn36xx@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169090132389.212423.4907787613050355047.kvalo@kernel.org>
Date: Tue,  1 Aug 2023 14:48:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_074850_964932_837041F0 
X-CRM114-Status: UNSURE (   8.79  )
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

Rob Herring <robh@kernel.org> wrote:

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

Patch applied to wireless-next.git, thanks.

e7899a90cebe wifi: drivers: Explicitly include correct DT includes

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230724211914.805876-1-robh@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
