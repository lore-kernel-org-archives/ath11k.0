Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE4C83030
	for <ath11k@archiver.kernel.org>; Fri,  4 Jul 2025 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XovEHYJMgD3+J8DbCvpecii1AaOK4XXpFghJ/RCHl+Q=; b=t7z9KOdYIH8PEvQ5Mz2mVQe1NW
	9YlYo3IZOzWK4nrrhx0QhLAhuYaL6oOWMkqYMPmcUhey2BEhcgScM0trxBg2De6993IAoJGL7i7dP
	RYjmsqmolPqajHQ3Jndxh8t+jGks/2K8O+tpKq+ZnyWGFCIxJR7hKZGZ4OBWjJwoCCyJZntDXuOfB
	waro4vMh4bUbabfg7yO6RxrBep0j1fcsnR9+U1rLdQT+3QIXInEOLPXBrMTWZQj3E209ig/BEtGux
	J/3L5N7bWUfVZt001FUzXuood1KqAqVpVso1CBsKDJqD6+IYKNk7Wj9qsuDAM5+FPZ0I/wZ1PngPT
	cyTlRIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbCm-0000000Dccb-2bWA;
	Fri, 04 Jul 2025 07:51:32 +0000
Received: from mail.formbizup.com ([51.195.200.90])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbCj-0000000Dcc7-1rLB
	for ath11k@lists.infradead.org;
	Fri, 04 Jul 2025 07:51:31 +0000
Received: by mail.formbizup.com (Postfix, from userid 1002)
	id 019A94F990; Fri,  4 Jul 2025 09:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=formbizup.com;
	s=mail; t=1751615468;
	bh=XovEHYJMgD3+J8DbCvpecii1AaOK4XXpFghJ/RCHl+Q=;
	h=Date:From:To:Subject:From;
	b=fOdKp414WIMtxfqslmFiTMEoX5S6SyZvFEBbS5CMZmXHhiVzPee8wxSa8UXEvkgUF
	 hq5ILyoV9iF3v89KrWZntVB08LqRkmtudtW4ugi/9HGyL7HPHnXYnkb66yfmItWfQ9
	 Vsf0lBUzCG9ALwq5qDQDR6kye36oI1LfFT4Opa7JxVc67Rb4ure2ksmWeB/vVcHhL3
	 Dbx0TkUzE3j5BcWC5znZXvRAXmzmNNhxPOFnUwI9ja+V0s8KJgPHeaFy4qmZvBaxWX
	 cXq6iYu8h7HawzCg/rBBNIF9mcsTjiNGsF/kOkREar3UfxbdmacLbIAx0YO+pVY/pF
	 2HOTx+6B/KjCg==
Received: by mail.formbizup.com for <ath11k@lists.infradead.org>; Fri,  4 Jul 2025 07:50:25 GMT
Message-ID: <20250704084500-0.1.9z.x6zc.0.bti8qei6f7@formbizup.com>
Date: Fri,  4 Jul 2025 07:50:25 GMT
From: "Tomasz Gajdek" <tomasz.gajdek@formbizup.com>
To: <ath11k@lists.infradead.org>
Subject: Zwolnienie z CIT/PIT
X-Mailer: mail.formbizup.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005130_156691_1EE6B637 
X-CRM114-Status: UNSURE (   0.42  )
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

Drodzy Przedsi=C4=99biorcy,

pojawi=C5=82a si=C4=99 wyj=C4=85tkowa okazja na znacz=C4=85ce wsparcie ro=
zwoju Pa=C5=84stwa firmy dzi=C4=99ki mo=C5=BCliwo=C5=9Bci uzyskania dofin=
ansowania m.in. w ramach Polskiej Strefy Inwestycji (PSI).

Mowa o programie, kt=C3=B3ry mo=C5=BCe pokry=C4=87 a=C5=BC 70% koszt=C3=B3=
w inwestycji. Dofinansowanie obejmuje szeroki zakres projekt=C3=B3w =E2=80=
=93 od zakupu nowoczesnych maszyn i linii produkcyjnych, budowy hal, prze=
z instalacje OZE, po specjalistyczne oprogramowanie.

Gwarantujemy b=C5=82yskawiczn=C4=85 decyzj=C4=99 o przyznaniu =C5=9Brodk=C3=
=B3w =E2=80=93 ju=C5=BC w ci=C4=85gu 30 dni, a nasze do=C5=9Bwiadczenie p=
ozwala nam osi=C4=85ga=C4=87 nawet 100% skuteczno=C5=9Bci w pozyskiwaniu =
wsparcia.=20

Nasi eksperci pomog=C4=85 Pa=C5=84stwu przygotowa=C4=87 optymalny plan in=
westycyjny, maksymalizuj=C4=85cy korzy=C5=9Bci z programu.

Bior=C4=85c pod uwag=C4=99 rosn=C4=85ce zainteresowanie, zach=C4=99camy d=
o jak najszybszego rozpocz=C4=99cia rozm=C3=B3w. Czy mog=C4=99 przedstawi=
=C4=87 szczeg=C3=B3=C5=82y programu i mo=C5=BCliwo=C5=9Bci wsparcia dla P=
a=C5=84stwa firmy?


Pozdrawiam
Tomasz Gajdek

