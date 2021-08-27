Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA343C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 08:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71C9160F92
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 08:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71C9160F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdAy609yzt6prYECrmrrr/pSyt5DLQFRP4XoOa6/ZUs=; b=MsXdi4OmPixkBv
	x0V8KzLGoIxgMRquPUxd+W6kE1ALuiLjhwZbrm414agrutveePjvqzq9FVBT+QwXwjTYGk9R28Z8+
	D7cgssLyu+ep447snmVG881EUyjDtOQJI1wN/9cii5APqlztQXI5A+zSZB/cH9Tq75UofQVtOCC3W
	royGTopE+kg3S3nw36lR3ox1y9upR8+AUwWqq5En6G1/JbHlXq368/+0O4PJsHSzuC6B5bKQYhltG
	jYaDlVu4nTpySHUSL+bDued+x5os5ntkAjaDau3CoiBs4FCliROEhliwkQf9mAnElzsXlNjwzlutb
	nayevgsQgx0ahWTZxHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJXFn-00BxS3-BV; Fri, 27 Aug 2021 08:30:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJXFh-00BxRD-FN
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 08:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=NPI1DWHvxdOXdaAuD4n6bQ7bx+Wi8FJBMBcsb3Gyodc=; 
 t=1630053017; x=1631262617; b=Ovy8akFPj2JXzjXXip259WeW1akPqxSPUr4vJ/h0UAdfmJf
 XtNe0iOKVDjxk6052G7MmyhPwqPyxCCqppwo5mbXpnJVFhQComcDiwJDGynAQtgxbswBeLd2C28Op
 CJcYLSw56fFFSR0XYjLTeM82aba2I5DTu+9Xjei0dcIHiSzbLNUPzXebf9CUhBAPWgKeJcvMwygZO
 kU/SDi5SY7WodXY30vwBxrU98QErLUth+iNx1uIBS60iyRzkEnYdN93y5elx4if6ggWoKP+rqb7Js
 9PXyoQCdYy1aScROhxAZuJcU5WDGgK1mHIi8eZ5koLPVFRInarE6nz3kGvUtVd5g==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJXFf-00GXJu-1g; Fri, 27 Aug 2021 10:30:15 +0200
Message-ID: <e985d4aa1556e9660cc7d4a3ff348d64764c4ad8.camel@sipsolutions.net>
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element
 and power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 27 Aug 2021 10:30:14 +0200
In-Reply-To: <40e8c88cec2d3601afbfe187c57fac6b@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
 <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
 <db22a4cb9a07e3845a50f436c7052feb@codeaurora.org>
 <0680b508a7864e02f55d763851f7460baa73b53f.camel@sipsolutions.net>
 <110489059796b17849d0f32fb5189828@codeaurora.org>
 <27680423e824dd67217cc6f1e62f9ac0a1af78f2.camel@sipsolutions.net>
 <01d9e4eadbb0d87edbc026fc719858a3@codeaurora.org>
 <3483aeb87a81dea538af3a2640cd49831274320f.camel@sipsolutions.net>
 <40e8c88cec2d3601afbfe187c57fac6b@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_013017_569600_02AD3D5E 
X-CRM114-Status: UNSURE (   6.41  )
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

On Fri, 2021-08-27 at 16:28 +0800, Wen Gong wrote:
> 
> the TPE is only 8 pointer in the struct ieee802_11_elems.


I know, but it's showing _just_ above the threshold for the warning now,
so if it was _just_ below the threshold before, adding 64 bytes could
still do that. 64 bytes is a lot, after all, the threshold is only 512 I
think.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
