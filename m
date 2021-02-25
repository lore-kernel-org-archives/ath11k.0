Return-Path: <SRS0=jgmg=H3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385DAC433DB
	for <ath11k@archiver.kernel.org>; Thu, 25 Feb 2021 08:22:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6056264F0A
	for <ath11k@archiver.kernel.org>; Thu, 25 Feb 2021 08:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6056264F0A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=popies.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWZJe1luFwrVdoG+oBxY9qcQRtztThGet/44l7Opf30=; b=aV3bR0R6pdttn6y+92xCiOY+m6
	lUmQzoGBWNcbe/0Fmnp+9i8CNbMXzgnKzdFhm5oKl8BUGF+MrRIu80dViqz3w0Oo62B5gItHXpfnL
	0Hi5cd8tUkMb9wbOpbSkwB5Su91Qk1xQSYk4+6+7plNOBd1ZHyQL5FmYEowFo1dfOXXlHENDnylfe
	gEXEe4lGmrPrOa+NdhrdXKBJoV/yycOvQScMjwRPV3QU/oHrQds1eT/NI/JKwRXKyuFSg5TvYs52L
	W8lg6APSuDYeQyAxKKZg14yfOuetb2WEOkCNiXL79AkJ2TyYbVlf3UElKc4OxZE7jkVh0t6YXS4k+
	bNGBbWNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFBuF-0000QA-AK; Thu, 25 Feb 2021 08:21:55 +0000
Received: from mail.popies.net ([163.172.86.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFBuD-0000Po-1l
 for ath11k@lists.infradead.org; Thu, 25 Feb 2021 08:21:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.popies.net (Postfix) with ESMTP id A57EB1E801FD;
 Thu, 25 Feb 2021 09:21:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at popies.net
Received: from mail.popies.net ([127.0.0.1])
 by localhost (sd-111039.dedibox.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1T6N4MmoOccl; Thu, 25 Feb 2021 09:21:49 +0100 (CET)
Received: from calypso (82-64-68-144.subs.proxad.net [82.64.68.144])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: stelian)
 by mail.popies.net (Postfix) with ESMTPSA id 455961E80199;
 Thu, 25 Feb 2021 09:21:49 +0100 (CET)
Received: by calypso (Postfix, from userid 1000)
 id 07B5228C009A; Thu, 25 Feb 2021 09:21:49 +0100 (CET)
Date: Thu, 25 Feb 2021 09:21:48 +0100
From: Stelian Pop <stelian@popies.net>
To: Justin Mazzola Paluska <jmp@justinmp.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
Message-ID: <20210225082148.GB6104@calypso>
References: <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <87czwshyn3.fsf@codeaurora.org> <20210224091444.GA30965@calypso>
 <bbec5e34-49e4-1e80-0420-63cb046a2c2b@justinmp.com>
 <20210224220246.GA6104@calypso>
 <ca0dc6e4-364e-2525-b7d6-d02c2dc0c5fd@justinmp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca0dc6e4-364e-2525-b7d6-d02c2dc0c5fd@justinmp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_032153_204799_7E3E4686 
X-CRM114-Status: GOOD (  12.89  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: Stelian Pop <stelian@popies.net>
Cc: ath11k@lists.infradead.org, kvalo@codeaurora.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Justin,

On Wed, Feb 24, 2021 at 05:38:12PM -0500, Justin Mazzola Paluska wrote:

> No, the behavior I see on a pre-2.0.0 BIOS is:
> =

> s2idle suspend works well (including getting into S0ix states) with no
> effort on my part.=A0 I have no idea if s2idle does rfkill by itself, but=
 all
> I do is shut the lid and the right thing happens.
> =

> Opportunistic S0ix (when the laptop is fully powered up and in use) only
> happens if I use rfkill to shut down WiFi and Bluetooth.=A0 If either WiF=
i or
> Bluetooth are on, the laptop stays in power states well above the
> lowest-power SOix states.

Thanks for the clarification !

> It sounds like the 2.0.0 BIOS prevents whatever s2idle is doing from work=
ing
> without an rfkill.

Nope, rfkill or not, the 2.0.0 BIOS prevents s2idle (and opportunistic S0ix)
reach low power S0ix states. s2idle still kinda works (kernel says it enters
and exists s2idle suspend), but system remains in PC3 state instead of going
to PC10 and beyond.!

Stelian.
-- =

Stelian Pop <stelian@popies.net>

-- =

ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
