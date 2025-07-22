Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147B5C83F27
	for <ath11k@archiver.kernel.org>; Tue, 22 Jul 2025 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnhG1L8sNIVaf/FoCTbqo+iKpFyRChzRQU2I/lhE/Yo=; b=m74GB832tqSLLx04rqwGPoCHJJ
	ngsja/jz6nabxj5pBc7WTAiBwiSymOGH8lLjYrbfE23CeJe/GLN1rwNDJeSAVhuqz08zN6rQw+dHN
	ZcXFDB23GoUoVFySU/FnjeZZyWHsuEQFOzpoc18+jM48MuRwj7yGSx3DdBiAHSE4aK95PwUUFgxNV
	agcilxFyqbm03OddQkGYSHmc9r9+UgoWOb81rUYdpcPXlViXKeM0HHv3Q8AP0NrYj4xshqaySs2jw
	mRZuMnnTnRo0U5BFyEuyehoSYW/VT6LdK44FTXSa99UNd21R93vzGLYQh0rNLBdDFNNyA9uGGWpmd
	yEjmhakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFO3-00000002w3K-2bH1;
	Tue, 22 Jul 2025 15:58:39 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEIH-00000002lVh-0Fj1
	for ath11k@lists.infradead.org;
	Tue, 22 Jul 2025 14:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bnhG1L8sNIVaf/FoCTbqo+iKpFyRChzRQU2I/lhE/Yo=;
	t=1753195716; x=1754405316; b=i+/D6blroBJn80jH5WC4TAHv0whYctjKEqTXi+XaQVR1oR9
	blXrgsqz3nvKWGB0WNTDUGN3w/oqF15pmWaVY7X5He9J7eTxSHjT7s3L2rzygXB1wEuwyWJTR5ZQL
	wHJdOZeAfRS5Fhov7vyWqgeZMAuIZHp7YVPGTmCgGwnNR/W6MdqH3gu7Az9qtYc6WFnXSaEkq/OqB
	UzJYmE0CzMky8ZrgGzqevQcu9+XXSIe3Qcz/5cBNMKhAEm7p3A0+/MWeiORUAaCSwPZT70LSGi8j1
	JljpmKIuzQzUA5f9IZu5NmJCD0c8LPsNBSVvVxu3e7cW0hAFnQ8uMO42kTAq5RmA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ueEI9-00000002FYt-2QVJ;
	Tue, 22 Jul 2025 16:48:29 +0200
Message-ID: <c1ba74ad02093b04c87d5f9c931d4e73fa42fac6.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: ath11k_pci: add a soft dependency on qrtr-mhi
From: Johannes Berg <johannes@sipsolutions.net>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Baochen Qiang	
 <baochen.qiang@oss.qualcomm.com>, Christoph Hellwig <hch@lst.de>, 
	kvalo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, 	pabeni@redhat.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Date: Tue, 22 Jul 2025 16:48:28 +0200
In-Reply-To: <83c62cb2-7d85-4a9e-ba76-63faa27faedf@oss.qualcomm.com>
References: <20221202130600.883174-1-hch@lst.de>
	 <0b28bb5f-56b3-4be6-b4f4-89ca546a24d0@oss.qualcomm.com>
	 <83c62cb2-7d85-4a9e-ba76-63faa27faedf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_074837_105770_C612430E 
X-CRM114-Status: GOOD (  15.84  )
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

On Tue, 2025-07-22 at 07:37 -0700, Jeff Johnson wrote:
>=20
> This predates me becoming a maintainer, and I don't see any comment from =
Kalle
> to the patch, however he did have the following comment in a separate thr=
ead
> where the issue was being discussed:
> https://lore.kernel.org/all/87cz8v2xb2.fsf@kernel.org/
>=20
> > Though I am happy to take your MODULE_SOFTDEP() patch, just wondering i=
f
> > there is a better way to solve this. For example net/mac80211 (the
> > 802.11 stack) has a lot of crypto dependencies:
> >=20
> > 	select CRYPTO
> > 	select CRYPTO_LIB_ARC4
> > 	select CRYPTO_AES
> > 	select CRYPTO_CCM
> > 	select CRYPTO_GCM
> > 	select CRYPTO_CMAC
> > 	select CRC32
> >=20
> > And it's not using MODULE_SOFTDEP() at all.
>=20
> So I'm guessing he considered this to be an issue that should be solved
> external to the individual drivers.

I just happened to see this and never saw the other discussion from Dec
2022, but it's somewhat interesting ... for some of those modules
mac80211 has a hard dependency (such as lib_arc3, crc32) but for the
other crypto modules it instantiates the algorithms via the string
descriptions (such as "gcm(aes)") so it has no hard dependency.

Maybe crypto modules are treated specially by installers and the like?

johannes

