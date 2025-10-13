Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861FCCCD185
	for <ath11k@archiver.kernel.org>; Mon, 13 Oct 2025 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b4Y/uED+WyLuT2rTeGzzQXSKSDM/RGK4Ds0Afwjv4gw=; b=3yvpu4Hv0fy4+wzMy/aEMUw0/L
	Z5PukH5xW8YkTgTKcJpEc5E1o0w2syCL1MVYC/V9Lr/N1/eGZkAWKVKS2fLM47DGggpINUdZxLRFn
	si+Gb+beCZSK+LrGUQX4lpG8uUkdYvgjwvo1szUJ2Dz4PSoPt0FlXnb9UYzyohFGG0sHv4aPg0cOb
	OllPoxHd4PEwgYiQTq5+IHy0KlV+7POouf2ifyWOwkoASoW5p1nhaDO6g4QIsz/scPEIB2d1jucgD
	wgQvnpsefwn9zFYNWKceMJ6S0kF3/gh+wqIlHAgXy6SFDQ8cKFm1YoJZKAwaM0v9hNV4XC0XG1Pas
	00TpPNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DeW-0000000CZJV-21Oo;
	Mon, 13 Oct 2025 08:11:32 +0000
Received: from mail.bizoster.pl ([141.94.21.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DeU-0000000CZId-2RwD
	for ath11k@lists.infradead.org;
	Mon, 13 Oct 2025 08:11:31 +0000
Received: by mail.bizoster.pl (Postfix, from userid 1002)
	id 5715A4C49D; Mon, 13 Oct 2025 10:10:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizoster.pl; s=mail;
	t=1760343086; bh=b4Y/uED+WyLuT2rTeGzzQXSKSDM/RGK4Ds0Afwjv4gw=;
	h=Date:From:To:Subject:From;
	b=mERf1d8K6rvrxOX0FCSol3/TsbBOWO0SnuJEvXlCV8xP8JtaJy6t9YI8uh5GLyyyV
	 Xzl5lJyyEXPacIFaWnb3daIC9dK2yARfZWmSXLNRrVLoN5N8xqOrKrEz/CYhAzeMfB
	 O1PRQsStnudePkYzElUPDHZB7xRgdwpnKjpKJITjpHiqHZujAU7nXE/TfgXSqADs1P
	 zkD5s6mXdOIAg6qI++HKa9BhrAdV4dUeBye47z2v+9VcVDVjINjL/7CTDPZSkeEX6A
	 7m2eeCgVqp3g1PruFPKDNjnFxmORLrfmR+diNXsR3qWq+HA30PVoXQjAO/2n5cX1qq
	 e5Ji3cgkLbTmw==
Received: by mail.bizoster.pl for <ath11k@lists.infradead.org>; Mon, 13 Oct 2025 08:10:34 GMT
Message-ID: <20251013084500-0.1.gd.5by4g.0.1o2hyr29pu@bizoster.pl>
Date: Mon, 13 Oct 2025 08:10:34 GMT
From: =?UTF-8?Q?"Tomasz_Bia=C5=82ek"?= <tomasz.bialek@bizoster.pl>
To: <ath11k@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.bizoster.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_011130_913329_7F3F2AE5 
X-CRM114-Status: UNSURE (  -0.18  )
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
owych informacji?


Pozdrawiam
Tomasz Bia=C5=82ek

