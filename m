Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42298C07545
	for <ath11k@archiver.kernel.org>; Tue, 24 Oct 2023 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNWcSVLeewXtOjeAZaR+Pd3OW+zxMDrRmi9QUKdcSYA=; b=gJGjAZx18Q4iwc
	dw5GdgA6SLNKB0vqorB43tWzfO+tKehX/CZt3oFaCNVMvmvhcnb2VDYGV28sxeNy/gA6oPYJtwyDY
	eyEOMMYL3zxBjqPTPpZrXbsdG7U/WYExSNvMWXD5tL/VI8Rvnrs9reOzZ+qumKTtkyAahLXFwsGbj
	TBG8doZHBr89Gwab9eMA6PH1k23MfU0kJvBGdsk7gy0br5rnb2LFiATwLmZ0ueZ/VyXQqjmQP3HLV
	pTVg/QNkpVy87SnffJfQpVNwZIj8CH4VJPBxrwpplMXUjS8p97GvGy8XCKjAQ2kZljdUE6vpO22ez
	fCadBwzSQ6aDaCORosNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIOs-00A8FG-2Q;
	Tue, 24 Oct 2023 14:28:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIOq-00A8Ea-0y
	for ath11k@lists.infradead.org;
	Tue, 24 Oct 2023 14:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C24461561;
	Tue, 24 Oct 2023 14:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAC1C433C8;
	Tue, 24 Oct 2023 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698157730;
	bh=ypIMNYS6FyQIe4ePxJ+5oz5tdfmsVd2FnFFM7K0THyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlDwkr7Eyhll2twIrEyMEwBLTavG1kyr+CWEQ2B2ZqyPbnY/TbuAeNOX3Ll1wDHBl
	 TygyF3lpuqVhzRJGWhol+qx5QNalxy+raSfqOnt44i4R4aRRR92f3JJsDk5tXd98a5
	 V8Pnks0xHYH7gu6tpSZEWMGOyyeZDbbDAIKa7QXbHFRYvR4WM4n/TEqMZLAo6DgWJ5
	 bD5ZsFfKUqZyYBJhCL47B7ZZUz+lr6tcsxwQ/j+jLnZ403pwZ7sRplkpgp+sPaSBaj
	 IsY1wg7aqo9Fek4rcJbdICYNb2zArlG7oZVNQwBcJIakMomr1DkO4eysy7nFcHjD2l
	 lVnY0egCFg92Q==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qvIP5-0003aY-08;
	Tue, 24 Oct 2023 16:29:07 +0200
Date: Tue, 24 Oct 2023 16:29:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] wifi: ath11k: fix temperature event locking
Message-ID: <ZTfUswqVkAgJvnye@hovoldconsulting.com>
References: <20231019153115.26401-1-johan+linaro@kernel.org>
 <20231019153115.26401-2-johan+linaro@kernel.org>
 <87sf60xgs8.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sf60xgs8.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_072852_405682_74B5A3F8 
X-CRM114-Status: GOOD (  12.56  )
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

On Tue, Oct 24, 2023 at 04:59:35PM +0300, Kalle Valo wrote:
> Johan Hovold <johan+linaro@kernel.org> writes:
> 
> > The ath11k active pdevs are protected by RCU but the temperature event
> > handling code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
> > read-side critical section as reported by RCU lockdep:

> On what hardware and firmware version did you test this? As there's so
> many different combos we use Tested-on tag to provide that information
> in the commit message:
> 
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches#tested-on_tag
> 
> I can add that if you let me know what you used.

I hit this on the Lenovo Thinkpad X13s and I guess the tag should be:

Tested-on: QCNFA765 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Note that I've only been able to test the ath11k fixes (not the
corresponding ath12k) and I only tested this particular patch fully
(e.g. since I didn't trigger any radar events).

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
