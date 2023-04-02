Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AC5C7619A
	for <ath11k@archiver.kernel.org>; Sun,  2 Apr 2023 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vxVHynR86XxQg0/9/3LVh/tqJeniwEqTmFDOICLdcVE=; b=IS/
	4wOxcS4MGpCWV3dyqI/LX86Nw8CMs86IV5kjVbcjpuSiJ2fIP0LMLGl8jT7ZADxFtzQlHSBi+Hwco
	0g2ax6bFMjfy/6KXgemBpP1ZVMqIr+ueWZZPXyJR2HemEXezUQuG1Zx1N8x5i8eZWgLkKkyiFCUtq
	TLBcvY0sFIFRuem+dCsfQBUcwQXHy5vOylcZ3q8oupdAqx9+1XfQqDMsXtSbshdEB1iRdINTw9ipG
	aZflTdcfJ0ofAzH63PwFt0n1OfOQHkdbdcvOkBPKIuQj1Y2ExUImssKk716LJq7ZUqX2E/srglkcX
	cB7/S6E3EDG+lf8GIK1VxgbqlV/4fvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piseN-00C0Y5-2y;
	Sun, 02 Apr 2023 08:01:19 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piseJ-00C0Wh-2y
	for ath11k@lists.infradead.org;
	Sun, 02 Apr 2023 08:01:18 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pise4-0005MC-Ve; Sun, 02 Apr 2023 10:01:02 +0200
Message-ID: <83966474-658d-7e2f-3e7f-eb66100660e9@leemhuis.info>
Date: Sun, 2 Apr 2023 10:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [regression] Bug 217282 - Regression: ath11k hang on boot since
 updating from 6.1.21 to 6.1.22
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680422475;15e2f880;
X-HE-SMSGID: 1pise4-0005MC-Ve
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_010116_128059_52C50E04 
X-CRM114-Status: GOOD (  14.28  )
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

Hi, Thorsten here, the Linux kernel's regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developers don't keep an eye on it, I decided to forward it by mail.

Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
not CCed them in mails like this.

Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217282 :

>  Carsten Hatger 2023-03-31 14:49:06 UTC
> 
> Created attachment 304068 [details]
> dmesg of 6.1.22 vanilla boot
> 
> Dear all,
> 
> ath11k hangs when booting v6.1.22 on a HP Pro x360 G9 w/ Qualcomm FastConnect 6900 using firmware WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23.
> 
> However, v.6.1.21 works fine.
> 
> Please let me know if I can further assist in resolving this issue - testing would be fine.
> 
> Yours,
> Carsten


See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.1.21..v6.1.22
https://bugzilla.kernel.org/show_bug.cgi?id=217282
#regzbot title: net: wireless: ath11k: hang on boot
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
