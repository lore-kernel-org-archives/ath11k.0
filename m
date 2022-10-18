Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B361CC43219
	for <ath11k@archiver.kernel.org>; Tue, 18 Oct 2022 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ok20KBWO5i591Y8Jtw7L543qbWtWGcHYDKCbRPIRdPI=; b=CVwQG5FDlg+ij7
	CTA+Mfo7i3uzK8KHnC+qiKvWrB5H00jTIofrZi2Yb9hvZOf9OgRpdOHDteDW30GPQt8g6YTV6VfNQ
	nrJT295RH5XZ0Wo5TzEFIbR3LVde8cEnpff983xXRugj8fbBl+EpSblO8e2xouJhlhBNpu17tqSoy
	enuR/t5A+vK8aU1jcxKdqY7cUUYnsHGPxRwg9+mQZ8p8JfT44HiNocjhxnAD32A3oUMtwITwIDlFP
	lQWB5s5BuiVf7/45y3LS0KNslxYzyeOL79NPto7hupf+5wcWgovGk+cuzFpad4c7LeEQX73d/eyLp
	S1qylgv/TqaPsIeLiYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiM3-004WAf-De; Tue, 18 Oct 2022 08:53:43 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiM0-004W7q-5s; Tue, 18 Oct 2022 08:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mZMYrdJe0ak55MfkV9WDpQoDddT502UmBNyt8pPDbA4=;
	t=1666083220; x=1667292820; b=T9BN1n8l5axrw607nKeJHB0iMMugoDpTSYkgIzAwWI1DOu8
	/6fYIldUXFp6HTdfVDdQAoNot2zXK54Nswjgysg61/Bb/Yun+u/3GAYiSiWYR9QEcSssMToKKq690
	izGPqqfx+ItF17I+lpJnPBgteI7Wm3iakza9HuvVdlvCQExh8NcTEAr8zOvgIMEOiBYWBMMxRHJy3
	aWcQb3EdNFFrEsLBd6Lxoae0+NutoRSz1Jeo7zXj76YGpW7g9XecQdRLA+oullAfnupFdXq+CEvNK
	mk6cxeZchoQg6qQCx6GAgZbLMP9ll3FAJxZ2ANP7qmJcIsepI8a6WLy6wgyPq9aQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1okiLv-00A6G2-2b;
	Tue, 18 Oct 2022 10:53:36 +0200
Message-ID: <d0994456d3a9ea00b5cc472df7822d53d189399e.camel@sipsolutions.net>
Subject: Re: [PATCH 01/15] mac80211: split bss_info_changed method
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org
Date: Tue, 18 Oct 2022 10:53:34 +0200
In-Reply-To: <bd6545a8-57a3-5849-52d5-c1a449ab1712@quicinc.com>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
	 <20220601093922.347d47c279fe.I15937cfe8405999084f164ddf57390f8b8d2bc61@changeid>
	 <c38b4da8-488b-2d09-631a-1bb6c07440a6@quicinc.com>
	 <3483d05c1d5a39b9243b54d9f28450344a897655.camel@sipsolutions.net>
	 <bd6545a8-57a3-5849-52d5-c1a449ab1712@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_015340_235120_DD51A10C 
X-CRM114-Status: GOOD (  20.04  )
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

On Tue, 2022-10-18 at 16:52 +0800, Wen Gong wrote:
> On 10/18/2022 4:50 PM, Johannes Berg wrote:
> > On Tue, 2022-10-18 at 16:47 +0800, Wen Gong wrote:
> > > > +	if (changed & ~BSS_CHANGED_VIF_CFG_FLAGS) {
> > > > +		/* FIXME: should be for each link */
> > > > +		trace_drv_link_info_changed(local, sdata, 0, changed);
> > > > +		if (local->ops->link_info_changed)
> > > > +			local->ops->link_info_changed(&local->hw, &sdata->vif,
> > > > +						      0, changed);
> > > I think you/someone will change here later for the "/* FIXME: should be
> > > for each link */", right?
> > Maybe. I'm not actually sure it's really needed, it depends how we use
> > this in the future.
> > 
> > > It lead error/kernel crash as below while reconfig single MLO link which
> > > link id is 2.
> > > When test with single MLO link which link id is 0, not found
> > > error/kernel crash.
> > I'm not surprised, I just worked on fixing reconfig in the last few
> > days, will post it after some more review/testing.
> Thanks.
> > So I think that might not need changes *here*, but rather a proper FW
> > restart. Which I haven't tested in AP mode though -- was the crash in AP
> > mode?
> It is crash in station mode.

try this?

https://p.sipsolutions.net/0652bbbbe350b126.txt

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
