Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B570EB64D9
	for <ath11k@archiver.kernel.org>; Thu, 15 Jun 2023 11:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/geFNqOgbQ7fsVW3mOKhiRnHVZjeR6BjwN9LYiQlBwg=; b=4csYAy08gGlAzh
	X5Adqm8spqOv9kzbGw61ZH1DDTe5Bd/xnhuWbxmnF4vg1nUJch3LGpqEcvcEjCKnm5UQMwMs28LMZ
	x2dujlif31Ph9M+nDXJd4gJ2kSa3tC+w8PPzOa2nOvNAPN1aqIqtihRuVQYxOVzlUfAF62fZtrqzj
	x+dHJb6xqiB1Bi/24GRfZT5OPim9cAca7esyw4hjA/g3Ol4tF4qeIX96lPAnO4o3APbD7I84sBQtB
	o9SCoUwQpBSJTukXp1e8FXnH1F/7C4BYOj9D2ey4/xBZOuYpNj7MoAHKuxIdxthtedgCgdQzEOmm0
	/sQpYuSQM/f53S2t9XtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lKg-00Ejpa-0X;
	Thu, 15 Jun 2023 11:40:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lKc-00Ejmq-1E
	for ath11k@lists.infradead.org;
	Thu, 15 Jun 2023 11:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C516761BB8;
	Thu, 15 Jun 2023 11:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A87C433C8;
	Thu, 15 Jun 2023 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686829201;
	bh=pyu4I/v1KzEtwaZxUoDpwULyt62LfG5n4s4H0cxODJM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=nVyTTd7eaPRxYVWwnRycGUJGtoHFyfeudPP4aaCamDKe4lN5E2jlGSK3TqsyznXv0
	 XBKEaRlnyUaGxRVrnzDmkRpD0ASfx2O4LOjF98mme1aZn2MVKn/aRSU8dh47CZsS3D
	 stoZPcuysRnjID8x6UY8OckRtfZoroZtcH0tD9iw3NSigfDN5aQItoGxJV8PNiwWVH
	 ru2AJy55+XNfVEjXrINOMeY9hyznOMHvny4Hq+ulueJpRKfelcPUxAQ41VX440Qe0P
	 xVZfG3qGwHaD0RFjhDo6OLyIbvwlW1MN4MxHi3KMz2vh2ajzLXH1kBKDW58UjPqdIO
	 d+xD0NYqcr4qw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Add missing check for ioremap
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230608022858.27405-1-jiasheng@iscas.ac.cn>
References: <20230608022858.27405-1-jiasheng@iscas.ac.cn>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: akolli@codeaurora.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168682919799.30767.14368815744969338217.kvalo@kernel.org>
Date: Thu, 15 Jun 2023 11:39:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_044002_493570_15F2E330 
X-CRM114-Status: UNSURE (   8.19  )
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

Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:

> Add check for ioremap() and return the error if it fails in order to
> guarantee the success of ioremap(), same as in
> ath11k_qmi_load_file_target_mem().
> 
> Fixes: 6ac04bdc5edb ("ath11k: Use reserved host DDR addresses from DT for PCI devices")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

16e0077e14a7 wifi: ath11k: Add missing check for ioremap

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230608022858.27405-1-jiasheng@iscas.ac.cn/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
