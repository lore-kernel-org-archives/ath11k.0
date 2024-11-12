Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22C6D41D71
	for <ath11k@archiver.kernel.org>; Tue, 12 Nov 2024 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6pWnTJ4jypXG+XwuUJ9CHuC5gIoBA7NYuv2i/JuKqs=; b=1tRLTPaziE/i6dktcnypcxZBVo
	kyheT45/2bDEchhF9Oo3yeE+LmUieoi3AmpWP5uCXCakCtU+Q6uABXFLh5dkPE2xAvQJa5wiU18Sc
	aSf+f7E5CMBBHmhpgiMNIBxYSFoH6/OqvV0JClfZxfrCFTWJYfoq92Sl87HpvvH/Z6aDFEzj9JF/G
	eEqvnwGMVGMB7a1ByRgcwtKUv1L6Vy5GtOdwWcpnroiTbleTzgBp8fYU5gy7KTFGe+MutD9p1ouFZ
	DnJoAky8bWftU2BcqF2HVvYVCJ5/b1WwhPQvXTRsMCELcnXHHL1JM4EBVexcnY6/71PdhvlKXbv3n
	WUKaKePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmx0-00000002lxQ-3McP;
	Tue, 12 Nov 2024 09:12:42 +0000
Received: from mail.geniuscraft.pl ([162.19.245.89])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmwx-00000002luM-2fio
	for ath11k@lists.infradead.org;
	Tue, 12 Nov 2024 09:12:41 +0000
Received: by mail.geniuscraft.pl (Postfix, from userid 1002)
	id 15067454D5; Tue, 12 Nov 2024 10:10:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniuscraft.pl;
	s=mail; t=1731402646;
	bh=C6pWnTJ4jypXG+XwuUJ9CHuC5gIoBA7NYuv2i/JuKqs=;
	h=Date:From:To:Subject:From;
	b=GqK8rWgiPG+KS9lOu1gQTF5WcPtwnh/jZKXSQyqLrwtVkstdAXlZYdYVqAxm05Vfu
	 PN91MdS0Wut+o8TFzJgesB1KXuJpUyLY2rpl7B7KWzF86z2JMQv6aZ/OIC8+5t6z8f
	 M2nOKYdp0pkhKPqsCp2ww4TAUgnnlMGInaOHQZQRW/YAkHdBKxFy0PN/dIT+gfPQVp
	 qDFs06wPJze3jMb/pfUU4hL2QWvLpzodZiZs4ecyRarB9ASIotee81KmskyqofXskT
	 NEykBtY1cSALkhtwmjK4U0LPuIuzxdBqbSD/cwkIi9U154aWzJonevSrSpa1rDNR5K
	 L+ucjcdGYwN8A==
Received: by mail.geniuscraft.pl for <ath11k@lists.infradead.org>; Tue, 12 Nov 2024 09:10:33 GMT
Message-ID: <20241112084500-0.1.5w.1dw01.0.b0e9rlcjag@geniuscraft.pl>
Date: Tue, 12 Nov 2024 09:10:33 GMT
From: "Tomasz Wawrzyniak" <tomasz.wawrzyniak@geniuscraft.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?W_sprawie_zam=C3=B3wie=C5=84?=
X-Mailer: mail.geniuscraft.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_011240_380237_31E808FF 
X-CRM114-Status: UNSURE (   1.56  )
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

czy wiedz=C4=85 Pa=C5=84stwo, =C5=BCe macie mo=C5=BCliwo=C5=9B=C4=87 zap=C5=
=82aty za towar w znacznie p=C3=B3=C5=BAniejszym terminie?

Terminowo uregulujemy w Pa=C5=84stwa imieniu faktury u dostawc=C3=B3w, a =
po zap=C5=82acie wystawiamy Pa=C5=84stwu faktur=C4=99 sprzeda=C5=BCy z od=
roczonym terminem p=C5=82atno=C5=9Bci (30-90 dni).

S=C4=85 Pa=C5=84stwo zainteresowani takim rozwi=C4=85zaniem?


Pozdrawiam
Tomasz Wawrzyniak

