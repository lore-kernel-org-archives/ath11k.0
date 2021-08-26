Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB62C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 17:34:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543CA6108F
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 17:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 543CA6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5QWTpjianiNx2kjK7pmSPGUSoTLGYIXDp7sudaD9JQ=; b=PjE0ISObxwfzR0
	q1AFO8aBRncP/xqnP5dT5P6nNBpoGEqiS6+fdflQeQ5yovKtZo6S8Al+suqbjmd0Qe05noc14yyQj
	iIjuwV9V0ZLATDPRtC21cCvgmzt8MWsJWpjmKUO4Ved2TUEkHUzj7LqpFUPhmImtIQC2gtVHvd2cS
	59pYY8QHOcOYzUoEX0PACLGDy9ZlPl/urAMvL4/peB5W4E1rZW9A8w+dUZD8f5R+sCyDaMx47oRTA
	8GHRA25y/4v/H7GFz0D56SupFDMm6E4vA82gxgnBM6GXr6T5r5UrOQ1lapd0/FeNkkNQ65gRwNRE8
	jnKlu2PGWN3MU1mwI5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJJGX-00AekW-87; Thu, 26 Aug 2021 17:34:13 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJJGP-00Aeja-Vf
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 17:34:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629999248; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=qta+qYD1w0e7tbvbE14AUN5/YQ7AozMBp/adYzHF+r4=;
 b=NoqYgnwjTqVt78sgYiVB/rD0Im3xFYKSccJvXvnSrP+Aze2zScBWJtAr0cPqP2pi9RhOPx4J
 yNx2ZG5DIEQSlaniRq/+Ec20I3KKfKvjhiGCIl6p8qHmtJSLePj/RP5FemXIJ17ZK+jbaeYH
 +iEvBM7lw+iPWRZow4tqRM81oAo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6127d084cd680e89691163ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 17:33:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 53576C4360D; Thu, 26 Aug 2021 17:33:55 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D600C4338F;
 Thu, 26 Aug 2021 17:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8D600C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Wren Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 Nicolas Schichan <nschichan@freebox.fr>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
 <YSenaxWzxRkYkucv@kroah.com>
 <20210826074850.16768dee@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87eeag6yjr.fsf@codeaurora.org>
Date: Thu, 26 Aug 2021 20:33:47 +0300
In-Reply-To: <87eeag6yjr.fsf@codeaurora.org> (Kalle Valo's message of "Thu, 26
 Aug 2021 18:00:40 +0300")
Message-ID: <87y28o5cw4.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_103408_648503_C301F180 
X-CRM114-Status: GOOD (  26.64  )
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

Kalle Valo <kvalo@codeaurora.org> writes:

> Jakub Kicinski <kuba@kernel.org> writes:
>
>> On Thu, 26 Aug 2021 16:38:35 +0200 Greg Kroah-Hartman wrote:
>>> > I did some investiation and I suspect that commit ce78ffa3ef16 ("net:
>>> > really fix the build...")[1] is for handling a conflict between net-next
>>> > and char-misc-next trees related to Loic's commit 0092a1e3f763 ("bus:
>>> > mhi: Add inbound buffers allocation flag"). Greg mentions this in a
>>> > commit[2]:
>>> > 
>>> > commit 813272ed5238b37c81e448b302048e8008570121
>>> > Merge: de0534df9347 36a21d51725a
>>> > Author:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> > 
>>> >     Merge 5.14-rc5 into char-misc-next
>>> >     
>>> >     We need the fixes in here as well, and resolves some merge issues with
>>> >     the mhi codebase.
>>> > 
>>> > If my assumption is correct when I propose that we revert commit
>>> > ce78ffa3ef16 for v5.14, AFAICS it's not really needed for v5.14 (commit
>>> > 0092a1e3f763 is in -next, not in Linus' tree yet) and commit
>>> > ce78ffa3ef16 breaks ath11k. And the conflict between net-next and
>>> > char-misc-next can be then later fixed during the merge window.
>>> > 
>>> > Will this work for everyone? If no objections, I'll submit the revert to
>>> > Linus later today. We are getting really close to final v5.14 release so
>>> > not much time left to fix this.
>>> > 
>>> > Just to reiterate why the urgency: commit ce78ffa3ef16 broke ath11k in
>>> > v5.14-rc5, users have reported (and I have confirmed) that at least
>>> > QCA6390 support is broken but I suspect all Qualcomm Wi-Fi 6 devices
>>> > supported by ath11k are currently broken.  
>>> 
>>> No objection from me for reverting that, if it fixes the problems you
>>> are seeing for 5.14-final.
>>> 
>>> The goal was for the mhi changes to go through the networking tree in
>>> the first place, I don't see how this got out of sync.
>>> 
>>> If this is reverted, some help on how to resolve the merge issues it
>>> will cause would be appreciated.
>>
>> Also no objections here. FWIW I'm about to send the last PR for
>> networking, still waiting on BPF. You can send the revert to netdev, 
>> or directly to Linus as you prefer. LMK.
>
> I prefer take it via the net tree if possible, so if you can wait ~2h
> and I'll send it to you.

I now submitted the revert, please take it into the net tree if you
still can:

https://patchwork.kernel.org/project/netdevbpf/patch/20210826172816.24478-1-kvalo@codeaurora.org/

I also tested the build with various QRTR options and didn't see any
build errors.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
