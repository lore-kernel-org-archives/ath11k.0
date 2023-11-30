Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2FAC4167B
	for <ath11k@archiver.kernel.org>; Thu, 30 Nov 2023 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CktGUsq+wK/hwncTI67Qpo0rKrrhNGNq9dC4+0Zc2hY=; b=D+djhq/NJJdht/qFSv64ObfjAi
	yggD+28cqfLPGovfxO7UwClrHP+GHBdS8wYcJ3/z6/oWZQdptIMEpO19IYf8ud2EOIsUBtc1iXbmD
	xNAW5MD5kFMS5ZsoI3Vx7ZOEWPmx4dG6U+aRYYvsaU+xkzS6Fqu83YCLbqiYkz9/+86ZiR1rxCRdA
	RdVsLKVWHNehEeylHLgL0hu+zVZMyW5B/2UIzjtuYHgJXbbdKJxDdI8uflEahCIzIMQFQK2MW05lO
	8xUsfyJ1wo1dy8H/wcwR4pTtxN2lrIgR0995u3VVDFoeRUwdL+JrqN56e870X67/BG2cB9M9A1K8D
	K0P1AKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kSc-00BSWq-2c;
	Thu, 30 Nov 2023 17:04:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kSZ-00BSWQ-2v
	for ath11k@lists.infradead.org;
	Thu, 30 Nov 2023 17:04:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 87DE3B817AC;
	Thu, 30 Nov 2023 17:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4D0C433C8;
	Thu, 30 Nov 2023 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701363857;
	bh=ipXSh/47UcjI7Ptig4SmC42fd/0Qp8rZuv+bGMrBgcA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jR8u7t7aBFWqzXOYDrYeVfpARImQWmqDnT1qpDCH/K/EMomW1Yzh2fL20gC9ZMIFs
	 muq4+WrtATJQlcPmaHJiHHddOAmHb4xNb8rSRgEQVYd7BrMNNRFrkBBdY8qOEj361H
	 2EbofQIUPLLl5xqnnmct+lQRyi8g/tJwyXVqbv+v2Qf2yGcdCj8OmNZX4X5uSnBO/i
	 v8VZE5ReMMXLve96exbJwDcsix+uuhRVcVGIZqo97/gYo6xiO5Flkkr7x7hFMG+yKI
	 i56C2F8lC8kAfjTBxX/XUGfSsPUzmFKXO2tUmsYp0TtYQrbITit2eqRkR87BH4gJWM
	 osHR84mR5wGEg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: fix race due to setting
 ATH11K_FLAG_EXT_IRQ_ENABLED too early
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231117003919.26218-1-quic_bqiang@quicinc.com>
References: <20231117003919.26218-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170136385394.1435047.15668793291905859073.kvalo@kernel.org>
Date: Thu, 30 Nov 2023 17:04:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_090420_084978_13549FA0 
X-CRM114-Status: GOOD (  13.30  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> We are seeing below error randomly in the case where only
> one MSI vector is configured:
> 
> kernel: ath11k_pci 0000:03:00.0: wmi command 16387 timeout
> 
> The reason is, currently, in ath11k_pcic_ext_irq_enable(),
> ATH11K_FLAG_EXT_IRQ_ENABLED is set before NAPI is enabled.
> This results in a race condition: after
> ATH11K_FLAG_EXT_IRQ_ENABLED is set but before NAPI enabled,
> CE interrupt breaks in. Since IRQ is shared by CE and data
> path, ath11k_pcic_ext_interrupt_handler() is also called
> where we call disable_irq_nosync() to disable IRQ. Then
> napi_schedule() is called but it does nothing because NAPI
> is not enabled at that time, meaning
> ath11k_pcic_ext_grp_napi_poll() will never run, so we have
> no chance to call enable_irq() to enable IRQ back. Finally
> we get above error.
> 
> Fix it by setting ATH11K_FLAG_EXT_IRQ_ENABLED after all
> NAPI and IRQ work are done. With the fix, we are sure that
> by the time ATH11K_FLAG_EXT_IRQ_ENABLED is set, NAPI is
> enabled.
> 
> Note that the fix above also introduce some side effects:
> if ath11k_pcic_ext_interrupt_handler() breaks in after NAPI
> enabled but before ATH11K_FLAG_EXT_IRQ_ENABLED set, nothing
> will be done by the handler this time, the work will be
> postponed till the next time the IRQ fires.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

5082b3e3027e wifi: ath11k: fix race due to setting ATH11K_FLAG_EXT_IRQ_ENABLED too early

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231117003919.26218-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


