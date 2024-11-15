Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1656DD68BDB
	for <ath11k@archiver.kernel.org>; Fri, 15 Nov 2024 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Oo8tuThL69UywoHNtNWphGeN1l/Ks7ZdfhLn6nu8Ts=; b=OxsDo17DFVuzzXeJFbtMvs0IAU
	v2NzAFq8inKLILZVFxZC8yp5ERkV3eHaNCeM/LZCA8btT35uOc9mXhhM5/7+kFzvHCqFMZBuby9lN
	cMKJQzzev9b7228N81YxFbcv/TDDGSrG1kGFL/EQJ2RVPnycfZF+h4S3t5mSnGAZoU7VEaZYBbF6z
	HAke/GORdbX3gbCLrx2Y5EnphR5fEqb96vN2oNMx/G6oZUhnCzQFtRb9zWb6eN4ocV5x4juPk58WB
	MewMnvjeBlJwkaHC6OJhXCISuFA+Rayxzo2wzdko7zqGojONcuzUPibgmKidgN9dON1sYSefeQ4nK
	Z7ogy4aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4xO-00000004RhX-2Jhn;
	Fri, 15 Nov 2024 22:38:26 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4xL-00000004Rds-3aFn;
	Fri, 15 Nov 2024 22:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731710297;
	bh=2Oo8tuThL69UywoHNtNWphGeN1l/Ks7ZdfhLn6nu8Ts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dvqBU9n8wyesGOM7wAJUVL4V50umalSR9AGyHvO50R9rHL4dRlvqV2fKiGIxclon7
	 dHEpXPpW9NVhcbFtMBHzRNkcGVSkeVB/y2szbGMNYINCZkHzmLDf1115Jxe24OTeOk
	 GNv8daj8Y6W/lBqt6k/toExNrcSvGF2/nzg0QTmOQX9jzDpl13KzERpvnsypqwk14l
	 Jr2Y6hhhHGQcduaub5tIB8ldj0pYnhXmYJw4zK368Q9lExm0iQorTgylYyIdDuEGMp
	 WagrfQz4Kwg8LTMJpR3GyN8L1t3g91kYKCDixQ+vf1WORv4sLKKi8JfCCFjRz+Eeni
	 +eMZUx+2BK6mA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XqsP22nY1z4x8v;
	Sat, 16 Nov 2024 09:38:14 +1100 (AEDT)
Date: Sat, 16 Nov 2024 09:38:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik
 <kadlec@netfilter.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir
 Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Roger Pau =?UTF-8?B?TW9ubsOp?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jack
 Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo
 Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Subject: Re: [PATCH 03/22] arm: pxa: Convert timeouts to use
 secs_to_jiffies()
Message-ID: <20241116093815.5d37eb43@canb.auug.org.au>
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-3-19aadc34941b@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
	<20241115-converge-secs-to-jiffies-v1-3-19aadc34941b@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4rVE82Kt6y+3_PbwMmwogMj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_143824_182952_7FBB1263 
X-CRM114-Status: GOOD (  11.40  )
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

--Sig_/4rVE82Kt6y+3_PbwMmwogMj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Easwar,

On Fri, 15 Nov 2024 21:22:33 +0000 Easwar Hariharan <eahariha@linux.microso=
ft.com> wrote:
>
> -#define SHARPSL_CHARGE_ON_TIME_INTERVAL        (msecs_to_jiffies(1*60*10=
00))  /* 1 min */
> -#define SHARPSL_CHARGE_FINISH_TIME             (msecs_to_jiffies(10*60*1=
000)) /* 10 min */
> -#define SHARPSL_BATCHK_TIME                    (msecs_to_jiffies(15*1000=
))    /* 15 sec */
> +#define SHARPSL_CHARGE_ON_TIME_INTERVAL        (secs_to_jiffies(60))  /*=
 1 min */
> +#define SHARPSL_CHARGE_FINISH_TIME             (secs_to_jiffies(10*60)) =
/* 10 min */
> +#define SHARPSL_BATCHK_TIME                    (secs_to_jiffies(15))    =
/* 15 sec */

It might be nice to keep the alignment of the comments here.

--=20
Cheers,
Stephen Rothwell

--Sig_/4rVE82Kt6y+3_PbwMmwogMj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc3zVcACgkQAVBC80lX
0GyUXgf+Ii9yOHf1vRadjfzExIFyJR4I0mG1VXDEBH24ASdL/jVIFlfW31h/JIe9
7JJFAL5Aa+C8Xw22mmq/8e0wbWCe+DqEq+SLtggkTN8kHtwf7Glda0a/aIix0pNM
s9nQXwrTFFvaCt2ocRmPUcm7K/jwiG3YxWawYBvIoSF9l/TfQXwD4LBbP2glFEL2
BkTvGG0/asLCHZK2LHwDsWsZ5XskgJmmQfbYEdygcm9C3bP40tFYUM22B6iEYNez
WKquyY7lAmwUJQsIAWZig/PKPz8e6uux6ghIdGbwFC0ezQqIOAz8ZqllWy1Dpa87
vCjZSu4lRCFBg5npBBL5wIOagKFSCw==
=vmyn
-----END PGP SIGNATURE-----

--Sig_/4rVE82Kt6y+3_PbwMmwogMj--

