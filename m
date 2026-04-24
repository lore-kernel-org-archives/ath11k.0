Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B398AFED3D0
	for <ath11k@archiver.kernel.org>; Fri, 24 Apr 2026 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ifnuh73riQo8tGZfAnsdE17QTjWMPIDxYapxrOESda0=; b=20DQmyVmi9gAIghczLZx84eKi8
	/4tYfQvC21beCcWgeB3mZhN3Qa+B+upRDY1AhxDEE5DQEcNqV4rIfvPPcIvfRaUgD37MbD2j6EtDR
	2ePf1ORt8pjJNDz9BB3Wc5fVzUFIt73lYhdAyfCdv149hdbS9ztbh22vlXxcZMpyYtCtx7zmHmGwU
	85doFTX//QYDBNytkG04Ggpe1Pr2nq1Z0AjP89hERpa5FUeVXCuFLvUBREPFOQA2jJyKNvYjICxTS
	n3sL9ck+mjXVZt9oB7WD9gAoALlcGnPKQZb1fS8IBdOKWrwNqnIlJOBC0X5OeagaKToI0E17xATn/
	o6bVTchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHIu-0000000DIV5-41eK;
	Fri, 24 Apr 2026 14:14:48 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHIr-0000000DIU2-3Eh1
	for ath11k@lists.infradead.org;
	Fri, 24 Apr 2026 14:14:47 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1F95014000B0;
	Fri, 24 Apr 2026 10:14:42 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Fri, 24 Apr 2026 10:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1777040082;
	 x=1777126482; bh=Ifnuh73riQo8tGZfAnsdE17QTjWMPIDxYapxrOESda0=; b=
	KYiQDz40A9fSnVFcvOv0HNSRroU5QPfj8quQ2Vn3QL7v1wTC7Ch21Nc+lW99WwES
	uMRcQyTVoEb/p/ZHz4D6XdcQhhtQdF00v8LsGs8zpc9jaQLarMig+KfxLfAGTlRd
	5zcVKl2I/vdiatAvyWWeY88euVhWzx+rbSRTs183Hwdbib6k6ITOyf/1r0M4EruV
	iSSJ/SL3JWDdODIICfKndOvFAXzDIJ7kgdartwmpChZkzb2HelLoHIzKrr/n1Lw+
	rEBoB/aQaioddyyui+vUIYx6h0NUPdGSnG+sAuJl8gi7MMb014+KokTcTtJbaZYy
	yDxtwqqACOxaZrgvJjJtYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777040082; x=
	1777126482; bh=Ifnuh73riQo8tGZfAnsdE17QTjWMPIDxYapxrOESda0=; b=n
	opZRL20QK365pYIa2y7pk0uM9hhTGCFrVXInx7RqnfvP6ALnUkI80JCCoa51Ed6Y
	odQ3IL7G9XoHQzuodjWK34hTJnJNryOfCaxt2OCGbCqxsv/Ghro4VrDPs/HTUAoF
	8txZUiVB7Zbkk0wGxrjUBNhFFr08mVb6GinR7SRYWNLvkGrFIoh5PlJky2RLFVZk
	QuBqzNeeCsdNqW/jp+nVAUNHnShE8BgbBS/nVMdaz2zivjw+QaFRjFzGf1chFfKc
	JEMIHkdOij3a8rO/cghI2oiK7956PZ7f4RGkkClyxRcDXQu3GOUjjPXeaKoMUQwT
	c+YUiC8SuEIPY6OIMrT6w==
