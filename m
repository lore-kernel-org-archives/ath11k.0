Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14CDCCF9F5
	for <ath11k@archiver.kernel.org>; Thu, 30 Oct 2025 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZpdgEvCqm6CV46udnA+E9Xm6TrN95hBsZbJdk6lSIlM=; b=npZKL+HKB0hvi7/YTPINrc94ad
	K87yEgsgCE0Uiv7j00kSI8ddCaS3VNI5pWyaIU5tHLJLUJuJI2b0kV+LB2lc1UYZednY1w85LqQUD
	VCA9q1YMxR0jTXR1MUxNjrjPQSlPvM36WFeR+H0USBaBREU9hpbkfXWz9O/2ZNzbX+11q53DZAi9M
	Y9ioutWexA2jgHZ1eFCcv1CaEcMoPqoa4p8Eo3DylTTteIdcQFFWix2V3aX6r6ePPCxHGuBK76a2C
	7VsiqyOkEKM0rlsI4OMsL3tlJwuBhg4pIcrENmZnGKMCewDeQucdgyl67WCy7q7kaCYpVdrP1hOP0
	+BzfjyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOaF-00000003ogf-2wzJ;
	Thu, 30 Oct 2025 09:04:39 +0000
Received: from mail.venturio24.pl ([135.125.236.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOaD-00000003ogC-0p6T
	for ath11k@lists.infradead.org;
	Thu, 30 Oct 2025 09:04:38 +0000
Received: by mail.venturio24.pl (Postfix, from userid 1002)
	id 8ADE426D47; Thu, 30 Oct 2025 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturio24.pl;
	s=mail; t=1761814932;
	bh=ZpdgEvCqm6CV46udnA+E9Xm6TrN95hBsZbJdk6lSIlM=;
	h=Date:From:To:Subject:From;
	b=cA4U3p8xBZgeDwS5r4MGdSE/PSo4pQJvV4Qq0e9+q0JX7uJmQBirSpm1zcFWQydoS
	 rPtUw1sWtAPE0F2RVIHeh6TGB0KgUQiV+I6i1TTuH7zvno7x6YD5fq8YVIfouUfYbt
	 7lMMQCtC4rxhGLGOdbeOZjJy3QXu1KC/PGlIgGBjOA9IZhuYa8H69O9yucH7GF0tV2
	 X2NrmZ887AFHQj2yYiuToOiLdb2n+IAbBogWOhLvQQjAp8QMGn8zDqDn8LE3MtCADB
	 qvvCt+jpx0Af+4JEZoW1HPLwcEfWxGvv90lZTzSL76pAxQAXZ5kUI3IR7ySmMiRHxc
	 bBs0ZfhBpTuIw==
Received: by mail.venturio24.pl for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 09:00:45 GMT
Message-ID: <20251030074500-0.1.9l.2a4ch.0.emu36m1g3d@venturio24.pl>
Date: Thu, 30 Oct 2025 09:00:45 GMT
From: =?UTF-8?Q?"Magdalena_Ko=C5=82adczyk"?= <magdalena.koladczyk@venturio24.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Informacja_z_ksi=C4=99gowo=C5=9Bci?=
X-Mailer: mail.venturio24.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_020437_515547_16AACA43 
X-CRM114-Status: UNSURE (   0.66  )
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

prowadz=C4=99 biuro ksi=C4=99gowe, kt=C3=B3re specjalizuje si=C4=99 w obs=
=C5=82udze biznesu Pa=C5=84stwa formatu.

Wraz z zespo=C5=82em zapewniamy wsparcie, kt=C3=B3re wykracza daleko poza=
 samo przygotowanie rozlicze=C5=84 i procesowanie dokumentacji.

Redukujemy do minimum czas i =C5=9Brodki, jakie nasi Klienci przeznaczaj=C4=
=85 na obs=C5=82ug=C4=99 finansowo-ksi=C4=99gow=C4=85 i kadrowo-p=C5=82ac=
ow=C4=85.=20

Z racji mojego do=C5=9Bwiadczenia przy wsp=C3=B3=C5=82pracy z firmami o t=
akim rodzaju dzia=C5=82alno=C5=9Bci, chcia=C5=82abym przedstawi=C4=87 kil=
ka warto=C5=9Bciowych i sprawdzonych rozwi=C4=85za=C5=84.

Czy mo=C5=BCemy porozmawia=C4=87 o obs=C5=82udze Pa=C5=84stwa firmy?


Pozdrawiam
Magdalena Ko=C5=82adczyk

