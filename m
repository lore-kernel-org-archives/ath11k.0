Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17B2C98302
	for <ath11k@archiver.kernel.org>; Tue, 22 Sep 2026 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDJ3kpUsd0EZIs2+o3fDTdQpM9JrBURLXPpPlz86z4A=; b=FEAANPvRE9l0mLdByVYw3dnJT9
	Ui6gcWEm0jZRtmFAHEZtBqwViKe+qTCBkHBjmObN2dedEvj202bGDsdYddyYfkHUVMyOl71PIwURf
	hzVjtlYOMIw24iZiVENjWwpXNCT8NU5ElWTdEJEILS4DX2I3dGes2ymUKaIkwa1mxPR4hLw6nDx15
	57TedY9CveW2qP0qTsAIDWxrRyHKOmDqPfz/da0d0oWUmE7TwK0kR8RfjKZf7I3SeN+PXg7lATrpH
	C6vSYVJYE0Qw0lLgX4oJUG0eZNDyhwAecnG1Wptmh4yC1vFtqyf8JKWFVjsllfV1VBxPSohG1P5Yx
	iNeGP28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Er-00000006Bmw-2L1t;
	Tue, 22 Sep 2026 17:25:05 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94Ep-00000006BjX-0C9y
	for ath11k@lists.infradead.org;
	Tue, 22 Sep 2026 17:25:04 +0000
Received: from fauth-c1-smtp.messagingengine.com (fauth-c1-smtp.messagingengine.com [204.75.18.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hq6RL3rmpzyQq;
	Tue, 22 Sep 2026 20:24:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1790097887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDJ3kpUsd0EZIs2+o3fDTdQpM9JrBURLXPpPlz86z4A=;
	b=HHHAi5pTIyfNLPhHWJffqmLZ0tYOg/8rNLgWU9Pak2sgCSXEV5H8chEtoMa7IUZG25vzQZ
	iexYcoQ5qMrEXOuXDcdWzEo1UN+iGHeZUd12KhfqJ2ZYBh9s0yWj0RMlZhkvnmSW2V618U
	B7xWUaJIRYQ2ZTix4eS5vdl7r/0JhzI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1790097887;
	b=npOCs6kg6dbMUd5ONKwNo34npWd+kgAp1JDU0xo7LqMtlWxBJPO8mfrbcg9DogoGJqUK8V
	0P5et+HdKL8YAnagSSVNWkvdAotcE/FceXukAOY7P5sQt1rF2KvPMtI4VhZ3n31ODvhVRi
	m3dact53s4GGBsJMcVj3jgFy1825y5s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1790097887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDJ3kpUsd0EZIs2+o3fDTdQpM9JrBURLXPpPlz86z4A=;
	b=Ib79IEXVQMinzM81lAzeJY4pnozl1wdKlWWFFhhatOltbtUpnI4o0mNiSreTN81HRdYdq8
	TFSDP3fMl+x6JKv+R3/JLKnq7aOT+FRoF+evsGrGUvTcxEyJYt+F8NH800aTgMaKLjZhoG
	u+fpJTYWBd09Ayct7Ult/MXi2/r4Bpk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 79ED4198004A;
	Tue, 22 Sep 2026 13:24:45 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Tue, 22 Sep 2026 13:24:45 -0400
X-ME-Sender: <xms:2rmyalO-uDHM__APmsv-YucoLtmwXPbokENmYIZ4aAX-XJPDAFZnCw>
    <xme:2rmyaixvunDe_7PXCVVHloSH4gHagMW0K_rUgOIiwnwlIpLsnw2cGWwjTX12CR16v
    vjzpvHwLk8BtZ8JTVTF8SiXUiXUBOdVBEbNaGtQm5Kqk-jc5Wcjb9ga>
X-ME-Proxy-Cause: dmFkZTExBE7TvAv+Zlf649UCtMysU4jgxLizrL/IBJYd7zHzxzT0E//+kCYwyYrOvTbdX7
    thiX6uwyBdaqKYLIfeZJ3RcvzLm/3F257FpQsxcIGc0IR8IeUn+JveJzBAUm26dusdHpHb
    4rCDP6SW6PPxmAGHkJcp96m2+dumXAK9SzB1cqw6pj3h/jjfwcGQLm32LmrT4r8T0dyLe6
    LJng2/+kgbJToCdXVDqepDpT2QJ7XXUfsqi34Egv4IOJoLl14yXPc6ANLbyChYO7LNigZt
    jwUsH17joUGk+1NTUjGVgWQTPO0oLx3fVKrwmfDei61P4V0PWrnvZXm79oiL4aLRajiMPp
    mSHnzPlhvLSufXQNeYF6/Ba9VLhI6tZCz54Iz1NKZgs3fSxXq3eYBasca9fA+B8bAF8Wgs
    UiKvZD1UVDYM3Zw5plFc57o4OA1N8YaSnibSXFrs5/GbuEsHfD14izqu+QWqh5nukYUVBA
    Y4nc7u5V9DS+k2IB/m2oTQmtoS8g15v7OsBsTYha0Wsh/yf/IbN20v7hHPSSpB6J7yZxwn
    E74pAgoYA8v9K4jch1QYz8XqdeZlDGOV/m1b/J96h5QpgVEsf3QZdeOYd8l4Btsaz4uhiv
    TjC9xdad21b1uuwvGdayX4uQsJDh5bas8KDmcN7kYDevZIFYgraxIAWKFRyA
X-ME-Proxy: <xmx:3bmyajO3-KLnvAYYUqJ0goQhW8LvQIFqjDSCpEB-2cNrFwhmSj5Qkg>
    <xmx:3bmyaiNvfMOcy_9oWo2PNwJMNBste8eUD0F8Y9BQrhKmG8DOcB_5Wg>
    <xmx:3bmyal23adjBGHFVsr8yQKW5zfDQXHJzulpxpPpsr7RP94wdQKA8Iw>
    <xmx:3bmyam2xqCfBONWk2NKYCeGl-T3mLL58l-8JQSxdaTnnw_ePFTxkcQ>
    <xmx:3bmyakxJWpVombHSQ8IhhUZyN99U25G6dGSdkDwwGem_10UgNte0ac9b>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3C3C5F8008B; Tue, 22 Sep 2026 13:24:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A_PuV4p-mAYk
Date: Tue, 22 Sep 2026 20:24:21 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Youssef Samir" <youssef.abdulrahman@oss.qualcomm.com>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Chris Lew" <christopher.lew@oss.qualcomm.com>,
 "Deepak Kumar Singh" <deepak.singh@oss.qualcomm.com>,
 "Raj Kumar Bhagat" <raj.bhagat@oss.qualcomm.com>,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>
Message-Id: <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
In-Reply-To: <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_102503_258631_822C66D1 
X-CRM114-Status: UNSURE (   9.08  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > +
> > +/* The offset is chosen carefully to not collide with the node ids allocated by
> > + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> This assumption does not hold up for QRTR V1 headers where the node ids are 32bit.
> QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely larger than
> 0xFFFF.> + */

Does that mean we have to go back to my endpoint id patchset?  It's an
option, but a quite complex one.

However, what is the likelihood that serial number would clash with
these host node id values? Maybe just adjusting the comment could be
acceptable.

Also, rewriting QRTR node_id for more than just MHI devices could help
here. If all are rewritten, the problem goes away.

BR, Juha-Matti

