Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BBBC47DAF
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVVswpBlwJvBGzeDxEmiZvkIxmSiPdE1iipBHfKLDhI=; b=K0T18tUu/zXQcaxZrywHX3a/6l
	7Xw4dFrQIqOlpjkZsNpsJyUuGTcmMs8PNgYqky3XO/I4KA/RbsI1YJrWgEFj/1ZK2w+ZkpXPCaygo
	wxmP4ZDOuotLIuwbfZyyTIxc5fTnqwVmzoqJMX12lGCr/A+5zooSXks91z7FoFcuPMsj9Yzsj8rzd
	oV5f3kEpQKw7ykVgMvaGJPbkzKhr7CogeNAIG1MzDrE+RBf2ez6BTC9zY5AKfsmKAWDGMqXeyY3sm
	+hkbQxR0YkDe9HWgxU+URt6xGK4/YQ5s9PzDcRN1kRWR3yVqpYPRua1QiHPnq5+S72lHDXKDXBj/W
	0TN2GLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRu47-00CEdj-0p;
	Mon, 22 Jan 2024 13:10:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRu44-00CEb1-0B
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 13:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0FBEACE29BA;
	Mon, 22 Jan 2024 13:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2BCC433C7;
	Mon, 22 Jan 2024 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705929006;
	bh=Ol96TTNYfOJdyv4nPvv9/24t5Z86jPnPqKam2MbKhfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYFOdbuyilxaaHOh5qzgYaJE+e7iG2+JYBD9R7IOieiz9dmxiaJLOmHrKgWnhcsTU
	 PkTsXJR437gYgDDHnKeH1bqpl34GUjexQmzCyB018vp68IzEfpYmaWz6t20LrGbtZ1
	 qPQyRsY7sSaPRYgBKY1c1O9DVrSLwhxWlHmxvDafWYd0WhDsn0o4XlQ/LIXNes3zWa
	 i5M5yEtOQTostafqOftsVA0iFEZMzj1CsacfJPur8aLwNAqCUTXHVObSSMM1zgL7xX
	 buKaYThBY/YM8gdm4JJ/+tSRRrQF3TNh4YJdxYtlq8qGzX3nTQoRAwjHIREOlyMj2m
	 TOnGwYy5RHApg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rRu48-0000000083I-261d;
	Mon, 22 Jan 2024 14:10:17 +0100
Date: Mon, 22 Jan 2024 14:10:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ath11k: checking RCU usage
Message-ID: <Za5pOIkQ0SN2XzHr@hovoldconsulting.com>
References: <20231019153115.26401-1-johan+linaro@kernel.org>
 <87o7goxget.fsf@kernel.org>
 <ZTfgJCBxsNv3bVjv@hovoldconsulting.com>
 <87zfx98r6a.fsf_-_@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfx98r6a.fsf_-_@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_051012_263883_41406C9B 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Kalle,

On Sat, Jan 13, 2024 at 12:26:53PM +0200, Kalle Valo wrote:
> (old discussion, changing title)
> 
> Johan Hovold <johan@kernel.org> writes:
> 
> > On Tue, Oct 24, 2023 at 05:07:38PM +0300, Kalle Valo wrote:

> >> Thanks for the fixes. I really like using lockdep_assert_held() to
> >> document if a function requires some lock held, is there anything
> >> similar for RCU?
> >
> > Not really, but the checking is instead built into the primitives like
> > rcu_dereference() and enabled whenever CONFIG_PROVE_RCU is set.
> >
> > For some special cases, we have open-coded checks like:
> >
> > 	RCU_LOCKDEP_WARN(!rcu_read_lock_held());
> >
> > which similarly depend on CONFIG_PROVE_RCU or simply
> >
> > 	WARN_ON_ONCE(!rcu_read_lock_held());
> 
> I just found out that sparse has __must_hold():
> 
> https://lore.kernel.org/linux-wireless/87sf31hhfp.fsf@kernel.org/
> 
> That looks promising, should we start using that in ath11k and ath12k to
> check our RCU usage?

I see that Johannes already commented on this in the thread above.

I'm pretty sure smatch can't be used for this.

Johan

