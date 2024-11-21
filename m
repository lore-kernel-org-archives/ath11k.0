Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CD5D6ED04
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9lwRvDJPIGIdxd7xQR9FUwp6l5zkJnoJ3qU2Gt/6Bo=; b=O4BfCrm+qiLcxYzaNnCQFivu8P
	1XFYPt4Sw8I2XrWF67ZHHAiXNCypD8B5k4O402G4djAr3pGR5CVEFY/AyMZaMkDDZiLmU5XXjPxXi
	rdVSn7t1QWu9G4dXQbYbZ8k8z5/lXQiPhggkB53WkIAxuYegd8vVwyAGPBqUEXMaOCucoxBooMObi
	sGdeCOABFjD0//x/ChmQZCjwYL3M1fO0Zn6d8kBmsvvNhqJ6A5rjgmOTV2oWNm1G4g7CEMFnmUTZN
	2J2T6RO2zqzhqokCbmoHrvt94ZynfrWGI6twN8HDeN2rzsJIXV0LGFIZhotavCK+td8rKAo/f+lWH
	SgbnZvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5Ee-0000000HS2L-1ESf;
	Thu, 21 Nov 2024 11:20:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5Eb-0000000HS1n-3H1s
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 11:20:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64D515C57A5;
	Thu, 21 Nov 2024 11:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D0CC4CECC;
	Thu, 21 Nov 2024 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732188029;
	bh=UYVrx/tz+yMf3dt8i+rVYN0ZOd150G0c2AUXY2rn0Zc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tBXi0RKzhcKjbvdIT8YEjG/m/17yGQMiUzFIHIA8CTmF8aKKTxAZ+YToHTvh4i6Mf
	 IOfb9jbl2OWkQNxZfB6/YrvgXTXXYHUCdHTxXQ53toFTyAK4jjDMkFuvabjv0QKZeI
	 XT931pBWDUtwrI6iIvT+GaOH1KfoDWPAYiDzhaa1WASDisNVTal/rYVYa9RdVigrHM
	 JE+AmihHkFgE0VV10BvvsP23thm9KRaNuZbSaQ4uj45ume98J8B300o6TPlv+zKCFr
	 AhTCRPbM4gO3WNA804MdkRX+HISiYbQCVgOAly97MXXKZDr5Fym8MYrzMl6H6s4Z5a
	 N0PWTxmSMbC0g==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Bill
 Wendling <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,
  "Arnd Bergmann" <arnd@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath11k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <llvm@lists.linux.dev>
Subject: Re: [PATCH 2/3] wifi: ath11k: mark ath11k_dp_rx_mon_mpdu_pop() as
 noinline
References: <20241119-ath11k-noinline-v1-0-4ec0a8aa30b2@quicinc.com>
	<20241119-ath11k-noinline-v1-2-4ec0a8aa30b2@quicinc.com>
Date: Thu, 21 Nov 2024 13:20:24 +0200
In-Reply-To: <20241119-ath11k-noinline-v1-2-4ec0a8aa30b2@quicinc.com> (Jeff
	Johnson's message of "Tue, 19 Nov 2024 07:47:39 -0800")
Message-ID: <87ttc0x287.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_032029_861086_94F318EA 
X-CRM114-Status: GOOD (  11.02  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> When compiling the ath11k driver using clang with KASAN enabled, the
> following warning is observed:
>
> drivers/net/wireless/ath/ath11k/dp_rx.c:5244:5: warning: stack frame size (1304) exceeds limit (1024) in 'ath11k_dp_rx_process_mon_status' [-Wframe-larger-than]
>
> This is similar to the issue found in ath12k/qmi.c that was discussed
> in [1] and fixed with [2]. The issue is that clang inlining can
> explode stack usage.
>
> ath11k_dp_rx_process_mon_status() itself is a pretty
> lightweight function, but it dispatches to several other functions
> which do the real work:
>
> ath11k_dp_rx_process_mon_status()
> 	ath11k_dp_rx_reap_mon_status_ring()
> 	ath11k_dp_rx_mon_dest_process()
> 		ath11k_dp_rx_mon_mpdu_pop() *
> 		ath11k_dp_rx_mon_deliver()
> 			ath11k_dp_rx_mon_merg_msdus()
> 			ath11k_dp_rx_deliver_msdu()
> 	ath11k_dp_rx_update_peer_stats()
>
> Of these, only ath11k_dp_rx_mon_mpdu_pop() has non-trivial stack
> usage, so mark that function as 'noinline_for_stack' to prevent it
> from being inlined in ath11k_dp_rx_process_mon_status(), thereby
> eliminating the excessive stack usage.
>
> Link: https://msgid.link/bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com # [1]
> Link: https://patch.msgid.link/20241028-ath12k_qmi_driver_event_work-v1-1-0d532eb593fa@quicinc.com # [2]
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

