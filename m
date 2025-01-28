Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034D2C02193
	for <ath11k@archiver.kernel.org>; Tue, 28 Jan 2025 14:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9bpwVlISBxin/SqIv5FFUv6bjnZaSy0bRob50UNEfk=; b=dAFvczZ03u7uoTdmNyZBtKgHkR
	9avMGXWrGdQTNrZwGtSOPvAmUbAyWg4kPTVCb2ZmCcbq1A4QWqxjnbgcJWpZ6G0wwGKI7UGYtFDOk
	aYoVDQo4Wel5t/R9WW2n5CB/CCR9smtedAYlfmX7yKaSK7xJe0vbIXzekG43mSTBdpSY6ChLSjQCO
	TDnyWsCA10TOj6JX/zM+VBTt1m2K6WyHNgGnXk4Rid6WHUQy/YAURXjmAYwkasjwomBmgzpFZ2EN1
	zzp299eJrSFIcH5QT0GImK0T0dMv0Cgp8yo0loY8g7glSA+TLLJok5ixmqbdQJqg3aFMliklp9tC+
	SAY53ahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmOG-000000051n0-1YdJ;
	Tue, 28 Jan 2025 14:16:32 +0000
Received: from syn-024-142-217-070.biz.spectrum.com ([24.142.217.70] helo=smtp.tuxdriver.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcmNO-000000051dA-0v12;
	Tue, 28 Jan 2025 14:15:39 +0000
Received: from syn-024-142-217-066.biz.spectrum.com ([24.142.217.66] helo=linville-x1g7.hq.tuxdriver.com)
	by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.63)
	(envelope-from <linville@tuxdriver.com>)
	id 1tcmKx-0003xb-7J; Tue, 28 Jan 2025 09:13:09 -0500
Message-ID: <e64c416a975d8fcc4e245db78f31b0daef358e89.camel@tuxdriver.com>
Subject: Re: Stepping down as maintainer
From: "John W. Linville" <linville@tuxdriver.com>
To: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Cc: ath12k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath10k@lists.infradead.org, Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 28 Jan 2025 09:13:01 -0500
In-Reply-To: <87wmefguqt.fsf@kernel.org>
References: <87wmefguqt.fsf@kernel.org>
Organization: TuxDriver, Inc.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_061538_364529_E8BD734D 
X-CRM114-Status: GOOD (  10.38  )
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

On Tue, 2025-01-28 at 11:20 +0200, Kalle Valo wrote:
> Hi everyone,
>=20
> I'm stepping down from all my maintainer roles. My first commit

Well, my friend, I suppose the time has come for you to move on to
something else? I truly hope that something exciting and rewarding
awaits you!

You have done a great job in this maintainer role, and I am very
certain that you will be missed. Few people realize how thankless such
a role can be, but I do. I hope you will now have some some time to
enjoy your sauna as you consider what comes next for you.

Thanks for the job you have done.

Terveisin!

John
--=20
John W. Linville	Someday the world will need a hero, and you
linville@tuxdriver.com		might be all we have.=C2=A0=C2=A0Be ready.


