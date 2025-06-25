Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B655BC7115C
	for <ath11k@archiver.kernel.org>; Wed, 25 Jun 2025 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCotVHEFx8ELuiwiQ6neQaERxu6au4F3ibtGmtBqmKQ=; b=dxR4+MhToeQrxtYtRRc2QkGcAM
	dzMbbx3bodSiXi8FALbiM35fk8S/LbPfHrI74TRaTVFxD8tvWwxjTW5W8l9YGoGh/dzH+yc/x9IfG
	QJOVBbY/5JicAYm/b8KpirMBZIJlpgVh03e3AbSBz+2ICOI4nX22p0CRnti8GStera6Kr95N8eQsU
	2EUlRaF0zALxLDpqnrrbmydZj9d1QkJaDumeVei3XPWKzjPhXtD1Ka8TXebefeV4w+3pmnvTd0fqS
	uTe4ubj8Qu1Tl0PhIm7CSDdM0grvII5Hg2FuQuKuCNeDVImZvjozvthPmTpQP5E8ec8Nf6RY5jsdz
	5ejRE4Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNpb-00000008OgN-0cNa;
	Wed, 25 Jun 2025 10:58:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMWN-000000088x2-0u7I
	for ath11k@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lCotVHEFx8ELuiwiQ6neQaERxu6au4F3ibtGmtBqmKQ=; b=GElISULiwc1GLHsiqfG6LcCfSw
	bXxJorpzwnwYmCBPxeZ+FMOJBdtHUoLJmFX3tfilC644MM7iK8UA2ymcnmSiKRFobFJ0upvHLtisd
	qkGXkML4RVme6cVeMnHgB7SYPLKOV6aYowPk+TcBAw5TtGu47m2f3USOFWVWFwI5PKoL7jmbJaeiM
	O2valk8VKCXEdLoc0b8IBp4exCO00Xd3jb8QnoUENjI4A7OxL0MfPj9QvVErtMn+fZEnDbZk0wcr1
	DVy1Av6BYrG3M1BP8Kjbg+8OPqSTMGhjgkjM0xwoNddVwkJyeTv9D/A/Rqv3geUnQNb8VyGiPClBp
	cN0EElPw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMWG-00000005jy1-3QZF
	for ath11k@lists.infradead.org;
	Wed, 25 Jun 2025 09:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 116DF43DA8;
	Wed, 25 Jun 2025 09:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE93C4CEEA;
	Wed, 25 Jun 2025 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750844051;
	bh=0/e6LfauK0af41XU2bytum4b2Y0CVYm09/82M2rDCw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jPmh68vn27DxyA8uVhf+aO8kwJDiumL6JUbvKDVxUKb6+JovY+T8mRPi6v7EduP1n
	 6ifjZP7ERDt/hBpHsLODXoPvD66mMys0fsLCeshhe8WFDcXl8CbNCm4QsbLIofT3H/
	 ivHuWk6VjA/sbr3aCrFSBRCN23fVVL8x0HmkHvtfVNWONUUb4HlhQ1K24Z2PJtrPT1
	 eHby9thPS0Mr3feclGr56JfLchNgnFhpznASqWqz2lUJIPoH7f7cWwJwwYgHHEcgUw
	 +0Dd5RPFaEqmmUpubP6OUCsxQ6HGFZ9N/03FfWQ9YYrIGYMpKVsESfpe3pTff5y0Jy
	 LUSgtuWaw5iew==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUMWA-000000000LN-3gtA;
	Wed, 25 Jun 2025 11:34:10 +0200
Date: Wed, 25 Jun 2025 11:34:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
Message-ID: <aFvCkiJCRmwtqhWt@hovoldconsulting.com>
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <70b25ff3-b366-4e2d-a52a-0b2d50ce88c4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70b25ff3-b366-4e2d-a52a-0b2d50ce88c4@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_103417_079922_6F77DF02 
X-CRM114-Status: GOOD (  14.67  )
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

On Wed, Jun 25, 2025 at 10:06:21AM +0800, Baochen Qiang wrote:
> On 5/26/2025 7:48 PM, Johan Hovold wrote:
> > Add the missing memory barriers to make sure that destination ring
> > descriptors are read after the head pointers to avoid using stale data
> > on weakly ordered architectures like aarch64.
> > 
> > Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> > 
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> > Cc: stable@vger.kernel.org	# 5.6
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

> > diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
> > index 8522c67baabf..549d17d90503 100644
> > --- a/drivers/net/wireless/ath/ath11k/dp_tx.c
> > +++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
> > @@ -700,6 +700,9 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
> >  
> >  	ath11k_hal_srng_access_begin(ab, status_ring);
> >  
> > +	/* Make sure descriptor is read after the head pointer. */
> > +	dma_rmb();
> > +
> >  	while ((ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_head) !=
> >  		tx_ring->tx_status_tail) &&
> >  	       (desc = ath11k_hal_srng_dst_get_next_entry(ab, status_ring))) {
> 
> Johan, dma_rmb() is put inside _srng_access_begin() for ath12k, but here inside each
> caller. Can we achieve consistency between two drivers?

I moved into into the helper also for ath11k in v2:

	https://lore.kernel.org/lkml/20250604143457.26032-2-johan+linaro@kernel.org/

Johan

