Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9371FC10DC3
	for <ath11k@archiver.kernel.org>; Thu,  7 Dec 2023 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMBZABbpBLoobJK9bkZp9lwx2WswLjU6Wj7S4NnL+Xs=; b=fOiJ3uZWHi6QwGP+k2TEINJNfi
	U55uYmAXb0fiVCkuCmg68uy4i/RmS2/fYB0qm7+cbdSwmh53XTA2fhS5zPzc02b5uPTuMstEW19sI
	j2SfQo3Teg6rbCRusyMFkmvjxtCbBYYAdORZYX6uDhNvp1PpNWigTGQorxaf7dKibPt80vKZ5WxAU
	xElE9iJdJdGjPuxW62cJTSohk1xCWD/acLyC8ghEzpYkgd8hl3C9Lu1Q+yrZQiaw4dPXGVFYXFSiH
	41SSBIEAmEBAqxuwkZKv9iQWwJ6VYJtYIN2UmwhY7z2or9L3OhEENt+tMjfSG0j9QjjJwmMh4kBKo
	/AVyvmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGJt-00DCCv-1p;
	Thu, 07 Dec 2023 15:29:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGJr-00DCCF-1J
	for ath11k@lists.infradead.org;
	Thu, 07 Dec 2023 15:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9E936215F;
	Thu,  7 Dec 2023 15:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EA0C433C9;
	Thu,  7 Dec 2023 15:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962982;
	bh=Dkc/bgGCRbsrE+8dmAQ1ZSZbA5B5EpqqN6hPV9vyrO8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=azmwd+qSHm8aeO+1i1+6zpAooR6XSGHZH+5KuDqLB3kLgJ/JNKel8gPAU8mXS6C1z
	 fTAG6Iet7i2jD5N1JKHtwC/fE56Qusd6aakFmOPT7LJasnW+6BkXYdih4lNzCSrKvq
	 rZkSyIHmVmTZ1u58um2fNLvM8gpCQtkPuH5BrtV37I3QnFqcS6rZYm8hrXddqohXxO
	 qmzhOiZyWfXa/CaBYatfHGJ9lHZmVUv2wEuChGSBqSer19hvX8p31ZqKsHGyFnSBKS
	 E94vqaZ8zQFhHzkd9/gLtHD9jkX9MSoIVFVA+vuRcznj/Bf2cHUbVx5n4QMneRTttJ
	 +cc85ifbaMcxw==
From: Kalle Valo <kvalo@kernel.org>
To: Legale Legale <legale.legale@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: Fwd: ath11k-firmware: IPQ8074 hw2.0: Add Yuncore AX880 specific
 BDF
References: <CACDmYycYkdrCnSA0QK6eSMKkgqxDDmA0w_9A2e9aK2N6hhWDug@mail.gmail.com>
	<CACDmYyefzY=Fd2xoAy11dp4visP=EDizoz560cXW95U==yR52A@mail.gmail.com>
Date: Thu, 07 Dec 2023 17:29:40 +0200
In-Reply-To: <CACDmYyefzY=Fd2xoAy11dp4visP=EDizoz560cXW95U==yR52A@mail.gmail.com>
	(Legale Legale's message of "Tue, 31 Oct 2023 23:32:47 +0300")
Message-ID: <87h6kum3ob.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_072943_488163_245CC542 
X-CRM114-Status: UNSURE (   6.81  )
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

Legale Legale <legale.legale@gmail.com> writes:

> I have grabbed stock fw bdf file for the device Yuncore AX880
> (bdwlan.b290). This device is based on ipq8072a chipset (hk09) with 2
> QCN5054 wifi chips.
>
> ../ath11k-bdencoder -e board-yuncore_ax880.ipq8074_b290
> bus=ahb,qmi-chip-id=0,qmi-board-id=255,variant=Yuncore-AX880.bin
> created size: 131072
> board-2.json created
>
>
> bdf filename:  bus=ahb,qmi-chip-id=0,qmi-board-id=255,variant=Yuncore-AX880.bin
> sha256sum: 243340c0ac21ace6fb7f5452091824d641724d0512418325bd7fa8e518a1dec5

I assume this is the same file as the one you submitted few minutes
earlier so dropping this one.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

