Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF042C4167B
	for <ath11k@archiver.kernel.org>; Fri,  8 Dec 2023 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzfJ/Wxrg8r5L9X4N7t+T8uKJepMb7LWA0bmHe7WXP8=; b=UHGU/usZzwSBGJT/h4TGnZqYng
	ht1IC6dcT8/NyWxI6ZYLuDG0Sm8Mme11100AhEgQTNbaPc/uKPVczAdVsip+LWb0juwybT1Rb8/ty
	LepcNNqpIJw03eOIB+l86ZhfLo1ZufnUytAlT/YnctfY5BIqxu4LGeap6NCf7tmbnCP3hX2Y0gZER
	9wx2rdgScmQ/8uyZJP50IClybtTsdHiH0IJ1fPuUpeNeVEPhqAr2oAs2RfRJ/g06wO/C2dywS7Dl3
	zArloL7xakbgW9RyMNeQkx3djF0JqkGIENeuUdfZghtRbaWqOOi2Vwvs2jdOolVl0CY/S8f1hqDYl
	0KSrzxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBWuE-00F6JB-1K;
	Fri, 08 Dec 2023 09:12:22 +0000
Received: from mail.connectbizsteps.pl ([217.61.97.118])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBWuA-00F6IZ-1n
	for ath11k@lists.infradead.org;
	Fri, 08 Dec 2023 09:12:20 +0000
Received: by mail.connectbizsteps.pl (Postfix, from userid 1002)
	id 982A083C63; Fri,  8 Dec 2023 10:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=connectbizsteps.pl;
	s=mail; t=1702026730;
	bh=MzfJ/Wxrg8r5L9X4N7t+T8uKJepMb7LWA0bmHe7WXP8=;
	h=Date:From:To:Subject:From;
	b=w4t3+reF7lmVdkf0BagNzIlX7L8vi8zDFnsJuo9YsEGV8i570PH8waZg2h+BhYCmM
	 4BtYLw9eRKsrDR7Djo4IUk+Yuqe6PxZ/6D8kftl20ucWd9FFuSFuoqQhF5MK8ngv8L
	 UP2t1vYUPIGB1dBlXFJ8FFGfznHSDWQ+0GXX8X5mfmps1hA3gSAkjfY49xV2oOCtGj
	 XbA6GR80VAdc0UjzSOzJEYynpw49V5FqyeHya1FXC5osKGNV2h/95Fwik6kLdnaSWx
	 Za6Ds37U7jIh68SIGvAUY/I5ybazTxD2nwnXvlB7TMIiaWUpwcXD1C/yJGLh4wRzb8
	 i630tZhPWJqGA==
Received: by mail.connectbizsteps.pl for <ath11k@lists.infradead.org>; Fri,  8 Dec 2023 09:10:59 GMT
Message-ID: <20231208084500-0.1.13.2p4x.0.khik6f9z1l@connectbizsteps.pl>
Date: Fri,  8 Dec 2023 09:10:59 GMT
From: "Katarzyna Kolenda" <katarzyna.kolenda@connectbizsteps.pl>
To: <ath11k@lists.infradead.org>
Subject: Konsultacja z prawnikiem - Kodeks Pracy
X-Mailer: mail.connectbizsteps.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_011219_342092_8B91418E 
X-CRM114-Status: UNSURE (   0.73  )
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

jestem zainteresowana wsp=C3=B3=C5=82prac=C4=85 z Pa=C5=84stwa firm=C4=85=
=2E

Obs=C5=82uguje przedsi=C4=99biorc=C3=B3w w zakresie indywidualnego i zbio=
rowego prawa pracy.=20

Wraz z zespo=C5=82em zajmujemy si=C4=99 przygotowaniem i negocjacjami um=C3=
=B3w, kontrakt=C3=B3w. Wspieramy w procesie zatrudnienia, restrukturyzacj=
i, a tak=C5=BCe przeprowadzamy audyty prawnopracownicze (due diligence).

Dzi=C4=99ki wieloletniej praktyce i wsp=C3=B3=C5=82pracy z dzia=C5=82alno=
=C5=9Bciami Pa=C5=84stwa formatu jestem w stanie wypracowa=C4=87 korzystn=
e rozwi=C4=85zania pod wzgl=C4=99dem organizacyjnym.

Mo=C5=BCemy si=C4=99 spotka=C4=87 b=C4=85d=C5=BA porozmawia=C4=87 telefon=
icznie?


Pozdrawiam
Katarzyna Kolenda

