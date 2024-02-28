Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5259C47DD9
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wZzV0B8UvqcdMbuBZm6H+rkJTyru8ZZ0o4b83vzEy8=; b=sEjTtSjEADaJT0qj/1mivsRLQc
	s5bYRxhtdf03AbkzbZ/NP6ZfI2EaZRHfVghr801KWdruSqS9xFcEhbE0T+wgvbpIqsvMd6cxi0oSk
	TDx+m8//QdNVQQ4/eRIR9UghBcBohDgacWVdUx9Y5p5an7wj4THbZJH7wTTBxz++kJ/9Z9z+Skv0l
	va9zDzmJjx1ob9c+t63GPxs1AKUMmurGHtQ4woKSLwsgqqkHKm6zJZlh4HvQTqjKvxaE/6/TywQUm
	vMBApeVKK01kP7cIKeeFmO090CP2/1jwNTrY67ITe5bydQ3zGVwYNy1Zym6Z8WBtYCt3R62myhoYv
	RXQU6pIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfIVw-000000098ah-3CnA;
	Wed, 28 Feb 2024 11:54:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfIVt-000000098Ya-0Dnt
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 11:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 390E3CE1C9D;
	Wed, 28 Feb 2024 11:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210D5C433C7;
	Wed, 28 Feb 2024 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709121254;
	bh=nqMafNlXl1HPu7b7h2D4wOn/LYFJbvKOatfRE8tIYOQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=c+RbXO7uaPl/MFkWqAMpm0Ae0N9i0yr9iPRslSJcxe4gvbTuGY2s0WM0M54Gxe+mZ
	 czSuP4f/Ym4yzCmdIwgjORxTI84nbVYoLmCbVOZfkF4dNMFqirdW3oZuW3KwJdDxun
	 3jdZL5iyG9csKeX0w6NuU0IBWv9yy5JUU+1Bxr8gesaXW+Hy+J7udTWCugxxpdVUlX
	 /YIzsc91tiE4FpNzMk3TQ7XiKhcmzXu301ywE1AlAJXLAwGzkax+6RU+EuM50j82OW
	 HO2fkgab5EMPK5E3g24aKqP92ue2SQiKQxyUcl23OpKI1V1hL36OCKJ4xFrVhLcbM9
	 v8xEETfSfecLw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] bitfield: suppress "dubious: x & !y" sparse warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240223100146.d243b6b1a9a1.I033828b1187c6bccf086e31400f7e933bb8373e7@changeid>
References: <20240223100146.d243b6b1a9a1.I033828b1187c6bccf086e31400f7e933bb8373e7@changeid>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org,
 Johannes Berg <johannes.berg@intel.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170912125112.3868947.18107049542995601682.kvalo@kernel.org>
Date: Wed, 28 Feb 2024 11:54:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_035417_422306_05B65F8C 
X-CRM114-Status: GOOD (  11.74  )
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

Johannes Berg <johannes@sipsolutions.net> wrote:

> From: Johannes Berg <johannes.berg@intel.com>
> 
> There's a somewhat common pattern of using FIELD_PREP()
> even for single bits, e.g.
> 
>  cmd->info1 |= FIELD_PREP(HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_MSI_SWAP,
>                           !!(params.flags & HAL_SRNG_FLAGS_MSI_SWAP));
> 
> which might as well be written as
> 
>  if (params.flags & HAL_SRNG_FLAGS_MSI_SWAP)
>    cmd->info1 |= HTT_SRNG_SETUP_CMD_INFO1_RING_FLAGS_MSI_SWAP;
> 
> (since info1 is fully initialized to start with), but in
> a long chain of FIELD_PREP() this really seems fine.
> 
> However, it triggers a sparse warning, in the check in
> the macro for whether a constant value fits into the mask,
> as this contains a "& (_val)". In this case, this really
> is always intentional, so just suppress the warning by
> adding "0+" to the expression, indicating explicitly that
> this is correct.
> 
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Patch applied to wireless-next.git, thanks.

416eb60317c6 bitfield: suppress "dubious: x & !y" sparse warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240223100146.d243b6b1a9a1.I033828b1187c6bccf086e31400f7e933bb8373e7@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


