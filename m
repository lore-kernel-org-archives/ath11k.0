Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20A3CD13CF
	for <ath11k@archiver.kernel.org>; Mon,  2 Sep 2024 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35pLevQ9EoiYsJhvEWgP/Bzs6bZxouhWLJ6+35kyaX0=; b=uvdZdpnZhQZHdCy/7Q9lVuJZGx
	6xVSq2k3OBXlox3kzskpWzFJJZnfZ/+Y1fFZlSCi/aGbIAC27zj3fAPm4W57fLuNq1jIQQxinUQwF
	8wZqu1VxukRyxXA4vAr4NjyK7HR1XzqPvRtiSNeLIDp1h/sJWgA2s2qEmCACthX51TjqCOxy/DVsD
	UHQvQ75LbYkyF00s52v6OTxbM+6EpAuiiVAX8MtJADA2WPOuRWahmrAdt/dYU0Hcu32NPEGS94NNV
	Me0athQRc9hEyUPQEM/STeMde2zOPgKc7eCmm1mvKgmr0XIjgmJlVa9rMBrTR3xKIpz+tZmrhm/vf
	6nXTX1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9ok-0000000F09j-3H2Z;
	Mon, 02 Sep 2024 16:22:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl9nQ-0000000Ezo6-1QN7
	for ath11k@lists.infradead.org;
	Mon, 02 Sep 2024 16:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A8AF5C584A;
	Mon,  2 Sep 2024 16:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8566C4CEC2;
	Mon,  2 Sep 2024 16:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725294050;
	bh=3nu6qp0SANnRKlapK2OG35MApcfzL/5VkLRqP0jNWlY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=No4Q4pcN1WSRn8915eJWohJjJy4u9GPQM6gZi3bvU25lBi3WTVAIScunKqogGZJEi
	 L6TBaj5nSeLF22RLFleILNgfYp21ONDzE9hW1SjKjPwPz67RSojxpFnlxUCbuAfaO6
	 Dq3yHWvQmJWh1rchHcuGqWSt2vEsV3Zqr/nBrMI1w8xn5dsfch7j3FbQVNPU4ajeAk
	 2QDBcevHMmhzMfxgPWN3BvIplQ81zkc131MyeFZbP/iz82w2ADI7pOmAmyLVEjwvQS
	 YrFm1QiK5Yz2ZeukkSvbPUcntWMg3IndcbJTWjyaFPTud4ZgmnYU/IxeTGKvlvXRoe
	 OpTj7YTk2xyZA==
From: Kalle Valo <kvalo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: ath11k@lists.infradead.org
Subject: Re: Silex SX-PCEAX BDF
References: <20240829120037.GB30406@francesco-nb>
Date: Mon, 02 Sep 2024 19:20:47 +0300
In-Reply-To: <20240829120037.GB30406@francesco-nb> (Francesco Dolcini's
	message of "Thu, 29 Aug 2024 14:00:37 +0200")
Message-ID: <87ikvekoww.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_092052_461881_025477DA 
X-CRM114-Status: GOOD (  14.06  )
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

Francesco Dolcini <francesco@dolcini.it> writes:

> Hello Kalle,
> following up on a short chat we had over irc weeks ago.
>
> I am using a Silex SX-PCEAX wireless module (QCA2066), and I would
> like to understand how to get the board file merged into the wireless
> repository so that this module can just work with ath11k driver.
>
> I have some files I received from Silex, but they do not look suitable
> for integration as they are (board-2_US_EU_JP.bin).
>
> Can you help? What should I do?

Board files are tricky, we should write some documentation about that.
But for starters I recommend filing a new bug to bugzilla:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

Also include output of these commands:

strings board-2_US_EU_JP.bin | head -1
ls -l board-2_US_EU_JP.bin

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html

