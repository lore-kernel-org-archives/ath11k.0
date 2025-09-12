Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C8CCAC582
	for <ath11k@archiver.kernel.org>; Fri, 12 Sep 2025 20:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b4Y/uED+WyLuT2rTeGzzQXSKSDM/RGK4Ds0Afwjv4gw=; b=YCSlJyLit4Q4RoHAiHbPwmdBWl
	ZppZG3r8qy1GV7aUi9ees9ziL1JzixA9QQniJshDs+P9gE6/b82kdAlxEYOhDPRb1ufBLvIU+K/Z3
	dST+pUost6MdvnwdDgvfxK4FtKmYzrh9wcQDDtMEX9RotS+W4UiCks+jfP9BjQ6naZj1IVl8Q0rXe
	2CLuFHOi4aSSjdXcLhAsIszS/6YDXuXKI9wliznzYfRZcLg5bQ/gQ+EuXgCRsRze9XgFq2pJZV6zM
	IyTIWpPR0PC1tB2LOjRhaWu44fkEHVrgM+QLvgjcCe/CvjRpTEjtdMYtHSxO031KVey+dEgluSBZR
	NcSPTS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAIt-0000000BPmB-3Y9N;
	Fri, 12 Sep 2025 20:23:41 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxAIi-0000000BPh2-2igk
	for ath11k@bombadil.infradead.org;
	Fri, 12 Sep 2025 20:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=b4Y/uED+WyLuT2rTeGzzQXSKSDM/RGK4Ds0Afwjv4gw=; b=f0DXmkIMyTahSaEaEQhvTbF/SN
	rJtLFyA9txG0eVJS3pPQL56RHMz2Sawuutmlrql2U0CtX6/mab3ba7IAp9K50IA5qwzA/JUwtFpus
	MHqrpK2XzBHg6KXkf6hNuwmadrnqyNl2qutfVv86IDdPEOGGdwyb+FQ96c4OHLhIC7/p9NoMJqmhE
	hoFIlO5TCisnrcAdHdcDiEsLS1bcB23ce79RkYWznMxUJ8PQmViBleYsdumm/ZcwW7CS/fIYdf/r2
	qts7AiIlkpjjK4zr2F0GQaQSWP080BH6/7keSVTNwYznL1ajcP1vbOPOGSQuQ0shw6hCxvElWk06i
	zy2aOubw==;
Received: from mail.bizoster.pl ([141.94.21.238])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwypb-00000006Gre-0Pwi
	for ath11k@lists.infradead.org;
	Fri, 12 Sep 2025 08:08:32 +0000
Received: by mail.bizoster.pl (Postfix, from userid 1002)
	id 72CD052865; Fri, 12 Sep 2025 10:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizoster.pl; s=mail;
	t=1757664497; bh=b4Y/uED+WyLuT2rTeGzzQXSKSDM/RGK4Ds0Afwjv4gw=;
	h=Date:From:To:Subject:From;
	b=BeXsZn/g6PVtvFKNaCCFSwV9xieLSl1wKBm7YlniUXaYs0PoTvqEejTQdpmF92gov
	 aSkCI4x+G3lQy2yLIfUJXw6Bv9eMojiUAOqA1+Lvh8cV22d/H4w6HNeChYR16sSFis
	 OQM173V+4L8xV8jfWnoJj/fo5ySXgpuYMsTYaVYI8TcOMiPjyJo7XqaCK+nFczalDO
	 2NpJDTf8sZAoQhVXl31mHd9sF6r1h8p55IOSGti1hvNZc3OMgNOLQAGxqbcZwsw2Wv
	 XSJshMC0cxwxATR7Sod3HpLZwhy4Q32ttxz7p+RW6xpXT//vNecmTCJSfROBaesoiW
	 kiM4Q9EG2ZKVA==
Received: by mail.bizoster.pl for <ath11k@lists.infradead.org>; Fri, 12 Sep 2025 08:05:55 GMT
Message-ID: <20250912084500-0.1.fr.4y97l.0.gblb4jifog@bizoster.pl>
Date: Fri, 12 Sep 2025 08:05:55 GMT
From: =?UTF-8?Q?"Tomasz_Bia=C5=82ek"?= <tomasz.bialek@bizoster.pl>
To: <ath11k@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.bizoster.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_090831_414582_235A5C65 
X-CRM114-Status: UNSURE (   0.44  )
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

