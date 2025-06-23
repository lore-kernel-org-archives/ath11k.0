Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1E2C7115D
	for <ath11k@archiver.kernel.org>; Mon, 23 Jun 2025 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/VWuu91p9z70l5DLoCEVoIC3JL45iKaV1r4mCkdy8Lo=; b=D42iQW+Xo75q6NEwVSZP4Ccpns
	3HGtI0JKyfuOEPrbGES8u4zghWNv+qCZ0rmXhE4ljvpUXhEWJQUdGj+ZF9b8jy/yfL2sLzpPHyB/i
	TXeEZ28o3KH2eDtHN+aUc679sUKVPCUuf4sQMgTu+WB9qz+1AlJhoWLmDUWgSgwCGZC9wjnu9Rz45
	o5vaZ+JOmRIpe8weCdaXplKS2Dd25YNTRZ1X9Bc6eFOrL8tLfN+jtAx35r3Qd/gB2tfoGjJhUMmqe
	vglMHH496adDNpWeqFruB7NFboVt7bzaRPLDwksrz4yfH39toKCi2frcgePe2XFElKY3piUQufkkK
	xtALUV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTc52-00000001wMF-2EBM;
	Mon, 23 Jun 2025 07:59:04 +0000
Received: from mail.bizvista.pl ([135.125.236.103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTboM-00000001tiV-1Dga
	for ath11k@lists.infradead.org;
	Mon, 23 Jun 2025 07:41:52 +0000
Received: by mail.bizvista.pl (Postfix, from userid 1002)
	id C781E493CC; Mon, 23 Jun 2025 09:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizvista.pl; s=mail;
	t=1750664504; bh=/VWuu91p9z70l5DLoCEVoIC3JL45iKaV1r4mCkdy8Lo=;
	h=Date:From:To:Subject:From;
	b=wCuv9GXwT3TzF+dUzaASTYvETo0SQLbZg/L/EgImI0XlN+keP6kf9nYuuMovWw3Ba
	 WeGmMT1DewHyYH9BTm5bJ9lqAaRDuNKAWdmo6p901ErDutlRdFYSMpTteBLMu9LHsp
	 Fvl+pNSAs/nLVwNaEOjee+cfbUkjr6IN/numPdj4c6ebQA2/D820k5J+oRzauPpsdV
	 WpUxwo1i14cCmcvUN8tHIQI0keVMoHP83u/ruBigtBFH9y4yXkW7IcjmfvFhlK4ct1
	 nE7XwKFEZ36JU2z7fSfTMwo9ZVAWyjIq14LtIOaZAH5YUJZ8tGYolOh+4pxHkUAonj
	 lOe4c8j+rfYQQ==
Received: by mail.bizvista.pl for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 07:40:36 GMT
Message-ID: <20250623084500-0.1.a0.rppw.0.m25l35qh65@bizvista.pl>
Date: Mon, 23 Jun 2025 07:40:36 GMT
From: =?UTF-8?Q?"=C5=81ucja_Grabowska"?= <lucja.grabowska@bizvista.pl>
To: <ath11k@lists.infradead.org>
Subject: Pakiet telemedyczny 
X-Mailer: mail.bizvista.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_004151_037231_F284FFD2 
X-CRM114-Status: UNSURE (  -0.21  )
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

Szanowni Pa=C5=84stwo,

chcia=C5=82abym przedstawi=C4=87 Pa=C5=84stwu kompleksowy program wsparci=
a dla pracownik=C3=B3w, kt=C3=B3ry przynosi wymierne korzy=C5=9Bci biznes=
owe.

Oferujemy nielimitowany dost=C4=99p do konsultacji z lekarzami ponad 30 s=
pecjalizacji, od pediatrii przez neurologi=C4=99, po psychologi=C4=99 i o=
rtopedi=C4=99. Przygotowali=C5=9Bmy zr=C3=B3=C5=BCnicowane pakiety medycz=
ne, kt=C3=B3re doskonale wpisuj=C4=85 si=C4=99 w indywidualne potrzeby ka=
=C5=BCdej organizacji.=20

Pracodawca zyskuje zmotywowany zesp=C3=B3=C5=82, znacz=C4=85ce ograniczen=
ie zwolnie=C5=84 lekarskich oraz urlop=C3=B3w oraz realn=C4=85 optymaliza=
cj=C4=99 koszt=C3=B3w zwi=C4=85zanych z opiek=C4=85 zdrowotn=C4=85. Praco=
wnicy natomiast otrzymuj=C4=85 cenny benefit, kt=C3=B3ry sprawia, =C5=BCe=
 czuj=C4=85 si=C4=99 doceniani i zadbani.

Czy chcieliby Pa=C5=84stwo pozna=C4=87 szczeg=C3=B3=C5=82y naszych rozwi=C4=
=85za=C5=84?


Pozdrawiam
=C5=81ucja Grabowska

