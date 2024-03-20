Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E47C54E58
	for <ath11k@archiver.kernel.org>; Wed, 20 Mar 2024 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4frsiSfFlIf1wEJoHYtfl7jF79LdLFVD3Zuk9P1mGc=; b=a5wWtmCJo5EhMV9jyHhWrZdM5V
	JBFMIpkg/3QOTsFAfKkuUm2G3czXH7varrs4s/SbyT57A5vTTlmY47EaFG9LxI0MoHWt+qF3v8Zh+
	EXk0rdtMP6E3w3ESUBTBRNl5Ovuu7oWcxHAjz6Fwt1A7PTrcsCOp5YBjisWHc2yIDoDl5/eLlyjur
	j8GndKcBFOi7uqeXusrX92ft0XdI1M3KIxWvuEFX6aoumiU+T15Wu1txIyAO7s6yK6ibSeTW7lT7O
	U2r+DE3XwJs/LQqulBDGBvsRBxCHM3F2ND7ob3DG8xws1dMkrOC3o2gScj+V1hmoeCYnZVqZc5q9Z
	+67N1YRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmwOV-0000000HKyW-22KE;
	Wed, 20 Mar 2024 13:54:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmwOS-0000000HKxo-1jl6
	for ath11k@lists.infradead.org;
	Wed, 20 Mar 2024 13:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C129860AF6;
	Wed, 20 Mar 2024 13:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D835C433F1;
	Wed, 20 Mar 2024 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710942851;
	bh=E4HAccDgIzvq1QD9IsgxBSUka7YbR2QB3za8XjJ+a0Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=XF8Ve8tQGWxcGo42PbO6D1Z2/vqOPRZua8ZK5nKLHpgPnQ8gVoxnnSmA1D+yQdF9M
	 9oYwY+K41K6ax8zEsnEtEGujnDE+Ho2SHpSCyLTGAdvAwvoaKQU9/i95exEjx4oYUp
	 E5xZpf0MjFs1lzzPTqMdbhenbRxnC0yILLoBSYHY2ThcGFO81KBSd1L3quNKcHkhni
	 SqJWtnboy6ahTHZAmH2aCdGTZfrv+1SrFAGNRmKUUMtrcFRFzlRknD+QQq7LinFaoW
	 JeN0R+gGn4MBepIPN6La5Lc1CcA6jm177tM0li+ABpAm6855eR+QbPbdN8fQJHseL/
	 A0JjLSXTpDofA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: do not process consecutive RDDM event
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240111071406.14053-1-quic_bqiang@quicinc.com>
References: <20240111071406.14053-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171094284861.3225057.1212406705882400621.kvalo@kernel.org>
Date: Wed, 20 Mar 2024 13:54:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_065412_540742_23A6A8F5 
X-CRM114-Status: UNSURE (   8.27  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently we do reset for each RDDM event from MHI, however there are
> cases, see below log, that we get two or more consecutive events, and
> it is pointless to do reset for the subsequent ones. What's more, it
> makes reset process more likely to fail.
> 
> [ 1502.115876] ath11k_pci 0000:04:00.0: boot notify status reason MHI_CB_EE_RDDM
> [ 1502.115884] ath11k_pci 0000:04:00.0: firmware crashed: MHI_CB_EE_RDDM
> [ 1502.224041] ath11k_pci 0000:04:00.0: boot notify status reason MHI_CB_EE_RDDM
> [ 1502.224050] ath11k_pci 0000:04:00.0: firmware crashed: MHI_CB_EE_RDDM
> 
> Add a check to avoid reset again and again. This is done by tracking previous
> MHI status: if we receive a new RDDM event while the previous one is
> also the same, we treat it as duplicate and ignore it, because normally
> we should receive a MHI_CB_EE_MISSION_MODE event between them.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

There was a simple conflict in copyright year which I fixed:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=8d2bcb72053d955aebb8c398ebf2ad73afca5731

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240111071406.14053-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


