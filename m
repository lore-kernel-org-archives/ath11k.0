Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D78C79F82
	for <ath11k@archiver.kernel.org>; Tue,  8 Sep 2026 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okk/6UKvvJuFy0HfkixIG69h3/2z4AmE9S0HHh3WLco=; b=Fdbe9NELDvvWF0r4S0WQlZZ0x/
	1gSIcR9E7KpBSP6FFWx4qp07J8ECdtu9wWK1zYVQ8waiN5X6MfRXZfwlutqvzQegm8EtrTIRvoOrF
	e4o+pm3jhlpe82v6z8k9cAjFodPwOHXzQpWmpI7qQDSBlWrWMZCxp0fMO2APe5SgoTHAUAUtpD5Xs
	QJgczPs80/Oi8HS+AVFlpwftZZDsVnCcmWyc4pJ3QjpvRsterIjvgbe28j3lBh5xtKRommTL7Tp51
	726+aDazhCHoBWamnNSQ5Ebb44+RqbNnDbGLqXoAFkRirgJiaafNQskBLMHtd/K2Pmqe/miG1739H
	ey8x3WQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sNo-00000008ePi-09Wj;
	Tue, 08 Sep 2026 09:44:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sNn-00000008eP8-0mkO
	for ath11k@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=okk/6UKvvJuFy0HfkixIG69h3/2z4AmE9S0HHh3WLco=; b=l9E/fKpvjpBqo5bxo9f+k4T70u
	qumSsJZBqKcvc8PKEqRa91n2+T5OOGlkA5c4fTQBoggD1uAlqDhLXag+ktZIxf47/q2Glrwcy+MwZ
	LzMfaV6hcBrNqbnK83hX1xJu4+QhF6v8tOqdsglGmsDE82miBnaucs3oNU8ew+v+iulxifnr1UxQu
	UOlfbAJwEX6hluHHNitNqokAQPB16DjP8j8Ckw1jqa/TjbeoOZeYnW2HWysdvMlWeQ3d9QCriwwjT
	nZWd8NRj3lzMDAFvJFENcgDsZgDd7CXwwdqeHoG3KcJ+/cCseIb6q4Qf0rX4NmNAymPC9ANx3CxOF
	KfNUJgTQ==;
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sNj-0000000HDjM-39ZF
	for ath11k@lists.infradead.org;
	Tue, 08 Sep 2026 09:44:50 +0000
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfJtw5MtWz49Q5T;
	Tue, 08 Sep 2026 12:44:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788860681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okk/6UKvvJuFy0HfkixIG69h3/2z4AmE9S0HHh3WLco=;
	b=AkkoA4g+cdgtOntOBeCtgp7e5YEL5kCQnDqxmKvSZPwzZX4MLzi7IVLpez33Wjv8mA00Jb
	gLnRewcuvFht5TvhvCuHXijTWDGGOjUQLfUcoDxakJvUys+jnzGraBLCbiJKFXQNmBfeqV
	XaUYPpui2v4eiMYt0Ha7fdOoBM+BNFVjp8fJGs85jPh0LTxldvPufaAHfSGEc/z6CqNlo7
	gYfdSCBnBKgJdFbF28Dn9xqjdhuSqVPPcRnVez36oqeYH5pi+HqXnhY2PVmcIacEktPf77
	M9wEV6K6d/uYs541XGNjKBzl6ISUNlEkiqDAntfVdq+0V/DbJ6tc623pFGKxcQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788860681;
	b=cd7AyBRDueQ3jJ07ANj8QVqU/kQcA2cgPwWB+a1kMFB17+jff+jVogBR19z9cBvB3JLG5d
	IghYGue4kaEhJ0gHF5Le074jyFkZKUZbAzNdR/ZDW/2L5z4TGS7DJpjBNC2JCmJ8tghWJq
	/NzwsYKa1EJOCy0Fk++A04t3RxTk1FxpwVeErcjxnuVQRyAtRnKy7rctvOAmiqpn1tkA4h
	2+jtrhdXBmV8R+rYaAaKJbHuVSvEV5q++dKxKK8hq7iJgz9Y+MAqrcJcsGP5Ie+wFBrLny
	sdTRrtYdfuEKcwKg7CQhk/7v3bV0I6Rr46soi8kpDDj6NH31G57yBghjZZrVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788860681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=okk/6UKvvJuFy0HfkixIG69h3/2z4AmE9S0HHh3WLco=;
	b=nNypRlsdhiGVdeSHQ37mzYZAzZIc0jJKwjTR1/SRSPlUYWgarZeLvY1Ur0/lcfZ8q654ii
	keouWkEih2fcBl2ASgw/pU0lITT780nD1NinxsNAJ21yYS8+OngDOjKHQZcJRXzeOjNCLD
	fuYrEH18QUBbamuINv8V4nusbz7F5MOTZb3mQ5HJLmtzIMaNMOLujHC+QoOojwTChIV7kx
	jveuPjbs79ZmnM/QLOjsiI2kptslQplomSHzPGHnUuK12cStr2/BL/xzlju9GTwpE5gIPf
	MMJu/HD/tYBtWnV1E5N+G/jfKlpvD8nooc5lBYuJDBPS2U7BXWZLxaSC37ABfw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0D73E198003A;
	Tue,  8 Sep 2026 05:44:40 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 05:44:40 -0400
