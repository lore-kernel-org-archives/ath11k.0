Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67BAC61DA4
	for <ath11k@archiver.kernel.org>; Tue, 14 Feb 2023 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvbFx7EWnfRjiSKajdcfaw0QxzrNY1cVW8c3Eg0cYSs=; b=S87xKNGPFSLl7X
	2Ni0/lKCrFpCCxafT0b1T+P4RArTczaOGQiabN7RGIzMbCGwBBjotADbBWi8KvMkuqdZ8e6HkHlMp
	BtT8WWwJubCtrzjTLqUR2s7mwiSFTL7fhF8hdhvXr8Tr8dZKdwVsbBMZXoMVeM9x+MQ8Weiu2N2pk
	FAj6PYOY5aSnhmFfyswruiU/dJt1fvVlhLpOk/49d2BMdRbOXyc0TZVq7sa5fRR/KHqIHWTgoOozc
	uz3YJBTHe1CU20BByOVA/8NdauJhsTiCVzOd8gZGmO4haTtkXY7Ugs8g19EhHah/knot04zqjg9X+
	FByQ6jWf9Gt7SygNeMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwqE-002NWr-6E; Tue, 14 Feb 2023 15:03:34 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwUw-002FFz-5X
	for ath11k@lists.infradead.org; Tue, 14 Feb 2023 14:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bcZxwNGF+gM8pPpuJg6Cbw+YGM7dLzAMCe05mZZE3Gs=;
	t=1676385692; x=1677595292; b=XoQlgAkftEm/g5bO11N8TwP4VJxgL6Ki2OoJ2oSeb05DU9V
	8dog+bmwPYLGB3ItcDFs1c6RDCu8WeeP9asw2t1DDbqS7LxijGlttK0nwQJrakrdWtEaZ/mPfczEJ
	rUw4qM9dxz764rTMUKNNYKfc212Pu9XY1+oO7aGa3kOxJX7Uc8nuObJblJGkCle6P+ZV2epj1moPM
	3RjGwptJRCJntlmASeiEm0RWCE60+4GX0RZdQVil8osIIwiUSdrK2c8zxEM7Cx7o1nLWO/BgTKq1r
	ewgZc+NLP3XK8+4+zdUPlwLgWIVdC/ndqjlulMNmZvwqChO4ogJNY16DkWSroPLw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pRwUf-00CBEN-0p;
	Tue, 14 Feb 2023 15:41:17 +0100
Message-ID: <f5ffcc0b186cf9285e1dedebc8cf47c06d46bbd9.camel@sipsolutions.net>
Subject: Re: [PATCH v10 3/5] cfg80211/mac80211: move interface counting for
 combination check to mac80211
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, Luciano Coelho
 <luciano.coelho@intel.com>,  linux-wireless@vger.kernel.org
Cc: michal.kazior@tieto.com, sw@simonwunderlich.de, 
 andrei.otcheretianski@intel.com, eliad@wizery.com,
 ath11k@lists.infradead.org
Date: Tue, 14 Feb 2023 15:41:16 +0100
In-Reply-To: <6c2b5e49-2cdc-b506-e3c8-0a51fccc294d@quicinc.com>
References: <1394547394-3910-1-git-send-email-luciano.coelho@intel.com>
	 <1394547394-3910-4-git-send-email-luciano.coelho@intel.com>
	 <4de1f964-b623-2b31-c044-60cc188fc134@quicinc.com>
	 <6187b1566674ba2e0d7d5413af5475688d8421b3.camel@sipsolutions.net>
	 <6c2b5e49-2cdc-b506-e3c8-0a51fccc294d@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_064134_232782_A3E1CF30 
X-CRM114-Status: GOOD (  18.52  )
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

On Tue, 2023-01-10 at 15:23 +0800, Wen Gong wrote:
> On 1/9/2023 6:05 PM, Johannes Berg wrote:
> > On Mon, 2023-01-09 at 17:39 +0800, Wen Gong wrote:
> > > On 3/11/2014 10:16 PM, Luciano Coelho wrote:
> > > > ...
> > > > +int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
> > > > +				 const struct cfg80211_chan_def *chandef,
> > > > +				 enum ieee80211_chanctx_mode chanmode,
> > > > +				 u8 radar_detect)
> ...
> > > > +
> > > > +	if (total == 1 && !radar_detect)
> > > > +		return 0;
> > > > +
> > > should also check with cfg80211_check_combinations() when total == 1 and
> > > num_different_channels > 1 ?
> > > 
> > > When MLO is enabled, it could have 2 channels for one ieee80211_sub_if_data.
> > > 
> > Heh. You're commenting on a patch from 2014, well before MLO :-)
> > 
> > Not sure what happens in the code now?
> > 
> > johannes
> Yes, it is 2014. Each interface only has one channel at 2014.
> I did not hit issue for the code.
> 
> the story is like this:
> When station interface and p2p device interface both running.
> the station connect to MLO AP which has 2 links.
> The ieee80211_link_use_channel()/ieee80211_check_combinations() call 
> cfg80211_check_combinations()
> for the channel1 and channel2 because total==2.
> When only station interface is running, not called for channel1/channel2 
> because total==1.
> That is the little thing I hit.
> 

So ... I guess you found a bug? Not sure what I'm supposed to say here.
Send a fix?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
