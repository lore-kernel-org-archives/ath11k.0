Return-Path: <SRS0=jWs5=NE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DA7C4338F
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 10:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38A460F21
	for <ath11k@archiver.kernel.org>; Fri, 13 Aug 2021 10:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D38A460F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB+4b+3I+8M7IghUpQmhLtNrvVMifj0AV0zhGbVS9eg=; b=19GuI1tr8lYUyJ
	cYdWOCDFokluUb9K70rWtC8dtJEvQCBQwg/2u5FzQgaki9LSWjd4lEvCZIs0+hHDYRJoBGD2M/LAw
	yCDNNWA2dfMRykOPCfcnfJVDFdK0I1WpPhJfikfm8itDFHj5Vy/czhHeayZ0dDIqHY3647DhPJ2jS
	a4JljSo6Q/YNbBUJlkSD8/Pb+a1v7dUti+jGczUb1cyeso7OwpOTQnees6Kfkzth4vr5/HFQaqB1v
	TixASdUunYN7pOicdssdPyqnVW70vYZtMs51ToFi7IOYY2fNZ5rO88EvozY6GeihS+xmbnpbONpXp
	QVjhmorsEZlRuT61Ld9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEUAW-00CQPv-C8; Fri, 13 Aug 2021 10:12:04 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEUAP-00CQPH-3B
 for ath11k@lists.infradead.org; Fri, 13 Aug 2021 10:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=yxqGznKpFcy90u/i72TSHu+ZUzJFayVrCEeLw+E0YvY=; 
 t=1628849516; x=1630059116; b=EkUowBjvFx/xiSKjMtuE7jAE/JIurCOkWe8rAWR8/qvi6lT
 8twoq9RuijpBfqf0+91b5SRH6eJKiG5Vu1dwNRZcR3QIPHK6IE0uvSn12ClBHq+T0C0cSN8D/aZFm
 ujU/99k8IzqTK6kOu4yaKbk2zMM5/Yi/Hee6/XMQS1c+qf6vKQ93JXwWrtSIK7TaM3Zau89rjACNg
 8WC0gfHbrorDlwuDFWMVotA6N5710rgfHXF6hyHuFkofP8yfPSAnxXEr2P7XQpNSC34dVSJxInz0d
 DyvN3wVCu6fQTEjZmcmt6wk1CLZp9Ss7V8tTgXBzp8w076g/QaKsowHxLT6gMqDQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mEUAK-00ABs5-Rs; Fri, 13 Aug 2021 12:11:52 +0200
Message-ID: <569d85aec8fecc836b5a6f9d40b53dff6e41c1b1.camel@sipsolutions.net>
Subject: Re: [PATCH 9/9] mac80211: save transmit power envelope element and
 power constraint
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Fri, 13 Aug 2021 12:11:52 +0200
In-Reply-To: <465b6b8535fc17ae51ee2f3116af87bb@codeaurora.org>
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-10-wgong@codeaurora.org>
 (sfid-20210517_222034_029448_A9A89D57)
 <d9491db4ece67ac78eb39a1078b91a106770fbb0.camel@sipsolutions.net>
 <1126f8d996e895ae048092b3f8aad19b@codeaurora.org>
 <38e7d9d2eebafa7245a36a0a0396094526eb3efd.camel@sipsolutions.net>
 <1273cc1a399a7457c3d908648a7651c8fe9b93f3.camel@sipsolutions.net>
 <a056e32d4911400fb0822bf02167e91c@codeaurora.org>
 <f61cdc7bae2dd2a645e164ca143b9db402472559.camel@sipsolutions.net>
 <465b6b8535fc17ae51ee2f3116af87bb@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_031157_184397_04CE788D 
X-CRM114-Status: GOOD (  12.11  )
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

On Fri, 2021-08-13 at 17:16 +0800, Wen Gong wrote:
> 
> yes, it should have some flag/logic to check whether it is BIGTK.
> If you know it, you can tell me. :)

Uh, actually, we don't have a secure indication of BIGTK getting used
until after the 4-way-HS.

> > 
> Yes, the lower driver also have the max power limit itself. If power 
> calulated
> from the fake beacon is bigger than the max power limit, then it will be
> ignored.

Right.

> > 
> The Transmit Power Envelope is not existed in the assoc response, it is 
> existed
> in beacon. So it can not use assoc response.

Right.


Given this discussion, I think we should just leave it as is, and simply
not assume that the TPE is protected by beacon protection or such. There
are a number of other similar parameters, and doing some real protection
at this level would likely require further spec changes.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
