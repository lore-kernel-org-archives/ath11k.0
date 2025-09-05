Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D66CA1015
	for <ath11k@archiver.kernel.org>; Fri,  5 Sep 2025 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCedRl+8KVm82aVxXo/HuaIMM7JoNxHVs5KgNKomQ9c=; b=clw559U7o0s0haXeRxxvlgJ1ek
	GLdNC2otsEoINjs8CaTiz4VTxQ9Kz+q+g9bvsArcRV3NWFjLJlAcmniSFVDnrLYmVHJj/fQufjx6w
	X7r9lnnvSk/E++h4NZL1jLAO3Xs0jtlu6n9Po4iRbJ+Y0rM9pQ+dPd3vvJ39/XNQCd1+IwoyaYjwX
	95HQDGF8L6VO5WrVzdoQHFZqOosBKOxQgiZaVl7f+rVhFYcprDi+ZmQyHstOnldZ15NIb4bnY3UXA
	aJ/GtwM+8JBwa4RMhu8u10TSStalA4ufub4UW4oMHHb/5gWn+Qa+Fk5Y6f3IkHh1vU3DJ8WB5ZWYg
	SYDm0BvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSfY-00000000iee-15cz;
	Fri, 05 Sep 2025 09:23:44 +0000
Received: from mail.voomio.pl ([51.91.253.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRWv-00000000G5r-1xxZ
	for ath11k@lists.infradead.org;
	Fri, 05 Sep 2025 08:10:46 +0000
Received: by mail.voomio.pl (Postfix, from userid 1002)
	id 82F34308AF; Fri,  5 Sep 2025 10:01:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=voomio.pl; s=mail;
	t=1757059412; bh=dCedRl+8KVm82aVxXo/HuaIMM7JoNxHVs5KgNKomQ9c=;
	h=Date:From:To:Subject:From;
	b=i6/anJg3WF4+I9aBby94LrvQg7p+BIKekTS7lCr90O2b1eNN0qQK5wNjiKdT8ZCtn
	 74xe5VRibvvvVPH8LYucdCBSyl+jkDpHnvj/BAwHUI9cwHCl+wMQ1+O64Wzspn3seM
	 F/d+9yIqKryNKgfE49ilzbAtAO1eSt6NgU622/YvZsO16uGaUIZ0SoCuLG0u87iPNA
	 MJNn6dUab7r4INcB5mJpPU8/0UjSF4QygUHWQPWQEw4j28xmp+DAI55LVIcr+6mgAz
	 jmgo/QjgQZlZT3/4KE6OUp02pSuNsPG9mbLzHsqfor+bKnhbqnAOTFSYOIvZwUD/Vm
	 u5lCEQpM0EprQ==
Received: by mail.voomio.pl for <ath11k@lists.infradead.org>; Fri,  5 Sep 2025 08:00:58 GMT
Message-ID: <20250905084501-0.1.iy.249v9.0.uekk49fbd2@voomio.pl>
Date: Fri,  5 Sep 2025 08:00:58 GMT
From: "Karolina Dylkiewicz" <karolina.dylkiewicz@voomio.pl>
To: <ath11k@lists.infradead.org>
Subject: Ochrona pracodawcy - prawo pracy
X-Mailer: mail.voomio.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_011045_644538_8F791DE5 
X-CRM114-Status: UNSURE (   0.43  )
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

Szanowni Przedsi=C4=99biorcy,

ewoluuj=C4=85ce regulacje prawne oraz z=C5=82o=C5=BCono=C5=9B=C4=87 proce=
s=C3=B3w zwi=C4=85zanych z zawieraniem i ko=C5=84czeniem um=C3=B3w o prac=
=C4=99 stanowi=C4=85 prawdziwe wyzwanie dla ka=C5=BCdego pracodawcy.=20

Nawet pozornie nieznacz=C4=85cy b=C5=82=C4=85d w tych obszarach mo=C5=BCe=
 skutkowa=C4=87 powa=C5=BCnymi konfliktami czy sankcjami finansowymi. Nas=
za firma specjalizuje si=C4=99 w ograniczaniu prawnego ryzyka poprzez kom=
pleksowe wsparcie na ka=C5=BCdym etapie relacji z pracownikami.=20

Tworzymy solidne podstawy prawne dla um=C3=B3w, doradzamy w codziennych s=
ytuacjach kadrowych oraz oferujemy profesjonalne wsparcie w najbardziej w=
ymagaj=C4=85cych momentach, takich jak procesy reorganizacji firmy czy pr=
ocedury zwolnie=C5=84.=20

Filozofia naszego dzia=C5=82ania opiera si=C4=99 na zapobieganiu problemo=
m oraz natychmiastowej, praktycznej interwencji, kt=C3=B3ra pozwala rozwi=
=C4=85za=C4=87 trudno=C5=9Bci zanim przekszta=C5=82c=C4=85 si=C4=99 w pow=
a=C5=BCne spory.

Czy rozwa=C5=BCaj=C4=85 Pa=C5=84stwo skorzystanie z kompleksowej obs=C5=82=
ugi prawnej w zakresie stosunk=C3=B3w pracy na sta=C5=82e?


Z pozdrowieniami
Karolina Dylkiewicz

