Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0A9C433F5
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggNpbh8FKik3/gGAumnowdlM1J/Q7sAdcfFUt2120QY=; b=sUdu5LSWjk6gxX
	TOTxyiHnSRYBNk2eknmrOqwrq5dKYu4O+B0/AqVlBiKwYosW8gxnb/1YvouHk2518xhWBoQ+h1J2t
	094/OrsiGmVFne+TA6G5Bc2/zfNzdS3PLrMYAo+bwDpr3+8ttf0xdJWw4hF5sWqY3Bvx+p85sZpBH
	i1Lxv2sOtrwp3v2yglUt8FRven3Z7OvEeG2bQpj6tskjENz90DYO4N50WXH82awYO6rS84FhkXc78
	UnTtrFcdcpyw0VnIgwMW3+tps0d0bMcNNe1ixUSspqRafc7DExlbYhL4onqxpExtC6PsrbKOfrMVS
	3TnQUVhQprLqVqKaJrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9LH-004mL6-Kz; Mon, 23 May 2022 14:47:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9LF-004mKc-In
 for ath11k@lists.infradead.org; Mon, 23 May 2022 14:47:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9F0961204;
 Mon, 23 May 2022 14:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27412C34118;
 Mon, 23 May 2022 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653317245;
 bh=kFfYyaivZqNk5FB1RoBokpKV613iugm2ZacsHlK4ltQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LaeNdRvZCyRAkd5NOTIS4Xc/rBdSTRhrPpZJe3lVChIFX7UGqqSmg8H2gB6O5x0zO
 xZiT390r1n09f0UhjdewiKqjhCdrugedW0xO5ecxrO/896nkFwUSJ2Q4C79wZ/XZHM
 GUlK0ip1ZTHgh5s1mUnPFg4jcqg5eebNLFFDiOqazMQ3aAQEIE2It0sQikTOU93EGu
 GcZHDRJaq+a08ga3K10gjTORSb00TvWlvuiN2V1N5eI+9cJqeytGGJfQmsWzD0nulA
 a3HZotVtuFZV1F8G7WRJHwZ6kbayvmLhu4ph8RyRU2wXERnUVj3wQJ1/AApS1Y8cRn
 4FdLweaILYkdQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1nt9L8-0006gy-Up; Mon, 23 May 2022 16:47:23 +0200
Date: Mon, 23 May 2022 16:47:22 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath11k: fix IRQ affinity warning on shutdown
Message-ID: <YoueemdqqRCwtk0z@hovoldconsulting.com>
References: <20220523143258.24818-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523143258.24818-1-johan+linaro@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_074729_698426_9E96A321 
X-CRM114-Status: UNSURE (   9.97  )
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

On Mon, May 23, 2022 at 04:32:58PM +0200, Johan Hovold wrote:
> Make sure to clear the IRQ affinity hint also on shutdown to avoid
> triggering a WARN_ON_ONCE() in __free_irq() when stopping MHI while
> using a single MSI vector.

Forgot the tested-on tag, sorry.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

> Fixes: e94b07493da3 ("ath11k: Set IRQ affinity to CPU0 in case of one MSI vector")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Let me know if I should resend.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
