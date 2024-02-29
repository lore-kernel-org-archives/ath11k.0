Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F74C48BF6
	for <ath11k@archiver.kernel.org>; Mon,  4 Mar 2024 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=; b=Y6gAi8orUygvZDnj74YZh2NV4K
	4lygLXNCRBGmY96allkugw78Bpxd828c+9NWDfPZD8XFDO9FMNmVMuSQSCaj6pZg400WFlds1XHln
	Krb4cCBeOFPj+DxhHD278/UWIYJewKQkDWiNgXPsqfed0MfiuxpwYQbWXjpW2hABGJXf9Kq5nCMWl
	h7tvNX1kv5U5GWaVZO026HAastBiroia6C5yEX0IsfHFkFE4+GWphGdrOqjanas2/4qAx/tJf51Mn
	cdKO7OkxTluw2MBJ8tBqwFWBuESqFEbBU9jxRnNGbv742tx7yUkTBQZOR6Fgq5VMTU2yvwEgzgmyU
	RkU9h64w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh7LL-00000008xsD-1Pwq;
	Mon, 04 Mar 2024 12:22:55 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh7LF-00000008xpG-1BCS
	for ath11k@lists.infradead.org;
	Mon, 04 Mar 2024 12:22:52 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id 8EA1627BA8; Thu, 29 Feb 2024 08:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1709197511; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=CI+UQVNQZyhnV3fYGGdMcXq8vyBkkbsqpzmqd0enBuxky/rFm8uUonixipsHyrMjs
	 P/xTlaZgU6ZZm0LDOFIx8b1hxvzFyAixELg3uW1FzKtaxr3w7GzLIzd7P00rid1h0m
	 fotpX+7dV3emqgJNlWUNg3NM9htyH6uYeYrnIvHzGnR7/Vlvc+pRgKrVRO4Ekz26Tk
	 9qyT78xEv0bWIbnezWknR2gHM2by/gprICAWk/XCKmYs9TW1UgTH0OImHoXrwrO3p1
	 DzFv17E2Xe3v5h7B5yfSpsk/rlL7a3sIoORfanbBXzoT8rjN2Urz1YU7MDB5lkxi8f
	 j97K3GzIt6p9Q==
Received: by mail.thrivehub.pl for <ath11k@lists.infradead.org>; Thu, 29 Feb 2024 08:46:03 GMT
Message-ID: <20240229074500-0.1.4x.25ypz.0.e6ph0hn3l9@thrivehub.pl>
Date: Thu, 29 Feb 2024 08:46:03 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <ath11k@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_042250_179443_E8925ECA 
X-CRM114-Status: UNSURE (   1.28  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Dzie=C5=84 dobry,

Pozwoli=C5=82em sobie na kontakt, poniewa=C5=BC jestem zainteresowany wer=
yfikacj=C4=85 mo=C5=BCliwo=C5=9Bci nawi=C4=85zania wsp=C3=B3=C5=82pracy.

Wspieramy firmy w pozyskiwaniu nowych klient=C3=B3w biznesowych.

Czy mo=C5=BCemy porozmawia=C4=87 w celu przedstawienia szczeg=C3=B3=C5=82=
owych informacji?=20


Pozdrawiam
Szymon Jankowski

