Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D58C07545
	for <ath11k@archiver.kernel.org>; Tue, 24 Oct 2023 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfUtC8q4zRcA17kPUfSUqzyKimmuxWheITrB7tnjrao=; b=rvmXW3VCT04pQR
	+Enx2/cw4u9Mmcu/jqeHxApoDcaFkX0APHc89WcdrrHsIynATeNyEtI+9CA6NVyKYF/O9LI3+aAkD
	fJjJCdJz6w67gp6Wusp/4GUwxp5UI5O13HZ694Blk02dpzvIE4YEA8n3CVlBMiCN49nNDTdOYyMGz
	i5ZP1KE3Hkp/XU6A5gOUbrqU6Tvr91xd6OaiJfkkgZZm+CKachE1ohGGcK0jq1mi+jomXtiA9/pcA
	voAl18MYmspgeGNII5CkU2Es/smHBsFdnGRuB5ECLaLtW/ftyUXtZ4RuClqylxZs9540N4VJPbxUi
	Qw2T9zorzPgf8Bzhl9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHwj-00A3lZ-0D;
	Tue, 24 Oct 2023 13:59:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHwe-00A3ik-2C
	for ath11k@lists.infradead.org;
	Tue, 24 Oct 2023 13:59:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1ECCD61461;
	Tue, 24 Oct 2023 13:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3873C433C8;
	Tue, 24 Oct 2023 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698155981;
	bh=dsmBnlL6bvCmPrgmLzqlJBYDPnEdRwCx2sRSLyjJX0Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HtVoJ3OGlu4I0g7c6nceoQtrXqr+/rL/LttZelrFM0wKPsJvPOqfj3iSNYKVJE2LO
	 0VIoSplFYuYpBei0qTA6kphdzyD+MgyNNRnl3g0Y03cOt8+rsYfgqp/Utq2z+PeAjy
	 hnwOWkkINyyW3UY6nQ4Yx9XSoHwBebK2UXBElN4HVFVQio2wJHThXt/gi8juZoiSaY
	 GjtlRiDTlxnqe/i6hB7btQ2B2opfa4avGMl1I7Y2MKxwVt0XwI8Tx2REMWl032JywK
	 ZPvLrC1Vor+obo/PRX3UWJ5sDsLwig85VAEOFSrdwAMIB2/t1Uyhydx6Uzwo4bEmhi
	 C/r9XXtEq4gjQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] wifi: ath11k: fix temperature event locking
References: <20231019153115.26401-1-johan+linaro@kernel.org>
	<20231019153115.26401-2-johan+linaro@kernel.org>
Date: Tue, 24 Oct 2023 16:59:35 +0300
In-Reply-To: <20231019153115.26401-2-johan+linaro@kernel.org> (Johan Hovold's
	message of "Thu, 19 Oct 2023 17:31:14 +0200")
Message-ID: <87sf60xgs8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_065944_779906_2A00B91A 
X-CRM114-Status: GOOD (  10.83  )
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

Johan Hovold <johan+linaro@kernel.org> writes:

> The ath11k active pdevs are protected by RCU but the temperature event
> handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
> read-side critical section as reported by RCU lockdep:
>
> 	=============================
> 	WARNING: suspicious RCU usage
> 	6.6.0-rc6 #7 Not tainted
> 	-----------------------------
> 	drivers/net/wireless/ath/ath11k/mac.c:638 suspicious rcu_dereference_check() usage!
>
> 	other info that might help us debug this:
>
> 	rcu_scheduler_active = 2, debug_locks = 1
> 	no locks held by swapper/0/0.
> 	...
> 	Call trace:
> 	...
> 	 lockdep_rcu_suspicious+0x16c/0x22c
> 	 ath11k_mac_get_ar_by_pdev_id+0x194/0x1b0 [ath11k]
> 	 ath11k_wmi_tlv_op_rx+0xa84/0x2c1c [ath11k]
> 	 ath11k_htc_rx_completion_handler+0x388/0x510 [ath11k]
>
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
>
> Fixes: a41d10348b01 ("ath11k: add thermal sensor device support")
> Cc: stable@vger.kernel.org      # 5.7
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

On what hardware and firmware version did you test this? As there's so
many different combos we use Tested-on tag to provide that information
in the commit message:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag

I can add that if you let me know what you used.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
