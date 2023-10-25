Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFD2C25B47
	for <ath11k@archiver.kernel.org>; Wed, 25 Oct 2023 10:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfPwjDfkPU2BIEIAR4S8O6wq1adO7wxuA0ZbR9vLjHE=; b=euoLb4CxwjxUMF
	U2A4LuedwJoSIymqxzbYQczJvQZHDxSOU5p3yO7ItEoFB+MdXSr1lYQG+FfXGKHIyoT2d1mBnlVlc
	hpAmHQiBQNQmQH4TJPozQdKCxPeoM/Gaj1frCKGVPf/zVVOH/6jasoTF9yan2Kjd2wlBvQnunSUen
	dYGC0YmXbr79kgH4f1UWQGFULWRGi50xN102eX6muwLLL3XVzC05NotcK7UH49UllELVSKhXNi8bZ
	vBd2unjOYrP8uWhnVgC3SqhB1gPe0mM2iVbviHdAfhqUieFP/dCJGq753qaYmXlQlSEsNzgyf3H4/
	N1NRHYln+moBXIy482fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvahU-00BtnY-1k;
	Wed, 25 Oct 2023 10:01:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvahS-00Btml-0J
	for ath11k@lists.infradead.org;
	Wed, 25 Oct 2023 10:01:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77CA661E20;
	Wed, 25 Oct 2023 10:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B51C433C7;
	Wed, 25 Oct 2023 10:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698228077;
	bh=pHVZBBUZeJJACrobCo39QHBAU5G9lo0Us8u49XLaWF4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ClMGUXZUCMde94G13lpoO3c0rhFI06ZPtYzliOtGhMSl3DtrKs8+FfEVwVY9t9S7r
	 ALIKtgsMijC2G1la8c1XmHrwXgQ+9VzrWBEvUngMue/BGhKpWn/sObkQtPlPTd2plG
	 jwOXiB2F9MRMuCnzQYBdxYwR5L9HrF/0PORqOb1w+1TuDlsZi3DmOjeQTVnvZZcSDJ
	 PFHN+stZ8toavxWKHWcBy5TPDYAxkpIkzYET3KHRwAH11hL1LIQGkMFLWYBguHGvXI
	 xCtL46y0Ly2kWkCso+Mw6qJhYQqOnGa5NlvVRy4cFWQc9B4vwS7kIDIbym4yvRe+JU
	 IhoE4jvmgszTg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix gtk offload status event locking
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231019155342.31631-1-johan+linaro@kernel.org>
References: <20231019155342.31631-1-johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org,
 Carl Huang <quic_cjhuang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169822807368.891844.11001606844056073292.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 10:01:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_030118_178481_63F3738D 
X-CRM114-Status: UNSURE (   6.15  )
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

Johan Hovold <johan+linaro@kernel.org> wrote:

> The ath11k active pdevs are protected by RCU but the gtk offload status
> event handling code calling ath11k_mac_get_arvif_by_vdev_id() was not
> marked as a read-side critical section.
> 
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
> 
> Compile tested only.
> 
> Fixes: a16d9b50cfba ("ath11k: support GTK rekey offload")
> Cc: stable@vger.kernel.org      # 5.18
> Cc: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1dea3c0720a1 wifi: ath11k: fix gtk offload status event locking

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231019155342.31631-1-johan+linaro@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
