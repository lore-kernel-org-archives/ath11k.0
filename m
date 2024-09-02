Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1446C54FC6
	for <ath11k@archiver.kernel.org>; Mon,  2 Sep 2024 23:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpyggXBbenDbJc1bquQc/ZQ5jBTNJbug3nLOeKJCoHg=; b=osamAg+xwY/OcFXb6CClPZzmMB
	za5nGFF26B0lQpSVzwsQATVODrb/BQ8S87wFPs8L9Y++KJtRWMnCF5WRulf/0/lWov2JwAfMkOcIv
	rQoQKarYeujWcc8wwAFjliJri5bPmte2dfi2HOmC2VzL+neU9XpLw3CtiiG8BpbmRheypW5ScTpLo
	mmPqt5iEppe55EcGGejPyG+Rd/J+2/Nh5tV0hy/6dNlDod2aZZwGNslUny9ecFUbTQ+FzPuoefDaI
	cIDSISPPhi11q6yJvm/SP9R0F4oFa5jWG2Enk5ceAzFp8ekHHO0x8fY6TddRpAm6mWEm5pIZrcf8w
	d1tQz7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slG21-0000000FjTj-38qb;
	Mon, 02 Sep 2024 23:00:21 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slG1c-0000000FjL3-0Dpn
	for ath11k@lists.infradead.org;
	Mon, 02 Sep 2024 22:59:58 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 49CDB1FA4F;
	Tue,  3 Sep 2024 00:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725317990;
	bh=BpyggXBbenDbJc1bquQc/ZQ5jBTNJbug3nLOeKJCoHg=;
	h=Received:From:To:Subject;
	b=pQAVd2a5arUAxhbrKzalYYsxQ8Uj6dto/4WGz9NZ1UFXUvtrwrXecn6xHcS2R83mC
	 EOWcW3uftRZt3VCTaDFxmKZTAtdfePJA56eSpoAuZ46/k2+eKaGn3OZr8qrYFHi2+g
	 /ukgoVPKSKuy3dify30r9XfVPbmrxdUuYKylozo1RsOOrgCj9Nvlw3SF6ka6U2OZLu
	 b4oiWAAcujM80Jz5+P4SktcGB45G394Bt6pkx3rJYNDNjFc4F46ig0SBPC1EdWLZHT
	 LMduxGknytzcD4tmLmD32RSlRQeJXJPW/IS+M2YkIM6fzd4OMnF6g65FiQU3a2RXnV
	 HTaVjNtEv4UJQ==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id F2B5B7F82A; Tue,  3 Sep 2024 00:59:49 +0200 (CEST)
Date: Tue, 3 Sep 2024 00:59:49 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Kalle Valo <kvalo@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, ath11k@lists.infradead.org
Subject: Re: Silex SX-PCEAX BDF
Message-ID: <ZtZDZXY04PEYiuCj@gaggiata.pivistrello.it>
References: <20240829120037.GB30406@francesco-nb>
 <87ikvekoww.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikvekoww.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_155957_001241_6AC7DC86 
X-CRM114-Status: GOOD (  17.86  )
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

On Mon, Sep 02, 2024 at 07:20:47PM +0300, Kalle Valo wrote:
> Francesco Dolcini <francesco@dolcini.it> writes:
> > I am using a Silex SX-PCEAX wireless module (QCA2066), and I would
> > like to understand how to get the board file merged into the wireless
> > repository so that this module can just work with ath11k driver.
> >
> > I have some files I received from Silex, but they do not look suitable
> > for integration as they are (board-2_US_EU_JP.bin).
> >
> > Can you help? What should I do?
> 
> Board files are tricky, we should write some documentation about that.

If you have anything available, even if this is not polished, feel free to
share.

> But for starters I recommend filing a new bug to bugzilla:
> 
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
> 
> Also include output of these commands:
> 
> strings board-2_US_EU_JP.bin | head -1
> ls -l board-2_US_EU_JP.bin

There was already a bug report opened for what looked like the exact device,
I did update https://bugzilla.kernel.org/show_bug.cgi?id=217509#c9

Please let me know whatever else is needed to make this progress.

Thanks,
Francesco


