Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A92C433FE
	for <ath11k@archiver.kernel.org>; Mon, 31 Jan 2022 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgapiUiZ8LOWHnvb+F8cSewtG3TdTTOQ7Hyou7aHAeQ=; b=4uNxm0DaDDCTCX
	e7q87byrcGC2YPmuevIRiEQclD24ohe6nLIYwtNYiOqRJTLbFNoBDVXAIFQs4qJeYqypGOc+ctuE3
	KsWWHUqiF84ZCfAYn00AZFj+sKXqjDIXTznXtnmeikZ3ZPTEPQDfJMUaIxCAUPKwRjclOrmZwiWqn
	sr6LDNqvQPejBLvxcFv+9zKxsxoeLAjgzuelTMb6qJZ0ZoEpSTjEhYhXt028c+X+bS649ojkDOgrs
	kosb63JyJPk01N95GV7h/9Fq+Z2o5a/w2t7BIZeZ0rDoGDWJGMD3Q75oLtuj2IVRSLbB3ZrlK3I1s
	xKXulnj7vcZyGMZyiwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEXDD-009YqJ-I1; Mon, 31 Jan 2022 13:59:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEXDB-009Ype-6I
 for ath11k@lists.infradead.org; Mon, 31 Jan 2022 13:59:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85BB0612B3;
 Mon, 31 Jan 2022 13:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01647C340E8;
 Mon, 31 Jan 2022 13:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643637556;
 bh=kjst7BiRgr7hcjgnucz5mfypSORvuD8Jjv/m20W+2hg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=RWCM/N+z9aFcbK7r5piU+kZTPEeMoxoerpT9xi56PbM0HAST6wcS2WTdNgN9NLNGx
 gbbV51PyooUKBV2SezIjoOTGpX/X3t5I+2S48uNPF7vJ5IQLsxSvqZv+HjXd5cJ7Ni
 f7IjdIV0ISqHFeTmbfVsFNwgf3bUqHeHLQNRsM64spX1tAalAmHhv2FWiXU3XfmKlw
 TR0BUICBMi6/u7qIhzSPZk0wMWSfs4vdm0BA1ZUVKiwi16eTdgZ9WrZRW8GpOaQWdE
 nh5Wg54wW7jbKGkhJrvH/zF/4ki5k1s/nVAwyVMaw6UpcCpoi9N7HAjXY6aVO6LPtb
 lL7CH1fN9DZkQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix kernel panic during unload/load ath11k modules
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1642583973-21599-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1642583973-21599-1-git-send-email-quic_vnaralas@quicinc.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164363755329.22527.8615778037312611873.kvalo@kernel.org>
Date: Mon, 31 Jan 2022 13:59:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_055917_343240_4D225B00 
X-CRM114-Status: UNSURE (   8.71  )
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> wrote:

> Call netif_napi_del() from ath11k_ahb_free_ext_irq() to fix
> the following kernel panic when unload/load ath11k modules
> for few iterations.
> 
> [  971.201365] Unable to handle kernel paging request at virtual address 6d97a208
> [  971.204227] pgd = 594c2919
> [  971.211478] [6d97a208] *pgd=00000000
> [  971.214120] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [  971.412024] CPU: 2 PID: 4435 Comm: insmod Not tainted 5.4.89 #0
> [  971.434256] Hardware name: Generic DT based system
> [  971.440165] PC is at napi_by_id+0x10/0x40
> [  971.445019] LR is at netif_napi_add+0x160/0x1dc
> 
> [  971.743127] (napi_by_id) from [<807d89a0>] (netif_napi_add+0x160/0x1dc)
> [  971.751295] (netif_napi_add) from [<7f1209ac>] (ath11k_ahb_config_irq+0xf8/0x414 [ath11k_ahb])
> [  971.759164] (ath11k_ahb_config_irq [ath11k_ahb]) from [<7f12135c>] (ath11k_ahb_probe+0x40c/0x51c [ath11k_ahb])
> [  971.768567] (ath11k_ahb_probe [ath11k_ahb]) from [<80666864>] (platform_drv_probe+0x48/0x94)
> [  971.779670] (platform_drv_probe) from [<80664718>] (really_probe+0x1c8/0x450)
> [  971.789389] (really_probe) from [<80664cc4>] (driver_probe_device+0x15c/0x1b8)
> [  971.797547] (driver_probe_device) from [<80664f60>] (device_driver_attach+0x44/0x60)
> [  971.805795] (device_driver_attach) from [<806650a0>] (__driver_attach+0x124/0x140)
> [  971.814822] (__driver_attach) from [<80662adc>] (bus_for_each_dev+0x58/0xa4)
> [  971.823328] (bus_for_each_dev) from [<80663a2c>] (bus_add_driver+0xf0/0x1e8)
> [  971.831662] (bus_add_driver) from [<806658a4>] (driver_register+0xa8/0xf0)
> [  971.839822] (driver_register) from [<8030269c>] (do_one_initcall+0x78/0x1ac)
> [  971.847638] (do_one_initcall) from [<80392524>] (do_init_module+0x54/0x200)
> [  971.855968] (do_init_module) from [<803945b0>] (load_module+0x1e30/0x1ffc)
> [  971.864126] (load_module) from [<803948b0>] (sys_init_module+0x134/0x17c)
> [  971.871852] (sys_init_module) from [<80301000>] (ret_fast_syscall+0x0/0x50)
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.6.0.1-00760-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

22b59cb965f7 ath11k: fix kernel panic during unload/load ath11k modules

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1642583973-21599-1-git-send-email-quic_vnaralas@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
