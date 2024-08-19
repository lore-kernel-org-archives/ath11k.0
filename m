Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF77C3DA4A
	for <ath11k@archiver.kernel.org>; Mon, 19 Aug 2024 07:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HDodNtmiQ0oQNph7sp+h4NRbkxw8d1NmRLmJ4HyiCoQ=; b=Lb0X+209arfikKuNCklSbso3f1
	rh+OeS/ThdAp15pTYgwyPscAlc9oT3YCggkVEj6oLHUFnIcM2JBlkY2+qQzieorex2q/PzCjc6tkN
	f7E8QpXGrKEN+Y841CJe0JVtH2Enb68iPPrO2QmR6Jn02Gj8g/CIIFozEVfG8M70WHlilBrdl4kIW
	FBUhZ/5TxrX8znpDNwD+SaIFfySZp5udWl5xk+MH5JUsryUkKOJa3CVpXYBBw5cuV1jj9q2rHaz6K
	IulU2L/2qoHRZQ9Bh+Nq6eCvDcpX18VAkPsm9ZLl20Jqgptul2UqIoVgSYaJLe5DCU3SY+uWlMCLw
	D14FpFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfx7V-00000000gQX-0LD2;
	Mon, 19 Aug 2024 07:48:05 +0000
Received: from mail.originatepro.pl ([162.19.155.125])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfx7R-00000000gPx-2VCw
	for ath11k@lists.infradead.org;
	Mon, 19 Aug 2024 07:48:03 +0000
Received: by mail.OriginatePro.pl (Postfix, from userid 1002)
	id 1EDEC232C8; Mon, 19 Aug 2024 09:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=OriginatePro.pl;
	s=mail; t=1724053675;
	bh=HDodNtmiQ0oQNph7sp+h4NRbkxw8d1NmRLmJ4HyiCoQ=;
	h=Date:From:To:Subject:From;
	b=VEOSicPfCoobBUQGpcZkvt7cDzQghcU4QrXfZtpJnSd1L493Grz3p9i8eor5AYeFy
	 vDrTrDryL50zYHw8OKeB79PbzGSw2wEjez01sXdMoPZL9OEkNTFj9em/uLdgealYyf
	 SVFSf7e5EPmug4hMUNX/151us6GGSYJN9zAHC31xOtu63Pe2bXaZe9AbSMvRQ/LeWr
	 GIo178p5TWblpJv7HY9+ZHArs7h7RPGMWJrfcx56bHxcCsrZx5AvxtDr918xsjZ3bC
	 J5Nh+Ag0K1abkzUW4+6lj/lB/uU6SHTi2gtf7FU9/FlZ7lf2iXi/XcSZoqKW2lAg35
	 26KVI2GGF88Eg==
Received: by mail.OriginatePro.pl for <ath11k@lists.infradead.org>; Mon, 19 Aug 2024 07:46:03 GMT
Message-ID: <20240819084500-0.1.dh.1uj8g.0.ppk1m4664g@OriginatePro.pl>
Date: Mon, 19 Aug 2024 07:46:03 GMT
From: "Marcin Wojciechowski" <marcin.wojciechowski@originatepro.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Zam=C3=B3wienie_?=
X-Mailer: mail.OriginatePro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_004802_334582_A117516E 
X-CRM114-Status: UNSURE (   0.82  )
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

Witam,

Czy potrzebuj=C4=85 Pa=C5=84stwo aktualnie nowych klient=C3=B3w B2B?

Od 10 lat pomagamy pozyskiwa=C4=87 nowych partner=C3=B3w biznesowych w Po=
lsce oraz za granic=C4=85.

Ponad 3000 zrealizowanych projekt=C3=B3w zar=C3=B3wno dla najwi=C4=99kszy=
ch globalnych korporacji, polskich sp=C3=B3=C5=82ek gie=C5=82dowych czy t=
e=C5=BC niewielkich dzia=C5=82alno=C5=9Bci gospodarczych sprawia, =C5=BCe=
 jeste=C5=9Bmy jednym z lider=C3=B3w bran=C5=BCy.

Z wieloma firmami wsp=C3=B3=C5=82pracujemy nieprzerwanie od wielu lat, ge=
neruj=C4=85c stopy zwrot=C3=B3w si=C4=99gaj=C4=85ce tysi=C4=99cy punkt=C3=
=B3w procentowych, pomagaj=C4=85c jednocze=C5=9Bnie w spos=C3=B3b powtarz=
alny oraz policzalny poszerza=C4=87 portfele klient=C3=B3w biznesowych.

Je=C5=9Bli maj=C4=85 Pa=C5=84stwo przestrze=C5=84 na obs=C5=82ug=C4=99 no=
wych klient=C3=B3w, zapraszam do kontaktu zwrotnego. =20


Pozdrawiam
Marcin Wojciechowski

