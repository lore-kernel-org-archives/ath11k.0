Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F6CC433EF
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXBWOaPhqjXbrUI7eyGimT3i0mUzQZMqdesdw85linw=; b=wYBTxWpIIwZzdh
	qeejvZBxTSAMBNDKOpdj6YMSMR3N7mBI9UVHnyFcGMxK3bCBck3pKcF6bDOnqyWzXWp/jSEehAQ87
	JCBh9/PFsS0PcBnCUubuuHUirV7Iv5xPSIDnziav2VfndX9k9EQP5tAlyQFwqCA2Wt8ycs1xZR4wJ
	tbBYWdSfXPsY70gAF02VRfawmDxjEt+C6rzD+aHfOuRC09Er2Ac6Ej6lPd6eKXk4kINAl83hw4VMR
	Wi6AzLfACe1xaqxGQHbsWyzsD8ouysmp2BTf7kroAqd2qYUEemvKCaj/xKMfWhrIi68Eo9mIIvwXg
	EPD/aV9M474hAitDuTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx4gz-0075Ss-QR; Fri, 03 Jun 2022 10:38:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx4gw-0075Rz-JG
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 10:38:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B8A40CE22D7;
	Fri,  3 Jun 2022 10:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F512C34114;
	Fri,  3 Jun 2022 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654252679;
	bh=/k8PznFyRZuvrNCDkSbEbNKLfcYHfATv3sZBKBsR0Ng=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W2u1DWZtJu8uHYJaAqHcqrTsYfjaa4Vd85cMWi6aDUFc443zWU3vp0kllWa5ZlECE
	 KLYo4bDWTXpDkilr76yzDPAn4ADpJCCvyQ8mkuds2xqSzhJpfcmk/sNiyV64fd8P/4
	 1BFzMJPdVshCFuhRCX6ggZN2JBscn50hHPG2bx9HHpXGPLz6kcq2IsJsnWKYMFOUed
	 tNhz/JBDCP0e82zcdV5okHF+PBpqv/OG2lrTx+xk5nG0zPbTXgiTYuz2WvI4I0TIEj
	 FMrlsJn4TOZorM3B/wy23bhaYaR+8e9SYBCfwLcGVkwEItEMgJfBciS81euDyEzf7A
	 Jf9ubsWtif6EQ==
From: Kalle Valo <kvalo@kernel.org>
To: "Aditya Kumar Singh \(QUIC\)" <quic_adisi@quicinc.com>
Cc: "Jeff Johnson \(QUIC\)" <quic_jjohnson@quicinc.com>,  "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,  "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PATCH 1/2] ath11k: move firmware stats out of debugfs
References: <20220602051425.9265-1-quic_adisi@quicinc.com>
	<20220602051425.9265-2-quic_adisi@quicinc.com>
	<07248432-bf0f-e2d5-6ada-61c66337f295@quicinc.com>
	<DM5PR0201MB3589A92F02DBAA0A26B8BF8684A19@DM5PR0201MB3589.namprd02.prod.outlook.com>
Date: Fri, 03 Jun 2022 13:37:54 +0300
In-Reply-To: <DM5PR0201MB3589A92F02DBAA0A26B8BF8684A19@DM5PR0201MB3589.namprd02.prod.outlook.com>
	(Aditya Kumar Singh's message of "Fri, 3 Jun 2022 04:23:04 +0000")
Message-ID: <87r146m3r1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_033806_846108_32167940 
X-CRM114-Status: UNSURE (   5.98  )
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

"Aditya Kumar Singh (QUIC)" <quic_adisi@quicinc.com> writes:

> Sure, will address in v2. Thanks for pointing out.

Please edit your quotes. You had over 500 lines of quotes in your one
line reply, this makes it horrible to use patchwork:

https://patchwork.kernel.org/project/linux-wireless/patch/20220602051425.9265-2-quic_adisi@quicinc.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
