Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B42C4828F
	for <ath11k@archiver.kernel.org>; Wed,  7 Feb 2024 15:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g0zsvFVs/5/FIXHIWNA3pOYognvp2BA7PZrlP1xzfU=; b=Jg6CE6pj2DgQ0prJkzXYa0FruI
	TcxSRlkMcRkwQn/Rjagt8KxDaMV6WH1PEJz2hEd20C/pjZmOBGgny8GDT6hqnykCotQ5Zjw/aEO74
	T5fmdTn09qiPDv/4KmjmU5e3tcmyh9+0/Gow9BPyebNBxnz8C6RkBgRsWIX2/NZtsJEtTM6QRjBqJ
	8E1/Wd4bQkq2dq1rLlFlEh/WT7Yj2H1kiQBVURiFIP3APiy/Q/pR9k1episVXrFMWBILaNiREFi5X
	Ta3d5gKX+up+NqHlvTQdtTaOktBTAcdXvBs5F65++qYAfDVck3FmAN/YbYR+nbgL9kq6KJiQY+HtK
	Y2fhJQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjWo-0000000B2OX-14LP;
	Wed, 07 Feb 2024 15:07:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjWl-0000000B2Mh-3DME
	for ath11k@lists.infradead.org;
	Wed, 07 Feb 2024 15:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A11FCE18FD;
	Wed,  7 Feb 2024 15:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E2AC433F1;
	Wed,  7 Feb 2024 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707318472;
	bh=e8ZPTLBiG4EhvRswyFxjA28H3ywaFhr8kyDAQdHgczI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=X20OtsccAeo3DwMltzHcMivL6XbkHNDm0ibarOqcMOwUYdMbe17Jh/yl8QlKLBl0t
	 fmXyH09p0z7FNfqDL9iBpPygypzgeSOBML6U9HqjAfTV6rRvKdowrVJ1jWfvVCA71V
	 qYaRkNy12XFZCS7isZ4acuIAwTYY4NVYTEF2YOwh85jgx8HtDZEZfGayQXRtmpmUB2
	 OllkPBO9v6AgmbOQqGsQTkihfN4/iNQ5SGQVwlXKQdVhJLtsVtwf/6DrST25SCoQjm
	 UAsj/xGNWLv6G2KGQErmmZFySmp7QTkAfCZVSCx/wKOplJwfH9hOst2n3B4M1VnDo/
	 ptBQ+Jy/tZCwQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: Really consistently use
 ath11k_vif_to_arvif()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240205-ath11k_vif_to_arvif-v1-1-7c41313c8318@quicinc.com>
References: <20240205-ath11k_vif_to_arvif-v1-1-7c41313c8318@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170731846999.2220494.5799872642523142596.kvalo@kernel.org>
Date: Wed,  7 Feb 2024 15:07:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_070756_013939_BE0352EE 
X-CRM114-Status: UNSURE (   5.73  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Commit 9476cda44c13 ("wifi: ath11k: Consistently use ath11k_vif_to_arvif()")
> previously replaced all open coding of the ath11k_vif_to_arvif()
> functionality. Subsequently two more instances of open coding were
> introduced, one in commit 92425f788fee ("wifi: ath11k: fill parameters for
> vdev set tpc power WMI command") and one in commit 6f4e235be655 ("wifi:
> ath11k: add parse of transmit power envelope element"), so fix those as
> well.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d7a5c7cde2cb wifi: ath11k: Really consistently use ath11k_vif_to_arvif()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240205-ath11k_vif_to_arvif-v1-1-7c41313c8318@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


