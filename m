Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1179CF6495
	for <ath11k@archiver.kernel.org>; Sat, 28 Sep 2024 09:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wCj14kyTlYuX+/DXUPjN9SDt8tjrY33zxSayyXoSO8=; b=LjphMJS9AO/612FbBdEecx8cFw
	576ahhaE7ZULZXHnVPS0sXkc+UONmZ3QQ2Lzeaf8WCPd30h3vwvc6tNBAOdVxKi+2mtXZxxZRVsRN
	P+0oVJJnbOIc5XVR+RRDywbqcU4e6RLXTD+eqT4b/7Ls/LBhByZ+o9b7WS+L2e/To04B9+xMI3FoW
	ydRM+ZQDerlm/zLSSTZM7QcqyjcZmgZ6djNrzdQHxUDWk+RlDWklrba3Wdc+eQDrUAfXZ1GYLX6eZ
	S1PA458xr/zldsfg/ySBdU9S7kEQ7nww0LHGFmLAaoX60Z/UhBCdrxmrKO0auIfGrjSF3bLriPZl1
	jZtrRVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTXB-0000000Crrj-3tT3;
	Sat, 28 Sep 2024 09:14:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTX8-0000000Crpv-2zrw
	for ath11k@lists.infradead.org;
	Sat, 28 Sep 2024 09:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F038D5C541D;
	Sat, 28 Sep 2024 09:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA8EC4CEC3;
	Sat, 28 Sep 2024 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727514873;
	bh=acoXH87+ZnAl4sgwm79hfBXOU936Th4WR1Mn64B6ttA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TxMgyKRN21Q96KDUfAhvZVxGkNo/W+LiJaQB22p5PCQ1djJBjNxEiAfVK0O4mVLG/
	 O/NUOJMLCOaGDlIGZaY4Qvgr7EuMxurdrO6eAM69SgSfMdINh0RhYZ0qlHWVN6BpAk
	 IxG+9CA2L9oNn3Vrdu2Z0C/7kzoBUIwI5UBfnD/YxE0yMWz5giweVHk6SWGCdaucEr
	 PCUAz4QvthJJfciIEN3xghs627jBrSwV7ntyMxSMhgDfx6oVC8igBgx5w+wWoZd857
	 D70ppDZcjpwQGk3m/WCuAvcRVQcCIidfjQPQQv8ebHURNAagH30TrHy9XcQpvCD1Rz
	 /doj9wUq27thg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: Fix double free issue during SRNG deinit
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240826053326.8878-1-quic_bpothuno@quicinc.com>
References: <20240826053326.8878-1-quic_bpothuno@quicinc.com>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>, Balaji Pothunoori <quic_bpothuno@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751487057.2249584.15117916727845529860.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:14:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021434_856390_3AC43DC0 
X-CRM114-Status: UNSURE (   9.30  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Balaji Pothunoori <quic_bpothuno@quicinc.com> wrote:

> Currently struct ath11k_hal::srng_config pointer is not assigned
> to NULL after freeing the memory in ath11k_hal_srng_deinit().
> This could lead to double free issue in a scenario where
> ath11k_hal_srng_deinit() is invoked back to back.
> 
> In the current code, although the chances are very low, the above
> said scenario could happen when hardware recovery has failed and
> then there is another FW assert where ath11k_hal_srng_deinit() is
> invoked once again as part of recovery.
> 
> Fix this by assigning the struct ath11k_hal::srng_config pointer
> to NULL after freeing the memory.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
> Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

5094204ff5ae wifi: ath11k: Fix double free issue during SRNG deinit

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240826053326.8878-1-quic_bpothuno@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


