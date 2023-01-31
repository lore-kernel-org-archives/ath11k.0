Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B13C38142
	for <ath11k@archiver.kernel.org>; Tue, 31 Jan 2023 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aNkqXjtB5WUeDOD4kPZAfcN8r/tGCQaDGYvZeIihEQ=; b=2ZflK185fHFq2k
	LWDpdzUuFpTnmydB9ldZ9/iAt75IrvxP0amHg1OWDgkhUEum3A9sr9utKLISIxFlxSDwhyGVA5VO9
	FMilwr9xqKLZisidSXiz+AW3COeF/6oBUKYYpb7G6uGsz9XEiJjGJp3TmzH+T1OpLulJMp8T53nB8
	DTGON3N6fN2rh735Ssj0SgPNhaDOV54pZLkclFbh5wnxI6jaQPm73BmJx2kgybKODvsW+3UJdTJj4
	t1ThpjAkJzrs7q+G5otH7xoISBw8K8iP8zyKFtoirpQDJhpq/uLQD4TMNmPJvudZBao5w9/K8meLc
	Bj/WpyGc87MIOIjrH2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmgh-006vbv-Lb; Tue, 31 Jan 2023 09:12:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmge-006vbA-PM
	for ath11k@lists.infradead.org; Tue, 31 Jan 2023 09:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=wHpyEmUDwtWILP/PZi9ibazx/yx6gRrjsYE8DG/i8M4=;
	t=1675156340; x=1676365940; b=bc9kK8eI392bsfgx6bNgMqBipMipCw+aH8tOhsKvLYBiRZ6
	nlr5l/hAdgDyUPOlo8GPz23Ixt6kwiKeeDeqhbB+uKmRjyUVgv+VRRahQGKsLo5CWMSK1NaHj7PoF
	fVxPl2uwoiOcPvGk+SMtkw3HukxqwSXv62nKgB3Mz/5myPHtdP0tX5AWfhBwVITtZe9XXRsmpbbQ3
	KnGjPEoBSWqV/0OvTWM8DuBcYMRFpRK75HHep4jpO6JCcI+nwLYyTiYXzIAKEjTBCdmjDY5MF6MGQ
	6CG6A6K41gGa017Otn6LpB2+9lZp9SXnQN7/UyhET5r5GOMi3vrKnwifU7K7XZVw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pMmgc-00Gulb-2T;
	Tue, 31 Jan 2023 10:12:18 +0100
Message-ID: <958c5e666aaab3b18065c1e1c140c9ea34f2229c.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: cfg80211: call reg_notifier for self managed
 wiphy from driver hint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Tue, 31 Jan 2023 10:12:17 +0100
In-Reply-To: <31632d31-8c98-081f-bcf4-0966efe1256a@quicinc.com>
References: <20221214093937.14987-1-quic_wgong@quicinc.com>
	 <0881ee1d0ae43ae18ab4b71ec8b5fd62263bbb69.camel@sipsolutions.net>
	 <31632d31-8c98-081f-bcf4-0966efe1256a@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_011220_869306_00EE906E 
X-CRM114-Status: GOOD (  17.96  )
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

On Tue, 2023-01-31 at 14:07 +0800, Wen Gong wrote:
> On 1/19/2023 9:52 PM, Johannes Berg wrote:
> > On Wed, 2022-12-14 at 04:39 -0500, Wen Gong wrote:
> > > Currently the regulatory driver does not call the regulatory callback
> > > reg_notifier for self managed wiphys. Sometimes driver needs cfg80211
> > > to calculate the info of ieee80211_channel such as flags and power,
> > > and driver needs to get the info of ieee80211_channel after hint of
> > > driver, but driver does not know when calculation of the info of
> > > ieee80211_channel become finished, so add notify to driver after
> > > reg_process_self_managed_hint() from cfg80211 is a good way, then
> > > driver could get the correct info in callback of reg_notifier.
> > Seems reasonable - but maybe unexpected to some drivers, perhaps it
> > should be opt-in?
> > 
> > Though I guess not many drivers actually use this infrastructure in the
> > first place?
> 
> Yes, I will add a new flag such as WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER 
> for this driver.
> 
> is it ok?

Sounds OK.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
