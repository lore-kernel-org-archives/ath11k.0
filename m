Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C710BC04FFE
	for <ath11k@archiver.kernel.org>; Tue, 14 May 2024 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PENZCFomTm5tQGAsks9ufWO3m79aXAbeSJJHfZfEYbc=; b=kmcQ86TVliXSyy9MYKsvP/5gkr
	ROv8n0wLqAKTAH+OL5vNSKpu3tqEt6p4eHT4k/Z97SzQqGStMMxMDQ1fCAsMmjufgzOPn6c+wGeNi
	HjrvOJ3zWo0NC9b5T9TRtLb2fUZc/7FdlRRznzuFGvWauzgMm6dpBKVQtFItuXBe4lZ6//GQFgHtE
	FPM6Tz+0CpFrho1p5ll8F8MFdeg/HJ9Ga7PZMTLDZ5qMmhBcQgAKn9HHHJYe6xTz4R9oWQMpo57rH
	ZF0J594A3NoEBAzuEt+PLucfXlLkM9jR7X/RIp7HasOaOSbgB4PhKy3Qs3Tf55vQuG/JA7xxKZMP4
	Xe7hJwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sZU-0000000G5iZ-3ok2;
	Tue, 14 May 2024 13:52:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sZR-0000000G5ha-3Jkf
	for ath11k@lists.infradead.org;
	Tue, 14 May 2024 13:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5ED06126A;
	Tue, 14 May 2024 13:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CABC4AF12;
	Tue, 14 May 2024 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715694714;
	bh=R/1VExEKXdpSSpeOfIuEd1O0aNDvKIRCpBfTqbd15Mg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gSpTyays0LYY4ooZsyyyRrDaM7pkLb7GYKzJoNE+EAYveWtjpZjRAciUaikEOnK+8
	 9WgIfyuiEDU3m8WY9ucvzuV0gd5Lsvgf71mEW7XMHdzKIntERMEoMbWshDz4QMA8kb
	 /HITb97RmQnuPfok1H17zE9BhWNn8Dc1tUhZEbKFlzRZqrcum8I0EF7lHkLf0uQiMn
	 sSF781Q5C0szFqPSq/CS2Tn8hGx/w1/pna8nNn1ePQ400JO42CyqysewadMNAr4B+u
	 PBHePE0+rSsZ9o6jzCkpVRpEXxiTzMxWhTl+2lPitb3id1fD1Z25skmBF5NuuQdyrL
	 wzo7UKSIeD0ug==
Date: Tue, 14 May 2024 06:51:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, horms@kernel.org, Jeff Johnson
 <jjohnson@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org (open
 list:NETWORKING DRIVERS (WIRELESS)), ath11k@lists.infradead.org (open
 list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER), linux-kernel@vger.kernel.org
 (open list)
Subject: Re: [PATCH wireless-next] ath11k: Fix error path in
 ath11k_pcic_ext_irq_config
Message-ID: <20240514065153.1320f47f@kernel.org>
In-Reply-To: <171569306687.2017278.16792087877494747045.kvalo@kernel.org>
References: <20240508185902.70975-1-leitao@debian.org>
	<171569306687.2017278.16792087877494747045.kvalo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_065157_912595_EC7457FD 
X-CRM114-Status: GOOD (  10.83  )
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

On Tue, 14 May 2024 13:24:28 +0000 (UTC) Kalle Valo wrote:
> > If one of the dummy allocation fails in ath11k_pcic_ext_irq_config(),
> > the previous allocated devices might leak due to returning without
> > deallocating the devices.
> > 
> > Instead of returning on the error path, deallocate all the previously
> > allocated net_devices and then return.
> > 
> > Fixes: bca592ead825 ("wifi: ath11k: allocate dummy net_device dynamically")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > Reviewed-by: Simon Horman <horms@kernel.org>  
> 
> As commit bca592ead825 is in net-next I think this patch needs to go to v6.10, right?

There's no rush, FWIW, we can pick up the conversion after the merge
window.

