Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE7CCA5531
	for <ath11k@archiver.kernel.org>; Wed, 13 Sep 2023 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m255omYzm8gd/y+k5R6TPSEIxZIudBneTwqOMtTGzHU=; b=v+lhlOoK24XoUt
	tbvxUqGP2D+u+37dPZCp/NTpPFB5zhK3jCJPI9Kx2P1pudZ2XnFgvQF1J0evSEvcYs3wJGtOq8HFx
	dXq5yZlEFLIVsIUFGLme+UTv+LEhVKg+ZsZlV9d3T0wniws8gjwp0gzBhCs01UnCpN0FvgaDue91E
	m1ENM9ahoSszNoqU8b1XrlIkGA+GNHnasLkw9u7HHXXufHDpRjqzEHpH7sAWvyBy4xwe3v2sCbk1r
	2eYrwH9p2LZTySrCDjJxpruC28p949A+x4XTmScStCefnzWNSQ0NOLiJM5DqOo837vv9BwZYpCQIh
	9cfxiKMVyCrNPD2i4Mdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMwK-005OOi-0r;
	Wed, 13 Sep 2023 10:17:44 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMwH-005ONy-2a
	for ath11k@lists.infradead.org;
	Wed, 13 Sep 2023 10:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=jN+sZKcnCw2xCWfqCVgbNlMkLsTh+etQVh8RXFinems=;
	t=1694600261; x=1695809861; b=jx4WJndDKattdtRhx0L/jorW7/tJoG23Dv25l62DdJex7qx
	gexGD8xpcMnq2BSy6tA7NCHkZa/UDsdHUw4DWoDPuMXQi4PXzurD/OzXO0YEuWIItbJY0+I6ptQtO
	PGxrSJCdOxj6o58M/SGhpngyl1K3z8AWA5s5sKHYIRZugYnysX4BURWQyd/zY37f/w22aBntP2GtZ
	rYTxSjhr2fcIJaaq/UTPZE3bW2R4pfSKcsX9EMcCtQCy8cF2f+yfAAOuyerPsuanmtsvUrFcT6D9e
	b6b90nz9divAY1M1W9VIhxOTMs5EFMuxs27GmxV/DGFbQrX8gqZK8nVxZ9Pz3WTg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qgMwF-00EmRJ-12;
	Wed, 13 Sep 2023 12:17:39 +0200
Message-ID: <365caa2a20678c1c1c08c947a2141b40320553c6.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/3] wifi: cfg80211: export DFS CAC time and usable
 state helper functions
From: Johannes Berg <johannes@sipsolutions.net>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 13 Sep 2023 12:17:38 +0200
In-Reply-To: <511f23be-7b7b-42d9-9c3e-25edfa5d7323@quicinc.com>
References: <20230912051857.2284-1-quic_adisi@quicinc.com>
	 <20230912051857.2284-2-quic_adisi@quicinc.com>
	 <f436ea028da7b016241f307348286be6cfe7df65.camel@sipsolutions.net>
	 <511f23be-7b7b-42d9-9c3e-25edfa5d7323@quicinc.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_031741_838356_A49ED2FA 
X-CRM114-Status: GOOD (  12.96  )
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

On Wed, 2023-09-13 at 15:46 +0530, Aditya Kumar Singh wrote:
> On 9/13/23 14:58, Johannes Berg wrote:
> > On Tue, 2023-09-12 at 10:48 +0530, Aditya Kumar Singh wrote:
> > > cfg80211 has cfg80211_chandef_dfs_usable() function to know whether
> > > at least one channel in the chandef is in usable state or not. Also,
> > > cfg80211_chandef_dfs_cac_time() function is there which tells the CAC
> > > time required for the given chandef.
> > > 
> > 
> > Should we really export the time function just for a debug messages?
> > That seems like a waste of space?
> > 
> Yes absolutely. But actually as a follow up of this patch, we have 
> Background DFS patch in pipeline which requires us to send the CAC time 
> to firmware. So its actually needed there. And may be once we do this, 
> other drivers also may start using this?

OK, fair enough :)

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
