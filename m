Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D53F606A32C
	for <ath11k@archiver.kernel.org>; Thu, 22 Oct 2026 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fNefKCFf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVx7YpVP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WA0HjoZPG69qc7BzEqvg42tb2jNqkhyITb+oHaatNjM=; b=fNefKCFfRlm1m6qOQlOKQW9x1S
	pVOBpPq8vAeTPeHqID18uQ3kVmLclGoe/82Zp2kZt2vVzaLvf/xbqVxuHouKzSeaBVsuhHK3QWiJF
	b5PO58cA/WTvz2wOLh4JjaEq1cYCwUZrhkAfYzKQ4FHQNwDIVqJX0QIcPmx6qUxWNiKt/3Bmo0cVa
	WLFl57VaI9yCF+WarLPDZmM2ljsfd7NS7usaIpPsYUGmZbrfNIj8+IdvVLxrqbmPPORmib5osHhxM
	uThi4nfdu4Nfd83QEhiLBqAJAdL0XbuUgankfaDtQ7G+GMCCTS5TjjfE423UX46TeA+0ADFiCwLrR
	fb0p6ILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwnL-0000000EbSe-01Il;
	Thu, 22 Oct 2026 17:41:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwnK-0000000EbST-1zcZ;
	Thu, 22 Oct 2026 17:41:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D14DC40308;
	Thu, 22 Oct 2026 17:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9321F01825;
	Thu, 22 Oct 2026 17:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792690897;
	bh=WA0HjoZPG69qc7BzEqvg42tb2jNqkhyITb+oHaatNjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LVx7YpVPNro/10kqILXUywAKYh8MHO+20TyQ3UdL0wM2L4sfna/0xFVRMA4I1qpK3
	 mxQwiKOYqsgot7qOFjH4KjtE4SvIEWJoKUP//QrDGzEeb0yiV2uLbrhQe5v9lKli7R
	 hr81msoE/9v6vCjmYKxd4pP38v1BFHrrrsdBikTtZslX4gh4Xmohw7W7Bu13RToLKb
	 UyVETZftx0U3bz6IG+g2jh8Agq7Ael+DzhxQ9Q9y+OheOyMVxRKScbu6v/oYjL5ouQ
	 nuMnPJZaTF+Cx9wzauPXMk8bKH7fqX+JHGL4V8eGocSZN9N0HxvQIfwpzXG2RaBe0L
	 zHssg2E7d0RAA==
Date: Thu, 22 Oct 2026 19:41:25 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, jjohnson@kernel.org, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	andersson@kernel.org, christopher.lew@oss.qualcomm.com, deepak.singh@oss.qualcomm.com, 
	raj.bhagat@oss.qualcomm.com, juha-matti.tilli@iki.fi, jeff.hugo@oss.qualcomm.com, 
	vasanthakumar.thiagarajan@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] net: qrtr: Allow the host QRTR to assign a unique
 node id
Message-ID: <lmv7gtw42x2n3hrjsxobzdv6ya47ftoo5pq4i4baj6qeumzlav@fkjcmw7e32gb>
References: <20260922-qrtr-multi-ep-v3-1-c00831e88957@oss.qualcomm.com>
 <179032218286.2160803.9910557055402731112@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179032218286.2160803.9910557055402731112@kernel.org>
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Sep 25, 2026 at 07:43:02AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 2 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] qrtr_endpoint_post() (net/qrtr/af_qrtr.c:570) replaces the
>   previously unconditional `qrtr_node_assign(node, cb->src_node)` with…
> - [High] net: qrtr: bypass of node ID rewrite for short DEL_CLIENT
>   packets
> - [Medium] The lazy initialization of node->ep_nid in
>   qrtr_endpoint_post() is an unlocked test-and-set: `if (node->ep_nid ==…
> - [Low] The new gate `if (node->nid == QRTR_EP_NID_AUTO || node->nid ==
>   cb->src_node)` at af_qrtr.c:570 reads node->nid with plain loads…
> 

These comments are addressed in v4.

pw-bot: cr

- Mani

-- 
மணிவண்ணன் சதாசிவம்

