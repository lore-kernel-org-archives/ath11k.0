Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF114EB64D9
	for <ath11k@archiver.kernel.org>; Wed, 14 Jun 2023 08:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgVvsZJAe4LUw8SBVY2oNgwJqu1k0kjWB4jwtvaMlEM=; b=ELY64feGb35BPI
	wxgJQpmnGjCLeoRfwY+Ym9hvY0cQ98S4v4Dzz7POgCIM2ynY1yiUk62ZDZAkIZVleJvC0cLRWN6DO
	PPA5A0YN9gUNR2vsVwSFmwOzaI2Ohor4xpG24wKcbKzZ5lgK7pkmxZBYheQlK4cuJByFsyvtW0fTA
	1mTv5n0dWIWIPn/ZeTYDc538efgYgpnSn/jzyjX0DcFiRZTjGKYDhbpjYgcZPDmJq9slYEx/QRY/K
	Uh+uoXt5+mqcNyt5SkSrP68JDOIAzdj62KklO4ukXZpzcdDGHSmWioeWI02pKHJT3+Kq0+J5/ALVy
	fJzhBCtlRcX6EXSQU/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9LzX-00AuTa-25;
	Wed, 14 Jun 2023 08:36:35 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9LzV-00AuT4-0w
	for ath11k@lists.infradead.org;
	Wed, 14 Jun 2023 08:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=5X3DbXVamotUiJDEAUjOGrU/er263n0Rr6CZBj+gJDw=;
	t=1686731792; x=1687941392; b=F9c7sZru8Oz4OdsjavIqrqA478mmaQRmis65xNHmvfM+KOs
	sGcf7Iq8iCznzHfTCyjm53TdMDtYqj1WVdCHRveSNinsh1XoIL++cCDeMljvdiO7k9x9El9kx+y3l
	CMu68NazOPz0GKwivKkumXDfNNTkRi0Ng0yky+6OJRLLCfwDVyh5cu04scLHaeSZWJ0Wacb8aJvsC
	QAuEdYfgZgccHl+nlYVeLuzKGnDTOHMjMjhupiF5yN17NVTEUl8AkjbIPx62J5qrzosiGiqqPOHGT
	wiLNLUxn4aTFF9dSQMMWEZuuQUqB5PgiGN0x05leg9lYDkxnSui/RR1OgzUG4eRA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1q9LzT-0060rb-05;
	Wed, 14 Jun 2023 10:36:31 +0200
Message-ID: <b8e9d95705bbf9f9c248a156aa581053720b5aa3.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/3] wifi: mac80211: Fix tkip encrypted packet
 transmission path
From: Johannes Berg <johannes@sipsolutions.net>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Sathishkumar Muruganandam
	 <quic_murugana@quicinc.com>
Date: Wed, 14 Jun 2023 10:36:29 +0200
In-Reply-To: <20230608070754.7161-2-quic_aarasahu@quicinc.com>
References: <20230608070754.7161-1-quic_aarasahu@quicinc.com>
	 <20230608070754.7161-2-quic_aarasahu@quicinc.com>
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_013633_333795_5446AFB7 
X-CRM114-Status: UNSURE (   6.82  )
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

On Thu, 2023-06-08 at 12:37 +0530, Aaradhana Sahu wrote:
> From: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> 
> Currently, TKIP encrypted packets are transmitting through fast path
> and fast_tx, fast_rx is not assigned in case of TKIP cipher so
> packet is dropped during ping.
> 
> Fix this issue by sending TKIP encrypted packets through normal path

Not sure I understand this. How is fast_rx related, we're talking about
the TX path?

Also, how is this even a correct patch, since you submitted a series of
three patches, and
 (a) it's probably broken for ath11k until all three patches are in
     place
 (b) what about other drivers

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
