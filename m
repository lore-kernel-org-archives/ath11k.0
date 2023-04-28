Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34107C77B60
	for <ath11k@archiver.kernel.org>; Fri, 28 Apr 2023 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mysQbLHbqGiG9bLPOpNU21vEWbFrCygDKoFS/NcPNmo=; b=XYsQ24La8MZh84
	loBP7a+cg/YgGYKP+DAM1iTb0RSQI8+hsM7LUCfluuQOr1fy6GycZF2ejgtHJSFzz4ZnbX1kmDmj3
	eE+kc0jZI4pKlcKLmBlPPTYCI/B4oH2c0aWk9ym3N5Y5WOAwgiS/xeeJU9KZs/5kjGRo4bv/2dJyA
	ePlZcTYehmLWnZgxlmFb7/4uksQqIwEu1uuuWeK+qA/0bhAoke1PpTizislyoFHEw/ceWTqYuvFP3
	s4Ir00QFtZbx1IJ/QMXSdme/wlb4q3ecdmcwpp13UeWDzNbAGRgybPZ9uzsqD9kd51/Rsq3vfxQlB
	Ieh8jx5iE1LJVh9NQZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psRRc-00BI54-0c;
	Fri, 28 Apr 2023 16:59:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psRRZ-00BI4M-1r
	for ath11k@lists.infradead.org;
	Fri, 28 Apr 2023 16:59:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDF8963144;
	Fri, 28 Apr 2023 16:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F310C433D2;
	Fri, 28 Apr 2023 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682701176;
	bh=7esWrEVtpM0D1QFAqlbVaGPSU+0prTZHbm36nyQD0yU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TAD/ph12mpVD9wU73jLRz/U0goAYl8O/IrMsCsATDk86SQsWjYciJ5hKXddbxMV/k
	 GXtwhGVcMNSa6ESKdKCKpw6w+B4XxF/ff2sjYLx5jFMXVai45h6w5qF7FkPRWF5/VW
	 ER4maO6m9wfv+VQKml0bumebaDxW0khih19sQ2jjwCxofakRBtadmqher99aUHy3A9
	 TVdkFf/Z/fpDKin7knOappwZ9PrRQbUXZ9hgY/7E/FEbM9qJfaofalR+pTA11SUueb
	 P+4D07+++/eOFQ5VsVWBTEQ/rP5n8ulHWeCan/ZCORg5jk7G7Hw3FmCcebDw8sstMg
	 u6udrq8k9DzZQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix registration of 6Ghz-only phy without the
 full
 channel range
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230421145445.2612280-1-mbizon@freebox.fr>
References: <20230421145445.2612280-1-mbizon@freebox.fr>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Maxime Bizon <mbizon@freebox.fr>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168270117368.13772.4483657458244576422.kvalo@kernel.org>
Date: Fri, 28 Apr 2023 16:59:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_095937_688312_FFE36A9E 
X-CRM114-Status: UNSURE (   9.38  )
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

Maxime Bizon <mbizon@freebox.fr> wrote:

> Because of what seems to be a typo, a 6Ghz-only phy for which the BDF
> does not allow the 7115Mhz channel will fail to register:
> 
>   WARNING: CPU: 2 PID: 106 at net/wireless/core.c:907 wiphy_register+0x914/0x954
>   Modules linked in: ath11k_pci sbsa_gwdt
>   CPU: 2 PID: 106 Comm: kworker/u8:5 Not tainted 6.3.0-rc7-next-20230418-00549-g1e096a17625a-dirty #9
>   Hardware name: Freebox V7R Board (DT)
>   Workqueue: ath11k_qmi_driver_event ath11k_qmi_driver_event_work
>   pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : wiphy_register+0x914/0x954
>   lr : ieee80211_register_hw+0x67c/0xc10
>   sp : ffffff800b123aa0
>   x29: ffffff800b123aa0 x28: 0000000000000000 x27: 0000000000000000
>   x26: 0000000000000000 x25: 0000000000000006 x24: ffffffc008d51418
>   x23: ffffffc008cb0838 x22: ffffff80176c2460 x21: 0000000000000168
>   x20: ffffff80176c0000 x19: ffffff80176c03e0 x18: 0000000000000014
>   x17: 00000000cbef338c x16: 00000000d2a26f21 x15: 00000000ad6bb85f
>   x14: 0000000000000020 x13: 0000000000000020 x12: 00000000ffffffbd
>   x11: 0000000000000208 x10: 00000000fffffdf7 x9 : ffffffc009394718
>   x8 : ffffff80176c0528 x7 : 000000007fffffff x6 : 0000000000000006
>   x5 : 0000000000000005 x4 : ffffff800b304284 x3 : ffffff800b304284
>   x2 : ffffff800b304d98 x1 : 0000000000000000 x0 : 0000000000000000
>   Call trace:
>    wiphy_register+0x914/0x954
>    ieee80211_register_hw+0x67c/0xc10
>    ath11k_mac_register+0x7c4/0xe10
>    ath11k_core_qmi_firmware_ready+0x1f4/0x570
>    ath11k_qmi_driver_event_work+0x198/0x590
>    process_one_work+0x1b8/0x328
>    worker_thread+0x6c/0x414
>    kthread+0x100/0x104
>    ret_from_fork+0x10/0x20
>   ---[ end trace 0000000000000000 ]---
>   ath11k_pci 0002:01:00.0: ieee80211 registration failed: -22
>   ath11k_pci 0002:01:00.0: failed register the radio with mac80211: -22
>   ath11k_pci 0002:01:00.0: failed to create pdev core: -22
> 
> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e2ceb1de2f83 wifi: ath11k: fix registration of 6Ghz-only phy without the full channel range

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230421145445.2612280-1-mbizon@freebox.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
