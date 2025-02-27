Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B43CC021BE
	for <ath11k@archiver.kernel.org>; Thu, 27 Feb 2025 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZcVTwpfT+rvMIZf+a6thkYIKhQrt2Pg2e0oc9tk5s3U=; b=dlZTp9HOSAk7ByzT4YzzwG0MrN
	Ot6FSghFQjxP6w0PknYkzn3SG9POHUc2z+gkZhRmowafTqw3mCavr2mNyg741X7vfAKYpTSWomU8C
	2lSzsVMVPyKf+AKciyQrRoslEXecjqqib4LOaQqzhe3OyRS+PUUirSHC8Za55KrobdcUl4Otqi6QR
	fEWAXioLnqk1H1WUUZ8XG4RRiFjSu1+CMIQ/gNiCOLA7bzV0fQGLDocU+luCdkl2XLojvbgeAbxVQ
	za/KY7qdxx3xNTOPTtRv3Y4lQurJzzuHQYS9wlIdTgYp1aBgm1AEX1yNkmVnVjgLqkQOgU/UWHt35
	XpD/HHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZvV-00000006p3B-3NIQ;
	Thu, 27 Feb 2025 09:11:29 +0000
Received: from mail.astutegenius.pl ([51.195.47.38])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZvS-00000006ozN-25AU
	for ath11k@lists.infradead.org;
	Thu, 27 Feb 2025 09:11:29 +0000
Received: by mail.astutegenius.pl (Postfix, from userid 1002)
	id 23D8E256B7; Thu, 27 Feb 2025 10:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astutegenius.pl;
	s=mail; t=1740647481;
	bh=ZcVTwpfT+rvMIZf+a6thkYIKhQrt2Pg2e0oc9tk5s3U=;
	h=Date:From:To:Subject:From;
	b=K+/Gutb69NgwCWQU26nxSbTYZsmpEAOiPlQhbSoTPUzA5VNyw8lp3CawXgOldfJox
	 jahHRSAkUzNcMhktuHm1bYqtJRAVMEShHpbSrd7kegOYElE/gTi1jCUW634rB3VqnU
	 ay4Huep29DkIV9B3JUgQMcJm1BBz4QZ2IhBZ1MfrTnrgvFxgTuQM7LsynxpKaJ+wty
	 +ZNLDq2Edm3EekdaSYEYM/KtpP4iGqXG0/GStV/5IA+lHv78DwOVjZGiOyM5ATNBma
	 Meq/7DqN293R72PkPpOaLx0Ri0GszhkgibTiQ+QKkwQ3aH/YIBbCy4hIB8Qzzicp9q
	 q8CCZxyTN0kxg==
Received: by mail.astutegenius.pl for <ath11k@lists.infradead.org>; Thu, 27 Feb 2025 09:10:32 GMT
Message-ID: <20250227084500-0.1.g5.4zr0t.0.1775oj08ql@astutegenius.pl>
Date: Thu, 27 Feb 2025 09:10:32 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@astutegenius.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.astutegenius.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_011127_222290_D8E39971 
X-CRM114-Status: UNSURE (   1.16  )
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

Dzie=C5=84 dobry,=20

chcia=C5=82abym wskaza=C4=87 Pa=C5=84stwu mo=C5=BCliwo=C5=9B=C4=87 zarz=C4=
=85dzania benefitami w =C5=82atwy spos=C3=B3b, poprzez nasze intuicyjne n=
arz=C4=99dzie, jakim jest karta lunchowa.=20

Nasze karty oferuj=C4=85 wygod=C4=99, oszcz=C4=99dno=C5=9Bci i zdrowe wyb=
ory =C5=BCywieniowe. Dofinansowanie posi=C5=82k=C3=B3w jest korzystne dla=
 obu stron. Karty lunch to dla pracodawcy realne oszcz=C4=99dno=C5=9Bci w=
 postaci zwolnienia z ZUS do 450 z=C5=82 miesi=C4=99cznie na pracownika.=20

Kart=C4=99 mo=C5=BCna do=C5=82adowa=C4=87 dowoln=C4=85 kwot=C4=85, a niew=
ykorzystane =C5=9Brodki nie przepadaj=C4=85, lecz przechodz=C4=85 na kole=
jny miesi=C4=85c.=20

Mog=C4=99 przedstawi=C4=87 ofert=C4=99, kt=C3=B3ra pozwoli zoptymalizowa=C4=
=87 koszty i zapewni=C4=87 pracownikom po=C5=BC=C4=85dany benefit?


Pozdrawiam
Ewelina Koprowska
Senior HR Manager

