Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E264C47DB3
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9IOJzSuARY+kxR//B1+oqmeyqGna1ZBx2UtGPHtjGs=; b=HW9to9PB1JFSkU
	lOs4CZoH0GySqhWrktoMuRYX7Os8VE0tOZzi0C7RoTqueRK9VwinIHoHPAH/DK6JPdy6nFS3gOgEV
	KG4i9wqBF6A/y3+TXL33jwYKlfISW/HLMaIvtgl1K7BiS4FOc3jcXsEGnOYsAWGhO5ml7rTo3V/yW
	kzc9FjmMpu2SU/sPQ3m/rcxOqekISMLbqZukg5t9z88d4coj6H+RJqpnBnHMbPjx+gzqF0kYO3h7e
	iWnF/A7fCEv4eB2dg4ENptnW27IviVx3SBbbE5KXqtIqgO8Q0wL9O4OhO3ic1lwSQ+fsllrqbsOT8
	hg9fU1uyIM3Iup4dsIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrjS-0000000BII8-0ktm;
	Fri, 02 Feb 2024 11:29:18 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrjP-0000000BIHh-1CYG
	for ath11k@lists.infradead.org;
	Fri, 02 Feb 2024 11:29:16 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rVrjM-0002A8-EW; Fri, 02 Feb 2024 12:29:12 +0100
Message-ID: <0c8e379b-91fa-4e02-8758-aeee01024c93@leemhuis.info>
Date: Fri, 2 Feb 2024 12:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] ath11k broken in v6.7
Content-Language: en-US, de-DE
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <874jfjiolh.fsf@kernel.org> <87frytg7b8.fsf@kernel.org>
 <878r4lg3t8.fsf@kernel.org> <87jzo13jmf.fsf@kernel.org>
 <94150b26-bdd9-49c2-82a1-26ff46c9d32a@leemhuis.info>
 <87fryp3he0.fsf@kernel.org>
 <0253854a-e5f9-4316-bec3-61aaf3ebfd1a@leemhuis.info>
 <871qa0xtk6.fsf@kernel.org>
 <ccbb3aeb-daa1-49ba-b729-964bd97748bc@leemhuis.info>
 <87r0hvta9a.fsf@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <87r0hvta9a.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706873355;fc0b0b0a;
X-HE-SMSGID: 1rVrjM-0002A8-EW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_032915_505229_2C9E8972 
X-CRM114-Status: GOOD (  11.81  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 02.02.24 11:45, Kalle Valo wrote:
> Thorsten Leemhuis <regressions@leemhuis.info> writes:
> 
>>> So, in the new interface, how should I handle a situation that a
>>> regression is first reported on the mailing list, added to regzbot and
>>> later there's also a bug report opened for the issue?
>>
>> You will have to options: reply to the first report with a "#regzbot
>> duplicate https://bugzilla.kernel.org/show_bug.cgi?id=325423423423542"
>> or add a comment to the bugzilla ticket pointing to a report already
>> tracked by regzbot, e.g. "#regzbot duplicate
>> https://lore.kernel.org/not_relevant/msgid-423423423423423423/"
> 
> Oh, regzbot also follows bugzilla comments? Didn't know that, very nice.

Right not it only notices them. Commands in comments are not supported
yet, but will be once the partial rewrite lands.

> One more question, I promise it's the last one :) When using the Closes
> tag in patches does it matter which URL is used, either the original or
> the duplicate? For example, do these both tags close the issue:
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=325423423423542
> Closes: https://lore.kernel.org/not_relevant/msgid-423423423423423423/

Yes, you can use either or both of them together to make regzbot close a
issue and it's duplicates. But to make Linus happy I guess he'd prefer
to have both links in there, if those are reports from different people
that contain background information that might sooner or later be handy
to have at hand.

Ciao, Thosten


