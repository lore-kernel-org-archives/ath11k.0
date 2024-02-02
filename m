Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE61EC47258
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 08:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PUrSZd89+EKys0dK6IdbgdoHXK35f2keLPqeK3UHd0=; b=oEj6ijim3FLJuOBUu7FnRZi/wf
	RO/2b5daQNUj6rJot9tdf3e7PvtNBgAIjeSGcngDPfT6DxQeo+PETnhJjMbrCYMCJojRU4OJLc7mZ
	6KJ3uBt+KHLpZLWxgAhjeZoCJ7p+Pj1qkcsqN2zbQCip5NRTL1XEF7h2VHGUDyagHTFzjQUxuIPcX
	IphUJ0FQjJn+CxGPJiWfwNjViapccOHOe8W5NtYdUNAePVnnYXQY2YhqZJO0vqof0j20RQbDsnyL8
	IoNl61WEJxqPvQgSXOWjlrdempX2h27n3Th+sPfR/LS30IuCtc0tmCeLH8EeMfJTV8efFTZnl+REw
	NRn5xinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVohZ-0000000AijH-2baI;
	Fri, 02 Feb 2024 08:15:09 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVohW-0000000Aigl-1XZw
	for ath11k@lists.infradead.org;
	Fri, 02 Feb 2024 08:15:08 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rVohL-0002ck-Sz; Fri, 02 Feb 2024 09:14:55 +0100
Message-ID: <ccbb3aeb-daa1-49ba-b729-964bd97748bc@leemhuis.info>
Date: Fri, 2 Feb 2024 09:14:55 +0100
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
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <871qa0xtk6.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706861706;4758319d;
X-HE-SMSGID: 1rVohL-0002ck-Sz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_001506_641369_EEF1C723 
X-CRM114-Status: GOOD (  15.62  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 29.01.24 12:33, Kalle Valo wrote:
> Thorsten Leemhuis <regressions@leemhuis.info> writes:
>> On 22.01.24 09:24, Kalle Valo wrote:
>>> "Linux regression tracking (Thorsten Leemhuis)"
>>> <regressions@leemhuis.info> writes:
>>
>> That "#regzbot link:" will vanish as well (at least from the docs, it
>> will remain to be supported), as people use it wrong in various
>> different ways: for duplicates, reports (like your did), patch
>> submissions fixing the issue (then 'regzbot monitor' should have been
>> used) among others. Which is totally understandable now that I look at
>> it. That's why it will be replaced by "#regzbot related: <url>" to avoid
>> any connection with the Link: tag used in commits; for duplicates
>> "#regzbot dup:" will stay around.
> 
> So, in the new interface, how should I handle a situation that a
> regression is first reported on the mailing list, added to regzbot and
> later there's also a bug report opened for the issue?

You will have to options: reply to the first report with a "#regzbot
duplicate https://bugzilla.kernel.org/show_bug.cgi?id=325423423423542"
or add a comment to the bugzilla ticket pointing to a report already
tracked by regzbot, e.g. "#regzbot duplicate
https://lore.kernel.org/not_relevant/msgid-423423423423423423/"

>>> I wish there would be a person who could follow stable
>>> releases from wireless perspective and make sure everything is ok there.
>> Maybe at some point regression tracking can help somewhat with that. But
>> I still have to fix a few things to make people use it and scale it up.
> I just feel it should be more than that, I'm worried that randomly
> taking wireless commits to stable releases is risky. There really should
> be someone looking after wireless (read: reviewing patches) in stable
> releases. This would be a good role for someone who is interested to
> learn how kernel.org development works and helping the community. Do we
> have a way to announce these kind volunteer vacancies somewhere? :)

Not that I know of. Guess kernelnewbies might be the best place for that
(and maybe they have something like that already...).

Ciao, Thorsten

