Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7E9C00A8F
	for <ath11k@archiver.kernel.org>; Tue, 24 Oct 2023 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNDUXShk0dWsjBgktpJI0Cb/Qxma54IomZm9C1bxP5k=; b=QDXNvW4peAyidg
	g43/7EsTsGpaI1zt4ThrrwuEnOcqefl/SmVm2U3GO/OrplPwySdHYu64DdSdjuHnhxWPF5c8fZoB2
	NRc6haXqwkg6icrQwqG/yACp/r5e+c48iKKncxaAjBBTtJ3hVP3F8SJ7Ex8+zlYA6TFDM6zGyiZ64
	1WmabarsZWOINYUvLkCdNnsR2hPKcwdZ9r2rNVwt/E191wx0xYB7bOD3b9msEzL54e/6bEAhP3jnt
	vSu+AsC1SUtkHBpTi0bEGADzW02TPG9W9lCu4r8eGubZwEhTRul4xwINnCjPFmBoXXFYcVGTt0rp2
	nhTACtLHK68yNOCsmBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAU-00AFwp-0s;
	Tue, 24 Oct 2023 15:18:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJA4-00AFVz-2R
	for ath11k@lists.infradead.org;
	Tue, 24 Oct 2023 15:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D777462B4C;
	Tue, 24 Oct 2023 15:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63D2C433CB;
	Tue, 24 Oct 2023 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698160659;
	bh=Yc5CJPTtSMwymg05TTypHEKQD0X0q++YptYmz8lGZxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Po9/XiE+0wrYuCxp539fhXU/t3kxxUsnbvYHpVX4cV9eLm3jfjmlx/7jlGdrWVBu8
	 0dpGrXF2+CLoF1C0YU0ELgszjrRXf0IOZDBT70I8hDQL5arhc8/k5uqpjETmpHyh4G
	 Biczvhq7i0Puygvw3RrjxILTmT6DFD4L9wZNZmtvV/zzxW5Of33TuNZBuaqhxTjbGc
	 MHRPkCGgb7zFfkf7XTA5PXG/pHZE6m6vNjShVGWCk3FceEe6fZq4NWy0lUKR+6jBw+
	 mP9NN+RU+TbQRZ8q5Hwm9TCNkRyNJdYdlnCM1AKN8SzKCMas/i4CJzxDOVgJJwIDvM
	 K9DlM5NbeHi6g==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvJAK-0003r8-1q;
	Tue, 24 Oct 2023 17:17:57 +0200
Date: Tue, 24 Oct 2023 17:17:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] wifi: ath11k: fix event locking
Message-ID: <ZTfgJCBxsNv3bVjv@hovoldconsulting.com>
References: <20231019153115.26401-1-johan+linaro@kernel.org>
 <87o7goxget.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7goxget.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081740_854318_A18C270B 
X-CRM114-Status: GOOD (  13.18  )
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

On Tue, Oct 24, 2023 at 05:07:38PM +0300, Kalle Valo wrote:
> Johan Hovold <johan+linaro@kernel.org> writes:
> 
> > RCU lockdep reported suspicious RCU usage when accessing the temperature
> > sensor. Inspection revealed that the DFS radar event code was also
> > missing the required RCU read-side critical section marking.
> >
> > Johan
> >
> >
> > Changes in v2
> >  - add the missing rcu_read_unlock() to an
> >    ath11k_wmi_pdev_temperature_event() error path as noticed by Jeff
> >
> >
> > Johan Hovold (2):
> >   wifi: ath11k: fix temperature event locking
> >   wifi: ath11k: fix dfs radar event locking
> 
> Thanks for the fixes. I really like using lockdep_assert_held() to
> document if a function requires some lock held, is there anything
> similar for RCU?

Not really, but the checking is instead built into the primitives like
rcu_dereference() and enabled whenever CONFIG_PROVE_RCU is set.

For some special cases, we have open-coded checks like:

	RCU_LOCKDEP_WARN(!rcu_read_lock_held());

which similarly depend on CONFIG_PROVE_RCU or simply

	WARN_ON_ONCE(!rcu_read_lock_held());

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
