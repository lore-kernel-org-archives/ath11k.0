Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E62C433F5
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=946pGXj/yk2VlyBu2Gguk9V5NWTjU+qIswxUqnVUiJ4=; b=j/tSH0YH5siqlP
	+J9v3Epk2ldbYHPwSw5VLobGiPaRnsEwUh+3gxmKRDFHj7kGZwePSSMMORNICcJzb0Il0v6/klPr7
	ktue+kjW2KIpfa/iOAAty/FBY5QP3w+LMvrZo0SX/SCkh10dNbLqsbSWT+NGe5DFlEEJG/4O1YRq7
	pI4i2xLzzvfo+DBnzSW8xp+pNkFH4DyFUjo0FEd9mX7l0DK9AmgdGNvVXxl8yliUvt6Nz7xYxKZFI
	9B+tuntwEglsD5rdNaYD0nqGURmScEFZT2o4qgX9L54OKDhRAdK6kINFHCxpv8QpbCdZxV3F9dCqE
	o9ic7sjhDCIUSYi9PWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njc5m-000GEi-KR; Wed, 27 Apr 2022 07:28:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc5j-000GCp-Jk
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 07:28:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13C9361AE1;
 Wed, 27 Apr 2022 07:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5681DC385A7;
 Wed, 27 Apr 2022 07:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651044482;
 bh=i1MksPYxwLoIvoNytS28wKo4pIbrPrqNpFbI1Dy3/8I=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=bObbJSqfQXYLbDzpGoFaImmURuzOR9sYgx0p4t2g0TFVZ5nlL//QPJzNsmSYRz+yH
 PMBmVc/O29qW6mYmIEz55w+N6GNp7X1V5xJuT7sxQhSrmFdB3N8pXYjA+obhsJtZjf
 E17yYZIRx4GAcsrtiSRaUoJO5Zk+vlD3L7yEqz3kLIaR1Q73fEDSVFtuTDy1/KS3c6
 WslIJQR3QTxLTaiIQwK4mVosbEerrF47NMQu8Zp2xoJeY9L3y+7tVNyLyQ2pNVPSJ2
 iCRAT83zIKtzjpfZ0bRxc/Mi0riSnN+onuow4v2zRKhvfB5/bZJSqkbNrTi4TZWtE1
 fFd7esJWfZYjA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: disable spectral scan during spectral deinit
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1649396345-349-1-git-send-email-quic_haric@quicinc.com>
References: <1649396345-349-1-git-send-email-quic_haric@quicinc.com>
To: <quic_haric@quicinc.com>
Cc: <quic_kvalo@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>,
 "Hari Chandrakanthan" <quic_haric@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165104447917.30072.15809077383105828467.kvalo@kernel.org>
Date: Wed, 27 Apr 2022 07:28:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_002803_796758_07E5844F 
X-CRM114-Status: UNSURE (   9.48  )
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

<quic_haric@quicinc.com> wrote:

> When ath11k modules are removed using rmmod with spectral scan enabled,
> crash is observed. Different crash trace is observed for each crash.
> 
> Send spectral scan disable WMI command to firmware before cleaning
> the spectral dbring in the spectral_deinit API to avoid this crash.
> 
> call trace from one of the crash observed:
> [ 1252.880802] Unable to handle kernel NULL pointer dereference at virtual address 00000008
> [ 1252.882722] pgd = 0f42e886
> [ 1252.890955] [00000008] *pgd=00000000
> [ 1252.893478] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [ 1253.093035] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.89 #0
> [ 1253.115261] Hardware name: Generic DT based system
> [ 1253.121149] PC is at ath11k_spectral_process_data+0x434/0x574 [ath11k]
> [ 1253.125940] LR is at 0x88e31017
> [ 1253.132448] pc : [<7f9387b8>]    lr : [<88e31017>]    psr: a0000193
> [ 1253.135488] sp : 80d01bc8  ip : 00000001  fp : 970e0000
> [ 1253.141737] r10: 88e31000  r9 : 970ec000  r8 : 00000080
> [ 1253.146946] r7 : 94734040  r6 : a0000113  r5 : 00000057  r4 : 00000000
> [ 1253.152159] r3 : e18cb694  r2 : 00000217  r1 : 1df1f000  r0 : 00000001
> [ 1253.158755] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
> [ 1253.165266] Control: 10c0383d  Table: 5e71006a  DAC: 00000055
> [ 1253.172472] Process swapper/0 (pid: 0, stack limit = 0x60870141)
> [ 1253.458055] [<7f9387b8>] (ath11k_spectral_process_data [ath11k]) from [<7f917fdc>] (ath11k_dbring_buffer_release_event+0x214/0x2e4 [ath11k])
> [ 1253.466139] [<7f917fdc>] (ath11k_dbring_buffer_release_event [ath11k]) from [<7f8ea3c4>] (ath11k_wmi_tlv_op_rx+0x1840/0x29cc [ath11k])
> [ 1253.478807] [<7f8ea3c4>] (ath11k_wmi_tlv_op_rx [ath11k]) from [<7f8fe868>] (ath11k_htc_rx_completion_handler+0x180/0x4e0 [ath11k])
> [ 1253.490699] [<7f8fe868>] (ath11k_htc_rx_completion_handler [ath11k]) from [<7f91308c>] (ath11k_ce_per_engine_service+0x2c4/0x3b4 [ath11k])
> [ 1253.502386] [<7f91308c>] (ath11k_ce_per_engine_service [ath11k]) from [<7f9a4198>] (ath11k_pci_ce_tasklet+0x28/0x80 [ath11k_pci])
> [ 1253.514811] [<7f9a4198>] (ath11k_pci_ce_tasklet [ath11k_pci]) from [<8032227c>] (tasklet_action_common.constprop.2+0x64/0xe8)
> [ 1253.526476] [<8032227c>] (tasklet_action_common.constprop.2) from [<803021e8>] (__do_softirq+0x130/0x2d0)
> [ 1253.537756] [<803021e8>] (__do_softirq) from [<80322610>] (irq_exit+0xcc/0xe8)
> [ 1253.547304] [<80322610>] (irq_exit) from [<8036a4a4>] (__handle_domain_irq+0x60/0xb4)
> [ 1253.554428] [<8036a4a4>] (__handle_domain_irq) from [<805eb348>] (gic_handle_irq+0x4c/0x90)
> [ 1253.562321] [<805eb348>] (gic_handle_irq) from [<80301a78>] (__irq_svc+0x58/0x8c)
> 
> Tested-on: QCN6122 hw1.0 AHB WLAN.HK.2.6.0.1-00851-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

161c64de239c ath11k: disable spectral scan during spectral deinit

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1649396345-349-1-git-send-email-quic_haric@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
