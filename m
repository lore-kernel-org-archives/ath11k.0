Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B20C48292
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 10:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFdi9nsZaEjCQ3w+9YmJM2sJuotbhl1SMh/PlhvMPyk=; b=RgXnYFtZwh8+09ABg9nXudycPA
	a/cYVGCFMGCqopAQNQGdIfXcCrk4QsObrua46SmblPOfNWGqqMKGiY1Np1ourHTpo5OtT51PlfXmg
	4uunb44ew9NtHYTPRY+r0amHM5TPoj+2DTbzNvIhY+1lqLoYTNjBTkjP20c1+ZHGinWvY84dHv0lv
	rHFiDulpoGSiQVC5G7hpzaeJymFjPZCZZmwSpDcSMA+hN1BOFd6pZRY3Dj0PvE67FIbfsfif409lv
	5RlBYiWo8nMQE3hhJgRwf4GcmQg4gK/gMJFWbT3TvVhMBuSYOXKH6LEk0z+DFn26regciABWTyPwD
	HCWpk8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVr3J-0000000BBpw-0nMA;
	Fri, 02 Feb 2024 10:45:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVr3G-0000000BBp0-1f9L
	for ath11k@lists.infradead.org;
	Fri, 02 Feb 2024 10:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B796623A0;
	Fri,  2 Feb 2024 10:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6DD0C433F1;
	Fri,  2 Feb 2024 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706870741;
	bh=hMlT+02qZo3h68LxyJIVLv2jA0reVr/0LdCJMMpMQws=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=g0ND5eKyoeUCL4Zow/tg6k1k3/rj74cPXAa1Do+CgYzgeios52dhC+h6l0NWxZPxp
	 MoD+TZ6kwiYQvacc/RgaxILcVaYFEDfPu+phujkXFmjiW/UrYAYq6R6OL3NykEh5bL
	 b/IOHEujhJJDMBlCcZ/eswyPGXah+l9JvMLOhTYnbHO5NgObj1JqBbOgCBlq+NIzQR
	 5eKTpZbq2MTWlvC0BGFybwDgiDMzvn5Fuyvnoc43p4lYThHJPwnAmSrvJhGqz9hLYi
	 0vwwqjcCCNrzurNLCZNNTdugN358+5T7Nvu5PijTh7L4goGdhKCMQCFqS32C9MnLE6
	 w7LahMRkeVznw==
From: Kalle Valo <kvalo@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: ath11k@lists.infradead.org,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  linux-wireless@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [regression] ath11k broken in v6.7
References: <874jfjiolh.fsf@kernel.org> <87frytg7b8.fsf@kernel.org>
	<878r4lg3t8.fsf@kernel.org> <87jzo13jmf.fsf@kernel.org>
	<94150b26-bdd9-49c2-82a1-26ff46c9d32a@leemhuis.info>
	<87fryp3he0.fsf@kernel.org>
	<0253854a-e5f9-4316-bec3-61aaf3ebfd1a@leemhuis.info>
	<871qa0xtk6.fsf@kernel.org>
	<ccbb3aeb-daa1-49ba-b729-964bd97748bc@leemhuis.info>
Date: Fri, 02 Feb 2024 12:45:37 +0200
In-Reply-To: <ccbb3aeb-daa1-49ba-b729-964bd97748bc@leemhuis.info> (Thorsten
	Leemhuis's message of "Fri, 2 Feb 2024 09:14:55 +0100")
Message-ID: <87r0hvta9a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_024542_528627_427643C6 
X-CRM114-Status: GOOD (  11.51  )
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

Thorsten Leemhuis <regressions@leemhuis.info> writes:

>> So, in the new interface, how should I handle a situation that a
>> regression is first reported on the mailing list, added to regzbot and
>> later there's also a bug report opened for the issue?
>
> You will have to options: reply to the first report with a "#regzbot
> duplicate https://bugzilla.kernel.org/show_bug.cgi?id=325423423423542"
> or add a comment to the bugzilla ticket pointing to a report already
> tracked by regzbot, e.g. "#regzbot duplicate
> https://lore.kernel.org/not_relevant/msgid-423423423423423423/"

Oh, regzbot also follows bugzilla comments? Didn't know that, very nice.

One more question, I promise it's the last one :) When using the Closes
tag in patches does it matter which URL is used, either the original or
the duplicate? For example, do these both tags close the issue:

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=325423423423542
Closes: https://lore.kernel.org/not_relevant/msgid-423423423423423423/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

