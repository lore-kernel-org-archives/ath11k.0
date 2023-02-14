Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFC2C05027
	for <ath11k@archiver.kernel.org>; Tue, 14 Feb 2023 08:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXfDhTsqVEJP4W1rm0cAdCDDNsRvwrSx5JRFu6Ce2K8=; b=Sm+kcvySPeY65Y
	P+0Y400zrIJF9MFQoWqbt07rAbhUbCPheFUXen/3D5Zb3i0Rwy8ThDc8rF0UEGuWxr34iMicOyXDs
	UFmdjIRJFfsNAn2DYyCNYcZPhK0EapTE2dpPp99eqxGoA/6G/Hh9vF8V1nqdJF0YEpU09qmcv+Pi3
	CeuCKrhrHMrnE+8gbjPU3tMbAWMBeKH970ui82Zo1/UyoWNXuX2LEa4B61AYgx3NfdMYYZDjnACIG
	EX3cevTktL7QsccDpN7K8LW8C4F5NnynF4/v3SjoiVadJPeohtXJ+NHheQ3aawJ2X6Jnq6sZHgs9D
	r9kCQx2meH6fo6iFRvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqRn-000UlM-1D; Tue, 14 Feb 2023 08:13:55 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRqRk-000Uj9-Iy
	for ath11k@lists.infradead.org; Tue, 14 Feb 2023 08:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=tdl8Afzo/5nj1GUDEcur43kVytqMgV+uo3iYN5r7wWQ=;
	t=1676362432; x=1677572032; b=hJX3ONhdIU5D4D9EOH43rBngcSoZYwsPq2ACK6sTrd9L4hL
	II3K60dZ/b1zo5614zE3OK3bbzxvTpudZ4fpMGbDskLRF32vtVVJQ/phg2lEckSzSMvHDB/LDeupo
	LfP6aQD+fv3mHrY1AwRgN2PMTc/RIbQv4ZdGh9EMb471dVMXoqn17fPgRhDTM5BdE3BPsX89oD/k9
	b5ycEht+6yducM/cec01juuSgWWWoDxUmX5EF7iznyGi6odD34/h3djpXOUBgdU88HS4T85pvJUKR
	8NmOKDQZjDYid49ISTiTOWO+RYRPE1gZL49nrZ4x2V9z/V/NTJ5TWOt2gKRijs5A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pRqRf-00C2MK-1X;
	Tue, 14 Feb 2023 09:13:47 +0100
Message-ID: <734b2b563c7cb52604aa1c2e5080bfe438f9015c.camel@sipsolutions.net>
Subject: Re: [PATCH 04/15] mac80211: make channel context code MLO-aware
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org
Date: Tue, 14 Feb 2023 09:13:46 +0100
In-Reply-To: <0c15bfd6-819e-3e76-391b-f2ab70eb7eba@quicinc.com>
References: <20220601073958.8345-1-johannes@sipsolutions.net>
	 <20220601093922.fb3f0f434c72.Icea7e695b0626177e27ab73bc8799202d623cebf@changeid>
	 <34121f87-4aa6-7f20-fb1e-4d5b02d06f28@quicinc.com>
	 <0e889e3be774aced1813152b18d505c0616fc110.camel@sipsolutions.net>
	 <0c15bfd6-819e-3e76-391b-f2ab70eb7eba@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_001352_667674_EE56CBF8 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, 2023-02-14 at 16:09 +0800, Wen Gong wrote:
> On 2/14/2023 4:04 PM, Johannes Berg wrote:
> > On Tue, 2023-02-14 at 15:57 +0800, Wen Gong wrote:
> > > >    void rate_control_rate_update(struct ieee80211_local *local,
> > > > -				    struct ieee80211_supported_band *sband,
> > > > -				    struct sta_info *sta, u32 changed)
> > > > +			      struct ieee80211_supported_band *sband,
> > > > +			      struct sta_info *sta, unsigned int link_id,
> > > > +			      u32 changed)
> > > >    {
> > > >    	struct rate_control_ref *ref = local->rate_ctrl;
> > > >    	struct ieee80211_sta *ista = &sta->sta;
> > > >    	void *priv_sta = sta->rate_ctrl_priv;
> > > >    	struct ieee80211_chanctx_conf *chanctx_conf;
> > > >    
> > > > +	WARN_ON(link_id != 0);
> > > > +
> > > >    	if (ref && ref->ops->rate_update) {
> > > >    		rcu_read_lock();
> > > >    
> > > Why link_id must = 0 here?
> > > 
> > The whole software rate scaling hasn't been adjusted for MLO yet.
> 
> Got it. Thanks.
> 
> So I guess this WARN_ON will be change later.
> 

Since you're running into it, you should probably think about addressing
this ... I'm not going to, our hardware doesn't use this code.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
