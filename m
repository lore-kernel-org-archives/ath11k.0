Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84FCC77B70
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:
	From:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndFxd5KjW7qv3R2ltpHEW5qxlKHi6eoLnzNreQcN1+o=; b=GZ6u0xBm2l1tT8
	9bkjrNIxGiOW74SHCHDNRH6i+g+AziQWLSEm7d/0qSgyA3CVE+HEZwoQaMkge7E7/LtKtkh/ODokf
	0pwA0i0ZCf1YIDDdKi3+npOQ2wb8b58Egl/TEUM59y4vygHWEktHt9T1nQSB6x8wQJFdjPbLuR4ET
	8t9kKrGjER/mi8+KXaHIn5fUnYE3/8geu/q+kK89UUzIn9xo1rNku5S4x2wUuv4oQloU36jAQCOL7
	UGQ4DTmIwFtsY3tVU4J+OnSWAOjyQc/XgVB7Em4LI8oecVwORaxYhB/oV9ZWM07vEoSgVbsukeUUL
	vXktbeFcp/+GECxt/OsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLV3-00FdAO-0W;
	Mon, 17 Apr 2023 09:50:17 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLUx-00Fd9Y-06
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 09:50:15 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1poLUs-0000V0-CC; Mon, 17 Apr 2023 11:50:06 +0200
Message-ID: <afa92c35-b17a-49de-ac4c-6d60237a2dca@leemhuis.info>
Date: Mon, 17 Apr 2023 11:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [regression] Bug 217286 - ath11k:deny assoc request, Invalid
 supported ch width and ext nss combination
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: ath11k <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Kalle Valo <kvalo@kernel.org>, Jouni Malinen <jouni@codeaurora.org>,
 Jouni Malinen <j@w1.fi>
References: <ed31b6fe-e73d-34af-445b-81c5c644d615@leemhuis.info>
 <f84c39ed-b8d8-7d0c-0eff-c90feaf5ab4f@leemhuis.info>
In-Reply-To: <f84c39ed-b8d8-7d0c-0eff-c90feaf5ab4f@leemhuis.info>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681725011;7506f17c;
X-HE-SMSGID: 1poLUs-0000V0-CC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_025011_217289_5F4D1A67 
X-CRM114-Status: GOOD (  17.96  )
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

[resending with the current email addresses for P Praneesh and Jouni
Malinen; didn't find one on lore for Ganesh Sesetti, and Sathishkumar
Muruganandam]

Please see quoted text below, as there is a kernel regression that is
caused by a patch you authored or passed on.

On 17.04.23 11:33, Thorsten Leemhuis wrote:
> On 08.04.23 13:52, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Hi, Thorsten here, the Linux kernel's regression tracker.
>>
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developers don't keep an eye on it, I decided to forward it by mail.
>>
>> Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
>> not CCed them in mails like this.
>>
>> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217286 :
>>
>>> Built and installed v6.2 kernel (with ath11k_pci) on arm64 hardware
>>> running Ubuntu22.04. Hardware has both Atheros QCN9074 module and Intel
>>> AX210 module. Running each (separately) in station mode and try to
>>> connect to Synology router with WiFi Access Point based on QCN9074.
>>> AX210 has no problem connecting to AP but Atheros is successfully
>>> authenticating but association is rejected by AP with this error message:
>>>
>>>
>>> wlan: [0:I:ANY] [UNSPECIFIED] vap-0(wlan100): [04:f0:21:a1:7c:3e]deny assoc request, Invalid supported ch width and ext nss combination
>>>
>>> Please note that when running v5.15.5 kernel (with ath11k_pci), I am
>>> able to connect to the same AP without problems.
>>>
>>> Detailed logs follow:
>>> [...]
>>
>> See the ticket for more details.
> 
> FWIW, the reporter bisected the regression down to
> 
> 552d6fd2f2 ("ath11k: add support for 80P80 and 160 MHz bandwidth")
> 
> Authored by P Praneesh, Ganesh Sesetti, and Sathishkumar Muruganandam,.
> all of which I added to the list of recipients (just like Jouni Malinen,
> who handled the patch). Could one of you please look into this?
> 
> While at it, let me update the tracking status:
> 
> #regzbot introduced: 552d6fd2f2
> #regzbot ignore-activity
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
