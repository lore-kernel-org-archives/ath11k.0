Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E296CAC5B5
	for <ath11k@archiver.kernel.org>; Mon, 29 Sep 2025 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OTY0q1dF1hxkKanCoXduiOyfLv/Fj7E83GsB52zxnmQ=; b=tA2GBiASVBJ4XocGZ8MpA4XEGS
	FwK3+elWRRHfyIJSXQ9yqhsK9r/YXNJpC1WoihmfpOfhTFqpKkI5XmA41AI6mOs9M/LFjKpp1hPx5
	BiQJ+vxAFW/MrDul7dvNgR1i2zwNVpjJajlADhZRv92PvX/C4zXZUczAnndXJaS7DYfTT9egKdNPJ
	ojg5iNG7c1nMls5hzvf4behT5J9LOx5DBMMPIcX3PPT7CQP9Y45LaznPuztvG70cml4ek+6AH2fuK
	cE5BFZM2aJFUKWTz/WWIZu9PLeqKMFlgAK5/aQnTlzU50cOfM4EJPUFq9r3QXRRnHMwDP2bqUPM7K
	yRu9/gsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38jW-00000001hDS-1YOh;
	Mon, 29 Sep 2025 07:55:42 +0000
Received: from mail.capitalivo.com ([162.19.205.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38jU-00000001hBt-2IUE
	for ath11k@lists.infradead.org;
	Mon, 29 Sep 2025 07:55:41 +0000
Received: by mail.capitalivo.com (Postfix, from userid 1002)
	id 4C3944422D; Mon, 29 Sep 2025 09:55:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=capitalivo.com;
	s=mail; t=1759132538;
	bh=OTY0q1dF1hxkKanCoXduiOyfLv/Fj7E83GsB52zxnmQ=;
	h=Date:From:To:Subject:From;
	b=LTs1PoOA+L1gksvdALqGgQb+hKA4Wamu3dc11X8/fbjZRsgNNl0cYkZMTAqiKWpHh
	 UJtwdM7/5pOpp5lXHB6eUv0GzW9Os6hwAZW9g7FnutUG380kwDe+a4VE0dG5AyO000
	 +xrA0MVeRdJmEbeiT6orORu1Vv/rs57KfPXqT2Lmh2quUVQ/lVEtN9NaoJVyynGZnr
	 HRr8ONhNNJQ3BVpmT0a7hfCh/gQ+BOuJg0Wef0RWQv3DZ36jZYlw8zm5HalF2Gt8a1
	 xTbINKTCntpxyXrjg5t19NraBGcK6OrRlGKH+4is7sdSItRFp90VRuPZhQeGzvuI4B
	 gac4abAargvBA==
Received: by mail.capitalivo.com for <ath11k@lists.infradead.org>; Mon, 29 Sep 2025 07:55:37 GMT
Message-ID: <20250929084502-0.1.ij.1m1xx.0.0bizfi0m3j@capitalivo.com>
Date: Mon, 29 Sep 2025 07:55:37 GMT
From: "Konrad Fajgiel" <konrad.fajgiel@capitalivo.com>
To: <ath11k@lists.infradead.org>
Subject: Zwolnienie z CIT/PIT
X-Mailer: mail.capitalivo.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_005540_739488_3B4EF6BE 
X-CRM114-Status: UNSURE (   0.49  )
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
Konrad Fajgiel

