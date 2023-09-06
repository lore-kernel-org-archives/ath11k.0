Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7962FEE14A5
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiewoP4tFHF3JWkncNZRtBSRekxBnrcjCKzO/84SmCc=; b=FO3GqBe9JfFc+E
	z8c+gGsWh+kFyps8q3SytbOn9ED0a4AyyY6GiB9Z9C3S7KnA9drtDGiqttCvmcZ5wedeF2W4m+h/G
	ypO5QuakHS4G1jyTvhupA0f5OXwjiC5HQ6PRrvs9IKEXxFtNcVQEcKl7vPvjE3V8GmFtbewk7sT91
	gDHHO6c0v6wltNx+mHx77kJrDc13Koslbox3y84X5KZo7VZsHD3mNpqTJsaKb3DJB7xb7N2EkcIFB
	vizTYcncVGsly3I5wJK9Kv1Cc0joB6FwoylZCREa52CMkkGdIbXlUPXqAdDHzYWuFXvLqm3rbQNK1
	r6Mq4+rKqk8Q3TDb78iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qduD9-00AN9Z-07;
	Wed, 06 Sep 2023 15:12:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qduD6-00AN9C-0J
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 15:12:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B717A6111C;
	Wed,  6 Sep 2023 15:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58642C433C8;
	Wed,  6 Sep 2023 15:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694013170;
	bh=ff+H75uDTdhbM2dFlEGFYvMNpQvwcLgyYJIPzFO8uuA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Zaxt3vIpZK0oFbeMlXILxWhb7y/cJwp/k1J7R6kHN8PSKAGbtkfl8BSY4y+1k+OK4
	 K5NGJzHunNXJV+GHi8Iv7LCn6Nxpn0tGY4BrC+VVNTYpOhmfPYv4CJR+UhgtIcCbrW
	 GR+2kNXtF70YB4ZezZFovd3BNBpxgkNuxXmBqWZooONryXdnQuWT80o3DFJ50RVXdl
	 /xE7b7ZxCpCCS125FYNViP5FPzTSxjYUiJt+Rn4e6QzUP9e6YeAnkDgKyqFJTFPBNt
	 JtS0IyarCH1SUpwvyzAkflnIE2m1oo0raboUx0rBlVCO3kBHYzCcQ2Wv3JyRU5L/uY
	 C4UX2cfvAH7kg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix boot failure with one MSI vector
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230601033840.2997-1-quic_bqiang@quicinc.com>
References: <20230601033840.2997-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169401316702.3891753.7206466024669177368.kvalo@kernel.org>
Date: Wed,  6 Sep 2023 15:12:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_081252_204434_6840B6BA 
X-CRM114-Status: GOOD (  10.98  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

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
> Tested-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Fails to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/pci.c:888
error: drivers/net/wireless/ath/ath11k/pci.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230601033840.2997-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
