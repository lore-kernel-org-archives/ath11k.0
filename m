Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080E5C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9C660FC1
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 10:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA9C660FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7aBdct/GWCkpOV6VtbM3n6b8g0EJxaqi4+4vyJiA8P0=; b=TyCxwcx5MSE7r1
	s4OPvG2HFaXvyZOi2H6abgX1p7o3Si/fEzN4sVZ7uy/IuO8sRBWkvkuX167ZGs3w7GjuT0IwVK7Tw
	KyVP9o0HvLTfT4UcgFPhqSnMNTl8E5y/GHEIyzuc6ylNSOG7/tDKFrxb12zyser346G2PoZ2bSNEV
	GVi/Hu2ORpBUQFDd2/jsFkWbSaDilIPlqmBSj8MUskD/AXS6LrdjUfjC4L2uAwhd1HZGe0Yy1V181
	REzm5dvXjMno1MmF7ykvl7f29rAfuUWiCd7r+On8HFI94dD4Z0TbqThUemxJqVdkTIRMNnA1FU9Fg
	K9S7cNUmV9qTMupxK4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJD4t-009qIl-TT; Thu, 26 Aug 2021 10:57:47 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJD4o-009qGb-8f
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 10:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=0GCw62geJv8DFsg2d0ecUX2tUwfJ+4AXx5psLdYUqE4=; 
 t=1629975462; x=1631185062; b=RVGg1VjIMTR7Xx4Z3/gxSdgwCbK+5v3qGMr9xRCnFdnAATX
 oUTxqC1FOFMow2tmo+Nqh6SnGFZzRTSgYRFR7mzs2LV5WX0Wip64gioYczNgdKIG52LPrrhAx6WkT
 Ud5n8G6qBSVnB/ep3PGk5ASGzNtTyepwDATRS5oKiIGvvQ4esps7xOy70HOGT4z8UgQ30/j+e8Jpt
 dt6YF1+RvILWF1im9LlkQKyEqDyvELtnbqa+kp+nmyqaztiamcHrPXDVTPiCzcHNoww23VFf5rQ7v
 h3lErelaY40m9D2hvi1rhPkkA+D6TcCALa92/kR/GYcnY6XX3HYs6LLIwjlGlsLQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJD4m-00G7Ml-Lo; Thu, 26 Aug 2021 12:57:40 +0200
Message-ID: <5c85b2bcfbffb617c5aa3f55e7ae94a1ab4df743.camel@sipsolutions.net>
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element
 and power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 12:57:39 +0200
In-Reply-To: <fe21853e8c9a73632e0ca860eef00296@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <fe21853e8c9a73632e0ca860eef00296@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_035742_355529_DD772D16 
X-CRM114-Status: UNSURE (   6.58  )
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

On Thu, 2021-08-26 at 18:50 +0800, Wen Gong wrote:
> > 
> it is memset here i this patch:

Oops, missed that.

But is that really a good place for it? Doesn't really seem to belong to
assigning a channel context - maybe put it into set_disassoc()?

johannes




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
