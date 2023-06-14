Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DA3EB64D9
	for <ath11k@archiver.kernel.org>; Wed, 14 Jun 2023 09:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:
	From:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHtp07fWIcl8iINRwKb6cdPohZVV+hiKD9ALVCFsWP0=; b=4icwC3WQvXOuQw
	4U9VZ+qI3elgY/1C1rJ96w0aNDSRlwZH2l5h8oEUiTuVHamn6cv0TLoy1LWETb3q07R7K6H45qw54
	5zYWz2EtFSRvHeWSFWR72wGxzUbXvr2Z2HoSzD6Sm1ZrMbQ2GkfQgDbMHgaelH3AuFU5hk8yU4eHm
	yerCLj6nr8ULGJy9N0lhvFHHRae1MCAvvpEGjYQ3fSlZnpR4Jl8Pj5D+fFYR7odDn+1vgvz7FvA/f
	cUwZCsou/lnwHfj1TuHmJA8qYNKfHszUuiBSX1SskokvlofxZBiViWNlupIWt64z1S5mxdbY4P4Mj
	0hy4F3lPKJ+hzCM0BEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9MMO-00Az0e-0C;
	Wed, 14 Jun 2023 09:00:12 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9MMK-00AyzV-2F
	for ath11k@lists.infradead.org;
	Wed, 14 Jun 2023 09:00:10 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q9MMH-00050m-OW; Wed, 14 Jun 2023 11:00:05 +0200
Message-ID: <a50dd3e5-fa7f-0d28-697e-42f704eed17a@leemhuis.info>
Date: Wed, 14 Jun 2023 11:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] Bug 217070 - ath11k: QCA6390: Regression on 6.2-rc1
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k <ath11k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>, mani@kernel.org
References: <c7a7e21a-0eac-8e84-aa8e-59ba4116e6af@leemhuis.info>
In-Reply-To: <c7a7e21a-0eac-8e84-aa8e-59ba4116e6af@leemhuis.info>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686733208;d2fe59b5;
X-HE-SMSGID: 1q9MMH-00050m-OW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_020008_874662_B17326E3 
X-CRM114-Status: UNSURE (   6.28  )
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

On 23.02.23 17:01, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217070 :
> [...]

Removing this from the tracking

#regzbot inconclusive: reporter didn't react to inquiries
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
