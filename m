Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E127BC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:10:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3DF261053
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 11:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3DF261053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94ms09InIIJ6lmE5+eO9Gk4LubPtsOTH/3rsYIc3vQg=; b=ThkLtuMdGKGTM9
	7fyGah7K+i19d/ItAXOgC2KJgQ1xpACL7rcd+uC4QtNi+7PRx/h3ABC8tD4FFRSy4MCfCKgnE4KBL
	sYTIqOkRiHpDlwcl+kN3zSSsSWvlLsciHjS86jxeeQa2dCgvs6zHxtyKFuaMcsb97JmkpBmazAvYM
	2HNSXVjPRvSVHsVtDFbLfzLhALLAkzRYZUixa7VtaNly8s0dCeFUPN8iF7OUfRlUeXkb2arGGDUot
	8/1m55S5KLTkn8w8Db1J322XGFL84BOt70UhPu6SMZBmsDXXDegiCTmGOUNvhTuYrl8ebSRhA8lG1
	8n1zzrf94QCyNDzYTGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJDHR-009smD-Qt; Thu, 26 Aug 2021 11:10:45 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJDHM-009skt-K4
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 11:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=czeI+nFfn0fKCtI/TVIcOvMy5GtYOlDI6pZBIAoYgAE=; 
 t=1629976240; x=1631185840; b=EZ4PRqFTlL48YtC6CBQ5TMXupRgSJsyeshuMi8xGZJbsAf8
 fFsfRC4rUkkhsf12pylqfeJU0TkcMUHtsWC8GS5N8AdUJjssogaq4csZCvZybbxCS9njas5xiS+BU
 i7pbnxVMKw0VKhBT4G9M9783Ix+ff1DBPnzSpoM75Q6vK7vjNw74L83Et7zGADByOL/MyV3498yxV
 Quw0YKva6xbRYowY6XncpgbQZR5z3kx6jOTb5FamPUhJK6NIH+JAYE8PQdVgjz5xLYGt+VnHyjBvK
 Z6yhKwzXw4YXZ0hWzUXMhO/bYQL5lsYMFcNFifwePEkDbSXjFaqZb9GAl+X8GEMw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJDHK-00G7g3-Rq; Thu, 26 Aug 2021 13:10:38 +0200
Message-ID: <e75ee4e160d6ec09d9c5f131f882d2e9d8eb49cd.camel@sipsolutions.net>
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element
 and power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 13:10:37 +0200
In-Reply-To: <f86091b72422d194a2e59b1f6d27a69b@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <fe21853e8c9a73632e0ca860eef00296@codeaurora.org>
 <5c85b2bcfbffb617c5aa3f55e7ae94a1ab4df743.camel@sipsolutions.net>
 <f86091b72422d194a2e59b1f6d27a69b@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_041040_743529_B8E9D9B7 
X-CRM114-Status: GOOD (  12.51  )
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

On Thu, 2021-08-26 at 19:00 +0800, Wen Gong wrote:
> On 2021-08-26 18:57, Johannes Berg wrote:
> > On Thu, 2021-08-26 at 18:50 +0800, Wen Gong wrote:
> > > > 
> > > it is memset here i this patch:
> > 
> > Oops, missed that.
> > 
> > But is that really a good place for it? Doesn't really seem to belong 
> > to
> > assigning a channel context - maybe put it into set_disassoc()?
> > 
> it is correct.
> you can see it is place together with "drv_unassign_vif_chanctx(local, 
> sdata, curr_ctx)"
> in ieee80211_assign_vif_chanctx(), it is for disconnect.

Yes, I know it's *correct*, but that doesn't mean it's *good*?

Look at that code - it does nothing with bss_conf. Nobody is ever going
to look there.

johannes
> 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
