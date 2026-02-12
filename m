Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1DDEE3697
	for <ath11k@archiver.kernel.org>; Thu, 12 Feb 2026 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjfzymEMuoIaGAIHJbRe45JPj5qW9DY5yZ1dr0gP4eI=; b=wyGp5Gk+aAo2bu7zjXBj8ek841
	HFi9JELdoUjMgtzwTXEnjjuj/eW3LJ3UHCQhFYxJyqspE+lXdGbDXchDW4PnkVmSC4NhdH+N3s0KD
	UfUGWZb9N5LnNfmdUjMYCp11huB1LKmux21pvyKZn8oE6NMSnNup8V0fkNr6FXcAM5HiE5vi9o8/7
	5oXPTq9trTQnh+QRWD+bGj3DSYiXwGHDnImfpoIerm6eU2CTsBKr8GVeJvTpZC1UI1YKZTopgQlB8
	2SfhTz5HrGt43NZQFlZ+GPi/sZlo/NM+jYQ2bqVG6Tmoh/Sb1MvCSX4YoGTQlntwoyfI6b8mRWuOx
	cGeRurCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYR9-00000002FYh-1q0U;
	Thu, 12 Feb 2026 15:16:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYR6-00000002FYJ-3ZIZ
	for ath11k@lists.infradead.org;
	Thu, 12 Feb 2026 15:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 713A1419D0;
	Thu, 12 Feb 2026 15:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2030C4CEF7;
	Thu, 12 Feb 2026 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770909415;
	bh=/YxLfHepNobMPznsIT/8d/F6MCTOOI+heTvJBv7kiXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oex44UkU03+7lRzAzgkAdYqpU4PK8HFEyN8f+VLkQmYHRec+30S4RJYoJhxlYAQPx
	 ABuVrxqU23MegqnHULPRoXj4VwojimjSgVqbM+MIiqOZt/ZBBExRCntvQxgGwEdyuM
	 IPn/Pd5+t9BkmfiWmUJQKORvUuDD5cFPMEXA1nCUOj3zozq37g5UR8L3WWzQRTuC3Y
	 tcuQwYNhqu6s06Es8of2AST5DdKTUdpbi5ysKm1kxoBA1PGesYuY9NVa+YoNb74+4E
	 dWVUE51Yo/foyemRZVOYgInb/OpqQ6Plfgxqk7AGZPaxibIC3YRVjlvGd/UtBjqp1f
	 Mr4Hbw/kYIkBA==
Date: Thu, 12 Feb 2026 09:16:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
Message-ID: <zpddlyuwrxr2rwjsyzsucgm3irtxmetyhhajptveojnmo7vcni@ntyqoahm6xtq>
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
 <f028462c-ae31-4fa5-b414-e03d3a73fdf4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f028462c-ae31-4fa5-b414-e03d3a73fdf4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_071656_941634_131D1E28 
X-CRM114-Status: GOOD (  23.79  )
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

On Thu, Feb 12, 2026 at 04:01:21PM +0100, Konrad Dybcio wrote:
> On 2/12/26 3:52 PM, Bjorn Andersson wrote:
> > Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
> > ath11k_err() is used to tell the user about the (presumably) temporary
> > failure.
> > 
> > Reduce the log spam by removing the duplicate print and switching to
> > dev_err_probe(), in line with how ath12k handles this error.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/net/wireless/ath/ath11k/ahb.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> > index 8dfe9b40c12626649639fc1dd9da0e5e0c2dcaf1..08d3a0c8f105b26b1548c5d6006f6ea162fe58ff 100644
> > --- a/drivers/net/wireless/ath/ath11k/ahb.c
> > +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> > @@ -807,10 +807,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
> >  	}
> >  
> >  	prproc = rproc_get_by_phandle(rproc_phandle);
> > -	if (!prproc) {
> > -		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
> > -		return -EPROBE_DEFER;
> > -	}
> > +	if (!prproc)
> > +		return dev_err_probe(&ab->pdev->dev, -EPROBE_DEFER, "failed to get rproc\n");
> 
> I'd like to think this doesn't really change the behavior, but I'd rather
> see this that in-house print functions..
> 

I'm having problems parsing your sentence. Are you saying you rather see
us keep using the ath11k_* functions?

> 
> >  	ab_ahb->tgt_rproc = prproc;
> >  
> >  	return 0;
> > @@ -1190,10 +1188,8 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
> >  	ath11k_ahb_init_qmi_ce_config(ab);
> >  
> >  	ret = ath11k_core_get_rproc(ab);
> > -	if (ret) {
> > -		ath11k_err(ab, "failed to get rproc: %d\n", ret);
> > +	if (ret)
> >  		goto err_ce_free;
> > -	}
> 
> If the rproc handle is unavailable at this point, we undo quite a bit of work
> in .probe.. would it make sense to move this check way above?
> 

Given that devlink doesn't covers this, but presumably cover several of
the above resources, I think that would make sense. It would be a
separate patch regardless...

Regards,
Bjorn

> Konrad

