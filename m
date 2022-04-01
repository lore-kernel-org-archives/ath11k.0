Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BCEC433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 05:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9U5U1B9FgF9itPktp0MdWCwg8XQFLMRS7NR/KIKFnk=; b=oaGlq0zol94gWb
	kXYlzdGcE+Pg11uBqayDax5bqEi4P7MRnvbQ8l8zXK2J/IUHcktMOgy9vtpgwwA1CyzyBuw2MxDH6
	sqdEgdxT14sCQj13g1Sw40eQhteHUSxCBA+nlPlVvxIh0BUUDm2Mtg0Q4D62Yn/jRZ92+yzI+Mj9A
	jXPggATV8xx5Klt8amPixuTyP5eOQM/yInpS6+lLrJgI4mCpGCz+nszmJGWWSH9d37nVtlLIrknnJ
	tE3XqvJecpZDmqe6A+X+37LkKd1sG9MbPS9P03Ns+IWeIW1aPeGF3f/Nql9DceH0eSejBz1UtayYt
	1Qt1krDnprJUWvq0Uwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naA7g-004adf-5m; Fri, 01 Apr 2022 05:47:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naA7d-004acv-E5
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 05:46:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FC25B82376;
 Fri,  1 Apr 2022 05:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40B6C2BBE4;
 Fri,  1 Apr 2022 05:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648792014;
 bh=Yi1ww34V/4lgByjz2wZL+Sp/2Eq+U8FYc9kImdBmQhk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Q5cRatCHYoDPG3EspBtGpM5PCM3Qh0jt+DVc2W3lk03RVN1WIEe17W6tvMq4w9eRz
 72EpAfCfc2RR08D6YA21ihQzYZbh2X6vQY7Usl/YB6LaRMX5rZ9Qe+pIoGzCcob5bx
 ctflp7Em36ki1ZbVRo9O2Ss1rip//4KqvgcBMDS7436tPmmq3uHg93TFILfVSLaE+b
 hbrtfLA65qQY3vLqx4YLSjOQDjT4dSERj2t/E31ToNJVVf3bsp/8n3Vd+F2E1aaQgK
 Q7GtQuBzxWDN0c307tvHP40wOrbBWzA2YrXymT6DQW1S0SYBq2YIKVJBLfT40+8qRy
 9bdT6fY0jcQ0g==
From: Kalle Valo <kvalo@kernel.org>
To: "Nagarajan Maran \(QUIC\)" <quic_nmaran@quicinc.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
In-Reply-To: <MW2PR02MB3899E0AF9C08EDF0F9CE1E52EDE19@MW2PR02MB3899.namprd02.prod.outlook.com>
 (Nagarajan Maran's message of "Thu, 31 Mar 2022 16:37:35 +0000")
References: <20220331073110.3846-1-quic_nmaran@quicinc.com>
 <87sfqyv1td.fsf@kernel.org>
 <2f25bb87e665488b30f6fdaa5877ad8b5b19da0a.camel@sipsolutions.net>
 <MW2PR02MB3899E0AF9C08EDF0F9CE1E52EDE19@MW2PR02MB3899.namprd02.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Fri, 01 Apr 2022 08:46:49 +0300
Message-ID: <87mth5uzhy.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_224657_669434_3EC475E4 
X-CRM114-Status: GOOD (  11.40  )
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

"Nagarajan Maran (QUIC)" <quic_nmaran@quicinc.com> writes:

> -----Original Message-----
> From: Johannes Berg <johannes@sipsolutions.net> 
> Sent: Thursday, March 31, 2022 5:29 PM
> To: Kalle Valo <kvalo@kernel.org>; Nagarajan Maran (QUIC) <quic_nmaran@quicinc.com>
> Cc: ath11k@lists.infradead.org; linux-wireless@vger.kernel.org
> Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure
> with WoW unsupported hw
>
> On Thu, 2022-03-31 at 13:44 +0300, Kalle Valo wrote:
>> > 
>> > Fixes: ba9177fcef21 ("Add basic WoW functionalities")
>> 
>> Fixes tag is wrong, it should be:
>> 
>> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
>> 
>
> $ git config --global --add alias.fixes 'show -q --format=fixes'
> $ git config --global --add pretty.fixes 'Fixes: %h ("%s")'
> $ git config --global --add core.abbrev 12 $ git fixes ba9177fcef21
> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
>
> :)
>
> Johannes
>
> Thank you for the commands.

Please use '> ' in your quotation, otherwise your replies are hard to
read. See item 5 here:

http://www.infradead.org/~dwmw2/email.html

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
