Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E546C83F0A
	for <ath11k@archiver.kernel.org>; Thu, 29 Aug 2024 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iHK5jcvZUS7qrlG4m+04+AUXqTic5Em0yUatxohGJFA=; b=3bXv4HEJ90VcgNX2h5Ev94HA+E
	lKrYPP2ONofZW6/leGSD0unk9QFgXNzapWOdS5srsRvtfAHmFPBiMC17yxc0VT8x6WZKry1stILAg
	PYLUt0RHNld4VSxp7Mhd0S/fzbcH3NbMw46n9zHZB1/gd72cYzE61j6TuyvR1s6gwiqhpajpiVcia
	ABzZh8pAUlp/2PNmjflI1z+GrqA13eI6qj/cZU+bE0tUMDECIyoTGfJhp7cs0f8aObtkhKdgAcwBS
	784PEoOpGr+wh4XtbrEj+vC5bUj7CnsoqXYVJ0cDq1nfUWHdXCjZBqteoM3VNBizN13vAlxkRIWPC
	ASf91AIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjdq3-00000001q33-39zY;
	Thu, 29 Aug 2024 12:01:19 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjdpQ-00000001pul-2aqr
	for ath11k@lists.infradead.org;
	Thu, 29 Aug 2024 12:00:42 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id B6DCC1FD28;
	Thu, 29 Aug 2024 14:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1724932838;
	bh=iHK5jcvZUS7qrlG4m+04+AUXqTic5Em0yUatxohGJFA=; h=From:To:Subject;
	b=ngkwKbCVNrDJE6pq/ummSGvjari5zRf8HhFZvCBBmIBpw+5G4wKpaY+tVPT9eisAN
	 eRi0dC59Hd6c2SSPwBgjZhRbBcAwaVGtgM43B9B+rthqCi2hcW362iwuvbpWCU0Dh/
	 oavF0IxMtolGiHxt7GdwFHLsWA071QCrIwxySDbe+WpHThUdsq5zGPyT3bM8qXXs0r
	 jBX9mY0Pu1TD4Uh6akLbCjObJfVbWIeoQJlW/QI+mEUGoSsE0+UsGySBO8V7oZvfpt
	 APv2fKEFjzCcEV/Lu/xeTzG2uPq7idhUKiaa6j30XvkdZGNpg05gJIwWMw3mMiThRk
	 LT57XeTu8SDJg==
Date: Thu, 29 Aug 2024 14:00:37 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: ath11k@lists.infradead.org, kvalo@kernel.org
Subject: Silex SX-PCEAX BDF
Message-ID: <20240829120037.GB30406@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_050040_871863_12057CDF 
X-CRM114-Status: UNSURE (   4.51  )
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

Hello Kalle,
following up on a short chat we had over irc weeks ago.

I am using a Silex SX-PCEAX wireless module (QCA2066), and I would
like to understand how to get the board file merged into the wireless
repository so that this module can just work with ath11k driver.

I have some files I received from Silex, but they do not look suitable
for integration as they are (board-2_US_EU_JP.bin).

Can you help? What should I do?

Francesco


