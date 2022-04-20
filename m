Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46098C4332F
	for <ath11k@archiver.kernel.org>; Wed, 20 Apr 2022 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d66ueJSknAqRiU/cSpfI6JMpZumSGYLhuIJrihi442Y=; b=RGTyfssYRXIjOr
	ylhtg7DbyqZ6ycbKOFyQ0nSk+KyTAO0oGpmo9ZWakSpYBOw9dJe8Q+XwIbDcrdU071KQay9UKcOt8
	qTKBmeB5x53crB6eCnEqmzoEObJxJE+59P2qLTIwzxV+o1Kw6hDPEHAlmB/c/GNMO5wkxHG1tx1vQ
	SrPTTwt6m+C0ZedfnbVEoc8GgGKZyRCX8CIgolNs9jgdeNVazqNAu44qjiBA/XJuU7c7xZ8B0lXqt
	qALI/wTc5Ga7Qz99cEKnj6rxL2McTRiY78KibY+t2AdQcBle036YYnn3Uyb6+J5xE+NqcDa9yEPm2
	ZUE3D2lg4gmNNoit7INA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhCt4-009eDF-Gc; Wed, 20 Apr 2022 16:09:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhCt0-009eC5-UY
 for ath11k@lists.infradead.org; Wed, 20 Apr 2022 16:09:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C44DF61981;
 Wed, 20 Apr 2022 16:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7181CC385A1;
 Wed, 20 Apr 2022 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650470937;
 bh=CxHiVml8e9Zc1jlwhEl3vaf6HMvRlYOE8fgYfvNaO7w=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=cvcZsUm8S6xtUbKuHoVCSZaaKYngfUDSFGNtrU5N6/phV8cmM02zfllcC+kdvbKyh
 TxKqJoIwc8ROypPM7tEsq53jMBNwET2YRZcR6S19nDSrXuX2qutg716PldDNdSCdo2
 WquB13OIYpgGt+M8K1wK+INL8+vpPio1PjviM6Uxmn1u/aoLwXveVe4oc6CpvQoB2w
 /D9SMqocukbRIdeTDOcTec2UD6DBangy8WVL/N26E5n5lzTQFF9cshOW4Xswq5Wokv
 iL2AX2DvuqwXKck7Rh1QRP7smIi0Eqb3vgqNbfT0L5C7mk+LXvL1UPTwFggzXuW1Od
 7Xiq61o7+a8Ig==
From: Kalle Valo <kvalo@kernel.org>
To: <quic_haric@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: disable spectral scan during spectral deinit
References: <1649396345-349-1-git-send-email-quic_haric@quicinc.com>
 <87fsmooz83.fsf@kernel.org>
Date: Wed, 20 Apr 2022 19:08:51 +0300
In-Reply-To: <87fsmooz83.fsf@kernel.org> (Kalle Valo's message of "Fri, 08 Apr
 2022 09:39:40 +0300")
Message-ID: <87levzohyk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_090859_097130_8DCF0245 
X-CRM114-Status: GOOD (  12.57  )
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

Kalle Valo <kvalo@kernel.org> writes:

> <quic_haric@quicinc.com> writes:
>
>> From: Hari Chandrakanthan <quic_haric@quicinc.com>
>>
>> When ath11k modules are removed using rmmod with spectral scan enabled,
>> crash is observed. Different crash trace is observed for each crash.
>>
>> Send spectral scan disable WMI command to firmware before cleaning
>> the spectral dbring in the spectral_deinit API to avoid this crash.
>>
>> call trace from one of the crash observed:
>> [ 1252.880802] Unable to handle kernel NULL pointer dereference at
>> virtual address 00000008
>> [ 1252.882722] pgd = 0f42e886
>> [ 1252.890955] [00000008] *pgd=00000000
>> [ 1252.893478] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>> [ 1253.093035] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.4.89 #0
>> [ 1253.115261] Hardware name: Generic DT based system
>> [ 1253.121149] PC is at ath11k_spectral_process_data+0x434/0x574 [ath11k]
>> [ 1253.125940] LR is at 0x88e31017
>> [ 1253.132448] pc : [<7f9387b8>]    lr : [<88e31017>]    psr: a0000193
>> [ 1253.135488] sp : 80d01bc8  ip : 00000001  fp : 970e0000
>> [ 1253.141737] r10: 88e31000  r9 : 970ec000  r8 : 00000080
>> [ 1253.146946] r7 : 94734040  r6 : a0000113  r5 : 00000057  r4 : 00000000
>> [ 1253.152159] r3 : e18cb694  r2 : 00000217  r1 : 1df1f000  r0 : 00000001
>> [ 1253.158755] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
>> [ 1253.165266] Control: 10c0383d  Table: 5e71006a  DAC: 00000055
>> [ 1253.172472] Process swapper/0 (pid: 0, stack limit = 0x60870141)
>> [ 1253.458055] [<7f9387b8>] (ath11k_spectral_process_data [ath11k])
>> from [<7f917fdc>] (ath11k_dbring_buffer_release_event+0x214/0x2e4
>> [ath11k])
>> [ 1253.466139] [<7f917fdc>] (ath11k_dbring_buffer_release_event
>> [ath11k]) from [<7f8ea3c4>] (ath11k_wmi_tlv_op_rx+0x1840/0x29cc
>> [ath11k])
>> [ 1253.478807] [<7f8ea3c4>] (ath11k_wmi_tlv_op_rx [ath11k]) from
>> [<7f8fe868>] (ath11k_htc_rx_completion_handler+0x180/0x4e0 [ath11k])
>> [ 1253.490699] [<7f8fe868>] (ath11k_htc_rx_completion_handler
>> [ath11k]) from [<7f91308c>]
>> (ath11k_ce_per_engine_service+0x2c4/0x3b4 [ath11k])
>> [ 1253.502386] [<7f91308c>] (ath11k_ce_per_engine_service [ath11k])
>> from [<7f9a4198>] (ath11k_pci_ce_tasklet+0x28/0x80 [ath11k_pci])
>> [ 1253.514811] [<7f9a4198>] (ath11k_pci_ce_tasklet [ath11k_pci])
>> from [<8032227c>] (tasklet_action_common.constprop.2+0x64/0xe8)
>> [ 1253.526476] [<8032227c>] (tasklet_action_common.constprop.2) from
>> [<803021e8>] (__do_softirq+0x130/0x2d0)
>> [ 1253.537756] [<803021e8>] (__do_softirq) from [<80322610>] (irq_exit+0xcc/0xe8)
>> [ 1253.547304] [<80322610>] (irq_exit) from [<8036a4a4>]
>> (__handle_domain_irq+0x60/0xb4)
>> [ 1253.554428] [<8036a4a4>] (__handle_domain_irq) from [<805eb348>]
>> (gic_handle_irq+0x4c/0x90)
>> [ 1253.562321] [<805eb348>] (gic_handle_irq) from [<80301a78>] (__irq_svc+0x58/0x8c)
>>
>> Tested on : WLAN.HK.2.6.0.1-00851-QCAHKSWPL_SILICONZ-1
>
> Tested-on tag is not in correct format, but I can fix that.

Actuall I cannot as I don't know on what hardware you tested this. So
what hardware did you use?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
