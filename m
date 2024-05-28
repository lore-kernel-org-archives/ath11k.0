Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49ECC25B7C
	for <ath11k@archiver.kernel.org>; Tue, 28 May 2024 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuP3dZqtVjw/D1dWPcEdQp8vFCx/YS4v9UuinTL0t7E=; b=EnuxYxVBvKDwp+JPEJdSpK2EDv
	at8oCwx2iAtARNdcsfPpZqe9hxwVG7Ys8AiuFvyyhO9MCF1ang8Aq6zUgmMt8jwJRlAg7lsi7G5vr
	driVmGpBaHbwfHJw++soP8aCYBQ9MteA/Vg+RMyz2bO7t7giK7byOW0VtrWU4ecdOUjcc9aW6kFBO
	MSqV2ibB7uk+uGt6jNlAnOcB4QLvykHPBJ2dgP/lkqDRtyHKtm++cakMhZsJwIUD4F7Oxq+2yKsOs
	iuQV0r7iXYzoAm5mFc20tMAjhdAMXGBdLrbYGWEFSnRlWjn3rLX34EAtagvivPD8TqrQORz7r4Yzw
	mGllG8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0rf-00000001ab9-0uFr;
	Tue, 28 May 2024 17:43:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0rc-00000001aZn-0ckH
	for ath11k@lists.infradead.org;
	Tue, 28 May 2024 17:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DE0F61F6D;
	Tue, 28 May 2024 17:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421FDC3277B;
	Tue, 28 May 2024 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716918235;
	bh=acMf32fu0JN28eSlBB0qI0jOAiIbnSOa9UfPdAOD10o=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=IHotNmS6iLNBAJLqukMUe67QExDQ5+rTAQE43QRz51r5YDgALRLNvI+UZ1TosINDB
	 jVqW+R6OmgDfXH0eP5mE+QeDX5NiprilwRL9jFiE9+Zs7sK/Xw2Cb3evi27V3NzfUi
	 ycanzFwTH5AGOVYylaDVSar4rwwlyEmlTYn11JxE0mbW1vsBYddU1JaetWwSIcdD9u
	 EYn6QxgnvgPKg6LX3dCfF/yxf9HhPAe3bAJnSUKhUoVAa2NJkhUEytzI8QRksUa9PJ
	 xmo8ONR+UC255qAbBHWVl8s27BuerQ+NmEHP+WkHxUFWXc3ykC0zsO+PlQA+dMhPbr
	 /HhWFGVWHpH2w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: fix wrong definition of CE ring's base
 address
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240524021558.34452-1-quic_bqiang@quicinc.com>
References: <20240524021558.34452-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171691823254.1700985.17999890257962892911.kvalo@kernel.org>
Date: Tue, 28 May 2024 17:43:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_104356_287398_290F905F 
X-CRM114-Status: UNSURE (   8.61  )
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

> Base address of CE ring is defined as u32, currently this works
> because coherent DMA mask configured as 32 bit:
> 
>         #define ATH11K_PCI_COHERENT_DMA_MASK    32
> 
> However this mask could be changed once firmware bugs are fixed
> to fully support 36 bit DMA addressing. So to protect against any
> future changes to the DMA mask, change the type of the fields that
> are dependent upon it.
> 
> This is found during code review. Compile tested only.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

5714e25f1d18 wifi: ath11k: fix wrong definition of CE ring's base address

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240524021558.34452-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


