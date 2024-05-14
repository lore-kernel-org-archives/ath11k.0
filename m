Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0367CC04FFE
	for <ath11k@archiver.kernel.org>; Tue, 14 May 2024 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qm/uQ/vwjibVWAqWq5aRiBYJQB6zouDXVfJY+Rb2CE=; b=a4DDppMpdZbfvKgCBXp936q7QK
	Tni3OZs9qyyWXXd3gbsLa+hmJCFPww+TVl+tUEaUDTIWEsVijoLEmVPMCkwp73G5Y1Ck2etIV1KP8
	8yqB6yuuzpzI8UyyVMAT9p4XDZG+O1W45gP7d6DIEyPPUYf/OBWdZqAOfv+oxD4j/KVn1cXEuPbjk
	WTkUI3MyQklcDnc5EZUKuCRSmpI0PXRPtQnIj/zI15LPrdF1FB7NgSxZj75UbpxClRjnCNBbpEq+A
	A+P0tDS6PS7kHfCfcDc19GQW+Bk3E9AeQTy0neiRD+HKunvI1N7UG7DkLcn/cT7MnW7YrsiqVtHxe
	8LmeOzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6s8z-0000000G1jS-21q0;
	Tue, 14 May 2024 13:24:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6s8w-0000000G1iM-3cSM
	for ath11k@lists.infradead.org;
	Tue, 14 May 2024 13:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DDDC8CE0DDD;
	Tue, 14 May 2024 13:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92279C2BD10;
	Tue, 14 May 2024 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715693071;
	bh=EbXUyLPzVf2Qs04ZBeB7sglb2l63aesvqV1ukVQsRgk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=qgBjSd2oEvIkfEN62NOmnXs5vsBqCuQ2xJ6Xu3fuP7dWWKq0qWTG7FXVqF3IBn9OF
	 hpNLxSa32lBaGjwQga6rIv4NNpEqYe18r6T90HY2BROs55HoxrQEKr0VGvMssbHO1A
	 ZDFJ3KXm1aFRPDqjaiY4+l8cFVxdmTLj/jbbpvt2KElnGJi+flEVzjE8QzZm8W/PtD
	 BDjhcZaUWQeMEh97Ra2lzWj6+YXiuMRcxQB6I2sIMlCoZYOp4GjPWDxZJQ1zQZwVHq
	 U6W7tste388hEaYkYOs+/xufyEd4eyT/LVqMnlvsNius3agawYdD1HCfYUuM+2bQk1
	 hMYD7kYjaHlxA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH wireless-next] ath11k: Fix error path in
 ath11k_pcic_ext_irq_config
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240508185902.70975-1-leitao@debian.org>
References: <20240508185902.70975-1-leitao@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: horms@kernel.org, Jeff Johnson <jjohnson@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
 ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS
 DRIVER), linux-kernel@vger.kernel.org (open list)
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171569306687.2017278.16792087877494747045.kvalo@kernel.org>
Date: Tue, 14 May 2024 13:24:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_062435_117679_E8A7B3B9 
X-CRM114-Status: UNSURE (   8.62  )
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

Breno Leitao <leitao@debian.org> wrote:

> If one of the dummy allocation fails in ath11k_pcic_ext_irq_config(),
> the previous allocated devices might leak due to returning without
> deallocating the devices.
> 
> Instead of returning on the error path, deallocate all the previously
> allocated net_devices and then return.
> 
> Fixes: bca592ead825 ("wifi: ath11k: allocate dummy net_device dynamically")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Reviewed-by: Simon Horman <horms@kernel.org>

As commit bca592ead825 is in net-next I think this patch needs to go to v6.10, right?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240508185902.70975-1-leitao@debian.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


