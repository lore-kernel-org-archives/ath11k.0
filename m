Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664C2C761A6
	for <ath11k@archiver.kernel.org>; Mon,  3 Apr 2023 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:
	From:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uq+pHPMoz3jqPgHiMoCGo361E05LE7EfolT6u7T8SKw=; b=p89kdUrlIORBO+
	A/6GbwN6QbkUqcS82+Zh1E7LsQuVByE+lT/6xaG5Vx4mZACqssRJiuPtuJ65lukFtc1v4GIInIRxN
	DKjjitNqWrVittFkAlAPYtXwOAFUR8iayRH6Q0Wg980xF2qXGRVPJHQWOWvikGJH6+dy1zSBozGwZ
	wQVNCgsOckeGeIn5JcGi+gPReGNAeAKgz3iILEIorj2U8XKiP4RFyLUOb0pBI8EGK8MNG8aocm0Gx
	P9LgUnmFYUr8UMyY3qS/2B2FsCPL7WOGCR4mrAxMxVVwkHAc//NVkoQ9u2MEDiaIkl9S6z0t04FHC
	08mWGTUdgTJBCpCi3bRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFRC-00EVqe-0b;
	Mon, 03 Apr 2023 08:21:14 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjFR7-00EVne-2F
	for ath11k@lists.infradead.org;
	Mon, 03 Apr 2023 08:21:13 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pjFR0-00042P-HF; Mon, 03 Apr 2023 10:21:02 +0200
Message-ID: <1a8aaa86-0b63-f779-0604-ba6653efce6d@leemhuis.info>
Date: Mon, 3 Apr 2023 10:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [regression] Bug 217282 - Regression: ath11k hang on boot since
 updating from 6.1.21 to 6.1.22
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <83966474-658d-7e2f-3e7f-eb66100660e9@leemhuis.info>
In-Reply-To: <83966474-658d-7e2f-3e7f-eb66100660e9@leemhuis.info>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680510069;5a90fa61;
X-HE-SMSGID: 1pjFR0-00042P-HF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_012109_917170_4B1847C4 
X-CRM114-Status: UNSURE (   8.89  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 02.04.23 10:00, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developers don't keep an eye on it, I decided to forward it by mail.
> 
> Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
> not CCed them in mails like this.
> 
> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217282 :

FYI: reporter rebuild the kernel and the problem vanished, for details
see comment 2 of https://bugzilla.kernel.org/show_bug.cgi?id=217282

#regzbot resolve: Problem vanished on recompilation
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
