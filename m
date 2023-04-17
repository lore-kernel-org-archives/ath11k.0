Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACF3C77B72
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3UzndfKv3wJp5y8WS4F3dAzxtahvcCXQc+pu6O3krs=; b=b05h8yE87lLn+m
	XqxefvUlC0NcIIT8Ns6/x8sQ6Yxp757Gb7Q+Ibj0+m5yG2shmRQ5ERCn5ok9zEQ5JH1eEIWR3aVj5
	8VkHGomDiol7ITktHmkTERUGKsI21L4JXVShOx0Zx1hgGuOQ8oA3wsvq4ucwYdTFE/OvUStblF9ie
	R2Hj/xBNQNNcPveoUFwGh0USg7V9xITVtiav1BLqjPO4na/8eTgjuwzBAjh7BfUel66xIXHaaE6r0
	egGtQtKRq1tcYF2eCcDthd2e/d92t19MSj06zCRC3j8il1NT1tc04W1Xy7Kru+GDAX3uHIlsCvBKB
	7McY7T7EGHLM/cCW7CTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poM6U-00FjWF-1M;
	Mon, 17 Apr 2023 10:28:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poM6R-00FjUc-1G
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 10:28:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C209960FC9;
	Mon, 17 Apr 2023 10:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB38C433D2;
	Mon, 17 Apr 2023 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681727331;
	bh=3Iz5JePtM9cvykU/DcFaEXo6Tdj+TUSbHIg+gJXgJtM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jSRVAnegX0WNeUdqlH1s5pwjPZYfZg4DuSQXPevNIV0N/2vrliryZAJ3fPeKSKTd3
	 lX3pKD2hJbO9kK6Naugv6xidXxYNIHLIhU2ZpmYdQcD1XOWmOdeehw8PHfcsmJmEgZ
	 wkM2i8FBHN3nJIcSUfAVVgDV1QD+JXqW2MZYGi+zrCMSqO/+LIQ3Y5XHITpjMgnRLB
	 fKaUszztHQ/ZgEuMLAU/4bleKVRA0MaVl3gjpBtL3/c6cN/vMH/nckOS329RHxIAJD
	 5wHI4kjZsjhEkou4u/zAqFMo+mIHbLpBk3lQfLfDwjLLViX+XADh8aeg7veKOE2AFl
	 L5inedWQjnXpw==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath11k: Ignore frags from uninitialized peer in
 dp.
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230403184155.8670-2-quic_nmaran@quicinc.com>
References: <20230403184155.8670-2-quic_nmaran@quicinc.com>
To: Nagarajan Maran <quic_nmaran@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Harshitha Prem <quic_hprem@quicinc.com>,
 Nagarajan Maran <quic_nmaran@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168172732519.21228.13363006785669066948.kvalo@kernel.org>
Date: Mon, 17 Apr 2023 10:28:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_032855_468473_D757420A 
X-CRM114-Status: GOOD (  10.60  )
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

Nagarajan Maran <quic_nmaran@quicinc.com> wrote:

> When max virtual ap interfaces are configured in all the bands with
> ACS and hostapd restart is done every 60s, a crash is observed at
> random times.
> In this certain scenario, a fragmented packet is received for
> self peer, for which rx_tid and rx_frags are not initialized in
> datapath. While handling this fragment, crash is observed as the
> rx_frag list is uninitialised and when we walk in
> ath11k_dp_rx_h_sort_frags, skb null leads to exception.
> 
> To address this, before processing received fragments we check
> dp_setup_done flag is set to ensure that peer has completed its
> dp peer setup for fragment queue, else ignore processing the
> fragments.
> 
> Call trace:
>   ath11k_dp_process_rx_err+0x550/0x1084 [ath11k]
>   ath11k_dp_service_srng+0x70/0x370 [ath11k]
>   0xffffffc009693a04
>   __napi_poll+0x30/0xa4
>   net_rx_action+0x118/0x270
>   __do_softirq+0x10c/0x244
>   irq_exit+0x64/0xb4
>   __handle_domain_irq+0x88/0xac
>   gic_handle_irq+0x74/0xbc
>   el1_irq+0xf0/0x1c0
>   arch_cpu_idle+0x10/0x18
>   do_idle+0x104/0x248
>   cpu_startup_entry+0x20/0x64
>   rest_init+0xd0/0xdc
>   arch_call_rest_init+0xc/0x14
>   start_kernel+0x480/0x4b8
>   Code: f9400281 f94066a2 91405021 b94a0023 (f9406401)
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

a06bfb3c9f69 wifi: ath11k: Ignore frags from uninitialized peer in dp.
41e02bf4ae32 wifi: ath11k: fix undefined behavior with __fls in dp

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230403184155.8670-2-quic_nmaran@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