X-ME-Sender: <xms:Bdmfag0oJIPtIHdp15FNK_ZlFdN56u-GxgQtG_P6tcyg-IKQuxu50w>
    <xme:Bdmfal6P618KOufT0AatJ7zRE4WPse3oGZosgxLcXeX3xEYbamL5ACxj0a94aXzP6
    4rZ0G6g-gEzVQKHhwMpfThmMB0F4Q7zlK9rvH05npXZlKoMVGSFgeoE>
X-ME-Proxy-Cause: dmFkZTEQ6RAYbZbS6n2XZ91CCDVH1PswnGr8U2+3tuLiFTy4d1Bb10G7XCafM0ID5ejv1h
    UZXyfcVmyzTcL718ElzEntJLirWMZWQhFqPCw2ydLCRkreUBMw2X3HnoN+1F7JnndHR8zi
    Sp4ODtSghtSxRKi4Cg861W0s4zHP/rrBOdathqyDMBoI/8T7s8i7Sbxh3vHOGHKpO+cw7K
    kcvpmbSz0nr0H1WhIwf4idE53v9ZsBaHoldGedv2Gdl6cVY0ywUqLCFL7w588aYhy64fOv
    SArJG669zMjCkJOlbyfwleJPE+mp9+24JBGl4a/sLnqcR7NpKb6o2Jut9dnpzXgjBXBjN+
    ZbaBEggnrGmIsPujM9VgF9Oug0fw8KuqtdbLn7kzmkc3wPC30aIXgzv6OFPNklHY+Fypmc
    HqanJxDTY6vLsYHuUxlM0qgUcp8bR4T/88Lfcnfr0gPXfre+lJPGQ8bXt2GBrNuOOzKlZY
    hEgQQss4L2oBP+d9CNGZJXrTGm8/jCRjQ9nL6XpH1UqHyvNuhYZfC6kNuph0jCo944fk0r
    E7kl6dQ/ntbsfOL1i4biQAriVlCJgrKbCpMweYBxAaDPHEP+/r919UIhhC/IYmWg5unr14
    V1LF0wEfCTTYNlVAPB+LBTdH9H8+SQRHgOasCrb6mtNlINf1A5NIcjiy3zNQ
X-ME-Proxy: <xmx:CNmfakY1PnJ90UlsCm8XHJwYiV_5SHH34CS-GYqSCvPOjzxhjoKRzQ>
    <xmx:CNmfaoIuCvbPae8Iatr8AFQel9kzLtqBvQCF-9mZfNDKjANJ47Kwxw>
    <xmx:CNmfatq4lc6ZVy1cPfkC6DZ0N7p7rvggsllI4zSFJtQmgebEKIVsQw>
    <xmx:CNmfahAo5lASRNKEZmoX9AoEIxTZhw7W3mioKr96w7lbO0rA63w9fA>
    <xmx:CNmfajcudKS2cF_hGTgEqVcCI_OV8tv7zL1oiUTz9Nh6UtNVV37URmL0>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 71AD9F80083; Tue,  8 Sep 2026 05:44:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Av35K2MZ7qUg
Date: Tue, 08 Sep 2026 12:44:17 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 "Kalle Valo" <kvalo@kernel.org>, "Jeff Johnson" <jjohnson@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Mihai Moldovan" <ionic@ionic.de>, linux-wireless@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
In-Reply-To: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
Subject: Re: [PATCH v3 00/12] ath1{1,2}k: support multiple PCI devices in one system
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104448_279887_18DE3D57 
X-CRM114-Status: UNSURE (   7.22  )
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

On Tue, Sep 8, 2026, at 12:31, Juha-Matti Tilli wrote:
> As you may well know, multiple identical ath11k and ath12k devices are
> not supported in a single Linux host because they use conflicting QRTR
> node IDs. Fortunately, Denis Kenzior created a patchset to support
> multiple QRTR endpoints with identical node IDs, and Mihai Moldovan
> refined it, after which I took over the patchset and refined it more.

Hello,

I am incredibly sorry by messing up the threading. git-send-email said:

4.7.1 Error: too many recipients from 83.150.90.33

...and failed at the patch id 8/12.

So I thought retrying from where it failed would be safe. But that
broke the threading.

The next time, I'll increase the waiting time between subsequent mails.

Links to mails missed from the thread:

https://lore.kernel.org/all/20260908093437.2493698-1-juha-matti.tilli@iki.fi/
https://lore.kernel.org/all/20260908093437.2493698-2-juha-matti.tilli@iki.fi/
https://lore.kernel.org/all/20260908093437.2493698-3-juha-matti.tilli@iki.fi/
https://lore.kernel.org/all/20260908093437.2493698-4-juha-matti.tilli@iki.fi/
https://lore.kernel.org/all/20260908093437.2493698-5-juha-matti.tilli@iki.fi/

BR, Juha-Matti

