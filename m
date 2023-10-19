Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37119CDB489
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eB7Gk1HWMcE7jTpSiqc6F55mzjfuW11MtyfNvSW8ZuY=; b=okFWubeM/7OH7p
	v/6RqcsUHezHPKGcQ8Fy4ZaG8OfVlDTPnvqe1+VqsXLsTLIeS08p9k7MwiiAHvj3AGm7WqWowx5/O
	+/R7vPb7juMxzY2qqlV6Z8aKIBUr+vS7AXu9xLvEY1dIla6LiUOAR5WE3WqlRQst+egehp70KAlCG
	CrCbiGWx9fmvJz1v3PGEd13sK2mXAmjJrbTsTJzaPAjUwdNmXWis9hAZc31BvAJs98xaa9u4nAor6
	gPb/kAkjNxK3kE6oaHl6yt1q+0xdnK5eN6397RUB6N8eYHOH3TfV9cK+biUVtMHCXTXqzD187uUhH
	uUfRqCkYl1bxo9C70X6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV1C-000CZU-17;
	Thu, 19 Oct 2023 15:33:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtV18-000CXt-2p
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 663D3B825E1;
	Thu, 19 Oct 2023 15:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71960C433CA;
	Thu, 19 Oct 2023 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697729576;
	bh=6AUvT9lmCnlzH7BLowOH+X3uuIrFpt3l7ALwRPy7k48=;
	h=From:To:Cc:Subject:Date:From;
	b=eSSR0/rRNY8AZ6icxglMEVkboZR646ZlZMHxFOfc7LUuqbxuZXnuQ2m/uouOp/RBR
	 QxGBBEa91unkbPNTEApm4rpxBDC7RrTRXkaGniCCFWxnpIts0wAYFTRR08iBMCxOqd
	 xT3j7+RHWKQP+L+0olZsY+oHPd8tzkg0DJRMxOGssDivldEvqrRn30jYvqLIlXAkuT
	 Fv2lJ26ZCT4xV9apTy4FZQtJfdKEaDDBmA1BVJUW22H5ntf04SW5LVr9ETR5az90DS
	 cgGE+P8/B6z3MdOZlOZQKu4YhHnS6SNsivEx/fpL73ADd4LFIa6fOsNtNGBb4M1RgQ
	 R3AwqSLXf332w==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtV19-0006t8-1D;
	Thu, 19 Oct 2023 17:33:00 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/2] wifi: ath11k: fix event locking
Date: Thu, 19 Oct 2023 17:31:13 +0200
Message-ID: <20231019153115.26401-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_083259_044812_57203C4A 
X-CRM114-Status: UNSURE (   6.02  )
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

RCU lockdep reported suspicious RCU usage when accessing the temperature
sensor. Inspection revealed that the DFS radar event code was also
missing the required RCU read-side critical section marking.

Johan


Changes in v2
 - add the missing rcu_read_unlock() to an
   ath11k_wmi_pdev_temperature_event() error path as noticed by Jeff


Johan Hovold (2):
  wifi: ath11k: fix temperature event locking
  wifi: ath11k: fix dfs radar event locking

 drivers/net/wireless/ath/ath11k/wmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
