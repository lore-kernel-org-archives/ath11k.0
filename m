Return-Path: <SRS0=FQv/=HH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B41C433DB
	for <ath11k@archiver.kernel.org>; Fri,  5 Feb 2021 14:06:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E14F64FCA
	for <ath11k@archiver.kernel.org>; Fri,  5 Feb 2021 14:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E14F64FCA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DbVcgLO0auZSGsY7087UtPxK+o7RcYDM3tCUqAhp1yA=; b=y5Rk20PpS0j+V274i1zU0ukdx
	2aCuzVz13O/P78naeo1dBNE9SAxOe6BzBvaMzW+ppfKXq7iKn6y6DaPJUm+IhL23RfK6bnHO6lDKm
	wvqQsPMor9B7oNzuFvGiAlQ27z0dDM9+P0HkeC7pSSkc7wFCOXyni1x3eXXOVhucOpvBVAFI+yHGF
	O80+ZYe/6+KCPvKBoT3kUi0tGPykEynX3ANEabKLoKPQXuQLCULVtMACAibBANgqnwHPL8akQtGDH
	qeqH1Vr2ysaieLW5DaW0wCVY+QB9J4vSjlRuAxb//FlOR028l3RsUPu/bdzR0/XnXqEDdgn1wKsiF
	1QK+3kN/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81l4-0000po-GZ; Fri, 05 Feb 2021 14:06:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81l2-0000p9-FU
 for ath11k@lists.infradead.org; Fri, 05 Feb 2021 14:06:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C11AF64E50;
 Fri,  5 Feb 2021 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612534007;
 bh=ZnxhsdsVe19qzzUQely0sSrtaY4w+WieV8v108r7G7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kb/0c2QIq2bVQkxHgXzhodqoBYIhMqmjMu2nDdIBCKrEFrF4aIJWL5LyaV48wOGIy
 Ujv0/lBMJKMLpp+TUCOQc20/5kSrCq6xl6XFJoPAelrY2vHkwFZxqfWSGq8jGKikgd
 Vx/WLkdCmyFf96h3VnFuSred4YMs9ThOKXmQcgbs=
Date: Fri, 5 Feb 2021 15:06:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [GIT PULL] MHI changes for v5.12
Message-ID: <YB1Q0inTuMtZlVAb@kroah.com>
References: <20210205130141.GE3221@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205130141.GE3221@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_090648_608272_6FF53C4B 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: loic.poulain@linaro.org, jhugo@codeaurora.org,
 linux-arm-msm@vger.kernel.org, cjhuang@codeaurora.org, bbhatt@codeaurora.org,
 linux-kernel@vger.kernel.org, hemantk@codeaurora.org,
 ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Feb 05, 2021 at 06:31:41PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is the MHI Pull request for the v5.12 cycle. As like last time, I needed to
> do PR this time due to the immutable branches with net-next and ath11k-next.
> 
> Patch details are in the signed tag, please consider merging!

Pulled and pushed out, thanks.

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
