Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF00EC38159
	for <ath11k@archiver.kernel.org>; Wed, 18 Jan 2023 06:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4vtKdHAHoPzic0+AlHTXZkdfzTEGY78CoC7jsGDSRM=; b=oS0Q31iUNhSB9L
	xQLZXwiwp3RwTg4Vv/m5H7dDZnhKRpAGln0Tx/Mwek2gjLBPWgtLuTxte1kpGKXXdPpHUhl8DdNGS
	M9V8yETkUg/leMgjcF7TXv4o911eWsTZNcO5cEQ5gExOut+35Vftgn7oq98xpGfu4APB5NekxkGJY
	waPkvNAs2WiSmkXOr34tf+qkHkSRtyUFg2hzfo87N+IB2z7l5QynEXzHe/NyjfIw+5Z3Nh1fW2/Ay
	uBRi9kJlEnjFIYK3fSpAcB0kgSGjzBb098kUR8cGOLf32EOxG66TveboTmTXVAZFvbz3J0sqyI3UQ
	Cu+evLM7kCGD7So0THxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1sc-00H5Ww-UR; Wed, 18 Jan 2023 06:25:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI1sZ-00H5Up-At
	for ath11k@lists.infradead.org; Wed, 18 Jan 2023 06:25:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6101461695;
	Wed, 18 Jan 2023 06:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50B5C433D2;
	Wed, 18 Jan 2023 06:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674023095;
	bh=7jmwhEllwM5W/V6xnSwPgvXkrbqwQ8kpfh3maIEmMOs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GV4oEAZo4SaVY7MsDHPKAHwrfCm+6LFA8jcIRPuJ2Fq2IBmB9e7sGXMrO76V6iY8l
	 2X6TK25u5YSJJc6Bj0YZL7AzeSdAZv/idi8WMHTecy4sYqPR3BHrB2HrOd6s4+Zesm
	 XK9exsRwEB1kv9/OAc/dqdMXwHR5gVmCLryiCjvdHff0iv175TsSamBHQsQoB/vAAN
	 roPqFJBTfTKGiKeMJIGwO29+zzdlaRYW7dm+jKF90Oo7TzEgv0R11cw3Zm0fSaeW8P
	 tdk2T2eyJjabn5PHGm7LGm1Wc0Kzq9LFEAe3+VTOetlxCh8bgsE24tQU82x/ssAOwo
	 PZHyrQWMkwzxA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix ce memory mapping for ahb devices
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230113063209.7256-1-quic_rajkbhag@quicinc.com>
References: <20230113063209.7256-1-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167402309000.24104.9044414885510659579.kvalo@kernel.org>
Date: Wed, 18 Jan 2023 06:24:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_222459_490489_32B33E83 
X-CRM114-Status: GOOD (  16.82  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> Currently ath11k_ahb module is not loaded successfully and the wifi
> interface is not created. Kernel trace is seen while loading the
> ath11k_ahb module. The issue is seen in all ath11k AHB devices except
> in IPQ5018.
> 
> This happens because in ath11k_ahb_probe(), ab->mem_ce is initialized
> with the value of ab->mem. However, at this instant ab->mem is not
> yet set.
> 
> Later, during write to a particular memory via ath11k_ahb_write32()
> this ab->mem_ce is used with particular offset. Since ab->mem_ce is
> not set properly this possibly leads to memory conflict to handle
> kernel paging request and the below trace is seen.
> 
> [   93.035047] Unable to handle kernel paging request at virtual address ffff800100a00000
> [   93.035083] Mem abort info:
> [   93.041869]   ESR = 0x0000000096000045
> [   93.044561]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   93.048377]   SET = 0, FnV = 0
> [   93.053840]   EA = 0, S1PTW = 0
> [   93.056704]   FSC = 0x05: level 1 translation fault
> [   93.059745] Data abort info:
> [   93.064603]   ISV = 0, ISS = 0x00000045
> [   93.067729]   CM = 0, WnR = 1
> [   93.071287] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000042219000
> [   93.074409] [ffff800100a00000] pgd=100000007ffff003, p4d=100000007ffff003, pud=0000000000000000
> [   93.081195] Internal error: Oops: 0000000096000045 [#1] PREEMPT SMP
> [   93.089598] Modules linked in: ath11k_ahb ath11k_pci ath11k qmi_helpers
> [   93.095851] CPU: 2 PID: 66 Comm: kworker/u8:3 Not tainted 6.1.0-rc8-wt-ath-658126-g58e4b9df840c-dirty #2
> [   93.102454] Hardware name: Qualcomm Technologies, Inc. IPQ8074/AP-HK14 (DT)
> [   93.112171] Workqueue: ath11k_qmi_driver_event ath11k_qmi_driver_event_work [ath11k]
> [   93.118856] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   93.126838] pc : ath11k_ahb_write32+0xc/0x18 [ath11k_ahb]
> [   93.133520] lr : ath11k_hal_srng_setup+0x860/0x8f0 [ath11k]
> [   93.139075] sp : ffff80000aaebb70
> [   93.144452] x29: ffff80000aaebb70 x28: 0000000000000020 x27: ffff80000aaebc50
> [   93.147934] x26: ffff000004923750 x25: ffff000004921200 x24: ffff000004928000
> [   93.155051] x23: 0000000000000020 x22: ffff000004930000 x21: ffff000004923200
> [   93.162170] x20: ffff000004920000 x19: 00000000eea00000 x18: ffff0000049200f0
> [   93.169288] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000000025e
> [   93.176405] x14: ffff000003c414f0 x13: 0000000000000000 x12: 0000000000000008
> [   93.183524] x11: ffff000003c41488 x10: 0000000000000040 x9 : 0000000000000000
> [   93.190641] x8 : ffff80000a9dd100 x7 : 0000000000000000 x6 : 000000000000003f
> [   93.197759] x5 : ffff800100a00400 x4 : ffff8000031f4018 x3 : 0000000000000004
> [   93.204877] x2 : 0000000047b62000 x1 : ffff800100a00000 x0 : ffff800012000000
> [   93.211996] Call trace:
> [   93.219104]  ath11k_ahb_write32+0xc/0x18 [ath11k_ahb]
> [   93.221366]  ath11k_ce_init_ring+0x184/0x278 [ath11k]
> [   93.226576]  ath11k_ce_init_pipes+0x4c/0x1a0 [ath11k]
> [   93.231610]  ath11k_core_qmi_firmware_ready+0x3c/0x568 [ath11k]
> [   93.236646]  ath11k_qmi_driver_event_work+0x168/0x4f8 [ath11k]
> [   93.242376]  process_one_work+0x144/0x350
> [   93.248275]  worker_thread+0x120/0x430
> [   93.252352]  kthread+0xf4/0x110
> [   93.255997]  ret_from_fork+0x10/0x20
> [   93.259043] Code: d503201f f94e1c00 8b214001 d50332bf (b9000022)
> [   93.262863] ---[ end trace 0000000000000000 ]---
> 
> However, for the device IPQ5018 ath11k_hw_params .ce_remap is
> defined. This parameter is used to recalculate ab->mem_ce and hence,
> this issue is not seen in IPQ5018.
> 
> Hence, fix this by initializing ab->mem_ce after ab->mem is set.
> ab->mem is set inside the ath11k_ahb_setup_resources() therefore
> initialize ab->mem_ce after ath11k_ahb_setup_resources().
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: b42b3678c91f ("wifi: ath11k: remap ce register space for IPQ5018")
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

53a998c4d728 wifi: ath11k: fix ce memory mapping for ahb devices

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230113063209.7256-1-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
