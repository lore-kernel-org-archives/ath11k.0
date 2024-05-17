Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82512C04FFE
	for <ath11k@archiver.kernel.org>; Fri, 17 May 2024 06:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g950LNR8tFR9TBwlOx9w9TDBT5UMfzV59UR2knY+mS8=; b=mqiAT+ZJ+NGN80JocQYPBp1YY0
	sSAtboxMG4n0gYipAoEa23Uu02sPFOk9HXtYbx0hHIU+/Y7GnyG2RcmpikI3DmZwS3K0SjTj+lByG
	ypovE8qGskrJNRJjftLwB90gRr2zBUx/ovJGz/5fdaawvK0n/hgqp+HTDfP9vFQOc2GofGOHOqteO
	DLfgd4iCT1fmSc5KJ5if6rCsQAAdvLh82WBDWAvdjv6xRrYjfWL8fpEYOqnx9SrNdae/2pS0M46pJ
	1QJyz2tM6bXNleMaU2IUiSnabVurZHl7kztvJJIKEJvK4QVnDCkgTeINkzneY8rnmIDfZmC4zt72f
	Xo2+0rOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7qhn-00000006uUa-3i3u;
	Fri, 17 May 2024 06:04:35 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7qhk-00000006uTz-1MMU
	for ath11k@lists.infradead.org;
	Fri, 17 May 2024 06:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=g950LNR8tFR9TBwlOx9w9TDBT5UMfzV59UR2knY+mS8=; t=1715925872;
	x=1716357872; b=N51FRbPe3Mqitt/baeN4ZwG4XkJ49fzKNe9WFQX7b7qdKk2FrtNEeNO1wTZkm
	UxJxAGebH6s16ZmoFivTDL+zpxil5tXEpvJ0arx/HwtBNah2c6ZHh6PoAARA2gKBZQWfrINr9pmV0
	RbtNnyM9CtJVnXt0lZ0UKMF+29x1T817TQhnvVlHSK/8X0ENfFClJZVVvlemEITyKWSVQkN1DhxgF
	vRpNMt7xZkKw7zo7F5GGs8VuueGhaZGzf3RIylCTFCtJ39lyHWuM3WcbRS9C3FFDkLrLeMmvJiQzQ
	9PHEZe3Rf4qyznG7CfGhZY3MCfOkxirNmA5o2LXzx58ntD9NHw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s7qhe-0001eR-J3; Fri, 17 May 2024 08:04:26 +0200
Message-ID: <613ecd58-9f65-4d03-98df-40f3959376d6@leemhuis.info>
Date: Fri, 17 May 2024 08:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Carl Huang <quic_cjhuang@quicinc.com>, Luca Weiss
 <luca.weiss@fairphone.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20230714023801.2621802-1-quic_cjhuang@quicinc.com>
 <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
 <D15TIIDIIESY.D1EKKJLZINMA@fairphone.com> <87jzk2km0g.fsf@kernel.org>
 <93c15c59-f24c-4472-ae7e-969fd1e3bfec@quicinc.com>
 <871q69lqh5.fsf@kernel.org>
 <4e21e556-527f-4d1e-aa29-cacec14155af@quicinc.com>
 <a53e2188-b982-44b7-9dfe-f5dfd6b802ca@leemhuis.info>
 <4d72f74a-b2eb-43d3-92a2-1311081ce72c@quicinc.com>
 <87fruhggcw.fsf@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <87fruhggcw.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715925872;e28e26e5;
X-HE-SMSGID: 1s7qhe-0001eR-J3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_230432_550235_88686567 
X-CRM114-Status: GOOD (  14.49  )
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

On 17.05.24 07:25, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
> 
>> On 5/16/2024 4:45 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 11.05.24 05:12, Carl Huang wrote:
>>>> I'll send out the formal patch next week.
>>>
>>> Hmmm, from here it looks like this did not happen. Did I miss something,
>>> is there some reason to reevaluate things again, or did this maybe
>>> simply fall through the cracks?
>>
>> Formal patch is still under internal review
> 
> BTW I'm also experimenting with regzbot to help me track regressions in
> wireless and to avoid missing important fixes.

Not sure, but I tend to think that's still too early; better wait a few
more months.

> Thorsten, I don't know if you take wishes but it would be nice to have
> in regzbot some kind of filtering per subsystem or label. Maybe
> something like this:
> https://linux-regtracking.leemhuis.info/regzbot/mainline/?subsystem=wireless
> 
> And then a have command for regzbot setting the subsystem (or a label).
> That way I could easily see only the wireless related regressions, now
> it's harder to find them from the list.

I listen to wishes, but in this case the idea is not new: exactly
something like this is pretty high on my todo list. But there are still
two other things on top of it and requires some major reworks; and I
currently also don't find much time to work on the code. :-/ But sooner
or later I'll get there!

Ciao, Thorsten


