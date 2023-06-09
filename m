Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0066C7EE29
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 12:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2/riljnUDYdQ5ROJdfaDnTBMLcVlCwXWTVTUsE0nZA=; b=iyG2ynQjNNscG9
	ACvX4JX1l7UsB3lajCfWscwerPjDj+TelQESC/n3l1dCcjOMVV+2EXLfas4IooLXC8rMbGnNWMRrl
	M5dWGLM7QGFStMOn4diJJB8iN1XLRzoGtawnS4gm108BSctSUFexaxYnrC7+Q89ucjMY/p/ow3xfS
	A88kzTAKoTUC6ket95eXV0DmGkyCkjtq7g0vVY7dDl+Jb2jBgoKmbTlfX8X6teKUXdTmcRwMbHVfi
	2gr6HMS7bzyYxxf0gRIvQZe2aSc95UhUMJQy4U9SW0WD20eU4P6AeCxb9mXou+GD2hz9TlNVAhKZU
	rbNRA7krYFKYUE1XrWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7bC8-00CzBQ-2X;
	Fri, 09 Jun 2023 12:26:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7bC6-00CzAn-1F
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 12:26:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BED0619FF;
	Fri,  9 Jun 2023 12:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0799C433EF;
	Fri,  9 Jun 2023 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686313574;
	bh=sDqla35NPLBYgl0LPzzm4JHUqVVdHhzJ++zG4Cv5Xm0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=eEtoTdP4K0F3D0sRvNPo9UU3ja3ErKFH0iXPQYeueJxBwx5a1Rn8L8h3R85zzgTIJ
	 9+3tlPmHmGmaRPU87DLa818VcH1SXKSuWXOw+P7vE93+asqPEMitbE01DOnHvsQED/
	 QazJhUxfZpF5XglJoNl3F1BzhEmFGE1pf+M7tsfUQphVfuF7qDYvLH3DrAnAgTWxLD
	 dr5JuuhWQnDZoUgYHrm2q8KVw6VKRn7n5Xk2Qrvc5k4EGd/UzXBhYulZfv+2pIL61T
	 vGc6zz5qO7D9XFOAGNyAhK/D4tuGiz4LyQdIPpHsDLPn2XjzgYd6lQNLHXFwhB49oh
	 oAtAfFNB//4eg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix boot failure with one MSI vector
References: <20230601033840.2997-1-quic_bqiang@quicinc.com>
Date: Fri, 09 Jun 2023 15:26:10 +0300
In-Reply-To: <20230601033840.2997-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Thu, 1 Jun 2023 11:38:40 +0800")
Message-ID: <87fs70hlel.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_052618_485763_9AE62913 
X-CRM114-Status: GOOD (  13.39  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Commit 5b32b6dd96633 ("ath11k: Remove core PCI references from
> PCI common code") breaks with one MSI vector because it moves
> affinity setting after IRQ request, see below log:
>
> [ 1417.278835] ath11k_pci 0000:02:00.0: failed to receive control response completion, polling..
> [ 1418.302829] ath11k_pci 0000:02:00.0: Service connect timeout
> [ 1418.302833] ath11k_pci 0000:02:00.0: failed to connect to HTT: -110
> [ 1418.303669] ath11k_pci 0000:02:00.0: failed to start core: -110
>
> The detail is, if do affinity request after IRQ activated,
> which is done in request_irq(), kernel caches that request and
> returns success directly. Later when a subsequent MHI interrupt is
> fired, kernel will do the real affinity setting work, as a result,
> changs the MSI vector. However at that time host has configured
> old vector to hardware, so host never receives CE or DP interrupts.
>
> Fix it by setting affinity before registering MHI controller
> where host is, for the first time, doing IRQ request.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Fixes: 5b32b6dd9663 ("ath11k: Remove core PCI references from PCI common code")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

I'm worried if this breaks WCN6750 support. Manikanta, would able to
test this patch on WCN6750 and let us know if breaks anything?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
