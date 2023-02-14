Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7782C61DA4
	for <ath11k@archiver.kernel.org>; Tue, 14 Feb 2023 08:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZusFC97xnVTJ/t4zmkIk5DBenSCWOJuP/kOCg0sLpw=; b=p0IqQRP6jhQDoO
	GSjm7hQplJVofEhDmDI4BDtDH5AALiEfg59hliw9FGSLNMbGRHlIu98w0A32KFy+Rz1E+sk6V/NEk
	zRK+9azpTdtApo0yEzRouWxRWWD7V12z2ZkL8Fyhkcy17DD+M/DFDYddKVmfsoK8QGavnepZHCTUS
	iDHolE3i/9PYFEo2HJiY9UI1kFjOhHLA/qk7oMr8DYCq8BATVb0Y3Mc9VPTBmMNZgrozgDBcDk5hx
	UcboJykW1eeHT0RzO+NZbFsUhmRYHdGqyrSQik+r+Cma62qQ8sh0nAThHhgoj7nXMDCmmd/tF39St
	WAJN1jXYx9/J7ZB8fnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqJ5-000RRr-UD; Tue, 14 Feb 2023 08:04:55 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqJ3-000RP9-6l
	for ath11k@lists.infradead.org; Tue, 14 Feb 2023 08:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=dptKNOPuEM0QsfAefO24+2bYzrvpzkZ2hHNZnxzUd/8=;
	t=1676361890; x=1677571490; b=hR6GJ/QL+f5ne7Kfq8S0QP8La9XvI2SZd7Isv+EzGAuWAto
	1/Z/oTgoCjRFIuirbFOkRKP6wf3RYEFr2dmGOjbQk5cTRnURXn5Q8HBp0OXfHYStwddY1v9ZU55pF
	LB08SSQH40twnY8yxAeFm0X8jKfvqOnjMr2TMtHg1V8FcYj82Pp+33IreNEOPruA/0kmtp9B6+16a
	jdxPfs3jIuPY3fMjc81FkntqIzWklXnI94i+ptsByszXQHszXKiu9BnhBEWiktD3TYwDZU9EDDLTU
	qFKlOwGQNawq8dPDB8v/QKs28xVNPWwbWOAmT+atH51WDd48oFq6CMlliDXC3DyQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pRqIt-00C27A-0p;
	Tue, 14 Feb 2023 09:04:44 +0100
Message-ID: <0e889e3be774aced1813152b18d505c0616fc110.camel@sipsolutions.net>
Subject: Re: [PATCH 04/15] mac80211: make channel context code MLO-aware
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org
Date: Tue, 14 Feb 2023 09:04:41 +0100
In-Reply-To: <34121f87-4aa6-7f20-fb1e-4d5b02d06f28@quicinc.com>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
	 <20220601093922.fb3f0f434c72.Icea7e695b0626177e27ab73bc8799202d623cebf@changeid>
	 <34121f87-4aa6-7f20-fb1e-4d5b02d06f28@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_000453_278061_25EDFD99 
X-CRM114-Status: UNSURE (   6.54  )
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

On Tue, 2023-02-14 at 15:57 +0800, Wen Gong wrote:
> 
> >   void rate_control_rate_update(struct ieee80211_local *local,
> > -				    struct ieee80211_supported_band *sband,
> > -				    struct sta_info *sta, u32 changed)
> > +			      struct ieee80211_supported_band *sband,
> > +			      struct sta_info *sta, unsigned int link_id,
> > +			      u32 changed)
> >   {
> >   	struct rate_control_ref *ref = local->rate_ctrl;
> >   	struct ieee80211_sta *ista = &sta->sta;
> >   	void *priv_sta = sta->rate_ctrl_priv;
> >   	struct ieee80211_chanctx_conf *chanctx_conf;
> >   
> > +	WARN_ON(link_id != 0);
> > +
> >   	if (ref && ref->ops->rate_update) {
> >   		rcu_read_lock();
> >   
> 
> Why link_id must = 0 here?
> 

The whole software rate scaling hasn't been adjusted for MLO yet.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
