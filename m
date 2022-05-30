Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FFCC433EF
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GopDtYNywReGqXG+C+S8Ca8JOq5OnNi+z2suMdSfDqY=; b=RVmVFG08jhKKZd
	U8h9olBlkG6qfIYi6nSKeLfQEJzsGtJr+xmfUOHR/8PuOv7imLwevh0qGjY/o0QdpKoFXV9G+8mNe
	TcoF8q3ShsG3KCADS+HgVD/qeqnq9oPZDjTErhu8tP7HRlNsLbiEx9kQEa9SDalhnNOg0Vy8Dp36L
	/fv+koPX9AZ2BJ4l5XN23ctLOKiX8xOh7j9YNIJRzMpyJ1ks+dbJO2ogEngfo5gNjvsqRj+u3cAUv
	mT2BQ/aK7hWujMaWTszn/uHzyEmozxJV/mTdYrhfd5m6Fyq/8Sph2SWeknJ707cF6i4DbLQg3GLGh
	1BHeDHRxq276ijTYW2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdgD-006NAJ-Nz; Mon, 30 May 2022 11:35:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdgA-006N8x-Fp
	for ath11k@lists.infradead.org; Mon, 30 May 2022 11:35:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 13E14B80D7A;
	Mon, 30 May 2022 11:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBADC34119;
	Mon, 30 May 2022 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653910519;
	bh=26Kux3PyarW6Nbrz6s4UxEYoay2f7CdauW6UqGckS+k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=hesDoJ9mh+BacantMkXObjjJEpRvskiv0cxJk74iEc86IjtFhT4Rsn/zt4CSXNSXp
	 mH/RT02CmIf1Ov0vZFaQbPp5PFkN4KZxRCgD+ADT8eV6+LHZihOtl3EaOxkeLqlnbA
	 1uSV1F0g4UmVQ5C9EPjjS0Wn3HhoKHUyz78TkjVJy+jL7zFBJW83oSyE/U4nBGiw00
	 jaI/AVsSv4XEdtJhTeS6TGKgKwk817SyMy6HUvCoVUeHObw5KzU1kTQrNSYm7Q+z2B
	 eavxX2Dc3JLqRZ1d7+l44EN6ygjK/Kvd1BpgS1v8FoxwPpdPD+Uoc6l4kgSBfu4+p1
	 LUw7VJJg6qvpw==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: mhi: fix potential memory leak in
 ath11k_mhi_register()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220530080610.143925-1-niejianglei2021@163.com>
References: <20220530080610.143925-1-niejianglei2021@163.com>
To: Jianglei Nie <niejianglei2021@163.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jianglei Nie <niejianglei2021@163.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165391051496.5601.1908067980296464087.kvalo@kernel.org>
Date: Mon, 30 May 2022 11:35:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_043522_725520_ACC9227D 
X-CRM114-Status: GOOD (  12.25  )
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

Jianglei Nie <niejianglei2021@163.com> wrote:

> mhi_alloc_controller() allocates a memory space for mhi_ctrl. When some
> errors occur, mhi_ctrl should be freed by mhi_free_controller() and set
> ab_pci->mhi_ctrl = NULL because ab_pci->mhi_ctrl has a dangling pointer
> to the freed memory. But when ath11k_mhi_read_addr_from_dt() fails, the
> function returns without calling mhi_free_controller(), which will lead
> to a memory leak.
> 
> We can fix it by calling mhi_free_controller() when
> ath11k_mhi_read_addr_from_dt() fails and set ab_pci->mhi_ctrl = NULL in
> all of the places where we call mhi_free_controller().
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>

Fails to apply, please rebase on top of ath.git master branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/

error: patch failed: drivers/net/wireless/ath/ath11k/mhi.c:367
error: drivers/net/wireless/ath/ath11k/mhi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220530080610.143925-1-niejianglei2021@163.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
