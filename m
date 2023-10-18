Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6289CDB47E
	for <ath11k@archiver.kernel.org>; Wed, 18 Oct 2023 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcAerXIMV5eOoT68H6lXjLhvpJ87x5cII83AUKRSUJs=; b=q6VqlEjX2lfAMX
	LFZHtSNZcQSM7iHZuiccLZYX/ZrqtAuKB2aX+DlKxpUt6v7E9tnlBxxIJl4HeTHJGKYyv1CLNvKO8
	ar83swReXYJzOBal/CL7g4lNTm/Jj8s2iROi8Yj49Yi/OF3cr7QLcNA8C4Jlc2Y9eaA39VUxRonVD
	f49felPEAum7rlJrM+jGwhek0/P05Jb7iiCevEwRaVpTpRocsA10nsoED28m5zJwD6HEuZMSoXEGg
	y73iPLFWgw1unurvWQAXM9R8aWZf5XUw1pM9wD6sgAn3wHk0t1HyEO172J0aHf7QqvyPwhOpkTFFv
	FLjaB+dOsH4bXL+2D+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1xK-00E9h7-0r;
	Wed, 18 Oct 2023 08:31:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1xH-00E9fq-1X;
	Wed, 18 Oct 2023 08:31:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F09B160FAF;
	Wed, 18 Oct 2023 08:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542E1C433C8;
	Wed, 18 Oct 2023 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697617862;
	bh=DmaIORX38lsk+s8u9A1sNW59yUVMPJkqJEYyV4bNIhY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HBIxPtGUhN/JlZd7seAMtycPXYiSRFWhQXCYyKYdLKpJxh+LujAL0rBktmZ8OJNjK
	 Uf/vRvEIg1V8qOiEFI/Nq3+fyTcORNb77V/qxVNfc2E8eLdMnPeszKtlqEwkTc0oKM
	 C05h5vWMEnLnr0y7WGymgR+VpIIDuZLmjlzcdgA6nzA8aoR97fjzxVDFKnt5HyoeS8
	 FryJn4jKuvHbtc5hdtj9EvmxTuxGpNwL12pvLeRewiw6iXQLPXmZCQE/J7J1fNmAZ7
	 5d0nTXsUNhUhNBZXcpIVLYPDOMuxrAMw0Qg+IKdImFurJWrPZ8a6lEiRGmpcBlGdYf
	 +/QogbGs6uNcA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath11k: Remove ath11k_base::bd_api
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231013-ath11k_bd_api-v1-1-3fefe4629706@quicinc.com>
References: <20231013-ath11k_bd_api-v1-1-3fefe4629706@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169761785908.48072.2555690903765273261.kvalo@kernel.org>
Date: Wed, 18 Oct 2023 08:31:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_013103_557410_8143D615 
X-CRM114-Status: UNSURE (   6.43  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently struct ath11k_base defines the member bd_api. However, this
> member is only accessed within ath11k_core_fetch_bdf(). Since the
> scope is local just to that one function, remove it from ath11k_base
> and instead just use a local stack variable.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

b4f70ac0fa88 wifi: ath11k: Remove ath11k_base::bd_api
2180f7ac0abe wifi: ath12k: Remove ath12k_base::bd_api

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231013-ath11k_bd_api-v1-1-3fefe4629706@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
