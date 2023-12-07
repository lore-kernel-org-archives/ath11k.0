Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D949FC4167B
	for <ath11k@archiver.kernel.org>; Thu,  7 Dec 2023 15:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h25rxF5aarsJ20gSuljnUYqF3OF+Buytpw5tQQyraVI=; b=F6brBzMj7lB6omOndzVJ5eIZiX
	V9vpmnvc/wQ3fe5ayxj3LndoRozphDjlCLn3D23Q1NhMMnwvNrNI2ZLDHmrzlBYYxy2XWQgdb9pIc
	30k2KY1SAj33Q2tic00WAl5S+/yTRXFNuS77xY7kPW3U24ZfQhNTlSeOj7SIH/WFqyA3zzrfKMq8h
	9lOoyfoqX23AaAZOzTDyJLOzqKULnB72Kx6UsdPqLFZ1fp4de35A8Y/1qyB3McNPdjH+CJUaewSSR
	zUq+T6h3ZKj4nLi+p5B97xpCqYJqVLgydmOVLRjXGaIViqbCI5ZQZNsGFnSjhpU66/npadHajr04c
	ylcU4ygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGJP-00DC4c-21;
	Thu, 07 Dec 2023 15:29:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGJM-00DC2a-1t
	for ath11k@lists.infradead.org;
	Thu, 07 Dec 2023 15:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5917CE2444;
	Thu,  7 Dec 2023 15:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAFAC433C7;
	Thu,  7 Dec 2023 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962945;
	bh=bYpV7Eem5xLCQ/0ySZUsmInO8QtqPWyK4rRPv0rirXw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JlPqybtPA95auwDQoARcB3Irrxrbu2uou/jns/+yhx+QupjjTLXQoa4+pN40sJ5y7
	 1pRYDI0hHJBfcnFDb7br+6YdjWg0y/D6M3sOtv82mZcfgmlII1Nf6zYRaJ0HGDX1Tq
	 437hi2ORdiOwBWlxr3RJxiWLqrZOxRPqXRXV7MF8a3DUXecYFimzigsfJmffitKTBD
	 SPF6U3J9BuLpOk8mK9DolbTpGLKa8e/UgadizEvy55PIF2BTwgu3crPyvK/J/Mbi8A
	 gBMr3usCb2WpRAMkeO6/8PFWmOxf5AzjpY4kwb0+wZj6qTp/oTACnpfaxvbMWbwI9Y
	 x+OvJsNF3o6eQ==
From: Kalle Valo <kvalo@kernel.org>
To: Legale Legale <legale.legale@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k-firmware: IPQ8074 hw2.0: Add Yuncore AX880 specific BDF
References: <CACDmYycYkdrCnSA0QK6eSMKkgqxDDmA0w_9A2e9aK2N6hhWDug@mail.gmail.com>
Date: Thu, 07 Dec 2023 17:29:03 +0200
In-Reply-To: <CACDmYycYkdrCnSA0QK6eSMKkgqxDDmA0w_9A2e9aK2N6hhWDug@mail.gmail.com>
	(Legale Legale's message of "Tue, 31 Oct 2023 23:25:37 +0300")
Message-ID: <87lea6m3pc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_072912_793906_1E25FD79 
X-CRM114-Status: UNSURE (   5.21  )
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

> I have grabbed stock fw bdf file for the device Yuncore AX880 (bdwlan.b290).
>
> ../ath11k-bdencoder -e board-yuncore_ax880.ipq8074_b290
> bus=ahb,qmi-chip-id=0,qmi-board-id=255,variant=Yuncore-AX880.bin
> created size: 131072
> board-2.json created
>
>
> bdf filename:  bus=ahb,qmi-chip-id=0,qmi-board-id=255,variant=Yuncore-AX880.bin
> sha256sum: 243340c0ac21ace6fb7f5452091824d641724d0512418325bd7fa8e518a1dec5

Thanks, added.

New board:
bus=ahb,qmi-chip-id=0,qmi-board-id=255,variant=Yuncore-AX880

Changed board:


Deleted board:

1 board image(s) added, 0 changed, 0 deleted, 11 in total

New regdb:


Changed regdb:


Deleted regdb:

0 regdb image(s) added, 0 changed, 0 deleted, 0 in total

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