X-ME-Sender: <xms:0XrraTqe8XNRs-ycOmRiQ9LB9NkERNOGRZUQaD6HCnI0Lo6LFlvU_g>
    <xme:0XrraYdOD3fkBGhgXeqUT7vZ3kFoWaUfS7PDVLRvo2VoNBaT-fYp5H8BDWV-8CP3q
    NmWFWJWsqA0BX0SoOcaZtH77SHaAp-7kCV2nU5tRHN96hyj43xPylc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejtddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhepgedvgeeufffhtdeliefgjefhgffgiedvjeegleeujeeu
    tdduteehjeduhedtiedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehkfhgrrhhnuhhnghesghhmrghilhdrtghomhdprhgt
    phhtthhopehkohhikhgvsehighgrlhhirgdrtghomhdprhgtphhtthhopehjjhhohhhnsh
    honheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghthhduudhksehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepkhhfrghrnhhunhhgsehouhhtlhhooh
    hkrdgtohhmpdhrtghpthhtohepshgrnhhtihgrghhorhhrsehrihhsvghuphdrnhgvthdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:0Xrraabbi4kq77MdKzQrRef6LHAgxMbQvnTL2PDrbka567AxmUR50g>
    <xmx:0Xrraf-Jn9vsAu57-uTWyASi1a87sBe4T20YWyWw8dKH4M7Vvrh2HQ>
    <xmx:0XrraYmwGrnPiyc1DXGBT4x9BpZDbQIfmnECkFSvZtFII1oksR_SDw>
    <xmx:0Xrracz10GQt3G9atzlirQwG-PvnDGcgpduHI2r8P_vDosKN4-imDQ>
    <xmx:0nrraWimNfB5pOKR7ww-4XsJfoVreqVyRU4ohJ5Y54BMVALQ71I3ApYa>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8DD852CE3F93; Fri, 24 Apr 2026 10:14:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AmUhnMeJVjIs
Date: Fri, 24 Apr 2026 10:14:21 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kyle Farnung" <kfarnung@outlook.com>,
 =?UTF-8?Q?Santiago_Ruano_Rinc=C3=B3n?= <santiagorr@riseup.net>,
 "Jeff Johnson" <jjohnson@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "koike@igalia.com" <koike@igalia.com>, "Kyle Farnung" <kfarnung@gmail.com>
Message-Id: <c3e0eff6-afa6-4054-9a37-fa3943442657@app.fastmail.com>
In-Reply-To: <IA2P223MB1199153665E2AFF709BD2F52D02B2@IA2P223MB1199.NAMP223.PROD.OUTLOOK.COM>
References: <20260423211458.458911-1-santiagorr@riseup.net>
 <IA2P223MB1199153665E2AFF709BD2F52D02B2@IA2P223MB1199.NAMP223.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] wifi: ath11k: Add two missing Lenovo IDs to the quirk table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_071446_134314_31EFCEF1 
X-CRM114-Status: UNSURE (   8.15  )
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


On Thu, Apr 23, 2026, at 10:07 PM, Kyle Farnung wrote:
>>=20
>>=20
>>=20
>> ________________________________________
>> From: Santiago Ruano Rinc=C3=B3n <santiagorr@riseup.net>
>> Sent: Thursday, April 23, 2026 2:14 PM
>> To: Jeff Johnson; linux-wireless@vger.kernel.org; ath11k@lists.infrad=
ead.org; linux-kernel@vger.kernel.org
>> Cc: Mark Pearson; kfarnung@outlook.com; koike@igalia.com
>> Subject: [PATCH] wifi: ath11k: Add two missing Lenovo IDs to the quir=
k table
>>=20
>> Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for qui=
rk
>> table") added some Lenovo platform IDs to the quirk table to address a
>> wakeup from suspend issue [1].  However, at least two more platform ID
>> are missing in that table: P14s Gen 5 AMD, as reported by Kyle Farnun=
g [2]
>> and P14s Gen 3 AMD.  This commit adds one ID for each.
>>=20
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196
>> [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196#c23
>>=20
>> Tested-on: P14s G3 AMD.
>
> Lenovo products have a pair of IDs, you'll want 21J6 [3] and 21MF [4] =
as
> well. I submitted a patch myself [5], but I've been investigating anot=
her
> symptom.
>

Thanks - you beat me to it.
Confirmed that you'll want to add those two.

Mark

