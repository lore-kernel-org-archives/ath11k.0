Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F55CCD185
	for <ath11k@archiver.kernel.org>; Mon, 13 Oct 2025 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=; b=FIlyqO2gAKF3/YDeE9ZEkmR7AN
	BwpAT7nXgT/SnlHb08krdOYpJ7vx/zKzW3gtD0syzVOvkibjcO+vq9VJN0iaxD6rG6/ucoPQxfGRt
	17+WyMniIKlZGAZf5D6DWFOClTLPt8tqeYEvUamJ1F1dXfg1j4Jhh0KSvLPhu3WQA38bYteHEEuEe
	YUUr9zXsfLT7DhcWPvlRcF2d5odyuc4Y1Bca+lJu5+VK5eSXC3lCHbkRy5b/1rZIje1KG2FHYjSLd
	PcBY5sYVhiXuC1JZx8maK3DBDvenfwXdV98dIfP5hzgaI5R2Wnrr1aquzkg4LdnoAZFhhTxtnNKT2
	3Jc4EQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DVY-0000000CXlK-2y2Q;
	Mon, 13 Oct 2025 08:02:16 +0000
Received: from mail.maktrix.pl ([141.94.21.160])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8DVV-0000000CXky-30wK
	for ath11k@lists.infradead.org;
	Mon, 13 Oct 2025 08:02:15 +0000
Received: by mail.maktrix.pl (Postfix, from userid 1002)
	id 68F214A0BC; Mon, 13 Oct 2025 10:01:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maktrix.pl; s=mail;
	t=1760342528; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
	h=Date:From:To:Subject:From;
	b=DdP05qrwn0jPGwwJPds2LJGgphXPf+aiHL5sriCFmaMMDfwPt34Pf+ghdrxaZN1VI
	 jKoVDiY+cqGTbGJ3q/DszmAp/xWvLuH5qZZhKzStOHD47Pai45Oog7i/7htmjHb7ID
	 U6oxXtgo1uU5IIyJwWGWI3cOw8T5jYUQbdD8BDstHWHL40sst7DxLadkqxTjaoqwRN
	 oDdgRe+ZV6/zTN2N16kWz+wanFuNo6QTJ5rG0S0cQWjG4SLfDn1GdNG8PxEpVQyH4+
	 tz4vIip+mhw2A26x3YjWHuce70WVFODCRWNP17XagmLrjwzU0aqC3Jv78iMkMP1D/J
	 dqXPzomJ7aTrQ==
Received: by mail.maktrix.pl for <ath11k@lists.infradead.org>; Mon, 13 Oct 2025 08:01:13 GMT
Message-ID: <20251013084500-0.1.gt.1xqtv.0.imltna2usz@maktrix.pl>
Date: Mon, 13 Oct 2025 08:01:13 GMT
From: =?UTF-8?Q?"=C5=BBaneta_K=C4=99dzierska"?= <zaneta.kedzierska@maktrix.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Odbi=C3=B3r_w_paczkomacie_?=
X-Mailer: mail.maktrix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_010214_043720_1019A9A4 
X-CRM114-Status: UNSURE (  -0.12  )
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

jako lider w us=C5=82ugach kurierskich w Polsce przygotowali=C5=9Bmy elas=
tyczne rozwi=C4=85zanie dla przedsi=C4=99biorc=C3=B3w.

Stworzyli=C5=9Bmy abonament =C5=82=C4=85cz=C4=85cy dostawy do Paczkomat 2=
4/7 oraz obs=C5=82ug=C4=99 kuriersk=C4=85 - jeden dostawca, jedna faktura=
 i przewidywalne, sta=C5=82e koszty.=20

Czy mog=C4=99 przedstawi=C4=87, co mo=C5=BCemy zaproponowa=C4=87 wzgl=C4=99=
dem Pa=C5=84stwa potrzeb?


Pozdrawiam
=C5=BBaneta K=C4=99dzierska

