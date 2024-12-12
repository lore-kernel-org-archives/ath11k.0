Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BFCE7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTc4IcgQ1sraOiYJCKJ1UXzEv98qmpTa5XeUWQ/iblA=; b=npQkPCm2qss4M//jHcqfbIf3+e
	9v+KHl//Ru7GUEBrh2NH6h7lIk7hyhp0Gr/jjnC6IUdW6beMtg11ZyDjsYLK2l+IR/Y5NMq8dD5rz
	DnmMduWZQuCsYywZwfoqyxRqE22NSP13nkEkCbrgF5Ez5XA87kQDxIayfxOmrHnbvQrcyfrFXv8om
	DtBBpgdUK97l67VtsHopgbeZrDbwuEf36g+4RY+ilN52w//QiBkfQd0eSWpTiJJ9u4H15+6OZnbdz
	9iLtPaWsOkr8UJLXUgBdS9dvrHOyM7MSB+V2j3bhBc5qjxLiE4oIVLFDt7g3gT55EXz3Pf2GkNZ+J
	R5EA3IOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkNw-00000000e8b-0JL5;
	Thu, 12 Dec 2024 14:41:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkNt-00000000e7w-2cHw
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 14:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC5025C5B15;
	Thu, 12 Dec 2024 14:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9F8C4CECE;
	Thu, 12 Dec 2024 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734014504;
	bh=udnd5ep7XfiooWEs5z9E+RQRDinbRyC/oY7Nx1gVPBc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=QU8G74V4v4jtg8HVIHCG1mnlLKF+1kT6vzRHe2M64MAJUbqkHfo+22dlupzCkA8NN
	 Hp4XAdyB5SJIzh+Z+0gm2r+LJ9am+Gu/a1unfXgC/Y9HQqw/Ycg6Emf1HtROtiRipt
	 xjWSRuBrpEHBs/6fyDwJR6uYgaKwLVE5ivlDMs7GNOz9RyEup3brM4Wy/R80NCiHnR
	 g121QSbikVu19hu+FwKe1Dde9UCMmSgDAXBDCFH1bTMJ4FKK1bCRTw4BMkJOGC+9uv
	 MAB/PVhaw2wMJRGFUsB5zItgXz16Sr0G9nhDAKuInNZyRa6fLfEFG1ufayUvRQ6PIK
	 cNG1aKoKjqEDA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] wifi: ath11k: fix RCU stall while reaping monitor
 destination ring
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20241008053744.1070-2-quic_kangyang@quicinc.com>
References: <20241008053744.1070-2-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173401450207.833118.1446184244363325456.kvalo@kernel.org>
Date: Thu, 12 Dec 2024 14:41:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_064145_706926_E2C12BB6 
X-CRM114-Status: UNSURE (   8.89  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> While processing the monitor destination ring, MSDUs are reaped from the
> link descriptor based on the corresponding buf_id.
> 
> However, sometimes the driver cannot obtain a valid buffer corresponding
> to the buf_id received from the hardware. This causes an infinite loop
> in the destination processing, resulting in a kernel crash.
> 
> kernel log:
> ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
> ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
> ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
> ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
> 
> Fix this by skipping the problematic buf_id and reaping the next entry,
> replacing the break with the next MSDU processing.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20241008053744.1070-2-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


