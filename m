Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C6FC433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLecTD3nlJ6YccEdFeR/pjUIb9W78IZfAF4577spznc=; b=t+SP+YZx1+fX1i
	hl7J7c/BbPbKRvaDlwTPApUyMXrE2Jkv3UsY9BbuctwNgZQcGk3U/SBbjZlxA8bGYERED7X8+ntod
	pAQC34U9QR4rY9tVH30jMhNf2RJtfVMau58sb/bnlEO4dN8AgE4rwjB+vtMxpVqq3C9Bu7h0fkNwl
	nP/sTQjHkAiCn9hqGlOLeMR6dMDNrCt7BXgGHaW+mrihvW4Cdw4+Z+MwgWSF6rnEAE4gtYxFahuPA
	DwDybX18zJJVsXfVo27i+/d2qBvJ4RSFMORdaC5Dj9hgfWOdRIgdQfRfeR5tQDj1oo856szQXFBGC
	PnmL2mmezrjxQlGEN8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWDry-0075ZH-0R; Mon, 21 Mar 2022 08:58:30 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWDrv-0075Yq-3F
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 08:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=rcvqZqPrBbD/86qEasWL/HDztHchLovqQk7d/zkEWnY=; 
 t=1647853104; x=1649062704; b=oRUySZ5J1pAdD3BKimNn0SCOgzPVXGzYp2YCY9cBt8d8zDe
 E2glLFMMWLmUvQyl+Kwt07DQ3LKGX67UngI1BMmgWvK0dyWwS9S5okVz+GaIzNMepoyk21pUAmkel
 Dqwh/b1QP9EGe7BhUkJzjpFohuvgwOnflaCkFX2LDfcVLZv4gKPNNJdbKkSx5OGM5mb5FDbrz1Iq6
 mjqhhp+IH+9wr2JhB0IjYILBN6z+8xh/ONRT5PYiAORAwHhO17G66aaVzdfxFaQ4DpAEDwJ6/XVJk
 2NOo3jvwTgD2lojJBWNidfNwGI0vIFAuIPAC2tZ81RzacUIdpAjItp77iPMmNAGw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nWDrl-00G2r9-J6; Mon, 21 Mar 2022 09:58:17 +0100
Message-ID: <a537c6e02afbfa26eec2a54dbd8bc649f77ae3a3.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] mac80211: add support to configure 6GHz non-ht
 duplicate transmission
From: Johannes Berg <johannes@sipsolutions.net>
To: "Rameshkumar Sundaram (QUIC)" <quic_ramess@quicinc.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Date: Mon, 21 Mar 2022 09:58:16 +0100
In-Reply-To: <DM6PR02MB4937C53041172E9A52846A0BE9169@DM6PR02MB4937.namprd02.prod.outlook.com>
References: <1644914581-21682-1-git-send-email-quic_ramess@quicinc.com>
 <1644914581-21682-2-git-send-email-quic_ramess@quicinc.com>
 <a517835c51a5eaf00e87fdaaef47546f70ff0d42.camel@sipsolutions.net>
 <DM6PR02MB4937C53041172E9A52846A0BE9169@DM6PR02MB4937.namprd02.prod.outlook.com>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_015827_168766_D8025295 
X-CRM114-Status: GOOD (  10.58  )
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

On Mon, 2022-03-21 at 05:12 +0000, Rameshkumar Sundaram (QUIC) wrote:
> 
> > 
> > I am wondering though if this should even be detected from the HE
> > operation element itself, rather than from the beacon rate settings
> > that are
> > separate in nl80211?
> This is a BW dependent bit in HE Oper IE and user space can switch BW
> (CSA/chan switch scenarios).
> Which can call assign_beacon directly, Hence adding the logic here to
> cover all Beacon change cases.
> 

Yeah but still ... why do we take it from the content rather than adding
a control for it?

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
