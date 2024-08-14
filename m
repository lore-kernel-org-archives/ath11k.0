Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832B1C3DA4A
	for <ath11k@archiver.kernel.org>; Wed, 14 Aug 2024 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJRSwFOqxuezEsGgy/e+FJqSCUB8W3xhzbVyDljETsw=; b=yQR3vu7QeiENtuYN10tzqE5dLq
	WGrG2OcfLKIYlM+QhWu58dDt75tVyXo/SVK/pui7APXuzuYQsgd84FEdbClvDwJou5vuoCG9ShKjO
	sP2B0T9MycLP34qpidlenD+aViMOSf5xBxZeuPlTBgKBME7qERzKwnaF2pyz/kCZKGjtidZftbWz8
	pra3kAQRDGbMbaEz4nL8TBASVGAXWP9UujRzLFPZ7lzy16CKejN8RECfoH0vPGuKedePJW6xmKWxc
	ATSqsVZ5RXkckijkx4twnigg3DbDFEnVEDwg0e9Ag/2jB22mKOvsyiajOPi9C61o6TSRkWECliexo
	NCPNCx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seHph-00000007pMd-0AWy;
	Wed, 14 Aug 2024 17:30:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGoE-00000007er7-32PG
	for ath11k@bombadil.infradead.org;
	Wed, 14 Aug 2024 16:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cJRSwFOqxuezEsGgy/e+FJqSCUB8W3xhzbVyDljETsw=; b=aMRbpM09NVpE8i1vdMPsnsoCoq
	71eTfkC3KzBjjaCeT8OIpFW65xGOeFK764a1JvoFgb4eHAAhx98Xh45WzajtF2cJ/a4bpFaRTS0Q7
	S/RobDrhUSsehfGSZpfb1FTALMOsLU/cjmWWtSofDd21grWe543qT0eUQGUP6ccQwigULSrkNchtg
	v63zUGEe6N8gsjYbgacbBL4DURA4770lA9dMFG4SlG/g5YRX+r+8jZUYUTt73OTFKhIgXmDe0MbAX
	F+DU2Cf5o2hhInY3MQ3hZmmrbZFUESnXVJmDZhKM06mEgFbdrEiEqpwiRt13v8GcNqWTqo0MMGJpd
	yfxJEV4Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGoB-000000088Uq-0ceC
	for ath11k@lists.infradead.org;
	Wed, 14 Aug 2024 16:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A35361AC4;
	Wed, 14 Aug 2024 16:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0464C116B1;
	Wed, 14 Aug 2024 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723652707;
	bh=cJRSwFOqxuezEsGgy/e+FJqSCUB8W3xhzbVyDljETsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XsVBxI9k899Lz7daCQj/WDuzJPncBsIxIYVJ75K/L3bPwx6rPKuwCEtZZYsN4QPRk
	 he8sk+mZ8JXvTNM0yDpL8joxIgHMQfsSmgqmz9CMHq5f61NWjXWyYXuqeI6ao6tA6h
	 v+XZ4gdYZf8J3UT5mqDaYdT5lkzif+w6AIrja85Rgt1Wx8aNpwdlUAlUJzmv4x4/UO
	 34If6PFWBusN6td85lAfZSZTWcmZ4iDCofs2Kp/etzZo8Bv9vnJRUKqdz6ErYPotyH
	 OnuSDhSrL6ARgoXVfkg2mD2t3hkdC4DerR1aAiDVLCRQD1czvmiNQ77CWd2l4QGfA3
	 BWm0SkvqSBbfw==
Date: Wed, 14 Aug 2024 17:25:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the
 inputs of the ath11k on WCN6855
Message-ID: <20240814-neatness-moistness-c485bcf5007e@spud>
References: <20240814082301.8091-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NyEsTL8PAnfJICw4"
Content-Disposition: inline
In-Reply-To: <20240814082301.8091-1-brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_172511_475046_4F8015F0 
X-CRM114-Status: UNSURE (   8.09  )
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


--NyEsTL8PAnfJICw4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 10:23:01AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Describe the inputs from the PMU of the ath11k module on WCN6855.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NyEsTL8PAnfJICw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrzaXQAKCRB4tDGHoIJi
0uxLAP9ONAVs6RzQfb19qS9fjD0Ee7V/e4+Btft57Kub8WDz6gD/UxYNZ+FvuY7A
TESI7gZAQkpCakphaJmyrhwMx+PSLwY=
=/aW6
-----END PGP SIGNATURE-----

--NyEsTL8PAnfJICw4--

