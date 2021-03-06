Return-Path: <SRS0=fz1E=IE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A10C433DB
	for <ath11k@archiver.kernel.org>; Sat,  6 Mar 2021 20:58:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A76D64F87
	for <ath11k@archiver.kernel.org>; Sat,  6 Mar 2021 20:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A76D64F87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=popies.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lC+pE1p/1TuuArY2UiyfL4LE1E0z595LSO1df48TMCs=; b=R8Y6eWBIbIRppwgq6qjlyccKR
	p4DyuIaEtB46li2Cw9SdN6YdwcmtH8TcTZzTvepgxTstf//Vy9NTa28q6w5wDfKS/W7OhE9p6ryvf
	QZVOUtU7wbgkkMK088y7WfhfI1GzLQ10318sQ5EHEbMb/2A/zufnRsLjSzsZPx1HjStEVOZxlxAx7
	bbo8rybay2vP4axlYUTl6VzQPe9xwhbKaEjgpX2g+JuMqhjxvvAbxZLWyLY6UZkhRCWymlNAzXz1P
	fi1dlMyzidAxxtPpriyvQJOO2Cr7b8agl+CnFjRkV1VcwG4OJG/5UIxlHahhCVqyPxiufqWnyQHy5
	Cl66lu4rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIe0X-004vE9-Md; Sat, 06 Mar 2021 20:58:41 +0000
Received: from mail.popies.net ([163.172.86.50])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lIe0R-004vC9-TI
 for ath11k@lists.infradead.org; Sat, 06 Mar 2021 20:58:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.popies.net (Postfix) with ESMTP id 68F6F1E801B1;
 Sat,  6 Mar 2021 21:49:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at popies.net
Received: from mail.popies.net ([127.0.0.1])
 by localhost (sd-111039.dedibox.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q87D6LaNypJp; Sat,  6 Mar 2021 21:49:43 +0100 (CET)
Received: from calypso (82-64-68-144.subs.proxad.net [82.64.68.144])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: stelian)
 by mail.popies.net (Postfix) with ESMTPSA id DB8091E8017B;
 Sat,  6 Mar 2021 21:49:43 +0100 (CET)
Received: by calypso (Postfix, from userid 1000)
 id 9BF7B28C0099; Sat,  6 Mar 2021 21:49:43 +0100 (CET)
Date: Sat, 6 Mar 2021 21:49:43 +0100
From: Stelian Pop <stelian@popies.net>
To: Wren Turkal <wt@penguintechs.org>
Cc: Justin Mazzola Paluska <jmp@justinmp.com>, ath11k@lists.infradead.org,
 kvalo@codeaurora.org
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
Message-ID: <20210306204943.GA4829@calypso>
References: <87h7nli16d.fsf@codeaurora.org>
 <CAHUdJJWpHWznHOhdtuRjbH2tr9F5kagGUbNsFO_f7MfY=w_3Gg@mail.gmail.com>
 <878s8xhx1s.fsf@codeaurora.org>
 <CAHUdJJVk3jDY9FGjPTuDTF2+QK+B8f8s6ZqMA+8uH-7Yd==Mmw@mail.gmail.com>
 <87czwshyn3.fsf@codeaurora.org> <20210224091444.GA30965@calypso>
 <bbec5e34-49e4-1e80-0420-63cb046a2c2b@justinmp.com>
 <20210224220246.GA6104@calypso>
 <ca0dc6e4-364e-2525-b7d6-d02c2dc0c5fd@justinmp.com>
 <baeb852c-9248-d6d2-2e29-697f21604b9a@penguintechs.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <baeb852c-9248-d6d2-2e29-697f21604b9a@penguintechs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_205836_136893_8B0FDED6 
X-CRM114-Status: UNSURE (   6.87  )
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
Reply-To: Stelian Pop <stelian@popies.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Wren,

> I see this behavior also. However, I am curious. Does anyone on here know if
> suspend is broken in other OSes with this firmware version?

To be fair, I saw exactly zero other reports of this and I searched
the Internet quite a little. I was even suspecting that I was the only
person seing it, and that the problem might be somewhere in my
personal software configuration.

Might be a good idea to publish a "me too" comment on the kernel bug
entry here: https://bugzilla.kernel.org/show_bug.cgi?id=211879

Stelian.
-- 
Stelian Pop <stelian@popies.net>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
