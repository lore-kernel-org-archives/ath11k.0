Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED265C0032E
	for <ath11k@archiver.kernel.org>; Wed, 25 Oct 2023 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qT41OEbEDlfLBzmWYTQcMjqxPAhdEy2kLM4g4PGT7w=; b=jqzgif/3l6HGoz
	3ybagFWtMwEB/w6XAbHNq7pQwb1O6KE13KVhIoU5n4bHqAQZlIm0uvTf+Fhro2dAXulYzaidZITQu
	FY1DjHMIE/Zvl8bNr+I9prcCXr4VVIyGjmP3naW7fRNOgQkDyY/6tCyXQrhgVDJS2/1s08ZyKtbyO
	ArYIDu7BnqwjDOhOyAgqe544CgKVhJcBxlSbuxYAMCrWHP/+RBfaIF93sw5wo1Flqpcl/fvt7bJNv
	Q+Qzlmqtfoyr2x2oUIL6LWFrRpgs6GQfCmZ7CWouCMc5hjbiWbnX23c8gtBMntAiogcNUbgWEYGNy
	QHmeJT1sCh2WoZOAwBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvabE-00BsuD-2B;
	Wed, 25 Oct 2023 09:54:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvabB-00Bstk-0H
	for ath11k@lists.infradead.org;
	Wed, 25 Oct 2023 09:54:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F674CE2360
	for <ath11k@lists.infradead.org>; Wed, 25 Oct 2023 09:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B126FC433C8;
	Wed, 25 Oct 2023 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698227686;
	bh=yaAsiujagvZOvQ/PZwj5xUzfTRKtOWgXCQg/2408jBA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=m+tu1xFnEA69yPdgsePYfRs0i3vP7Lxr6ub4xdGpFSPPKNu1iDZBP6N7rXG83tZvL
	 Zq2sgl/rpQvJu8qk7ABR0hNPAyCpr5ENBTkezMMwgEUXHflTeVfZYyb5iGtSUCMt06
	 x/h76Ylb+so3oF9ZZV9AarumiUad/KPDN2F6C8jojq8UX4C3cWJ3d/wSKxQcLWTKdA
	 R87jTfWBF54nB3ufllxIoWKUogEsSJ6/WPtSUXTJ5ROCbM7NDqw2vo8DDe942TLise
	 W1OLTG0+UI+J3D8daZkfnQQB2um5XRP8qs9dwViO+J01sbwds7qmH7kPamzBWp/okK
	 gR/Sq9vjVtOEQ==
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/3] wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230727100430.3603551-3-kvalo@kernel.org>
References: <20230727100430.3603551-3-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: mhi@lists.linux.dev, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169822768265.891844.9494809896760074747.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 09:54:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_025449_294564_B5BB133F 
X-CRM114-Status: GOOD (  16.22  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Simple refactoring to make it easier to add firmware-2.bin support in the
> following patch.
> 
> Earlier ath11k_qmi_m3_load() supported changing m3.bin contents while ath11k is
> running. But that's not going to actually work, m3.bin is supposed to be the
> same during the lifetime of ath11k, for example we don't support changing the
> firmware capabilities on the fly. Due to this ath11k requests m3.bin firmware
> file first and only then checks m3_mem->vaddr, so we are basically requesting
> the firmware file even if it's not needed. Reverse the code so that m3_mem
> buffer is checked first, and only if it doesn't exist, then m3.bin is requested
> from user space.
> 
> Checking for m3_mem->size is redundant when m3_mem->vaddr is NULL, we would
> not be able to use the buffer in that case. So remove the check for size.
> 
> Simplify the exit handling and use 'goto out'.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

b49381d3de3a wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
7db88b962f06 wifi: ath11k: add firmware-2.bin support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230727100430.3603551-3-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
