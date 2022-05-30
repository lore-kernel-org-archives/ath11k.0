Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B33C433EF
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RBojZKFIWyMqN8fgVIdWQkJ+gTVB2nnnQjFnymRBFA=; b=ledZV4L8MzOliM
	zNtDi4dL+SV+YsQkDfKcFz+8NMZJ5vkOmbyxriHr8jfymNozj5GfC6xACTTovbJBwc4217hZYVGoD
	JY0sn90DQa2I3GAQpJ6rUDgWwBo4efkPawYXFqbIkGpA2g/itkNw47Qm7IrBmuyeqnxlyzwHSJvlQ
	d7sz0wOYYFm8RSoLIrojQfYqZWpoVX5iTZl+wVy6tKlu0ZWGUUMHJhEpmUj8F1NSqmkEw99SnTaw4
	4s8W9Ros+tcVCxdg0/M2Zemnx4nVf6Wh6nKXKtEmMboJJLA26xX7pIJ7viav9t3hArZTFruKUTgOS
	8BOHqttfxWwOHzoUidZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdWm-006KZp-4h; Mon, 30 May 2022 11:25:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdWj-006KYv-Kt
	for ath11k@lists.infradead.org; Mon, 30 May 2022 11:25:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB79AB80D80;
	Mon, 30 May 2022 11:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC276C385B8;
	Mon, 30 May 2022 11:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653909934;
	bh=Wi/Gy+edutQVhd4CS7HA9wNwuHjoIQ8DWfESxJSRyeA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=eabv2gHvzXE/Vw20iHbRz/HZM5TBe99i+8yT4i3Lp6IU5LuFfHGQXjoFJF+7cYZ/R
	 Gcm2zKmrQNPCT9navyPt1+KTub/G6JJJf9/V5hSNdvhJ4rnCxKV93UL4LPoKZh6REy
	 UI5TcvA2fOfUVg+tx1uIZBMfKacO3cK+0UjESv3pzzC7AVIrbvC3uxRZQu4ZHXX3Rq
	 3JzjeTjzzaP+35sHfryGO9+tgBPAVYd7TiVlrYqVT3c9TJf31HUlVGlsPrsD9/e7FF
	 MCorDjIzc99OMRS1xpDDP2KdMtFHB1v9QwTzIGIdVemZxlLe1oSd+NVfPdsnnl2vbD
	 mpm3Lunejb6yQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: support avg signal in station dump
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1652965061-30457-1-git-send-email-quic_tmariyap@quicinc.com>
References: <1652965061-30457-1-git-send-email-quic_tmariyap@quicinc.com>
To: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165390993199.3436.1119696416291246316.kvalo@kernel.org>
Date: Mon, 30 May 2022 11:25:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_042537_879268_715DE588 
X-CRM114-Status: UNSURE (   8.21  )
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

Thiraviyam Mariyappan <quic_tmariyap@quicinc.com> wrote:

> Currently mac80211 doesn't calculate average signal when RSS(Receive side
> scaling) is enabled from the driver, so average signal isn't printed in
> the station dump. To address this issue, calculate the average signal
> from RSSI within driver and display in the station dump.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b205ce4c266c ath11k: support avg signal in station dump

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1652965061-30457-1-git-send-email-quic_tmariyap@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
