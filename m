Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F1DCDB482
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBsYtywuhwbZSRLTRK1HhGsAJMSIw4fULg/kx4680oA=; b=kMSo2dhGJmiQ7w
	mF6LupLy1kcjyRPjETKy5/aLVyHMP6dJd5cgfg3NiDzTRNoKMdvjglQjuRgqCi4jqPqyAOWlWRER1
	Vvzicu+ZJN06EfRumOZAAq26CveGLfLxo2Sc4XUfQjylL2GVdNNFUgYC2slKcHAvE9na8V8qZvfQh
	nhPC9HMWF9+YuasruPqPleemFR9qyBn5O1OA5Ry1uevEiT7HY3iWUHbOjzYuw89u2wdTgCTJcZg/6
	Lh3rdeSli17k4NyCaRMbWvIDKsbFlGXMiaMp01aTG+/LJd2ZhsH123q3hkTsPkEkLT8YoS4lRoYl4
	v5Z5t1NTHLWi5u/p5qmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUmQ-000B9f-0q;
	Thu, 19 Oct 2023 15:17:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUmM-000B8p-2B
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:17:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B201BB82984;
	Thu, 19 Oct 2023 15:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E51C433C7;
	Thu, 19 Oct 2023 15:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697728659;
	bh=WtVNBWC5iNjbnScpjiJDxp8GdsgsTgsH5bVGO2dnDFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ueOCtb8TLybx9AXSOcBSm2CkxjqD3rXqlLe1hBgQL4guFYt9A9ld77Tg2HjbC6I2O
	 6GlFAo/ZlGKnRsw3N3mRy0cvXRyzLjTlWP+VGrLngQMb3movYXiFNSxTSOzAU9U2mG
	 UoHaq0cADAyCel5zgFycAu8fqXLvYg0u/zeKKfgyF3JPWAGx7zN2CFhWPH1s2snv8M
	 X5cRVu/cCbZa5jN/INltP35xMFxOzRNYAFRbj0r1TWHKmkq6eHkRLkvRCg8ZVp7jCJ
	 2jTmgBsPOMXsx4+ot11p7+juPto3ClaY9SxL/ui8wZ8V0HQf3MO7wDKgU0q9AiQ//8
	 Fb/KK4JAtRLfg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qtUmL-0005Sf-2m;
	Thu, 19 Oct 2023 17:17:42 +0200
Date: Thu, 19 Oct 2023 17:17:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: ath11k: fix temperature event locking
Message-ID: <ZTFIlS79DclOOjrS@hovoldconsulting.com>
References: <20231019104211.13769-1-johan+linaro@kernel.org>
 <20231019104211.13769-2-johan+linaro@kernel.org>
 <4233c8af-5911-40bf-b5ba-dd0a63863a45@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4233c8af-5911-40bf-b5ba-dd0a63863a45@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_081742_872107_8BA8C09A 
X-CRM114-Status: GOOD (  15.01  )
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

On Thu, Oct 19, 2023 at 08:04:55AM -0700, Jeff Johnson wrote:
> On 10/19/2023 3:42 AM, Johan Hovold wrote:
> > The ath11k active pdevs are protected by RCU but the temperature event
> > handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
> > read-side critical section as reported by RCU lockdep:
> 
> How do I enable this? Just enable CONFIG_PROVE_RCU?

Yeah, via CONFIG_PROVE_LOCKING.

> Of course I'd also need to exercise the code path...

Right, this one I hit when reading out the sensor temperature (e.g.
using lm_sensors).
 
> > +	rcu_read_lock();
> > +
> >   	ar = ath11k_mac_get_ar_by_pdev_id(ab, ev->pdev_id);
> >   	if (!ar) {
> >   		ath11k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev->pdev_id);
> 
> aren't you missing an unlock() in this error path?
> 
> perhaps have a goto cleanup that does both the unlock() and the kfree()?

Bah, I am, thanks for catching that.

Spent too much time on scanning for further instances that I didn't
check the first one properly. Sorry about that. Will send a v2.

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
