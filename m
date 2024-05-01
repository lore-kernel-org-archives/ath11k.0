Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C85C4345F
	for <ath11k@archiver.kernel.org>; Wed,  1 May 2024 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:To:From:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3EVg1OxyppckhqVYSHMLdE4vnm/giwa/affZ1796ek8=; b=QZTcKr6mb7Vu2BDt1kr1vacSIk
	SzasPm3WFg2UJyqPZKpdnFfwE327DRDOEOet7OhH9qwrQsya/5wSdd8Gh/ptjHIYFkWJm9KTbWLn0
	mMSyel3wm73N7qufscHwzj62pEOtcMHKX82WTLzhF4wk02aX6AsWNykkka1SqMJAYrweN2TUhHbDn
	rNLav3+h/WTXOpoZvz4WS9EA2n1W94FZiUSQ97txT8x0DEWNbCcpQEcPWX9nBc4ZuCNhU17daIkNf
	o6FZH/3o4f4xo4Qy694zgXY1KkUMgmakQQ4cTgUpngpvmxpDNT+2LOigOZYxGQ/eWVWmTUkcNip13
	KAdKMEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Cfo-0000000A74t-3cgH;
	Wed, 01 May 2024 16:19:12 +0000
Received: from [137.220.233.87] (helo=mail0.eut781.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Cfk-0000000A73b-0Qtj
	for ath11k@lists.infradead.org;
	Wed, 01 May 2024 16:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=eut781.com;
 h=Message-ID:From:To:Subject:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=no-reply@eut781.com;
 bh=3EVg1OxyppckhqVYSHMLdE4vnm/giwa/affZ1796ek8=;
 b=AkkOmonRb/8CsihAW4uB2wU0PSw1HdO8RIU7WAnhZ1nnLsZFZn7rfM+IoHtRSixLh2VA9wRXumgZ
   /Qgq0qU7bLZMYiqyAfChU/ODYN9haQfUGrIlat6oN5WIwh3kwYUjq7LIpWwq4a1WqZeiZIHjagzY
   FWxb5m2Ztfhutg5EIHg=
Message-ID: <ffca8b3a267a2730930961a0165eea5d@eut781.com>
From: =?utf-8?B?6Ieq5YuV44Oh44O844Or6YCB5L+h?= <no-reply@eut781.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: =?utf-8?B?44CQ5LiJ5LqV5L2P5Y+LIOOCq+ODvOODieOAkSDjgYrmlK8=?=
	=?utf-8?B?5omV44GE5LqI5a6a6YeR6aGN44Gu44GU5qGI5YaF?=
Date: Thu, 02 May 2024 00:08:40 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_091909_187581_5257C358 
X-CRM114-Status: UNSURE (  -0.05  )
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

5LiJIOS6lSDkvY8g5Y+LIOOCqyDjg7wg44OJ44KS44GU5Yip55So44Gu44GK5a6i5qeY44G4DQoN
CuOBk+OBruOBn+OBs+OBr+S4iSDkupUg5L2PIOWPiyDjgqsg44O8IOODieOCkuOBlOWIqeeUqOOB
hOOBn+OBoOOBjeOAgeiqoOOBq+OBguOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAgg0K5LiL
6KiY44Gu44GU5Yip55So54Wn5Lya44GM44GU44GW44GE44G+44GX44Gf44Gu44Gn44CB44GK55+l
44KJ44Gb44GE44Gf44GX44G+44GZ44CCDQoNCuKAu+acrOODoeODvOODq+OBr+OAgeOBlOWIqeeU
qOODu+iri+axguOCkueiuuWumuOBmeOCi+OCguOBruOBp+OBr+OBguOCiuOBvuOBm+OCk+OAgg0K
44GU5Yip55So5pel5pmC77yaMjAyNCAvIDA1IC8gMDEgICAgICAyMyA6IDE4DQrjgZTliKnnlKjl
oLTmiYDvvJrjgrvjg5bjg7Mt44Kk44Os44OW44OzIOWNg+S7o+eUsOS4gOODhOapiyAxIOS4geeb
ruW6lw0K44GU5Yip55So6YeR6aGN77yaOSwgNTgw5YaGDQoNCuOCq+ODvOODieOCkuS9v+eUqOOB
l+OBn+immuOBiOOBjOOBquOBhOWgtOWQiOOBr+OAgeS7peS4iyDjga4g44OqIOODsyDjgq8g44KS
44Kv44OqIOODgyDjgq8g44GXIOOBpuOCqyDjg7wg44OJ5L2/55So44Gu6Kmz57Sw44KS56K66KqN
44GX44Gm44GP44Gg44GV44GE44CCDQpodHRwczovL2RvbnMtamlncy5jb20NCg0K77yc44GU5rOo
5oSP54K577yeDQrigLvvvJHvvI7mnKzjgrXjg7zjg5Pjgrnjga/jgIHjgYrlrqLmp5jjga7kuIkg
5LqVIOS9jyDlj4sg44KrIOODvCDjg4njga7jgZTliKnnlKjnhafkvJrjgYzooYzjgo/jgozjgZ/l
oLTlkIjjgIENCuS4iSDkupUg5L2PIOWPiyBORVTjgavjgZTnmbvpjLLjgYTjgZ/jgaDjgYTjgabj
gYTjgovjg6Hjg7zjg6vjgqLjg4njg6zjgrnjgbjjgYrnn6XjgonjgZvjgZnjgovjgrXjg7zjg5Pj
grnjgafjgZnjgIINCuKAu++8ku+8juOBlOWlkee0hOOCreODo+ODs+OCu+ODq+OBqOOBquOBo+OB
n+WgtOWQiOOBruOBiuWPlua2iOOBl+aDheWgseOBr+mFjeS/oeOBleOCjOOBvuOBm+OCk+OAgg0K
4oC777yT77yO5LiJIOS6lSDkvY8g5Y+LIFZpc2Hjg5fjg6rjg5rjgqTjg4njgqvjg7zjg4nlj4rj
gbPkuInkupXkvY/lj4vjg5Djg7zjg4Hjg6Pjg6vjgqsg44O8IOODieOBruOBlOWIqeeUqOWIhuOC
guWQq+OBv+OBvuOBmeOAgg0K4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU
4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCU4oCUDQrilqDnmbog6KGMIOiAheKWoA0K5LiJIOS6lSDk
vY8g5Y+LIOOCqyDjg7wg44OJ5qCq5byP5Lya56S+DQrjgJIxMzUtMDA2MQ0K5p2x5Lqs6YO95rGf
5p2x5Yy66LGK5rSyMuS4geebrjLnlaozMQ==


