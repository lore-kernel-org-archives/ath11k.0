Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8B0C4708D
	for <ath11k@archiver.kernel.org>; Sat,  3 Dec 2022 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEWreKbl7FHlQ2bKVYFt5+xJfbnqkoo8gqRto/ECJvA=; b=jX4Ml2MXOFestr
	GX7H/AfI2tIGcFZ+5oap1R1Sm6f7CtP4bhlxu1m2OOdFkGJEB5U+fvWLeqWZuU0pIlrvne1rwGyaE
	1btBOZD/yFss2F4uWXu+mG5pYqO9/1zca4ZS6pMzZZu4KYuiHzs00Ayo45DrDist0UiukoKV/fOYK
	IfbJbEbx/8OsHJop49MhNJZkOZpS7b32DD18ODTv3yerlGFA/52cXy3MllADwZo49nyTIDQZXEz2i
	3TvUcCOM2WSXKFjNRnLU8hjyBWc1mEjRjdmWu3NySf65K+iphZcbMFQIIQkglm31olSIf4dHXYF/I
	MkG0L/0k+KG9m5jo4s5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Uoi-0041Ba-VV; Sat, 03 Dec 2022 15:52:41 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Uof-00416U-Rh
	for ath11k@lists.infradead.org; Sat, 03 Dec 2022 15:52:39 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3E1E468AFE; Sat,  3 Dec 2022 16:52:28 +0100 (CET)
Date: Sat, 3 Dec 2022 16:52:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: failed to insert STA entry for the AP (error -2)
Message-ID: <20221203155227.GA13254@lst.de>
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org> <20221130125236.GA865@lst.de> <87k03c4mdb.fsf@kernel.org> <20221130133016.GC3055@lst.de> <87sfhx3ap6.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sfhx3ap6.fsf@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_075238_076049_66EFC586 
X-CRM114-Status: GOOD (  15.30  )
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

On Fri, Dec 02, 2022 at 08:46:45PM +0200, Kalle Valo wrote:
> Haven't seen this before either. Really unfortunate that the warning
> message message is not printing the error value (missed that during
> review), but I suspect the error is coming from crypto_alloc_shash()
> call:

> Any chance you could check that? Also please check that
> CONFIG_CRYPTO_MICHAEL_MIC is enabled (it should be as CONFIG_ATH11K
> depends on it).

So, this is the debian-installer case onc again.  CONFIG_CRYPTO_MICHAEL_MIC
is enabled in the kernel config, but michael_mic.ko is not present on
the installation media. Once I side-load it, the problem goes away.

I guess I'll respind the MODULE_SOFTDEP patch to include michael_mic,
but if you have a good idea to make the error reporting more useful that
would be appreciated as well.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
