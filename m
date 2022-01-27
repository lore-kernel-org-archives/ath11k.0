Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06109C433F5
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 23:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ujjdfVpvvG3urmw32IuPoSCR8UnXtExRf4yXjEdJnk=; b=yuou8CyMonbIys4CC3kqLZU74T
	2qXk3a9qlSq5XOR8S8rzN4puTYwpuS+fPfemrWCIj9+hKhmNJbAM9jV2dVSsJNGTxwQGwpynFf+h5
	dzSB0vcqMXTkEG7DuwC3Okm7nAX19q5F2RTyhHMdxwriKvXady/i8M87l5Lhviu8gzENdLyi1eWhC
	Yzn+OUEkuQxE4fWIRNVCHsw/ny91N0JDDBBU92+ai9Gj+OoEaU7OSrwX2+VJn9c1xGpe4bLEnRZql
	qRmzINZGrRb5goIkXNuF8php8UjMBY0oG6OJMSXbZQ05eOuzDg5ReBtp3e20VNNsuH8jqvrCLrMN4
	5CQ1rHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDEK7-00HPIS-8f; Thu, 27 Jan 2022 23:37:03 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDEK5-00HPH7-9l
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 23:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643326621; x=1674862621;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=J9hXZhgciQyK7s6eyyxJpHKLbud2Btk9MwaiOg9K65A=;
 b=yaXgJkRj7asQKN9gO+D0kGfGHk5jHfjlCw2X3eoMtBvaCKAqZn8oMKl0
 rye9eFW8Joz2Khr9Y9VAtODxbdG8WQ6S4USwdyZX1BiSvCkhBnA1Ebbqi
 EsYJ2bVDF7bW9aAhBSJq6uLMeElvxXjgh1QVOWdexGifJheiNWAsDM3ah g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jan 2022 15:36:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 15:36:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 27 Jan 2022 15:36:54 -0800
Received: from [10.48.242.169] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 27 Jan
 2022 15:36:54 -0800
Message-ID: <a0f8c8fa-2f26-e522-a3b9-e530aba9994b@quicinc.com>
Date: Thu, 27 Jan 2022 15:36:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH 2/2] ath11k: mhi: use mhi_sync_power_up()
Content-Language: en-US
To: <ath11k@lists.infradead.org>
References: <20220127090117.2024-1-kvalo@kernel.org>
 <20220127090117.2024-2-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220127090117.2024-2-kvalo@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_153701_427653_424188EE 
X-CRM114-Status: GOOD (  18.14  )
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

On 1/27/2022 1:01 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> If amss.bin was missing ath11k would crash during 'rmmod ath11k_pci'. The
> reason for that was that we were using mhi_async_power_up() which does not
> check any errors. But mhi_sync_power_up() on the other hand does check for
> errors so let's use that to fix the crash.
> 
> I was not able to find a reason why an async version was used. This call ends
> is called from ath11k_hif_power_up() which can sleep, so sync version should be
> safe to use.

I could not parse the 2nd sentence: This call ends is called

> 
> [  145.569731] general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC KASAN PTI
> [  145.569789] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> [  145.569843] CPU: 2 PID: 1628 Comm: rmmod Kdump: loaded Tainted: G        W         5.16.0-wt-ath+ #567
> [  145.569898] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
> [  145.569956] RIP: 0010:ath11k_hal_srng_access_begin+0xb5/0x2b0 [ath11k]
> [  145.570028] Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 ec 01 00 00 48 8b ab a8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 ea 48 c1 ea 03 <0f> b6 14 02 48 89 e8 83 e0 07 83 c0 03 45 85 ed 75 48 38 d0 7c 08
> [  145.570089] RSP: 0018:ffffc900025d7ac0 EFLAGS: 00010246
> [  145.570144] RAX: dffffc0000000000 RBX: ffff88814fca2dd8 RCX: 1ffffffff50cb455
> [  145.570196] RDX: 0000000000000000 RSI: ffff88814fca2dd8 RDI: ffff88814fca2e80
> [  145.570252] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffffa8659497
> [  145.570329] R10: fffffbfff50cb292 R11: 0000000000000001 R12: ffff88814fca0000
> [  145.570410] R13: 0000000000000000 R14: ffff88814fca2798 R15: ffff88814fca2dd8
> [  145.570465] FS:  00007fa399988540(0000) GS:ffff888233e00000(0000) knlGS:0000000000000000
> [  145.570519] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  145.570571] CR2: 00007fa399b51421 CR3: 0000000137898002 CR4: 00000000003706e0
> [  145.570623] Call Trace:
> [  145.570675]  <TASK>
> [  145.570727]  ? ath11k_ce_tx_process_cb+0x34b/0x860 [ath11k]
> [  145.570797]  ath11k_ce_tx_process_cb+0x356/0x860 [ath11k]
> [  145.570864]  ? tasklet_init+0x150/0x150
> [  145.570919]  ? ath11k_ce_alloc_pipes+0x280/0x280 [ath11k]
> [  145.570986]  ? tasklet_clear_sched+0x42/0xe0
> [  145.571042]  ? tasklet_kill+0xe9/0x1b0
> [  145.571095]  ? tasklet_clear_sched+0xe0/0xe0
> [  145.571148]  ? irq_has_action+0x120/0x120
> [  145.571202]  ath11k_ce_cleanup_pipes+0x45a/0x580 [ath11k]
> [  145.571270]  ? ath11k_pci_stop+0x10e/0x170 [ath11k_pci]
> [  145.571345]  ath11k_core_stop+0x8a/0xc0 [ath11k]
> [  145.571434]  ath11k_core_deinit+0x9e/0x150 [ath11k]
> [  145.571499]  ath11k_pci_remove+0xd2/0x260 [ath11k_pci]
> [  145.571553]  pci_device_remove+0x9a/0x1c0
> [  145.571605]  __device_release_driver+0x332/0x660
> [  145.571659]  driver_detach+0x1e7/0x2c0
> [  145.571712]  bus_remove_driver+0xe2/0x2d0
> [  145.571772]  pci_unregister_driver+0x21/0x250
> [  145.571826]  __do_sys_delete_module+0x30a/0x4b0
> [  145.571879]  ? free_module+0xac0/0xac0
> [  145.571933]  ? lockdep_hardirqs_on_prepare.part.0+0x18c/0x370
> [  145.571986]  ? syscall_enter_from_user_mode+0x1d/0x50
> [  145.572039]  ? lockdep_hardirqs_on+0x79/0x100
> [  145.572097]  do_syscall_64+0x3b/0x90
> [  145.572153]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/mhi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index cccaa348cf21..8b2143802816 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -561,7 +561,7 @@ static int ath11k_mhi_set_state(struct ath11k_pci *ab_pci,
>   		ret = 0;
>   		break;
>   	case ATH11K_MHI_POWER_ON:
> -		ret = mhi_async_power_up(ab_pci->mhi_ctrl);
> +		ret = mhi_sync_power_up(ab_pci->mhi_ctrl);
>   		break;
>   	case ATH11K_MHI_POWER_OFF:
>   		mhi_power_down(ab_pci->mhi_ctrl, true);
> 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
