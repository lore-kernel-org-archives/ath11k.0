Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571B3C4708E
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9feAL/fuNtACbFO2qRmCAW0nnb5/sk/W6dS8NfcqZSI=; b=DDFm6m2n0N0OWG
	X7CxqeztUT3ejwxN/SdgD8TJnNqYU/okCcXMw5KtxVIWZZZ94NI4Smg5PIFBP0CpdXzwq1RPL8VPO
	qQeP2iKc63ZXEyG28caODORY4DA3OPeSS/iTW4+iMN6NeWb6w2UwsBkO7VRjluA34MGQ8whd3pFfN
	4LSRnTWm/PaldT82DgyP2BrWuKr+pBwPHXKTWnzntbk+DPiASpsKOhxOO21Dq9GLlSccmzjRhpnFK
	MvRgfCk//LB9RQHcyTKwA4PDeoD3kj37Nq3El78rD+DFATHkXIsOPgepgY/XenGdzWBtYSvdIRq4s
	FqLCQDKRCmS8wnxypF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2u0V-002uWy-E2; Wed, 07 Dec 2022 12:58:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2u0S-002uPa-50
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 12:58:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B5696151B;
	Wed,  7 Dec 2022 12:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33569C433D6;
	Wed,  7 Dec 2022 12:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670417914;
	bh=fXQFwTsBjg7YXktLb7Jv5LSKGJ5MO+I6ROpcyq5JyEU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VVMHEjCayGry1Grcatng55s2O19sM0bjEAttqL4/VN+8H2p65QpmcmkV6uYQwgnWR
	 TLLxaDJM/5/pXbqnlYaX08w0aCizmGPutywrjDcq0aYs47j3K7IC1mW2xxFA42BngZ
	 E+rB/I1RL1UlC8zMPq7iE+D2xyeK6REA2TUJosI/tbHkRaWVN++KlDgDDD6CUNhMEn
	 v4C6CaGccHPf8exfgPS/Y1NJN5qJJdYCHkIMxwh3B0TLaELTTmwpJqmX5h4Cthc06Z
	 Cs0tAcGgQE1QhqmvYdMRrz3dGda9571JCwoKuUs6Mapr7qcWtcbXQ/Wj82w7o/HloM
	 MsnaBpdsKXxjA==
From: Kalle Valo <kvalo@kernel.org>
To: Legale Legage <legale.legale@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: wifi: ath11k: ipq6018 monitor mode is not working properly
References: <CACDmYyc7G=pv5gBpwxm=tYChnbnmtTV990aEDCieLeKvwr=pOg@mail.gmail.com>
Date: Wed, 07 Dec 2022 14:58:30 +0200
In-Reply-To: <CACDmYyc7G=pv5gBpwxm=tYChnbnmtTV990aEDCieLeKvwr=pOg@mail.gmail.com>
	(Legale Legage's message of "Mon, 5 Dec 2022 20:04:39 +0300")
Message-ID: <878rjj2ww9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_045836_246630_16E1A72E 
X-CRM114-Status: UNSURE (   9.32  )
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

Legale Legage <legale.legale@gmail.com> writes:

> I'm trying to use wifi monitor mode on ipq6018. Captured frames are
> malformed. Tested with 2 diff kernels (4.4.60, 5.14) and two diff wifi
> fw (2.6, 2.7) with the same result.

v4.4 was released back in 2016 and doesn't even have ath11k. v5.14 was
released over a year ago so is considered old from ath11k point of view.
Please try a more recent kernel, preferably v6.0.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
