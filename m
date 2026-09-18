Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAFCC982D2
	for <ath11k@archiver.kernel.org>; Fri, 18 Sep 2026 06:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbGB/4hNeZUFNX6/pPlJdv0sQED8O6qK3gQGbfLFPKo=; b=lpTQItaRLeWJxaXska3IqEF1dW
	A/+8hgu1aj+lxaNtgLRZTjXeBRLesDMkHVGGmXCA6BVJ027fPoo3wuqghNTMxZOUO4HQMEavxKi5z
	JTmwgJOQzPhAum9Ve28lR0a6iiOfJyGldRf2Wx+g5J7TGqbQQ4L6hadD6bMmWTPWVNWyJbqZM7SEL
	sxVpQgpcKG138qUgdY4kLBgoHN+OakXZ79NCeddmOPh+Mhx1pxNRl+5FA/5RblYvw/J5fkMWz5Ufw
	fPeo1zQt4GFeW50Zi1gwujksuY8DjInKSWLCBlxMJ0Rjb58meuk/y3Xg8v44S+i8VAVH7ZAU7N5Ho
	zfd6IJlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7S3n-0000000DZMo-40g1;
	Fri, 18 Sep 2026 06:26:59 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7S3l-0000000DZLo-0ZAy
	for ath11k@lists.infradead.org;
	Fri, 18 Sep 2026 06:26:58 +0000
