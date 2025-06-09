Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D51C5B552
	for <ath11k@archiver.kernel.org>; Mon,  9 Jun 2025 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0lGOUszO1HHuW6h/fE87VEubJ5y5ty66F2oHqPbhbco=; b=nSYj1sijsr/qXQSaQVcEdIrFAP
	4XckwKQBZQJvq1f15Pui00xFYva74bmQZ+rVdE3/1uq/wE1FLMEwEjcVCCarSwWQU8pvmsLYwPbGJ
	r7NNc86Z0CvzPgUHSUTwTfdny7/5nLLcGUlxZ1WO9LTsYp40J5YCSEVVySEElFjP+9MQy0weAINpL
	JeIA5dq+3FgKJFYaAjZvjXCpXW/yR2PQly8wdJnH2vnstvRT/fd9BDirsenMEIaHanauw4UlFfe7W
	1jSjABkilay8jikmFksaMecTeZbBeaF0ZvamCeDETcmQlA9jQgWtjxX+DaVx5Q86kmttHsNGecthK
	c0Oa5vMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXjj-00000003efb-18cx;
	Mon, 09 Jun 2025 08:20:07 +0000
Received: from mail.bizial.pl ([141.94.21.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXjB-00000003edj-1RT2
	for ath11k@lists.infradead.org;
	Mon, 09 Jun 2025 08:19:34 +0000
Received: by mail.bizial.pl (Postfix, from userid 1002)
	id CC68821BFF; Mon,  9 Jun 2025 10:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizial.pl; s=mail;
	t=1749456708; bh=0lGOUszO1HHuW6h/fE87VEubJ5y5ty66F2oHqPbhbco=;
	h=Date:From:To:Subject:From;
	b=PGaYeT/LRsBvJ8NFwAVaS8RplGoeTojTLKgeIMFz4ahcEUx7+BFnenMbwkCdHko2l
	 /AWbVCmfUKBjmg2+CEpYRnqwfLO91OLwK3QcMO6AxQI41t+gjzCOEpzvKzYyiCjuMI
	 4DHlh7b4rvoiIMUgzZFKAdR+0R03ht/jslRjaoeMzhBcKwfizDY7AJxfW6YpXBYP0p
	 IbxHEHFNW90bDAnoV7mJzP8yyQp2TvIHJS7vhg5UiYJGSJRSr+H+dSZEUUbXJcb/A7
	 5iRifcmyNl6PqlIgde4gwjIXyTQ3E8IBIDoMeBgL3+glFf6vskicwqOVGszeGJUMwP
	 4pMhSAORgaSWw==
Received: by mail.bizial.pl for <ath11k@lists.infradead.org>; Mon,  9 Jun 2025 08:11:22 GMT
Message-ID: <20250609084500-0.1.8w.15bf0.0.bkt43ujham@bizial.pl>
Date: Mon,  9 Jun 2025 08:11:22 GMT
From: "Kamil Lasek" <kamil.lasek@bizial.pl>
To: <ath11k@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.bizial.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_011933_518085_8D7723AD 
X-CRM114-Status: UNSURE (  -0.03  )
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

czy s=C4=85 Pa=C5=84stwo otwarci na niezobowi=C4=85zuj=C4=85c=C4=85 rozmo=
w=C4=99 na temat fotowoltaiki?

Jako firma specjalizuj=C4=85ca si=C4=99 w instalacji i serwisie najlepszy=
ch jako=C5=9Bciowo paneli s=C5=82onecznych na rynku chcia=C5=82bym przeds=
tawi=C4=87 propozycj=C4=99, jak=C4=85 wsp=C3=B3lnie z zespo=C5=82em przyg=
otowali=C5=9Bmy dla Pa=C5=84stwa obiektu.

B=C4=99d=C4=99 wdzi=C4=99czny za wiadomo=C5=9B=C4=87 od Pa=C5=84stwa czy =
mo=C5=BCemy porozmawia=C4=87.


Pozdrawiam
Kamil Lasek

