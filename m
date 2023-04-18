Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2CDC77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j07IyWoou0U0xafCs0rePTWkwGqSZ+w62GzLeybnnnQ=; b=qt+J30BsFqN4RH
	FB0bFGe6sA+RWsbR6veXTr5FK/VuOg7kKo0bZ5ja/yH4KEyrSzeavJlyX14Op7LdigWDOuub6LWmd
	I/Dwp7utSN1DuUMJ3TTmG0NiIljTcMLiZP92YjNRm74aLedcULLq0OXOXlZDUq/UfIWGg9H2rLhcN
	FcP4UgWfavG/mshxKgeWIepUxroTJoatWY2Wbajid+/rZKLE6fSDClDinKU7Xi2ygTn8DVc02ke3u
	F+2Tc3IipuakMHXY4O5RkDMOZOryTnv9S2FzeuNOnGtiUDAdHuNzPFsF4mtIsUUrNPBUQB1ENTC5Y
	2Niuj4rgcN8laXLm2SOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohNI-001Q19-37;
	Tue, 18 Apr 2023 09:11:44 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohNG-001Q0X-31
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=7ILc4+BfvwuBllNWVNLEj4EEAqqiOcTH9Dm5qpsUoH8=;
	t=1681809102; x=1683018702; b=saj+ZoH2J35V6HlWcUXuCtdCdNNfvOOa2FIRI8OuxjxpWu6
	nU1iNNiBF/d6widPJ4/rbO1RskX6ItHK1a7P7rNPv3fKgGD66Yh36FbVGkmEqEHZkfKKu/du0KL60
	SW5/6bn/+QFk/v9+5svOUN+POk9WAFxgkkT/vbHsrdnCL/vuAd9Pe5TmP9VhSuoo9IMciZ2XNpii+
	19oVzxtFP/grn8MhPn7H7/ImSB7g9b6iwLHpHW2GQQen9DauCCWnRsuz4+dhJeLuFJ5kPQMUHfK7Y
	WouCcZpfYvSdhm5VNcBchpzxDjzoWFnn8SDi/ibkaSHwAuwLuHssWfcBJqv9dpIw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pohNB-001YTt-2f;
	Tue, 18 Apr 2023 11:11:37 +0200
Message-ID: <34ed0938b69ead648da1aa250a2e081054fb49d4.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 11:11:36 +0200
In-Reply-To: <870ce439-85b1-f02c-70e5-2d424fd73372@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <2de44394-cb93-7be4-481f-2d92788b8d28@quicinc.com>
	 <351f74e0e1cd6e9724f97dbd042bdc5e04c44842.camel@sipsolutions.net>
	 <c05780bc-864c-9323-499d-a8b1ba1c2ef2@quicinc.com>
	 <545227cf18baac94ea8aa24dc08b250c47949541.camel@sipsolutions.net>
	 <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
	 <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
	 <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
	 <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
	 <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
	 <b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com>
	 <91577d586475d290e08dee9e535cb6b4896e06d4.camel@sipsolutions.net>
	 <edfc26b5-f6d1-2ab7-f3cc-60a74c8c334d@quicinc.com>
	 <61268d31f8a6dd4eea10fcb6048d39244bc584e2.camel@sipsolutions.net>
	 <870ce439-85b1-f02c-70e5-2d424fd73372@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_021142_999811_484906DB 
X-CRM114-Status: GOOD (  17.05  )
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

On Tue, 2023-04-18 at 16:59 +0800, Wen Gong wrote:
> On 4/18/2023 4:15 PM, Johannes Berg wrote:
> > On Mon, 2023-04-17 at 22:07 +0800, Wen Gong wrote:
> > > OK. So I will try to put this in mac80211 layer, is it OK?
> > > 
> > I guess? I'm still not really sure why you even want it, but hey, that's
> > up to you in a way. I really didn't like the suggestion with
> > wiphy_iftype_ext_capab (or any other capability for that matter), it
> > feels like it should be more dynamic, like maybe a new "add link"
> > callback or something? At least then you can't blame mac80211 for when
> > it breaks when you have two 5 GHz links ...
> 
> ok, so I would like to add callback such as
> 
> "add_link(struct ieee80211_hw *hw, struct ieee80211_vif vif, struct 
> ieee80211_bss_conf *link_conf, unsigned int link_id)"
> 
> in struct ieee80211_ops, and mac80211 call it in 
> ieee80211_mgd_setup_link()/ieee80211_vif_update_links,
> 
> then lower-drvier could dynamic set the local addr of assoc 
> link_conf(also for 2nd link_conf), is it OK?
> 

Seems OK, but I'm not sure that _works_?

After all, we first set the addresses in assoc_data, when we don't have
a link_conf yet, no? Just what we were discussing in the other thread
about the leak.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