Received: from fauth-c1-smtp.messagingengine.com (fauth-c1-smtp.messagingengine.com [204.75.18.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hmN216ld9z49Q3t;
	Fri, 18 Sep 2026 09:26:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789712810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbGB/4hNeZUFNX6/pPlJdv0sQED8O6qK3gQGbfLFPKo=;
	b=EtD36l/zfEmUzxZS6akl1aci/5CgdkqcosNdYxf3qz7AnJIXazparbRx+TSqn54LS5L1SV
	/oWQAgT3Urc1VMZ3U9G5YLiwiY1xcJlln6mb2mne1G5Aos4GQ+wN3iX6xwzXo1GTwAKC4O
	JbWawgiSxS/E+Cev4sx1hNRO6N36uctkGNzOh2JXYwmMWIOy9iVjPZ8GQQVBd6Pigpmfgb
	5qeYQCiRrxAEOLubAcIa4v285Z9SA6Zdqv/CtfNgWcLJLF1EWSBPwh+xL57Q6u8Xu+WGxz
	LfHw2/HShIv/MdLo0HpTquBy396VDkg9Zy9/TsgAZvKD9e736UMJq9L4wKszdA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789712810;
	b=EBK1LCwv4Ct6Tdg/SGOpQVFqhYUg9xDRTiZjkGz//Y4fmOtgxNjgCN/F4zE3H8JqsWEuSB
	MxV58PBPrAJeIojeSsyekKkJMHAvnZKrXhCRVODIjIz/fiV/5CNp11M0eOxOH6hHk5Rh7D
	NYHs20t9mJ2O0hYrDy3mjc/2KHcZoFKOtzPZpD4dVUucWKVfbSlSiAfKULXfpGGE5cg6D6
	/QuJMyTbF4sXUJrcwjm91VhPSEqf91/KTlxx96AJoYffMwd+IObvvsudMmhoTyw911E703
	Obmw3j7VQE1KEWFBINuIhktOZ3pnqTwVK5I3CQRpDGUub/apaI5kwRBhbWNSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789712810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SbGB/4hNeZUFNX6/pPlJdv0sQED8O6qK3gQGbfLFPKo=;
	b=AtwzFY3275Eb2GaABkhTTHMvQu57UbZUCfEL/NYpdDNdDCBcvIK1/cCR30+zP3wNp+ifIv
	PriVco4ohXKNoZ76ybrQciZcVLoPc+OD9VSXGa9u94LB6QwtLEAsRKOYdkNS/dAfngPpqn
	WCS6mYgAD/PXnh8wvwELrcpN6wXnZ9+eiepJw+m1R15zUcecYyi1SMaqp5DTgR+8GCd3i2
	DTFTv9V7I/NDhfHIk/1ME+fyvzqOmvhJj8EtxG9j4pWxkPVu9+gUoJApkB9tY1izVfcl1P
	vaDSZEge3GWXUbWoUMZsj95tY9WVOZ8Acglx0DQ7kGTNebtz1ytOPvqMpMaIdQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A31C8198003A;
	Fri, 18 Sep 2026 02:26:48 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Fri, 18 Sep 2026 02:26:48 -0400
X-ME-Sender: <xms:pdmsahWJdmupBtcwACxHjr-e6uQgIh0-Y1wyAfksKZ9598zNAXIBNg>
    <xme:pdmsasYPjLGqkqre6F3h7PTmk-EbE80w96uH9LdwxMxHsyrwf1Fslrwcko9NVzGGM
    65-ryFnEKAvA5Qfh09EKW0FXBF8a3P_UJjxHPjAYVJrG5rm7Ndh-QYY>
X-ME-Proxy-Cause: dmFkZTFbGgTFyzr43rklC79WMROH2XMGgfTXx9kUipHZMopomzGpZPM3/OWscnMHveFvKL
    R8IddKqeOBIwxn0zXVt54zj/dE2h59NlPXjdcnHs2T+QA09up05hhLzn0p7k7DjFiwq6v2
    S4C6lWzDYrJwwEV+5FajmR712RM88E7UrJ2ngdpLy6/Ac0ILSZ2wPcHLjYu6fWPoxmqK8h
    qTgqrFmNiE+6lolgVqLAnT2zoQXC8Fh28XdzDCavOGyyBIxZs8J362URMiHzLJ7PBBrCbj
    jf7CH7mf1GC/LwtdV7wIhFFD9eYj/ek58uMz5AE6h9xyIG7K5yyLcbM/PfNoIqndAaSyWG
    97SsgZhI60ri6+0JjxG8OBtIVUbYwYxsw+xIvwe0yzsvrLbqWYZqiT9tgwyuibxFu+NM/A
    nLDyJspmmXH4Pf1YdKI6JLfm573MrZNG18zUftSBURUOkA+RDYtdJvLJyVOOVjBL34jwc4
    wm4ij2gtDgrh6izFrPXvb78JHXf3PF2rkfZbJCeXYv9ULfeVxQxk33NKu4/ohXsq2luPRi
    XpHUmfy3Z+Eec2DxMrDWIAptwq0MepuU/rzsVzICnw+FxZrgO4WqP6ZHMYXiLPgsrgLS0e
    XeZtpn7w7qxnCK0E4fu4jpdHMxacuMOdCIVRqB6YtPU8JxKDUx+qmLnh7ytQ
X-ME-Proxy: <xmx:qNmsaiL2T51LXhbS8udNAUIs5Rlw4Kk7jfadcPhQ_oUfZXl8anQjkQ>
    <xmx:qNmsarxfT0uT2HLBEq52irqQsqKrqtfIxAcooXUgIyeM_buikAnVeA>
    <xmx:qNmsamyQ4BBP29gNNi-pzXRYS5GOxQLdbyqX1ZI2J0ZfTv_ppyCnPQ>
    <xmx:qNmsat0sAIPIw_XWTdcaXQjsI42lXUd4LBWgcSiJXgfZ-IGf_C6UOw>
    <xmx:qNmsaoVEGL9yWvRgP115kx1g9TnPAY1y3CBsL-KtqO7h2dWL3OLoQAmX>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 73B87F80091; Fri, 18 Sep 2026 02:26:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2KHHV_FOEKJ
Date: Fri, 18 Sep 2026 09:26:24 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "Jeff Johnson" <jjohnson@kernel.org>
Cc: "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Eric Dumazet" <edumazet@google.com>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Willem de Bruijn" <willemb@google.com>,
 "David S . Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>,
 "Simon Horman" <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 "Mihai Moldovan" <ionic@ionic.de>, "Denis Kenzior" <denkenz@gmail.com>
Message-Id: <98cc01fd-0df0-46ee-b27f-2556a577a5a5@app.fastmail.com>
In-Reply-To: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
References: <20260915074135.2567411-1-juha-matti.tilli@iki.fi>
Subject: Re: [PATCH v4 00/12] ath1{1,2}k: support multiple PCI devices in one system
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_232657_330483_827F71E5 
X-CRM114-Status: GOOD (  11.43  )
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

On Tue, Sep 15, 2026, at 10:41, Juha-Matti Tilli wrote:
> Hello,
> 
> As you may well know, multiple identical ath11k and ath12k devices are
> not supported in a single Linux host because they use conflicting QRTR
> node IDs. Fortunately, Denis Kenzior created a patchset to support
> multiple QRTR endpoints with identical node IDs, and Mihai Moldovan
> refined it, after which I took over the patchset and refined it more.
> 
> Mihai Moldovan also created a patchset for actually adding the support
> for this QRTR multi-endpoint feature to ath11k and ath12k drivers.
> Unfortunately, the code of Mihai was not merge-quality, since it leaked
> memory if you ran rmmod and modprobe inside a loop. Mihai mentioned this
> drawback, without providing an API for deleting endpoints or usage of
> such API in code that's responsible for freeing resources. Also Mihai's
> patchset had a race condition.

Hello,

Some positive news. There will be no next version, as Qualcomm is going
to provide a superior patchset that I tested. It's easier to backport,
cleaner design, fewer lines changed, has 1 author as opposed to 3, and
most importantly, it worked just fine on my 2x card setup. 

Thus, I'm going to abandon this patchset.

BR, Juha-Matti

