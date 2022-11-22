Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22945C43219
	for <ath11k@archiver.kernel.org>; Tue, 22 Nov 2022 21:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFftWnFYkqCkl5kTpU6hNB+eu4/U/0CsSiBSjpMGblM=; b=ecd2Ed0HlkcPrV
	GuB7E7RZD3AziRDbbPcc3iTdOMt/2VeTrWxKzdDLNSXT40CSv4n5Kn0CZQH4P7RzpU+J2bto6VqBE
	lr5MvAcR1QmXNOskMmGr2BjY9sJFK1ItHEXRoubVIfNUNM3/jYQaLsLCdsTQFXGPrPfKAs/r8HC+6
	Pq5hwtoszgJwt+/2+LH0+Dk0QpenP+9Ke5WRgxePsftPOQJ5Ajdw3TEBtBUEPK9c71VGy7OgSed0O
	wVhkdkRaLYZuOzDVc+XYKwuKMe85lUVJPJgE8OQbeKkUphNkYcT1i6ZariU88GDusJcFUh5+pgTEL
	tfBi2oOaq5j8mbZygzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxanL-00Bz4H-4F; Tue, 22 Nov 2022 21:27:07 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxanH-00Bz2M-RY
	for ath11k@lists.infradead.org; Tue, 22 Nov 2022 21:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JJNvVTKTT/JhZLdK/PTxKn69J5i7SnKTEfCOxoKDQrU=;
	t=1669152421; x=1670362021; b=B0EoD1RfcoG+4mccEq60R5VKeKK/t+mzDr8cRzCx52Iolkr
	XSelyRbQo4wb7l7oSnP4/IJ8CWcufsoeqKTjNHncETg62wRvSHnycGGONGO0yoH0r1yQ/jqWc/3xy
	N5EEgVFEM6E5TPWYBTiiXKfpos01lJ5K0pp5baS2HoC3VQmnMSmKBhX7lOvdP6QtcycK9ww6qDfox
	kaZl5vtf59yryO3jtKLSJeQSW6oM/aIUhvxRKn6QOpMM1Qud2YLhg2pNmOU3KZezM3QVyYICIahxf
	57ZnKhDJ8y2yC/HQeA0CloyBDNEDOmlX6PDuta4+xiI9rzvKBJ7P1g0eyqmc4Ueg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oxamo-006Trn-0O;
	Tue, 22 Nov 2022 22:26:34 +0100
Message-ID: <b5765f802e836641f41ff45f778d6901f4054050.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: Add 802.11h CSA support
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, Sujith
 <Sujith.Manoharan@atheros.com>,  linville@tuxdriver.com
Cc: linux-wireless@vger.kernel.org, Jouni.Malinen@Atheros.com, 
	ath11k@lists.infradead.org
Date: Tue, 22 Nov 2022 22:26:33 +0100
In-Reply-To: <04ad44c0-4012-50a4-f24a-64723a1c0a4f@quicinc.com>
References: <18786.55021.734826.472061@gargle.gargle.HOWL>
	 <04ad44c0-4012-50a4-f24a-64723a1c0a4f@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_132703_912583_297D698E 
X-CRM114-Status: GOOD (  16.90  )
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

On Wed, 2022-11-02 at 11:26 +0800, Wen Gong wrote:
> On 1/6/2009 11:58 AM, Sujith wrote:
> > Move to the advertised channel on reception of
> > a CSA element. This is needed for 802.11h compliance.
> > 
> > Signed-off-by: Sujith <Sujith.Manoharan@atheros.com>
> > ---
> > v2
> > --
> > * Add a new variable to hold the CSA channel
> > * Use msecs_to_jiffies for calculating expiration time
> > * Add a check to drop beacons in case of a frequency mismatch
> > 
> > v3
> > --
> > * Add a BSSID check when handling CSA action frame
> > 
> >   net/mac80211/ieee80211_i.h |   11 ++++++-
> >   net/mac80211/iface.c       |    2 +
> >   net/mac80211/mlme.c        |   13 +++++++
> >   net/mac80211/rx.c          |   20 +++++++++++
> >   net/mac80211/spectmgmt.c   |   77 ++++++++++++++++++++++++++++++++++++++++++++
> >   5 files changed, 122 insertions(+), 1 deletions(-)
> > 
> > ...
> > +void ieee80211_process_chanswitch(struct ieee80211_sub_if_data *sdata,
> > +				  struct ieee80211_channel_sw_ie *sw_elem,
> > +				  struct ieee80211_bss *bss)
> > +{
> > +	struct ieee80211_channel *new_ch;
> > +	struct ieee80211_if_sta *ifsta = &sdata->u.sta;
> > +	int new_freq = ieee80211_channel_to_frequency(sw_elem->new_ch_num);
> > +
> > +	/* FIXME: Handle ADHOC later */
> > +	if (sdata->vif.type != NL80211_IFTYPE_STATION)
> > +		return;
> > +
> > +	if (ifsta->state != IEEE80211_STA_MLME_ASSOCIATED)
> > +		return;
> > +
> > +	if (sdata->local->sw_scanning || sdata->local->hw_scanning)
> > +		return;
> > +
> May I know why channel switch should not go ahead while it is doing scan?

I don't remember, sorry.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
