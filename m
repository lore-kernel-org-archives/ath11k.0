Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7232AC4332F
	for <ath11k@archiver.kernel.org>; Mon, 17 Oct 2022 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwJgy+7mgl36oaq+gDAZtBQFR0HpSONS4gwn0sK0kME=; b=DiN9dXRoX2wiJ/
	ycLlmXuUcjuYflcBtJaISS8kLDn1JsciOfodtEjWzKpEaU08/w+IWFu72f89SCKwklHjYPKGTZWEL
	46LWIDaiJUsxgbG1G+SYUjm7lczPjzc+/yTSDSs1k9qS836+Xc2JBsvKfBekEzqErnAgxr2pMZSJJ
	/wOiZAhfh3N9E+T2X1kId2E2XVabTLlPPZG5y56hVRpnHQTGveOPjd54nz54k+ZrvPlIWXO1muOLt
	0xG41iQ1QcHXJd4JsgmBtuT/FbnTihPEVG9qR5N+RvIOnr8AxkHlXMukcNM+7tFGE4vGUz8E3JKPH
	OuGOaIlynZXDJeZ0txUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLH8-0090G8-U7; Mon, 17 Oct 2022 08:15:06 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLGV-008zus-1S
	for ath11k@lists.infradead.org; Mon, 17 Oct 2022 08:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=IxT765SpRu/AccEWgVHDP2HHCCrUqfmWUft6GnhhGmk=;
	t=1665994466; x=1667204066; b=S+yi04vH7YPtercWn9BeasVXR2PaWMrrV66g6GRs4t84uSU
	J6YQPz5hat/Ot2BLkpWQrsT/CuBgUFesHVPTM7K5WrfvFVCQpw2eeEBsqw/XFqjb5SE9nqadwRH2H
	lnJPwdMh2qd2EE2nsiaPiJcpz7X9HFzp0YZKPFdJGwvAx/DP/Ygscj01545jSn9Bw28ddzBqtAdvS
	cWo5Yt66zXEBCw9uCgyJUneQtDLmB2sGNGXxOGQzeU7dIOgAArBH5upto0XWrPwKJ+uj0YOWEdJbH
	cu63TImmWBXTASPrNOt0gI9K1IDBYFw2pTN74Az/eR3y49CXw4tAowRovzEV7b4w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1okLGQ-009CHG-1a;
	Mon, 17 Oct 2022 10:14:22 +0200
Message-ID: <dbb569976328b5442c6373a8aaacfec9a157ac56.camel@sipsolutions.net>
Subject: Re: wifi: mac80211: mlo rx nss value 0 of wifi
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: ath11k@lists.infradead.org
Date: Mon, 17 Oct 2022 10:14:21 +0200
In-Reply-To: <191042d8-7781-808f-71aa-db76ed763bec@quicinc.com>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
	 <1a440c62-ffd0-9602-9454-f08765beadf0@quicinc.com>
	 <91b975e2116521cfa9f9371a976039a53ed9a85c.camel@sipsolutions.net>
	 <2a2c466fbdcc2c3cc7af81bcd4d370d0119ea865.camel@sipsolutions.net>
	 <c52e6634-4a90-f165-9f41-8f23df9414a4@quicinc.com>
	 <ca0f6ea2d78538ffb6640f2e56d65c89c86f5221.camel@sipsolutions.net>
	 <191042d8-7781-808f-71aa-db76ed763bec@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_011427_096328_30072905 
X-CRM114-Status: UNSURE (   9.57  )
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

On Mon, 2022-10-17 at 16:12 +0800, Wen Gong wrote:
> > > 
> > I guess valid links wasn't set at that point yet?
> > 
> > Anyway should also move out of rate_control_rate_init() and probably
> > into something like ieee80211_assoc_config_link()? That already does
> > some rx_nss calculations which is probably not great ...
> 
> OK. I will test with my change internal now. And replace to use upstream 
> change
> 
> after someone fix it.
> 

Well, I think you should try to fix it and submit the patch, I'm not
going to do it in the short term ... :)

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
