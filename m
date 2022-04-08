Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08AFC433EF
	for <ath11k@archiver.kernel.org>; Fri,  8 Apr 2022 07:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=O8op73AeryVAiOdeo3TpM1qP1uQcZFt5iAaTRRZ4b1s=; b=250
	ISQ/Dux4ZxG9gbiS2Al0Q8UV9Uu3iqDeWe+jYaMqCFjLWT01TJAGQNnNGwmb66+VzHu28erq4SBZ/
	ul8AIx9O50o3xwbrpw0c1WAK1Xj1z8rtECNKuIfkzD9ReG4PMrOJvhVA2sZjvzuYK1WuEZ0DsO0c6
	gU1K3p0xYK4rE9YLmF9cgMzZPgcQca+4rrlWrLFH7tawISouqfgl9HPki8qFslyEgoWyieKsSMf/4
	XJ+f7bThdzrVsyUqNWwwrvtNLdT9UzSbXxs+zjmb9y3XhZe2kSiR0Ns991QNANM7cOU370U8+0Z/g
	/C/DLFQyG8sQ7dBgl/YNwzsYzdozmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncj1V-00FXje-4l; Fri, 08 Apr 2022 07:27:13 +0000
Received: from mail-out01.belwue.de ([2001:7c0:0:76::11])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncj1P-00FXdM-VI
 for ath11k@lists.infradead.org; Fri, 08 Apr 2022 07:27:10 +0000
Received: from mail-hub01.belwue.de (mail-hub01.belwue.de
 [IPv6:2001:7c0:0:76::41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail-out01.belwue.de (Postfix) with ESMTPS id 4KZVDw5xvwz4xDZV
 for <ath11k@lists.infradead.org>; Fri,  8 Apr 2022 09:26:56 +0200 (CEST)
Received: from mbox1.belwue.de (frontend04.mbox1.belwue.de [129.143.76.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail-hub01.belwue.de (Postfix) with ESMTPS id 4KZVDv5kKjz52ByW
 for <ath11k@lists.infradead.org>; Fri,  8 Apr 2022 09:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windeck-gymnasium.de; 
 s=DKIM001; t=1649402815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=LrxDtTtWSCiaqWsrto62dYXFZvk5fd5bH5UqBfgu9Wo=;
 b=N4q2XDJSsq7reJK0rIi9DQpzn2j4FGUqPjICHrSI4zqXYiDrF3JGPFYcq9Lbl/ARgnYg0k
 ZuHN1lXayaQw8fdj6VoIkMWEAFzS3NlMWDtf8jzDVUMd4rTZorFV7n9aHI5Rq2X1jY/76a
 Rf3rBS6DCZ/1x/cjaPhKuRQuqadA2ETpvJvyjCidHwinkb2CPNwfWx2/uPwwTH6mlX9PJu
 mE1ZgW8wrbcGFhZ7Zp56bnebbVQXLUoutkTcmQQhR7IyXlnL37RgiYnLm0264nOzdvQXGx
 4hvwu3pIXmU3453XCfTLF1FLfbzVWHoVC8xKPxSfLAJffwptsBih3TH8f/m3QQ==
Received: from [37.228.167.115] (account
 dominik.foerderer@windeck-gymnasium.de HELO [10.16.1.51])
 by mbox1.belwue.de (CommuniGate Pro SMTP 6.3.7f)
 with ESMTPSA id 45952549 for ath11k@lists.infradead.org;
 Fri, 08 Apr 2022 09:26:53 +0200
Message-ID: <f02808cda5adcf34db79f75cf57b44a2780cd644.camel@windeck-gymnasium.de>
Subject: [regression]: xps13 9310 system freeze with kernel 5.17/5.18-rc1
From: Dominik =?ISO-8859-1?Q?F=F6rderer?=
 <dominik.foerderer@windeck-gymnasium.de>
To: ath11k <ath11k@lists.infradead.org>
Date: Fri, 08 Apr 2022 09:26:53 +0200
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4KZVDv5kKjz52ByW
X-Rspamd-UID: 0e459f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_002708_635528_4C9DF5A0 
X-CRM114-Status: UNSURE (   4.06  )
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
Content-Type: multipart/mixed; boundary="===============6287296870278850281=="
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


--===============6287296870278850281==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-21iAhx3JYhRKRDTcBasn"


--=-21iAhx3JYhRKRDTcBasn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After switching from kernel 5.16 to 5.17/%.18-rc1 my system (dell xps13 931=
0)
allways freezes short after boot with a cpu-soft lock.

A git bisect shows, that the Problem is caused by commit 9dcf6808b253 ath11=
k:
add 11d scan offload support. Reverting this commit makes the problem going
away.

There is also a bug report with further descriptions here:=20

https://bugzilla.kernel.org/show_bug.cgi?id=3D215777




--=-21iAhx3JYhRKRDTcBasn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEE3M0GLY9916YeAqVIj2SgNA7nwcMFAmJP470ACgkQj2SgNA7n
wcPJxQf+I3IqCu3CleQJbTTURAandhaDRGfHNL0unDQEv2OvMU7pqmutfWDv7VNJ
eKcouW+GU4LupjMD6grSSFg6k9a0bWcRzxe2IwlWt4zPlet4EUT1zoIKA+AdTN8G
u3brCI1mEiEV2Gv83oTvxSc/5XN95kC5JOPuVO5CAmNPnDpxLauTB3djG0yT8w5j
JLxI7zleres/+pe1qkmkxpPPh2XvHWw5XUrIJsWU8xUdatbHvXasnYOJHw3KlrUh
giidfvC/QOF1texuZLFlsDdqNSIN8c5L358/6/Je3fB8DvmnNpKpVhOS/HI59Kdw
6MO1+HIBNzJ7ASNQnMe8z+qMA69/PQ==
=Zp7E
-----END PGP SIGNATURE-----

--=-21iAhx3JYhRKRDTcBasn--


--===============6287296870278850281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

--===============6287296870278850281==--

