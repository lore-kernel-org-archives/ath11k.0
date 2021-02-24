Return-Path: <SRS0=NPuH=H2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EEEC433DB
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 22:03:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBB964F03
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 22:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CBB964F03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=popies.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKERlCV9j500PW3aXzlUclZ/NLr6VXRkKHNbdiaaUB8=; b=VLqmLdCPH3LsgRyMr/cffNQiXu
	r3MRGvlv5kQN5ONIvOntj/BCn/7Gp1rXEI5O0G2cv+hs70rWWLdjsgN3BlN3/z4G7M/H2Zhq3c3nY
	eeSiPlhIeQZNvIP72K6rl3GVyXb5F897RVxyukUt3NuYA6lF+uLxmT1gM1LV11TUZesLKbOZ81nEj
	CTwhmB495Ntp7QWWYihWCPNF+ebN8fTr05LlqJiF/46fcSnMFGuFyHGgMreVjREBkJYXOQAhAZfzv
	ZdBGIpNI54j/HWUYM01x2hh5K2lLvjip6ZCnEo7Kbg48tvYFifW5WqJQIxGs3XOXohwO5TRqI5qQR
	kBRRsAdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF2Fe-0002tK-59; Wed, 24 Feb 2021 22:03:22 +0000
Received: from mail.popies.net ([163.172.86.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF2Fc-0002sd-1l
 for ath11k@lists.infradead.org; Wed, 24 Feb 2021 22:03:20 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.popies.net (Postfix) with ESMTP id BC4EE1E804EA;
 Wed, 24 Feb 2021 23:02:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at popies.net
Received: from mail.popies.net ([127.0.0.1])
 by localhost (sd-111039.dedibox.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7d98nQ-LlQNn; Wed, 24 Feb 2021 23:02:46 +0100 (CET)
Received: from calypso (82-64-68-144.subs.proxad.net [82.64.68.144])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: stelian)
 by mail.popies.net (Postfix) with ESMTPSA id 591C71E8016C;
 Wed, 24 Feb 2021 23:02:46 +0100 (CET)
Received: by calypso (Postfix, from userid 1000)
 id 0B43A28C009A; Wed, 24 Feb 2021 23:02:46 +0100 (CET)
Date: Wed, 24 Feb 2021 23:02:46 +0100
From: Stelian Pop <stelian@popies.net>
To: Justin Mazzola Paluska <jmp@justinmp.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
Message-ID: <20210224220246.GA6104@calypso>
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 <87mtydwy7v.fsf@codeaurora.org> <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <87czwshyn3.fsf@codeaurora.org> <20210224091444.GA30965@calypso>
 <bbec5e34-49e4-1e80-0420-63cb046a2c2b@justinmp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbec5e34-49e4-1e80-0420-63cb046a2c2b@justinmp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_170320_191521_CCBCD191 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

[Sorry for the previous HTML mail...]

Hi Justin,

On Wed, Feb 24, 2021 at 04:33:03PM -0500, Justin Mazzola Paluska wrote:
> On 2/24/21 4:14 AM, Stelian Pop wrote:
> > There are probably multiple issues, the first of which is the one Justin
> > reported (unable to go to sleep when ath11k is loaded). I suggest you
> > look into this BEFORE updating the BIOS...
> 
> To be clear, s2idle works (and I do get into S0ix states when doing s2idle
> suspend) for me with the pre-2.0.0 BIOS.

As you said previously, entering S0ix only works if you 'rfkill block all'
first before going into s2idle suspend. That was the issue I was referring
to.

Stelian.
-- 
Stelian Pop <stelian@popies.net>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
