Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A13C77B61
	for <ath11k@archiver.kernel.org>; Sat,  8 Apr 2023 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=E3oLFDbkkl0koUV/xXA3pFhtoinOxgs64WaLBvAI6So=; b=oRL
	RV5k4e4KPzn+MrVRKzWSt1Ch4v8/tvVHgslmi3St1HV4WpiWj9zG2rTSMirh5gQ9A/uC8KCmhAHpX
	z1miEYnM32326Z0U0D97QIqf8oibFzpFRuWVJtCR1Kgjf/mMPwLoHuhHDFTlHMUSr8tS+EfojG0gf
	KLR7dLKRA8yuaG+hIciUFWOwkquPPKYoSxf0UF2Ikgb9fzY/sd5B83tp+0SRJZbpRFz7qodKS8lIY
	SozbeqzejU54SBMCmmDy1zunjgyBwi3W4v/rYPUlZ4n/slmuqhRxOaeWiz/Xn859coU7mHKUoUEO7
	RSqhgvyrAlrUNVLK4U9JLyucRaU4++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl77u-00CFsJ-0v;
	Sat, 08 Apr 2023 11:53:02 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl77q-00CFrR-2R
	for ath11k@lists.infradead.org;
	Sat, 08 Apr 2023 11:53:00 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pl77l-0002Tp-FL; Sat, 08 Apr 2023 13:52:53 +0200
Message-ID: <ed31b6fe-e73d-34af-445b-81c5c644d615@leemhuis.info>
Date: Sat, 8 Apr 2023 13:52:52 +0200
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
 Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [regression] Bug 217286 - ath11k:deny assoc request, Invalid
 supported ch width and ext nss combination
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680954778;3543a6f4;
X-HE-SMSGID: 1pl77l-0002Tp-FL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_045258_958477_FA5AD969 
X-CRM114-Status: GOOD (  16.64  )
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

Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217286 :

> Built and installed v6.2 kernel (with ath11k_pci) on arm64 hardware
> running Ubuntu22.04. Hardware has both Atheros QCN9074 module and Intel
> AX210 module. Running each (separately) in station mode and try to
> connect to Synology router with WiFi Access Point based on QCN9074.
> AX210 has no problem connecting to AP but Atheros is successfully
> authenticating but association is rejected by AP with this error message:
> 
> 
> wlan: [0:I:ANY] [UNSPECIFIED] vap-0(wlan100): [04:f0:21:a1:7c:3e]deny assoc request, Invalid supported ch width and ext nss combination
> 
> Please note that when running v5.15.5 kernel (with ath11k_pci), I am
> able to connect to the same AP without problems.
> 
> Detailed logs follow:
> [...]

See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v5.15..v6.2
https://bugzilla.kernel.org/show_bug.cgi?id=217286
#regzbot title: net: wireless: association is rejected by AP
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
