Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D582C432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 06:46:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4034E60E76
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 06:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4034E60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7I7OdcrnWvUIaYBdOiwNM29BVIWJZTNdWFRJd++8wk=; b=BzO/CslhbL+H6d
	LbbXuNFJ6lwTS4oCKEAhL8aTQiTuvM8v+BRtmm96gA1MVXyUajWAC0g5FWePSEVo3JZE3FyL6TYe5
	fnq1ppC5yzcciPXgq7eFSfka3pg7E/LbO4U9X3GWEY+/+NDyK5LST3nldS5fmCsEsavdqWorbFSo0
	yao//VQkCwKqJU3Tc2AJVtP9joevYG3JQW/b9Z4okfcQqmd/Wxi8nxfhjvMDHrH9WfU1xZmMxho2x
	VTgVJg6w7rPYWdhIvCwvVIgaNsTI7omDRK4S8Rp7iftRTuerDjURAIvy58Ugn+L7Z3nnD6eEP/NEI
	Azg64DD+4YMhqKj7NP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJVd7-00BhpZ-Ez; Fri, 27 Aug 2021 06:46:21 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJVd2-00Bhof-AP
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 06:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=ZRTYD6eP/gs8e0gFb1UkAZUbs3ZjYkft6D2Zi+/Ha+8=; 
 t=1630046775; x=1631256375; b=sYy7WGKvh6TVCGcclDFeJjTmtHpIFZiuhAr3KlG29sC/nTw
 dlS+np/zNgpQxHsMezWRVqgpa/F1VHmrL95XTRoCxtXx+suT38QDC/p2FZbGtIjfT1n1RIhd+gI5p
 sB5iT/d2lSYMuNFLQDo6uHDnIcvX4lDjFL+7snwImwk7fzVrfRiZ2D8iBffEv72aobH0Kezmvhkkf
 g/nA/c2nCAdyockVLaDGf3DMHByPBAjvpW4U3zljIWmi5yulJhMrb2dEYMYoQogYJojHJdDWVnEs6
 oPJJHkN62QvnDCBQh8gA7jhi2BZSj560WI1Hx50NGX+VObREWaYRslPy1djFar5Q==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJVcy-00GVUD-Ay; Fri, 27 Aug 2021 08:46:12 +0200
Message-ID: <48ad47869e703cbef437378c508d6a5b64c160ae.camel@sipsolutions.net>
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element
 and power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 27 Aug 2021 08:46:11 +0200
In-Reply-To: <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
 <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_234616_479748_BF65CDE2 
X-CRM114-Status: GOOD (  11.91  )
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

On Fri, 2021-08-27 at 10:11 +0800, Wen Gong wrote:
> > Also, if we're doing this anyway, then we can change
> > the code above (perhaps as a separate patch) to not do
> > cfg80211_find_ext_ie() but rather take it out of the parsed.
> do you mean NOT use cfg80211_find_ext_ie()/cfg80211_find_ie() and still 
> use "struct ieee802_11_elems elems" here and
> move this code to a separate function/patch?

Well, there's an existing place in this function that uses
cfg80211_find_ext_ie(), and various uses of ieee80211_bss_get_ie(), so
it feels like if we're going to do the full parsing, we should switch
all the existing "look up an element" to also use the parsed data
instead.

Not the other way around :)

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
