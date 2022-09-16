Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05134ECAAD8
	for <ath11k@archiver.kernel.org>; Fri, 16 Sep 2022 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7Y4fek8GHzHSq4SknXCQMdROIK/JHNQxWdXxECjdVQ=; b=2P9m9rFINNd4Ls
	JvXrhnDcQmB39ojYGco3g1TYXjZAVa7EHaTNyiukToOMwh0Hzd/vz/999AZkU4cb/s/yTAJ5rKaWf
	ytWCG6o4ZmvG8t/X/u7aXDSDjRrxK4SLQdFyMozhFLihcmgsGrp1n1ZKSwOE4zWWQynl1yp4LVEhk
	DcdWk3gHyJmA9yHEjs7UG0wk37npxNTO6XV7+Pciv57SsGGlnzoYd4dED1W+FWr/1AioQphhntHob
	OnDx38lU6QHdepBt/jCm2pILw7wSHyNO7zLkytODlH8VShdFLzKzU5OC9YZgZgvOV8u+4ZWd+wadp
	4OBo4XMlrQHvMvQ9fjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7gl-00Bhtb-Cq; Fri, 16 Sep 2022 09:31:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ7gj-00Bhsq-CX
	for ath11k@lists.infradead.org; Fri, 16 Sep 2022 09:31:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A3A53B824A7;
	Fri, 16 Sep 2022 09:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCEDC433D6;
	Fri, 16 Sep 2022 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663320666;
	bh=IzOoUg24TN9m11Bj4A89EKxSOI/fHreYBOqcQ26+NpI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SaERNwbmWTRBAJENT2/4FYvsIH6lYJ0YfbyAu/n6kIwzPcFomO+GOnVEudGS4b5nQ
	 7lpnuSxsqLRGacdL+OuVRgwP9ZzY3Zrt20VzWLxmG7ho68DkVjZDGG8PhI8/Y64Zom
	 afvh5eCpJEVI5386J3Ob2o/V9GFv3ip5co2LDPV7WJR4UobuzkRKsIU04RTgkZ+XTy
	 i4nZ4Rv99dyj1au6S+idnNqcB0dhRQiGTVadNMIaow7dCosA/XZMY9lQh/kqKQriL0
	 TsVJOY9qI60s9xbUuWoP8Fyb5pbK9e+VGBHhEQf0OEuypVA3cbC37nlce039HriAdv
	 iWw7n5A4bVkpg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: retrieve MAC address from system firmware
 if
 provided
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220914215408.372520-1-junyuu@chromium.org>
References: <20220914215408.372520-1-junyuu@chromium.org>
To: Jun Yu <junyuu@chromium.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Jun Yu <junyuu@chromium.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166332065994.16673.5878780244374823378.kvalo@kernel.org>
Date: Fri, 16 Sep 2022 09:31:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_023109_595572_CD0D6BEC 
X-CRM114-Status: GOOD (  11.89  )
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

Jun Yu <junyuu@chromium.org> wrote:

> Devices may provide their own MAC address via system firmware (e.g.,
> device tree), especially in the case where the device doesn't have a
> useful EEPROM on which to store its MAC address (e.g., for integrated
> ahb WCN6750).
> 
> Use the generic device helper to retrieve the MAC address, and (if
> present) honor it above the MAC address advertised by the card.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Jun Yu <junyuu@chromium.org>

Fails to build:

drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_register':
drivers/net/wireless/ath/ath11k/mac.c:8999:9: error: too many arguments to function 'device_get_mac_address'
 8999 |         device_get_mac_address(ab->dev, mac_addr, sizeof(ab->mac_addr));
      |         ^~~~~~~~~~~~~~~~~~~~~~
In file included from ./include/linux/ieee80211.h:20,
                 from ./include/net/mac80211.h:20,
                 from drivers/net/wireless/ath/ath11k/mac.c:7:
./include/linux/etherdevice.h:35:5: note: declared here
   35 | int device_get_mac_address(struct device *dev, char *addr);
      |     ^~~~~~~~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:249: drivers/net/wireless/ath/ath11k/mac.o] Error 1
make[4]: *** [scripts/Makefile.build:465: drivers/net/wireless/ath/ath11k] Error 2
make[3]: *** [scripts/Makefile.build:465: drivers/net/wireless/ath] Error 2
make[2]: *** [scripts/Makefile.build:465: drivers/net/wireless] Error 2
make[1]: *** [scripts/Makefile.build:465: drivers/net] Error 2
make: *** [Makefile:1853: drivers] Error 2

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220914215408.372520-1-junyuu@chromium.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
