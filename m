Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C893FEB64D7
	for <ath11k@archiver.kernel.org>; Fri, 16 Jun 2023 07:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YRbVXJcJmfr3Lteg7ecMC4xI36LNUCutLciUrefVtd0=; b=pJONTB46EjJPAO
	57eIP62j221L34rYZjfAnwj6kZtEeuDRxiHAHqAv7HNl6+t7HpsbfjjcNJnxIqTlyJS2bYiaPugnY
	PixUWe26tJLNkKUg4vH8yA9dNb34YOQUGh17tsz0l/tkM8/4Aq2R0MDeTCxiXJwYGwfTaaxuBWurd
	pnB1j4fM1lTZBjZR2vZNnCYwQRF8mTuKV36I41MyIjL+kbcb5OYlrmVwmfP3YFDj1Mnu+tMazBoXY
	nUiQP5AGMxojbbv7Noc34shCIlPqqCByjC7RxWA7fNXXduhJke5a4TkGp7MpJ4W67oBg3GPLEWwbv
	HLmxEX0IurG1qI+aJBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4E1-00HC96-04;
	Fri, 16 Jun 2023 07:50:29 +0000
Received: from mail.severnusk.pl ([89.40.115.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4Dx-00HC7X-0k
	for ath11k@lists.infradead.org;
	Fri, 16 Jun 2023 07:50:27 +0000
Received: by mail.severnusk.pl (Postfix, from userid 1002)
	id C98F682AD5; Fri, 16 Jun 2023 09:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=severnusk.pl; s=mail;
	t=1686901817; bh=+EeLr85ZLPomICoBd9HkRfsh6EPM8XdZbVfrMzFBjC8=;
	h=Date:From:To:Subject:From;
	b=nW8JucK3Jcp1odbzIhHEXlOMzVXKzjxZbhXjvSVG3SbEMYFhs8bwY/CT7Pi94lqcR
	 daPko62cwd9PJNcYpwj5J+xNaeOLkcULuW2VQbvULTkMrtRXH1kWGGl+o6JziEvf+n
	 7xzasKY4CvS/ykBihaWB6EvPuBK50aQBn2tzZsPxh0iiNgOG+IU0nb1rJC+BXsrRIv
	 TIaDDUMSq72p92b4Ims1LuebIFMjOZXvmgCr8NqOK1ObsE9z+1ZbLEo6QcIFZPo+0y
	 n12E/lESPBy3iRqdjwCEqgt2Y8kBTQPGadwNC0F7Zlrb+gdpsVs3zW5w49yE/pMoyE
	 eRMl57fsiMMAQ==
Received: by mail.severnusk.pl for <ath11k@lists.infradead.org>; Fri, 16 Jun 2023 07:50:04 GMT
Message-ID: <20230616084500-0.1.1a.26op.0.logmxkl8am@severnusk.pl>
Date: Fri, 16 Jun 2023 07:50:04 GMT
From: "Tomasz Wereszko" <tomasz.wereszko@severnusk.pl>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Przyznanie_=C5=9Brodk=C3=B3w_na_rozw=C3=B3j_firmy?=
X-Mailer: mail.severnusk.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_005026_026510_6F729358 
X-CRM114-Status: UNSURE (  -0.28  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

U3phbm93bmkgUGHFhHN0d28sCgpjenkgY2hjaWVsaWJ5IFBhxYRzdHdvIHNrb3J6eXN0YcSHIHog
ZG9maW5hbnNvd2FuaWEgbmEgemFta25pxJl0ZSBzemtvbGVuaWUsIGRvcGFzb3dhbmUgZG8gUGHF
hHN0d2EgcG90cnplYiByb3p3b2pvd3ljaD8KCkpha28gbGlkZXIgdyBwb3p5c2tpd2FuaXUgxZty
b2Rrw7N3IHpld27EmXRyem55Y2ggZmluYW5zdWrEhWN5Y2ggcm96d8OzaiBwcnplZHNpxJliaW9y
c3R3IG1vxbxlbXkgcG9tw7NjIFBhxYRzdHd1IG9ibmnFvHnEhyBrb3N6dHkgaW53ZXN0eWNqaSB3
IHJvenfDs2ogcHJhY293bmlrw7N3IG5hd2V0IG8gODAlLgoKT3JnYW5penVqZW15IHN6a29sZW5p
YSB3IGZvcm1pZSBzdGFjam9uYXJuZWogaSB6ZGFsbmVqIGRvcGFzb3dhbmUgZG8gcG90cnplYiBp
IGtvbmtyZXRueWNoIHd5endhxYQgdyBvcmdhbml6YWNqaS4gT2QgMjAgbGF0IHphcGV3bmlhbXkg
c3BlcnNvbmFsaXpvd2FuZSByb3p3acSFemFuaWEsIHoga3TDs3J5Y2ggc2tvcnp5c3RhxYJvIGJs
aXNrbyA0LDYwMCB1Y3plc3RuaWvDs3cuCgpQcm9zesSZIG8gaW5mb3JtYWNqxJkgY3p5IG1vxbxl
bXkgdW3Ds3dpxIcgc2nEmSBuYSBzcG90a2FuaWUgbHViIGtyw7N0a8SFIHJvem1vd8SZLgoKClBv
emRyYXdpYW0KVG9tYXN6IFdlcmVzemtvCgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDExawo=
