Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8CDECE57B
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoY5eMzfUB6CYTv+HimEutOE6V9gGOCAoiZ4wBd+sT4=; b=KKx7PDkS5gF6vzxIJZVu9nwLAp
	f9lkgz2/ZflRFN071JxNquMYJuqToxnqGFEmDMr1IG/urjOuZ+1E6iZ5wUbJ4DizQlFFRahEds6vL
	DSEp0emmADEsbC4qwKVPgqYi0K8hpmfgXBNVhLiPJWpfIT+NAvKovYJ7MGsdA0e3fgKMDENc/YH5z
	8cJeL+8k/cX3xfMRcYfEJtfIQzMH0k4R58zYDHka39x9qCpYExNGj/iM+rSjzHba7xlrcZzRxaWRP
	/2uCqEMv2ay5wv3HaR26OLMp9SWZJOUCKtKfwAHxra7xTxHXMvmz2ciN9ycRzyiCD+pBStEujUq5E
	wiCriIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snac0-00000001Hxu-0xPd;
	Mon, 09 Sep 2024 09:23:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snabA-00000001HlX-30Mi
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 09:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 760EBA4018E
	for <ath11k@lists.infradead.org>; Mon,  9 Sep 2024 09:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C37DC4CEC6;
	Mon,  9 Sep 2024 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725873735;
	bh=ZoY5eMzfUB6CYTv+HimEutOE6V9gGOCAoiZ4wBd+sT4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=slR5I05xsrsTdIIZVY31+7VuL7WykwtMeTvkLDIuO0RaQUkg2WEEGokVOqdolB0h+
	 fKHq8OrRFp5sA8hsjdk1OC6wEtPO9xx/jIhxtq83eZc9eaH0qqfSqJbFd0c72CNU49
	 FAAux/sKmKtxDYk0Rw6bxo/1nLvpBVZPX/GdhWNrvXWGEnvGSIoVGaAPI334Io32eZ
	 lpUSzFY9Nm/LUXm1wFGthXwyKxhnDEVEDHo6oeMV6nzHlZodoozXQMDSSybeh2RMp8
	 qIXaotFv9iFAhPOMTcDfdi0IU/6QVTcGML+ojpJienmX3bB5WENwoRs0YpGNWDCYSF
	 oRdIfIrPxuYSw==
From: Kalle Valo <kvalo@kernel.org>
To: Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>
Cc: ath11k@lists.infradead.org
Subject: Re: board.bin file for IPQ9574
References: <t4kb7ljvau3ycvfr66kkidjqy2iim5ln2jobzrv5x6glb5cfwi@ybjrfbrogxwg>
Date: Mon, 09 Sep 2024 12:22:13 +0300
In-Reply-To: <t4kb7ljvau3ycvfr66kkidjqy2iim5ln2jobzrv5x6glb5cfwi@ybjrfbrogxwg>
	("Marek =?utf-8?Q?Beh=C3=BAn=22's?= message of "Sun, 8 Sep 2024 13:00:23
 +0200")
Message-ID: <87ikv5gp16.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_022216_843213_3BFF887F 
X-CRM114-Status: GOOD (  15.24  )
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

Marek Beh=C3=BAn <kabel@kernel.org> writes:

> Hi Kalle and linux-wireless,
>
> I am trying to bring up a IPQ9574 prototype board with QCN5124 chip.
>
> I am stuck with the ath11k driver requesting board.bin file, which I
> seem to be unable to find anywhere. There is such a file (board-2.bin)
> for example for the IPQ8074 SoC in linux-firmware [1].
>
> There is IPQ9574 folder in https://github.com/quic/upstream-wifi-fw
> but

We have nothing to do with that repo, the name is very misleading. You
need to contact Qualcomm about that repo.

> it does not contain no board.bin, only other files that kernel
> requested.
>
> What is happening? Why isn't this file available anywhere?

We really should write some documentation about board files but no time
right now. board.bin is part of calibration data and it's product
specific, so finding the correct one for your board is not simple.

What I recommend is to file a bug to bugzilla and explain your product
in detail (where you got it from etc):

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

That way it's easier to track this.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

