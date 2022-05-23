Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CB5C433EF
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xguLHtUkt+MI7AoID1qFgvuY+qZcw/TsSsdgo2R4s+w=; b=iOEp1q9WSucknm
	IgcOtkbtyH8EJoPY5KGU6d6reiWNH1jdF9P6gIoiuRUbxyl6qkFbP9IVF6WnQxL88cxKZjOKU9uoK
	xohcYHmclHxN8ct/phhIoVFl4P+ECCeC6r92bDR815sCyKsR3CNko4BXpCdUxJ9ckiN5HVW/N4XUB
	VuvGERrRrHHeWb8xnOwAgvwQCA9fUux4yUtUT45wvhtR2DoatH9jQ0tfV2z3dvMl+kPRZSLxbYAEx
	eHcYYTFhlLGYKkE/Vgerl0At+k+yDg2XF/fodBvG76ZSAXzflTvL1XBUHiH++N3sDQhmn6F9O0I7Y
	lP9+4NoY5uMwFNkyHhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9MZ-004mWx-72; Mon, 23 May 2022 14:48:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9MW-004mW5-Oc
 for ath11k@lists.infradead.org; Mon, 23 May 2022 14:48:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C040611CE;
 Mon, 23 May 2022 14:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B379EC385AA;
 Mon, 23 May 2022 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653317327;
 bh=JJUowl47ptnLiKQVZlPgElSH7N0NgsCjov8dxq9v10Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fnp8uE3xRSrq1EFCEfPYIoPnop6vaKngaXYjQT0GxqMofZ80GTaY+w1NWy6s6EG5E
 MFFdsdZtgGFbTy8/CpHirFEs0cE4CseNwRvx26I31rOaPSw6a5XMAof0+u+iLOgIWw
 uq0CgYlfgeMukSFYf6Tew/f+31f8hdDIzuvdjFp5oMkroBGBF7aZaWCT4zuh+6Dfsn
 qd4PDUV4O/Ntqz7THtjrEQWe3YrAnGWP0K/+K1Y0Q6eG9U0feVI2/e0wOgT517/nYH
 Mdu0TAhnGC5n+4b/046SYxHp5IplQlJpcgBIaAWhi1NrX+Mn9pja+YrbmlSxqrrdrw
 MqPNr/FlloZHA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1nt9MS-0006hx-2D; Mon, 23 May 2022 16:48:44 +0200
Date: Mon, 23 May 2022 16:48:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] ath11k: fix netdev open race
Message-ID: <YouezMIwm3PYxOKY@hovoldconsulting.com>
References: <20220517103436.15867-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517103436.15867-1-johan+linaro@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_074848_876249_D7EC8F1F 
X-CRM114-Status: GOOD (  11.29  )
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

On Tue, May 17, 2022 at 12:34:36PM +0200, Johan Hovold wrote:
> Make sure to allocate resources needed before registering the device.
> 
> This specifically avoids having a racing open() trigger a BUG_ON() in
> mod_timer() when ath11k_mac_op_start() is called before the
> mon_reap_timer as been set up.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Fixes: 840c36fa727a ("ath11k: dp: stop rx pktlog before suspend")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

For completeness:

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
