Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F02C25B7E
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qd0cadaoIS5SXjI7TTyWX+nfdP+T59PeEsVnDby0odM=; b=ecAveg8j+tBSzIBbvwEiahG0pI
	VvsyaeJAWFb9mypyxbiTGYJEclA/H+UWCi5v5N5ZE0Uj36SkctYCBDcq1y7nSrzJLUMXh3VbWYzFc
	w11TQ6tswP0MDOXthq1p1FIgX7VCRfpknR2twJ+wYykpCR/jDlbCVnW2ZYAkLdw246SXYXi8eEVSr
	UicbRs6bHrSLvkgzUzLXwI45i7WWMoDes5g0b0hd+MCbnEhXd+ErErnUkPfQT/Fc5J/q9fDPV7fa9
	xZJDFFcwMwDsTs66LFgDficLrEPq4FAOpGjRMvgVs9NpYJelnb8npmdm67FVmr7ZL67WvjrtklF1p
	lhAlrJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEP21-00000001asI-2T6e;
	Tue, 04 Jun 2024 07:56:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEP1x-00000001apt-1ocK
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 07:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96A3B61219;
	Tue,  4 Jun 2024 07:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD18C2BBFC;
	Tue,  4 Jun 2024 07:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717487788;
	bh=Qd0cadaoIS5SXjI7TTyWX+nfdP+T59PeEsVnDby0odM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=agLe36oPivV/JRQIp87oGeRdgd1TtE6xmjfXV5vCD2eH4shcZCQ4NRwnol6S2bWiu
	 tBnFn51SDkgVwPCZ5Dh4+2zVCZKUwK0f0Wb9D+Hpymd1BWVJ+O8n8Fxpi9YB9YMKmd
	 fdCtgHPXGomyE2jHGhVRNxSCiFlW9+wNtSycuAsJL/mTG9A62lM0KI+8PRv2v7hqpr
	 62anxScZ2+3OcT8GiABuUsrQVa+xN4h/mV9HZPL2rcoESuQbS+9w7qDEwmnMnTHYkk
	 4ER3mIhGU9EkZ+3HWXhtqQxhcQBW+hy5L3wXiiCQQFjMymGy4SpI4fdWMs7rA0BSVX
	 Ia4aSE16DkVdQ==
From: Kalle Valo <kvalo@kernel.org>
To: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org
Subject: Re: wcn6855 2.1 - slow download speed on any pairwise cipher except
 CCMP
References: <CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com>
	<19778bfe-19ad-4ee4-8f3b-80e7b124571f@quicinc.com>
	<7cd963ba-e4b0-4714-a814-983434589059@quicinc.com>
	<CADS+iDWeb39_FQQg2j6bk05BV73pOU=Ck+uBadeg+3Nnc6sKiA@mail.gmail.com>
	<CADS+iDUr=kVumMdBAU-AcaE-Q9TPN4K3dCe1C4KW2tqs7ziBKw@mail.gmail.com>
	<f736206e-b3bf-4a78-8ad3-262f6e1f4507@quicinc.com>
	<CADS+iDW+urkeQDuZYYVDsEg=WNGoq5PomAmg1dRLPySPM=2SUg@mail.gmail.com>
	<6b439fca-01a3-4a00-b542-26552dd30874@quicinc.com>
	<CADS+iDU4gq5iCyYwcNX8DC8=FSyViK4=X+UJMuCtYtBP_-u_UA@mail.gmail.com>
Date: Tue, 04 Jun 2024 10:56:25 +0300
In-Reply-To: <CADS+iDU4gq5iCyYwcNX8DC8=FSyViK4=X+UJMuCtYtBP_-u_UA@mail.gmail.com>
	(Yaroslav Isakov's message of "Tue, 4 Jun 2024 09:26:49 +0200")
Message-ID: <87o78hta3a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_005629_598693_89736557 
X-CRM114-Status: GOOD (  13.94  )
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

Yaroslav Isakov <yaroslav.isakov@gmail.com> writes:

> =D0=B2=D1=82, 4 =D0=B8=D1=8E=D0=BD. 2024=E2=80=AF=D0=B3. =D0=B2 03:55, Ba=
ochen Qiang <quic_bqiang@quicinc.com>:
>
>> On 6/4/2024 5:29 AM, Yaroslav Isakov wrote:
>> > Hello! Thank you for patch! I tried to apply this patch on top of 6.9.=
3,
>> > but it failed to apply - what kernel version should I use, to test it?
>> >
>> That patch is based on ath-202405301555 tag of Kalle's ath.git:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/
>>
>> but I suppose it could also be applied cleanly on ToT of ath.git.
>
> Actually, it seems that when I was copying patch from patchwork,
> something went wrong. I properly downloaded it, and it applied (with
> few hunks) on top of 6.9.3. After rebuilding currently running kernel,
> and reloading driver - GCMP-256 finally started showing same speeds on
> download as on upload! Looks like the issue is fixed, thank you a lot!

Great work, Baochen!

Yaroslav, would you mind providing your Tested-by tag? That way your
work is also properly attributed in the patch. This is of course
optional.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

