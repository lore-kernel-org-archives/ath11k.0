Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D880BD68BDB
	for <ath11k@archiver.kernel.org>; Fri, 15 Nov 2024 22:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8q2Y3qiG3ZOOjZQQW66Agp5RO04F9uaeWnu9irwI8zs=; b=VBapF+/GN0R+hrMyBSbdi0+0Wz
	ke2atfTbkVJVWxnAhjaRSz0b5cqGhNXVQd7jUGr1f/1AvijLw6MW464fR3A3AHCqO+DzahbEgw2lM
	7k/KOT62B29hG0k5E+1vDGgZ+eF8pb99vi/lWMHULMQKaVNI0oAQmusQBLaeJyi0q6ies/cXp0MhQ
	fyRlmmcYTmghSzQ44KuUvsivNv2OrCMAmw/+OktgXhQlAoefiAMXgqQP0t6kNj6Xl7UUZ3k4RecLD
	mUCnhI/LB/hQ+tdfXswPT3bKNBttTacdupt7pIydAsqabT3OowFsyQU6XnHvoyjfqi1fg9M6QktEO
	qZYIz5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4uQ-00000004Qyo-203F;
	Fri, 15 Nov 2024 22:35:22 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4uN-00000004QwZ-3gdU;
	Fri, 15 Nov 2024 22:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731710109;
	bh=8q2Y3qiG3ZOOjZQQW66Agp5RO04F9uaeWnu9irwI8zs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TBKjQ+jwynGqippSpjmesy2LJHz5G28IT7vT4TaT88JCuw46fBO3BDRAIPv6hRM7/
	 XbOWv6yTpIGUBOHVpD+GgH5bOcDzYCKCOUCxtFJITpudgYieUI+GdoU8psZqrHYs9B
	 plWGzIOASib2U9DXo1e9xJXfQHkgKNH8Cirh/o/LRzKV85o+Cp3r3eBc9AZ3AQZa0F
	 DYP1RPyQiMfC70ZKaMZkgpPnHyLFqXq1SQIh8oIfiAurmRjt4FWX01yMlsvyocz2uk
	 oad7uD2rsh8nj5e0aZSH5jUluHbC7REOnBIrLNo1QEsXfDYgF3levquGraIQNcBhLm
	 5y9gdjsr1Cmwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XqsKD5FnLz4x3p;
	Sat, 16 Nov 2024 09:34:56 +1100 (AEDT)
Date: Sat, 16 Nov 2024 09:34:58 +1100
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
Subject: Re: [PATCH v2 01/21] netfilter: conntrack: Cleanup timeout
 definitions
Message-ID: <20241116093458.4aa19a0e@canb.auug.org.au>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-1-911fb7595e79@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
	<20241115-converge-secs-to-jiffies-v2-1-911fb7595e79@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gpyLfQXA_rG=N5QDCu3kL6w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_143520_229630_364C284B 
X-CRM114-Status: GOOD (  11.44  )
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

--Sig_/gpyLfQXA_rG=N5QDCu3kL6w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Easwar,

On Fri, 15 Nov 2024 21:26:18 +0000 Easwar Hariharan <eahariha@linux.microso=
ft.com> wrote:
>
>  static const unsigned int sctp_timeouts[SCTP_CONNTRACK_MAX] =3D {
> -	[SCTP_CONNTRACK_CLOSED]			=3D 10 SECS,
> -	[SCTP_CONNTRACK_COOKIE_WAIT]		=3D 3 SECS,
> -	[SCTP_CONNTRACK_COOKIE_ECHOED]		=3D 3 SECS,
> -	[SCTP_CONNTRACK_ESTABLISHED]		=3D 210 SECS,
> -	[SCTP_CONNTRACK_SHUTDOWN_SENT]		=3D 3 SECS,
> -	[SCTP_CONNTRACK_SHUTDOWN_RECD]		=3D 3 SECS,
> -	[SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]	=3D 3 SECS,
> -	[SCTP_CONNTRACK_HEARTBEAT_SENT]		=3D 30 SECS,
> +	[SCTP_CONNTRACK_CLOSED]			=3D secs_to_jiffies(10),
> +	[SCTP_CONNTRACK_COOKIE_WAIT]		=3D secs_to_jiffies(3),
> +	[SCTP_CONNTRACK_COOKIE_ECHOED]		=3D secs_to_jiffies(3),
> +	[SCTP_CONNTRACK_ESTABLISHED]		=3D secs_to_jiffies(210),
> +	[SCTP_CONNTRACK_SHUTDOWN_SENT]		=3D secs_to_jiffies(3),
> +	[SCTP_CONNTRACK_SHUTDOWN_RECD]		=3D secs_to_jiffies(3),
> +	[SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]	=3D secs_to_jiffies(3),
> +	[SCTP_CONNTRACK_HEARTBEAT_SENT]		=3D secs_to_jiffies(3),

You have changed this last timeout from 30 seconds to 3 (presumably
just a copy and paste error).

--=20
Cheers,
Stephen Rothwell

--Sig_/gpyLfQXA_rG=N5QDCu3kL6w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc3zJIACgkQAVBC80lX
0Gw+jggAlx/FpdCsBUGWHj/3D1FyMKcJOE8x+VIKqw9c10Hqa/DPZEAcUaXlmvJJ
1NS+WrDFLS34ZiI4SbtosexC7tobHh/TkpamqrN+fG8STjNbtTVLYQ8QiWT/NCDx
IeMkpH/EiSg0ow+0U1XenGHORnkKPdtLr7lxlRq1R7ylUYNZK0eDlX4r2dwmOLYg
r0lFld/TwA434BDqTqj8KzVt9p1k2QiHm+LUntdk7Xu/Rlami4y/+Bahn9gmN3ji
wRFxXLzm6upqhGxP5RYNyz3FB0oQgUvILDpklyPzzLTZW+L+bPkhgY5RZTFXpk9k
KeR+GZcOjbCNU/RaWT8zDXVC32LJaw==
=DzpI
-----END PGP SIGNATURE-----

--Sig_/gpyLfQXA_rG=N5QDCu3kL6w--

