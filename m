Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C71C0032E
	for <ath11k@archiver.kernel.org>; Wed, 25 Oct 2023 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlaV8EOJI8bHgYckvxGLlJ1Jx9dsNUaNaQ000r21Oqo=; b=UhlAbKbtbqx6n2
	JwTrC6y3i2998zJMu0+e6lUzBFGWtRh8x+OxslSt0VRCpUt8bHgqOjnu/l8tQSIBkpH+SPK4bijYK
	T3oXfCwY9qj7S0KTn0nQQAkaO4VBgkHVmY/jAIIpSIZ/q9HkJPdm/YvmkIwtd8GLv1k9He0Apu6Ef
	DYr2QUN3K+Keb+RrbhyZQr7dFwc4C5QWZMv3/D/WDA/piEHLsMK85jA/Ve3xnCoplDVkW9IJ7tetP
	gdd9j54+wUzm8XNGXPSgE4Ro30te9OwsMrv+LDKSGDcKrd0REvYSFwpQSMGb2NqjmxtLzqnF7w+W1
	q631QVpITm5zjVR4IZfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvafw-00BtZI-0D;
	Wed, 25 Oct 2023 09:59:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvafu-00BtYl-0M
	for ath11k@lists.infradead.org;
	Wed, 25 Oct 2023 09:59:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5252EB8281B;
	Wed, 25 Oct 2023 09:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F09EC433C7;
	Wed, 25 Oct 2023 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698227979;
	bh=015JNksl5/RLSxX1un00vsL2YWb8KGSC/yS8zTmEXAs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=E/TIj8kTBcY31vwevcUSuJDF5aKI1Pl6gtHQ0d9a6bq8KbPTBzhvKcgAjawLAv7Ao
	 IqUCfnD1Wa6JkV3gA9x1YqimDgIp76R9G2EEzaU6D9rdkKnkSQkaUjQewlY46MvXZS
	 USEImOHpqpFP3jK2oGitUfkDGsyQEFXGxC685qI0+mnOq4VOtl1ioB6PgFPng10E6h
	 oo7qmIoaSZD53X9TBdxGZgK8hzdJ6z+1zfb56isxwgh71Xbo2HFrbemTM9lKZDPUSN
	 azrpllh63UEggIgh1PARC4tW7AAs3QNb5J3gaLMxnWUHj62g8XoCd+WXWUD6DxWHHw
	 jVpTEe+DKT1ZA==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] wifi: ath11k: fix temperature event locking
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231019153115.26401-2-johan+linaro@kernel.org>
References: <20231019153115.26401-2-johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169822797640.891844.4871182636116201125.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 09:59:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_025942_304028_D27A1FB1 
X-CRM114-Status: UNSURE (   8.77  )
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

Johan Hovold <johan+linaro@kernel.org> wrote:

> The ath11k active pdevs are protected by RCU but the temperature event
> handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
> read-side critical section as reported by RCU lockdep:
> 
>         =============================
>         WARNING: suspicious RCU usage
>         6.6.0-rc6 #7 Not tainted
>         -----------------------------
>         drivers/net/wireless/ath/ath11k/mac.c:638 suspicious rcu_dereference_check() usage!
> 
>         other info that might help us debug this:
> 
>         rcu_scheduler_active = 2, debug_locks = 1
>         no locks held by swapper/0/0.
>         ...
>         Call trace:
>         ...
>          lockdep_rcu_suspicious+0x16c/0x22c
>          ath11k_mac_get_ar_by_pdev_id+0x194/0x1b0 [ath11k]
>          ath11k_wmi_tlv_op_rx+0xa84/0x2c1c [ath11k]
>          ath11k_htc_rx_completion_handler+0x388/0x510 [ath11k]
> 
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Fixes: a41d10348b01 ("ath11k: add thermal sensor device support")
> Cc: stable@vger.kernel.org      # 5.7
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

1a5352a81b47 wifi: ath11k: fix temperature event locking
3b6c14833165 wifi: ath11k: fix dfs radar event locking

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231019153115.26401-2-johan+linaro@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
