Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046EAC4332F
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fobCUGMCsnZcio2G80jX1Xdtwlq0hjUZdgDa/CikGqs=; b=zTekLRdowZY/7D
	R5GJKb/3lNSJIrwUS3G0AMwoDGvRr6UAwy+MktYXcnvQ3Bzqtr0owl3+UFZp6qo0J6FFcSsg2w712
	ZCg7WyoXH+koPOBtkj+qIQhXe1K2S818cjWbyOzmCpcxQpwCA6Y1GOQ/tPBGNskr/CgvgSvrMg85y
	jGtXq7nGOhWlikrtUUG+belVqEHMxGUl/qRhiY6LlUmclkorAWV8Q7yKXyAfb+a6kXzPKBYPYoW0w
	OgIVEhKmDxKbU3rA46zi7JrBF1Lpe4ovp3KS2iT7RdbdUHv/1uhjCpnkufMthLwx3e9Ww4CdPh62U
	Yloqe4+awPbeJCrynEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHKm-00CS1C-5d; Wed, 02 Nov 2022 17:15:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHKh-00CRrA-6i
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 17:15:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D9FEB822F4;
	Wed,  2 Nov 2022 17:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B682C433C1;
	Wed,  2 Nov 2022 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667409316;
	bh=qK3bx7QoAh9fwPJHJizhUKV9fbdiG40FN0gZzQ2hwIg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=n03OxBc7g3UloZP5Z04sZpbPDxEhvFkRIXuQ0rcShfJ0CirVAxiXaKK6TJEJpUQZw
	 JKU0gfhRV03o/QSNwHlTKskHaW7Zeg3jGsvarI1i1naMUOLbus8RMTLOD23ulMuD26
	 FKcz82vtDP50uvekdh1h2tCM7PcWq3Rf+m5EajFQ1eYdHYpLmnpS1qKgE3BYyJvQ4E
	 pMurRK7lH/3wAE+N6SQBdtXsT25zauiLT53iw89YJ2hYVeyzg2rsyJFNcv8l2kQPcs
	 guppyO8qQUwq5UqxHF9MppL02VvMqW1H/vJ0enJ6mFjUALAdhmd1SKug5oY0fQo3Hu
	 24jkyAkKAGxGA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix QCN9074 firmware boot on x86
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221022042728.43015-1-stachecki.tyler@gmail.com>
References: <20221022042728.43015-1-stachecki.tyler@gmail.com>
To: "Tyler J. Stachecki" <stachecki.tyler@gmail.com>
Cc: unlisted-recipients:;
 (no To-header on input), "Tyler J. Stachecki" <stachecki.tyler@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS
        DRIVER), linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS
 (WIRELESS)), netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
 linux-kernel@vger.kernel.org (open list)
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166740930971.12704.12404773753216417373.kvalo@kernel.org>
Date: Wed,  2 Nov 2022 17:15:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_101519_487526_BE19AEC2 
X-CRM114-Status: GOOD (  12.15  )
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

"Tyler J. Stachecki" <stachecki.tyler@gmail.com> wrote:

> The 2.7.0 series of QCN9074's firmware requests 5 segments
> of memory instead of 3 (as in the 2.5.0 series).
> 
> The first segment (11M) is too large to be kalloc'd in one
> go on x86 and requires piecemeal 1MB allocations, as was
> the case with the prior public firmware (2.5.0, 15M).
> 
> Since f6f92968e1e5, ath11k will break the memory requests,
> but only if there were fewer than 3 segments requested by
> the firmware. It seems that 5 segments works fine and
> allows QCN9074 to boot on x86 with firmware 2.7.0, so
> change things accordingly.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
> 
> Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

3a89b6dec992 wifi: ath11k: Fix QCN9074 firmware boot on x86

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221022042728.43015-1-stachecki.tyler@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
