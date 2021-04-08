Return-Path: <SRS0=LKqF=JF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E2DC433B4
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 11:13:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3188610E5
	for <ath11k@archiver.kernel.org>; Thu,  8 Apr 2021 11:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3188610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/mkUbl2u1ZiEd9g3OYLwb2vzITYs2IVMc6rS3/Wmlkk=; b=KE9/rbwFQzU34tfVrXk9NZjW6
	P4NgzxTl6qWPnHSh7R1HCbWMFbn2q50WHt+ZvfBYJKmpTYJdcnVQwXuORMJP8gsU2+hSZ42twN1ba
	DWgjGrjLfFJqdGG2mxaKGv7YDvBuBER44n8QViPJNxyfykXCdGgc3GNb27/9J8eTYW9NAAFYz61Ym
	VQV6TEX8JhzW5HAUGQp3tjiwwY/yn7YwBt+IEz0Xw3qF/QjPk2JnZypbM2UU8dxl0DuRNe74Hgtqr
	lLO3euSwA+U2ZTaRpiBOJ9V9rf3cGLl8bOkHVtHk3nv8aoiz57sEHCX4UqdKtCkhL7XPut4WFPhVE
	SbuKjCOKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUSak-007m4c-E4; Thu, 08 Apr 2021 11:12:54 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUSZW-007lla-3x
 for ath11k@lists.infradead.org; Thu, 08 Apr 2021 11:11:42 +0000
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94) (envelope-from <johannes@sipsolutions.net>)
 id 1lUSZU-008yRl-3z; Thu, 08 Apr 2021 13:11:36 +0200
Message-ID: <cb0a3bac83f4e56c7b1c0b049080d4f4186bed72.camel@sipsolutions.net>
Subject: Re: [PATCH 1/3] nl80211: Add support for beacon tx mode
From: Johannes Berg <johannes@sipsolutions.net>
To: Sven Eckelmann <sven@narfation.org>, ath11k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, Maharaja Kennadyrajan
 <mkenna@codeaurora.org>
Date: Thu, 08 Apr 2021 13:11:34 +0200
In-Reply-To: <2718995.X0rUDs3ZmB@ripper> (sfid-20210222_113458_463202_DAC50CAC)
References: <1613988573-10839-1-git-send-email-mkenna@codeaurora.org>
 <1613988573-10839-2-git-send-email-mkenna@codeaurora.org>
 <2718995.X0rUDs3ZmB@ripper> (sfid-20210222_113458_463202_DAC50CAC)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_121138_651924_24147CA1 
X-CRM114-Status: GOOD (  12.38  )
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

On Mon, 2021-02-22 at 11:32 +0100, Sven Eckelmann wrote:
> On Monday, 22 February 2021 11:09:31 CET Maharaja Kennadyrajan wrote:
> > User can configure the beacon tx mode while bring-up the AP
> > or MESH. Hence, added the support in the nl80211/cfg80211
> > layer to honour the beacon tx mode configuration and pass
> > this value to the driver.
> 
> There is not a definition what this actually means. But I am guessing that you 
> are mean the way the HW sends our the beacons for a multivif (beaconing) 
> setup. And in this case, it is a per "phy" setting and not a per AP/meshpoint 
> setting, right?

In addition, the commit logs are not explaining anything, why you'd use
it, why it's necessary, etc.

I'll say it again: @codeaurora folks, consider the community, not just
your own driver. I'm really getting tired of having to extract
information from you.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
