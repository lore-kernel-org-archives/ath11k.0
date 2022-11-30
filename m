Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B59BC4332F
	for <ath11k@archiver.kernel.org>; Wed, 30 Nov 2022 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnDTDizoVbr5eEbAllUcPOk+ivLv+jidR1rYALJsrJ8=; b=xgDF/UBb79W3R3
	lelpGXAaf8+Hi1Y4ZWFw3h8hS0Z63JHn+Tuto9OmI+8iURFuOf/MuUbBPks39187AowOwAIahc8SU
	sTb1iPwM2S8whT24QZGqLh6RdzARkJ1pmVKcpQQEjkbcwkQoUb/bn8CUeT29pwzWXVgeWZ6LBEyNj
	RPud1lfiNUqWXA72EglBz+JXPgoDNUG+i0EMyYCAcFRd+AnjX5OzZAdSwkqEgybwiLh0WkP0+slSo
	3KtMjJ6Lxq1n7/EDmVve47tmwFSuM/tQJ+qJUe4/NTVCNwHTSUDiugcWzU5/xtKNdWFYCvRtYsmak
	OD7DDTd+5HSKNw2nnm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N56-00GT6X-Nw; Wed, 30 Nov 2022 13:24:56 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N32-00GSCz-8T
	for ath11k@lists.infradead.org; Wed, 30 Nov 2022 13:22:49 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id F20E068B05; Wed, 30 Nov 2022 14:22:44 +0100 (CET)
Date: Wed, 30 Nov 2022 14:22:44 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: ath11k vs ar_qrtr?
Message-ID: <20221130132244.GB3055@lst.de>
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org> <20221130125236.GA865@lst.de> <87k03c4mdb.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k03c4mdb.fsf@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_052248_488808_1605B91B 
X-CRM114-Status: UNSURE (   9.15  )
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

On Wed, Nov 30, 2022 at 03:12:32PM +0200, Kalle Valo wrote:
> Heh, I'm learning something new here. But I wonder why nobody else has
> seen this?

Good question.  How common is the ath11k hardware, especially on latptop
where it is required for installation given that only installers tend
to split up driver is non-standard ways.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
