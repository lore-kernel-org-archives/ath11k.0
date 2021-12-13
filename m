Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D870C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Dec 2021 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuxP9zG6yZhMbu+qF4qbhcw3RngK7JbnQaOjJj32bO4=; b=vB9rh9OQCSylNw
	g1+gUDPAhWaoxAjhll4+XCfgY0+fCBhJaT0pA1bYZ504YE7vENmrP2rDSz272/2PsM6u3vVBAFd5U
	9pN17FLoIoyCSLhjJnKlQC7tIdduAI3jj+FHVEmMfyhhvB8uLj5yLh2Dp3QKDldgWv5aPg9fZ/BkB
	wnljRaMZ2to1U0oUlCu+qeWVumisPF1nEq9IujdNIZIpLJev5ljhfbzCeEKkLFISb/RP91uHjY1zy
	JN8ajB2dVOSBtxLhcsAuy1xzx6YgTTTcfVFL/00hsf3meeYOM/KMWo2w+bxJy1X6m1mChX3nvrTD4
	foTkJgMJU8pDZ7RdGMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiJ8-008uCl-Uh; Mon, 13 Dec 2021 10:11:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwhwZ-008kAs-Ar
 for ath11k@lists.infradead.org; Mon, 13 Dec 2021 09:48:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4B2E6CE0DDE;
 Mon, 13 Dec 2021 09:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A43C00446;
 Mon, 13 Dec 2021 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639388903;
 bh=DC68JIr84+fzw+mcTWgPsT98pQL6mGXd9SXDxnkaZQs=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Rr08vn8oEzhh+Ch4EeiHxzgRhJ/B8TB2X4wuf2oy2EwEeF2kQShEtSRE8RyaESGPx
 HDJU/vfOdyx4cVmvsULpQ/WSgo+rcZlVm+iM4dUmxSeYfcsZQJIbXtmjpiZCNyaqqm
 dfZ5yt5n0uUhhZp2/m+x0yqmho+qjSAvZ7ud/ChNvRbfbq8PWPJcUDESy9r5NZbgyR
 Z3b0VMwLCs3uSxw9+8AcQp/NnszQ+ipztnvLIQBHoTBARiIVO798jBzprEX9vR5uIz
 k4ofqzLa1Pc37sTGizkfCir+YPNbxz9C0QucQ1PmG7iwYOazQHyKSuaDZs/dZof1X2
 PO/I/KdCI9zYw==
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: set DTIM policy to stick mode for station
 interface
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1638948694-15582-1-git-send-email-quic_cjhuang@quicinc.com>
References: <1638948694-15582-1-git-send-email-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163938889725.20609.17596533691501536568.kvalo@kernel.org>
Date: Mon, 13 Dec 2021 09:48:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_014827_628660_3B727557 
X-CRM114-Status: UNSURE (   5.89  )
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

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> Set DTIM policy to DTIM stick mode, so station follows AP DTIM
> interval rather than listen interval which is set in peer assoc cmd.
> DTIM stick mode is more preferred per firmware team request.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

55e18e5a76ab ath11k: set DTIM policy to stick mode for station interface

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1638948694-15582-1-git-send-email-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
