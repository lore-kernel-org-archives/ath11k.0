Return-Path: <SRS0=NPuH=H2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8354C433E0
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 09:15:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 303CF60241
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 09:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 303CF60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=popies.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xJN6gACHmzVlT1A69X+rGVOQcCn2IgeVH5ZSsol5E0=; b=aPTWLloy4Di7TI1/g0wfMUhS14
	S6npnkdRTlbkXxI55syHVMWts2pEx1ebcTpd5QgQ9s71TYYgpSBbfJpAHS1VToEAMnxUfuOFSUjjX
	J3EnLsfoxNvsLv22R8mqvStJbhKAMdCRZKbbRkXw+e9Malc8ouwxlIGeoPnpi23yb3SIUZ12it06T
	g4gxFL1pj+epn3BnawpDFQwQWbUnUH993URDRhInRVK1Nqe/sj6HyM/isFFTqls5KAvepcTnwD1va
	koOOcasR7HFzfCMRLTjeJhIBrZevjtyhkprC9fp3rrsC3lFfJgeP+z6IlWU9WVerCP7JvVLS0BquV
	2v2GynHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEqGS-0000uZ-Eg; Wed, 24 Feb 2021 09:15:24 +0000
Received: from mail.popies.net ([163.172.86.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEqGQ-0000tK-84
 for ath11k@lists.infradead.org; Wed, 24 Feb 2021 09:15:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.popies.net (Postfix) with ESMTP id 5ABCC1E801A1;
 Wed, 24 Feb 2021 10:14:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at popies.net
Received: from mail.popies.net ([127.0.0.1])
 by localhost (sd-111039.dedibox.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eA6OT1oC4GSY; Wed, 24 Feb 2021 10:14:44 +0100 (CET)
Received: from calypso (82-64-68-144.subs.proxad.net [82.64.68.144])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: stelian)
 by mail.popies.net (Postfix) with ESMTPSA id B7DDE1E8019D;
 Wed, 24 Feb 2021 10:14:44 +0100 (CET)
Received: by calypso (Postfix, from userid 1000)
 id 6A5CE28C009A; Wed, 24 Feb 2021 10:14:44 +0100 (CET)
Date: Wed, 24 Feb 2021 10:14:44 +0100
From: Stelian Pop <stelian@popies.net>
To: ath11k@lists.infradead.org
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
Message-ID: <20210224091444.GA30965@calypso>
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <87czwshyn3.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czwshyn3.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_041522_436788_0FE7C7FF 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On Mon, Feb 22, 2021 at 06:10:08PM +0200, Kalle Valo wrote:
> 
> Heh, "next few days" ended to be a month :) But anyway, I have been
> using the laptop quite a lot during the last month. Windows seems to
> update the BIOS without asking me and now I'm at "BIOS 1.2.5
> 12/10/2020". I reliably get 32 MSI vectors and I haven't see any of the
> M2 kernel crashes.
[...]

FYI, I have the same hardware, but with the BIOS updated to v2.0.0.

No issues whatsoever with ath11k on either the ath11k-qca6390-bringup-202012140938
branch or plain v5.11.0 kernel.

But, and it's a big but, suspend is really broken: I cannot enter S0ix, and
sometimes I found the laptop completly frozen in the morning (maybe it did
finally enter s2idle and has trouble exiting ?).

I don't know if this is related to the ath11k driver, some other driver or
the new BIOS version.

There are probably multiple issues, the first of which is the one Justin
reported (unable to go to sleep when ath11k is loaded). I suggest you
look into this BEFORE updating the BIOS...

I have a bug on kernel bugzilla wrt to the S0ix issue:
https://bugzilla.kernel.org/show_bug.cgi?id=211879

Stelian.
-- 
Stelian Pop <stelian@popies.net>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
