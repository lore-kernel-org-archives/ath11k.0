Return-Path: <SRS0=jWs5=NE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E45C432BE
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 07:25:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE81B6103A
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 07:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE81B6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOUkc/z58LOuLgPRfadRlCGNROGlAQAiflBi5p0QuS4=; b=up6QL+e8cmzaxu
	dJl63IOeUyFJIhOjinRs35v0fMi7Qf7cu5OHfiLz2P8LatLJ6vQhrbO8IXwYCcFvwHIGCa4nfzySt
	1sBlVu/I//I/3p1dkHcvxc9jK4UistDiDkAf3VvCZVBVlKTM55aWwgKomCxnCjwriQysOieOrdFj5
	2yWSVPq7z41jQSkBJY5b/zKSW1bjwQy35i0NPhcC1JA0TE6LXy8mAVfvrxw+Mb9QPAbfkJ+ifEG8Q
	I3o/M+MAqBDYoMJEZbGWNVIQYnbYW+f5llhHwZTsDlhbWSk0rSUtj5EFMP5TaiZa2naOU1GTedZz8
	uUEBwWDqguobxzp4g0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERZi-00C8Vq-PN; Fri, 13 Aug 2021 07:25:54 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mERZc-00C8Te-Py
 for ath11k@lists.infradead.org; Fri, 13 Aug 2021 07:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=v9Wtwd/8aUIfamFoxP6ozH8U5WAvgh7jxdCw2WZN0Aw=; 
 t=1628839548; x=1630049148; b=ulXTj5VXogdD9oDsEcZGEXTDg/6+SZ0+ZqORh6559lwel2f
 Sm+8uYvhgO7kIMADj2KXp7rohqydwmZmPvbETjKkkFO04ThlIkCZ+b911sKzV3cKXG5vok9Bu3Sh7
 8f8sQJzK+m706h3s3yhxGw5lQI5LqYbbyFWAaKR+GtNIx+HUWmqTfnkS3tvBsrqLK8eaJfgmAC6cu
 InjkxejanfuWBqg47qhSCqJpiqdFyg75DscTnzGzqi/f/Zd7NKiYlEPSraS/7+h6fqkKFbvS4xyxA
 FEMdJ6ht3y/ChKh4G1NBdEusbBwSVnu//e4zcsaVGQBdB9kxF5D8HN+LlUtJHeEw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mERZa-00A8ib-5n; Fri, 13 Aug 2021 09:25:46 +0200
Message-ID: <1273cc1a399a7457c3d908648a7651c8fe9b93f3.camel@sipsolutions.net>
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 13 Aug 2021 09:25:45 +0200
In-Reply-To: <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
 <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_002548_896511_0A08FD6C 
X-CRM114-Status: GOOD (  14.82  )
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

On Fri, 2021-08-13 at 09:19 +0200, Johannes Berg wrote:
> 
> > > 2) Should we at least check it again from the protected beacon or such
> > > after association, so we don't blindly trust the probe response or
> > > beacon (received during scan, not validated) at least when BIGTK is in
> > > use?
> > 
> > May we add support for BIGTK in future with another patch?
> 
> We already have BIGTK support in mac80211, so if we don't do that now
> we're almost certainly not going to do it, so I'd really prefer if you
> did it here, or if a separate patch still did it now.

Actually, I should say though - the question was more whether we even
need/want that, rather than whether we can do it later or not.

If we should protect this data/information then IMHO we should do it
now, but it's not clear to me that we should, given that we also don't
have encrypted association response and we still take information from
there too, etc.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
